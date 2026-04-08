import UIKit

// MARK: - MathComparisonViewController
// Tap < > = to compare two values. Easy: plain numbers. Hard: mix with dot-counting.

final class MathComparisonViewController: UIViewController {

    // MARK: - Public config
    var isHardMode: Bool = false

    // MARK: - Internal question model

    private struct Question {
        enum Display { case number(Int), dots(Int), equation(String, Int) }
        // equation: display string like "x + 4 = 9", solved value is x
        let left:  Display
        let right: Display

        var leftValue: Int {
            switch left {
            case .number(let n): return n
            case .dots(let n):   return n
            case .equation(_, let n): return n
            }
        }
        var rightValue: Int {
            switch right {
            case .number(let n): return n
            case .dots(let n):   return n
            case .equation(_, let n): return n
            }
        }

        var correctSymbol: String {
            if leftValue < rightValue { return "<" }
            if leftValue > rightValue { return ">" }
            return "="
        }
    }

    // MARK: - State
    private var questions:    [Question] = []
    private var currentIndex  = 0
    private var correctCount  = 0
    private let totalQ        = 10

    // MARK: - Theme
    private let mathPurple = UIColor(red: 0.38, green: 0.18, blue: 0.72, alpha: 1.0)
    private let cardBg     = UIColor(red: 0.26, green: 0.12, blue: 0.50, alpha: 1.0)
    private let darkBg     = UIColor(red: 0.15, green: 0.06, blue: 0.30, alpha: 1.0)

    // MARK: - UI
    private let gradientLayer  = CAGradientLayer()
    private let backBtn        = UIButton(type: .system)
    private let titleLabel     = UILabel()
    private let progressLabel  = UILabel()
    private let progressBar    = UIProgressView(progressViewStyle: .default)

    // Two value panels + symbol label between them
    private let leftPanel      = UIView()
    private let rightPanel     = UIView()
    private let vsLabel        = UILabel()   // shows "?" before answer, then the symbol

    // Symbol buttons at bottom
    private let lessBtn  = UIButton(type: .system)
    private let equalBtn = UIButton(type: .system)
    private let moreBtn  = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestions()
        setupBackground()
        setupBackButton()
        setupHeader()
        setupPanels()
        setupSymbolButtons()
        loadQuestion()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Question generation

    private func generateQuestions() {
        questions = []
        let maxVal = isHardMode ? 20 : 10
        var pool: [Question] = []

        // Pure number comparisons
        for _ in 0..<(isHardMode ? 4 : 7) {
            let a = Int.random(in: 1...maxVal)
            let b = Int.random(in: 1...maxVal)
            pool.append(Question(left: .number(a), right: .number(b)))
        }

        // Dot-counting questions (hard mode only)
        if isHardMode {
            for _ in 0..<3 {
                let a = Int.random(in: 1...15)
                let b = Int.random(in: 1...15)
                let useLeftDots  = Bool.random()
                let useRightDots = Bool.random()
                pool.append(Question(
                    left:  useLeftDots  ? .dots(a) : .number(a),
                    right: useRightDots ? .dots(b) : .number(b)
                ))
            }
        }

        // Equation questions (hard mode: 3, easy: 2)
        // Form: "x + k = result" → x is the left value being compared
        let eqCount = isHardMode ? 3 : 2
        for _ in 0..<eqCount {
            let x = Int.random(in: 1...(maxVal - 1))
            let k = Int.random(in: 1...(maxVal - x))
            let result = x + k
            let eqStr = "x + \(k) = \(result)"
            let b = Int.random(in: 1...maxVal)
            pool.append(Question(left: .equation(eqStr, x), right: .number(b)))
        }

        // Guarantee some equals
        let eqVal = Int.random(in: 1...maxVal)
        pool.append(Question(left: .number(eqVal), right: .number(eqVal)))

        questions = Array(pool.shuffled().prefix(totalQ))
    }

    // MARK: - Background

    private func setupBackground() {
        gradientLayer.colors = [
            UIColor(red: 0.18, green: 0.06, blue: 0.38, alpha: 1).cgColor,
            UIColor(red: 0.28, green: 0.10, blue: 0.52, alpha: 1).cgColor,
            UIColor(red: 0.12, green: 0.04, blue: 0.26, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Back

    private func setupBackButton() {
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - Header

    private func setupHeader() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "⚖️ Compare It!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        progressLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        progressLabel.textAlignment = .center
        view.addSubview(progressLabel)

        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progressTintColor = UIColor.systemYellow
        progressBar.trackTintColor = UIColor.white.withAlphaComponent(0.15)
        progressBar.layer.cornerRadius = 3
        progressBar.clipsToBounds = true
        view.addSubview(progressBar)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 8),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            progressBar.heightAnchor.constraint(equalToConstant: 6)
        ])
    }

    // MARK: - Panels

    private func setupPanels() {
        // instruction label
        let instrLbl = UILabel()
        instrLbl.translatesAutoresizingMaskIntoConstraints = false
        instrLbl.text = "Which symbol goes in the middle?"
        instrLbl.textColor = UIColor.white.withAlphaComponent(0.55)
        instrLbl.font = UIFont.systemFont(ofSize: 13)
        instrLbl.textAlignment = .center
        view.addSubview(instrLbl)

        for panel in [leftPanel, rightPanel] {
            panel.translatesAutoresizingMaskIntoConstraints = false
            panel.backgroundColor = cardBg
            panel.layer.cornerRadius = 24
            panel.layer.borderWidth  = 2
            panel.layer.borderColor  = UIColor.white.withAlphaComponent(0.15).cgColor
            panel.layer.shadowColor  = UIColor.black.cgColor
            panel.layer.shadowOpacity = 0.3
            panel.layer.shadowRadius  = 10
            panel.layer.shadowOffset  = CGSize(width: 0, height: 5)
            view.addSubview(panel)
        }

        vsLabel.translatesAutoresizingMaskIntoConstraints = false
        vsLabel.text = "?"
        vsLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        vsLabel.font = UIFont.boldSystemFont(ofSize: 42)
        vsLabel.textAlignment = .center
        view.addSubview(vsLabel)

        let panelW: CGFloat = (view.bounds.width > 0 ? view.bounds.width : 390) / 2 - 44

        NSLayoutConstraint.activate([
            instrLbl.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
            instrLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            leftPanel.topAnchor.constraint(equalTo: instrLbl.bottomAnchor, constant: 16),
            leftPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftPanel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -28),
            leftPanel.heightAnchor.constraint(equalTo: leftPanel.widthAnchor),

            vsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vsLabel.centerYAnchor.constraint(equalTo: leftPanel.centerYAnchor),

            rightPanel.topAnchor.constraint(equalTo: leftPanel.topAnchor),
            rightPanel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 28),
            rightPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightPanel.heightAnchor.constraint(equalTo: rightPanel.widthAnchor)
        ])
    }

    // MARK: - Symbol buttons

    private func setupSymbolButtons() {
        let stack = UIStackView(arrangedSubviews: [lessBtn, equalBtn, moreBtn])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        view.addSubview(stack)

        let symbols = ["<", "=", ">"]
        for (btn, sym) in zip([lessBtn, equalBtn, moreBtn], symbols) {
            btn.setTitle(sym, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
            btn.backgroundColor = mathPurple
            btn.layer.cornerRadius = 22
            btn.layer.borderWidth  = 2
            btn.layer.borderColor  = UIColor.white.withAlphaComponent(0.3).cgColor
            btn.layer.shadowColor  = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.3
            btn.layer.shadowRadius  = 8
            btn.layer.shadowOffset  = CGSize(width: 0, height: 4)
            btn.addTarget(self, action: #selector(didTapSymbol(_:)), for: .touchUpInside)
        }

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: leftPanel.bottomAnchor, constant: 32),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    // MARK: - Load question

    private func loadQuestion() {
        guard currentIndex < questions.count else { showCompletion(); return }
        let q = questions[currentIndex]

        let total = questions.count
        progressLabel.text = "Question \(currentIndex + 1) of \(total)"
        progressBar.setProgress(Float(currentIndex) / Float(total), animated: currentIndex > 0)

        vsLabel.text = "?"
        vsLabel.textColor = UIColor.white.withAlphaComponent(0.5)

        fillPanel(leftPanel,  display: q.left)
        fillPanel(rightPanel, display: q.right)

        [lessBtn, equalBtn, moreBtn].forEach { $0.isEnabled = true; $0.alpha = 1 }
    }

    private func fillPanel(_ panel: UIView, display: Question.Display) {
        // Remove previous content
        panel.subviews.forEach { $0.removeFromSuperview() }

        switch display {
        case .number(let n):
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "\(n)"
            lbl.textColor = .white
            lbl.font = UIFont.boldSystemFont(ofSize: 64)
            lbl.textAlignment = .center
            lbl.adjustsFontSizeToFitWidth = true
            lbl.minimumScaleFactor = 0.5
            panel.addSubview(lbl)
            NSLayoutConstraint.activate([
                lbl.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
                lbl.centerYAnchor.constraint(equalTo: panel.centerYAnchor),
                lbl.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 8),
                lbl.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -8)
            ])

        case .dots(let n):
            let dotsView = makeDotsView(count: n)
            dotsView.translatesAutoresizingMaskIntoConstraints = false
            panel.addSubview(dotsView)
            NSLayoutConstraint.activate([
                dotsView.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
                dotsView.centerYAnchor.constraint(equalTo: panel.centerYAnchor),
                dotsView.widthAnchor.constraint(equalTo: panel.widthAnchor, constant: -20),
                dotsView.heightAnchor.constraint(equalTo: panel.heightAnchor, constant: -20)
            ])

        case .equation(let expr, _):
            // Show "x + 4 = 9" with x highlighted, kid must find x
            let hintLbl = UILabel()
            hintLbl.translatesAutoresizingMaskIntoConstraints = false
            hintLbl.text = "Find x:"
            hintLbl.textColor = UIColor.systemYellow.withAlphaComponent(0.8)
            hintLbl.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            hintLbl.textAlignment = .center

            let eqLbl = UILabel()
            eqLbl.translatesAutoresizingMaskIntoConstraints = false
            eqLbl.text = expr
            eqLbl.textColor = .white
            eqLbl.font = UIFont.boldSystemFont(ofSize: 28)
            eqLbl.textAlignment = .center
            eqLbl.adjustsFontSizeToFitWidth = true
            eqLbl.minimumScaleFactor = 0.6

            let xLbl = UILabel()
            xLbl.translatesAutoresizingMaskIntoConstraints = false
            xLbl.text = "x = ?"
            xLbl.textColor = UIColor.systemYellow
            xLbl.font = UIFont.boldSystemFont(ofSize: 22)
            xLbl.textAlignment = .center

            panel.addSubview(hintLbl)
            panel.addSubview(eqLbl)
            panel.addSubview(xLbl)
            NSLayoutConstraint.activate([
                hintLbl.topAnchor.constraint(equalTo: panel.topAnchor, constant: 14),
                hintLbl.centerXAnchor.constraint(equalTo: panel.centerXAnchor),

                eqLbl.centerYAnchor.constraint(equalTo: panel.centerYAnchor),
                eqLbl.leadingAnchor.constraint(equalTo: panel.leadingAnchor, constant: 8),
                eqLbl.trailingAnchor.constraint(equalTo: panel.trailingAnchor, constant: -8),

                xLbl.topAnchor.constraint(equalTo: eqLbl.bottomAnchor, constant: 6),
                xLbl.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            ])
        }
    }

    /// Renders up to 15 dots in a compact grid for counting.
    private func makeDotsView(count: Int) -> UIView {
        let container = UIView()
        let cols = count <= 5 ? count : (count <= 10 ? 5 : 5)
        let rows = Int(ceil(Double(count) / Double(cols)))
        let dotSize: CGFloat = count <= 5 ? 22 : (count <= 10 ? 18 : 15)
        let gap: CGFloat = 6

        for i in 0..<count {
            let col = i % cols
            let row = i / cols
            let dot = UIView()
            dot.backgroundColor = UIColor.systemYellow
            dot.layer.cornerRadius = dotSize / 2
            let x = CGFloat(col) * (dotSize + gap)
            let y = CGFloat(row) * (dotSize + gap)
            dot.frame = CGRect(x: x, y: y, width: dotSize, height: dotSize)
            container.addSubview(dot)
        }

        let totalW = CGFloat(cols) * dotSize + CGFloat(cols - 1) * gap
        let totalH = CGFloat(rows) * dotSize + CGFloat(rows - 1) * gap
        container.bounds = CGRect(x: 0, y: 0, width: totalW, height: totalH)

        // Count label below dots
        let countLbl = UILabel()
        countLbl.text = "Count: ?"
        countLbl.textColor = UIColor.white.withAlphaComponent(0.55)
        countLbl.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        countLbl.textAlignment = .center
        countLbl.translatesAutoresizingMaskIntoConstraints = false
        // We'll place it absolutely within the returned view which is auto-sized,
        // so just return the dots-only view and the label is attached outside.
        return container
    }

    // MARK: - Answer handling

    @objc private func didTapSymbol(_ sender: UIButton) {
        guard currentIndex < questions.count else { return }
        let q = questions[currentIndex]
        let tapped = sender.title(for: .normal) ?? ""
        let correct = (tapped == q.correctSymbol)

        [lessBtn, equalBtn, moreBtn].forEach { $0.isEnabled = false }

        // Show the symbol in the center
        vsLabel.text = q.correctSymbol
        vsLabel.textColor = correct ? UIColor.systemGreen : UIColor.systemRed

        // Flash panels
        let flashColor = correct ? UIColor.systemGreen.withAlphaComponent(0.35)
                                 : UIColor.systemRed.withAlphaComponent(0.35)
        UIView.animate(withDuration: 0.2) {
            self.leftPanel.backgroundColor  = flashColor
            self.rightPanel.backgroundColor = flashColor
        }

        if correct {
            correctCount += 1
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } else {
            // Shake
            let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
            shake.values = [-10, 10, -8, 8, -4, 4, 0]
            shake.duration = 0.4
            sender.layer.add(shake, forKey: "shake")
            UINotificationFeedbackGenerator().notificationOccurred(.error)

            // Show correct answer button highlighted
            [lessBtn, equalBtn, moreBtn].forEach { btn in
                if btn.title(for: .normal) == q.correctSymbol {
                    UIView.animate(withDuration: 0.2) {
                        btn.backgroundColor = UIColor.systemGreen
                    }
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            UIView.animate(withDuration: 0.2) {
                self.leftPanel.backgroundColor  = self.cardBg
                self.rightPanel.backgroundColor = self.cardBg
                [self.lessBtn, self.equalBtn, self.moreBtn].forEach {
                    $0.backgroundColor = self.mathPurple
                    $0.alpha = 1
                }
            } completion: { _ in
                self.currentIndex += 1
                self.loadQuestion()
            }
        }
    }

    // MARK: - Completion

    private func showCompletion() {
        let xp = isHardMode ? 20 : 12
        Session.shared.addXP(xp)

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.20, green: 0.08, blue: 0.42, alpha: 1)
        card.layer.cornerRadius = 32
        card.layer.borderWidth  = 2
        card.layer.borderColor  = UIColor.systemYellow.cgColor
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.72, y: 0.72)
        overlay.addSubview(card)

        let accuracy = questions.isEmpty ? 0 : Int(Float(correctCount) / Float(questions.count) * 100)
        let stars = accuracy == 100 ? "⭐⭐⭐" : accuracy >= 70 ? "⭐⭐" : "⭐"

        let emojiLbl = UILabel(); emojiLbl.text = stars
        emojiLbl.font = UIFont.systemFont(ofSize: 48); emojiLbl.textAlignment = .center
        emojiLbl.translatesAutoresizingMaskIntoConstraints = false

        let titleLbl = UILabel(); titleLbl.text = "Well Done!"
        titleLbl.textColor = .white; titleLbl.font = UIFont.boldSystemFont(ofSize: 26)
        titleLbl.textAlignment = .center; titleLbl.translatesAutoresizingMaskIntoConstraints = false

        let scoreLbl = UILabel()
        scoreLbl.text = "\(correctCount)/\(questions.count) correct — \(accuracy)%"
        scoreLbl.textColor = UIColor.white.withAlphaComponent(0.7); scoreLbl.font = UIFont.systemFont(ofSize: 15)
        scoreLbl.textAlignment = .center; scoreLbl.translatesAutoresizingMaskIntoConstraints = false

        let xpLbl = UILabel(); xpLbl.text = "+\(xp) XP"
        xpLbl.textColor = UIColor.systemYellow; xpLbl.font = UIFont.boldSystemFont(ofSize: 20)
        xpLbl.textAlignment = .center; xpLbl.translatesAutoresizingMaskIntoConstraints = false

        let doneBtn = UIButton(type: .system)
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Done ✓", for: .normal)
        doneBtn.setTitleColor(.black, for: .normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        doneBtn.backgroundColor = UIColor.systemYellow
        doneBtn.layer.cornerRadius = 22
        doneBtn.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        for v in [emojiLbl, titleLbl, scoreLbl, xpLbl, doneBtn] { card.addSubview(v) }

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 300),
            emojiLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),
            emojiLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            titleLbl.topAnchor.constraint(equalTo: emojiLbl.bottomAnchor, constant: 10),
            titleLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            scoreLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 6),
            scoreLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: scoreLbl.bottomAnchor, constant: 12),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 20),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 160),
            doneBtn.heightAnchor.constraint(equalToConstant: 48),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        UIView.animate(withDuration: 0.25) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.45, delay: 0.05,
                       usingSpringWithDamping: 0.65, initialSpringVelocity: 0.9) {
            card.alpha = 1; card.transform = .identity
        }
    }

    // MARK: - Actions

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
