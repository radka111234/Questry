import Foundation

/// Tracks pairs that the player answered incorrectly and surfaces them
/// as a "Review Mode" so they get a second chance to master the material.
final class SpacedRepetitionManager {
    static let shared = SpacedRepetitionManager()
    private init() { load() }

    // MARK: - Data model

    struct MissedPair: Codable, Equatable {
        let subject: String   // "geography" | "history" | "english"
        let prompt: String
        let answer: String
        var misses: Int       // how many times missed (prioritise higher miss counts)
        var lastMissed: Date
    }

    private var missed: [MissedPair] = []
    private var storageKey: String {
        "sr_missed_\(Session.shared.currentUser?.username ?? "guest")"
    }

    // MARK: - Public API

    /// Record a wrong answer.
    func recordMiss(subject: String, prompt: String, answer: String) {
        if let idx = missed.firstIndex(where: { $0.subject == subject && $0.prompt == prompt }) {
            missed[idx].misses += 1
            missed[idx].lastMissed = Date()
        } else {
            missed.append(MissedPair(subject: subject, prompt: prompt,
                                     answer: answer, misses: 1, lastMissed: Date()))
        }
        save()
    }

    /// Remove a pair once the player gets it right in review mode.
    func clearPair(subject: String, prompt: String) {
        missed.removeAll { $0.subject == subject && $0.prompt == prompt }
        save()
    }

    /// Return review pairs for a subject, sorted by most-missed first (max 10).
    func reviewPairs(for subject: String) -> [(prompt: String, answer: String)] {
        missed
            .filter { $0.subject == subject }
            .sorted { $0.misses > $1.misses || ($0.misses == $1.misses && $0.lastMissed > $1.lastMissed) }
            .prefix(10)
            .map { (prompt: $0.prompt, answer: $0.answer) }
    }

    /// Total missed pairs across all subjects for the current user.
    func totalMissed() -> Int { missed.count }

    /// Missed pairs for a specific subject.
    func totalMissed(subject: String) -> Int {
        missed.filter { $0.subject == subject }.count
    }

    // MARK: - Persistence

    private func save() {
        guard let data = try? JSONEncoder().encode(missed) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([MissedPair].self, from: data)
        else { return }
        missed = decoded
    }

    /// Reload from storage (call after login so the right user's data is loaded).
    func reloadForCurrentUser() { load() }
}
