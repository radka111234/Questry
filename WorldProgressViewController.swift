import UIKit

// MARK: - Model
struct WorldProgressItem {
    let title: String
    let iconName: String
    let topicsDone: Int
    let topicsTotal: Int
    let progress: Float   // 0.0 - 1.0
    let isUnlocked: Bool
}

// MARK: - VC
final class WorldProgressViewController: GradientBackgroundViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var totalXPLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var worldsUnlockedLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private var items: [WorldProgressItem] = []

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DailyQuestManager.shared.recordProgressView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        setupLabels()
        setupTable()
        loadData()
        refreshHeader()
        
        tableView.rowHeight = 86
        tableView.estimatedRowHeight = 86
        tableView.separatorStyle = .none
    }

    private func setupLabels() {
        totalXPLabel.textColor = UIColor.white.withAlphaComponent(0.92)
        worldsUnlockedLabel.textColor = UIColor.white.withAlphaComponent(0.92)
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = UIColor.white.withAlphaComponent(0.10)

        // If you used a storyboard prototype cell:
        // - Set its Identifier to "ProgressCell"
        // - Set its Class to WorldProgressCell
        // - Connect outlets (iconImageView, titleLabel, subtitleLabel, progressView)
    }

    private func loadData() {
        let d = UserDefaults.standard

        func topicsDone(_ key: String) -> Int {
            (d.array(forKey: key) as? [Int] ?? []).count
        }
        func pct(done: Int, total: Int) -> Float {
            guard total > 0 else { return 0 }
            return min(Float(done) / Float(total), 1.0)
        }

        let mathDone = topicsDone("math_completed_topic_ids")
        let engDone  = topicsDone("eng_completed_topic_ids")
        let geoDone  = topicsDone("geo_completed_topic_ids")
        let sciDone  = topicsDone("sci_completed_topic_ids")
        let hisDone  = topicsDone("his_completed_topic_ids")

        let mathTotal = max(MathGameData.topics.count, 1)
        let engTotal  = max(EnglishGameData.topics.count, 1)
        let geoTotal  = max(GeographyGameData.topics.count, 1)
        let sciTotal  = max(ScienceGameData.topics.count, 1)
        let hisTotal  = max(HistoryGameData.topics.count, 1)

        // Science + History unlock after completing ≥1 core topic (same as home map)
        let coreUnlocked = mathDone + engDone + geoDone >= 1

        items = [
            .init(title: "Math",      iconName: "icon_math",
                  topicsDone: mathDone, topicsTotal: mathTotal,
                  progress: pct(done: mathDone, total: mathTotal), isUnlocked: true),
            .init(title: "English",   iconName: "icon_language",
                  topicsDone: engDone,  topicsTotal: engTotal,
                  progress: pct(done: engDone,  total: engTotal),  isUnlocked: true),
            .init(title: "Geography", iconName: "icon_geography",
                  topicsDone: geoDone,  topicsTotal: geoTotal,
                  progress: pct(done: geoDone,  total: geoTotal),  isUnlocked: true),
            .init(title: "Science",   iconName: "icon_science",
                  topicsDone: sciDone,  topicsTotal: sciTotal,
                  progress: pct(done: sciDone,  total: sciTotal),  isUnlocked: coreUnlocked),
            .init(title: "History",   iconName: "icon_history",
                  topicsDone: hisDone,  topicsTotal: hisTotal,
                  progress: pct(done: hisDone,  total: hisTotal),  isUnlocked: coreUnlocked),
        ]

        tableView.reloadData()
    }

    private func refreshHeader() {
        // Use the authoritative session XP (same value shown everywhere in the app)
        let totalXP   = Session.shared.currentUser?.xp    ?? 0
        let userLevel = Session.shared.currentUser?.level ?? 1

        // Mirror the same unlock logic used on the home map:
        // Math / English / Geography are always accessible (3).
        // Science + History unlock once the player completes ≥ 1 topic in any core world.
        let d = UserDefaults.standard
        let mathDone = (d.array(forKey: "math_completed_topic_ids") as? [Int] ?? []).count
        let engDone  = (d.array(forKey: "eng_completed_topic_ids")  as? [Int] ?? []).count
        let geoDone  = (d.array(forKey: "geo_completed_topic_ids")  as? [Int] ?? []).count
        let coreUnlocked = mathDone + engDone + geoDone >= 1
        let unlockedCount = 3 + (coreUnlocked ? 2 : 0)

        totalXPLabel.text     = "Total XP: \(totalXP)"
        levelLabel.text       = "Level: \(userLevel)"
        worldsUnlockedLabel.text = "Worlds Unlocked: \(unlockedCount)"
    }

    // MARK: - Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell", for: indexPath) as? WorldProgressCell
        else {
            return UITableViewCell()
        }

        let item = items[indexPath.row]
        cell.configure(with: item)

        cell.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        cell.selectionStyle = .none
        // Title/subtitle colours — subtitleLabel alpha handled per-item inside configure()
        cell.titleLabel.textColor = item.isUnlocked ? .white : UIColor.white.withAlphaComponent(0.5)
        cell.subtitleLabel.textColor = item.isUnlocked
            ? UIColor.white.withAlphaComponent(0.75)
            : UIColor.white.withAlphaComponent(0.4)

        return cell
    }
}
