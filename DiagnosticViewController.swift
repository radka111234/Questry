import UIKit

final class DiagnosticViewController: UIViewController {

    // MARK: - Header Outlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!

    // MARK: - Main Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionInfoLabel: UILabel!
    @IBOutlet weak var questionPercentLabel: UILabel!

    @IBOutlet weak var questionCardView: UIView!
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var optionButton5: UIButton!

    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Data

    /// Age-filtered subset of all diagnostic questions.
    /// Younger students only see the easier questions; older students see the full range.
    private var diagnosticQuestions: [DiagnosticQuestion] = []

    private var currentQuestionIndex = 0
    private var selectedAnswerIndex: Int?
    private var score = 0
    private var dontKnowCount = 0

    private var optionButtons: [UIButton] {
        [optionButton1, optionButton2, optionButton3, optionButton4, optionButton5]
    }

    // MARK: - Keys

    private let diagnosticDoneKey = "math_diagnostic_done"
    private let startTopicKey = "math_start_topic"
    private let unlockedKey = "math_world_unlocked_level"
    private let completedKey = "math_world_completed_levels"
    private let worldXPKey = "math_world_total_xp"
    private let currentTopicKey = "math_current_topic"
    private let practiceUnlockedKey = "math_practice_unlocked_quest"
    private let practiceCompletedKey = "math_practice_completed_quests"

    // MARK: - Theme

    private let questBlue = UIColor(red: 25/255, green: 157/255, blue: 222/255, alpha: 1.0)
    private let selectedBlue = UIColor(red: 25/255, green: 157/255, blue: 222/255, alpha: 1.0)

    // MARK: - Overlay

    private var dimOverlayView: UIView?
    private var resultCardView: UIView?
    private var confettiLayer: CAEmitterLayer?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        diagnosticQuestions = ageAppropriateQuestions()
        styleUI()
        refreshHeader()
        loadCurrentQuestion()
    }

    // MARK: - Age filtering

    private func ageAppropriateQuestions() -> [DiagnosticQuestion] {
        let all = MathGameData.diagnosticQuestions
        let age = Session.shared.currentUser?.age ?? 10

        // Questions are ordered easiest→hardest (Grade 1 → University).
        // We show only as many questions as are relevant for the student's age,
        // so a 6-year-old never sees calculus and a 20-year-old isn't asked what 1+1 is.
        let count: Int
        switch age {
        case ..<8:    count = 8   // Age 5-7  → Grade 1-2 band only
        case 8...10:  count = 12  // Age 8-10 → up to Grade 4
        case 11...13: count = 16  // Age 11-13 → up to Grade 6
        case 14...16: count = 20  // Age 14-16 → up to Grade 9
        case 17...18: count = 23  // Age 17-18 → up to Grade 11
        default:      count = all.count  // Age 19+ → full 25-question range
        }
        return Array(all.prefix(count))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }

    // MARK: - UI Setup

    private func styleUI() {
        titleLabel.textColor = .black
        subtitleLabel.textColor = UIColor.black.withAlphaComponent(0.75)

        xpProgressView.progressTintColor = questBlue
        xpProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.35)
        xpProgressView.layer.cornerRadius = 4
        xpProgressView.clipsToBounds = true

        progressView.progressTintColor = questBlue
        progressView.trackTintColor = UIColor.white.withAlphaComponent(0.35)
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true

        questionInfoLabel.textColor = .black
        questionPercentLabel.textColor = .black

        questionCountLabel.textColor = UIColor.black.withAlphaComponent(0.72)
        questionLabel.textColor = .black
        questionLabel.numberOfLines = 0

        questionCardView.layer.cornerRadius = 24
        questionCardView.clipsToBounds = true

        for button in optionButtons {
            button.layer.cornerRadius = 18
            button.clipsToBounds = true
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            button.contentEdgeInsets = UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)

            if button.backgroundColor == nil || button.backgroundColor == .clear {
                button.backgroundColor = UIColor.white.withAlphaComponent(0.75)
            }
        }

        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.alpha = 0.55
        nextButton.isEnabled = false

        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
    }

    // MARK: - Header

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        let shownXP = Session.shared.currentUser?.xp ?? 0

        usernameLabel.text = Session.shared.currentUser?.username ?? "Username"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        xpLabel.text = "\(shownXP) XP"
        xpProgressView.progress = min(Float(shownXP % 500) / 500.0, 1.0)
    }

    // MARK: - Load Question

    private func loadCurrentQuestion() {
        guard currentQuestionIndex < diagnosticQuestions.count else {
            finishDiagnostic()
            return
        }

        let question = diagnosticQuestions[currentQuestionIndex]
        selectedAnswerIndex = nil

        questionCountLabel.text = "Question \(currentQuestionIndex + 1) of \(diagnosticQuestions.count)"
        questionLabel.text = question.prompt

        questionInfoLabel.text = "Question \(currentQuestionIndex + 1) of \(diagnosticQuestions.count)"
        let percent = Int((Float(currentQuestionIndex) / Float(diagnosticQuestions.count)) * 100)
        questionPercentLabel.text = "\(percent)%"

        for (index, button) in optionButtons.enumerated() {
            if index < question.options.count {
                button.isHidden = false
                button.setTitle(question.options[index], for: .normal)
            } else {
                button.isHidden = true
            }
            styleOptionButton(button, isSelected: false)
        }

        let progress = Float(currentQuestionIndex) / Float(diagnosticQuestions.count)
        progressView.setProgress(progress, animated: true)

        nextButton.setTitle(
            currentQuestionIndex == diagnosticQuestions.count - 1 ? "Finish ✓" : "Next ✓",
            for: .normal
        )
        nextButton.isEnabled = false
        nextButton.alpha = 0.55
    }

    private func styleOptionButton(_ button: UIButton, isSelected: Bool) {
        if isSelected {
            button.backgroundColor = selectedBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.borderWidth = 0
        } else {
            if button.backgroundColor == nil || button.backgroundColor == .clear || button.backgroundColor == selectedBlue {
                button.backgroundColor = UIColor.white.withAlphaComponent(0.75)
            }
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 0
        }
    }

    // MARK: - Actions

    @IBAction func optionTapped(_ sender: UIButton) {
        guard let index = optionButtons.firstIndex(of: sender) else { return }
        selectedAnswerIndex = index

        for button in optionButtons {
            styleOptionButton(button, isSelected: button == sender)
        }

        animateOptionTap(sender)

        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        guard currentQuestionIndex < diagnosticQuestions.count else { return }
        guard let selectedAnswerIndex else { return }

        let question = diagnosticQuestions[currentQuestionIndex]

        if selectedAnswerIndex == question.correctIndex {
            score += 1
        }

        if selectedAnswerIndex == question.options.count - 1 {
            dontKnowCount += 1
        }

        animateNextButtonTap()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) { [weak self] in
            guard let self = self else { return }
            self.currentQuestionIndex += 1
            self.loadCurrentQuestion()
        }
    }

    // MARK: - Animation

    private func animateOptionTap(_ button: UIButton) {
        UIView.animate(withDuration: 0.10, animations: {
            button.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        }) { _ in
            UIView.animate(withDuration: 0.12) {
                button.transform = .identity
            }
        }
    }

    private func animateNextButtonTap() {
        UIView.animate(withDuration: 0.10, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
            self.nextButton.alpha = 0.85
        }) { _ in
            UIView.animate(withDuration: 0.12) {
                self.nextButton.transform = .identity
                self.nextButton.alpha = 1.0
            }
        }
    }

    // MARK: - Finish

    private func finishDiagnostic() {
        let recommended = recommendedTopic()
        // Find the nearest topic that has questions in either bank (drag-and-drop or MCQ)
        let available = MathGameData.availableTopicIds()
        let startTopic = available.first(where: { $0 >= recommended }) ?? available.first ?? 1

        UserDefaults.standard.set(true, forKey: diagnosticDoneKey)
        UserDefaults.standard.set(startTopic, forKey: startTopicKey)
        UserDefaults.standard.set(startTopic, forKey: currentTopicKey)

        // start fresh in this topic
        UserDefaults.standard.set(1, forKey: practiceUnlockedKey)
        UserDefaults.standard.set([], forKey: practiceCompletedKey)

        showDiagnosticResult(startTopic: startTopic)
    }

    private func recommendedTopic() -> Int {
        // 25 diagnostic questions spanning Grade 1 → University (see MathGameData.diagnosticQuestions).
        // Questions are ordered easiest → hardest in bands of roughly 2-3 questions per grade level.
        // Score bands map to topic IDs so that the student starts just BEFORE the level they first
        // struggled at, giving them a gentle on-ramp rather than placing them too high.
        //
        // If the student answers "I don't know" more than 8 times, start from the very beginning.
        if dontKnowCount >= 8 || score == 0 {
            return 1   // Counting – absolute beginner
        }
        switch score {
        case 1...2:   return 1   // Grade 1  -  Counting / Addition
        case 3:       return 2   // Grade 1  -  Addition
        case 4:       return 3   // Grade 2  -  Subtraction
        case 5:       return 4   // Grade 2-3  -  Multiplication
        case 6:       return 5   // Grade 3  -  Division
        case 7:       return 7   // Grade 3-4  -  Fractions
        case 8:       return 9   // Grade 4-5  -  Decimals
        case 9:       return 11  // Grade 5  -  Percentages
        case 10:      return 13  // Grade 3  -  Place Value
        case 11:      return 17  // Grade 3-4  -  Patterns & Sequences
        case 12:      return 19  // Grade 4  -  Mixed Numbers
        case 13:      return 21  // Grade 4-5  -  Adding Fractions
        case 14:      return 23  // Grade 5-6  -  Ratios
        case 15:      return 26  // Grade 5-6  -  Negative Numbers
        case 16:      return 31  // Grade 6-7  -  Ratio & Proportion
        case 17:      return 34  // Grade 6-7  -  Probability
        case 18:      return 37  // Grade 7-8  -  Algebraic Expressions
        case 19:      return 40  // Grade 7-8  -  Powers & Exponents
        case 20:      return 43  // Grade 8-9  -  Scientific Notation
        case 21:      return 46  // Grade 8-9  -  Quadratic Equations
        case 22:      return 49  // Grade 9-10  -  Functions
        case 23:      return 53  // Grade 9-10  -  Trigonometry
        case 24:      return 55  // Grade 10-11  -  Logarithms
        default:      return 63  // Grade 11-12  -  Calculus: Limits (top score!)
        }
    }

    // MARK: - Result Overlay

    private func removeResultOverlay() {
        confettiLayer?.birthRate = 0
        confettiLayer?.removeFromSuperlayer()
        confettiLayer = nil

        resultCardView?.removeFromSuperview()
        dimOverlayView?.removeFromSuperview()
        resultCardView = nil
        dimOverlayView = nil
    }

    private func showDiagnosticResult(startTopic: Int) {
        let topicTitle = MathGameData.topic(for: startTopic)?.nodeTitle ?? "Counting"

        removeResultOverlay()

        let dimView = UIView()
        dimView.translatesAutoresizingMaskIntoConstraints = false
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.22)
        dimView.alpha = 0
        view.addSubview(dimView)

        NSLayoutConstraint.activate([
            dimView.topAnchor.constraint(equalTo: view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 32
        card.clipsToBounds = true
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.82, y: 0.82)
        card.backgroundColor = UIColor(red: 219/255, green: 244/255, blue: 255/255, alpha: 0.98)
        view.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])

        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = "🎯"
        emojiLabel.font = UIFont.systemFont(ofSize: 60)
        emojiLabel.textAlignment = .center
        emojiLabel.transform = CGAffineTransform(scaleX: 0.25, y: 0.25).rotated(by: -.pi / 10)

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "You're Ready!"
        title.font = UIFont.boldSystemFont(ofSize: 30)
        title.textAlignment = .center
        title.textColor = .black

        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.text = "We’ll start you in \(topicTitle)."
        message.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        message.textAlignment = .center
        message.textColor = UIColor.black.withAlphaComponent(0.82)
        message.numberOfLines = 0

        let subMessage = UILabel()
        subMessage.translatesAutoresizingMaskIntoConstraints = false
        subMessage.text = "Great job finishing your check-in. Your math adventure starts now!"
        subMessage.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subMessage.textAlignment = .center
        subMessage.textColor = UIColor.black.withAlphaComponent(0.68)
        subMessage.numberOfLines = 0

        let goButton = UIButton(type: .system)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("Go to Map", for: .normal)
        goButton.setTitleColor(.black, for: .normal)
        goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        goButton.layer.cornerRadius = 24
        goButton.clipsToBounds = true
        goButton.backgroundColor = questBlue.withAlphaComponent(0.85)

        goButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.removeResultOverlay()
            self.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        card.addSubview(emojiLabel)
        card.addSubview(title)
        card.addSubview(message)
        card.addSubview(subMessage)
        card.addSubview(goButton)

        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),
            emojiLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            title.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            message.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            message.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            subMessage.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 12),
            subMessage.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            subMessage.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            goButton.topAnchor.constraint(equalTo: subMessage.bottomAnchor, constant: 24),
            goButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            goButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            goButton.heightAnchor.constraint(equalToConstant: 58),
            goButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        dimOverlayView = dimView
        resultCardView = card

        UIView.animate(withDuration: 0.20) {
            dimView.alpha = 1
        }

        UIView.animate(
            withDuration: 0.36,
            delay: 0.02,
            usingSpringWithDamping: 0.78,
            initialSpringVelocity: 0.9,
            options: [.curveEaseOut],
            animations: {
                card.alpha = 1
                card.transform = .identity
            }
        )

        UIView.animate(
            withDuration: 0.42,
            delay: 0.18,
            usingSpringWithDamping: 0.56,
            initialSpringVelocity: 0.95,
            options: [.curveEaseOut],
            animations: {
                emojiLabel.transform = .identity
            }
        )

        launchConfetti()
    }

    private func launchConfetti() {
        confettiLayer?.removeFromSuperlayer()

        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: view.bounds.midX, y: -12)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: view.bounds.width, height: 2)

        let colors: [UIColor] = [
            questBlue,
            .systemPink,
            .systemYellow,
            .systemGreen,
            .systemPurple
        ]

        emitter.emitterCells = colors.map { color in
            let cell = CAEmitterCell()
            cell.birthRate = 7
            cell.lifetime = 3.2
            cell.velocity = 220
            cell.velocityRange = 80
            cell.emissionLongitude = .pi
            cell.emissionRange = .pi / 5
            cell.spin = 3.5
            cell.spinRange = 4
            cell.scale = 0.18
            cell.scaleRange = 0.09
            cell.color = color.cgColor
            cell.contents = makeConfettiImage(color: color).cgImage
            return cell
        }

        view.layer.addSublayer(emitter)
        confettiLayer = emitter

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) { [weak self] in
            self?.confettiLayer?.birthRate = 0
        }
    }

    private func makeConfettiImage(color: UIColor) -> UIImage {
        let size = CGSize(width: 10, height: 16)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            color.setFill()
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 2).fill()
        }
    }
}
