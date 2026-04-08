import UIKit

// MARK: - Badge Definition

struct BadgeDefinition {
    let id: String
    let name: String
    let description: String
    let imageName: String

    // Returns true if the badge should be awarded given the current event snapshot
    let condition: (BadgeEvent) -> Bool

    static let all: [BadgeDefinition] = [
        BadgeDefinition(
            id: "badge_first_quest",
            name: "First Quest!",
            description: "You completed your very first quest. The adventure begins!",
            imageName: "badge_first_quest"
        ) { event in
            event.totalQuestsCompleted >= 1
        },
        BadgeDefinition(
            id: "badge_10_quests",
            name: "Quest Veteran",
            description: "10 quests done  -  you're on a roll!",
            imageName: "badge_10_quests"
        ) { event in
            event.totalQuestsCompleted >= 10
        },
        BadgeDefinition(
            id: "badge_50_quests",
            name: "Quest Master",
            description: "50 quests completed. Impressive dedication!",
            imageName: "badge_50_quests"
        ) { event in
            event.totalQuestsCompleted >= 50
        },
        BadgeDefinition(
            id: "badge_100_quests",
            name: "Quest Legend",
            description: "100 quests! You are a true legend.",
            imageName: "badge_100_quests"
        ) { event in
            event.totalQuestsCompleted >= 100
        },
        BadgeDefinition(
            id: "badge_100xp",
            name: "100 XP Club",
            description: "You've earned 100 XP. Keep it up!",
            imageName: "badge_100xp"
        ) { event in
            event.totalXP >= 100
        },
        BadgeDefinition(
            id: "badge_500xp",
            name: "500 XP Star",
            description: "500 XP earned  -  you're a star!",
            imageName: "badge_500xp"
        ) { event in
            event.totalXP >= 500
        },
        BadgeDefinition(
            id: "badge_1000xp",
            name: "XP Champion",
            description: "1000 XP! You're a true champion.",
            imageName: "badge_1000xp"
        ) { event in
            event.totalXP >= 1000
        },
        BadgeDefinition(
            id: "badge_math_explorer",
            name: "Math Explorer",
            description: "You passed your first Math exam. Explorer unlocked!",
            imageName: "badge_math_explorer"
        ) { event in
            event.passedExam && event.subject == "Math"
        },
        BadgeDefinition(
            id: "badge_first_world",
            name: "World Conqueror",
            description: "You passed an exam and conquered your first world!",
            imageName: "badge_first_world"
        ) { event in
            event.passedExam
        },
        BadgeDefinition(
            id: "badge_language_master",
            name: "Language Master",
            description: "You passed an English exam. Words are your power!",
            imageName: "badge_language_master"
        ) { event in
            event.passedExam && event.subject == "English"
        },
        BadgeDefinition(
            id: "badge_geography_discoverer",
            name: "Geography Discoverer",
            description: "You passed a Geography exam. The world is your map!",
            imageName: "badge_geography_discoverer"
        ) { event in
            event.passedExam && event.subject == "Geography"
        },
        BadgeDefinition(
            id: "badge_all_worlds",
            name: "All Worlds Explorer",
            description: "Passed exams in Math, English and Geography. True explorer!",
            imageName: "badge_all_worlds"
        ) { event in
            event.passedExamSubjects.contains("Math") &&
            event.passedExamSubjects.contains("English") &&
            event.passedExamSubjects.contains("Geography")
        }
    ]
}

// MARK: - Badge Event

struct BadgeEvent {
    let totalQuestsCompleted: Int
    let totalXP: Int
    let passedExam: Bool
    let subject: String
    /// All subjects for which the user has ever passed an exam (persisted by BadgeManager).
    let passedExamSubjects: Set<String>
}

// MARK: - Badge Manager

final class BadgeManager {

    static let shared = BadgeManager()
    private init() {}

    private let earnedKey          = "earned_badge_ids"
    private let totalQuestsKey     = "badge_total_quests_completed"
    private let passedSubjectsKey  = "badge_passed_exam_subjects"

    var earnedBadgeIds: Set<String> {
        get { Set(UserDefaults.standard.stringArray(forKey: earnedKey) ?? []) }
        set { UserDefaults.standard.set(Array(newValue), forKey: earnedKey) }
    }

    /// All subjects for which the user has passed at least one exam.
    var passedExamSubjects: Set<String> {
        get { Set(UserDefaults.standard.stringArray(forKey: passedSubjectsKey) ?? []) }
        set { UserDefaults.standard.set(Array(newValue), forKey: passedSubjectsKey) }
    }

    func incrementQuestCount() {
        let current = UserDefaults.standard.integer(forKey: totalQuestsKey)
        UserDefaults.standard.set(current + 1, forKey: totalQuestsKey)
    }

    /// Record a passed exam for a subject. Call before checkAndAward.
    func recordExamPass(subject: String) {
        var subjects = passedExamSubjects
        subjects.insert(subject)
        passedExamSubjects = subjects
    }

    var totalQuestsCompleted: Int {
        UserDefaults.standard.integer(forKey: totalQuestsKey)
    }

    /// Check all badge conditions and return any newly earned ones.
    func checkAndAward(event: BadgeEvent) -> [BadgeDefinition] {
        var earned = earnedBadgeIds
        var newlyEarned: [BadgeDefinition] = []

        for badge in BadgeDefinition.all {
            guard !earned.contains(badge.id) else { continue }
            if badge.condition(event) {
                earned.insert(badge.id)
                newlyEarned.append(badge)
            }
        }

        if !newlyEarned.isEmpty {
            earnedBadgeIds = earned
        }

        return newlyEarned
    }
}

// MARK: - Badge Earned Overlay (shown from any VC)

extension UIViewController {

    /// Shows newly earned badges one at a time with animation.
    /// Calls `completion` when all badges have been dismissed.
    func showBadgesEarned(_ badges: [BadgeDefinition], completion: @escaping () -> Void) {
        guard !badges.isEmpty else { completion(); return }
        showOneBadge(badges, index: 0, completion: completion)
    }

    private func showOneBadge(_ badges: [BadgeDefinition], index: Int, completion: @escaping () -> Void) {
        guard index < badges.count else { completion(); return }
        let badge = badges[index]
        buildBadgeOverlay(badge: badge) { [weak self] in
            guard let self else { return }
            self.showOneBadge(badges, index: index + 1, completion: completion)
        }
    }

    private func buildBadgeOverlay(badge: BadgeDefinition, onDismiss: @escaping () -> Void) {
        // Dim backdrop
        let dim = UIView()
        dim.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.alpha = 0
        view.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: view.topAnchor),
            dim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Card
        let card = UIView()
        card.backgroundColor = UIColor(red: 0.98, green: 0.96, blue: 0.88, alpha: 1.0)
        card.layer.cornerRadius = 32
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.18
        card.layer.shadowRadius = 24
        card.layer.shadowOffset = CGSize(width: 0, height: 8)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        view.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])

        let darkBrown = UIColor(red: 0.25, green: 0.15, blue: 0.05, alpha: 1.0)

        // "BADGE UNLOCKED!" label
        let unlockLabel = UILabel()
        unlockLabel.text = "🏅 Badge Unlocked!"
        unlockLabel.font = UIFont.boldSystemFont(ofSize: 14)
        unlockLabel.textColor = UIColor(red: 0.7, green: 0.5, blue: 0.05, alpha: 1.0)
        unlockLabel.textAlignment = .center
        unlockLabel.translatesAutoresizingMaskIntoConstraints = false

        // Badge image
        let imageView = UIImageView()
        imageView.image = UIImage(named: badge.imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // Badge name
        let nameLabel = UILabel()
        nameLabel.text = badge.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        nameLabel.textColor = darkBrown
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Description
        let descLabel = UILabel()
        descLabel.text = badge.description
        descLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        descLabel.textColor = darkBrown.withAlphaComponent(0.65)
        descLabel.textAlignment = .center
        descLabel.numberOfLines = 0
        descLabel.translatesAutoresizingMaskIntoConstraints = false

        // Continue button
        let continueBtn = UIButton(type: .system)
        continueBtn.setTitle("Awesome! 🎉", for: .normal)
        continueBtn.setTitleColor(.black, for: .normal)
        continueBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueBtn.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1.0)
        continueBtn.layer.cornerRadius = 22
        continueBtn.clipsToBounds = true
        continueBtn.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(unlockLabel)
        card.addSubview(imageView)
        card.addSubview(nameLabel)
        card.addSubview(descLabel)
        card.addSubview(continueBtn)

        NSLayoutConstraint.activate([
            unlockLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),
            unlockLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            unlockLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            imageView.topAnchor.constraint(equalTo: unlockLabel.bottomAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            continueBtn.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 24),
            continueBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            continueBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),
            continueBtn.heightAnchor.constraint(equalToConstant: 52),
            continueBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24)
        ])

        // Animate in
        UIView.animate(withDuration: 0.22) { dim.alpha = 1 }
        UIView.animate(
            withDuration: 0.50,
            delay: 0.05,
            usingSpringWithDamping: 0.62,
            initialSpringVelocity: 0.9,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        } completion: { _ in
            // Pulse badge image
            UIView.animate(withDuration: 0.18, delay: 0.1, options: []) {
                imageView.transform = CGAffineTransform(scaleX: 1.18, y: 1.18)
            } completion: { _ in
                UIView.animate(withDuration: 0.15) { imageView.transform = .identity }
            }
        }

        let dismiss = {
            UIView.animate(withDuration: 0.20, animations: {
                dim.alpha = 0
                card.alpha = 0
                card.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }) { _ in
                dim.removeFromSuperview()
                card.removeFromSuperview()
                onDismiss()
            }
        }

        continueBtn.addAction(UIAction { _ in dismiss() }, for: .touchUpInside)

        // Auto-dismiss on dim tap too
        dim.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        dim.gestureRecognizers?.first?.addTarget(
            BlockTarget(action: dismiss), action: #selector(BlockTarget.run)
        )
    }
}

// Tiny helper to attach a closure as a gesture recognizer target
private final class BlockTarget: NSObject {
    let action: () -> Void
    init(action: @escaping () -> Void) { self.action = action }
    @objc func run() { action() }
}
