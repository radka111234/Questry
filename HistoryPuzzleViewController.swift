import UIKit

// MARK: - HistoryPuzzleViewController

final class HistoryPuzzleViewController: UIViewController {

    enum PuzzleType: CaseIterable {
        case eventToYear, personToEvent, inventionToPerson
        var title: String {
            switch self {
            case .eventToYear:      return "📅 Events & Dates"
            case .personToEvent:    return "👤 People & Events"
            case .inventionToPerson: return "💡 Inventions & Inventors"
            }
        }
        var instruction: String {
            switch self {
            case .eventToYear:      return "Match the event to the century/year"
            case .personToEvent:    return "Match the person to their achievement"
            case .inventionToPerson: return "Match the invention to its inventor"
            }
        }
    }

    var puzzleType: PuzzleType = .eventToYear

    private struct Pair { let prompt: String; let answer: String }

    private let eventYearData: [Pair] = [
        .init(prompt: "Moon Landing",          answer: "1969"),
        .init(prompt: "World War II ends",      answer: "1945"),
        .init(prompt: "French Revolution",      answer: "1789"),
        .init(prompt: "Columbus reaches America", answer: "1492"),
        .init(prompt: "Berlin Wall falls",      answer: "1989"),
        .init(prompt: "First World War begins", answer: "1914"),
        .init(prompt: "Declaration of Independence", answer: "1776"),
        .init(prompt: "Titanic sinks",          answer: "1912"),
        .init(prompt: "Internet invented",      answer: "1990s"),
        .init(prompt: "Great Fire of London",   answer: "1666"),
        .init(prompt: "Black Death hits Europe", answer: "1340s"),
        .init(prompt: "Roman Empire falls",     answer: "476 AD"),
        .init(prompt: "Wright Brothers first flight", answer: "1903"),
        .init(prompt: "Printing press invented", answer: "1440s"),
        .init(prompt: "Nelson Mandela elected", answer: "1994"),
    ]

    private let personEventData: [Pair] = [
        .init(prompt: "Neil Armstrong",   answer: "First on Moon"),
        .init(prompt: "Marie Curie",      answer: "Discovered radium"),
        .init(prompt: "Albert Einstein",  answer: "Theory of Relativity"),
        .init(prompt: "Charles Darwin",   answer: "Theory of Evolution"),
        .init(prompt: "Julius Caesar",    answer: "Ruled Roman Empire"),
        .init(prompt: "Cleopatra",        answer: "Last pharaoh of Egypt"),
        .init(prompt: "Martin Luther King", answer: "Civil Rights speech"),
        .init(prompt: "Napoleon Bonaparte", answer: "Conquered Europe"),
        .init(prompt: "Mahatma Gandhi",   answer: "Led Indian independence"),
        .init(prompt: "Isaac Newton",     answer: "Discovered gravity"),
        .init(prompt: "Leonardo da Vinci", answer: "Painted the Mona Lisa"),
        .init(prompt: "William Shakespeare", answer: "Wrote Hamlet"),
        .init(prompt: "Genghis Khan",     answer: "Built Mongol Empire"),
        .init(prompt: "Rosa Parks",       answer: "Refused to give up her seat"),
        .init(prompt: "Nikola Tesla",     answer: "Invented AC electricity"),
    ]

    private let inventionPersonData: [Pair] = [
        .init(prompt: "Telephone",        answer: "Alexander Bell"),
        .init(prompt: "Light bulb",       answer: "Thomas Edison"),
        .init(prompt: "Airplane",         answer: "Wright Brothers"),
        .init(prompt: "Printing press",   answer: "Johannes Gutenberg"),
        .init(prompt: "Steam engine",     answer: "James Watt"),
        .init(prompt: "Theory of gravity", answer: "Isaac Newton"),
        .init(prompt: "Penicillin",       answer: "Alexander Fleming"),
        .init(prompt: "Radio",            answer: "Guglielmo Marconi"),
        .init(prompt: "Vaccination",      answer: "Edward Jenner"),
        .init(prompt: "World Wide Web",   answer: "Tim Berners-Lee"),
        .init(prompt: "Dynamite",         answer: "Alfred Nobel"),
        .init(prompt: "Television",       answer: "John Baird"),
        .init(prompt: "Periodic table",   answer: "Dmitri Mendeleev"),
        .init(prompt: "DNA structure",    answer: "Watson & Crick"),
        .init(prompt: "Calculus",         answer: "Isaac Newton"),
    ]

    private var pairs: [Pair] = []
    private let pairsPerRound = 5

    private var selectedPromptIndex: Int? = nil
    private var selectedAnswerIndex:  Int? = nil
    private var matched: Set<Int> = []
    private var score = 0
    private var roundsPlayed = 0

    // Theme
    private let histBrown = UIColor(red: 0.45, green: 0.25, blue: 0.08, alpha: 1)
    private let cardBg    = UIColor(red: 0.28, green: 0.16, blue: 0.06, alpha: 1)
    private let gradLayer = CAGradientLayer()

    // UI
    private let backBtn    = UIButton(type: .system)
    private let titleLabel = UILabel()
    private let instrLabel = UILabel()
    private let scoreLabel = UILabel()
    private var promptBtns: [UIButton] = []
    private var answerBtns: [UIButton] = []
    private let nextBtn    = UIButton(type: .system)

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

    private func loadData() {
        switch puzzleType {
        case .eventToYear:      pairs = eventYearData.shuffled()
        case .personToEvent:    pairs = personEventData.shuffled()
        case .inventionToPerson: pairs = inventionPersonData.shuffled()
        }
    }

    private func setupUI() {
        gradLayer.colors = [
            UIColor(red: 0.18, green: 0.10, blue: 0.04, alpha: 1).cgColor,
            UIColor(red: 0.30, green: 0.18, blue: 0.06, alpha: 1).cgColor,
        ]
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
            let p = makeBtn(tag: i, isPrompt: true)
            let a = makeBtn(tag: i, isPrompt: false)
            promptBtns.append(p); answerBtns.append(a)
            view.addSubview(p); view.addSubview(a)
        }
    }

    private func makeBtn(tag: Int, isPrompt: Bool) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = tag
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = cardBg
        btn.layer.cornerRadius = 14
        btn.layer.borderWidth  = 1.5
        btn.layer.borderColor  = UIColor.white.withAlphaComponent(0.18).cgColor
        btn.addTarget(self, action: isPrompt ? #selector(didTapPrompt(_:)) : #selector(didTapAnswer(_:)), for: .touchUpInside)
        return btn
    }

    private func dealRound() {
        matched = []; selectedPromptIndex = nil; selectedAnswerIndex = nil
        let start = roundsPlayed * pairsPerRound
        guard start < pairs.count else { showCompletion(); return }
        let end = min(start + pairsPerRound, pairs.count)
        let roundPairs = Array(pairs[start..<end])
        let shuffledAnswers = roundPairs.map { $0.answer }.shuffled()

        for (i, btn) in promptBtns.enumerated() {
            btn.setTitle(i < roundPairs.count ? roundPairs[i].prompt : "", for: .normal)
            styleBtn(btn, .normal); btn.isEnabled = true
        }
        for (i, btn) in answerBtns.enumerated() {
            btn.setTitle(i < shuffledAnswers.count ? shuffledAnswers[i] : "", for: .normal)
            styleBtn(btn, .normal); btn.isEnabled = true
            if let idx = roundPairs.firstIndex(where: { $0.answer == shuffledAnswers[i] }) {
                btn.accessibilityValue = "\(idx)"
            }
        }
        layoutButtons()
        nextBtn.isHidden = true
        updateScore()
    }

    private func layoutButtons() {
        let top = view.safeAreaLayoutGuide.topAnchor
        let rowH: CGFloat = 54; let gap: CGFloat = 10; let topOff: CGFloat = 130
        for (i, btn) in promptBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: top, constant: topOff + CGFloat(i) * (rowH + gap)),
                btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
        for (i, btn) in answerBtns.enumerated() {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: top, constant: topOff + CGFloat(i) * (rowH + gap)),
                btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
                btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
                btn.heightAnchor.constraint(equalToConstant: rowH),
            ])
        }
    }

    @objc private func didTapPrompt(_ sender: UIButton) {
        let i = sender.tag
        if selectedPromptIndex == i { selectedPromptIndex = nil; styleBtn(sender, .normal) }
        else {
            if let p = selectedPromptIndex { styleBtn(promptBtns[p], .normal) }
            selectedPromptIndex = i; styleBtn(sender, .selected); tryMatch()
        }
    }

    @objc private func didTapAnswer(_ sender: UIButton) {
        let i = sender.tag
        if selectedAnswerIndex == i { selectedAnswerIndex = nil; styleBtn(sender, .normal) }
        else {
            if let p = selectedAnswerIndex { styleBtn(answerBtns[p], .normal) }
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
            promptBtns[pi].isEnabled = false; answerBtns[ai].isEnabled = false
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } else {
            styleBtn(promptBtns[pi], .wrong); styleBtn(answerBtns[ai], .wrong)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self else { return }
                self.styleBtn(self.promptBtns[pi], .normal)
                self.styleBtn(self.answerBtns[ai], .normal)
            }
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
        selectedPromptIndex = nil; selectedAnswerIndex = nil
        updateScore()
        if matched.count == pairsPerRound {
            roundsPlayed += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
                guard let self else { return }
                if self.roundsPlayed * self.pairsPerRound >= self.pairs.count { self.showCompletion() }
                else { self.nextBtn.isHidden = false }
            }
        }
    }

    private enum S { case normal, selected, correct, wrong }
    private func styleBtn(_ btn: UIButton, _ s: S) {
        switch s {
        case .normal:   btn.backgroundColor = cardBg;  btn.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor; btn.setTitleColor(.white, for: .normal)
        case .selected: btn.backgroundColor = histBrown; btn.layer.borderColor = UIColor.systemYellow.cgColor; btn.setTitleColor(UIColor.systemYellow, for: .normal)
        case .correct:  btn.backgroundColor = UIColor(red: 0.10, green: 0.50, blue: 0.20, alpha: 1); btn.layer.borderColor = UIColor.systemGreen.cgColor; btn.setTitleColor(.white, for: .normal)
        case .wrong:    btn.backgroundColor = UIColor(red: 0.55, green: 0.10, blue: 0.10, alpha: 1); btn.layer.borderColor = UIColor.systemRed.cgColor; btn.setTitleColor(.white, for: .normal)
        }
    }

    private func updateScore() { scoreLabel.text = "✅ \(score) matched" }
    @objc private func didTapNext() { dealRound() }
    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }

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
        card.backgroundColor = UIColor(red: 0.22, green: 0.12, blue: 0.04, alpha: 1)
        card.layer.cornerRadius = 28
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.systemYellow.cgColor
        card.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        card.alpha = 0
        overlay.addSubview(card)

        func lbl(_ t: String, _ sz: CGFloat, bold: Bool = false) -> UILabel {
            let l = UILabel(); l.translatesAutoresizingMaskIntoConstraints = false
            l.text = t; l.textColor = .white; l.textAlignment = .center; l.numberOfLines = 0
            l.font = bold ? UIFont.boldSystemFont(ofSize: sz) : UIFont.systemFont(ofSize: sz)
            return l
        }
        let emoji = lbl("📜", 56); let title = lbl("History Master!", 24, bold: true)
        let sub   = lbl("You matched \(score) pairs!", 15)
        sub.textColor = UIColor.white.withAlphaComponent(0.7)
        let xpLbl = lbl("+\(xp) XP", 20, bold: true); xpLbl.textColor = UIColor.systemYellow

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Done ✓", for: .normal); doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        doneBtn.backgroundColor = UIColor.systemYellow; doneBtn.layer.cornerRadius = 22
        doneBtn.addAction(UIAction { [weak self] _ in self?.navigationController?.popViewController(animated: true) }, for: .touchUpInside)

        for v in [emoji, title, sub, xpLbl, doneBtn] { card.addSubview(v) }
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor), overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor), overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor), card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 280),
            emoji.topAnchor.constraint(equalTo: card.topAnchor, constant: 28), emoji.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            title.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 8), title.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6), sub.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 10), xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 20), doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 150), doneBtn.heightAnchor.constraint(equalToConstant: 46),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24),
        ])
        UIView.animate(withDuration: 0.2) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) { card.alpha = 1; card.transform = .identity }
    }
}
