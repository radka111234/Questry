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

    // MARK: - Review helpers

    private struct ReviewItem {
        let subject: String       // "geography" | "history" | "english"
        let displayName: String
        let count: Int
    }

    private var reviewItems: [ReviewItem] {
        let srm = SpacedRepetitionManager.shared
        return [
            ReviewItem(subject: "geography", displayName: "🗺️ Geography", count: srm.totalMissed(subject: "geography")),
            ReviewItem(subject: "history",   displayName: "📜 History",   count: srm.totalMissed(subject: "history")),
            ReviewItem(subject: "english",   displayName: "✍️ English",   count: srm.totalMissed(subject: "english")),
        ].filter { $0.count > 0 }
    }

    // MARK: - Table
    func numberOfSections(in tableView: UITableView) -> Int { 3 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return dailyQuests.count }
        if section == 1 { return extraTodos.count }
        return reviewItems.isEmpty ? 1 : reviewItems.count  // always at least 1 row (empty state)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        42
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let titles = [t("quests.title"), t("quests.extra"), "🔁 Review Missed Questions"]
        label.text = section < titles.count ? titles[section] : ""
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

        // Review section
        if indexPath.section == 2 {
            if reviewItems.isEmpty { return makeReviewEmptyCell() }
            return makeReviewCell(for: indexPath)
        }

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

    private func makeReviewEmptyCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: IndexPath(row: 0, section: 2))
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.20, blue: 0.20, alpha: 0.50)
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor(red: 0.20, green: 0.90, blue: 0.75, alpha: 0.25).cgColor
        cell.contentView.addSubview(card)

        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "✅ No missed questions yet!\nPlay Geography, History or English puzzles — any wrong answers will appear here to review."
        lbl.textColor = UIColor.white.withAlphaComponent(0.55)
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        card.addSubview(lbl)

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 6),
            card.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -6),
            card.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),

            lbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            lbl.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18),
            lbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            lbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
        ])
        return cell
    }

    private func makeReviewCell(for indexPath: IndexPath) -> UITableViewCell {
        let review = reviewItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestCell", for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.30, blue: 0.30, alpha: 0.80)
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 1.5
        card.layer.borderColor = UIColor(red: 0.20, green: 0.90, blue: 0.75, alpha: 0.50).cgColor
        cell.contentView.addSubview(card)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = review.displayName
        titleLbl.textColor = .white
        titleLbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = "Practice \(review.count) question\(review.count == 1 ? "" : "s") you got wrong"
        subLbl.textColor = UIColor.white.withAlphaComponent(0.70)
        subLbl.font = UIFont.systemFont(ofSize: 12)

        let badge = UILabel()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.text = "\(review.count)"
        badge.textColor = .white
        badge.font = UIFont.boldSystemFont(ofSize: 16)
        badge.textAlignment = .center
        badge.backgroundColor = UIColor(red: 0.95, green: 0.35, blue: 0.25, alpha: 1)
        badge.layer.cornerRadius = 14
        badge.clipsToBounds = true

        let goBtn = UIButton(type: .system)
        goBtn.translatesAutoresizingMaskIntoConstraints = false
        goBtn.setTitle("Review →", for: .normal)
        goBtn.setTitleColor(.white, for: .normal)
        goBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        goBtn.backgroundColor = UIColor(red: 0.10, green: 0.70, blue: 0.60, alpha: 0.9)
        goBtn.layer.cornerRadius = 12
        goBtn.isUserInteractionEnabled = false  // cell tap handles navigation

        for v in [titleLbl, subLbl, badge, goBtn] { card.addSubview(v) }
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 6),
            card.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -6),
            card.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 14),
            card.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -14),
            card.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),

            badge.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
            badge.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
            badge.widthAnchor.constraint(equalToConstant: 28),
            badge.heightAnchor.constraint(equalToConstant: 28),

            titleLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            titleLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: badge.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 4),
            subLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            subLbl.trailingAnchor.constraint(equalTo: goBtn.leadingAnchor, constant: -8),

            goBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
            goBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
            goBtn.widthAnchor.constraint(equalToConstant: 90),
            goBtn.heightAnchor.constraint(equalToConstant: 28),
            subLbl.bottomAnchor.constraint(lessThanOrEqualTo: card.bottomAnchor, constant: -12),
        ])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // Review section — launch puzzle VC in review mode
        if indexPath.section == 2 {
            guard !reviewItems.isEmpty else { return }
            let review = reviewItems[indexPath.row]
            switch review.subject {
            case "geography":
                let vc = GeographyPuzzleViewController()
                vc.isReviewMode = true
                navigationController?.pushViewController(vc, animated: true)
            case "history":
                let vc = HistoryPuzzleViewController()
                vc.isReviewMode = true
                navigationController?.pushViewController(vc, animated: true)
            case "english":
                let vc = EnglishPuzzleViewController()
                vc.isReviewMode = true
                navigationController?.pushViewController(vc, animated: true)
            default: break
            }
            return
        }

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
