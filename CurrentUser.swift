import UIKit

extension Notification.Name {
    static let didLevelUp = Notification.Name("questry.didLevelUp")
}

struct CurrentUser {
    let username: String
    let avatarIndex: Int
    var level: Int
    var xp: Int
    var age: Int
}

final class Session {
    static let shared = Session()
    private init() {}

    var currentUser: CurrentUser?

    // MARK: - UserDefaults persistence keys
    private enum Key {
        static let username    = "session_username"
        static let avatarIndex = "session_avatarIndex"
        static let level       = "session_level"
        static let xp          = "session_xp"
        static let age         = "session_age"
    }

    /// Save the current session to UserDefaults so it survives app restarts.
    /// XP and level are stored per-username so they survive logout and re-login.
    func save() {
        guard let user = currentUser else { return }
        let d = UserDefaults.standard
        d.set(user.username,    forKey: Key.username)
        d.set(user.avatarIndex, forKey: Key.avatarIndex)
        d.set(user.age,         forKey: Key.age)
        // Per-user keys — survive logout so fallback works on re-login
        d.set(user.xp,   forKey: "session_xp_\(user.username)")
        d.set(user.level, forKey: "session_level_\(user.username)")
    }

    /// Restore session from UserDefaults on app launch. Returns true if successful.
    @discardableResult
    func restoreFromDefaults() -> Bool {
        let d = UserDefaults.standard
        guard let username = d.string(forKey: Key.username), !username.isEmpty else { return false }
        let xp    = d.integer(forKey: "session_xp_\(username)")
        let level = d.integer(forKey: "session_level_\(username)")
        currentUser = CurrentUser(
            username:    username,
            avatarIndex: d.integer(forKey: Key.avatarIndex),
            level:       max(1, level),
            xp:          max(0, xp),
            age:         d.integer(forKey: Key.age)
        )
        return true
    }

    /// Add XP to the in-memory session, recalculate level, and sync to Supabase.
    /// If the XP booster item is owned, the amount is doubled.
    /// Posts `.didLevelUp` notification when the level increases.
    func addXP(_ amount: Int) {
        guard var user = currentUser else { return }
        let boosted = UserDefaults.standard.bool(forKey: "item_xp_booster") ? amount * 2 : amount
        let oldLevel = user.level
        user.xp += boosted
        user.level = max(1, (user.xp / 500) + 1)
        currentUser = user
        save()  // persist locally immediately

        if user.level > oldLevel {
            NotificationCenter.default.post(
                name: .didLevelUp,
                object: nil,
                userInfo: ["newLevel": user.level]
            )
        }

        SupabaseManager.shared.updateProgress(
            username: user.username,
            xp: user.xp,
            level: user.level,
            completion: { success in
                print("XP sync:", success ? "✓" : "✗", "xp=\(user.xp) level=\(user.level)")
            }
        )
    }

    /// Subtract XP (for shop purchases). Returns true if successful (had enough XP).
    @discardableResult
    func spendXP(_ amount: Int) -> Bool {
        guard var user = currentUser else { return false }
        guard user.xp >= amount else { return false }
        user.xp -= amount
        user.level = max(1, (user.xp / 500) + 1)
        currentUser = user
        save()  // persist locally immediately
        SupabaseManager.shared.updateProgress(
            username: user.username,
            xp: user.xp,
            level: user.level,
            completion: { success in
                print("spendXP sync:", success ? "✓" : "✗", "xp=\(user.xp)")
            }
        )
        return true
    }
}
