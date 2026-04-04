import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Storyboard Outlets (all connected in Main.storyboard)
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var changePictureButton: UIButton!

    @IBOutlet weak var changeUsernameButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var levelValueLabel: UILabel!

    @IBOutlet weak var questsCompletedLabel: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var unlockedIslandsLabel: UILabel!
    @IBOutlet weak var totalXPLabel: UILabel!

    @IBOutlet weak var worldProgressButton: UIButton!
    @IBOutlet weak var badgesButton: UIButton!
    @IBOutlet weak var rewardsShopButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    // MARK: - Programmatic labels (not in storyboard)
    private let profileTitleLabel       = UILabel()
    private let usernameValueLabel      = UILabel()
    private let personalInfoHeader      = UILabel()
    private let progressHeader          = UILabel()

    // MARK: - Computed data
    private let totalIslands = 5
    private var unlockedIslands: Int {
        let d = UserDefaults.standard
        let mathDone = (d.array(forKey: "math_completed_topic_ids")  as? [Int] ?? []).count
        let engDone  = (d.array(forKey: "eng_completed_topic_ids")   as? [Int] ?? []).count
        let geoDone  = (d.array(forKey: "geo_completed_topic_ids")   as? [Int] ?? []).count
        let totalDone = mathDone + engDone + geoDone
        var count = 3
        let sciUnlocked = totalDone >= 10
        if sciUnlocked { count += 1 }
        if sciUnlocked && (Session.shared.currentUser?.level ?? 1) >= 5 { count += 1 }
        return count
    }
    private var questsCompleted: Int { DailyQuestManager.shared.totalQuestsCompleted }
    private var streakDays: Int      { StreakManager.shared.currentStreak }

    // MARK: - UI state
    private var hasLaidOut = false
    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyBackgroundGradient()
        addProgrammaticViews()
        styleAll()
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
        if !hasLaidOut { layoutAll(); hasLaidOut = true }

        // Round avatar after layout
        avatarImageView?.layer.cornerRadius = (avatarImageView?.bounds.width ?? 0) / 2
        avatarImageView?.clipsToBounds = true
        if let av = avatarImageView { ShopEffects.applyAvatarCosmetics(to: av) }
    }

    // MARK: - Background
    private func applyBackgroundGradient() {
        gradientLayer.colors = [
            UIColor(red: 10/255, green: 35/255, blue: 55/255, alpha: 1).cgColor,
            UIColor(red: 10/255, green: 70/255, blue: 85/255, alpha: 1).cgColor,
            UIColor(red:  5/255, green: 18/255, blue: 30/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Add programmatic views to hierarchy
    private func addProgrammaticViews() {
        [profileTitleLabel, usernameValueLabel, personalInfoHeader, progressHeader].forEach {
            view.addSubview($0)
        }
        // Settings button wired to storyboard action — hide it; settings accessible from tab
        settingsButton?.isHidden = true
    }

    // MARK: - Master layout (called once after first layout pass)
    private func layoutAll() {
        let safe    = view.safeAreaInsets.top
        let left: CGFloat = 28
        let width   = view.bounds.width - left * 2
        let centerX = view.bounds.midX
        var y: CGFloat = safe + 6

        // ── "Profile" title ──────────────────────────────────────────
        profileTitleLabel.frame = CGRect(x: left, y: y, width: width, height: 40)
        y += 46

        // ── Avatar ───────────────────────────────────────────────────
        let avSize: CGFloat = 110
        avatarImageView?.frame = CGRect(x: centerX - avSize / 2, y: y,
                                        width: avSize, height: avSize)
        y += avSize + 8

        // ── Change avatar button ──────────────────────────────────────
        let changeAvW: CGFloat = 180
        changePictureButton?.frame = CGRect(x: centerX - changeAvW / 2, y: y,
                                            width: changeAvW, height: 30)
        y += 42

        // ── "Personal Information" header ────────────────────────────
        personalInfoHeader.frame = CGRect(x: left, y: y, width: width, height: 22)
        y += 28

        // ── Username value ───────────────────────────────────────────
        usernameValueLabel.frame = CGRect(x: left, y: y, width: width, height: 22)
        y += 28

        // ── [Change username]   [Change password] — same row ─────────
        let halfW = (width - 16) / 2
        changeUsernameButton?.frame = CGRect(x: left,              y: y, width: halfW, height: 28)
        changePasswordButton?.frame = CGRect(x: left + halfW + 16, y: y, width: halfW, height: 28)
        y += 36

        // ── Level value ──────────────────────────────────────────────
        levelValueLabel?.frame = CGRect(x: left, y: y, width: width, height: 22)
        y += 38

        // ── "Progress summary" header ────────────────────────────────
        progressHeader.frame = CGRect(x: left, y: y, width: width, height: 22)
        y += 28

        // ── Stats ────────────────────────────────────────────────────
        for lbl in [questsCompletedLabel, streakLabel, unlockedIslandsLabel, totalXPLabel].compactMap({ $0 }) {
            lbl.frame = CGRect(x: left, y: y, width: width, height: 20)
            y += 26
        }
        y += 12

        // ── [World Progress]   [Rewards Shop] — same row ─────────────
        let navBtnH: CGFloat = 38
        worldProgressButton?.frame = CGRect(x: left,              y: y, width: halfW, height: navBtnH)
        rewardsShopButton?.frame   = CGRect(x: left + halfW + 16, y: y, width: halfW, height: navBtnH)
        y += navBtnH + 10

        // ── [Badges] ─────────────────────────────────────────────────
        badgesButton?.frame = CGRect(x: left, y: y, width: width, height: navBtnH)
        y += navBtnH + 16

        // ── [Log Out] ─────────────────────────────────────────────────
        let logW: CGFloat = 160
        logoutButton?.frame = CGRect(x: centerX - logW / 2, y: y, width: logW, height: navBtnH)
    }

    // MARK: - Styling
    private func styleAll() {
        let white92 = UIColor.white.withAlphaComponent(0.92)
        let white70 = UIColor.white.withAlphaComponent(0.70)

        // Title
        profileTitleLabel.text      = "Profile"
        profileTitleLabel.textColor = .white
        profileTitleLabel.font      = UIFont.systemFont(ofSize: 28, weight: .bold)
        profileTitleLabel.textAlignment = .center

        // Section headers
        for hdr in [personalInfoHeader, progressHeader] {
            hdr.textColor = .white
            hdr.font      = UIFont.systemFont(ofSize: 15, weight: .bold)
        }
        personalInfoHeader.text = "Personal Information"
        progressHeader.text     = "Progress summary"

        // Value labels
        usernameValueLabel.textColor = white92
        usernameValueLabel.font      = UIFont.systemFont(ofSize: 15, weight: .regular)

        [levelValueLabel, questsCompletedLabel, streakLabel,
         unlockedIslandsLabel, totalXPLabel].forEach {
            $0?.textColor = white92
            $0?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        }

        // "Change avatar" — plain text link
        styleLinkButton(changePictureButton, color: white70, size: 14)

        // "Change username" / "Change password" — subtle text links
        styleLinkButton(changeUsernameButton, color: white92, size: 14)
        styleLinkButton(changePasswordButton, color: white92, size: 14)

        // Navigation buttons — teal pill
        styleTealButton(worldProgressButton, title: "World Progress")
        styleTealButton(rewardsShopButton,   title: "Rewards Shop")
        styleTealButton(badgesButton,        title: "Badges")
        styleTealButton(logoutButton,        title: "Log Out")

        // Avatar shadow
        avatarImageView?.layer.shadowColor   = UIColor.systemPurple.cgColor
        avatarImageView?.layer.shadowRadius  = 14
        avatarImageView?.layer.shadowOpacity = 0.35
        avatarImageView?.layer.shadowOffset  = .zero
        avatarImageView?.layer.masksToBounds = false
    }

    private func styleLinkButton(_ button: UIButton?, color: UIColor, size: CGFloat) {
        guard let button else { return }
        if var cfg = button.configuration {
            cfg.baseForegroundColor = color
            cfg.background.backgroundColor = .clear
            button.configuration = cfg
        } else {
            button.setTitleColor(color, for: .normal)
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    private func styleTealButton(_ button: UIButton?, title: String) {
        guard let button else { return }
        let teal = UIColor(red: 0.25, green: 0.75, blue: 0.72, alpha: 1)
        if var cfg = button.configuration {
            cfg.baseBackgroundColor = teal
            cfg.baseForegroundColor = .white
            cfg.title = title
            cfg.cornerStyle = .capsule
            button.configuration = cfg
        } else {
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = teal
            button.layer.cornerRadius = 19
            button.clipsToBounds = true
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }

    // MARK: - Data refresh
    private func refreshUI() {
        let savedAvatar = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView?.image       = UIImage(named: savedAvatar)
        avatarImageView?.contentMode = .scaleAspectFill

        let xp = Session.shared.currentUser?.xp ?? 0

        usernameValueLabel.text     = Session.shared.currentUser?.username ?? "Guest"
        levelValueLabel?.text       = "Level \(Session.shared.currentUser?.level ?? 1)"
        questsCompletedLabel?.text  = "Quests completed: \(questsCompleted)"
        streakLabel?.text           = "Streak: \(streakDays) days"
        unlockedIslandsLabel?.text  = "Unlocked islands: \(unlockedIslands)/\(totalIslands)"
        totalXPLabel?.text          = "Total XP: \(xp)"
    }

    // MARK: - Navigation helper
    private func pushVC(id: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - IBActions
    @IBAction func didTapChangePicture(_ sender: UIButton) {
        pushVC(id: "AvatarStudioViewController")
    }

    @IBAction func didTapChangeUsername(_ sender: UIButton) {
        let alert = UIAlertController(title: "Change username", message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "New username"; $0.autocapitalizationType = .none }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            let newName = (alert.textFields?.first?.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            guard !newName.isEmpty, let user = Session.shared.currentUser else { return }
            let old = user.username

            Session.shared.currentUser = CurrentUser(username: newName, avatarIndex: user.avatarIndex,
                                                     level: user.level, xp: user.xp, age: user.age)
            Session.shared.save()
            self?.refreshUI()

            SupabaseManager.shared.changeUsername(oldUsername: old, newUsername: newName) { success in
                DispatchQueue.main.async {
                    if !success {
                        Session.shared.currentUser = user
                        Session.shared.save()
                        self?.refreshUI()
                        self?.showAlert("Error", "Username may already be taken.")
                    }
                }
            }
        })
        present(alert, animated: true)
    }

    @IBAction func didTapChangePassword(_ sender: UIButton) {
        guard let username = Session.shared.currentUser?.username else { return }
        let alert = UIAlertController(title: "Change Password", message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "New password";     $0.isSecureTextEntry = true }
        alert.addTextField { $0.placeholder = "Confirm password"; $0.isSecureTextEntry = true }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            let pw1 = alert.textFields?[0].text ?? ""
            let pw2 = alert.textFields?[1].text ?? ""
            guard pw1.count >= 4 else { self?.showAlert("Too short", "Password must be at least 4 characters."); return }
            guard pw1 == pw2      else { self?.showAlert("Mismatch", "Passwords don't match."); return }
            SupabaseManager.shared.changePassword(username: username, newPassword: pw1) { success in
                DispatchQueue.main.async {
                    self?.showAlert(success ? "Done ✅" : "Error",
                                   success ? "Password updated." : "Could not update password.")
                }
            }
        })
        present(alert, animated: true)
    }

    @IBAction func didTapLogout(_ sender: UIButton) {
        let alert = UIAlertController(title: "Log out?",
                                      message: "You'll need to log back in to continue.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Log out", style: .destructive) { _ in
            AuthState.isLoggedIn = false
            Session.shared.currentUser = nil
            // Clear local session cache
            ["session_username","session_xp","session_level","session_avatarIndex","session_age"]
                .forEach { UserDefaults.standard.removeObject(forKey: $0) }
            AppRouter.showLogin()
        })
        present(alert, animated: true)
    }

    @IBAction func didTapSettings(_ sender: UIButton) { pushVC(id: "SettingsViewController") }
    @IBAction func didTapWorldProgress(_ sender: UIButton) { pushVC(id: "WorldProgressViewController") }
    @IBAction func didTapBadges(_ sender: UIButton) { pushVC(id: "BadgesViewController") }
    @IBAction func didTapRewardsShop(_ sender: UIButton) { pushVC(id: "RewardsShopViewController") }
    @objc private func didTapXP() { pushVC(id: "RewardsShopViewController") }

    private func showAlert(_ title: String, _ message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }
}
