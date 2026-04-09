import Foundation

// MARK: - ProgressTracker
// Stores daily XP snapshots per user so we can show analytics over time.

final class ProgressTracker {
    static let shared = ProgressTracker()
    private init() { load() }

    struct Snapshot: Codable {
        let date: String   // "yyyy-MM-dd"
        let xp: Int
        let level: Int
        let quests: Int
    }

    private var snapshotsByUser: [String: [Snapshot]] = [:]

    // MARK: - Record

    func recordSnapshot() {
        guard let user = Session.shared.currentUser else { return }
        let username = user.username
        let today = Self.dateStr(Date())
        var list = snapshotsByUser[username] ?? []
        list.removeAll { $0.date == today }
        list.append(Snapshot(
            date: today,
            xp: user.xp,
            level: user.level,
            quests: UserDefaults.standard.integer(forKey: "total_quests_completed")
        ))
        list.sort { $0.date < $1.date }
        if list.count > 60 { list = Array(list.suffix(60)) }
        snapshotsByUser[username] = list
        save()
    }

    // MARK: - Query

    func dailyXPEarned(days: Int) -> [(label: String, xp: Int)] {
        let username = Session.shared.currentUser?.username ?? ""
        let list = snapshotsByUser[username] ?? []
        let cal = Calendar.current
        return (0..<days).reversed().map { offset in
            let date     = cal.date(byAdding: .day, value: -offset, to: Date())!
            let prevDate = cal.date(byAdding: .day, value: -(offset + 1), to: Date())!
            let todayStr = Self.dateStr(date)
            let prevStr  = Self.dateStr(prevDate)
            let todayXP  = list.last { $0.date == todayStr }?.xp
            let prevXP   = list.last { $0.date <= prevStr }?.xp
            var earned = 0
            if let t = todayXP, let p = prevXP { earned = max(0, t - p) }
            let f = DateFormatter(); f.dateFormat = "d/M"
            return (f.string(from: date), earned)
        }
    }

    func snapshotDaysAgo(_ days: Int) -> Snapshot? {
        let username = Session.shared.currentUser?.username ?? ""
        let list = snapshotsByUser[username] ?? []
        let cutoff = Calendar.current.date(byAdding: .day, value: -days, to: Date())!
        return list.filter { $0.date <= Self.dateStr(cutoff) }.last
    }

    func totalXPEarnedInDays(_ days: Int) -> Int {
        let current = Session.shared.currentUser?.xp ?? 0
        let old     = snapshotDaysAgo(days)?.xp ?? current
        return max(0, current - old)
    }

    func averageDailyXP(days: Int) -> Int {
        let values = dailyXPEarned(days: days).map { $0.xp }.filter { $0 > 0 }
        guard !values.isEmpty else { return 0 }
        return values.reduce(0, +) / values.count
    }

    func activeDays(days: Int) -> Int {
        dailyXPEarned(days: days).filter { $0.xp > 0 }.count
    }

    // MARK: - Persistence

    private var storageKey: String { "pt_snapshots_v2" }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([String: [Snapshot]].self, from: data)
        else { return }
        snapshotsByUser = decoded
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(snapshotsByUser) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    // MARK: - Helpers

    static func dateStr(_ date: Date) -> String {
        let f = DateFormatter(); f.dateFormat = "yyyy-MM-dd"
        return f.string(from: date)
    }
}
