import Foundation

/// Tracks how many consecutive days the user has played.
final class StreakManager {

    static let shared = StreakManager()
    private init() {}

    private let streakCountKey = "math_streak_count"
    private let lastPlayDateKey = "math_streak_last_date"

    /// The current streak length (number of consecutive days played).
    var currentStreak: Int {
        UserDefaults.standard.integer(forKey: streakCountKey)
    }

    /// Call this whenever the user completes a quest or exam.
    func recordPlay() {
        let today = Calendar.current.startOfDay(for: Date())
        let defaults = UserDefaults.standard

        if let lastDate = defaults.object(forKey: lastPlayDateKey) as? Date {
            let lastDay = Calendar.current.startOfDay(for: lastDate)
            let daysDiff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0

            switch daysDiff {
            case 0:
                // Already recorded today  -  do nothing
                return
            case 1:
                // Consecutive day  -  extend streak
                defaults.set(currentStreak + 1, forKey: streakCountKey)
            default:
                // Gap  -  reset streak to 1
                defaults.set(1, forKey: streakCountKey)
            }
        } else {
            // First time ever
            defaults.set(1, forKey: streakCountKey)
        }

        defaults.set(today, forKey: lastPlayDateKey)
    }
}
