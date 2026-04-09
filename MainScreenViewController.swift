import UIKit

final class MainScreenViewController: UIViewController {

    // MARK: - Top UI
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var xpProgress: UIProgressView!

    // MARK: - Island Buttons
    @IBOutlet weak var mathButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var geographyButton: UIButton!
    @IBOutlet weak var scienceButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!

    private enum Island: Int {
        case math = 0
        case english = 1
        case geography = 2
        case science = 3
        case history = 4
    }

    private var unlockedIslands: Set<Island> = []

    private func computeUnlockedIslands() -> Set<Island> {
        let mathDone  = (UserDefaults.standard.array(forKey: "math_completed_topic_ids") as? [Int] ?? []).count
        let engDone   = (UserDefaults.standard.array(forKey: "eng_completed_topic_ids")  as? [Int] ?? []).count
        let geoDone   = (UserDefaults.standard.array(forKey: "geo_completed_topic_ids")  as? [Int] ?? []).count
        let sciDone   = (UserDefaults.standard.array(forKey: "sci_completed_topic_ids")  as? [Int] ?? []).count

        var islands: Set<Island> = [.math, .english, .geography]

        // Science and History both unlock once 1 topic is completed in any of the first 3 worlds
        let coreWorldDone = mathDone + engDone + geoDone >= 1
        if coreWorldDone {
            islands.insert(.science)
            islands.insert(.history)
        }

        return islands
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = "Username"
        levelLabel.text = "Level 1"
        xpLabel.text = "0 XP"

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapXP))
        xpLabel.isUserInteractionEnabled = true
        xpLabel.addGestureRecognizer(tap)

        styleButtons()
        applyLocks()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleLevelUp(_:)),
            name: .didLevelUp,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .didLevelUp, object: nil)
    }

    @objc private func handleLevelUp(_ notification: Notification) {
        let newLevel = (notification.userInfo?["newLevel"] as? Int) ?? (Session.shared.currentUser?.level ?? 1)
        let oldLevel = newLevel - 1
        let newTier  = ThemeManager.shared.didUnlockNewTier(oldLevel: oldLevel, newLevel: newLevel)
        showLevelUpOverlay(newLevel: newLevel, newTier: newTier)
    }

    private func showLevelUpOverlay(newLevel: Int, newTier: Bool = false) {
        let dim = UIView()
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.backgroundColor = UIColor.black.withAlphaComponent(0)
        view.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: view.topAnchor),
            dim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.10, green: 0.04, blue: 0.22, alpha: 0.98)
        card.layer.cornerRadius = 32
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor(red: 0.82, green: 0.55, blue: 1.0, alpha: 0.9).cgColor
        card.layer.shadowColor = UIColor.purple.cgColor
        card.layer.shadowOpacity = 0.5
        card.layer.shadowRadius = 24
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        view.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28)
        ])

        let starsLabel = UILabel()
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.text = "✨⭐✨"
        starsLabel.font = UIFont.systemFont(ofSize: 44)
        starsLabel.textAlignment = .center

        let levelUpLabel = UILabel()
        levelUpLabel.translatesAutoresizingMaskIntoConstraints = false
        levelUpLabel.text = "LEVEL UP!"
        levelUpLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        levelUpLabel.textColor = UIColor(red: 0.82, green: 0.55, blue: 1.0, alpha: 1)
        levelUpLabel.textAlignment = .center

        let levelLabel = UILabel()
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.text = "You reached\nLevel \(newLevel)!"
        levelLabel.font = UIFont.boldSystemFont(ofSize: 34)
        levelLabel.textColor = .white
        levelLabel.textAlignment = .center
        levelLabel.numberOfLines = 0

        let theme = ThemeManager.shared.themeForLevel(newLevel)
        let subText = newTier ? theme.unlockMessage : "Keep completing quests to level up even further 🚀"

        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = subText
        subLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        subLabel.textColor = newTier ? theme.accentColor : UIColor.white.withAlphaComponent(0.65)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 0

        let continueBtn = UIButton(type: .system)
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.setTitle("Keep going! 🎉", for: .normal)
        continueBtn.setTitleColor(.black, for: .normal)
        continueBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueBtn.backgroundColor = UIColor(red: 0.82, green: 0.55, blue: 1.0, alpha: 1)
        continueBtn.layer.cornerRadius = 22
        continueBtn.clipsToBounds = true

        card.addSubview(starsLabel)
        card.addSubview(levelUpLabel)
        card.addSubview(levelLabel)
        card.addSubview(subLabel)
        card.addSubview(continueBtn)

        NSLayoutConstraint.activate([
            starsLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),
            starsLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            levelUpLabel.topAnchor.constraint(equalTo: starsLabel.bottomAnchor, constant: 8),
            levelUpLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            levelLabel.topAnchor.constraint(equalTo: levelUpLabel.bottomAnchor, constant: 8),
            levelLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            levelLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            subLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 12),
            subLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            subLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            continueBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 24),
            continueBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            continueBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            continueBtn.heightAnchor.constraint(equalToConstant: 54),
            continueBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        UIView.animate(withDuration: 0.22) { dim.backgroundColor = UIColor.black.withAlphaComponent(0.55) }
        UIView.animate(
            withDuration: 0.5, delay: 0.05,
            usingSpringWithDamping: 0.62, initialSpringVelocity: 0.9,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        }

        let dismiss = {
            UIView.animate(withDuration: 0.20, animations: {
                dim.alpha = 0; card.alpha = 0
                card.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }) { _ in dim.removeFromSuperview(); card.removeFromSuperview() }
        }
        continueBtn.addAction(UIAction { _ in dismiss() }, for: .touchUpInside)
        dim.addGestureRecognizer(UITapGestureRecognizer(target: BlockDismiss(action: dismiss), action: #selector(BlockDismiss.run)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let user = Session.shared.currentUser else { return }

        usernameLabel.text = user.username
        levelLabel.text = "Level \(user.level)"
        xpLabel.text = ShopEffects.formatXPLabel("\(user.xp) XP")

        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        let xp: Float = Float(user.xp % 500)
        let nextLevelXP: Float = 500
        xpProgress.progress = xp / nextLevelXP
        ThemeManager.shared.styleXPBar(xpProgress)
        xpProgress.trackTintColor = UIColor.white.withAlphaComponent(0.2)

        ShopEffects.applyMapTheme(to: view)

        unlockedIslands = computeUnlockedIslands()
        applyLocks()
        MotivationManager.shared.nudgeIfFirstLoginToday(in: view)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
        ShopEffects.applyAvatarCosmetics(to: avatarImageView)
    }

    private func styleButtons() {
        let all = [mathButton, englishButton, geographyButton, scienceButton, historyButton]
        all.forEach { btn in
            btn?.backgroundColor = .clear
        }
    }

    private func applyLocks() {
        let scienceLocked = !unlockedIslands.contains(.science)
        let historyLocked = !unlockedIslands.contains(.history)

        setLocked(mathButton, locked: false)
        setLocked(englishButton, locked: false)
        setLocked(geographyButton, locked: false)
        setLocked(scienceButton, locked: scienceLocked)
        setLocked(historyButton, locked: historyLocked)

        setGlow(mathButton, enabled: true)
        setGlow(englishButton, enabled: true)
        setGlow(geographyButton, enabled: true)
        setGlow(scienceButton, enabled: !scienceLocked)
        setGlow(historyButton, enabled: !historyLocked)
    }

    private func setLocked(_ button: UIButton?, locked: Bool) {
        guard let button else { return }

        if locked {
            button.alpha = 0.5
            button.tintAdjustmentMode = .dimmed
        } else {
            button.alpha = 1
            button.tintAdjustmentMode = .normal
        }

        button.alpha = locked ? 0.55 : 1.0

        button.subviews
            .filter { $0.tag == 9999 }
            .forEach { $0.removeFromSuperview() }

        guard locked else { return }

        let lock = UIImageView(image: UIImage(systemName: "lock.fill"))
        lock.tintColor = .white
        lock.translatesAutoresizingMaskIntoConstraints = false
        lock.tag = 9999

        let bg = UIView()
        bg.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        bg.layer.cornerRadius = 10
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.tag = 9999

        button.addSubview(bg)
        button.addSubview(lock)

        NSLayoutConstraint.activate([
            bg.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            bg.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            bg.widthAnchor.constraint(equalToConstant: 34),
            bg.heightAnchor.constraint(equalToConstant: 34),

            lock.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            lock.centerYAnchor.constraint(equalTo: bg.centerYAnchor),
            lock.widthAnchor.constraint(equalToConstant: 16),
            lock.heightAnchor.constraint(equalToConstant: 18)
        ])
    }

    private func setGlow(_ button: UIButton?, enabled: Bool) {
        guard let button else { return }
        if enabled {
            ThemeManager.shared.applyGlow(to: button)
        } else {
            button.layer.shadowOpacity = 0
        }
    }

    @IBAction func didTapIsland(_ sender: UIButton) {
        guard let island = Island(rawValue: sender.tag) else { return }

        guard unlockedIslands.contains(island) else {
            let mathDone = (UserDefaults.standard.array(forKey: "math_completed_topic_ids") as? [Int] ?? []).count
            let engDone  = (UserDefaults.standard.array(forKey: "eng_completed_topic_ids")  as? [Int] ?? []).count
            let geoDone  = (UserDefaults.standard.array(forKey: "geo_completed_topic_ids")  as? [Int] ?? []).count
            let total = mathDone + engDone + geoDone

            let message: String
            switch island {
            case .science, .history:
                message = "Complete your first topic in Math, English, or Geography to unlock this world! You’ve completed \(total) so far."
            default:
                message = "This island isn’t unlocked yet."
            }
            showAlert(title: "Locked", message: message)
            return
        }

        UIView.animate(withDuration: 0.1,
                       animations: {
                           sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                       }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }

        switch island {
        case .math:
            pushWorld(storyboardID: "MathViewController")
        case .english:
            pushWorld(storyboardID: "EnglishViewController")
        case .geography:
            pushWorld(storyboardID: "GeographyViewController")
        case .science:
            pushWorld(storyboardID: "ScienceViewController")
        case .history:
            pushWorld(storyboardID: "HistoryViewController")
        }
    }

    private func pushWorld(storyboardID: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: storyboardID)
        navigationController?.pushViewController(vc, animated: true)
    }

    private func showAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }

    @objc private func didTapXP() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RewardsShopViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Gesture helper for level-up overlay dismiss
private final class BlockDismiss: NSObject {
    let action: () -> Void
    init(action: @escaping () -> Void) { self.action = action }
    @objc func run() { action() }
}
