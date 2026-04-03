import UIKit

final class HelpCenterViewController: GradientBackgroundViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    private struct FAQ {
        let q: String
        let a: String
    }

    private let faqs: [FAQ] = [
        .init(q: "How do quests work?",
              a: "Pick an island, complete the questions, and earn XP. More XP increases your level."),
        .init(q: "How do I earn XP?",
              a: "You earn XP by completing quests and answering questions correctly."),
        .init(q: "Why are some islands locked?",
              a: "Locked islands unlock as you progress. Complete quests to level up."),
        .init(q: "How do I change my avatar?",
              a: "Go to Settings → Profile to choose a new avatar."),
        .init(q: "I forgot my password - what can I do?",
              a: "For now, contact support. Password reset will be added later."),
        .init(q: "How do I contact support?",
              a: "Go to Settings → Your Feedback and send us a message.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
    }

    // MARK: - Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        faqs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faq = faqs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = faq.q
        content.textProperties.color = .white
        content.secondaryText = faq.a
        content.secondaryTextProperties.color = UIColor.white.withAlphaComponent(0.75)
        content.secondaryTextProperties.numberOfLines = 0

        cell.contentConfiguration = content
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        cell.selectionStyle = .none

        return cell
    }
}
