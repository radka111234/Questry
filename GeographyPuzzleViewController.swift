import UIKit

// MARK: - GeographyPuzzleViewController

final class GeographyPuzzleViewController: UIViewController {

    // MARK: - Types
    enum PuzzleType: CaseIterable {
        case capitalToCountry, countryToContinent, riverToCountry
        var title: String {
            switch self {
            case .capitalToCountry:   return "🏙️ Capital Cities"
            case .countryToContinent: return "🌍 Countries & Continents"
            case .riverToCountry:     return "🌊 Rivers & Countries"
            }
        }
        var instruction: String {
            switch self {
            case .capitalToCountry:   return "Match the capital to its country"
            case .countryToContinent: return "Match the country to its continent"
            case .riverToCountry:     return "Match the river to its country"
            }
        }
    }
    var puzzleType: PuzzleType = .capitalToCountry
    var isReviewMode = false

    // MARK: - Data
    private struct Pair { let prompt: String; let answer: String }

    private let capitalData: [Pair] = [
        .init(prompt: "Paris",        answer: "France"),
        .init(prompt: "Berlin",       answer: "Germany"),
        .init(prompt: "Tokyo",        answer: "Japan"),
        .init(prompt: "Ottawa",       answer: "Canada"),
        .init(prompt: "Canberra",     answer: "Australia"),
        .init(prompt: "Brasília",     answer: "Brazil"),
        .init(prompt: "Cairo",        answer: "Egypt"),
        .init(prompt: "Moscow",       answer: "Russia"),
        .init(prompt: "Beijing",      answer: "China"),
        .init(prompt: "Rome",         answer: "Italy"),
        .init(prompt: "Madrid",       answer: "Spain"),
        .init(prompt: "Athens",       answer: "Greece"),
        .init(prompt: "Stockholm",    answer: "Sweden"),
        .init(prompt: "Amsterdam",    answer: "Netherlands"),
        .init(prompt: "Nairobi",      answer: "Kenya"),
        .init(prompt: "Bangkok",      answer: "Thailand"),
        .init(prompt: "Buenos Aires", answer: "Argentina"),
        .init(prompt: "Lima",         answer: "Peru"),
        .init(prompt: "Seoul",        answer: "South Korea"),
        .init(prompt: "Lisbon",       answer: "Portugal"),
    ]
    private let continentData: [Pair] = [
        .init(prompt: "France",       answer: "Europe"),
        .init(prompt: "Brazil",       answer: "South America"),
        .init(prompt: "Kenya",        answer: "Africa"),
        .init(prompt: "Japan",        answer: "Asia"),
        .init(prompt: "Australia",    answer: "Oceania"),
        .init(prompt: "Canada",       answer: "North America"),
        .init(prompt: "Egypt",        answer: "Africa"),
        .init(prompt: "India",        answer: "Asia"),
        .init(prompt: "Mexico",       answer: "North America"),
        .init(prompt: "Argentina",    answer: "South America"),
        .init(prompt: "Germany",      answer: "Europe"),
        .init(prompt: "China",        answer: "Asia"),
        .init(prompt: "Nigeria",      answer: "Africa"),
        .init(prompt: "Peru",         answer: "South America"),
        .init(prompt: "Sweden",       answer: "Europe"),
        .init(prompt: "New Zealand",  answer: "Oceania"),
        .init(prompt: "USA",          answer: "North America"),
        .init(prompt: "Russia",       answer: "Europe/Asia"),
        .init(prompt: "South Korea",  answer: "Asia"),
        .init(prompt: "Morocco",      answer: "Africa"),
    ]
    private let riverData: [Pair] = [
        .init(prompt: "Amazon",      answer: "Brazil"),
        .init(prompt: "Nile",        answer: "Egypt"),
        .init(prompt: "Thames",      answer: "UK"),
        .init(prompt: "Seine",       answer: "France"),
        .init(prompt: "Danube",      answer: "Germany"),
        .init(prompt: "Yangtze",     answer: "China"),
        .init(prompt: "Ganges",      answer: "India"),
        .init(prompt: "Mississippi", answer: "USA"),
        .init(prompt: "Congo",       answer: "DR Congo"),
        .init(prompt: "Volga",       answer: "Russia"),
        .init(prompt: "Rhine",       answer: "Germany"),
        .init(prompt: "Mekong",      answer: "Vietnam"),
        .init(prompt: "Zambezi",     answer: "Zimbabwe"),
        .init(prompt: "Colorado",    answer: "USA"),
        .init(prompt: "Tigris",      answer: "Iraq"),
    ]

    // MARK: - State
    private var pairs: [Pair] = []
    private var pairsPerRound: Int {
        switch AdaptiveDifficultyManager.shared.difficulty(for: "geography") {
        case 0: return 3   // easy — smaller rounds
        case 2: return 6   // hard — larger rounds
        default: return 5  // medium
        }
    }
    private var selectedPromptIndex: Int? = nil
    private var selectedAnswerIndex: Int? = nil
    private var matched: Set<Int> = []
    private var score = 0
    private var totalRounds = 0
    private var roundsPlayed = 0

    // Speed Round
    var isSpeedRound = false
    private var timeRemaining = 60
    private var gameTimer: Timer?
    private let timerPill  = UIView()
    private let timerLabel = UILabel()

    // MARK: - Theme
    private let gradLayer = CAGradientLayer()
    private let promptColors: [UIColor] = [
        UIColor(red: 0.95, green: 0.28, blue: 0.38, alpha: 1),
        UIColor(red: 0.97, green: 0.52, blue: 0.08, alpha: 1),
        UIColor(red: 0.82, green: 0.22, blue: 0.75, alpha: 1),
        UIColor(red: 0.60, green: 0.18, blue: 0.92, alpha: 1),
        UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1),
    ]
    private let answerColors: [UIColor] = [
        UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1),
        UIColor(red: 0.05, green: 0.70, blue: 0.60, alpha: 1),
        UIColor(red: 0.18, green: 0.45, blue: 0.92, alpha: 1),
        UIColor(red: 0.05, green: 0.65, blue: 0.42, alpha: 1),
        UIColor(red: 0.28, green: 0.60, blue: 0.95, alpha: 1),
    ]

    // MARK: - UI
    private let backBtn       = UIButton(type: .system)
    private let titleLabel    = UILabel()
    private let instrLabel    = UILabel()
    private let scorePillView = UIView()
    private let scoreLabel    = UILabel()
    private let roundLabel    = UILabel()
    private var promptBtns:   [UIButton] = []
    private var answerBtns:   [UIButton] = []
    private let nextBtn       = UIButton(type: .system)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
        dealRound()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    // MARK: - Data
    private func loadData() {
        if isReviewMode {
            let reviewItems = SpacedRepetitionManager.shared.reviewPairs(for: "geography")
            pairs = reviewItems.map { Pair(prompt: $0.prompt, answer: $0.answer) }.shuffled()
        } else {
            let difficulty = AdaptiveDifficultyManager.shared.difficulty(for: "geography")
            var pool: [Pair]
            switch puzzleType {
            case .capitalToCountry:   pool = capitalData
            case .countryToContinent: pool = continentData
            case .riverToCountry:     pool = riverData
            }
            // Easy: first 40% of pool (simpler entries listed first in data)
            // Medium: first 70%
            // Hard: full pool
            let limit = difficulty == 0 ? max(pairsPerRound, pool.count * 4 / 10)
                      : difficulty == 1 ? max(pairsPerRound, pool.count * 7 / 10)
                      : pool.count
            pairs = Array(pool.prefix(limit)).shuffled()
        }
        totalRounds = max(1, pairs.count / pairsPerRound)
    }

    // MARK: - Setup
    private func setupUI() {
        gradLayer.colors = [
            UIColor(red: 0.06, green: 0.08, blue: 0.42, alpha: 1).cgColor,
            UIColor(red: 0.14, green: 0.04, blue: 0.54, alpha: 1).cgColor,
        ]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)

        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.20)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = puzzleType.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        instrLabel.translatesAutoresizingMaskIntoConstraints = false
        instrLabel.text = puzzleType.instruction
        instrLabel.textColor = UIColor.white.withAlphaComponent(0.72)
        instrLabel.font = UIFont.systemFont(ofSize: 13)
        instrLabel.textAlignment = .center
        view.addSubview(instrLabel)

        scorePillView.translatesAutoresizingMaskIntoConstraints = false
        scorePillView.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        scorePillView.layer.cornerRadius = 14
        view.addSubview(scorePillView)

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textColor = UIColor.systemYellow
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        scoreLabel.textAlignment = .center
        scorePillView.addSubview(scoreLabel)

        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.textColor = UIColor.white.withAlphaComponent(0.50)
        roundLabel.font = UIFont.systemFont(ofSize: 12)
        roundLabel.textAlignment = .center
        view.addSubview(roundLabel)

        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.setTitle("Next Round  ▶", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nextBtn.backgroundColor = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1)
        nextBtn.layer.cornerRadius = 26
        nextBtn.layer.shadowColor  = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1).cgColor
        nextBtn.layer.shadowOpacity = 0.55
        nextBtn.layer.shadowOffset  = CGSize(width: 0, height: 5)
        nextBtn.layer.shadowRadius  = 8
        nextBtn.isHidden = true
        nextBtn.alpha = 0
        nextBtn.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        view.addSubview(nextBtn)

        // Timer pill (speed round)
        timerPill.translatesAutoresizingMaskIntoConstraints = false
        timerPill.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.85)
        timerPill.layer.cornerRadius = 14
        timerPill.isHidden = !isSpeedRound
        view.addSubview(timerPill)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont.boldSystemFont(ofSize: 13)
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerPill.addSubview(timerLabel)

        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),

            timerPill.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            timerPill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timerPill.heightAnchor.constraint(equalToConstant: 32),
            timerLabel.topAnchor.constraint(equalTo: timerPill.topAnchor, constant: 4),
            timerLabel.bottomAnchor.constraint(equalTo: timerPill.bottomAnchor, constant: -4),
            timerLabel.leadingAnchor.constraint(equalTo: timerPill.leadingAnchor, constant: 10),
            timerLabel.trailingAnchor.constraint(equalTo: timerPill.trailingAnchor, constant: -10),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            instrLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            instrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            scorePillView.topAnchor.constraint(equalTo: instrLabel.bottomAnchor, constant: 8),
            scorePillView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scorePillView.heightAnchor.constraint(equalToConstant: 28),

            scoreLabel.topAnchor.constraint(equalTo: scorePillView.topAnchor, constant: 4),
            scoreLabel.bottomAnchor.constraint(equalTo: scorePillView.bottomAnchor, constant: -4),
            scoreLabel.leadingAnchor.constraint(equalTo: scorePillView.leadingAnchor, constant: 14),
            scoreLabel.trailingAnchor.constraint(equalTo: scorePillView.trailingAnchor, constant: -14),

            roundLabel.topAnchor.constraint(equalTo: scorePillView.bottomAnchor, constant: 4),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextBtn.widthAnchor.constraint(equalToConstant: 220),
            nextBtn.heightAnchor.constraint(equalToConstant: 54),
        ])

        buildMatchButtons()
    }

    private func buildMatchButtons() {
        (promptBtns + answerBtns).forEach { $0.removeFromSuperview() }
        promptBtns = []; answerBtns = []
        for i in 0..<pairsPerRound {
            let p = makeMatchBtn(tag: i, isPrompt: true)
            let a = makeMatchBtn(tag: i, isPrompt: false)
            promptBtns.append(p); answerBtns.append(a)
            view.addSubview(p); view.addSubview(a)
        }
        layoutMatchButtons()
    }

    private func makeMatchBtn(tag: Int, isPrompt: Bool) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = tag
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = isPrompt ? promptColors[tag] : answerColors[tag]
        btn.layer.cornerRadius = 16
        btn.layer.shadowColor   = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.28
        btn.layer.shadowOffset  = CGSize(width: 0, height: 3)
        btn.layer.shadowRadius  = 5
        btn.layer.masksToBounds = false
        if isPrompt {
            btn.addTarget(self, action: #selector(didTapPrompt(_:)), for: .touchUpInside)
        } else {
            btn.addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        }
        return btn
    }

    private func layoutMatchButtons() {
        let top       = view.safeAreaLayoutGuide.topAnchor
        let rowH: CGFloat = 56
        let gap:  CGFloat = 10
        let topOffset: CGFloat = 150

        for (i, btn) in promptBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: top, constant: topOffset + CGFloat(i) * (rowH + gap)),
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
        for (i, btn) in answerBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: top, constant: topOffset + CGFloat(i) * (rowH + gap)),
                btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
    }

    // MARK: - Round
    private func dealRound() {
        matched = []; selectedPromptIndex = nil; selectedAnswerIndex = nil

        let start = roundsPlayed * pairsPerRound
        guard start < pairs.count else { showCompletion(); return }
        let end = min(start + pairsPerRound, pairs.count)
        let roundPairs = Array(pairs[start..<end])
        let shuffledAnswers = roundPairs.map { $0.answer }.shuffled()

        for (i, btn) in promptBtns.enumerated() {
            btn.setTitle(i < roundPairs.count ? roundPairs[i].prompt : "", for: .normal)
            styleBtn(btn, .normal, animated: false)
            btn.isEnabled = true
        }
        for (i, btn) in answerBtns.enumerated() {
            btn.setTitle(i < shuffledAnswers.count ? shuffledAnswers[i] : "", for: .normal)
            styleBtn(btn, .normal, animated: false)
            btn.isEnabled = true
            if let idx = roundPairs.firstIndex(where: { $0.answer == shuffledAnswers[i] }) {
                btn.accessibilityValue = "\(idx)"
            }
        }

        nextBtn.isHidden = true; nextBtn.alpha = 0
        updateScore(); updateRoundLabel()
        animateButtonsIn()
        if isSpeedRound { startTimer() }
    }

    private func startTimer() {
        gameTimer?.invalidate()
        timeRemaining = 60
        updateTimerDisplay()
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.timeRemaining -= 1
            self.updateTimerDisplay()
            if self.timeRemaining <= 0 {
                self.gameTimer?.invalidate()
                self.roundsPlayed += 1
                self.showCompletion()
            }
        }
    }

    private func updateTimerDisplay() {
        timerLabel.text = "⏱ \(timeRemaining)s"
        let color: UIColor
        if timeRemaining > 30      { color = .systemGreen }
        else if timeRemaining > 10 { color = .systemOrange }
        else                       { color = UIColor(red: 0.88, green: 0.15, blue: 0.18, alpha: 1) }
        UIView.animate(withDuration: 0.3) { self.timerPill.backgroundColor = color.withAlphaComponent(0.90) }
        if timeRemaining <= 5 {
            UIView.animate(withDuration: 0.1, animations: { self.timerPill.transform = CGAffineTransform(scaleX: 1.15, y: 1.15) }) { _ in
                UIView.animate(withDuration: 0.1) { self.timerPill.transform = .identity }
            }
        }
    }

    private func animateButtonsIn() {
        for (i, (pBtn, aBtn)) in zip(promptBtns, answerBtns).enumerated() {
            pBtn.alpha = 0; aBtn.alpha = 0
            pBtn.transform = CGAffineTransform(translationX: -30, y: 0)
            aBtn.transform = CGAffineTransform(translationX: 30,  y: 0)
            UIView.animate(withDuration: 0.4, delay: Double(i) * 0.07,
                           usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: []) {
                pBtn.alpha = 1; pBtn.transform = .identity
                aBtn.alpha = 1; aBtn.transform = .identity
            }
        }
    }

    // MARK: - Tap Handling
    @objc private func didTapPrompt(_ sender: UIButton) {
        let i = sender.tag
        if selectedPromptIndex == i {
            selectedPromptIndex = nil; styleBtn(sender, .normal)
        } else {
            if let prev = selectedPromptIndex { styleBtn(promptBtns[prev], .normal) }
            selectedPromptIndex = i; styleBtn(sender, .selected); tryMatch()
        }
    }

    @objc private func didTapAnswer(_ sender: UIButton) {
        let i = sender.tag
        if selectedAnswerIndex == i {
            selectedAnswerIndex = nil; styleBtn(sender, .normal)
        } else {
            if let prev = selectedAnswerIndex { styleBtn(answerBtns[prev], .normal) }
            selectedAnswerIndex = i; styleBtn(sender, .selected); tryMatch()
        }
    }

    private func tryMatch() {
        guard let pi = selectedPromptIndex, let ai = selectedAnswerIndex else { return }
        let start = roundsPlayed * pairsPerRound
        let promptPair = pairs[start + pi]
        let answerText = answerBtns[ai].title(for: .normal) ?? ""

        if promptPair.answer == answerText {
            score += 1; matched.insert(pi)
            styleBtn(promptBtns[pi], .correct); styleBtn(answerBtns[ai], .correct)
            bounceBtn(promptBtns[pi]); bounceBtn(answerBtns[ai])
            emitStars(from: answerBtns[ai])
            promptBtns[pi].isEnabled = false; answerBtns[ai].isEnabled = false
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            pulseScore()
            AdaptiveDifficultyManager.shared.recordResult(subject: "geography", correct: true)
            if isReviewMode { SpacedRepetitionManager.shared.clearPair(subject: "geography", prompt: promptPair.prompt) }
            if Bool.random() { MotivationManager.shared.speak(for: .correctAnswer) }
            if score % 3 == 0, let fact = RealWorldFacts.fact(for: promptPair.prompt, subject: "geography") {
                showFactToast(fact)
            }
        } else {
            styleBtn(promptBtns[pi], .wrong); styleBtn(answerBtns[ai], .wrong)
            shakeBtn(promptBtns[pi]); shakeBtn(answerBtns[ai])
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) { [weak self] in
                guard let self else { return }
                self.styleBtn(self.promptBtns[pi], .normal)
                self.styleBtn(self.answerBtns[ai], .normal)
            }
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            AdaptiveDifficultyManager.shared.recordResult(subject: "geography", correct: false)
            SpacedRepetitionManager.shared.recordMiss(subject: "geography", prompt: promptPair.prompt, answer: promptPair.answer)
            MotivationManager.shared.speak(for: .wrongAnswer)
        }

        selectedPromptIndex = nil; selectedAnswerIndex = nil
        updateScore()

        if matched.count == pairsPerRound {
            gameTimer?.invalidate()
            roundsPlayed += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self else { return }
                if self.roundsPlayed * self.pairsPerRound >= self.pairs.count {
                    self.showCompletion()
                } else {
                    self.showNextBtn()
                }
            }
        }
    }

    // MARK: - Style
    private enum BtnState { case normal, selected, correct, wrong }

    private func styleBtn(_ btn: UIButton, _ state: BtnState, animated: Bool = true) {
        let baseColor = normalColor(for: btn)
        let (bg, borderColor, borderW, text): (UIColor, UIColor, CGFloat, UIColor)
        switch state {
        case .normal:
            bg = baseColor; borderColor = .clear; borderW = 0; text = .white
        case .selected:
            bg = baseColor.withAlphaComponent(0.65)
            borderColor = UIColor.systemYellow; borderW = 2.5; text = UIColor.systemYellow
        case .correct:
            bg = UIColor(red: 0.12, green: 0.80, blue: 0.38, alpha: 1)
            borderColor = .clear; borderW = 0; text = .white
        case .wrong:
            bg = UIColor(red: 0.88, green: 0.15, blue: 0.18, alpha: 1)
            borderColor = .clear; borderW = 0; text = .white
        }
        btn.setTitleColor(text, for: .normal)
        CATransaction.begin()
        CATransaction.setAnimationDuration(animated ? 0.2 : 0)
        btn.layer.borderColor = borderColor.cgColor
        btn.layer.borderWidth = borderW
        CATransaction.commit()
        if animated {
            UIView.animate(withDuration: 0.2) { btn.backgroundColor = bg }
        } else {
            btn.backgroundColor = bg
        }
    }

    private func normalColor(for btn: UIButton) -> UIColor {
        let i = btn.tag % 5
        return promptBtns.contains(btn) ? promptColors[i] : answerColors[i]
    }

    // MARK: - Animation Helpers
    private func bounceBtn(_ btn: UIButton) {
        UIView.animate(withDuration: 0.12, animations: {
            btn.transform = CGAffineTransform(scaleX: 1.18, y: 1.18)
        }) { _ in
            UIView.animate(withDuration: 0.30, delay: 0,
                           usingSpringWithDamping: 0.40, initialSpringVelocity: 0.8, options: []) {
                btn.transform = .identity
            }
        }
    }

    private func shakeBtn(_ btn: UIButton) {
        let anim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        anim.timingFunction = CAMediaTimingFunction(name: .linear)
        anim.duration = 0.38
        anim.values = [-9, 9, -7, 7, -4, 4, 0]
        btn.layer.add(anim, forKey: "shake")
    }

    private func showFactToast(_ fact: String) {
        let container = UIView()
        container.backgroundColor = UIColor(red: 0.05, green: 0.25, blue: 0.45, alpha: 0.95)
        container.layer.cornerRadius = 18
        container.layer.borderWidth  = 1.5
        container.layer.borderColor  = UIColor(red: 0.20, green: 0.70, blue: 1.0, alpha: 0.65).cgColor
        container.layer.shadowColor  = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.30
        container.layer.shadowRadius  = 10
        container.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text          = "💡 \(fact)"
        label.textColor     = .white
        label.font          = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(label)
        view.addSubview(container)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 14),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -14),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
        ])

        container.alpha = 0
        container.transform = CGAffineTransform(translationX: 0, y: -20)
        UIView.animate(withDuration: 0.4, delay: 0.3,
                       usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: []) {
            container.alpha = 1
            container.transform = .identity
        }
        UIView.animate(withDuration: 0.3, delay: 3.5, options: [.curveEaseIn]) {
            container.alpha = 0
            container.transform = CGAffineTransform(translationX: 0, y: -10)
        } completion: { _ in container.removeFromSuperview() }
    }

    private func emitStars(from btn: UIButton) {
        let stars = ["⭐️", "✨", "🌟", "💫"]
        let btnFrame = view.convert(btn.bounds, from: btn)
        for k in 0..<3 {
            let lbl = UILabel()
            lbl.text = stars.randomElement()
            lbl.font = .systemFont(ofSize: 22)
            lbl.frame = CGRect(
                x: btnFrame.midX + CGFloat.random(in: -25...25) - 15,
                y: btnFrame.midY - 10, width: 30, height: 30
            )
            view.addSubview(lbl)
            let tx = CGFloat.random(in: -40...40)
            UIView.animate(withDuration: 0.85, delay: Double(k) * 0.1,
                           options: .curveEaseOut) {
                lbl.frame.origin.y -= 95
                lbl.frame.origin.x += tx
                lbl.alpha = 0
            } completion: { _ in lbl.removeFromSuperview() }
        }
    }

    private func pulseScore() {
        UIView.animate(withDuration: 0.12, animations: {
            self.scorePillView.transform = CGAffineTransform(scaleX: 1.28, y: 1.28)
        }) { _ in
            UIView.animate(withDuration: 0.22, delay: 0,
                           usingSpringWithDamping: 0.45, initialSpringVelocity: 0.5, options: []) {
                self.scorePillView.transform = .identity
            }
        }
    }

    private func showNextBtn() {
        nextBtn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        nextBtn.isHidden = false
        UIView.animate(withDuration: 0.55, delay: 0,
                       usingSpringWithDamping: 0.50, initialSpringVelocity: 0.6, options: []) {
            self.nextBtn.alpha = 1
            self.nextBtn.transform = .identity
        }
    }

    // MARK: - Score / Round
    private func updateScore() {
        scoreLabel.text = "🎯  \(score) / \(pairs.count)"
    }

    private func updateRoundLabel() {
        roundLabel.text = totalRounds > 1 ? "Round \(roundsPlayed + 1) of \(totalRounds)" : ""
    }

    @objc private func didTapNext() { dealRound() }

    // MARK: - Completion
    private func showCompletion() {
        gameTimer?.invalidate()
        let xp = isSpeedRound ? score * 3 : score * 2
        Session.shared.addXP(xp)
        let nudgeContext: MotivationManager.Context = isSpeedRound
            ? .speedRoundComplete(score: score)
            : .puzzleComplete(score: score)
        MotivationManager.shared.nudge(for: nudgeContext, in: view, delay: 1.2)

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.10, blue: 0.45, alpha: 1)
        card.layer.cornerRadius = 30
        card.layer.borderWidth  = 2.5
        card.layer.borderColor  = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1).cgColor
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        card.alpha = 0
        overlay.addSubview(card)

        func lbl(_ t: String, _ sz: CGFloat, bold: Bool = false, color: UIColor = .white) -> UILabel {
            let l = UILabel(); l.translatesAutoresizingMaskIntoConstraints = false
            l.text = t; l.textColor = color; l.textAlignment = .center; l.numberOfLines = 0
            l.font = bold ? UIFont.boldSystemFont(ofSize: sz) : UIFont.systemFont(ofSize: sz)
            return l
        }

        let emoji = lbl("🌍", 60)
        let stars = lbl(starsString(), 30)
        let title = lbl("Explorer!", 26, bold: true)
        let sub   = lbl("You matched \(score) out of \(pairs.count) pairs", 15,
                        color: UIColor.white.withAlphaComponent(0.72))
        let xpLbl = lbl("+\(xp) XP", 22, bold: true,
                        color: UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1))

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Awesome! ✓", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        doneBtn.backgroundColor = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1)
        doneBtn.layer.cornerRadius = 24
        doneBtn.layer.shadowColor   = UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1).cgColor
        doneBtn.layer.shadowOpacity = 0.5
        doneBtn.layer.shadowOffset  = CGSize(width: 0, height: 4)
        doneBtn.layer.shadowRadius  = 8
        doneBtn.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        for v in [emoji, stars, title, sub, xpLbl, doneBtn] { card.addSubview(v) }

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 290),

            emoji.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),
            emoji.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            stars.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 2),
            stars.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            title.topAnchor.constraint(equalTo: stars.bottomAnchor, constant: 6),
            title.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6),
            sub.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            sub.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            xpLbl.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 12),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 20),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 180),
            doneBtn.heightAnchor.constraint(equalToConstant: 50),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28),
        ])

        UIView.animate(withDuration: 0.25) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.5, delay: 0.1,
                       usingSpringWithDamping: 0.60, initialSpringVelocity: 0.8, options: []) {
            card.alpha = 1; card.transform = .identity
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.launchConfetti(in: overlay)
        }
    }

    private func starsString() -> String {
        let pct = Double(score) / Double(max(1, pairs.count))
        if pct >= 0.9 { return "⭐️⭐️⭐️" }
        if pct >= 0.6 { return "⭐️⭐️" }
        return "⭐️"
    }

    private func launchConfetti(in container: UIView) {
        let emojis = ["🎉", "⭐️", "✨", "🌟", "🎊", "💫", "🥳", "🎈"]
        let bounds = container.bounds
        for _ in 0..<22 {
            let lbl = UILabel()
            lbl.text = emojis.randomElement()
            lbl.font = .systemFont(ofSize: CGFloat.random(in: 18...30))
            lbl.sizeToFit()
            lbl.frame.origin = CGPoint(x: CGFloat.random(in: 0...(bounds.width - 40)), y: -50)
            container.addSubview(lbl)
            container.sendSubviewToBack(lbl)
            UIView.animate(
                withDuration: Double.random(in: 1.8...3.5),
                delay: Double.random(in: 0...1.2),
                options: .curveEaseIn
            ) {
                lbl.frame.origin.y = bounds.height + 60
                lbl.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -1.5...1.5))
            } completion: { _ in lbl.removeFromSuperview() }
        }
    }

    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }
}
