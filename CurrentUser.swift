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
