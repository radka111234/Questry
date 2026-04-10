import UIKit

// MARK: - TimedExamViewController
// Multiple-choice timed exam for any subject.
// Set `subject` and `topicId` before pushing.

final class TimedExamViewController: UIViewController {

    // MARK: - Configuration
    var subject: String = "Math"
    var topicId: Int    = 1
    var totalTime: Int  = 90          // seconds

    // MARK: - State
    private var questions: [MathExamQuestion] = []
    private var currentIndex = 0
    private var score        = 0
    private var timeLeft     = 90
    private var countTimer: Timer?
    private var answerLocked = false
    private var resultShown  = false

    // MARK: - UI
    private let gradLayer       = CAGradientLayer()
    private let backBtn         = UIButton(type: .system)
    private let timerPill       = UIView()
    private let timerLabel      = UILabel()
    private let progressLabel   = UILabel()   // "Question X of Y"
    private let questionCard    = UIView()
    private let questionLabel   = UILabel()
    private let optionStack     = UIStackView()  // 2 rows × 2 cols
    private let scoreBar        = UIView()
    private let scoreLbl        = UILabel()

    private var optionButtons: [UIButton] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLeft = totalTime
        loadQuestions()
        setupBackground()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showQuestion()
        startTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        countTimer?.invalidate()
    }

    // MARK: - Data
    private func loadQuestions() {
        let raw: [MathExamQuestion]
        switch subject.lowercased() {
        case "math":       raw = MathGameData.examQuestions(for: topicId)
        case "geography":  raw = GeographyGameData.examQuestions(for: topicId)
        case "english":    raw = EnglishGameData.examQuestions(for: topicId)
        case "history":    raw = HistoryGameData.examQuestions(for: topicId)
        case "science":    raw = ScienceGameData.examQuestions(for: topicId)
        default:           raw = []
        }
        // filter questions that have a valid correctIndex and at least 2 options
        let valid = raw.filter { q in
            guard let ci = q.correctIndex else { return false }
            return q.options.count >= 2 && ci < q.options.count
        }
        questions = Array(valid.shuffled().prefix(10))
    }

    // MARK: - Background
    private func setupBackground() {
        let (top, bot) = subjectGradient
        gradLayer.colors = [top.cgColor, bot.cgColor]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)
    }

    private var subjectGradient: (UIColor, UIColor) {
        switch subject.lowercased() {
        case "math":
            return (UIColor(red: 0.18, green: 0.08, blue: 0.48, alpha: 1),
                    UIColor(red: 0.08, green: 0.04, blue: 0.28, alpha: 1))
        case "geography":
            return (UIColor(red: 0.06, green: 0.08, blue: 0.42, alpha: 1),
                    UIColor(red: 0.14, green: 0.04, blue: 0.54, alpha: 1))
        case "english":
            return (UIColor(red: 0.20, green: 0.05, blue: 0.44, alpha: 1),
                    UIColor(red: 0.04, green: 0.20, blue: 0.42, alpha: 1))
        case "history":
            return (UIColor(red: 0.28, green: 0.10, blue: 0.02, alpha: 1),
                    UIColor(red: 0.48, green: 0.22, blue: 0.05, alpha: 1))
        case "science":
            return (UIColor(red: 0.04, green: 0.22, blue: 0.20, alpha: 1),
                    UIColor(red: 0.08, green: 0.34, blue: 0.14, alpha: 1))
        default:
            return (UIColor(red: 0.10, green: 0.10, blue: 0.30, alpha: 1),
                    UIColor(red: 0.06, green: 0.06, blue: 0.20, alpha: 1))
        }
    }

    private var accentColor: UIColor {
        switch subject.lowercased() {
        case "math":      return UIColor(red: 0.60, green: 0.20, blue: 0.95, alpha: 1)
        case "geography": return UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1)
        case "english":   return UIColor(red: 0.80, green: 0.20, blue: 0.90, alpha: 1)
        case "history":   return UIColor(red: 0.92, green: 0.42, blue: 0.08, alpha: 1)
        case "science":   return UIColor(red: 0.10, green: 0.80, blue: 0.55, alpha: 1)
        default:          return UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1)
        }
    }

    private var subjectEmoji: String {
        switch subject.lowercased() {
        case "math":      return "🔢"
        case "geography": return "🗺️"
        case "english":   return "✍️"
        case "history":   return "📜"
        case "science":   return "🔬"
        default:          return "📚"
        }
    }

    // MARK: - UI Setup
    private func setupUI() {
        // Back button
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        // Title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "\(subjectEmoji) \(subject) Exam"
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        view.addSubview(title)

        // Timer pill
        timerPill.translatesAutoresizingMaskIntoConstraints = false
        timerPill.backgroundColor = UIColor(red: 0.10, green: 0.72, blue: 0.42, alpha: 1)
        timerPill.layer.cornerRadius = 14
        timerPill.layer.masksToBounds = true
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.textColor = .white
        timerLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .bold)
        timerLabel.text = formatTime(timeLeft)
        timerPill.addSubview(timerLabel)
        view.addSubview(timerPill)

        // Progress label
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.textColor = UIColor.white.withAlphaComponent(0.60)
        progressLabel.font = UIFont.systemFont(ofSize: 14)
        progressLabel.textAlignment = .center
        view.addSubview(progressLabel)

        // Question card
        questionCard.translatesAutoresizingMaskIntoConstraints = false
        questionCard.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        questionCard.layer.cornerRadius = 22
        questionCard.layer.borderWidth = 1.5
        questionCard.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        view.addSubview(questionCard)

        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textColor = .white
        questionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionCard.addSubview(questionLabel)

        // Option buttons — 2 rows × 2 columns via a vertical stack of horizontal stacks
        optionStack.translatesAutoresizingMaskIntoConstraints = false
        optionStack.axis = .vertical
        optionStack.spacing = 12
        optionStack.distribution = .fillEqually
        view.addSubview(optionStack)

        let optColors: [UIColor] = [
            UIColor(red: 0.70, green: 0.15, blue: 0.85, alpha: 1),
            UIColor(red: 0.05, green: 0.55, blue: 0.90, alpha: 1),
            UIColor(red: 0.92, green: 0.42, blue: 0.08, alpha: 1),
            UIColor(red: 0.10, green: 0.65, blue: 0.50, alpha: 1),
        ]

        for row in 0..<2 {
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.spacing = 12
            hStack.distribution = .fillEqually

            for col in 0..<2 {
                let idx = row * 2 + col
                let btn = UIButton(type: .system)
                btn.tag = idx
                btn.backgroundColor = optColors[idx]
                btn.setTitleColor(.white, for: .normal)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
                btn.titleLabel?.numberOfLines = 2
                btn.titleLabel?.textAlignment = .center
                btn.layer.cornerRadius = 16
                btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                btn.addTarget(self, action: #selector(didTapOption(_:)), for: .touchUpInside)
                hStack.addArrangedSubview(btn)
                optionButtons.append(btn)
            }
            optionStack.addArrangedSubview(hStack)
        }

        // Score bar at bottom
        scoreBar.translatesAutoresizingMaskIntoConstraints = false
        scoreBar.backgroundColor = UIColor.white.withAlphaComponent(0.10)
        scoreBar.layer.cornerRadius = 14
        view.addSubview(scoreBar)

        scoreLbl.translatesAutoresizingMaskIntoConstraints = false
        scoreLbl.textColor = .white
        scoreLbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        scoreLbl.textAlignment = .center
        scoreBar.addSubview(scoreLbl)

        // Constraints
        let safe = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: safe.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),

            title.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.leadingAnchor.constraint(greaterThanOrEqualTo: backBtn.trailingAnchor, constant: 8),

            timerPill.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            timerPill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timerLabel.topAnchor.constraint(equalTo: timerPill.topAnchor, constant: 6),
            timerLabel.bottomAnchor.constraint(equalTo: timerPill.bottomAnchor, constant: -6),
            timerLabel.leadingAnchor.constraint(equalTo: timerPill.leadingAnchor, constant: 12),
            timerLabel.trailingAnchor.constraint(equalTo: timerPill.trailingAnchor, constant: -12),

            progressLabel.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 12),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            questionCard.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 12),
            questionCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            questionLabel.topAnchor.constraint(equalTo: questionCard.topAnchor, constant: 24),
            questionLabel.bottomAnchor.constraint(equalTo: questionCard.bottomAnchor, constant: -24),
            questionLabel.leadingAnchor.constraint(equalTo: questionCard.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: questionCard.trailingAnchor, constant: -20),

            optionStack.topAnchor.constraint(equalTo: questionCard.bottomAnchor, constant: 20),
            optionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            optionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            scoreBar.topAnchor.constraint(equalTo: optionStack.bottomAnchor, constant: 20),
            scoreBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scoreBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scoreBar.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -16),
            scoreBar.heightAnchor.constraint(equalToConstant: 44),

            scoreLbl.centerXAnchor.constraint(equalTo: scoreBar.centerXAnchor),
            scoreLbl.centerYAnchor.constraint(equalTo: scoreBar.centerYAnchor),
        ])

        // Equal height for each row of buttons
        if let first = optionStack.arrangedSubviews.first {
            for row in optionStack.arrangedSubviews.dropFirst() {
                row.heightAnchor.constraint(equalTo: first.heightAnchor).isActive = true
            }
            first.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }

        updateScoreBar()
    }

    // MARK: - Question flow
    private func showQuestion() {
        guard currentIndex < questions.count else { endExam(); return }
        let q = questions[currentIndex]

        progressLabel.text = "Question \(currentIndex + 1) of \(questions.count)"
        questionLabel.text = q.prompt

        // Show only up to 4 options, skip "I don't know / Wasn't taught"
        let cleanOptions = q.options
            .filter { !$0.lowercased().contains("don't know") && !$0.lowercased().contains("wasn't taught") }
            .prefix(4)

        let optionList = Array(cleanOptions)

        for (i, btn) in optionButtons.enumerated() {
            if i < optionList.count {
                btn.setTitle(optionList[i], for: .normal)
                btn.isHidden = false
                btn.alpha = 1
                btn.transform = .identity
                btn.layer.borderWidth = 0
            } else {
                btn.isHidden = true
            }
        }

        answerLocked = false

        // Animate card in
        questionCard.alpha = 0
        questionCard.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 0.28, delay: 0, options: .curveEaseOut) {
            self.questionCard.alpha = 1
            self.questionCard.transform = .identity
        }
    }

    @objc private func didTapOption(_ sender: UIButton) {
        guard !answerLocked, currentIndex < questions.count else { return }
        answerLocked = true

        let q = questions[currentIndex]

        // Map displayed option index back to original options correctIndex
        // We need to find what index in the cleaned list corresponds to the correct answer
        let cleanOptions = q.options
            .filter { !$0.lowercased().contains("don't know") && !$0.lowercased().contains("wasn't taught") }
            .prefix(4)
        let optionList = Array(cleanOptions)

        guard let correctIdx = q.correctIndex else { next(); return }

        // The correct answer string
        let correctStr = correctIdx < q.options.count ? q.options[correctIdx] : ""
        // Find it in our displayed options
        let displayCorrect = optionList.firstIndex(of: correctStr) ?? -1

        let tappedIdx = sender.tag
        let isCorrect = tappedIdx == displayCorrect

        if isCorrect {
            score += 1
            flash(btn: sender, color: UIColor(red: 0.18, green: 0.80, blue: 0.40, alpha: 1))
            MotivationManager.shared.speak(for: .correctAnswer, delay: 0.1)
        } else {
            flash(btn: sender, color: UIColor(red: 0.90, green: 0.20, blue: 0.20, alpha: 1))
            // highlight correct answer
            if displayCorrect >= 0 && displayCorrect < optionButtons.count {
                flash(btn: optionButtons[displayCorrect], color: UIColor(red: 0.18, green: 0.80, blue: 0.40, alpha: 1))
            }
            MotivationManager.shared.speak(for: .wrongAnswer, delay: 0.1)
            // Record as missed for review
            SpacedRepetitionManager.shared.recordMiss(
                subject: subject.lowercased(),
                prompt: q.prompt,
                answer: correctStr
            )
        }

        updateScoreBar()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.currentIndex += 1
            self?.showQuestion()
        }
    }

    private func flash(btn: UIButton, color: UIColor) {
        UIView.animate(withDuration: 0.15) {
            btn.backgroundColor = color
            btn.transform = CGAffineTransform(scaleX: 1.04, y: 1.04)
        } completion: { _ in
            UIView.animate(withDuration: 0.15) {
                btn.transform = .identity
            }
        }
    }

    private func next() {
        currentIndex += 1
        showQuestion()
    }

    private func updateScoreBar() {
        scoreLbl.text = "✅ \(score) correct   •   \(currentIndex) answered   •   \(questions.count - currentIndex) left"
    }

    // MARK: - Timer
    private func startTimer() {
        countTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.timeLeft -= 1
            self.timerLabel.text = self.formatTime(self.timeLeft)
            self.updateTimerColor()
            if self.timeLeft <= 0 { self.endExam() }
        }
    }

    private func updateTimerColor() {
        let color: UIColor
        switch timeLeft {
        case 31...: color = UIColor(red: 0.10, green: 0.72, blue: 0.42, alpha: 1)
        case 11...30: color = UIColor(red: 0.95, green: 0.60, blue: 0.10, alpha: 1)
        default:    color = UIColor(red: 0.92, green: 0.20, blue: 0.20, alpha: 1)
        }
        UIView.animate(withDuration: 0.4) { self.timerPill.backgroundColor = color }
    }

    private func formatTime(_ s: Int) -> String {
        let m = max(0, s) / 60
        let sec = max(0, s) % 60
        return String(format: "%d:%02d", m, sec)
    }

    // MARK: - End exam
    private func endExam() {
        guard !resultShown else { return }
        resultShown = true
        countTimer?.invalidate()
        answerLocked = true

        let total     = questions.count
        let xp        = score * 5
        let pct       = total > 0 ? Int(Double(score) / Double(total) * 100) : 0
        let emoji     = pct >= 80 ? "🏆" : pct >= 50 ? "⭐️" : "💪"
        let msg       = pct >= 80 ? "Excellent work!" : pct >= 50 ? "Good effort!" : "Keep practising!"
        let timeTaken = totalTime - timeLeft

        // Award XP
        if xp > 0 {
            Session.shared.addXP(xp)
            if Session.shared.currentUser != nil {
                let worldKey: String
                switch subject.lowercased() {
                case "math":      worldKey = "math_world_total_xp"
                case "english":   worldKey = "eng_world_total_xp"
                case "geography": worldKey = "geo_world_total_xp"
                case "history":   worldKey = "his_world_total_xp"
                case "science":   worldKey = "sci_world_total_xp"
                default:          worldKey = "math_world_total_xp"
                }
                let prev = UserDefaults.standard.integer(forKey: worldKey)
                UserDefaults.standard.set(prev + xp, forKey: worldKey)
            }
        }

        // Overlay
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.10, green: 0.06, blue: 0.28, alpha: 0.98)
        card.layer.cornerRadius = 28
        card.layer.borderWidth  = 2
        card.layer.borderColor  = accentColor.withAlphaComponent(0.6).cgColor
        card.layer.shadowColor  = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.5
        card.layer.shadowRadius  = 20
        card.layer.shadowOffset  = CGSize(width: 0, height: 8)
        overlay.addSubview(card)

        func lbl(_ t: String, sz: CGFloat, bold: Bool = false, col: UIColor = .white, lines: Int = 1) -> UILabel {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = t; l.textColor = col; l.numberOfLines = lines; l.textAlignment = .center
            l.font = bold ? UIFont.boldSystemFont(ofSize: sz) : UIFont.systemFont(ofSize: sz)
            return l
        }

        let emojiLbl    = lbl(emoji, sz: 52)
        let titleLbl    = lbl("Exam Complete!", sz: 24, bold: true)
        let scoreLbl2   = lbl("\(score) / \(total) correct  (\(pct)%)", sz: 18, bold: true,
                              col: accentColor)
        let timeLbl     = lbl("Time: \(formatTime(timeTaken))", sz: 14,
                              col: UIColor.white.withAlphaComponent(0.60))
        let msgLbl      = lbl(msg, sz: 16)
        let xpLbl       = lbl("+\(xp) XP earned!", sz: 17, bold: true,
                              col: UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1))

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Back to World", for: .normal)
        doneBtn.setTitleColor(.white, for: .normal)
        doneBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        doneBtn.backgroundColor = accentColor
        doneBtn.layer.cornerRadius = 22
        doneBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        for v in [emojiLbl, titleLbl, scoreLbl2, timeLbl, msgLbl, xpLbl, doneBtn] {
            card.addSubview(v)
        }

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 30),
            card.trailingAnchor.constraint(equalTo: overlay.trailingAnchor, constant: -30),

            emojiLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 32),
            emojiLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLbl.topAnchor.constraint(equalTo: emojiLbl.bottomAnchor, constant: 10),
            titleLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            scoreLbl2.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 16),
            scoreLbl2.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            timeLbl.topAnchor.constraint(equalTo: scoreLbl2.bottomAnchor, constant: 6),
            timeLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            msgLbl.topAnchor.constraint(equalTo: timeLbl.bottomAnchor, constant: 14),
            msgLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            xpLbl.topAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 8),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 24),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 200),
            doneBtn.heightAnchor.constraint(equalToConstant: 50),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28),
        ])

        card.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.70,
                       initialSpringVelocity: 0.5, options: []) {
            overlay.alpha = 1
            card.transform = .identity
        }

        // Dragon nudge
        let ctx: MotivationManager.Context = pct >= 70
            ? .puzzleComplete(score: score)
            : .wrongAnswer
        MotivationManager.shared.nudge(for: ctx, in: view, delay: 0.8)
    }

    // MARK: - Actions
    @objc private func didTapBack() {
        countTimer?.invalidate()
        navigationController?.popViewController(animated: true)
    }
}
