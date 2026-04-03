import UIKit
import SafariServices

final class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - Background
    private let gradientLayer = CAGradientLayer()

    // MARK: - Rows
    private enum Row {
        case preferences
        case profile
        case notifications
        case privacy
        case subscription
        case helpCenter
        case feedback
        case termsOfService
        case privacyPolicy
        case acknowledgements
        case logout

        var title: String {
            switch self {
            case .preferences: return "Preferences"
            case .profile: return "Profile"
            case .notifications: return "Notifications"
            case .privacy: return "Privacy"
            case .subscription: return "Subscription"
            case .helpCenter: return "Help Center"
            case .feedback: return "Your Feedback"
            case .termsOfService: return "Terms of Service"
            case .privacyPolicy: return "Privacy Policy"
            case .acknowledgements: return "Acknowledgements"
            case .logout: return "Log out"
            }
        }

        var showsChevron: Bool {
            switch self {
            case .termsOfService, .privacyPolicy, .logout:
                return false
            default:
                return true
            }
        }

        var isDestructive: Bool { self == .logout }
    }

    private struct Section {
        let title: String
        let rows: [Row]
    }

    private let sections: [Section] = [
        .init(title: "Preferences", rows: [.preferences, .notifications, .subscription]),
        .init(title: "Profile", rows: [.profile]),
        .init(title: "Privacy & Legal", rows: [.privacy, .termsOfService, .privacyPolicy]),
        .init(title: "Support", rows: [.helpCenter, .feedback]),
        .init(title: "About", rows: [.acknowledgements]),
        .init(title: "Account", rows: [.logout])
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Show nav bar so we get a back button on pushed screens
        navigationController?.setNavigationBarHidden(false, animated: false)

        setupGradient()
        setupTable()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds

        // Keep header height stable
        if let header = tableView.tableHeaderView {
            let targetSize = CGSize(width: tableView.bounds.width,
                                    height: UIView.layoutFittingCompressedSize.height)
            let height = header.systemLayoutSizeFitting(targetSize).height
            if header.frame.height != height && height > 0 {
                header.frame.size.height = height
                tableView.tableHeaderView = header
            }
        }
    }

    // MARK: - Setup
    private func setupGradient() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 10/255, green: 35/255, blue: 55/255, alpha: 1).cgColor,
            UIColor(red: 10/255, green: 70/255, blue: 85/255, alpha: 1).cgColor,
            UIColor(red: 5/255,  green: 18/255, blue: 30/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.backgroundColor = .clear
        tableView.separatorColor = UIColor.white.withAlphaComponent(0.10)

        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = true

        // space above first section
        tableView.tableHeaderView = makeTopSpacer(height: 60)

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 18
        }

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func makeTopSpacer(height: CGFloat) -> UIView {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: height))
        spacer.backgroundColor = .clear
        return spacer
    }

    // MARK: - Navigation helper
    private func open(_ storyboardID: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: storyboardID)
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int { sections.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = sections[section].title.uppercased()
        label.textColor = UIColor.white.withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)

        let container = UIView()
        container.backgroundColor = .clear

        label.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -6),
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8)
        ])

        return container
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 34 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = row.title
        content.textProperties.color = row.isDestructive ? .systemRed : UIColor.white.withAlphaComponent(0.92)
        cell.contentConfiguration = content

        cell.accessoryType = row.showsChevron ? .disclosureIndicator : .none
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        cell.selectionStyle = .default

        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = sections[indexPath.section].rows[indexPath.row]

        switch row {
        case .preferences:
            open("PreferencesViewController")

        case .profile:
            open("ProfileViewController")

        case .notifications:
            open("NotificationsViewController")

        case .privacy:
            open("PrivacyViewController")

        case .subscription:
            open("SubscriptionViewController")

        case .helpCenter:
            open("HelpCenterViewController")

        case .feedback:
            open("FeedbackViewController")

        case .acknowledgements:
            open("AcknowledgementsViewController")

        case .termsOfService:
            open("TermsViewController")
            
        case .privacyPolicy:
            open("PrivacyPolicyViewController")

        case .logout:
            confirmLogout()
        }
    }

    // MARK: - Helpers
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        present(SFSafariViewController(url: url), animated: true)
    }

    private func confirmLogout() {
        let a = UIAlertController(title: "Log out",
                                  message: "Are you sure you want to log out?",
                                  preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        a.addAction(UIAlertAction(title: "Log out", style: .destructive) { _ in
            AuthState.isLoggedIn = false
            Session.shared.currentUser = nil
            AppRouter.showLogin()
        })
        present(a, animated: true)
    }
}
