import UIKit

struct QuestItem {
    let title: String
    let subtitle: String
    let reward: String
    let isCompleted: Bool
    let action: QuestAction
}

enum QuestAction {
    case none
    case avatarStudio
    case worldProgress
    case mainWorld
    case mathWorld
    case scienceWorld
    case geoWorld
    case englishWorld
    case historyWorld
}

final class DailyQuestsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Header outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!

    // MARK: - Table outlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Streak badge (added programmatically below XP bar)
    private let streakBadge = UILabel()

    // MARK: - Background
    private let gradientLayer = CAGradientLayer()

    // Returns a day-specific lesson quest so each weekday features a different subject.
    private var todayLessonQuest: QuestItem {
        let mgr = DailyQuestManager.shared
        // weekday: 1=Sun, 2=Mon, 3=Tue, 4=Wed, 5=Thu, 6=Fri, 7=Sat
        let weekday = Calendar.current.component(.weekday, from: Date())
        switch weekday {
        case 2: return .init(title: "Complete 1 Math lesson",
                             subtitle: "Finish a quest in Math island",
                             reward: "+20 XP", isCompleted: mgr.isMathDone, action: .mathWorld)
        case 3: return .init(title: "Complete 1 English lesson",
                             subtitle: "Finish a quest in English island",
                             reward: "+20 XP", isCompleted: mgr.isEngDone, action: .englishWorld)
        case 4: return .init(title: "Complete 1 Geography lesson",
                             subtitle: "Finish a quest in Geography island",
                             reward: "+20 XP", isCompleted: mgr.isGeoDone, action: .geoWorld)
        case 5: return .init(title: "Complete 1 Science lesson",
                             subtitle: "Finish a quest in Science island",
                             reward: "+20 XP", isCompleted: mgr.isSciDone, action: .scienceWorld)
        case 6: return .init(title: "Complete 1 History lesson",
                             subtitle: "Finish a quest in History island",
                             reward: "+20 XP", isCompleted: mgr.isHisDone, action: .historyWorld)
        default: // Weekend  -  any two subjects count
            let done = [mgr.isMathDone, mgr.isEngDone, mgr.isGeoDone, mgr.isSciDone, mgr.isHisDone].filter { $0 }.count >= 2
            return .init(title: "Complete 2 lessons today",
                         subtitle: "Play any 2 subjects this weekend",
                         reward: "+30 XP", isCompleted: done, action: .mainWorld)
        }
    }

    private var dailyQuests: [QuestItem] {
        let mgr = DailyQuestManager.shared
        return [
            todayLessonQuest,
            .init(
                title: "Answer 5 questions correctly",
                subtitle: "Today: \(mgr.correctAnswers)/5 answered",
                reward: "+15 XP",
                isCompleted: mgr.isAnswersDone,
                action: .mainWorld
            ),
            .init(
                title: "Log in today",
                subtitle: "Keep your streak alive 🔥",
                reward: "+10 XP",
                isCompleted: mgr.isLoginDone,
                action: .none
            )
        ]
    }

    private var extraTodos: [QuestItem] {
        let mgr = DailyQuestManager.shared
        // Rotate the bonus todo by day-of-month so it changes regularly
        let day = Calendar.current.component(.day, from: Date())
        let bonusTodo: QuestItem
        switch day % 4 {
        case 0: bonusTodo = .init(title: "Change your avatar",
                                  subtitle: "Visit Avatar Studio",
                                  reward: "+5 XP", isCompleted: mgr.isAvatarDone, action: .avatarStudio)
        case 1: bonusTodo = .init(title: "Visit the Rewards Shop",
                                  subtitle: "Spend your hard-earned XP",
                                  reward: "+5 XP", isCompleted: false, action: .mainWorld)
        case 2: bonusTodo = .init(title: "Change your avatar",
                                  subtitle: "Try a new look today",
                                  reward: "+5 XP", isCompleted: mgr.isAvatarDone, action: .avatarStudio)
        default: bonusTodo = .init(title: "Complete a bonus quest",
                                   subtitle: "Play any subject for extra XP",
                                   reward: "+5 XP", isCompleted: false, action: .mainWorld)
        }
        return [
            bonusTodo,
            .init(
                title: "Check world progress",
                subtitle: "Open your progress screen",
                reward: "+5 XP",
                isCompleted: mgr.isProgressDone,
                action: .worldProgress
            ),
            .init(
                title: "Unlock next island",
                subtitle: "Pass a topic exam to unlock",
                reward: "+30 XP",
                isCompleted: mgr.isUnlockDone,
                action: .mainWorld
            )
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyBackground()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuestCell")

        styleHeader()
        refreshHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DailyQuestManager.shared.resetIfNewDay()
        refreshHeader()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DailyQuestManager.shared.recordLogin()
        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
        ShopEffects.applyAvatarCosmetics(to: avatarImageView)
    }

    // MARK: - Background
    private func applyBackground() {
        gradientLayer.colors = [
            UIColor(red: 70/255, green: 48/255, blue: 20/255, alpha: 1).cgColor,
            UIColor(red: 120/255, green: 82/255, blue: 38/255, alpha: 1).cgColor,
            UIColor(red: 85/255, green: 58/255, blue: 27/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Header
    private func styleHeader() {
        usernameLabel.textColor = .white
        levelLabel.textColor = .white
        xpLabel.textColor = .white

        xpProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.18)
        xpProgressView.progressTintColor = UIColor.systemYellow

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapXP))
        xpLabel.isUserInteractionEnabled = true
        xpLabel.addGestureRecognizer(tap)

        // Streak badge pill
        streakBadge.font = UIFont.boldSystemFont(ofSize: 14)
        streakBadge.textColor = .white
        streakBadge.textAlignment = .center
        streakBadge.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1.0)
        streakBadge.layer.cornerRadius = 12
        streakBadge.clipsToBounds = true
        streakBadge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(streakBadge)

        NSLayoutConstraint.activate([
            streakBadge.topAnchor.constraint(equalTo: xpProgressView.bottomAnchor, constant: 8),
            streakBadge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            streakBadge.heightAnchor.constraint(equalToConstant: 28)
        ])
        view.bringSubviewToFront(streakBadge)
        tableView.contentInset = UIEdgeInsets(top: 36, left: 0, bottom: 0, right: 0)
    }

    @objc private func didTapXP() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RewardsShopViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        guard let user = Session.shared.currentUser else {
            usernameLabel.text = "Guest"
            levelLabel.text = "Level 1"
            xpLabel.text = ShopEffects.formatXPLabel("0 XP")
            xpProgressView.progress = 0
            streakBadge.isHidden = true
            return
        }

        usernameLabel.text = user.username
        levelLabel.text = "Level \(user.level)"
        xpLabel.text = ShopEffects.formatXPLabel("\(user.xp) XP")

        let xpPerLevel: Float = 500
        xpProgressView.progress = Float(user.xp % 500) / xpPerLevel

        let streak = StreakManager.shared.currentStreak
        streakBadge.text = "  🔥 \(streak) day streak  "
        streakBadge.isHidden = streak == 0
    }

    // MARK: - Table
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? dailyQuests.count : extraTodos.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        42
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = section == 0 ? t("quests.title") : t("quests.extra")
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        let container = UIView()
        container.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4)
        ])

        return container
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = indexPath.section == 0 ? dailyQuests[indexPath.row] : extraTodos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath)

        cell.backgroundColor = .clear
        cell.selectionStyle = .none

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.14).cgColor
        cell.contentView.addSubview(card)

        let iconView = UIView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.backgroundColor = item.isCompleted ? UIColor.systemGreen : UIColor.systemOrange
        iconView.layer.cornerRadius = 10

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = item.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.8

        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = item.subtitle
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.75)
        subtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        subtitleLabel.numberOfLines = 0

        let rewardLabel = UILabel()
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false
        rewardLabel.text = item.reward
        rewardLabel.textColor = UIColor.systemYellow
        rewardLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        rewardLabel.textAlignment = .right

        let actionButton = UIButton(type: .system)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle(item.isCompleted ? "✅ Play again" : "Go →", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        actionButton.backgroundColor = item.isCompleted
            ? UIColor.systemGreen.withAlphaComponent(0.6)
            : UIColor.systemTeal.withAlphaComponent(0.9)
        actionButton.layer.cornerRadius = 12
        actionButton.isUserInteractionEnabled = true   // allow tap to replay

        card.addSubview(iconView)
        card.addSubview(titleLabel)
        card.addSubview(subtitleLabel)
        card.addSubview(rewardLabel)
        card.addSubview(actionButton)

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 6),
            card.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -6),
            card.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 14),
            card.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -14),
            card.heightAnchor.constraint(greaterThanOrEqualToConstant: 90),

            iconView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 12),
            iconView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: rewardLabel.leadingAnchor, constant: -8),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -8),

            rewardLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
            rewardLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
            rewardLabel.widthAnchor.constraint(equalToConstant: 60),

            actionButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
            actionButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
            actionButton.widthAnchor.constraint(equalToConstant: 100),
            actionButton.heightAnchor.constraint(equalToConstant: 28),
            subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: card.bottomAnchor, constant: -12)
        ])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = indexPath.section == 0 ? dailyQuests[indexPath.row] : extraTodos[indexPath.row]

        switch item.action {
        case .avatarStudio:
            pushVC(id: "AvatarStudioViewController")

        case .worldProgress:
            pushVC(id: "WorldProgressViewController")

        case .mainWorld:
            tabBarController?.selectedIndex = 0

        case .mathWorld:
            pushVC(id: "MathViewController")

        case .scienceWorld:
            pushVC(id: "ScienceViewController")

        case .geoWorld:
            pushVC(id: "GeographyViewController")

        case .englishWorld:
            pushVC(id: "EnglishViewController")

        case .historyWorld:
            pushVC(id: "HistoryViewController")

        case .none:
            let a = UIAlertController(title: item.title, message: "This quest is already completed.", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "OK", style: .default))
            present(a, animated: true)
        }
    }

    private func pushVC(id: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
