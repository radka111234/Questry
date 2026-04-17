import Foundation

enum AuthState {
    private static let key = "isLoggedIn"

    static var isLoggedIn: Bool {
        get { UserDefaults.standard.bool(forKey: key) }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }

    static func logout() {
        isLoggedIn = false
    }
}

// MARK: - AccountSwitcher
/// Saves and restores per-user progress in UserDefaults when switching accounts.
/// All game progress lives under global keys (e.g. "math_completed_topic_ids").
/// On login we snapshot those keys under "user_<name>_prog_<key>" and restore
/// the new user's saved snapshot, so each account has fully isolated progress.
enum AccountSwitcher {

    static let progressKeys: [String] = [
        "math_world_total_xp", "eng_world_total_xp", "geo_world_total_xp",
        "sci_world_total_xp",  "his_world_total_xp",
        "math_completed_topic_ids", "eng_completed_topic_ids", "geo_completed_topic_ids",
        "sci_completed_topic_ids",  "his_completed_topic_ids",
        "math_current_topic", "eng_current_topic", "geo_current_topic",
        "sci_current_topic",  "his_current_topic",
        "math_practice_unlocked_quest", "eng_practice_unlocked_quest",
        "geo_practice_unlocked_quest",  "sci_practice_unlocked_quest",
        "his_practice_unlocked_quest",
        "math_practice_completed_quests", "eng_practice_completed_quests",
        "geo_practice_completed_quests",  "sci_practice_completed_quests",
        "his_practice_completed_quests",
        "math_diagnostic_done", "eng_diagnostic_done", "geo_diagnostic_done",
        "sci_diagnostic_done",  "his_diagnostic_done",
        "math_start_topic",     "eng_start_topic",     "geo_start_topic",
        "sci_start_topic",      "his_start_topic",
        "total_quests_completed",
        "alchemy_discovered_ids",
        "selected_avatar_name",
        "pt_snapshots_v2",
        "eng_teaching_language_chosen",
        "eng_teaching_language",
    ]

    private static let activeUsernameKey = "account_switcher_active_username"

    static var activeUsername: String? {
        get { UserDefaults.standard.string(forKey: activeUsernameKey) }
        set { UserDefaults.standard.set(newValue, forKey: activeUsernameKey) }
    }

    /// Call right after successful login. Saves the previous user's data and
    /// loads the new user's data into the global keys.
    static func switchToUser(_ newUsername: String) {
        let d = UserDefaults.standard
        let prev = activeUsername

        guard prev != newUsername else {
            activeUsername = newUsername
            return
        }

        // 1. Save previous user's global keys under their namespace
        if let prev = prev, !prev.isEmpty {
            for key in progressKeys {
                if let val = d.object(forKey: key) {
                    d.set(val, forKey: "user_\(prev)_prog_\(key)")
                } else {
                    d.removeObject(forKey: "user_\(prev)_prog_\(key)")
                }
            }
        }

        // 2. Clear global keys so the new user starts from a clean state
        for key in progressKeys {
            d.removeObject(forKey: key)
        }

        // 3. Restore the new user's previously saved data (if any)
        for key in progressKeys {
            if let val = d.object(forKey: "user_\(newUsername)_prog_\(key)") {
                d.set(val, forKey: key)
            }
        }

        activeUsername = newUsername
        d.synchronize()
    }
}
