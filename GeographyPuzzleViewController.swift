import UIKit

// MARK: - GeographyPuzzleViewController
// Tap-to-match puzzle: left column (prompts) + right column (answers)

final class GeographyPuzzleViewController: UIViewController {

    // MARK: - Puzzle types
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

    // MARK: - Data
    private struct Pair { let prompt: String; let answer: String }

    private let capitalData: [Pair] = [
        .init(prompt: "Paris",      answer: "France"),
        .init(prompt: "Berlin",     answer: "Germany"),
        .init(prompt: "Tokyo",      answer: "Japan"),
        .init(prompt: "Ottawa",     answer: "Canada"),
        .init(prompt: "Canberra",   answer: "Australia"),
        .init(prompt: "Brasília",   answer: "Brazil"),
        .init(prompt: "Cairo",      answer: "Egypt"),
        .init(prompt: "Moscow",     answer: "Russia"),
        .init(prompt: "Beijing",    answer: "China"),
        .init(prompt: "Rome",       answer: "Italy"),
        .init(prompt: "Madrid",     answer: "Spain"),
        .init(prompt: "Athens",     answer: "Greece"),
        .init(prompt: "Stockholm",  answer: "Sweden"),
        .init(prompt: "Amsterdam",  answer: "Netherlands"),
        .init(prompt: "Nairobi",    answer: "Kenya"),
        .init(prompt: "Bangkok",    answer: "Thailand"),
        .init(prompt: "Buenos Aires", answer: "Argentina"),
        .init(prompt: "Lima",       answer: "Peru"),
        .init(prompt: "Seoul",      answer: "South Korea"),
        .init(prompt: "Lisbon",     answer: "Portugal"),
    ]

    private let continentData: [Pair] = [
        .init(prompt: "France",      answer: "Europe"),
        .init(prompt: "Brazil",      answer: "South America"),
        .init(prompt: "Kenya",       answer: "Africa"),
        .init(prompt: "Japan",       answer: "Asia"),
        .init(prompt: "Australia",   answer: "Oceania"),
        .init(prompt: "Canada",      answer: "North America"),
        .init(prompt: "Egypt",       answer: "Africa"),
        .init(prompt: "India",       answer: "Asia"),
        .init(prompt: "Mexico",      answer: "North America"),
        .init(prompt: "Argentina",   answer: "South America"),
        .init(prompt: "Germany",     answer: "Europe"),
        .init(prompt: "China",       answer: "Asia"),
        .init(prompt: "Nigeria",     answer: "Africa"),
        .init(prompt: "Peru",        answer: "South America"),
        .init(prompt: "Sweden",      answer: "Europe"),
        .init(prompt: "New Zealand", answer: "Oceania"),
        .init(prompt: "USA",         answer: "North America"),
        .init(prompt: "Russia",      answer: "Europe/Asia"),
        .init(prompt: "South Korea", answer: "Asia"),
        .init(prompt: "Morocco",     answer: "Africa"),
    ]

    private let riverData: [Pair] = [
        .init(prompt: "Amazon",     answer: "Brazil"),
        .init(prompt: "Nile",       answer: "Egypt"),
        .init(prompt: "Thames",     answer: "UK"),
        .init(prompt: "Seine",      answer: "France"),
        .init(prompt: "Danube",     answer: "Germany"),
        .init(prompt: "Yangtze",    answer: "China"),
        .init(prompt: "Ganges",     answer: "India"),
        .init(prompt: "Mississippi", answer: "USA"),
        .init(prompt: "Congo",      answer: "DR Congo"),
        .init(prompt: "Volga",      answer: "Russia"),
        .init(prompt: "Rhine",      answer: "Germany"),
        .init(prompt: "Mekong",     answer: "Vietnam"),
        .init(prompt: "Zambezi",    answer: "Zimbabwe"),
        .init(prompt: "Colorado",   answer: "USA"),
        .init(prompt: "Tigris",     answer: "Iraq"),
    ]

    private var pairs: [Pair] = []
    private let pairsPerRound = 5

    // Match state
    private var selectedPromptIndex: Int? = nil
    private var selectedAnswerIndex:  Int? = nil
    private var matched: Set<Int> = []   // indices into pairs[]
    private var score = 0
    private var totalRounds = 0
    private var roundsPlayed = 0

    // MARK: - Theme
    private let geoBlue   = UIColor(red: 0.08, green: 0.28, blue: 0.62, alpha: 1)
    private let cardBg    = UIColor(red: 0.10, green: 0.22, blue: 0.46, alpha: 1)
    private let gradLayer = CAGradientLayer()

    // MARK: - UI
    private let backBtn      = UIButton(type: .system)
    private let titleLabel   = UILabel()
    private let instrLabel   = UILabel()
    private let scoreLabel   = UILabel()
    private var promptBtns:  [UIButton] = []
    private var answerBtns:  [UIButton] = []
    private let nextBtn      = UIButton(type: .system)

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
        switch puzzleType {
        case .capitalToCountry:   pairs = capitalData.shuffled()
        case .countryToContinent: pairs = continentData.shuffled()
        case .riverToCountry:     pairs = riverData.shuffled()
        }
        totalRounds = pairs.count / pairsPerRound
    }

    // MARK: - UI Setup

    private func setupUI() {
        gradLayer.colors = [
            UIColor(red: 0.04, green: 0.14, blue: 0.34, alpha: 1).cgColor,
            UIColor(red: 0.08, green: 0.22, blue: 0.48, alpha: 1).cgColor,
        ]
        gradLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)

        // Back
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = puzzleType.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        instrLabel.translatesAutoresizingMaskIntoConstraints = false
        instrLabel.text = puzzleType.instruction
        instrLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        instrLabel.font = UIFont.systemFont(ofSize: 13)
        instrLabel.textAlignment = .center
        view.addSubview(instrLabel)

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textColor = UIColor.systemYellow
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)

        // Next round button (hidden initially)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.setTitle("Next Round ▶", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nextBtn.backgroundColor = UIColor.systemYellow
        nextBtn.layer.cornerRadius = 22
        nextBtn.isHidden = true
        nextBtn.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        view.addSubview(nextBtn)

        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            instrLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            instrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            scoreLabel.topAnchor.constraint(equalTo: instrLabel.bottomAnchor, constant: 6),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextBtn.widthAnchor.constraint(equalToConstant: 200),
            nextBtn.heightAnchor.constraint(equalToConstant: 48),
        ])

        buildMatchButtons()
    }

    private func buildMatchButtons() {
        (promptBtns + answerBtns).forEach { $0.removeFromSuperview() }
        promptBtns = []; answerBtns = []

        for i in 0..<pairsPerRound {
            let p = makeMatchBtn(tag: i, isPrompt: true)
            let a = makeMatchBtn(tag: i, isPrompt: false)
            promptBtns.append(p)
            answerBtns.append(a)
            view.addSubview(p)
            view.addSubview(a)
        }
    }

    private func makeMatchBtn(tag: Int, isPrompt: Bool) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = tag
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = cardBg
        btn.layer.cornerRadius = 14
        btn.layer.borderWidth  = 1.5
        btn.layer.borderColor  = UIColor.white.withAlphaComponent(0.18).cgColor
        if isPrompt {
            btn.addTarget(self, action: #selector(didTapPrompt(_:)), for: .touchUpInside)
        } else {
            btn.addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        }
        return btn
    }

    // MARK: - Round management

    private func dealRound() {
        matched = []
        selectedPromptIndex = nil
        selectedAnswerIndex  = nil

        let start = roundsPlayed * pairsPerRound
        let end   = min(start + pairsPerRound, pairs.count)
        guard start < pairs.count else { showCompletion(); return }

        let roundPairs = Array(pairs[start..<end])
        let shuffledAnswers = roundPairs.map { $0.answer }.shuffled()

        for (i, btn) in promptBtns.enumerated() {
            btn.setTitle(roundPairs[i].prompt, for: .normal)
            styleBtn(btn, state: .normal)
            btn.isEnabled = true
        }
        for (i, btn) in answerBtns.enumerated() {
            btn.setTitle(shuffledAnswers[i], for: .normal)
            styleBtn(btn, state: .normal)
            btn.isEnabled = true
            // Store which pair index this answer belongs to via accessibilityLabel
            if let idx = roundPairs.firstIndex(where: { $0.answer == shuffledAnswers[i] }) {
                btn.accessibilityValue = "\(idx)"
            }
        }

        layoutMatchButtons()
        nextBtn.isHidden = true
        updateScore()
    }

    private func layoutMatchButtons() {
        let topStart = view.safeAreaLayoutGuide.topAnchor
        let rowH: CGFloat = 52
        let gap:  CGFloat = 10
        let topOffset: CGFloat = 130

        for (i, btn) in promptBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: topStart, constant: topOffset + CGFloat(i) * (rowH + gap)),
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
        for (i, btn) in answerBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: topStart, constant: topOffset + CGFloat(i) * (rowH + gap)),
                btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
    }

    // MARK: - Interaction

    @objc private func didTapPrompt(_ sender: UIButton) {
        let i = sender.tag
        if selectedPromptIndex == i {
            selectedPromptIndex = nil
            styleBtn(sender, state: .normal)
        } else {
            if let prev = selectedPromptIndex { styleBtn(promptBtns[prev], state: .normal) }
            selectedPromptIndex = i
            styleBtn(sender, state: .selected)
            tryMatch()
        }
    }

    @objc private func didTapAnswer(_ sender: UIButton) {
        let i = sender.tag
        if selectedAnswerIndex == i {
            selectedAnswerIndex = nil
            styleBtn(sender, state: .normal)
        } else {
            if let prev = selectedAnswerIndex { styleBtn(answerBtns[prev], state: .normal) }
            selectedAnswerIndex = i
            styleBtn(sender, state: .selected)
            tryMatch()
        }
    }

    private func tryMatch() {
        guard let pi = selectedPromptIndex, let ai = selectedAnswerIndex else { return }

        let start = roundsPlayed * pairsPerRound
        let promptPair = pairs[start + pi]
        let answerText = answerBtns[ai].title(for: .normal) ?? ""

        if promptPair.answer == answerText {
            // Correct!
            score += 1
            matched.insert(pi)
            styleBtn(promptBtns[pi], state: .correct)
            styleBtn(answerBtns[ai], state: .correct)
            promptBtns[pi].isEnabled = false
            answerBtns[ai].isEnabled = false
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } else {
            // Wrong
            styleBtn(promptBtns[pi], state: .wrong)
            styleBtn(answerBtns[ai], state: .wrong)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self else { return }
                self.styleBtn(self.promptBtns[pi], state: .normal)
                self.styleBtn(self.answerBtns[ai], state: .normal)
            }
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }

        selectedPromptIndex = nil
        selectedAnswerIndex  = nil
        updateScore()

        if matched.count == pairsPerRound {
            roundsPlayed += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
                guard let self else { return }
                let isLast = self.roundsPlayed * self.pairsPerRound >= self.pairs.count
                if isLast { self.showCompletion() } else { self.nextBtn.isHidden = false }
            }
        }
    }

    private enum BtnState { case normal, selected, correct, wrong }

    private func styleBtn(_ btn: UIButton, state: BtnState) {
        switch state {
        case .normal:
            btn.backgroundColor = cardBg
            btn.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
            btn.setTitleColor(.white, for: .normal)
        case .selected:
            btn.backgroundColor = geoBlue
            btn.layer.borderColor = UIColor.systemYellow.cgColor
            btn.setTitleColor(UIColor.systemYellow, for: .normal)
        case .correct:
            btn.backgroundColor = UIColor(red: 0.10, green: 0.55, blue: 0.25, alpha: 1)
            btn.layer.borderColor = UIColor.systemGreen.cgColor
            btn.setTitleColor(.white, for: .normal)
        case .wrong:
            btn.backgroundColor = UIColor(red: 0.55, green: 0.10, blue: 0.10, alpha: 1)
            btn.layer.borderColor = UIColor.systemRed.cgColor
            btn.setTitleColor(.white, for: .normal)
        }
    }

    private func updateScore() {
        let total = min(pairs.count, totalRounds * pairsPerRound)
        scoreLabel.text = "✅ \(score) matched"
    }

    @objc private func didTapNext() { dealRound() }

    // MARK: - Completion

    private func showCompletion() {
        let xp = score * 2
        Session.shared.addXP(xp)

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.06, green: 0.18, blue: 0.40, alpha: 1)
        card.layer.cornerRadius = 28
        card.layer.borderWidth  = 2
        card.layer.borderColor  = UIColor.systemYellow.cgColor
        card.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        card.alpha = 0
        overlay.addSubview(card)

        let emoji  = makeLabel("🌍", size: 56)
        let title  = makeLabel("Well done!", size: 26, bold: true)
        let sub    = makeLabel("You matched \(score) pairs!", size: 15)
        sub.textColor = UIColor.white.withAlphaComponent(0.7)
        let xpLbl  = makeLabel("+\(xp) XP", size: 22, bold: true)
        xpLbl.textColor = UIColor.systemYellow

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Done ✓", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        doneBtn.backgroundColor = UIColor.systemYellow
        doneBtn.layer.cornerRadius = 22
        doneBtn.addAction(UIAction { [weak self] _ in self?.navigationController?.popViewController(animated: true) }, for: .touchUpInside)

        for v in [emoji, title, sub, xpLbl, doneBtn] { card.addSubview(v) }

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 280),

            emoji.topAnchor.constraint(equalTo: card.topAnchor, constant: 28),
            emoji.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            title.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 8),
            title.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6),
            sub.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 10),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 20),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 150),
            doneBtn.heightAnchor.constraint(equalToConstant: 46),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24),
        ])

        UIView.animate(withDuration: 0.2) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) {
            card.alpha = 1; card.transform = .identity
        }
    }

    private func makeLabel(_ text: String, size: CGFloat, bold: Bool = false) -> UILabel {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = text
        l.textColor = .white
        l.font = bold ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }

    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }
}
