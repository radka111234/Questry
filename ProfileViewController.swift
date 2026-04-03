import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!

    // Created programmatically — not connected in storyboard
    private let usernameValueLabel = UILabel()
    @IBOutlet weak var levelValueLabel: UILabel!

    @IBOutlet weak var questsCompletedLabel: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var unlockedIslandsLabel: UILabel!
    @IBOutlet weak var totalXPLabel: UILabel!

    @IBOutlet weak var changePictureButton: UIButton!
    @IBOutlet weak var changeUsernameButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var worldProgressButton: UIButton!
    @IBOutlet weak var badgesButton: UIButton!
    @IBOutlet weak var rewardsShopButton: UIButton!

    // MARK: - Progress
    private let totalIslands = 5
    private var unlockedIslands: Int {
        let d = UserDefaults.standard
        let mathDone = (d.array(forKey: "math_completed_topic_ids") as? [Int] ?? []).count
        let engDone  = (d.array(forKey: "eng_completed_topic_ids")  as? [Int] ?? []).count
        let geoDone  = (d.array(forKey: "geo_completed_topic_ids")  as? [Int] ?? []).count
        let totalDone = mathDone + engDone + geoDone
        var count = 3 // math, english, geography always unlocked
        let sciUnlocked = totalDone >= 10
        if sciUnlocked { count += 1 }
        if sciUnlocked && (Session.shared.currentUser?.level ?? 1) >= 5 { count += 1 }
        return count
    }
    // Single source of truth: the XP already stored in the session (synced from Supabase)
    private var totalXP: Int { Session.shared.currentUser?.xp ?? 0 }
    private var questsCompleted: Int { DailyQuestManager.shared.totalQuestsCompleted }
    private var streakDays: Int { StreakManager.shared.currentStreak }

    // MARK: - UI
    private var hasRepositioned = false
    private let gradientLayer = CAGradientLayer()
    private let personalCard = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
    private let progressCard = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))

    override func viewDidLoad() {
        super.viewDidLoad()

        applyBackgroundGradient()
        setupUsernameLabel()
        setupCards()
        style()
        refreshUI()

        let xpTap = UITapGestureRecognizer(target: self, action: #selector(didTapXP))
        totalXPLabel?.isUserInteractionEnabled = true
        totalXPLabel?.addGestureRecognizer(xpTap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gradientLayer.frame = view.bounds

        avatarImageView?.layer.cornerRadius = (avatarImageView?.bounds.width ?? 0) / 2
        avatarImageView?.clipsToBounds = true
        if let av = avatarImageView { ShopEffects.applyAvatarCosmetics(to: av) }

        if !hasRepositioned { repositionProfileFields(); hasRepositioned = true }

        layoutCards()
    }

    // MARK: - Programmatic username label
    private func setupUsernameLabel() {
        view.addSubview(usernameValueLabel)
    }

    /// Repositions username label, changeUsernameButton, levelValueLabel, changePasswordButton
    /// into a single aligned column: username → Change username → level → Change password.
    private func repositionProfileFields() {
        guard let usernameBtn = changeUsernameButton,
              let levelLbl   = levelValueLabel,
              let passwordBtn = changePasswordButton else { return }

        let x: CGFloat = usernameBtn.frame.minX
        let w: CGFloat = usernameBtn.frame.width
        let rowH: CGFloat = 28
        let btnH: CGFloat = 30
        let gap: CGFloat  = 4

        var y = usernameBtn.frame.minY   // anchor to where changeUsernameButton was

        usernameValueLabel.frame = CGRect(x: x, y: y, width: w, height: rowH)
        y += rowH + gap
        usernameBtn.frame       = CGRect(x: x, y: y, width: w, height: btnH)
        y += btnH + gap + 4
        levelLbl.frame          = CGRect(x: x, y: y, width: w, height: rowH)
        y += rowH + gap
        passwordBtn.frame       = CGRect(x: x, y: y, width: w, height: btnH)
    }

    // MARK: - Background
    private func applyBackgroundGradient() {
        gradientLayer.colors = [
            UIColor(red: 10/255, green: 35/255, blue: 55/255, alpha: 1).cgColor,
            UIColor(red: 10/255, green: 70/255, blue: 85/255, alpha: 1).cgColor,
            UIColor(red: 5/255,  green: 18/255, blue: 30/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Cards
    private func setupCards() {
        [personalCard, progressCard].forEach { card in
            card.clipsToBounds = true
            card.layer.cornerRadius = 18
            card.alpha = 0.92
            card.layer.borderWidth = 1
            card.layer.borderColor = UIColor.white.withAlphaComponent(0.10).cgColor
            view.addSubview(card)
            view.sendSubviewToBack(card)
        }
    }

    private func layoutCards() {
        var personalViews: [UIView] = [usernameValueLabel]
        personalViews += ([
            avatarImageView,
            changePictureButton,
            settingsButton,
            levelValueLabel,
            changeUsernameButton,
            changePasswordButton
        ] as [UIView?]).compactMap { $0 }

        personalCard.frame = paddedUnionFrame(
            of: personalViews,
            padding: UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
        )

        let progressViews: [UIView] = [
            questsCompletedLabel,
            streakLabel,
            unlockedIslandsLabel,
            totalXPLabel,
            worldProgressButton,
            badgesButton,
            rewardsShopButton,
            logoutButton
        ].compactMap { $0 }

        progressCard.frame = paddedUnionFrame(
            of: progressViews,
            padding: UIEdgeInsets(top: 14, left: 16, bottom: 18, right: 16)
        )
    }

    private func paddedUnionFrame(of views: [UIView], padding: UIEdgeInsets) -> CGRect {
        var rect: CGRect = .null

        for v in views {
            rect = rect.union(v.convert(v.bounds, to: self.view))
        }

        if rect.isNull { rect = .zero }

        return rect.inset(
            by: UIEdgeInsets(
                top: -padding.top,
                left: -padding.left,
                bottom: -padding.bottom,
                right: -padding.right
            )
        )
    }

    // MARK: - Styling
    private func style() {
        let softWhite = UIColor.white.withAlphaComponent(0.92)

        usernameValueLabel.textColor = softWhite
        usernameValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

        [
            levelValueLabel,
            questsCompletedLabel,
            streakLabel,
            unlockedIslandsLabel,
            totalXPLabel
        ].forEach {
            $0?.textColor = softWhite
        }

        styleSettingsButton()
        styleLinkButton(changePictureButton)
        styleLinkButton(changeUsernameButton)
        styleLinkButton(changePasswordButton)

        styleSecondaryButton(worldProgressButton, title: "World progress")
        styleSecondaryButton(badgesButton, title: "Badges")
        styleSecondaryButton(rewardsShopButton, title: "Rewards Shop")

        logoutButton?.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.9)
        logoutButton?.setTitleColor(.white, for: .normal)
        logoutButton?.layer.cornerRadius = 18
        logoutButton?.clipsToBounds = true

        avatarImageView?.layer.shadowColor = UIColor.systemPurple.cgColor
        avatarImageView?.layer.shadowRadius = 14
        avatarImageView?.layer.shadowOpacity = 0.35
        avatarImageView?.layer.shadowOffset = .zero
        avatarImageView?.layer.masksToBounds = false
    }

    private func styleSettingsButton() {
        settingsButton?.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton?.tintColor = UIColor.white.withAlphaComponent(0.9)
        settingsButton?.imageView?.contentMode = .scaleAspectFit
        settingsButton?.contentHorizontalAlignment = .fill
        settingsButton?.contentVerticalAlignment = .fill
        settingsButton?.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }

    private func styleLinkButton(_ button: UIButton?) {
        guard let button else { return }
        button.setTitleColor(UIColor.white.withAlphaComponent(0.90), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }

    private func styleSecondaryButton(_ button: UIButton?, title: String) {
        guard let button else { return }
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.10)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }

    // MARK: - Data
    private func refreshUI() {
        let savedAvatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"

        avatarImageView?.image = UIImage(named: savedAvatarName)
        avatarImageView?.contentMode = .scaleAspectFill

        let xp = Session.shared.currentUser?.xp ?? 0

        guard let user = Session.shared.currentUser else {
            usernameValueLabel.text = "Guest"
            levelValueLabel?.text = "Level -"
            questsCompletedLabel?.text = "🏆 Quests completed: \(questsCompleted)"
            streakLabel?.text = "🔥 Streak: \(streakDays) days"
            unlockedIslandsLabel?.text = "🗺️ Unlocked islands: \(unlockedIslands)/\(totalIslands)"
            totalXPLabel?.text = "⭐ Total XP: \(xp)"
            return
        }

        usernameValueLabel.text = user.username
        levelValueLabel?.text = "Level \(user.level)"
        questsCompletedLabel?.text = "🏆 Quests completed: \(questsCompleted)"
        streakLabel?.text = "🔥 Streak: \(streakDays) days"
        unlockedIslandsLabel?.text = "🗺️ Unlocked islands: \(unlockedIslands)/\(totalIslands)"
        totalXPLabel?.text = "⭐ Total XP: \(xp)"
    }

    // MARK: - Navigation
    private func pushVC(id: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: id)
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Actions
    @IBAction func didTapChangePicture(_ sender: UIButton) {
        pushVC(id: "AvatarStudioViewController")
    }

    @IBAction func didTapChangeUsername(_ sender: UIButton) {
        let alert = UIAlertController(title: "Change username", message: nil, preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "New username"
            tf.autocapitalizationType = .none
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            let newName = (alert.textFields?.first?.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            guard !newName.isEmpty, let user = Session.shared.currentUser else { return }
            let oldName = user.username

            // Optimistically update locally first
            Session.shared.currentUser = CurrentUser(
                username: newName,
                avatarIndex: user.avatarIndex,
                level: user.level,
                xp: user.xp,
                age: user.age
            )
            self?.refreshUI()

            // Persist to Supabase
            SupabaseManager.shared.changeUsername(oldUsername: oldName, newUsername: newName) { success in
                DispatchQueue.main.async {
                    if !success {
                        // Revert on failure
                        Session.shared.currentUser = user
                        self?.refreshUI()
                        self?.showSimpleAlert(title: "Error", message: "Could not update username. It may already be taken.")
                    }
                }
            }
        })
        present(alert, animated: true)
    }

    @IBAction func didTapChangePassword(_ sender: UIButton) {
        guard let username = Session.shared.currentUser?.username else { return }

        let alert = UIAlertController(title: "Change Password", message: nil, preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "New password"
            tf.isSecureTextEntry = true
        }
        alert.addTextField { tf in
            tf.placeholder = "Confirm new password"
            tf.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            let newPass     = alert.textFields?[0].text ?? ""
            let confirmPass = alert.textFields?[1].text ?? ""

            guard newPass.count >= 4 else {
                self?.showSimpleAlert(title: "Too short", message: "Password must be at least 4 characters.")
                return
            }
            guard newPass == confirmPass else {
                self?.showSimpleAlert(title: "Mismatch", message: "Passwords don't match.")
                return
            }

            SupabaseManager.shared.changePassword(username: username, newPassword: newPass) { success in
                DispatchQueue.main.async {
                    if success {
                        self?.showSimpleAlert(title: "Done", message: "Password updated successfully.")
                    } else {
                        self?.showSimpleAlert(title: "Error", message: "Could not update password. Try again.")
                    }
                }
            }
        })
        present(alert, animated: true)
    }

    private func showSimpleAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }

    @IBAction func didTapLogout(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Log out?",
            message: "You'll need to log back in to continue your progress.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Log out", style: .destructive) { _ in
            AuthState.isLoggedIn = false
            Session.shared.currentUser = nil
            AppRouter.showLogin()
        })
        present(alert, animated: true)
    }

    @IBAction func didTapSettings(_ sender: UIButton) {
        pushVC(id: "SettingsViewController")
    }

    @IBAction func didTapWorldProgress(_ sender: UIButton) {
        pushVC(id: "WorldProgressViewController")
    }

    @IBAction func didTapBadges(_ sender: UIButton) {
        pushVC(id: "BadgesViewController")
    }

    @IBAction func didTapRewardsShop(_ sender: UIButton) {
        pushVC(id: "RewardsShopViewController")
    }

    @objc private func didTapXP() {
        pushVC(id: "RewardsShopViewController")
    }
}
