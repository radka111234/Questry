import UIKit

final class QuestionViewController: UIViewController {

    // MARK: - IBOutlets (storyboard connections — hidden, kept valid)
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var questionProgressLabel: UILabel!
    @IBOutlet weak var questionProgressPercentLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var illustrationImageView: UIImageView!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    @IBOutlet weak var feedbackView: UIView!
    @IBOutlet weak var feedbackLabel: UILabel!

    // MARK: - Public config
    var subject: String = "Math"
    var levelNumber: Int = 1

    // MARK: - State
    private var questions:     [Question] = []
    private var currentIndex:  Int = 0
    private var totalXPEarned: Int = 0
    private var streak:        Int = 0

    // MARK: - Game UI references
    private let gradientLayer     = CAGradientLayer()
    private var mascotLabel       = UILabel()
    private var speechBubble      = UIView()
    private var speechLabel       = UILabel()
    private var questionDivider   = UIView()
    private var gameAnswerButtons = [UIButton]()
    private var progressDots      = [UIView]()
    private var streakBadge       = UIView()
    private var streakBadgeLbl    = UILabel()
    private var gameXPLabel       = UILabel()
    private var gameXPBar         = UIProgressView()
    private var qCountLabel       = UILabel()
    private var confettiLayer     = CAEmitterLayer()

    // MARK: - Vivid Kahoot-style answer colours (constant — same for all subjects)
    private let answerColors: [UIColor] = [
        UIColor(red: 0.88, green: 0.18, blue: 0.24, alpha: 1), // A – red
        UIColor(red: 0.10, green: 0.40, blue: 0.88, alpha: 1), // B – blue
        UIColor(red: 0.90, green: 0.60, blue: 0.04, alpha: 1), // C – amber
        UIColor(red: 0.10, green: 0.66, blue: 0.30, alpha: 1)  // D – green
    ]
    private let letters = ["A", "B", "C", "D"]

    // MARK: - Subject theme
    private struct Theme {
        let gradTop:    UIColor
        let gradBot:    UIColor
        let accent:     UIColor
        let bgEmojis:   [String]
        let mascot:     String        // idle
        let mascotYay:  String        // correct
        let mascotOops: String        // wrong
        let idleSays:   [String]
        let correctSays:[String]
        let wrongPrefix: String       // "Almost! The answer was "
    }

    private var theme: Theme {
        switch subject {
        case "Science":
            return Theme(
                gradTop: UIColor(red: 0.04, green: 0.30, blue: 0.14, alpha: 1),
                gradBot: UIColor(red: 0.01, green: 0.12, blue: 0.06, alpha: 1),
                accent:  UIColor(red: 0.35, green: 0.95, blue: 0.55, alpha: 1),
                bgEmojis: ["🔬","🌿","⭐","🧬","⚗️","💡","🌱"],
                mascot: "🔬", mascotYay: "🥳", mascotOops: "😅",
                idleSays:    ["Ready to think like a scientist? 🤔",
                              "Let's discover something new! 🌱",
                              "Science time! Can you figure this out? ⚗️",
                              "Put on your lab coat! 🔬"],
                correctSays: ["Amazing! You're a science star! ⭐",
                              "Correct! That brain of yours is huge! 🧠",
                              "YES! Science champion! 🏆",
                              "Brilliant! Keep going! 🔥"],
                wrongPrefix: "Almost! The correct answer was "
            )
        case "History":
            return Theme(
                gradTop: UIColor(red: 0.34, green: 0.17, blue: 0.04, alpha: 1),
                gradBot: UIColor(red: 0.14, green: 0.06, blue: 0.01, alpha: 1),
                accent:  UIColor(red: 0.98, green: 0.76, blue: 0.22, alpha: 1),
                bgEmojis: ["🏛️","⚔️","👑","📜","🗺️","🏰","⚱️"],
                mascot: "👑", mascotYay: "🎊", mascotOops: "😬",
                idleSays:    ["History is full of mysteries! 📜",
                              "Travel back in time with me! 🗺️",
                              "Do you know your history? ⚔️",
                              "Let's unlock the past! 🏛️"],
                correctSays: ["History legend! That's exactly right! 🏆",
                              "You really know your history! 👑",
                              "Epic! A true time traveller! ⏳",
                              "Correct! Historians are proud! 📜"],
                wrongPrefix: "Almost! The correct answer was "
            )
        case "Geography":
            return Theme(
                gradTop: UIColor(red: 0.03, green: 0.26, blue: 0.34, alpha: 1),
                gradBot: UIColor(red: 0.01, green: 0.10, blue: 0.18, alpha: 1),
                accent:  UIColor(red: 0.22, green: 0.88, blue: 0.92, alpha: 1),
                bgEmojis: ["🌍","🗺️","⛰️","🌊","🧭","🌋","🏝️"],
                mascot: "🌍", mascotYay: "🎉", mascotOops: "😮",
                idleSays:    ["Explore the world with me! 🧭",
                              "Ready for a geography adventure? 🌋",
                              "Where in the world are we going? 🗺️",
                              "Let's discover our planet! 🌊"],
                correctSays: ["World explorer — that's correct! 🌍",
                              "Spot on! You know your geography! ⛰️",
                              "Brilliant! You could be a navigator! 🧭",
                              "Correct! Around the world in one answer! 🏝️"],
                wrongPrefix: "Almost! The correct answer was "
            )
        case "Math":
            return Theme(
                gradTop: UIColor(red: 0.05, green: 0.13, blue: 0.44, alpha: 1),
                gradBot: UIColor(red: 0.02, green: 0.05, blue: 0.22, alpha: 1),
                accent:  UIColor(red: 0.98, green: 0.82, blue: 0.18, alpha: 1),
                bgEmojis: ["➕","🔢","✖️","➗","🧮","📐","🔣"],
                mascot: "🤖", mascotYay: "🤩", mascotOops: "🙈",
                idleSays:    ["Numbers don't lie — can you? 🔢",
                              "Let's crunch some numbers! 🧮",
                              "Math challenge incoming! ➕",
                              "Your brain is a calculator! 🤖"],
                correctSays: ["Calculated! You're a math wizard! 🧙",
                              "Correct! Einstein would be proud! ➕",
                              "Perfect answer! Math master! 🏆",
                              "You crushed it! Numbers bow to you! 🔢"],
                wrongPrefix: "Almost! The correct answer was "
            )
        default: // English
            return Theme(
                gradTop: UIColor(red: 0.24, green: 0.06, blue: 0.50, alpha: 1),
                gradBot: UIColor(red: 0.09, green: 0.02, blue: 0.24, alpha: 1),
                accent:  UIColor(red: 0.84, green: 0.58, blue: 1.00, alpha: 1),
                bgEmojis: ["📚","✏️","🔤","💬","📖","🖊️","🗣️"],
                mascot: "🦉", mascotYay: "🥳", mascotOops: "😅",
                idleSays:    ["Words are magic — let's spell some! ✏️",
                              "Time to show off your English! 📚",
                              "Ready to play with language? 💬",
                              "Let's read, think and answer! 📖"],
                correctSays: ["Superb! You know your words! 📚",
                              "Correct! Vocabulary champion! 🏆",
                              "Excellent English! Well done! ✨",
                              "Brilliant! You really read a lot! 📖"],
                wrongPrefix: "Almost! The correct answer was "
            )
        }
    }

    // MARK: - Helpers
    private var answerButtons: [UIButton] { gameAnswerButtons }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = QuestionBank.questions(for: subject, level: levelNumber)
        view.subviews.forEach { $0.isHidden = true }
        feedbackView.alpha = 0
        buildGameUI()
        guard !questions.isEmpty else { return }
        showIdleMessage()
        loadQuestion(at: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshXP()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10)
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        illustrationImageView.stopAnimating()
        illustrationImageView.layer.removeAllAnimations()
    }

    // MARK: - Build Game UI

    private func buildGameUI() {
        let t = theme

        // ── Background gradient ──────────────────────────────────────────
        gradientLayer.colors = [t.gradTop.cgColor, t.gradBot.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.7, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)

        // ── Floating background emojis ───────────────────────────────────
        let floatPos: [(CGFloat, CGFloat)] = [
            (0.87,0.09),(0.06,0.24),(0.91,0.48),(0.05,0.65),(0.84,0.80),(0.48,0.93),(0.44,0.04)
        ]
        for (emoji, pos) in zip(t.bgEmojis, floatPos) {
            let lbl = UILabel(); lbl.text = emoji
            lbl.font = .systemFont(ofSize: 28); lbl.alpha = 0.14
            lbl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(lbl)
            NSLayoutConstraint.activate([
                lbl.centerXAnchor.constraint(equalTo: view.leadingAnchor,
                    constant: UIScreen.main.bounds.width  * pos.0),
                lbl.centerYAnchor.constraint(equalTo: view.topAnchor,
                    constant: UIScreen.main.bounds.height * pos.1)
            ])
            let anim = CABasicAnimation(keyPath: "transform.translation.y")
            anim.fromValue = -8; anim.toValue = 8
            anim.autoreverses = true; anim.repeatCount = .infinity
            anim.duration = Double.random(in: 1.9...3.6)
            anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            lbl.layer.add(anim, forKey: "float")
        }

        // ── Back button ──────────────────────────────────────────────────
        let backBtn = UIButton(type: .system)
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.black.withAlphaComponent(0.28)
        backBtn.layer.cornerRadius = 18; backBtn.clipsToBounds = true
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(backBtn)

        // ── Subject pill ─────────────────────────────────────────────────
        let pill = UIView()
        pill.backgroundColor = UIColor.white.withAlphaComponent(0.16)
        pill.layer.cornerRadius = 18
        pill.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pill)

        let pillStack = UIStackView(arrangedSubviews: [
            { let l = UILabel(); l.text = t.mascot; l.font = .systemFont(ofSize: 18); return l }(),
            { let l = UILabel(); l.text = "\(subject) Quest"; l.font = .boldSystemFont(ofSize: 15)
              l.textColor = .white; return l }()
        ])
        pillStack.axis = .horizontal; pillStack.spacing = 6; pillStack.alignment = .center
        pillStack.translatesAutoresizingMaskIntoConstraints = false
        pill.addSubview(pillStack)

        // ── XP bar (top-right) ───────────────────────────────────────────
        gameXPLabel.font = .boldSystemFont(ofSize: 12); gameXPLabel.textColor = .white
        gameXPLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameXPLabel)

        gameXPBar.progressTintColor = t.accent
        gameXPBar.trackTintColor = UIColor.white.withAlphaComponent(0.20)
        gameXPBar.layer.cornerRadius = 3; gameXPBar.clipsToBounds = true
        gameXPBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameXPBar)

        // ── Progress dots + counter ──────────────────────────────────────
        let dotsStack = UIStackView()
        dotsStack.axis = .horizontal; dotsStack.spacing = 7
        dotsStack.alignment = .center; dotsStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dotsStack)

        for _ in 0..<max(questions.count,1) {
            let dot = UIView(); dot.backgroundColor = UIColor.white.withAlphaComponent(0.25)
            dot.layer.cornerRadius = 6; dot.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([dot.widthAnchor.constraint(equalToConstant: 12),
                                         dot.heightAnchor.constraint(equalToConstant: 12)])
            dotsStack.addArrangedSubview(dot); progressDots.append(dot)
        }

        qCountLabel.font = .boldSystemFont(ofSize: 13)
        qCountLabel.textColor = UIColor.white.withAlphaComponent(0.72)
        qCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qCountLabel)

        // ── Streak badge ─────────────────────────────────────────────────
        streakBadge.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.05, alpha: 1)
        streakBadge.layer.cornerRadius = 14; streakBadge.alpha = 0
        streakBadge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(streakBadge)

        streakBadgeLbl.font = .boldSystemFont(ofSize: 13); streakBadgeLbl.textColor = .white
        streakBadgeLbl.translatesAutoresizingMaskIntoConstraints = false
        streakBadge.addSubview(streakBadgeLbl)

        // ── Mascot + Speech bubble ───────────────────────────────────────
        mascotLabel.font = .systemFont(ofSize: 52)
        mascotLabel.text = t.mascot; mascotLabel.textAlignment = .center
        mascotLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mascotLabel)

        // Idle mascot float animation
        let mascotFloat = CABasicAnimation(keyPath: "transform.translation.y")
        mascotFloat.fromValue = -5; mascotFloat.toValue = 5
        mascotFloat.autoreverses = true; mascotFloat.repeatCount = .infinity
        mascotFloat.duration = 1.6; mascotFloat.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        mascotLabel.layer.add(mascotFloat, forKey: "float")

        speechBubble.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        speechBubble.layer.cornerRadius = 20
        speechBubble.layer.shadowColor = UIColor.black.cgColor
        speechBubble.layer.shadowOpacity = 0.12; speechBubble.layer.shadowRadius = 10
        speechBubble.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(speechBubble)

        speechLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        speechLabel.textColor = UIColor.black.withAlphaComponent(0.85)
        speechLabel.numberOfLines = 0; speechLabel.textAlignment = .left
        speechLabel.translatesAutoresizingMaskIntoConstraints = false
        speechBubble.addSubview(speechLabel)

        // Bubble tail (small rotated square)
        let tail = UIView()
        tail.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        tail.transform = CGAffineTransform(rotationAngle: .pi / 4)
        tail.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(tail, belowSubview: speechBubble)

        // ── Question divider ─────────────────────────────────────────────
        questionDivider.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        questionDivider.layer.cornerRadius = 2
        questionDivider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionDivider)

        // ── 2×2 Answer grid ──────────────────────────────────────────────
        let topRow    = makeRowStack()
        let bottomRow = makeRowStack()
        let grid      = UIStackView(arrangedSubviews: [topRow, bottomRow])
        grid.axis = .vertical; grid.spacing = 12
        grid.distribution = .fillEqually
        grid.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grid)

        for (idx, color) in answerColors.enumerated() {
            let btn = UIButton(type: .system)
            btn.tag = idx
            btn.backgroundColor = color
            btn.layer.cornerRadius = 22
            btn.layer.shadowColor  = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.22; btn.layer.shadowRadius = 8
            btn.layer.shadowOffset  = CGSize(width: 0, height: 4)
            btn.clipsToBounds = false
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)

            // Letter badge — top-left
            let badge = UILabel(); badge.tag = 800 + idx
            badge.text = letters[idx]; badge.font = .boldSystemFont(ofSize: 13)
            badge.textColor = UIColor.black.withAlphaComponent(0.70)
            badge.backgroundColor = UIColor.white.withAlphaComponent(0.88)
            badge.textAlignment = .center; badge.layer.cornerRadius = 11
            badge.clipsToBounds = true
            badge.translatesAutoresizingMaskIntoConstraints = false
            btn.addSubview(badge)

            // Answer text label
            let ansLbl = UILabel(); ansLbl.tag = 500 + idx
            ansLbl.font = .boldSystemFont(ofSize: 17); ansLbl.textColor = .white
            ansLbl.numberOfLines = 2; ansLbl.textAlignment = .center
            ansLbl.translatesAutoresizingMaskIntoConstraints = false
            btn.addSubview(ansLbl)

            NSLayoutConstraint.activate([
                badge.topAnchor.constraint(equalTo: btn.topAnchor, constant: 9),
                badge.leadingAnchor.constraint(equalTo: btn.leadingAnchor, constant: 9),
                badge.widthAnchor.constraint(equalToConstant: 22),
                badge.heightAnchor.constraint(equalToConstant: 22),

                ansLbl.leadingAnchor.constraint(equalTo: btn.leadingAnchor, constant: 8),
                ansLbl.trailingAnchor.constraint(equalTo: btn.trailingAnchor, constant: -8),
                ansLbl.bottomAnchor.constraint(equalTo: btn.bottomAnchor, constant: -10),
                ansLbl.topAnchor.constraint(equalTo: badge.bottomAnchor, constant: 2)
            ])

            gameAnswerButtons.append(btn)
            idx < 2 ? topRow.addArrangedSubview(btn) : bottomRow.addArrangedSubview(btn)
        }

        // ── XP chip ──────────────────────────────────────────────────────
        let xpChip = UIView()
        xpChip.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        xpChip.layer.cornerRadius = 13; xpChip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(xpChip)
        let xpChipLbl = UILabel()
        xpChipLbl.text = "⭐  +5 XP per correct answer"
        xpChipLbl.font = .systemFont(ofSize: 12, weight: .medium)
        xpChipLbl.textColor = UIColor.white.withAlphaComponent(0.75)
        xpChipLbl.translatesAutoresizingMaskIntoConstraints = false
        xpChip.addSubview(xpChipLbl)

        // ── Confetti ─────────────────────────────────────────────────────
        confettiLayer.emitterShape  = .line
        confettiLayer.birthRate     = 0
        let confettiColors: [UIColor] = [t.accent, .systemYellow, .white,
            UIColor(red:1,green:0.4,blue:0.4,alpha:1), UIColor(red:0.4,green:0.8,blue:1,alpha:1)]
        confettiLayer.emitterCells = confettiColors.map { makeConfettiCell($0) }
        view.layer.addSublayer(confettiLayer)

        // ── Layout constraints ───────────────────────────────────────────
        let safe = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([

            backBtn.topAnchor.constraint(equalTo: safe.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 36),
            backBtn.heightAnchor.constraint(equalToConstant: 36),

            pill.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            pill.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pillStack.topAnchor.constraint(equalTo: pill.topAnchor, constant: 7),
            pillStack.bottomAnchor.constraint(equalTo: pill.bottomAnchor, constant: -7),
            pillStack.leadingAnchor.constraint(equalTo: pill.leadingAnchor, constant: 14),
            pillStack.trailingAnchor.constraint(equalTo: pill.trailingAnchor, constant: -14),

            gameXPLabel.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: -8),
            gameXPLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gameXPBar.topAnchor.constraint(equalTo: gameXPLabel.bottomAnchor, constant: 3),
            gameXPBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gameXPBar.widthAnchor.constraint(equalToConstant: 56),
            gameXPBar.heightAnchor.constraint(equalToConstant: 5),

            dotsStack.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 14),
            dotsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            qCountLabel.centerYAnchor.constraint(equalTo: dotsStack.centerYAnchor),
            qCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            streakBadge.centerYAnchor.constraint(equalTo: dotsStack.centerYAnchor),
            streakBadge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            streakBadgeLbl.topAnchor.constraint(equalTo: streakBadge.topAnchor, constant: 5),
            streakBadgeLbl.bottomAnchor.constraint(equalTo: streakBadge.bottomAnchor, constant: -5),
            streakBadgeLbl.leadingAnchor.constraint(equalTo: streakBadge.leadingAnchor, constant: 10),
            streakBadgeLbl.trailingAnchor.constraint(equalTo: streakBadge.trailingAnchor, constant: -10),

            mascotLabel.topAnchor.constraint(equalTo: dotsStack.bottomAnchor, constant: 10),
            mascotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            mascotLabel.widthAnchor.constraint(equalToConstant: 64),

            tail.centerYAnchor.constraint(equalTo: mascotLabel.centerYAnchor),
            tail.leadingAnchor.constraint(equalTo: mascotLabel.trailingAnchor, constant: -2),
            tail.widthAnchor.constraint(equalToConstant: 14),
            tail.heightAnchor.constraint(equalToConstant: 14),

            speechBubble.centerYAnchor.constraint(equalTo: mascotLabel.centerYAnchor),
            speechBubble.leadingAnchor.constraint(equalTo: mascotLabel.trailingAnchor, constant: 8),
            speechBubble.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            speechLabel.topAnchor.constraint(equalTo: speechBubble.topAnchor, constant: 12),
            speechLabel.bottomAnchor.constraint(equalTo: speechBubble.bottomAnchor, constant: -12),
            speechLabel.leadingAnchor.constraint(equalTo: speechBubble.leadingAnchor, constant: 14),
            speechLabel.trailingAnchor.constraint(equalTo: speechBubble.trailingAnchor, constant: -14),

            questionDivider.topAnchor.constraint(equalTo: speechBubble.bottomAnchor, constant: 12),
            questionDivider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            questionDivider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            questionDivider.heightAnchor.constraint(equalToConstant: 1),

            grid.topAnchor.constraint(equalTo: questionDivider.bottomAnchor, constant: 12),
            grid.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            grid.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            grid.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.36),

            xpChip.topAnchor.constraint(equalTo: grid.bottomAnchor, constant: 10),
            xpChip.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            xpChipLbl.topAnchor.constraint(equalTo: xpChip.topAnchor, constant: 7),
            xpChipLbl.bottomAnchor.constraint(equalTo: xpChip.bottomAnchor, constant: -7),
            xpChipLbl.leadingAnchor.constraint(equalTo: xpChip.leadingAnchor, constant: 14),
            xpChipLbl.trailingAnchor.constraint(equalTo: xpChip.trailingAnchor, constant: -14),
        ])
    }

    private func makeRowStack() -> UIStackView {
        let s = UIStackView(); s.axis = .horizontal; s.spacing = 12
        s.distribution = .fillEqually; return s
    }

    // MARK: - Confetti cell

    private func makeConfettiCell(_ color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 7; cell.lifetime = 3.2
        cell.velocity = 200; cell.velocityRange = 70
        cell.emissionLongitude = .pi; cell.emissionRange = .pi / 4
        cell.spin = 4; cell.spinRange = 5
        cell.scale = 0.06; cell.scaleRange = 0.03
        let sz = CGSize(width: 10, height: 10)
        UIGraphicsBeginImageContextWithOptions(sz, false, 0)
        color.setFill(); UIRectFill(CGRect(origin: .zero, size: sz))
        cell.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        return cell
    }

    // MARK: - Header / XP

    private func refreshXP() {
        guard let user = Session.shared.currentUser else { return }
        gameXPLabel.text = "\(user.xp) XP"
        gameXPBar.progress = min(Float(user.xp % 500) / 500.0, 1.0)
        usernameLabel.text = user.username; xpLabel.text = "\(user.xp) XP"
    }

    // MARK: - Mascot messages

    private func showIdleMessage() {
        let msgs = theme.idleSays
        setSpeech(msgs[Int.random(in: 0..<msgs.count)], emoji: theme.mascot)
    }

    private func showCorrectMessage() {
        let msgs = theme.correctSays
        setSpeech(msgs[Int.random(in: 0..<msgs.count)], emoji: theme.mascotYay)
    }

    private func showWrongMessage(correctAnswer: String) {
        setSpeech("\(theme.wrongPrefix)\"\(correctAnswer)\" 💡", emoji: theme.mascotOops)
    }

    private func setSpeech(_ text: String, emoji: String) {
        UIView.transition(with: speechBubble, duration: 0.25, options: .transitionCrossDissolve) {
            self.speechLabel.text = text
        }
        UIView.transition(with: mascotLabel, duration: 0.20, options: .transitionCrossDissolve) {
            self.mascotLabel.text = emoji
            self.mascotLabel.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        } completion: { _ in
            UIView.animate(withDuration: 0.20) {
                self.mascotLabel.transform = .identity
            }
        }
    }

    // MARK: - Progress dots

    private func updateDots(current: Int) {
        let t = theme
        for (i, dot) in progressDots.enumerated() {
            UIView.animate(withDuration: 0.22, delay: Double(i) * 0.04) {
                dot.backgroundColor = i < current ? t.accent
                    : i == current  ? .white
                    : UIColor.white.withAlphaComponent(0.25)
                dot.transform = i == current
                    ? CGAffineTransform(scaleX: 1.3, y: 1.3) : .identity
            }
        }
        qCountLabel.text = "\(current + 1)/\(questions.count)"
    }

    // MARK: - Streak

    private func updateStreak(correct: Bool) {
        if correct { streak += 1 } else { streak = 0 }
        if streak >= 2 {
            streakBadgeLbl.text = "🔥 \(streak) streak!"
            UIView.animate(withDuration: 0.30,
                           delay: 0,
                           usingSpringWithDamping: 0.60,
                           initialSpringVelocity: 0.8,
                           options: [],
                           animations: { self.streakBadge.alpha = 1; self.streakBadge.transform = .identity },
                           completion: { _ in })
            // Pulse the badge
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.0; pulse.toValue = 1.15
            pulse.autoreverses = true; pulse.repeatCount = 2; pulse.duration = 0.18
            streakBadge.layer.add(pulse, forKey: "pulse")
        } else {
            UIView.animate(withDuration: 0.20) { self.streakBadge.alpha = 0 }
        }
    }

    // MARK: - Load question

    private func loadQuestion(at index: Int) {
        guard index < questions.count else { return }
        let q = questions[index]

        // Update speech bubble with idle message
        showIdleMessage()

        // Update speech bubble question text in the bubble BELOW (add question area in bubble)
        // We embed the question text inside the speech bubble label
        speechLabel.text = q.text  // question IS the speech bubble text — mascot "asks" it

        updateDots(current: index)
        setAnswerButtonsEnabled(true)
        restoreButtonColors()

        // Set answer texts
        zip(gameAnswerButtons, q.answers).forEach { btn, answer in
            (btn.viewWithTag(500 + btn.tag) as? UILabel)?.text = answer
        }

        // Staggered bounce-in for answer buttons
        for (i, btn) in gameAnswerButtons.enumerated() {
            btn.transform = CGAffineTransform(scaleX: 0.80, y: 0.80); btn.alpha = 0
            UIView.animate(withDuration: 0.42, delay: Double(i) * 0.08,
                           usingSpringWithDamping: 0.60, initialSpringVelocity: 0.6,
                           options: []) { btn.transform = .identity; btn.alpha = 1 }
                completion: { _ in }
        }

        // Keep illustration data running (hidden, for compatibility)
        startIllustrationAnimation(for: q)
    }

    private func startIllustrationAnimation(for question: Question) {
        illustrationImageView.stopAnimating()
        illustrationImageView.layer.removeAllAnimations()
        let frames = question.animationNames.compactMap { UIImage(named: $0) }
        if frames.count >= 2 {
            illustrationImageView.animationImages = frames
            illustrationImageView.animationDuration = question.animationDuration
            illustrationImageView.animationRepeatCount = 0
            illustrationImageView.startAnimating()
        } else {
            illustrationImageView.image = UIImage(named: question.illustrationName)
        }
    }

    // MARK: - Answer handling

    @objc private func didTapAnswer(_ sender: UIButton) {
        let q = questions[currentIndex]
        setAnswerButtonsEnabled(false)

        // Press animation
        UIView.animate(withDuration: 0.09) { sender.transform = CGAffineTransform(scaleX: 0.91, y: 0.91) }
        completion: { _ in
            UIView.animate(withDuration: 0.18, delay: 0,
                           usingSpringWithDamping: 0.55, initialSpringVelocity: 0.8,
                           options: []) { sender.transform = .identity } completion: { _ in }
        }

        if sender.tag == q.correctIndex {
            handleCorrect(q: q, tapped: sender)
        } else {
            handleWrong(q: q, tapped: sender)
        }
    }

    private func handleCorrect(q: Question, tapped: UIButton) {
        let xp = q.xpReward
        totalXPEarned += xp
        awardXP(xp)
        updateStreak(correct: true)
        showCorrectMessage()

        // Flash button green + scale
        UIView.animate(withDuration: 0.20) {
            tapped.backgroundColor = UIColor(red: 0.12, green: 0.80, blue: 0.38, alpha: 1)
            tapped.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
        }

        // XP float from button position
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.floatXP(xp, fromButton: tapped)
        }

        // Confetti burst
        confettiLayer.birthRate = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
            self.confettiLayer.birthRate = 0
        }

        // Advance after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            UIView.animate(withDuration: 0.18) { tapped.transform = .identity }
            self.advanceToNextQuestion()
        }
    }

    private func handleWrong(q: Question, tapped: UIButton) {
        updateStreak(correct: false)

        let correctAnswer = q.answers.indices.contains(q.correctIndex)
            ? q.answers[q.correctIndex] : "—"
        showWrongMessage(correctAnswer: correctAnswer)

        // Tapped button — dark red flash
        UIView.animate(withDuration: 0.16) {
            tapped.backgroundColor = UIColor(red: 0.55, green: 0.05, blue: 0.05, alpha: 1)
        } completion: { _ in
            UIView.animate(withDuration: 0.28) {
                tapped.backgroundColor = self.answerColors[tapped.tag]
            }
        }

        // Shake the wrong button
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.values = [0, -10, 10, -7, 7, -3, 3, 0]
        shake.keyTimes = [0, 0.10, 0.26, 0.42, 0.58, 0.72, 0.86, 1.0]
        shake.duration = 0.42
        tapped.layer.add(shake, forKey: "shake")

        // Reveal correct answer with a green glow pulse
        if q.correctIndex < gameAnswerButtons.count {
            let correctBtn = gameAnswerButtons[q.correctIndex]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                UIView.animate(withDuration: 0.25) {
                    correctBtn.backgroundColor = UIColor(red: 0.12, green: 0.80, blue: 0.38, alpha: 1)
                    correctBtn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                }
                let glow = CABasicAnimation(keyPath: "shadowOpacity")
                glow.fromValue = 0.0; glow.toValue = 0.9
                glow.autoreverses = true; glow.repeatCount = 3; glow.duration = 0.3
                correctBtn.layer.shadowColor = UIColor(red: 0.12, green: 0.80, blue: 0.38, alpha: 1).cgColor
                correctBtn.layer.add(glow, forKey: "glow")
            }
        }

        // Advance after showing the correct answer
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            UIView.animate(withDuration: 0.18) {
                if q.correctIndex < self.gameAnswerButtons.count {
                    self.gameAnswerButtons[q.correctIndex].transform = .identity
                }
            }
            self.advanceToNextQuestion()
        }
    }

    // MARK: - XP float animation

    private func floatXP(_ amount: Int, fromButton btn: UIButton) {
        guard let btnSuperview = btn.superview else { return }
        let btnFrameInView = btnSuperview.convert(btn.frame, to: view)
        let startPoint = CGPoint(x: btnFrameInView.midX, y: btnFrameInView.minY)

        let lbl = UILabel()
        lbl.text = "+\(amount) XP ⭐"; lbl.font = .boldSystemFont(ofSize: 24)
        lbl.textColor = theme.accent
        lbl.layer.shadowColor   = UIColor.black.cgColor
        lbl.layer.shadowOpacity = 0.4; lbl.layer.shadowRadius = 4
        lbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lbl)

        let cx = lbl.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: startPoint.x)
        let cy = lbl.centerYAnchor.constraint(equalTo: view.topAnchor, constant: startPoint.y)
        NSLayoutConstraint.activate([cx, cy]); view.layoutIfNeeded()

        lbl.transform = CGAffineTransform(scaleX: 0.6, y: 0.6); lbl.alpha = 0
        UIView.animate(withDuration: 0.25) { lbl.transform = .identity; lbl.alpha = 1 }
        UIView.animate(withDuration: 0.80, delay: 0.20, options: .curveEaseOut) {
            cy.constant -= 90
            lbl.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in lbl.removeFromSuperview() }
    }

    // MARK: - Advance

    private func advanceToNextQuestion() {
        let nextIndex = currentIndex + 1
        if nextIndex < questions.count {
            currentIndex = nextIndex
            // Slide out old content, slide in new
            UIView.animate(withDuration: 0.18, animations: {
                self.speechBubble.alpha = 0
                self.gameAnswerButtons.forEach { $0.alpha = 0; $0.transform = CGAffineTransform(translationX: -20, y: 0) }
            }) { _ in
                self.speechBubble.alpha = 1
                self.loadQuestion(at: self.currentIndex)
            }
        } else {
            showCompletion()
        }
    }

    // MARK: - Completion card

    private func showCompletion() {
        let t = theme
        confettiLayer.birthRate = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { self.confettiLayer.birthRate = 0 }

        let dim = UIView(); dim.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        dim.translatesAutoresizingMaskIntoConstraints = false; view.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: view.topAnchor),
            dim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let card = UIView()
        card.backgroundColor = UIColor.white.withAlphaComponent(0.97)
        card.layer.cornerRadius = 32; card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.78, y: 0.78)
        card.translatesAutoresizingMaskIntoConstraints = false; view.addSubview(card)

        let starsLbl = UILabel(); starsLbl.text = totalXPEarned > 0 ? "⭐⭐⭐" : "⭐"
        starsLbl.font = .systemFont(ofSize: 54); starsLbl.textAlignment = .center
        starsLbl.translatesAutoresizingMaskIntoConstraints = false

        let titleLbl = UILabel(); titleLbl.text = "Level Complete! 🎉"
        titleLbl.font = .boldSystemFont(ofSize: 26); titleLbl.textColor = .black
        titleLbl.textAlignment = .center; titleLbl.translatesAutoresizingMaskIntoConstraints = false

        let xpBig = UILabel(); xpBig.text = "+\(totalXPEarned) XP earned!"
        xpBig.font = .boldSystemFont(ofSize: 22)
        xpBig.textColor = t.gradTop; xpBig.textAlignment = .center
        xpBig.translatesAutoresizingMaskIntoConstraints = false

        let msgLbl = UILabel()
        msgLbl.text = totalXPEarned > 0 ? "You're on a roll! Keep it up! 🚀" : "Practice makes perfect! 💪"
        msgLbl.font = .systemFont(ofSize: 15, weight: .medium)
        msgLbl.textColor = UIColor.black.withAlphaComponent(0.65)
        msgLbl.textAlignment = .center; msgLbl.numberOfLines = 0
        msgLbl.translatesAutoresizingMaskIntoConstraints = false

        let doneBtn = UIButton(type: .system)
        doneBtn.setTitle("Back to Map  🗺️", for: .normal)
        doneBtn.setTitleColor(.white, for: .normal)
        doneBtn.titleLabel?.font = .boldSystemFont(ofSize: 19)
        doneBtn.backgroundColor = t.gradTop; doneBtn.layer.cornerRadius = 22
        doneBtn.clipsToBounds = true; doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.addAction(UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        [starsLbl, titleLbl, xpBig, msgLbl, doneBtn].forEach { card.addSubview($0) }
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),

            starsLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 26),
            starsLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            titleLbl.topAnchor.constraint(equalTo: starsLbl.bottomAnchor, constant: 10),
            titleLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            titleLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            xpBig.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            xpBig.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            msgLbl.topAnchor.constraint(equalTo: xpBig.bottomAnchor, constant: 8),
            msgLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            msgLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            doneBtn.topAnchor.constraint(equalTo: msgLbl.bottomAnchor, constant: 22),
            doneBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            doneBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),
            doneBtn.heightAnchor.constraint(equalToConstant: 52),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -26)
        ])

        UIView.animate(withDuration: 0.18) { dim.alpha = 1 }
        UIView.animate(withDuration: 0.38, delay: 0.05,
                       usingSpringWithDamping: 0.70, initialSpringVelocity: 0.8, options: []) {
            card.alpha = 1; card.transform = .identity
        } completion: { _ in }
    }

    // MARK: - XP award

    private func awardXP(_ amount: Int) {
        guard let user = Session.shared.currentUser else { return }
        let newXP = user.xp + amount
        let levelUp = newXP >= 100
        Session.shared.currentUser = CurrentUser(
            username: user.username, avatarIndex: user.avatarIndex,
            level: levelUp ? user.level + 1 : user.level,
            xp:    levelUp ? newXP - 100    : newXP,
            age:   user.age)
        refreshXP()
    }

    // MARK: - Helpers

    private func setAnswerButtonsEnabled(_ on: Bool) {
        gameAnswerButtons.forEach { $0.isEnabled = on }
    }

    private func restoreButtonColors() {
        zip(gameAnswerButtons, answerColors).forEach { btn, color in
            btn.backgroundColor = color; btn.transform = .identity; btn.alpha = 1
        }
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
