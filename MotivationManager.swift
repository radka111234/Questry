import UIKit

/// Manages motivational dragon nudges throughout the app.
/// Uses DragonVoiceManager for voice + shows a floating toast bubble on screen.
final class MotivationManager {
    static let shared = MotivationManager()
    private init() {}

    // MARK: - Nudge contexts

    enum Context {
        case correctAnswer
        case wrongAnswer
        case puzzleComplete(score: Int)
        case levelUp(level: Int)
        case dailyLogin
        case streakMilestone(days: Int)
        case speedRoundComplete(score: Int)
    }

    // MARK: - Message banks

    private let correctMessages = [
        "Nailed it! You're on fire! 🔥",
        "Yes! That's exactly right! ⭐",
        "Brilliant! Keep going! 🚀",
        "Wow, you're really smart! 💡",
        "Perfect! You're amazing! 🌟",
        "That's correct! I'm so proud of you! 🐉",
        "Fantastic! You're getting better and better!"
    ]

    private let wrongMessages = [
        "Oops! Don't worry, try again! 💪",
        "Not quite — you've got this! 🐉",
        "Almost! Give it another shot! ✨",
        "Mistakes help us learn! Try again! 🌟",
        "Keep going! Even I get things wrong sometimes! 😄",
        "You're braver for trying! Let's go again! 🚀"
    ]

    private let loginMessages = [
        "Welcome back, brave learner! Let's go! 🐉",
        "You showed up — that's already a win! ⭐",
        "Another day, another adventure! 🗺️",
        "Ready to learn something amazing today? 🚀",
        "I missed you! Let's explore together! 🌟"
    ]

    private func puzzleCompleteMessage(score: Int) -> String {
        switch score {
        case 0...3:  return "Good effort! Practice makes perfect! 💪"
        case 4...6:  return "Great job! You're improving! 🌟"
        case 7...9:  return "Awesome score! You're a star! ⭐"
        default:     return "PERFECT! You crushed it! 🔥🐉"
        }
    }

    private func levelUpMessage(level: Int) -> String {
        let theme = ThemeManager.shared.themeForLevel(level)
        return "\(theme.tierEmoji) Level \(level)! \(theme.unlockMessage)"
    }

    private func streakMessage(days: Int) -> String {
        "\(days)-day streak! You're unstoppable! 🔥"
    }

    private func speedRoundMessage(score: Int) -> String {
        score >= 8 ? "SPEED CHAMPION! Incredible! ⚡🔥" : "Great speed round! Keep training! ⚡"
    }

    // MARK: - Public API

    /// Show a motivational nudge for the given context.
    /// - Parameters:
    ///   - context: What triggered this nudge.
    ///   - in view: The view to show the toast bubble in.
    ///   - delay: Optional delay before showing.
    func nudge(for context: Context, in view: UIView, delay: TimeInterval = 0) {
        let message = messageFor(context)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            DragonVoiceManager.shared.speak(message)
            self.showToast(message, in: view)
        }
    }

    /// Just speak — no toast (e.g. during animations).
    func speak(for context: Context, delay: TimeInterval = 0) {
        let message = messageFor(context)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            DragonVoiceManager.shared.speak(message)
        }
    }

    // MARK: - Toast bubble

    func showToast(_ message: String, in view: UIView) {
        // Dragon emoji pill that floats up from the bottom
        let container = UIView()
        container.backgroundColor = UIColor(red: 0.10, green: 0.06, blue: 0.22, alpha: 0.94)
        container.layer.cornerRadius = 22
        container.layer.borderWidth  = 1.5
        container.layer.borderColor  = ThemeManager.shared.currentTheme().accentColor.withAlphaComponent(0.7).cgColor
        container.layer.shadowColor  = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.35
        container.layer.shadowRadius  = 10
        container.layer.shadowOffset  = CGSize(width: 0, height: 3)
        container.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text          = "🐉 \(message)"
        label.textColor     = .white
        label.font          = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(label)
        view.addSubview(container)

        let safeBottom = view.safeAreaInsets.bottom
        let bottomOffset: CGFloat = safeBottom + 100

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),

            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomOffset)
        ])

        view.layoutIfNeeded()

        // Slide up
        let slideUp = container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(bottomOffset))
        NSLayoutConstraint.deactivate([
            container.constraints.first { $0.constant == bottomOffset } ?? container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([slideUp])

        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.70,
                       initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            view.layoutIfNeeded()
        }

        // Fade out after 2.8s
        UIView.animate(withDuration: 0.35, delay: 2.8, options: [.curveEaseIn]) {
            container.alpha = 0
            container.transform = CGAffineTransform(translationX: 0, y: 12)
        } completion: { _ in
            container.removeFromSuperview()
        }
    }

    // MARK: - Daily login nudge

    private let loginKey = "motivation_last_login_date"

    /// Call on app foreground / viewWillAppear of home screen.
    /// Only fires once per calendar day per user.
    func nudgeIfFirstLoginToday(in view: UIView) {
        let today = ISO8601DateFormatter().string(from: Date()).prefix(10).description
        let key   = "\(loginKey)_\(Session.shared.currentUser?.username ?? "guest")"
        guard UserDefaults.standard.string(forKey: key) != today else { return }
        UserDefaults.standard.set(today, forKey: key)
        nudge(for: .dailyLogin, in: view, delay: 1.0)
    }

    // MARK: - Private helpers

    private func messageFor(_ context: Context) -> String {
        switch context {
        case .correctAnswer:
            return correctMessages.randomElement() ?? correctMessages[0]
        case .wrongAnswer:
            return wrongMessages.randomElement() ?? wrongMessages[0]
        case .puzzleComplete(let score):
            return puzzleCompleteMessage(score: score)
        case .levelUp(let level):
            return levelUpMessage(level: level)
        case .dailyLogin:
            return loginMessages.randomElement() ?? loginMessages[0]
        case .streakMilestone(let days):
            return streakMessage(days: days)
        case .speedRoundComplete(let score):
            return speedRoundMessage(score: score)
        }
    }
}
