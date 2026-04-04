import UIKit

final class MainTabBarController: UITabBarController {

    /// Tracks the highest level shown so duplicate/out-of-order notifications are ignored.
    private var lastShownLevel = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.shadowColor = .clear

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.isTranslucent = true

        let homeVC = makeFromStoryboard(id: "MainScreenViewController")
        let home = makeNav(root: homeVC, title: "Home", systemImage: "house")

        let questsVC = makeFromStoryboard(id: "DailyQuestsViewController")
        let quests = makeNav(root: questsVC, title: "Quests", systemImage: "checklist")

        let profileVC = makeFromStoryboard(id: "ProfileViewController")
        let profile = makeNav(root: profileVC, title: "Profile", systemImage: "person")

        viewControllers = [home, quests, profile]

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleLevelUp(_:)),
            name: .didLevelUp,
            object: nil
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showOnboardingIfNeeded()
    }

    private func showOnboardingIfNeeded() {
        guard !UserDefaults.standard.bool(forKey: "onboarding_completed") else { return }
        let vc = OnboardingViewController()
        vc.pageDelegate = self
        vc.modalPresentationStyle = .overFullScreen   // keeps app visible beneath blur
        vc.modalTransitionStyle   = .crossDissolve
        present(vc, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func handleLevelUp(_ notification: Notification) {
        let newLevel = notification.userInfo?["newLevel"] as? Int ?? 0
        guard newLevel > lastShownLevel else { return }   // ignore duplicates & out-of-order
        lastShownLevel = newLevel
        DispatchQueue.main.async { self.showLevelUpOverlay(newLevel: newLevel) }
    }

    private func showLevelUpOverlay(newLevel: Int) {
        guard let window = view.window else { return }

        let dim = UIView()
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.backgroundColor = UIColor.black.withAlphaComponent(0)
        window.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: window.topAnchor),
            dim.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: window.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: window.bottomAnchor)
        ])

        // Card
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.20, alpha: 0.97)
        card.layer.cornerRadius = 34
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 0.85).cgColor
        card.layer.shadowColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1).cgColor
        card.layer.shadowRadius = 28
        card.layer.shadowOpacity = 0.55
        card.layer.shadowOffset = .zero
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        window.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: window.centerYAnchor, constant: -20),
            card.widthAnchor.constraint(equalToConstant: 300)
        ])

        let starsLabel = UILabel()
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.text = "✨"
        starsLabel.font = UIFont.systemFont(ofSize: 60)
        starsLabel.textAlignment = .center

        let levelUpLabel = UILabel()
        levelUpLabel.translatesAutoresizingMaskIntoConstraints = false
        levelUpLabel.text = "LEVEL UP!"
        levelUpLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        levelUpLabel.textColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1)
        levelUpLabel.textAlignment = .center
        levelUpLabel.letterSpacing(3)

        let levelLabel = UILabel()
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.text = "Level \(newLevel)"
        levelLabel.font = UIFont.systemFont(ofSize: 52, weight: .heavy)
        levelLabel.textColor = .white
        levelLabel.textAlignment = .center

        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "You're on fire! Keep going! 🔥"
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        messageLabel.textColor = UIColor.white.withAlphaComponent(0.72)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0

        let continueBtn = UIButton(type: .system)
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.setTitle("Let's go! 🚀", for: .normal)
        continueBtn.setTitleColor(.black, for: .normal)
        continueBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueBtn.backgroundColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1)
        continueBtn.layer.cornerRadius = 22
        continueBtn.clipsToBounds = true

        card.addSubview(starsLabel)
        card.addSubview(levelUpLabel)
        card.addSubview(levelLabel)
        card.addSubview(messageLabel)
        card.addSubview(continueBtn)

        NSLayoutConstraint.activate([
            starsLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 28),
            starsLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            levelUpLabel.topAnchor.constraint(equalTo: starsLabel.bottomAnchor, constant: 6),
            levelUpLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            levelLabel.topAnchor.constraint(equalTo: levelUpLabel.bottomAnchor, constant: 4),
            levelLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            messageLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            continueBtn.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 24),
            continueBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            continueBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            continueBtn.heightAnchor.constraint(equalToConstant: 52),
            continueBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        let dismiss = {
            UIView.animate(withDuration: 0.22, animations: {
                dim.alpha = 0
                card.alpha = 0
                card.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }) { _ in
                dim.removeFromSuperview()
                card.removeFromSuperview()
            }
        }
        continueBtn.addAction(UIAction { _ in dismiss() }, for: .touchUpInside)
        dim.addGestureRecognizer(UITapGestureRecognizer(target: BlockAction(action: dismiss),
                                                        action: #selector(BlockAction.run)))

        UIView.animate(withDuration: 0.22) { dim.backgroundColor = UIColor.black.withAlphaComponent(0.6) }
        UIView.animate(
            withDuration: 0.55, delay: 0.05,
            usingSpringWithDamping: 0.6, initialSpringVelocity: 0.9,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0.08) {
                starsLabel.transform = CGAffineTransform(scaleX: 1.22, y: 1.22)
            } completion: { _ in
                UIView.animate(withDuration: 0.12) { starsLabel.transform = .identity }
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tabBar.frame = CGRect(
            x: 20,
            y: view.frame.height - 100,
            width: view.frame.width - 40,
            height: 70
        )
        tabBar.layer.cornerRadius = 25
        tabBar.layer.masksToBounds = true
    }

    private func makeNav(root: UIViewController, title: String, systemImage: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: root)
        nav.setNavigationBarHidden(true, animated: false)
        nav.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: systemImage), tag: 0)
        return nav
    }

    private func makeFromStoryboard(id: String) -> UIViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
    }
}

// MARK: - OnboardingPageDelegate

extension MainTabBarController: OnboardingPageDelegate {
    /// Switch to the relevant tab so users see the real screen behind the blur overlay.
    func onboarding(_ vc: OnboardingViewController, didChangeTo page: Int) {
        // When leaving page 4, pop the badges screen that was pushed behind the overlay
        if page != 4 {
            if let profileNav = viewControllers?[2] as? UINavigationController,
               profileNav.topViewController is BadgesViewController {
                profileNav.popViewController(animated: false)
            }
        }

        switch page {
        case 0: selectedIndex = 0   // Welcome → Home (world map)
        case 1: selectedIndex = 0   // Quest Map → Home (world map)
        case 2: selectedIndex = 0   // XP/Level → Home (world map)
        case 3: selectedIndex = 1   // Daily Quests → Quests tab
        case 4:
            // Show Badges screen behind the overlay
            selectedIndex = 2
            if let profileNav = viewControllers?[2] as? UINavigationController,
               !(profileNav.topViewController is BadgesViewController) {
                let badgesVC = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "BadgesViewController")
                profileNav.pushViewController(badgesVC, animated: false)
            }
        default: break
        }
    }
}

// MARK: - Helpers

private extension UILabel {
    func letterSpacing(_ spacing: CGFloat) {
        guard let text else { return }
        let attr = NSMutableAttributedString(string: text)
        attr.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: attr.length - 1))
        attributedText = attr
    }
}

private final class BlockAction: NSObject {
    let action: () -> Void
    init(action: @escaping () -> Void) { self.action = action }
    @objc func run() { action() }
}
