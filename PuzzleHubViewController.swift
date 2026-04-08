import UIKit

// MARK: - PuzzleHubViewController
// Generic hub that lists puzzle types for a world and launches the correct puzzle VC.

final class PuzzleHubViewController: UIViewController {

    enum World { case geography, history, english }
    var world: World = .geography

    private let gradLayer  = CAGradientLayer()
    private let backBtn    = UIButton(type: .system)
    private let titleLabel = UILabel()
    private let stackView  = UIStackView()

    // World colours
    private var accentColor: UIColor {
        switch world {
        case .geography: return UIColor(red: 0.08, green: 0.28, blue: 0.62, alpha: 1)
        case .history:   return UIColor(red: 0.45, green: 0.25, blue: 0.08, alpha: 1)
        case .english:   return UIColor(red: 0.06, green: 0.38, blue: 0.42, alpha: 1)
        }
    }
    private var gradColors: [CGColor] {
        switch world {
        case .geography: return [UIColor(red: 0.04, green: 0.14, blue: 0.34, alpha: 1).cgColor, UIColor(red: 0.08, green: 0.22, blue: 0.48, alpha: 1).cgColor]
        case .history:   return [UIColor(red: 0.18, green: 0.10, blue: 0.04, alpha: 1).cgColor, UIColor(red: 0.30, green: 0.18, blue: 0.06, alpha: 1).cgColor]
        case .english:   return [UIColor(red: 0.03, green: 0.16, blue: 0.20, alpha: 1).cgColor, UIColor(red: 0.06, green: 0.28, blue: 0.34, alpha: 1).cgColor]
        }
    }
    private var worldTitle: String {
        switch world {
        case .geography: return "🗺️ Geo Puzzles"
        case .history:   return "📜 History Puzzles"
        case .english:   return "✍️ Word Puzzles"
        }
    }
    private var puzzleButtons: [(title: String, subtitle: String, action: () -> Void)] {
        switch world {
        case .geography:
            return [
                ("🏙️ Capital Cities", "Match capitals to countries", { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .capitalToCountry) }),
                ("🌍 Continents",     "Match countries to continents", { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .countryToContinent) }),
                ("🌊 Rivers",         "Match rivers to countries", { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .riverToCountry) }),
            ]
        case .history:
            return [
                ("📅 Events & Dates",     "Match events to their year", { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .eventToYear) }),
                ("👤 People & Events",    "Match people to achievements", { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .personToEvent) }),
                ("💡 Inventions",         "Match inventions to inventors", { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .inventionToPerson) }),
            ]
        case .english:
            return [
                ("📖 Word Meanings",  "Match words to definitions", { [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .wordToDefinition) }),
                ("🔁 Synonyms",       "Match words that mean the same", { [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .synonyms) }),
                ("↔️ Antonyms",       "Match words with opposite meanings", { [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .antonyms) }),
            ]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    private func setupUI() {
        gradLayer.colors = gradColors
        gradLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)

        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = worldTitle
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)

        for info in puzzleButtons {
            let card = makePuzzleCard(title: info.title, subtitle: info.subtitle, action: info.action)
            stackView.addArrangedSubview(card)
        }

        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }

    private func makePuzzleCard(title: String, subtitle: String, action: @escaping () -> Void) -> UIView {
        let card = UIView()
        card.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        card.layer.cornerRadius = 20
        card.layer.borderWidth  = 1.5
        card.layer.borderColor  = UIColor.white.withAlphaComponent(0.18).cgColor

        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 18)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false

        let subLbl = UILabel()
        subLbl.text = subtitle
        subLbl.textColor = UIColor.white.withAlphaComponent(0.55)
        subLbl.font = UIFont.systemFont(ofSize: 13)
        subLbl.translatesAutoresizingMaskIntoConstraints = false

        let chevron = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevron.tintColor = UIColor.white.withAlphaComponent(0.4)
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.setContentHuggingPriority(.required, for: .horizontal)

        card.addSubview(titleLbl)
        card.addSubview(subLbl)
        card.addSubview(chevron)

        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            titleLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 4),
            subLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            subLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),
            subLbl.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18),

            chevron.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            chevron.widthAnchor.constraint(equalToConstant: 14),
        ])

        // Tap gesture
        let tap = BlockTap(action: action)
        card.addGestureRecognizer(tap)
        card.isUserInteractionEnabled = true

        // Highlight on tap
        let press = UILongPressGestureRecognizer(target: card, action: nil)
        press.minimumPressDuration = 0
        card.addGestureRecognizer(press)

        return card
    }

    // MARK: - Launch helpers

    private func launch(_ vc: GeographyPuzzleViewController, geo: GeographyPuzzleViewController.PuzzleType) {
        vc.puzzleType = geo
        navigationController?.pushViewController(vc, animated: true)
    }

    private func launch(_ vc: HistoryPuzzleViewController, hist: HistoryPuzzleViewController.PuzzleType) {
        vc.puzzleType = hist
        navigationController?.pushViewController(vc, animated: true)
    }

    private func launch(_ vc: EnglishPuzzleViewController, eng: EnglishPuzzleViewController.PuzzleType) {
        vc.puzzleType = eng
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }
}

// MARK: - BlockTap helper (tap gesture with closure)

private class BlockTap: UITapGestureRecognizer {
    private let block: () -> Void
    init(action: @escaping () -> Void) {
        self.block = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(fire))
    }
    @objc private func fire() { block() }
}
