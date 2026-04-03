import AVFoundation

/// Plays the pre-recorded ElevenLabs MP3 voice-overs.
/// Falls back silently if a file is missing (e.g. on first run before files are bundled).
final class QuestryAudioPlayer: NSObject {

    static let shared = QuestryAudioPlayer()
    private var player: AVAudioPlayer?

    private override init() {
        super.init()
        configureAudioSession()
    }

    // MARK: - Public API

    /// Play the voice-over for a topic intro screen.
    /// subject: "math" | "sci" | "geo" | "eng" | "his"
    /// topicId: 1-based integer
    func playTopicIntro(subject: String, topicId: Int) {
        let name = "\(subject.lowercased())_topic_\(topicId)"
        play(named: name)
    }

    /// Play the voice-over for an onboarding page (1-based).
    func playOnboarding(page: Int) {
        play(named: "onboarding_\(page)")
    }

    /// Stop any currently playing audio immediately.
    func stop() {
        player?.stop()
        player = nil
    }

    var isPlaying: Bool { player?.isPlaying ?? false }

    // MARK: - Internal

    private func play(named name: String) {
        stop()

        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("[QuestryAudioPlayer] Missing audio file: \(name).mp3")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("[QuestryAudioPlayer] Failed to play \(name): \(error)")
        }
    }

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("[QuestryAudioPlayer] Audio session error: \(error)")
        }
    }
}

// MARK: - AVAudioPlayerDelegate
extension QuestryAudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.player = nil
    }
}
