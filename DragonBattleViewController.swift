import UIKit

/// A "Player vs Dragon" matching game.
/// Both the player and the dragon try to match pairs from the same pool.
/// The dragon picks a random unmatched pair every few seconds.
/// Whoever matches more pairs wins.
final class DragonBattleViewController: UIViewController {

    // MARK: - Config

    enum Subject { case geography, history, english }
    var subject: Subject = .geography

    // MARK: - Data

    private struct Pair { let prompt: String; let answer: String }

    private var allPairs: [Pair] = []
    private var availablePairs: [Pair] = []    // pairs not yet matched by either side
    private var playerScore = 0
    private var dragonScore = 0

    // MARK: - Dragon AI

    private var dragonTimer: Timer?
    /// Dragon speed depends on difficulty — faster dragon = harder battle
    private var dragonInterval: TimeInterval {
        let diff = AdaptiveDifficultyManager.shared.difficulty(for: subjectKey)
        switch diff {
        case 0:  return Double.random(in: 4.5...7.0)   // easy — slow dragon
        case 2:  return Double.random(in: 1.5...3.0)   // hard — fast dragon
        default: return Double.random(in: 2.8...5.0)   // medium
        }
    }

    private var subjectKey: String {
        switch subject {
        case .geography: return "geography"
        case .history:   return "history"
        case .english:   return "english"
        }
    }

    // MARK: - UI

    private let gradLayer     = CAGradientLayer()
    private let backBtn       = UIButton(type: .system)

    // Header
    private let dragonAvatarView  = UIImageView()
    private let dragonNameLabel   = UILabel()
    private let dragonScoreLabel  = UILabel()
    private let vsLabel           = UILabel()
    private let playerAvatarView  = UIImageView()
    private let playerNameLabel   = UILabel()
    private let playerScoreLabel  = UILabel()
    private let timerLabel        = UILabel()

    // Battle board
    private let boardCard         = UIView()
    private let instructionLabel  = UILabel()
    private var promptBtns:  [UIButton] = []
    private var answerBtns:  [UIButton] = []
    private var selectedPromptIndex: Int?
    private var selectedAnswerIndex: Int?

    // Dragon "thinking" indicator
    private let dragonThinkLabel  = UILabel()

    // Round tracking
    private var roundPairs: [Pair] = []
    private let pairsPerRound = 4
    private var matchedByPlayer: Set<Int> = []
    private var matchedByDragon: Set<Int> = []

    // Game timer
    private var gameSecondsLeft = 90
    private var countdownTimer: Timer?

    // MARK: - Lifecycle

    private var gameStarted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !gameStarted else { return }
        gameStarted = true
        dealRound()
        startCountdown()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    deinit {
        dragonTimer?.invalidate()
        countdownTimer?.invalidate()
    }

    // MARK: - Data

    private func loadData() {
        switch subject {
        case .geography:
            allPairs = [
                Pair(prompt: "France",      answer: "Paris"),
                Pair(prompt: "Japan",       answer: "Tokyo"),
                Pair(prompt: "Brazil",      answer: "Brasília"),
                Pair(prompt: "Australia",   answer: "Canberra"),
                Pair(prompt: "Canada",      answer: "Ottawa"),
                Pair(prompt: "Germany",     answer: "Berlin"),
                Pair(prompt: "Egypt",       answer: "Cairo"),
                Pair(prompt: "China",       answer: "Beijing"),
                Pair(prompt: "India",       answer: "New Delhi"),
                Pair(prompt: "Russia",      answer: "Moscow"),
                Pair(prompt: "USA",         answer: "Washington D.C."),
                Pair(prompt: "Argentina",   answer: "Buenos Aires"),
                Pair(prompt: "Mexico",      answer: "Mexico City"),
                Pair(prompt: "Italy",       answer: "Rome"),
                Pair(prompt: "Spain",       answer: "Madrid"),
                Pair(prompt: "UK",          answer: "London"),
            ].shuffled()
        case .history:
            allPairs = [
                Pair(prompt: "Moon Landing",             answer: "1969"),
                Pair(prompt: "World War II ends",        answer: "1945"),
                Pair(prompt: "French Revolution",        answer: "1789"),
                Pair(prompt: "Columbus reaches America", answer: "1492"),
                Pair(prompt: "First iPhone released",    answer: "2007"),
                Pair(prompt: "Berlin Wall falls",        answer: "1989"),
                Pair(prompt: "First Olympic Games",      answer: "776 BC"),
                Pair(prompt: "End of apartheid",         answer: "1994"),
                Pair(prompt: "Newton",                   answer: "Gravity"),
                Pair(prompt: "Marie Curie",              answer: "Radioactivity"),
                Pair(prompt: "Telephone",                answer: "Bell"),
                Pair(prompt: "Light Bulb",               answer: "Edison"),
            ].shuffled()
        case .english:
            allPairs = [
                Pair(prompt: "Happy",      answer: "Joyful"),
                Pair(prompt: "Big",        answer: "Large"),
                Pair(prompt: "Angry",      answer: "Furious"),
                Pair(prompt: "Fast",       answer: "Quick"),
                Pair(prompt: "Smart",      answer: "Clever"),
                Pair(prompt: "Hot",        answer: "Cold"),
                Pair(prompt: "Light",      answer: "Heavy"),
                Pair(prompt: "Loud",       answer: "Quiet"),
                Pair(prompt: "Strong",     answer: "Weak"),
                Pair(prompt: "Ancient",    answer: "Very old"),
                Pair(prompt: "Enormous",   answer: "Very large"),
                Pair(prompt: "Brave",      answer: "Not afraid"),
            ].shuffled()
        }
        availablePairs = allPairs
    }

    // MARK: - Setup UI

    private func setupUI() {
        // Background gradient
        gradLayer.colors = gradColors
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)

        setupBackButton()
        setupHeader()
        setupBattleBoard()
        setupDragonThinkIndicator()
    }

    private var gradColors: [CGColor] {
        switch subject {
        case .geography: return [
            UIColor(red: 0.04, green: 0.06, blue: 0.38, alpha: 1).cgColor,
            UIColor(red: 0.12, green: 0.03, blue: 0.50, alpha: 1).cgColor,
        ]
        case .history: return [
            UIColor(red: 0.25, green: 0.08, blue: 0.02, alpha: 1).cgColor,
            UIColor(red: 0.45, green: 0.20, blue: 0.04, alpha: 1).cgColor,
        ]
        case .english: return [
            UIColor(red: 0.18, green: 0.04, blue: 0.40, alpha: 1).cgColor,
            UIColor(red: 0.03, green: 0.18, blue: 0.40, alpha: 1).cgColor,
        ]
        }
    }

    private func setupBackButton() {
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    private func setupHeader() {
        let username = Session.shared.currentUser?.username ?? "You"
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"

        // Dragon side
        dragonAvatarView.image       = UIImage(named: "dragon") ?? UIImage(systemName: "flame.fill")
        dragonAvatarView.contentMode = .scaleAspectFill
        dragonAvatarView.clipsToBounds = true
        dragonAvatarView.layer.cornerRadius = 28
        dragonAvatarView.layer.borderWidth  = 2
        dragonAvatarView.layer.borderColor  = UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1).cgColor
        dragonAvatarView.translatesAutoresizingMaskIntoConstraints = false

        dragonNameLabel.text      = "Dragon"
        dragonNameLabel.textColor = UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1)
        dragonNameLabel.font      = UIFont.boldSystemFont(ofSize: 14)
        dragonNameLabel.textAlignment = .center
        dragonNameLabel.translatesAutoresizingMaskIntoConstraints = false

        dragonScoreLabel.text      = "0"
        dragonScoreLabel.textColor = .white
        dragonScoreLabel.font      = UIFont.boldSystemFont(ofSize: 34)
        dragonScoreLabel.textAlignment = .center
        dragonScoreLabel.translatesAutoresizingMaskIntoConstraints = false

        // VS
        vsLabel.text      = "VS"
        vsLabel.textColor = UIColor.white.withAlphaComponent(0.55)
        vsLabel.font      = UIFont.boldSystemFont(ofSize: 18)
        vsLabel.textAlignment = .center
        vsLabel.translatesAutoresizingMaskIntoConstraints = false

        // Timer
        timerLabel.text      = "1:30"
        timerLabel.textColor = UIColor(red: 0.30, green: 0.95, blue: 0.65, alpha: 1)
        timerLabel.font      = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .bold)
        timerLabel.textAlignment = .center
        timerLabel.translatesAutoresizingMaskIntoConstraints = false

        // Player side
        playerAvatarView.image       = UIImage(named: avatarName)
        playerAvatarView.contentMode = .scaleAspectFill
        playerAvatarView.clipsToBounds = true
        playerAvatarView.layer.cornerRadius = 28
        playerAvatarView.layer.borderWidth  = 2
        playerAvatarView.layer.borderColor  = UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1).cgColor
        playerAvatarView.translatesAutoresizingMaskIntoConstraints = false

        playerNameLabel.text      = username
        playerNameLabel.textColor = UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1)
        playerNameLabel.font      = UIFont.boldSystemFont(ofSize: 14)
        playerNameLabel.textAlignment = .center
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false

        playerScoreLabel.text      = "0"
        playerScoreLabel.textColor = .white
        playerScoreLabel.font      = UIFont.boldSystemFont(ofSize: 34)
        playerScoreLabel.textAlignment = .center
        playerScoreLabel.translatesAutoresizingMaskIntoConstraints = false

        // Instruction
        instructionLabel.text      = "Tap a word, then its match!"
        instructionLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        instructionLabel.font      = UIFont.systemFont(ofSize: 13)
        instructionLabel.textAlignment = .center
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false

        for v in [dragonAvatarView, dragonNameLabel, dragonScoreLabel,
                  vsLabel, timerLabel,
                  playerAvatarView, playerNameLabel, playerScoreLabel,
                  instructionLabel] {
            view.addSubview(v)
        }

        let safe = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // Dragon column — left
            dragonAvatarView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 52),
            dragonAvatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dragonAvatarView.widthAnchor.constraint(equalToConstant: 56),
            dragonAvatarView.heightAnchor.constraint(equalToConstant: 56),

            dragonScoreLabel.topAnchor.constraint(equalTo: dragonAvatarView.bottomAnchor, constant: 2),
            dragonScoreLabel.centerXAnchor.constraint(equalTo: dragonAvatarView.centerXAnchor),

            dragonNameLabel.topAnchor.constraint(equalTo: dragonScoreLabel.bottomAnchor, constant: 2),
            dragonNameLabel.centerXAnchor.constraint(equalTo: dragonAvatarView.centerXAnchor),

            // Centre column
            vsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vsLabel.topAnchor.constraint(equalTo: safe.topAnchor, constant: 70),

            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: vsLabel.bottomAnchor, constant: 6),

            // Player column — right
            playerAvatarView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 52),
            playerAvatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playerAvatarView.widthAnchor.constraint(equalToConstant: 56),
            playerAvatarView.heightAnchor.constraint(equalToConstant: 56),

            playerScoreLabel.topAnchor.constraint(equalTo: playerAvatarView.bottomAnchor, constant: 2),
            playerScoreLabel.centerXAnchor.constraint(equalTo: playerAvatarView.centerXAnchor),

            playerNameLabel.topAnchor.constraint(equalTo: playerScoreLabel.bottomAnchor, constant: 2),
            playerNameLabel.centerXAnchor.constraint(equalTo: playerAvatarView.centerXAnchor),

            instructionLabel.topAnchor.constraint(equalTo: dragonNameLabel.bottomAnchor, constant: 12),
            instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func setupBattleBoard() {
        boardCard.translatesAutoresizingMaskIntoConstraints = false
        boardCard.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        boardCard.layer.cornerRadius = 28
        boardCard.layer.borderWidth  = 1.5
        boardCard.layer.borderColor  = UIColor.white.withAlphaComponent(0.12).cgColor
        view.addSubview(boardCard)

        NSLayoutConstraint.activate([
            boardCard.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 16),
            boardCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            boardCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            boardCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    private func setupDragonThinkIndicator() {
        dragonThinkLabel.translatesAutoresizingMaskIntoConstraints = false
        dragonThinkLabel.text      = ""
        dragonThinkLabel.textColor = UIColor(red: 1.0, green: 0.55, blue: 0.1, alpha: 0.9)
        dragonThinkLabel.font      = UIFont.systemFont(ofSize: 13, weight: .medium)
        dragonThinkLabel.textAlignment = .center
        view.addSubview(dragonThinkLabel)
        NSLayoutConstraint.activate([
            dragonThinkLabel.topAnchor.constraint(equalTo: boardCard.topAnchor, constant: -22),
            dragonThinkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    // MARK: - Round

    private func dealRound() {
        // Clear old buttons
        promptBtns.forEach { $0.removeFromSuperview() }
        answerBtns.forEach { $0.removeFromSuperview() }
        promptBtns = []; answerBtns = []
        selectedPromptIndex = nil; selectedAnswerIndex = nil
        matchedByPlayer = []; matchedByDragon = []

        guard !availablePairs.isEmpty else { endGame(); return }

        let count = min(pairsPerRound, availablePairs.count)
        roundPairs = Array(availablePairs.prefix(count))

        let shuffledAnswers = roundPairs.map { $0.answer }.shuffled()

        // Force layout so boardCard.bounds is valid (it may be zero before first layout)
        boardCard.layoutIfNeeded()

        let rows = count
        let btnH: CGFloat = max(44, min(52, (boardCard.bounds.height - 32 - CGFloat(rows - 1) * 10) / CGFloat(rows)))
        let colW: CGFloat = max(120, (boardCard.bounds.width - 48) / 2)
        let leftX: CGFloat = 16
        let rightX: CGFloat = boardCard.bounds.width / 2 + 8

        for i in 0..<count {
            let y: CGFloat = 16 + CGFloat(i) * (btnH + 10)

            let pBtn = makeBtn(title: roundPairs[i].prompt, tag: i, isPrompt: true)
            pBtn.frame = CGRect(x: leftX, y: y, width: colW, height: btnH)
            boardCard.addSubview(pBtn)
            promptBtns.append(pBtn)

            let aBtn = makeBtn(title: shuffledAnswers[i], tag: i, isPrompt: false)
            aBtn.frame = CGRect(x: rightX, y: y, width: colW, height: btnH)
            boardCard.addSubview(aBtn)
            answerBtns.append(aBtn)

            // Staggered entrance
            pBtn.alpha = 0; aBtn.alpha = 0
            pBtn.transform = CGAffineTransform(translationX: -30, y: 0)
            aBtn.transform = CGAffineTransform(translationX: 30, y: 0)
            UIView.animate(withDuration: 0.35, delay: Double(i) * 0.06,
                           usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: []) {
                pBtn.alpha = 1; aBtn.alpha = 1
                pBtn.transform = .identity; aBtn.transform = .identity
            }
        }

        // Player goes first — enable buttons and let dragon wait
        setPlayerInteraction(enabled: true)
        dragonTimer?.invalidate()
        dragonTimer = nil
        dragonThinkLabel.text = ""
    }

    /// Enable or disable all player-facing buttons.
    private func setPlayerInteraction(enabled: Bool) {
        promptBtns.forEach { btn in
            let idx = btn.tag
            let alreadyMatched = matchedByPlayer.contains(idx) || matchedByDragon.contains(idx)
            btn.isEnabled = enabled && !alreadyMatched
        }
        answerBtns.forEach { btn in
            let idx = btn.tag
            let alreadyMatched = matchedByPlayer.contains(idx) || matchedByDragon.contains(idx)
            btn.isEnabled = enabled && !alreadyMatched
        }
    }

    private func makeBtn(title: String, tag: Int, isPrompt: Bool) -> UIButton {
        let btn = UIButton(type: .system)
        btn.tag = tag
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.minimumScaleFactor = 0.7
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = isPrompt
            ? UIColor(red: 0.20, green: 0.35, blue: 0.75, alpha: 0.55)
            : UIColor(red: 0.10, green: 0.55, blue: 0.50, alpha: 0.55)
        btn.layer.cornerRadius = 14
        btn.layer.borderWidth  = 1.5
        btn.layer.borderColor  = UIColor.white.withAlphaComponent(0.20).cgColor
        btn.contentEdgeInsets  = UIEdgeInsets(top: 4, left: 6, bottom: 4, right: 6)

        if isPrompt {
            btn.addTarget(self, action: #selector(didTapPrompt(_:)), for: .touchUpInside)
        } else {
            btn.addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        }
        return btn
    }

    // MARK: - Player input

    @objc private func didTapPrompt(_ sender: UIButton) {
        let i = sender.tag
        guard !matchedByPlayer.contains(i) && !matchedByDragon.contains(i) else { return }
        // Deselect previous
        if let prev = selectedPromptIndex { styleBtn(promptBtns[prev], state: .normal, isPrompt: true) }
        selectedPromptIndex = i
        styleBtn(sender, state: .selected, isPrompt: true)
        tryPlayerMatch()
    }

    @objc private func didTapAnswer(_ sender: UIButton) {
        let i = sender.tag
        guard !matchedByPlayer.contains(i) && !matchedByDragon.contains(i) else { return }
        if let prev = selectedAnswerIndex { styleBtn(answerBtns[prev], state: .normal, isPrompt: false) }
        selectedAnswerIndex = i
        styleBtn(sender, state: .selected, isPrompt: false)
        tryPlayerMatch()
    }

    private func tryPlayerMatch() {
        guard let pi = selectedPromptIndex, let ai = selectedAnswerIndex else { return }
        selectedPromptIndex = nil; selectedAnswerIndex = nil

        // Lock player buttons — it's now the dragon's turn
        setPlayerInteraction(enabled: false)

        let prompt = roundPairs[pi].prompt
        let answer = answerBtns[ai].title(for: .normal) ?? ""

        if roundPairs[pi].answer == answer {
            // Correct!
            playerScore += 1
            matchedByPlayer.insert(pi)
            styleBtn(promptBtns[pi], state: .playerCorrect, isPrompt: true)
            styleBtn(answerBtns[ai], state: .playerCorrect, isPrompt: false)
            promptBtns[pi].isEnabled = false; answerBtns[ai].isEnabled = false
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            pulseScore(playerScoreLabel, color: UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1))
            updateScoreLabels()
            AdaptiveDifficultyManager.shared.recordResult(subject: subjectKey, correct: true)
            if Bool.random() { MotivationManager.shared.speak(for: .correctAnswer) }

            if checkRoundCompleteAfterPlayer() { return }  // round ended — dragon skips
        } else {
            // Wrong — show flash then hand to dragon
            styleBtn(promptBtns[pi], state: .wrong, isPrompt: true)
            styleBtn(answerBtns[ai], state: .wrong, isPrompt: false)
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            SpacedRepetitionManager.shared.recordMiss(subject: subjectKey, prompt: prompt, answer: roundPairs[pi].answer)
            AdaptiveDifficultyManager.shared.recordResult(subject: subjectKey, correct: false)
            MotivationManager.shared.speak(for: .wrongAnswer)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) { [weak self] in
                guard let self else { return }
                self.styleBtn(self.promptBtns[pi], state: .normal, isPrompt: true)
                self.styleBtn(self.answerBtns[ai], state: .normal, isPrompt: false)
            }
        }

        // Dragon takes its turn after a short delay
        scheduleDragonTurnAfterPlayer()
    }

    /// Schedule the dragon's response immediately after the player's turn.
    private func scheduleDragonTurnAfterPlayer() {
        dragonTimer?.invalidate()
        let delay = Double.random(in: 0.9...1.8)
        showDragonThinking(in: delay)
        dragonTimer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { [weak self] _ in
            self?.dragonMakesMove()
        }
    }

    /// Returns true if the round is over (so we skip starting the dragon's turn).
    @discardableResult
    private func checkRoundCompleteAfterPlayer() -> Bool {
        let allMatched = matchedByPlayer.count + matchedByDragon.count == roundPairs.count
        guard allMatched else { return false }
        dragonTimer?.invalidate()
        availablePairs = Array(availablePairs.dropFirst(roundPairs.count))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            guard let self else { return }
            if self.availablePairs.isEmpty || self.gameSecondsLeft <= 0 { self.endGame() }
            else { self.dealRound() }
        }
        return true
    }

    // MARK: - Dragon AI

    private func scheduleDragonMove() {
        dragonTimer?.invalidate()
        let interval = dragonInterval
        showDragonThinking(in: interval)
        dragonTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
            self?.dragonMakesMove()
        }
    }

    private func dragonMakesMove() {
        // Find an unmatched pair index
        let unmatched = (0..<roundPairs.count).filter {
            !matchedByPlayer.contains($0) && !matchedByDragon.contains($0)
        }
        guard let pi = unmatched.randomElement() else { checkRoundComplete(); return }

        // Find the correct answer button
        let correctAnswer = roundPairs[pi].answer
        guard let ai = answerBtns.firstIndex(where: {
            $0.title(for: .normal) == correctAnswer && !matchedByDragon.contains($0.tag) && !matchedByPlayer.contains($0.tag)
        }) else { scheduleDragonMove(); return }

        dragonScore += 1
        matchedByDragon.insert(pi)

        // Animate dragon selection flash
        styleBtn(promptBtns[pi], state: .dragonCorrect, isPrompt: true)
        styleBtn(answerBtns[ai], state: .dragonCorrect, isPrompt: false)
        promptBtns[pi].isEnabled = false; answerBtns[ai].isEnabled = false

        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        pulseScore(dragonScoreLabel, color: UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1))
        updateScoreLabels()
        dragonThinkLabel.text = ""

        // Dragon gloat
        let gloats = ["Ha! Too slow! 🐉", "Got one! 🔥", "Dragon wins this one! ⚡", "Watch and learn! 🐲"]
        dragonThinkLabel.text = gloats.randomElement()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            self?.dragonThinkLabel.text = ""
        }

        // Check if round is over
        if checkRoundCompleteAfterPlayer() { return }

        // Hand control back to the player
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.setPlayerInteraction(enabled: true)
        }
    }

    private func showDragonThinking(in seconds: TimeInterval) {
        let thoughts = ["🐉 thinking...", "🐉 scanning...", "🐉 calculating..."]
        DispatchQueue.main.asyncAfter(deadline: .now() + max(0, seconds - 1.2)) { [weak self] in
            guard let self else { return }
            self.dragonThinkLabel.text = thoughts.randomElement()
        }
    }

    // MARK: - Round complete

    // (Kept for legacy call sites — new turn-based flow uses checkRoundCompleteAfterPlayer)
    private func checkRoundComplete() {
        _ = checkRoundCompleteAfterPlayer()
    }

    // MARK: - Countdown

    private func startCountdown() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.gameSecondsLeft -= 1
            let m = self.gameSecondsLeft / 60
            let s = self.gameSecondsLeft % 60
            self.timerLabel.text = String(format: "%d:%02d", m, s)
            if self.gameSecondsLeft <= 10 {
                self.timerLabel.textColor = UIColor(red: 1.0, green: 0.35, blue: 0.25, alpha: 1)
            }
            if self.gameSecondsLeft <= 0 {
                self.countdownTimer?.invalidate()
                self.dragonTimer?.invalidate()
                self.endGame()
            }
        }
    }

    // MARK: - End Game

    private func endGame() {
        dragonTimer?.invalidate()
        countdownTimer?.invalidate()

        let playerWon = playerScore > dragonScore
        let tie       = playerScore == dragonScore

        // XP reward
        let xp = playerWon ? playerScore * 4 : max(playerScore * 2, 10)
        Session.shared.addXP(xp)

        showResultOverlay(playerWon: playerWon, tie: tie, xp: xp)
    }

    private func showResultOverlay(playerWon: Bool, tie: Bool, xp: Int) {
        let dim = UIView()
        dim.backgroundColor = UIColor.black.withAlphaComponent(0)
        dim.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: view.topAnchor),
            dim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.20, alpha: 0.97)
        card.layer.cornerRadius = 32
        card.layer.borderWidth  = 2.5
        card.layer.borderColor  = (playerWon
            ? UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1)
            : tie
                ? UIColor.systemYellow
                : UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1)
        ).cgColor
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        dim.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: dim.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: dim.centerYAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: dim.leadingAnchor, constant: 28),
            card.trailingAnchor.constraint(equalTo: dim.trailingAnchor, constant: -28),
        ])

        func lbl(_ t: String, sz: CGFloat, bold: Bool = false, color: UIColor = .white, lines: Int = 1) -> UILabel {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = t; l.textColor = color; l.numberOfLines = lines
            l.textAlignment = .center
            l.font = bold ? UIFont.boldSystemFont(ofSize: sz) : UIFont.systemFont(ofSize: sz)
            return l
        }

        let trophy  = lbl(playerWon ? "🏆" : tie ? "🤝" : "🐉", sz: 56)
        let headline = lbl(
            playerWon ? "You beat the Dragon!" : tie ? "It's a Tie!" : "Dragon Wins!",
            sz: 28, bold: true
        )
        let sub = lbl(
            playerWon ? "Amazing! You outsmarted me! 🎉" : tie ? "So close — we matched!" : "I'm the champ... for now! 😈",
            sz: 15,
            color: UIColor.white.withAlphaComponent(0.65),
            lines: 2
        )
        let scores = lbl("You \(playerScore)  ·  Dragon \(dragonScore)", sz: 22, bold: true,
                         color: UIColor.white.withAlphaComponent(0.85))
        let xpLbl  = lbl("+\(xp) XP earned!", sz: 17, bold: true,
                         color: UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1))

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Back to Hub", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        doneBtn.backgroundColor = playerWon
            ? UIColor(red: 0.25, green: 0.90, blue: 0.70, alpha: 1)
            : UIColor(red: 1.0, green: 0.45, blue: 0.1, alpha: 1)
        doneBtn.layer.cornerRadius = 22
        doneBtn.clipsToBounds = true

        for v in [trophy, headline, sub, scores, xpLbl, doneBtn] { card.addSubview(v) }
        NSLayoutConstraint.activate([
            trophy.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),
            trophy.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            headline.topAnchor.constraint(equalTo: trophy.bottomAnchor, constant: 8),
            headline.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            headline.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            sub.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 8),
            sub.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            sub.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            scores.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 20),
            scores.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            xpLbl.topAnchor.constraint(equalTo: scores.bottomAnchor, constant: 8),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 24),
            doneBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            doneBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            doneBtn.heightAnchor.constraint(equalToConstant: 50),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28),
        ])

        UIView.animate(withDuration: 0.22) { dim.backgroundColor = UIColor.black.withAlphaComponent(0.60) }
        UIView.animate(withDuration: 0.5, delay: 0.05,
                       usingSpringWithDamping: 0.62, initialSpringVelocity: 0.9, options: []) {
            card.alpha = 1; card.transform = .identity
        }

        if playerWon {
            MotivationManager.shared.nudge(for: .puzzleComplete(score: playerScore), in: view, delay: 0.8)
        }

        launchConfetti(in: dim, playerWon: playerWon)

        doneBtn.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
    }

    // MARK: - Confetti

    private func launchConfetti(in container: UIView, playerWon: Bool) {
        guard playerWon else { return }
        let emojis = ["🎉", "⭐", "✨", "🌟", "💫", "🏆"]
        for _ in 0..<18 {
            let lbl = UILabel()
            lbl.text = emojis.randomElement()
            lbl.font = UIFont.systemFont(ofSize: CGFloat.random(in: 18...32))
            let x = CGFloat.random(in: 20...(view.bounds.width - 20))
            lbl.frame = CGRect(x: x, y: -40, width: 40, height: 40)
            container.addSubview(lbl)
            let duration = Double.random(in: 1.6...2.8)
            let endY = view.bounds.height + 40
            UIView.animate(withDuration: duration, delay: Double.random(in: 0...0.6),
                           options: [.curveEaseIn]) {
                lbl.frame.origin.y = endY
                lbl.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -.pi ... .pi))
            } completion: { _ in lbl.removeFromSuperview() }
        }
    }

    // MARK: - Button styling

    private enum BtnState { case normal, selected, playerCorrect, dragonCorrect, wrong }

    private func styleBtn(_ btn: UIButton, state: BtnState, isPrompt: Bool) {
        let base: UIColor = isPrompt
            ? UIColor(red: 0.20, green: 0.35, blue: 0.75, alpha: 0.55)
            : UIColor(red: 0.10, green: 0.55, blue: 0.50, alpha: 0.55)

        switch state {
        case .normal:
            btn.backgroundColor = base
            btn.layer.borderColor = UIColor.white.withAlphaComponent(0.20).cgColor
            btn.layer.borderWidth = 1.5
        case .selected:
            btn.backgroundColor = base.withAlphaComponent(0.85)
            btn.layer.borderColor = UIColor.systemYellow.cgColor
            btn.layer.borderWidth = 2.5
        case .playerCorrect:
            btn.backgroundColor = UIColor(red: 0.12, green: 0.78, blue: 0.42, alpha: 1)
            btn.layer.borderColor = UIColor.clear.cgColor
        case .dragonCorrect:
            btn.backgroundColor = UIColor(red: 0.85, green: 0.35, blue: 0.05, alpha: 1)
            btn.layer.borderColor = UIColor.clear.cgColor
        case .wrong:
            btn.backgroundColor = UIColor(red: 0.85, green: 0.15, blue: 0.18, alpha: 1)
            btn.layer.borderColor = UIColor.clear.cgColor
        }
    }

    // MARK: - Score pulse

    private func pulseScore(_ label: UILabel, color: UIColor) {
        let original = label.textColor
        UIView.animate(withDuration: 0.12, animations: {
            label.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            label.textColor = color
        }) { _ in
            UIView.animate(withDuration: 0.22, delay: 0,
                           usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: []) {
                label.transform = .identity
            }
            UIView.animate(withDuration: 0.6, delay: 0.3) { label.textColor = original }
        }
    }

    private func updateScoreLabels() {
        playerScoreLabel.text = "\(playerScore)"
        dragonScoreLabel.text = "\(dragonScore)"
    }

    // MARK: - Navigation

    @objc private func didTapBack() {
        dragonTimer?.invalidate()
        countdownTimer?.invalidate()
        navigationController?.popViewController(animated: true)
    }
}
