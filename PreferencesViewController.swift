import UIKit

final class PreferencesViewController: GradientBackgroundViewController {

    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var hapticsSwitch: UISwitch!

    private enum K {
        static let sound   = "pref_sound"
        static let music   = "pref_music"
        static let haptics = "pref_haptics"
    }

    // MARK: - Language rows table

    private let languageTableView = UITableView(frame: .zero, style: .plain)
    private var langTableTopConstraint: NSLayoutConstraint?
    private let languageRows: [(emoji: String, titleKey: String, mode: LanguagePickerViewController.PickerMode)] = [
        ("🌐", "pref_app_language",      .appLanguage),
        ("📖", "pref_teaching_language", .teachingLanguage)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        // Default ON the first time
        if UserDefaults.standard.object(forKey: K.sound) == nil {
            UserDefaults.standard.set(true, forKey: K.sound)
            UserDefaults.standard.set(true, forKey: K.music)
            UserDefaults.standard.set(true, forKey: K.haptics)
        }

        soundSwitch.isOn   = UserDefaults.standard.bool(forKey: K.sound)
        musicSwitch.isOn   = UserDefaults.standard.bool(forKey: K.music)
        hapticsSwitch.isOn = UserDefaults.standard.bool(forKey: K.haptics)

        setupLanguageTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        languageTableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Position language table directly below the haptics switch row
        let hapticsFrame = hapticsSwitch.convert(hapticsSwitch.bounds, to: view)
        langTableTopConstraint?.constant = hapticsFrame.maxY + 28
    }

    // MARK: - Language table setup

    private func setupLanguageTable() {
        languageTableView.translatesAutoresizingMaskIntoConstraints = false
        languageTableView.backgroundColor = .clear
        languageTableView.separatorColor = UIColor.white.withAlphaComponent(0.12)
        languageTableView.isScrollEnabled = false
        languageTableView.dataSource = self
        languageTableView.delegate   = self
        languageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "LangCell")
        view.addSubview(languageTableView)

        // Top constraint is updated in viewDidLayoutSubviews to sit just below the haptics switch.
        let topC = languageTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 320)
        langTableTopConstraint = topC
        NSLayoutConstraint.activate([
            languageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            languageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topC,
            languageTableView.heightAnchor.constraint(equalToConstant: CGFloat(languageRows.count) * 60 + 60)
        ])
    }

    // MARK: - IBActions

    @IBAction func didChangeSound(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: K.sound)
    }

    @IBAction func didChangeMusic(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: K.music)
    }

    @IBAction func didChangeHaptics(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: K.haptics)
    }
}

// MARK: - UITableViewDataSource / Delegate

extension PreferencesViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .clear
        let label = UILabel()
        let sectionTitle = t("pref_section_language").uppercased()
        label.attributedText = NSAttributedString(
            string: sectionTitle,
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 12),
                .foregroundColor: UIColor.white.withAlphaComponent(0.50),
                .kern: 1.2
            ]
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 4),
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 36 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languageRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LangCell", for: indexPath)
        let row  = languageRows[indexPath.row]

        cell.backgroundColor = UIColor.white.withAlphaComponent(0.10)
        cell.layer.cornerRadius = 16
        cell.clipsToBounds = true
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        let detailText: String
        switch row.mode {
        case .appLanguage:
            detailText = LanguageManager.shared.currentLanguage.displayName
        case .teachingLanguage:
            detailText = LanguageManager.shared.englishTeachingLanguage.displayName
        }

        cell.textLabel?.text = "\(row.emoji)  \(t(row.titleKey))"
        cell.accessoryType   = .disclosureIndicator
        cell.tintColor       = UIColor.white.withAlphaComponent(0.55)

        // Detail label (right-aligned value)
        cell.contentView.viewWithTag(888)?.removeFromSuperview()
        let detailLabel = UILabel()
        detailLabel.tag = 888
        detailLabel.text = detailText
        detailLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailLabel.textColor = UIColor.white.withAlphaComponent(0.55)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -36),
            detailLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = languageRows[indexPath.row]
        let picker = LanguagePickerViewController()
        picker.mode = row.mode
        navigationController?.pushViewController(picker, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 60 }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { 0 }
}
