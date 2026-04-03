import AVFoundation
import UIKit

/// Manages Questry the dragon's text-to-speech voice across the whole app.
/// Uses a high-pitch, energetic child-like voice via AVSpeechSynthesizer.
final class DragonVoiceManager: NSObject, AVSpeechSynthesizerDelegate {

    static let shared = DragonVoiceManager()
    private override init() {
        super.init()
        synthesizer.delegate = self
        configureAudioSession()
    }

    private let synthesizer = AVSpeechSynthesizer()

    /// Persisted mute preference across sessions.
    var isMuted: Bool {
        get { UserDefaults.standard.bool(forKey: "dragon_voice_muted") }
        set { UserDefaults.standard.set(newValue, forKey: "dragon_voice_muted") }
    }

    // MARK: - Public API

    /// Speak a string in Questry's voice. Stops any in-progress speech first.
    func speak(_ text: String) {
        guard !isMuted else { return }
        synthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = bestVoice()
        utterance.rate = 0.48               // slightly slower = clearer for kids
        utterance.pitchMultiplier = 1.55    // higher pitch = brighter, child-like
        utterance.volume = 1.0
        utterance.preUtteranceDelay = 0.15  // tiny pause before speaking feels natural

        synthesizer.speak(utterance)
    }

    /// Stop speaking immediately.
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }

    /// Toggle mute on/off. Returns the new muted state.
    @discardableResult
    func toggleMute() -> Bool {
        isMuted.toggle()
        if isMuted { stop() }
        return isMuted
    }

    var isSpeaking: Bool { synthesizer.isSpeaking }

    // MARK: - Voice Selection

    /// Pick the best available light/bright English voice.
    /// Prefers Nicky (en-US, lighter female) → Samantha → Karen (en-AU) → Moira (en-IE) → en-GB fallback.
    private func bestVoice() -> AVSpeechSynthesisVoice? {
        let preferred = [
            "com.apple.voice.compact.en-US.Nicky",
            "com.apple.voice.enhanced.en-US.Nicky",
            "com.apple.ttsbundle.Nicky-compact",
            "com.apple.voice.compact.en-US.Samantha",
            "com.apple.ttsbundle.Samantha-compact",
            "com.apple.voice.enhanced.en-US.Samantha",
            "com.apple.voice.compact.en-AU.Karen",
            "com.apple.ttsbundle.Karen-compact",
            "com.apple.voice.compact.en-IE.Moira",
            "com.apple.ttsbundle.Moira-compact",
        ]
        for id in preferred {
            if let voice = AVSpeechSynthesisVoice(identifier: id) {
                return voice
            }
        }
        // Fallback: any en-GB female or en-US
        if let gbVoice = AVSpeechSynthesisVoice(language: "en-GB") { return gbVoice }
        return AVSpeechSynthesisVoice(language: "en-US")
    }

    // MARK: - Audio Session

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio,
                                                             options: [.duckOthers])
        } catch {
            print("DragonVoice: audio session error:", error)
        }
    }
}

// MARK: - Mute Button Factory

extension DragonVoiceManager {

    /// Creates a ready-to-use mute/unmute toggle button styled for dark backgrounds.
    /// The caller is responsible for adding it to a view and handling layout.
    static func makeMuteButton(target: AnyObject, action: Selector) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.addTarget(target, action: action, for: .touchUpInside)
        DragonVoiceManager.refreshMuteButton(btn)
        return btn
    }

    /// Update the button icon to reflect current muted state.
    static func refreshMuteButton(_ button: UIButton) {
        let icon = DragonVoiceManager.shared.isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill"
        button.setImage(UIImage(systemName: icon), for: .normal)
        button.tintColor = DragonVoiceManager.shared.isMuted
            ? UIColor.white.withAlphaComponent(0.40)
            : UIColor.white.withAlphaComponent(0.90)
    }
}
