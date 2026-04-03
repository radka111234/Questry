import UIKit

final class EngDiagnosticViewController: UIViewController {

    // MARK: - Data

    private var questions: [MathExamQuestion] = []
    private var currentQuestionIndex = 0
    private var selectedAnswerIndex: Int?
    private var score = 0
    private var dontKnowCount = 0

    // MARK: - UserDefaults Keys

    private let diagnosticDoneKey    = "eng_diagnostic_done"
    private let startTopicKey        = "eng_start_topic"
    private let currentTopicKey      = "eng_current_topic"
    private let practiceUnlockedKey  = "eng_practice_unlocked_quest"
    private let practiceCompletedKey = "eng_practice_completed_quests"

    // MARK: - Theme

    private let engPurple  = UIColor(red: 0.45, green: 0.20, blue: 0.80, alpha: 1.0)
    private let darkPurple = UIColor(red: 0.18, green: 0.06, blue: 0.35, alpha: 1.0)
    private let deepBlue   = UIColor(red: 0.02, green: 0.06, blue: 0.28, alpha: 1.0)

    // MARK: - UI Elements

    private let scrollView       = UIScrollView()
    private let contentView      = UIView()

    private let backButton       = UIButton(type: .system)

    // Header
    private let headerStack      = UIStackView()
    private let avatarImageView  = UIImageView()
    private let usernameLabel    = UILabel()
    private let levelLabel       = UILabel()
    private let xpLabel          = UILabel()
    private let xpProgressBar    = UIProgressView()

    // Title area
    private let titleLabel       = UILabel()
    private let subtitleLabel    = UILabel()

    // Progress
    private let progressView     = UIProgressView()
    private let questionInfoLabel = UILabel()

    // Question card
    private let questionCardView  = UIView()
    private let questionCountLabel = UILabel()
    private let questionLabel      = UILabel()

    // Option buttons
    private var optionButtons: [UIButton] = []

    // Next button
    private let nextButton = UIButton(type: .system)

    // Result overlay
    private var dimOverlayView: UIView?
    private var resultCardView: UIView?
    private var confettiLayer: CAEmitterLayer?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        questions = diagnosticQuestions()
        setupGradient()
        setupUI()
        refreshHeader()
        loadCurrentQuestion()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        // Keep gradient full screen
        view.layer.sublayers?.first { $0 is CAGradientLayer }?.frame = view.bounds
    }

    // MARK: - Diagnostic Questions

    /// Build a 10-question diagnostic by pulling the first practice question from
    /// topics spread across grades: 1, 3, 6, 9, 12, 15, 18, 21, 27, 33.
    /// Each question is presented with 3 standard options + "I don't know" as option 4.
    private func diagnosticQuestions() -> [MathExamQuestion] {
        let sampledTopicIds = [1, 3, 6, 9, 12, 15, 18, 21, 27, 33]
        var result: [MathExamQuestion] = []
        for topicId in sampledTopicIds {
            let all = EnglishGameData.practiceQuestions(for: topicId, questNumber: 1)
            if let first = all.first {
                // Append a "I don't know" option so the diagnostic can detect uncertainty
                let opts = first.options + ["I don't know"]
                let q = MathExamQuestion(
                    id: first.id + "_diag",
                    topicId: first.topicId,
                    prompt: first.prompt,
                    options: opts,
                    correctIndex: first.correctIndex
                )
                result.append(q)
            }
        }
        return result
    }

    // MARK: - Gradient Background

    private func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [darkPurple.cgColor, deepBlue.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint   = CGPoint(x: 0.5, y: 1)
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }

    // MARK: - UI Setup

    private func setupUI() {
        setupScrollView()
        setupBackButton()
        setupHeader()
        setupTitleArea()
        setupProgressArea()
        setupQuestionCard()
        setupOptionButtons()
        setupNextButton()
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let chevron = UIImage(systemName: "chevron.left",
                              withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))
        backButton.setImage(chevron, for: .normal)
        backButton.tintColor = .white
        backButton.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backButton.layer.cornerRadius = 18
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        contentView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    private func setupHeader() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 22
        avatarImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true

        usernameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        usernameLabel.textColor = .white

        levelLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        levelLabel.textColor = UIColor.white.withAlphaComponent(0.75)

        xpLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        xpLabel.textColor = .white
        xpLabel.translatesAutoresizingMaskIntoConstraints = false
        xpLabel.setContentHuggingPriority(.required, for: .horizontal)

        let nameStack = UIStackView(arrangedSubviews: [usernameLabel, levelLabel])
        nameStack.axis = .vertical
        nameStack.spacing = 2
        nameStack.alignment = .leading

        headerStack.translatesAutoresizingMaskIntoConstraints = false
        headerStack.axis = .horizontal
        headerStack.spacing = 10
        headerStack.alignment = .center
        headerStack.addArrangedSubview(avatarImageView)
        headerStack.addArrangedSubview(nameStack)

        xpProgressBar.translatesAutoresizingMaskIntoConstraints = false
        xpProgressBar.progressTintColor = engPurple
        xpProgressBar.trackTintColor = UIColor.white.withAlphaComponent(0.25)
        xpProgressBar.layer.cornerRadius = 3
        xpProgressBar.clipsToBounds = true

        contentView.addSubview(headerStack)
        contentView.addSubview(xpLabel)
        contentView.addSubview(xpProgressBar)

        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            headerStack.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),

            xpLabel.centerYAnchor.constraint(equalTo: headerStack.centerYAnchor),
            xpLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            xpLabel.leadingAnchor.constraint(greaterThanOrEqualTo: headerStack.trailingAnchor, constant: 12),

            xpProgressBar.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 8),
            xpProgressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            xpProgressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            xpProgressBar.heightAnchor.constraint(equalToConstant: 4)
        ])
    }

    private func setupTitleArea() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "📖 English Village"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Let's see where you shine!"
        subtitleLabel.font = UIFont.systemFont(ofSize: 15)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0

        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: xpProgressBar.bottomAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }

    private func setupProgressArea() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = engPurple
        progressView.trackTintColor = UIColor.white.withAlphaComponent(0.25)
        progressView.layer.cornerRadius = 3
        progressView.clipsToBounds = true

        questionInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        questionInfoLabel.text = "Question 1 of \(questions.count)"
        questionInfoLabel.font = UIFont.systemFont(ofSize: 14)
        questionInfoLabel.textColor = .white
        questionInfoLabel.textAlignment = .right

        contentView.addSubview(progressView)
        contentView.addSubview(questionInfoLabel)

        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            progressView.heightAnchor.constraint(equalToConstant: 6),

            questionInfoLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 6),
            questionInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }

    private func setupQuestionCard() {
        questionCardView.translatesAutoresizingMaskIntoConstraints = false
        questionCardView.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        questionCardView.layer.cornerRadius = 20
        questionCardView.clipsToBounds = true

        questionCountLabel.translatesAutoresizingMaskIntoConstraints = false
        questionCountLabel.font = UIFont.systemFont(ofSize: 13)
        questionCountLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        questionCountLabel.numberOfLines = 1

        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 0

        questionCardView.addSubview(questionCountLabel)
        questionCardView.addSubview(questionLabel)

        contentView.addSubview(questionCardView)

        NSLayoutConstraint.activate([
            questionCardView.topAnchor.constraint(equalTo: questionInfoLabel.bottomAnchor, constant: 14),
            questionCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            questionCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            questionCountLabel.topAnchor.constraint(equalTo: questionCardView.topAnchor, constant: 16),
            questionCountLabel.leadingAnchor.constraint(equalTo: questionCardView.leadingAnchor, constant: 18),
            questionCountLabel.trailingAnchor.constraint(equalTo: questionCardView.trailingAnchor, constant: -18),

            questionLabel.topAnchor.constraint(equalTo: questionCountLabel.bottomAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: questionCardView.leadingAnchor, constant: 18),
            questionLabel.trailingAnchor.constraint(equalTo: questionCardView.trailingAnchor, constant: -18),
            questionLabel.bottomAnchor.constraint(equalTo: questionCardView.bottomAnchor, constant: -18)
        ])
    }

    private func setupOptionButtons() {
        // 4 standard options + 1 "I don't know" slot (shown dynamically)
        for i in 0..<5 {
            let btn = UIButton(type: .system)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.tag = i
            btn.backgroundColor = UIColor.white.withAlphaComponent(0.20)
            btn.layer.cornerRadius = 16
            btn.clipsToBounds = true
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            btn.titleLabel?.numberOfLines = 0
            btn.titleLabel?.textAlignment = .center
            btn.contentEdgeInsets = UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
            btn.addTarget(self, action: #selector(optionTapped(_:)), for: .touchUpInside)
            contentView.addSubview(btn)
            optionButtons.append(btn)
        }

        var previousAnchor = questionCardView.bottomAnchor
        var previousConstant: CGFloat = 14

        for btn in optionButtons {
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: previousAnchor, constant: previousConstant),
                btn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                btn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
            previousAnchor = btn.bottomAnchor
            previousConstant = 10
        }
    }

    private func setupNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next ✓", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        nextButton.backgroundColor = engPurple
        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.isEnabled = false
        nextButton.alpha = 0.50
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)

        contentView.addSubview(nextButton)

        let lastBtn = optionButtons[optionButtons.count - 1]
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: lastBtn.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            nextButton.heightAnchor.constraint(equalToConstant: 56),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }

    // MARK: - Header Refresh

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)
        usernameLabel.text = Session.shared.currentUser?.username ?? "Explorer"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        let xp = Session.shared.currentUser?.xp ?? 0
        xpLabel.text = "\(xp) XP"
        xpProgressBar.progress = min(Float(xp % 500) / 500.0, 1.0)
    }

    // MARK: - Load Question

    private func loadCurrentQuestion() {
        guard currentQuestionIndex < questions.count else {
            finishDiagnostic()
            return
        }

        let question = questions[currentQuestionIndex]
        selectedAnswerIndex = nil

        let total = questions.count
        let idx   = currentQuestionIndex

        questionCountLabel.text = "Question \(idx + 1) of \(total)"
        questionLabel.text = question.prompt
        questionInfoLabel.text = "Question \(idx + 1) of \(total)"

        let progress = Float(idx) / Float(total)
        progressView.setProgress(progress, animated: true)

        for (i, btn) in optionButtons.enumerated() {
            if i < question.options.count {
                btn.isHidden = false
                btn.setTitle(question.options[i], for: .normal)
            } else {
                btn.isHidden = true
            }
            resetOptionStyle(btn)
        }

        let isLast = idx == total - 1
        nextButton.setTitle(isLast ? "Finish ✓" : "Next ✓", for: .normal)
        nextButton.isEnabled = false
        nextButton.alpha = 0.50
    }

    private func resetOptionStyle(_ button: UIButton) {
        button.backgroundColor = UIColor.white.withAlphaComponent(0.20)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0
    }

    private func selectOptionStyle(_ button: UIButton) {
        button.backgroundColor = engPurple
        button.setTitleColor(.white, for: .normal)
    }

    // MARK: - Actions

    @objc private func optionTapped(_ sender: UIButton) {
        let index = sender.tag
        selectedAnswerIndex = index

        for btn in optionButtons {
            if btn == sender {
                selectOptionStyle(btn)
            } else {
                resetOptionStyle(btn)
            }
        }

        animateTap(sender)
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }

    @objc private func nextTapped() {
        guard currentQuestionIndex < questions.count else { return }
        guard let selected = selectedAnswerIndex else { return }

        let question = questions[currentQuestionIndex]

        if let correctIndex = question.correctIndex, selected == correctIndex {
            score += 1
        }

        // Last option in the diagnostic is the "I don't know" option
        if selected == question.options.count - 1 {
            dontKnowCount += 1
        }

        animateTap(nextButton)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) { [weak self] in
            guard let self = self else { return }
            self.currentQuestionIndex += 1
            self.loadCurrentQuestion()
        }
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Animation

    private func animateTap(_ view: UIView) {
        UIView.animate(withDuration: 0.10, animations: {
            view.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        }) { _ in
            UIView.animate(withDuration: 0.12) {
                view.transform = .identity
            }
        }
    }

    // MARK: - Finish

    private func finishDiagnostic() {
        let startTopic = recommendedTopic()

        UserDefaults.standard.set(true, forKey: diagnosticDoneKey)
        UserDefaults.standard.set(startTopic, forKey: startTopicKey)
        UserDefaults.standard.set(startTopic, forKey: currentTopicKey)
        UserDefaults.standard.set(1, forKey: practiceUnlockedKey)
        UserDefaults.standard.set([], forKey: practiceCompletedKey)

        showDiagnosticResult(startTopic: startTopic)
    }

    private func recommendedTopic() -> Int {
        if dontKnowCount >= 5 { return 1 }
        switch score {
        case 0...1:   return 1
        case 2...3:   return 3
        case 4...5:   return 6
        case 6...7:   return 9
        case 8...9:   return 12
        case 10...11: return 15
        case 12...13: return 18
        case 14:      return 21
        default:      return 27
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
        let topicTitle = EnglishGameData.topicTitle(for: startTopic)

        removeResultOverlay()

        // Dim overlay
        let dimView = UIView()
        dimView.translatesAutoresizingMaskIntoConstraints = false
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.30)
        dimView.alpha = 0
        view.addSubview(dimView)

        NSLayoutConstraint.activate([
            dimView.topAnchor.constraint(equalTo: view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Card
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        card.layer.cornerRadius = 28
        card.clipsToBounds = true
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.82, y: 0.82)
        view.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])

        // Card contents
        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = "📖"
        emojiLabel.font = UIFont.systemFont(ofSize: 60)
        emojiLabel.textAlignment = .center
        emojiLabel.transform = CGAffineTransform(scaleX: 0.25, y: 0.25).rotated(by: -.pi / 10)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "You're Ready to Learn!"
        titleLbl.font = UIFont.boldSystemFont(ofSize: 28)
        titleLbl.textAlignment = .center
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 0

        let startLabel = UILabel()
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        startLabel.text = "Starting you at: \(topicTitle)"
        startLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        startLabel.textAlignment = .center
        startLabel.textColor = UIColor.black.withAlphaComponent(0.80)
        startLabel.numberOfLines = 0

        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "Great job! Your English Village adventure begins now."
        subLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subLabel.textAlignment = .center
        subLabel.textColor = UIColor.darkGray
        subLabel.numberOfLines = 0

        let goButton = UIButton(type: .system)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("Go to Map", for: .normal)
        goButton.setTitleColor(.white, for: .normal)
        goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        goButton.backgroundColor = engPurple
        goButton.layer.cornerRadius = 22
        goButton.clipsToBounds = true

        goButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.removeResultOverlay()
            self.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)

        card.addSubview(emojiLabel)
        card.addSubview(titleLbl)
        card.addSubview(startLabel)
        card.addSubview(subLabel)
        card.addSubview(goButton)

        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 28),
            emojiLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLbl.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 12),
            titleLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            titleLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            startLabel.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            startLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            startLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            subLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 10),
            subLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            subLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            goButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 24),
            goButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            goButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            goButton.heightAnchor.constraint(equalToConstant: 56),
            goButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        dimOverlayView = dimView
        resultCardView = card

        UIView.animate(withDuration: 0.20) { dimView.alpha = 1 }

        UIView.animate(
            withDuration: 0.36,
            delay: 0.02,
            usingSpringWithDamping: 0.78,
            initialSpringVelocity: 0.9,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        }

        UIView.animate(
            withDuration: 0.42,
            delay: 0.18,
            usingSpringWithDamping: 0.56,
            initialSpringVelocity: 0.95,
            options: [.curveEaseOut]
        ) {
            emojiLabel.transform = .identity
        }

        launchConfetti()
    }

    // MARK: - Confetti

    private func launchConfetti() {
        confettiLayer?.removeFromSuperlayer()

        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: view.bounds.midX, y: -12)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: view.bounds.width, height: 2)

        let colors: [UIColor] = [
            engPurple,
            UIColor(red: 0.70, green: 0.30, blue: 1.00, alpha: 1),
            UIColor.systemYellow,
            UIColor(red: 0.55, green: 0.25, blue: 0.90, alpha: 1),
            UIColor.white
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
