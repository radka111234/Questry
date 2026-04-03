import UIKit

final class LanguagePickerViewController: UIViewController {

    enum PickerMode { case appLanguage, teachingLanguage }

    var mode: PickerMode = .appLanguage
    var onLanguageSelected: ((AppLanguage) -> Void)?

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let subtitleLabel = UILabel()
    private let languages = AppLanguage.allCases

    private var selectedLanguage: AppLanguage {
        switch mode {
        case .appLanguage:      return LanguageManager.shared.currentLanguage
        case .teachingLanguage: return LanguageManager.shared.englishTeachingLanguage
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        setupSubtitleLabel()
        setupTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Keep gradient covering the full view after any layout changes
        view.layer.sublayers?
            .filter { $0 is CAGradientLayer }
            .forEach { $0.frame = view.bounds }
    }

    // MARK: - Setup

    private func setupGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 0.06, green: 0.04, blue: 0.18, alpha: 1.0).cgColor,
            UIColor(red: 0.12, green: 0.06, blue: 0.30, alpha: 1.0).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }

    private func setupNavigationBar() {
        switch mode {
        case .appLanguage:
            title = t("lang_picker_title_app")
        case .teachingLanguage:
            let lang = LanguageManager.shared.currentLanguage
            title = t("lang_picker_title_teaching") + " \(lang.flag)"
        }

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }

    private func setupSubtitleLabel() {
        guard mode == .teachingLanguage else { return }

        subtitleLabel.text = t("lang_picker_teaching_subtitle")
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(LanguageCell.self, forCellReuseIdentifier: LanguageCell.reuseID)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.rowHeight  = 76
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 20, right: 0)
        view.addSubview(tableView)

        let topConstant: CGFloat = (mode == .teachingLanguage) ? 56 : 12

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource / Delegate

extension LanguagePickerViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageCell.reuseID, for: indexPath) as! LanguageCell
        let lang = languages[indexPath.row]
        cell.configure(with: lang, isSelected: lang == selectedLanguage)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let chosen = languages[indexPath.row]

        switch mode {
        case .appLanguage:      LanguageManager.shared.setLanguage(chosen)
        case .teachingLanguage: LanguageManager.shared.setEnglishTeachingLanguage(chosen)
        }

        tableView.reloadData()
        onLanguageSelected?(chosen)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - LanguageCell

private final class LanguageCell: UITableViewCell {

    static let reuseID = "LanguageCell"

    private let flagLabel      = UILabel()
    private let nativeLabel    = UILabel()
    private let englishLabel   = UILabel()
    private let checkImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none

        // Card container
        let card = UIView()
        card.backgroundColor = UIColor.white.withAlphaComponent(0.10)
        card.layer.cornerRadius = 18
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        card.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(card)

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        // Flag
        flagLabel.font = UIFont.systemFont(ofSize: 32)
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(flagLabel)

        // Native name (bold)
        nativeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nativeLabel.textColor = .white
        nativeLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(nativeLabel)

        // English name (subtitle)
        englishLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        englishLabel.textColor = UIColor.white.withAlphaComponent(0.55)
        englishLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(englishLabel)

        // Checkmark circle
        let cfg = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
        checkImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: cfg)
        checkImageView.tintColor = UIColor(red: 0.42, green: 0.85, blue: 0.45, alpha: 1.0)
        checkImageView.contentMode = .scaleAspectFit
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(checkImageView)

        NSLayoutConstraint.activate([
            flagLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            flagLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            flagLabel.widthAnchor.constraint(equalToConstant: 40),

            nativeLabel.leadingAnchor.constraint(equalTo: flagLabel.trailingAnchor, constant: 12),
            nativeLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            nativeLabel.trailingAnchor.constraint(equalTo: checkImageView.leadingAnchor, constant: -12),

            englishLabel.leadingAnchor.constraint(equalTo: nativeLabel.leadingAnchor),
            englishLabel.topAnchor.constraint(equalTo: nativeLabel.bottomAnchor, constant: 3),
            englishLabel.trailingAnchor.constraint(equalTo: nativeLabel.trailingAnchor),

            checkImageView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            checkImageView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            checkImageView.widthAnchor.constraint(equalToConstant: 26),
            checkImageView.heightAnchor.constraint(equalToConstant: 26)
        ])
    }

    func configure(with language: AppLanguage, isSelected: Bool) {
        flagLabel.text    = language.flag
        nativeLabel.text  = language.displayName
        englishLabel.text = language.englishName
        checkImageView.isHidden = !isSelected

        // Highlight card when selected
        if let card = contentView.subviews.first {
            card.backgroundColor = isSelected
                ? UIColor(red: 0.42, green: 0.22, blue: 0.90, alpha: 0.35)
                : UIColor.white.withAlphaComponent(0.10)
            card.layer.borderColor = isSelected
                ? UIColor(red: 0.72, green: 0.52, blue: 1.0, alpha: 0.70).cgColor
                : UIColor.white.withAlphaComponent(0.15).cgColor
        }

        if language.isRTL {
            nativeLabel.textAlignment  = .right
            englishLabel.textAlignment = .right
        } else {
            nativeLabel.textAlignment  = .left
            englishLabel.textAlignment = .left
        }
    }
}
