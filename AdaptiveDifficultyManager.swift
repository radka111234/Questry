import Foundation

/// Tracks per-subject correct/incorrect ratios and provides a difficulty tier
/// that puzzle VCs can use to select easier or harder question sets.
///
/// Tiers:  0 = Easy (< 40% correct)
///         1 = Medium (40–74%)
///         2 = Hard (≥ 75%)
final class AdaptiveDifficultyManager {
    static let shared = AdaptiveDifficultyManager()
    private init() { load() }

    // MARK: - Data model

    private struct SubjectStats: Codable {
        var correct: Int = 0
        var total:   Int = 0

        var accuracy: Double {
            total == 0 ? 0.5 : Double(correct) / Double(total)
        }
    }

    private var stats: [String: SubjectStats] = [:]

    private var storageKey: String {
        "adm_stats_\(Session.shared.currentUser?.username ?? "guest")"
    }

    // MARK: - Public API

    /// Difficulty tier for a subject (0 Easy, 1 Medium, 2 Hard).
    func difficulty(for subject: String) -> Int {
        let acc = stats[subject]?.accuracy ?? 0.5
        switch acc {
        case ..<0.40: return 0   // struggling — easy
        case ..<0.75: return 1   // doing OK — medium
        default:      return 2   // excelling — hard
        }
    }

    /// Human-readable label for the current tier.
    func difficultyLabel(for subject: String) -> String {
        switch difficulty(for: subject) {
        case 0: return "⭐ Easy"
        case 1: return "⭐⭐ Medium"
        default: return "⭐⭐⭐ Hard"
        }
    }

    /// Record one answer result.
    func recordResult(subject: String, correct: Bool) {
        var s = stats[subject] ?? SubjectStats()
        if correct { s.correct += 1 }
        s.total += 1
        // Rolling window — cap total at 50 so old data fades out
        if s.total > 50 {
            let ratio = s.accuracy
            s.total   = 40
            s.correct = Int(ratio * 40)
        }
        stats[subject] = s
        save()
    }

    /// Accuracy percentage (0–100) for a subject.
    func accuracy(for subject: String) -> Int {
        Int((stats[subject]?.accuracy ?? 0) * 100)
    }

    /// Reload from storage (call after login).
    func reloadForCurrentUser() { load() }

    // MARK: - Persistence

    private func save() {
        guard let data = try? JSONEncoder().encode(stats) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([String: SubjectStats].self, from: data)
        else { return }
        stats = decoded
    }
}
