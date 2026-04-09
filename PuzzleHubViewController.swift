import UIKit

// MARK: - PuzzleHubViewController

final class PuzzleHubViewController: UIViewController {

    enum World { case geography, history, english }
    var world: World = .geography

    private let gradLayer      = CAGradientLayer()
    private let backBtn        = UIButton(type: .system)
    private let titleLabel     = UILabel()
    private let subtitleLabel  = UILabel()
    private let stackView      = UIStackView()
    private let speedToggleBtn = UIButton(type: .system)
    private var speedRoundEnabled = false
    private let reviewCard  = UIView()
    private let timedCard   = UIView()
    private let battleCard  = UIView()

    // MARK: - World config
    private var gradColors: [CGColor] {
        switch world {
        case .geography: return [
            UIColor(red: 0.06, green: 0.08, blue: 0.42, alpha: 1).cgColor,
            UIColor(red: 0.14, green: 0.04, blue: 0.54, alpha: 1).cgColor,
        ]
        case .history: return [
            UIColor(red: 0.28, green: 0.10, blue: 0.02, alpha: 1).cgColor,
            UIColor(red: 0.48, green: 0.22, blue: 0.05, alpha: 1).cgColor,
        ]
        case .english: return [
            UIColor(red: 0.20, green: 0.05, blue: 0.44, alpha: 1).cgColor,
            UIColor(red: 0.04, green: 0.20, blue: 0.42, alpha: 1).cgColor,
        ]
        }
    }

    private var worldTitle: String {
        switch world {
        case .geography: return "🗺️ Geo Puzzles"
        case .history:   return "📜 History Puzzles"
        case .english:   return "✍️ Word Puzzles"
        }
    }

    private var worldSubtitle: String {
        switch world {
        case .geography: return "Pick a puzzle to explore the world!"
        case .history:   return "Step into the past and test your knowledge!"
        case .english:   return "Challenge your vocabulary skills!"
        }
    }

    // Card colours — each card gets its own vivid colour
    private var cardColors: [UIColor] {
        switch world {
        case .geography: return [
            UIColor(red: 0.95, green: 0.28, blue: 0.38, alpha: 1),
            UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1),
            UIColor(red: 0.05, green: 0.70, blue: 0.60, alpha: 1),
        ]
        case .history: return [
            UIColor(red: 0.92, green: 0.40, blue: 0.08, alpha: 1),
            UIColor(red: 0.85, green: 0.62, blue: 0.06, alpha: 1),
            UIColor(red: 0.78, green: 0.22, blue: 0.12, alpha: 1),
        ]
        case .english: return [
            UIColor(red: 0.75, green: 0.15, blue: 0.85, alpha: 1),
            UIColor(red: 0.05, green: 0.68, blue: 0.78, alpha: 1),
            UIColor(red: 0.88, green: 0.22, blue: 0.58, alpha: 1),
        ]
        }
    }

    private var puzzleButtons: [(title: String, subtitle: String, action: () -> Void)] {
        switch world {
        case .geography:
            return [
                ("🏙️ Capital Cities", "Match capitals to countries",   { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .capitalToCountry) }),
                ("🌍 Continents",     "Match countries to continents", { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .countryToContinent) }),
                ("🌊 Rivers",         "Match rivers to countries",     { [weak self] in self?.launch(GeographyPuzzleViewController(), geo: .riverToCountry) }),
            ]
        case .history:
            return [
                ("📅 Events & Dates",  "Match events to their year",       { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .eventToYear) }),
                ("👤 People & Events", "Match people to achievements",     { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .personToEvent) }),
                ("💡 Inventions",      "Match inventions to inventors",    { [weak self] in self?.launch(HistoryPuzzleViewController(), hist: .inventionToPerson) }),
            ]
        case .english:
            return [
                ("📖 Word Meanings", "Match words to definitions",       { [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .wordToDefinition) }),
                ("🔁 Synonyms",      "Match words that mean the same",   { [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .synonyms) }),
                ("↔️ Antonyms",      "Match words with opposite meanings",{ [weak self] in self?.launch(EnglishPuzzleViewController(), eng: .antonyms) }),
            ]
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshReviewCard()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateCardsIn()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    // MARK: - Setup
    private func setupUI() {
        gradLayer.colors = gradColors
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)

        // Decorative floating circles in background
        addBackgroundBlobs()

        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backBtn.layer.cornerRadius = 20
        backBtn.layer.shadowColor = UIColor.black.cgColor
        backBtn.layer.shadowOpacity = 0.2
        backBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = worldTitle
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowOpacity = 0.3
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        titleLabel.layer.shadowRadius = 4
        view.addSubview(titleLabel)

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = worldSubtitle
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.68)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        view.addSubview(subtitleLabel)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 18
        view.addSubview(stackView)

        let colors = cardColors
        for (i, info) in puzzleButtons.enumerated() {
            let card = makePuzzleCard(title: info.title, subtitle: info.subtitle,
                                     color: colors[i], action: info.action)
            stackView.addArrangedSubview(card)
            // Start hidden for entrance animation
            card.alpha = 0
            card.transform = CGAffineTransform(translationX: 0, y: 40)
        }

        // Speed Round toggle
        speedToggleBtn.translatesAutoresizingMaskIntoConstraints = false
        updateSpeedToggleAppearance()
        speedToggleBtn.layer.cornerRadius = 18
        speedToggleBtn.layer.borderWidth  = 2
        speedToggleBtn.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 14)
        speedToggleBtn.contentEdgeInsets  = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        speedToggleBtn.addTarget(self, action: #selector(didTapSpeedToggle), for: .touchUpInside)
        view.addSubview(speedToggleBtn)

        // Review card — shown only when there are missed pairs
        setupReviewCard()
        setupTimedExamCard()
        setupBattleCard()

        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: backBtn.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -56),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            stackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 36),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            speedToggleBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            speedToggleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speedToggleBtn.heightAnchor.constraint(equalToConstant: 36),

            reviewCard.topAnchor.constraint(equalTo: speedToggleBtn.bottomAnchor, constant: 14),
            reviewCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reviewCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            timedCard.topAnchor.constraint(equalTo: reviewCard.bottomAnchor, constant: 12),
            timedCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timedCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            battleCard.topAnchor.constraint(equalTo: timedCard.bottomAnchor, constant: 12),
            battleCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            battleCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    // MARK: - Review Card

    private var reviewSubject: String {
        switch world {
        case .geography: return "geography"
        case .history:   return "history"
        case .english:   return "english"
        }
    }

    private func setupReviewCard() {
        reviewCard.translatesAutoresizingMaskIntoConstraints = false
        reviewCard.backgroundColor = UIColor(red: 0.08, green: 0.30, blue: 0.30, alpha: 0.92)
        reviewCard.layer.cornerRadius = 22
        reviewCard.layer.borderWidth  = 1.5
        reviewCard.layer.borderColor  = UIColor(red: 0.20, green: 0.90, blue: 0.75, alpha: 0.55).cgColor
        reviewCard.layer.shadowColor   = UIColor.black.cgColor
        reviewCard.layer.shadowOpacity = 0.30
        reviewCard.layer.shadowOffset  = CGSize(width: 0, height: 4)
        reviewCard.layer.shadowRadius  = 10
        reviewCard.layer.masksToBounds = false
        reviewCard.alpha = 0.45       // dim until there are missed pairs
        view.addSubview(reviewCard)

        let strip = UIView()
        strip.translatesAutoresizingMaskIntoConstraints = false
        strip.backgroundColor = UIColor(red: 0.10, green: 0.95, blue: 0.75, alpha: 0.50)
        strip.layer.cornerRadius = 3
        reviewCard.addSubview(strip)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "🔁 Review Mode"
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 19)

        let subLbl = UILabel()
        subLbl.tag = 42   // used to update count later
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.textColor = UIColor.white.withAlphaComponent(0.78)
        subLbl.font = UIFont.systemFont(ofSize: 13)

        let chevronConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        let chevron = UIImageView(image: UIImage(systemName: "arrow.counterclockwise.circle.fill",
                                                withConfiguration: chevronConfig))
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = UIColor(red: 0.15, green: 0.90, blue: 0.75, alpha: 0.90)
        chevron.setContentHuggingPriority(.required, for: .horizontal)

        for v in [strip, titleLbl, subLbl, chevron] { reviewCard.addSubview(v) }

        NSLayoutConstraint.activate([
            strip.leadingAnchor.constraint(equalTo: reviewCard.leadingAnchor, constant: 16),
            strip.topAnchor.constraint(equalTo: reviewCard.topAnchor, constant: 14),
            strip.bottomAnchor.constraint(equalTo: reviewCard.bottomAnchor, constant: -14),
            strip.widthAnchor.constraint(equalToConstant: 4),

            titleLbl.topAnchor.constraint(equalTo: reviewCard.topAnchor, constant: 18),
            titleLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 3),
            subLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            subLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),
            subLbl.bottomAnchor.constraint(equalTo: reviewCard.bottomAnchor, constant: -18),

            chevron.centerYAnchor.constraint(equalTo: reviewCard.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: reviewCard.trailingAnchor, constant: -20),
            chevron.widthAnchor.constraint(equalToConstant: 28),
            chevron.heightAnchor.constraint(equalToConstant: 28),
        ])

        reviewCard.isUserInteractionEnabled = true
        let tap = BlockTapAnimated(card: reviewCard) { [weak self] in self?.launchReview() }
        reviewCard.addGestureRecognizer(tap)
    }

    private func refreshReviewCard() {
        let count = SpacedRepetitionManager.shared.totalMissed(subject: reviewSubject)
        let hasMissed = count > 0
        if let subLbl = reviewCard.viewWithTag(42) as? UILabel {
            subLbl.text = hasMissed
                ? "Practice \(count) question\(count == 1 ? "" : "s") you got wrong"
                : "Play puzzles — missed questions appear here"
        }
        reviewCard.isUserInteractionEnabled = hasMissed
        UIView.animate(withDuration: 0.3) {
            self.reviewCard.alpha = hasMissed ? 1.0 : 0.45
        }
    }

    private func launchReview() {
        switch world {
        case .geography:
            let vc = GeographyPuzzleViewController()
            vc.isReviewMode = true; vc.isSpeedRound = speedRoundEnabled
            navigationController?.pushViewController(vc, animated: true)
        case .history:
            let vc = HistoryPuzzleViewController()
            vc.isReviewMode = true; vc.isSpeedRound = speedRoundEnabled
            navigationController?.pushViewController(vc, animated: true)
        case .english:
            let vc = EnglishPuzzleViewController()
            vc.isReviewMode = true; vc.isSpeedRound = speedRoundEnabled
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Timed Exam Card

    private func setupTimedExamCard() {
        timedCard.translatesAutoresizingMaskIntoConstraints = false
        timedCard.backgroundColor = UIColor(red: 0.04, green: 0.30, blue: 0.52, alpha: 0.90)
        timedCard.layer.cornerRadius = 22
        timedCard.layer.borderWidth  = 1.5
        timedCard.layer.borderColor  = UIColor(red: 0.25, green: 0.75, blue: 1.0, alpha: 0.55).cgColor
        timedCard.layer.shadowColor   = UIColor(red: 0.0, green: 0.5, blue: 0.9, alpha: 1).cgColor
        timedCard.layer.shadowOpacity = 0.40
        timedCard.layer.shadowOffset  = CGSize(width: 0, height: 5)
        timedCard.layer.shadowRadius  = 10
        timedCard.layer.masksToBounds = false
        view.addSubview(timedCard)

        let strip = UIView()
        strip.translatesAutoresizingMaskIntoConstraints = false
        strip.backgroundColor = UIColor(red: 0.25, green: 0.75, blue: 1.0, alpha: 0.55)
        strip.layer.cornerRadius = 3
        timedCard.addSubview(strip)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "⏱️ Timed Exam"
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 19)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = "60 seconds, 3× XP — race the clock!"
        subLbl.textColor = UIColor.white.withAlphaComponent(0.78)
        subLbl.font = UIFont.systemFont(ofSize: 13)

        let chevronConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        let chevron = UIImageView(image: UIImage(systemName: "timer",
                                                withConfiguration: chevronConfig))
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = UIColor(red: 0.25, green: 0.75, blue: 1.0, alpha: 0.90)
        chevron.setContentHuggingPriority(.required, for: .horizontal)

        for v in [strip, titleLbl, subLbl, chevron] { timedCard.addSubview(v) }

        NSLayoutConstraint.activate([
            strip.leadingAnchor.constraint(equalTo: timedCard.leadingAnchor, constant: 16),
            strip.topAnchor.constraint(equalTo: timedCard.topAnchor, constant: 14),
            strip.bottomAnchor.constraint(equalTo: timedCard.bottomAnchor, constant: -14),
            strip.widthAnchor.constraint(equalToConstant: 4),

            titleLbl.topAnchor.constraint(equalTo: timedCard.topAnchor, constant: 18),
            titleLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 3),
            subLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            subLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),
            subLbl.bottomAnchor.constraint(equalTo: timedCard.bottomAnchor, constant: -18),

            chevron.centerYAnchor.constraint(equalTo: timedCard.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: timedCard.trailingAnchor, constant: -20),
            chevron.widthAnchor.constraint(equalToConstant: 26),
            chevron.heightAnchor.constraint(equalToConstant: 26),
        ])

        timedCard.isUserInteractionEnabled = true
        let tap = BlockTapAnimated(card: timedCard) { [weak self] in self?.launchTimedExam() }
        timedCard.addGestureRecognizer(tap)
    }

    private func launchTimedExam() {
        // Pick a random puzzle type for the current world and force speed round on
        switch world {
        case .geography:
            let vc = GeographyPuzzleViewController()
            let types: [GeographyPuzzleViewController.PuzzleType] = [.capitalToCountry, .countryToContinent, .riverToCountry]
            vc.puzzleType = types.randomElement()!
            vc.isSpeedRound = true
            navigationController?.pushViewController(vc, animated: true)
        case .history:
            let vc = HistoryPuzzleViewController()
            let types: [HistoryPuzzleViewController.PuzzleType] = [.eventToYear, .personToEvent, .inventionToPerson]
            vc.puzzleType = types.randomElement()!
            vc.isSpeedRound = true
            navigationController?.pushViewController(vc, animated: true)
        case .english:
            let vc = EnglishPuzzleViewController()
            let types: [EnglishPuzzleViewController.PuzzleType] = [.wordToDefinition, .synonyms, .antonyms]
            vc.puzzleType = types.randomElement()!
            vc.isSpeedRound = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Dragon Battle Card

    private func setupBattleCard() {
        battleCard.translatesAutoresizingMaskIntoConstraints = false
        battleCard.backgroundColor = UIColor(red: 0.55, green: 0.10, blue: 0.08, alpha: 0.88)
        battleCard.layer.cornerRadius = 22
        battleCard.layer.borderWidth  = 1.5
        battleCard.layer.borderColor  = UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 0.60).cgColor
        battleCard.layer.shadowColor   = UIColor(red: 0.8, green: 0.2, blue: 0.0, alpha: 1).cgColor
        battleCard.layer.shadowOpacity = 0.45
        battleCard.layer.shadowOffset  = CGSize(width: 0, height: 6)
        battleCard.layer.shadowRadius  = 12
        battleCard.layer.masksToBounds = false
        view.addSubview(battleCard)

        let strip = UIView()
        strip.translatesAutoresizingMaskIntoConstraints = false
        strip.backgroundColor = UIColor(red: 1.0, green: 0.55, blue: 0.1, alpha: 0.55)
        strip.layer.cornerRadius = 3
        battleCard.addSubview(strip)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "🐉 Dragon Battle"
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 19)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = "Race the dragon — who matches more?"
        subLbl.textColor = UIColor.white.withAlphaComponent(0.78)
        subLbl.font = UIFont.systemFont(ofSize: 13)

        let chevronConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        let chevron = UIImageView(image: UIImage(systemName: "flame.fill",
                                                withConfiguration: chevronConfig))
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = UIColor(red: 1.0, green: 0.55, blue: 0.1, alpha: 0.90)
        chevron.setContentHuggingPriority(.required, for: .horizontal)

        for v in [strip, titleLbl, subLbl, chevron] { battleCard.addSubview(v) }

        NSLayoutConstraint.activate([
            strip.leadingAnchor.constraint(equalTo: battleCard.leadingAnchor, constant: 16),
            strip.topAnchor.constraint(equalTo: battleCard.topAnchor, constant: 14),
            strip.bottomAnchor.constraint(equalTo: battleCard.bottomAnchor, constant: -14),
            strip.widthAnchor.constraint(equalToConstant: 4),

            titleLbl.topAnchor.constraint(equalTo: battleCard.topAnchor, constant: 18),
            titleLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 3),
            subLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            subLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),
            subLbl.bottomAnchor.constraint(equalTo: battleCard.bottomAnchor, constant: -18),

            chevron.centerYAnchor.constraint(equalTo: battleCard.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: battleCard.trailingAnchor, constant: -20),
            chevron.widthAnchor.constraint(equalToConstant: 26),
            chevron.heightAnchor.constraint(equalToConstant: 26),
        ])

        battleCard.isUserInteractionEnabled = true
        let tap = BlockTapAnimated(card: battleCard) { [weak self] in self?.launchBattle() }
        battleCard.addGestureRecognizer(tap)

        // Subtle pulse to draw attention
        UIView.animate(withDuration: 1.8, delay: 0.5,
                       options: [.autoreverse, .repeat, .curveEaseInOut, .allowUserInteraction]) {
            self.battleCard.layer.shadowOpacity = 0.70
            self.battleCard.transform = CGAffineTransform(scaleX: 1.015, y: 1.015)
        }
    }

    private func launchBattle() {
        let vc = DragonBattleViewController()
        switch world {
        case .geography: vc.subject = .geography
        case .history:   vc.subject = .history
        case .english:   vc.subject = .english
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    private func addBackgroundBlobs() {
        let blobData: [(CGPoint, CGFloat, CGFloat)] = [
            (CGPoint(x: 0.15, y: 0.10), 120, 0.10),
            (CGPoint(x: 0.85, y: 0.22), 90,  0.08),
            (CGPoint(x: 0.70, y: 0.75), 140, 0.07),
            (CGPoint(x: 0.10, y: 0.60), 80,  0.09),
        ]
        for (pos, size, alpha) in blobData {
            let blob = UIView()
            blob.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            blob.layer.cornerRadius = size / 2
            blob.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(blob)
            NSLayoutConstraint.activate([
                blob.centerXAnchor.constraint(equalTo: view.leadingAnchor,
                    constant: UIScreen.main.bounds.width * pos.x),
                blob.centerYAnchor.constraint(equalTo: view.topAnchor,
                    constant: UIScreen.main.bounds.height * pos.y),
                blob.widthAnchor.constraint(equalToConstant: size),
                blob.heightAnchor.constraint(equalToConstant: size),
            ])
            // Gentle pulse on each blob
            UIView.animate(withDuration: Double.random(in: 2.8...4.5),
                           delay: Double.random(in: 0...1.5),
                           options: [.autoreverse, .repeat, .curveEaseInOut]) {
                blob.transform = CGAffineTransform(scaleX: 1.18, y: 1.18)
                blob.alpha = alpha * 0.4
            }
        }
    }

    private func animateCardsIn() {
        for (i, card) in stackView.arrangedSubviews.enumerated() {
            UIView.animate(withDuration: 0.5, delay: Double(i) * 0.10,
                           usingSpringWithDamping: 0.68, initialSpringVelocity: 0.5, options: []) {
                card.alpha = 1
                card.transform = .identity
            }
        }
    }

    // MARK: - Card
    private func makePuzzleCard(title: String, subtitle: String,
                                color: UIColor, action: @escaping () -> Void) -> UIView {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = color
        card.layer.cornerRadius = 22
        card.layer.shadowColor   = color.cgColor
        card.layer.shadowOpacity = 0.45
        card.layer.shadowOffset  = CGSize(width: 0, height: 6)
        card.layer.shadowRadius  = 12
        card.layer.masksToBounds = false

        // Highlight strip on the left edge
        let strip = UIView()
        strip.translatesAutoresizingMaskIntoConstraints = false
        strip.backgroundColor = UIColor.white.withAlphaComponent(0.28)
        strip.layer.cornerRadius = 3
        card.addSubview(strip)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = title
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 19)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = subtitle
        subLbl.textColor = UIColor.white.withAlphaComponent(0.78)
        subLbl.font = UIFont.systemFont(ofSize: 13)

        let chevronConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        let chevron = UIImageView(image: UIImage(systemName: "arrow.right.circle.fill",
                                                withConfiguration: chevronConfig))
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.tintColor = UIColor.white.withAlphaComponent(0.75)
        chevron.setContentHuggingPriority(.required, for: .horizontal)

        for v in [strip, titleLbl, subLbl, chevron] { card.addSubview(v) }

        NSLayoutConstraint.activate([
            strip.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            strip.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            strip.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -14),
            strip.widthAnchor.constraint(equalToConstant: 4),

            titleLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            titleLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 3),
            subLbl.leadingAnchor.constraint(equalTo: strip.trailingAnchor, constant: 14),
            subLbl.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8),
            subLbl.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18),

            chevron.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            chevron.widthAnchor.constraint(equalToConstant: 26),
            chevron.heightAnchor.constraint(equalToConstant: 26),
        ])

        card.isUserInteractionEnabled = true

        // Tap: scale down on press, then launch
        let tap = BlockTapAnimated(card: card, action: action)
        card.addGestureRecognizer(tap)

        return card
    }

    // MARK: - Speed Round
    @objc private func didTapSpeedToggle() {
        speedRoundEnabled.toggle()
        updateSpeedToggleAppearance()
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    private func updateSpeedToggleAppearance() {
        if speedRoundEnabled {
            speedToggleBtn.setTitle("⚡ Speed Round: ON", for: .normal)
            speedToggleBtn.setTitleColor(.black, for: .normal)
            speedToggleBtn.backgroundColor = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1)
            speedToggleBtn.layer.borderColor = UIColor.clear.cgColor
        } else {
            speedToggleBtn.setTitle("⚡ Speed Round: OFF", for: .normal)
            speedToggleBtn.setTitleColor(UIColor.white.withAlphaComponent(0.70), for: .normal)
            speedToggleBtn.backgroundColor = UIColor.white.withAlphaComponent(0.10)
            speedToggleBtn.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        }
    }

    // MARK: - Launch
    private func launch(_ vc: GeographyPuzzleViewController, geo: GeographyPuzzleViewController.PuzzleType) {
        vc.puzzleType = geo; vc.isSpeedRound = speedRoundEnabled
        navigationController?.pushViewController(vc, animated: true)
    }
    private func launch(_ vc: HistoryPuzzleViewController, hist: HistoryPuzzleViewController.PuzzleType) {
        vc.puzzleType = hist; vc.isSpeedRound = speedRoundEnabled
        navigationController?.pushViewController(vc, animated: true)
    }
    private func launch(_ vc: EnglishPuzzleViewController, eng: EnglishPuzzleViewController.PuzzleType) {
        vc.puzzleType = eng; vc.isSpeedRound = speedRoundEnabled
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }
}

// MARK: - BlockTap with press animation

private class BlockTapAnimated: UITapGestureRecognizer {
    private let block: () -> Void
    private weak var card: UIView?

    init(card: UIView, action: @escaping () -> Void) {
        self.block = action
        self.card  = card
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(fire))
    }

    @objc private func fire() {
        guard let card = card else { return }
        UIView.animate(withDuration: 0.10, animations: {
            card.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.18, delay: 0,
                           usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: []) {
                card.transform = .identity
            } completion: { [weak self] _ in
                self?.block()
            }
        }
    }
}
