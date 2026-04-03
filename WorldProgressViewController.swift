import UIKit

// MARK: - Model
struct WorldProgressItem {
    let title: String
    let iconName: String
    let level: Int
    let xp: Int
    let progress: Float   // 0.0 - 1.0
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
        func worldXP(_ key: String) -> Int { d.integer(forKey: key) }
        func worldLevel(xp: Int, topics: Int) -> Int {
            guard xp > 0 || topics > 0 else { return 0 }
            return max(1, (xp / 100) + 1)
        }
        func progress(done: Int, total: Int) -> Float {
            guard total > 0 else { return 0 }
            return min(Float(done) / Float(total), 1.0)
        }

        let mathXP  = worldXP("math_world_total_xp"); let mathDone = topicsDone("math_completed_topic_ids")
        let engXP   = worldXP("eng_world_total_xp");  let engDone  = topicsDone("eng_completed_topic_ids")
        let geoXP   = worldXP("geo_world_total_xp");  let geoDone  = topicsDone("geo_completed_topic_ids")
        let sciXP   = worldXP("sci_world_total_xp");  let sciDone  = topicsDone("sci_completed_topic_ids")
        let hisXP   = worldXP("his_world_total_xp");  let hisDone  = topicsDone("his_completed_topic_ids")

        let mathTotal = max(MathGameData.topics.count, 1)
        let engTotal  = max(EnglishGameData.topics.count, 1)
        let geoTotal  = max(GeographyGameData.topics.count, 1)
        let sciTotal  = max(ScienceGameData.topics.count, 1)
        let hisTotal  = max(HistoryGameData.topics.count, 1)

        items = [
            .init(title: "Math",      iconName: "icon_math",
                  level: worldLevel(xp: mathXP, topics: mathDone), xp: mathXP,
                  progress: progress(done: mathDone, total: mathTotal)),
            .init(title: "English",   iconName: "icon_language",
                  level: worldLevel(xp: engXP,  topics: engDone),  xp: engXP,
                  progress: progress(done: engDone,  total: engTotal)),
            .init(title: "Geography", iconName: "icon_geography",
                  level: worldLevel(xp: geoXP,  topics: geoDone),  xp: geoXP,
                  progress: progress(done: geoDone,  total: geoTotal)),
            .init(title: "Science",   iconName: "icon_science",
                  level: worldLevel(xp: sciXP,  topics: sciDone),  xp: sciXP,
                  progress: progress(done: sciDone,  total: sciTotal)),
            .init(title: "History",   iconName: "icon_history",
                  level: worldLevel(xp: hisXP,  topics: hisDone),  xp: hisXP,
                  progress: progress(done: hisDone,  total: hisTotal)),
        ]

        tableView.reloadData()
    }

    private func refreshHeader() {
        let totalXP = items.map(\.xp).reduce(0, +)

        // If you want to reflect the user's global level, use Session.shared.currentUser
        let userLevel = Session.shared.currentUser?.level ?? 1

        // Count worlds with level > 0 as "unlocked"
        let unlockedCount = items.filter { $0.level > 0 }.count

        totalXPLabel.text = "Total XP: \(totalXP)"
        levelLabel.text = "Level: \(userLevel)"
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

        // Style
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        cell.selectionStyle = .none

        cell.titleLabel.textColor = .white
        cell.subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.75)

        return cell
    }
}
