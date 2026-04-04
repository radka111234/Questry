import UIKit

final class HisInteractiveViewController: UIViewController {

    // MARK: - Public Configuration

    var topicId: Int = 1
    var questNumber: Int = 2   // 2 = first practice (questions 0-4), 4 = second practice (questions 5-9)

    // MARK: - UserDefaults Keys

    private let practiceUnlockedKey  = "his_practice_unlocked_quest"
    private let practiceCompletedKey = "his_practice_completed_quests"
    private let worldXPKey           = "his_world_total_xp"

    // MARK: - Question State

    private var questions: [MathExamQuestion] = []
    private var currentIndex = 0
    private var correctCount = 0
    private var answeredCount = 0

    // MARK: - Theme (amber/brown)

    private let amberBrown   = UIColor(red: 0.40, green: 0.22, blue: 0.04, alpha: 1.0)
    private let deepBrown    = UIColor(red: 0.12, green: 0.06, blue: 0.02, alpha: 1.0)
    private let correctGreen = UIColor(red: 0.20, green: 0.80, blue: 0.40, alpha: 1.0)
    private let wrongRed     = UIColor(red: 0.90, green: 0.30, blue: 0.30, alpha: 1.0)

    // MARK: - Game Chrome
    private var streak        = 0
    private let confettiLayer = CAEmitterLayer()
    private var feedbackPanel = UIView()
    private var panelMascot   = UILabel()
    private var panelTitle    = UILabel()
    private var panelHint     = UILabel()
    private var streakPill    = UIView()
    private var streakPillLbl = UILabel()
    private let kahootColors: [UIColor] = [
        UIColor(red:0.87,green:0.13,blue:0.21,alpha:1),
        UIColor(red:0.09,green:0.39,blue:0.88,alpha:1),
        UIColor(red:0.88,green:0.60,blue:0.04,alpha:1),
        UIColor(red:0.10,green:0.65,blue:0.30,alpha:1),
        UIColor(red:0.55,green:0.12,blue:0.88,alpha:1)
    ]
    private let mascotYay  = "🎉"
    private let mascotOops = "😬"
    private let correctMessages = ["History master! 📜","You know your history! ⚔️","Incredible memory! 🏛️","Magnificent! 👑"]

    // MARK: - UI Elements

    private let backButton       = UIButton(type: .system)
    private let headerTitleLabel = UILabel()
    private let questSubtitle    = UILabel()
    private let progressView     = UIProgressView()
    private let questionNumLabel = UILabel()
    private let questionCard     = UIView()
    private let historyLabel     = UILabel()
    private let questionLabel    = UILabel()
    private var answerButtons: [UIButton] = []
    private let xpHintLabel      = UILabel()
    private let feedbackLabel = UILabel()
    private let buttonStack = UIStackView()

    // Completion overlay
    private var dimOverlayView: UIView?
    private var completionCard: UIView?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        questions = HistoryGameData.practiceQuestions(for: topicId, questNumber: questNumber)
        setupGradient()
        setupUI()
        loadQuestion(at: 0)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.sublayers?.first { $0 is CAGradientLayer }?.frame = view.bounds
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10)
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
    }

    // MARK: - Gradient

    private func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [amberBrown.cgColor, deepBrown.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint   = CGPoint(x: 0.5, y: 1)
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }

    // MARK: - UI Setup

    private func setupUI() {
        setupBackButton()
        setupHeader()
        setupProgressArea()
        setupQuestionCard()
        setupAnswerButtons()
        setupXPHint()
        buildGameChrome()
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

        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    private func setupHeader() {
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.text = "🏛️ History Quest"
        headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerTitleLabel.textColor = .white
        headerTitleLabel.textAlignment = .center

        questSubtitle.translatesAutoresizingMaskIntoConstraints = false
        questSubtitle.text = "Quest \(questNumber) · Topic \(topicId)"
        questSubtitle.font = UIFont.systemFont(ofSize: 13)
        questSubtitle.textColor = UIColor.white.withAlphaComponent(0.70)
        questSubtitle.textAlignment = .center

        view.addSubview(headerTitleLabel)
        view.addSubview(questSubtitle)

        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            headerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),

            questSubtitle.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 2),
            questSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            questSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func setupProgressArea() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = UIColor.white.withAlphaComponent(0.85)
        progressView.trackTintColor = UIColor.white.withAlphaComponent(0.25)
        progressView.layer.cornerRadius = 3
        progressView.clipsToBounds = true
        progressView.progress = 0

        questionNumLabel.translatesAutoresizingMaskIntoConstraints = false
        questionNumLabel.text = "Question 1 of 5"
        questionNumLabel.font = UIFont.systemFont(ofSize: 13)
        questionNumLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        questionNumLabel.textAlignment = .left

        view.addSubview(progressView)
        view.addSubview(questionNumLabel)

        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: questSubtitle.bottomAnchor, constant: 14),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            progressView.heightAnchor.constraint(equalToConstant: 6),

            questionNumLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 5),
            questionNumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }

    private func setupQuestionCard() {
        questionCard.translatesAutoresizingMaskIntoConstraints = false
        questionCard.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        questionCard.layer.cornerRadius = 22
        questionCard.clipsToBounds = true

        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.text = "🏛️"
        historyLabel.font = UIFont.systemFont(ofSize: 24)
        historyLabel.textAlignment = .left

        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.boldSystemFont(ofSize: 17)
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 0

        questionCard.addSubview(historyLabel)
        questionCard.addSubview(questionLabel)
        view.addSubview(questionCard)

        NSLayoutConstraint.activate([
            questionCard.topAnchor.constraint(equalTo: questionNumLabel.bottomAnchor, constant: 12),
            questionCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            historyLabel.topAnchor.constraint(equalTo: questionCard.topAnchor, constant: 16),
            historyLabel.leadingAnchor.constraint(equalTo: questionCard.leadingAnchor, constant: 18),

            questionLabel.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: questionCard.leadingAnchor, constant: 18),
            questionLabel.trailingAnchor.constraint(equalTo: questionCard.trailingAnchor, constant: -18),
            questionLabel.bottomAnchor.constraint(equalTo: questionCard.bottomAnchor, constant: -18)
        ])
    }

    private func setupAnswerButtons() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10

        for i in 0..<5 {
            let btn = UIButton(type: .system)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.tag = i
            btn.backgroundColor = UIColor.white.withAlphaComponent(0.22)
            btn.layer.cornerRadius = 16
            btn.clipsToBounds = true
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            btn.titleLabel?.numberOfLines = 0
            btn.titleLabel?.textAlignment = .center
            btn.contentEdgeInsets = UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
            btn.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
            buttonStack.addArrangedSubview(btn)
            answerButtons.append(btn)
        }

        view.addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: questionCard.bottomAnchor, constant: 14),
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -86)
        ])
    }

    private func setupXPHint() {
        feedbackLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        feedbackLabel.textAlignment = .center
        feedbackLabel.numberOfLines = 0
        feedbackLabel.isHidden = true

        xpHintLabel.translatesAutoresizingMaskIntoConstraints = false
        xpHintLabel.text = "⭐ +5 XP per correct answer"
        xpHintLabel.font = UIFont.systemFont(ofSize: 12)
        xpHintLabel.textColor = UIColor.white.withAlphaComponent(0.50)
        xpHintLabel.textAlignment = .center

        view.addSubview(feedbackLabel)
        view.addSubview(xpHintLabel)

        NSLayoutConstraint.activate([
            feedbackLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 10),
            feedbackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            feedbackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            xpHintLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -56),
            xpHintLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            xpHintLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    // MARK: - Load Question

    private func loadQuestion(at index: Int) {
        guard index < questions.count else {
            finishQuest()
            return
        }

        currentIndex = index
        let question = questions[index]

        let historyOptions = ["🏛️", "📜"]
        historyLabel.text = historyOptions[index % 2]
        questionLabel.text = question.prompt

        let total = questions.count
        questionNumLabel.text = "Question \(index + 1) of \(total)"
        progressView.setProgress(Float(index) / Float(total), animated: true)
        for (i, btn) in answerButtons.enumerated() {
            if i < question.options.count {
                btn.setTitle(question.options[i], for: .normal)
                btn.isHidden = false
            } else {
                btn.isHidden = true
            }
            btn.isEnabled = true
            btn.backgroundColor = i < kahootColors.count ? kahootColors[i] : UIColor.white.withAlphaComponent(0.22)
            btn.setTitleColor(.white, for: .normal)
            btn.alpha = 1; btn.transform = .identity
        }
        for (i, btn) in answerButtons.enumerated() where !btn.isHidden {
            btn.alpha = 0; btn.transform = CGAffineTransform(translationX:0,y:30)
            UIView.animate(withDuration:0.36,delay:Double(i)*0.07,usingSpringWithDamping:0.72,initialSpringVelocity:0.5,options:[]) {
                btn.alpha = 1; btn.transform = .identity
            }
        }
    }

    // MARK: - Actions

    @objc private func answerTapped(_ sender: UIButton) {
        let tappedIndex = sender.tag
        guard currentIndex < questions.count else { return }
        answerButtons.forEach { $0.isEnabled = false }
        let question   = questions[currentIndex]
        let correctIdx = question.correctIndex ?? 0
        let isCorrect  = tappedIndex == correctIdx
        let correctAnswerText = correctIdx < question.options.count ? question.options[correctIdx] : nil
        for (i, btn) in answerButtons.enumerated() {
            guard !btn.isHidden else { continue }
            if i == correctIdx {
                UIView.animate(withDuration:0.22) { btn.backgroundColor = UIColor(red:0.09,green:0.62,blue:0.26,alpha:1) }
            } else if i == tappedIndex && !isCorrect {
                UIView.animate(withDuration:0.22) { btn.backgroundColor = UIColor(red:0.72,green:0.09,blue:0.12,alpha:1) }
                let shake = CAKeyframeAnimation(keyPath:"transform.translation.x")
                shake.values=[0,-8,8,-6,6,-3,3,0]; shake.keyTimes=[0,0.1,0.25,0.4,0.55,0.7,0.85,1.0]; shake.duration=0.4
                btn.layer.add(shake, forKey:"shake")
            }
        }
        if isCorrect {
            correctCount += 1; DailyQuestManager.shared.recordCorrectAnswer()
            confettiLayer.birthRate = 1
            DispatchQueue.main.asyncAfter(deadline:.now()+0.6) { self.confettiLayer.birthRate = 0 }
            floatXP(from: view.convert(sender.center, from: sender.superview))
            UIView.animate(withDuration:0.15,animations:{ sender.transform=CGAffineTransform(scaleX:1.07,y:1.07) }) { _ in
                UIView.animate(withDuration:0.18) { sender.transform = .identity }
            }
        }
        answeredCount += 1
        updateStreak(isCorrect: isCorrect)
        showFeedbackPanel(isCorrect: isCorrect, correctAnswer: isCorrect ? nil : correctAnswerText)
        DispatchQueue.main.asyncAfter(deadline:.now()+(isCorrect ? 1.5 : 2.2)) { [weak self] in
            guard let self else { return }
            self.hideFeedbackPanel {
                let next = self.currentIndex + 1
                if next < self.questions.count { self.loadQuestion(at: next) } else { self.finishQuest() }
            }
        }
    }

    // MARK: - Game Chrome
    private func buildGameChrome() {
        streakPill.translatesAutoresizingMaskIntoConstraints = false
        streakPill.backgroundColor = UIColor(red:0.95,green:0.42,blue:0.02,alpha:1)
        streakPill.layer.cornerRadius = 12; streakPill.isHidden = true
        view.addSubview(streakPill)
        streakPillLbl.translatesAutoresizingMaskIntoConstraints = false
        streakPillLbl.font = UIFont.boldSystemFont(ofSize: 13); streakPillLbl.textColor = .white
        streakPill.addSubview(streakPillLbl)
        NSLayoutConstraint.activate([
            streakPill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            streakPill.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 5),
            streakPill.heightAnchor.constraint(equalToConstant: 24),
            streakPillLbl.centerXAnchor.constraint(equalTo: streakPill.centerXAnchor),
            streakPillLbl.centerYAnchor.constraint(equalTo: streakPill.centerYAnchor),
            streakPillLbl.leadingAnchor.constraint(equalTo: streakPill.leadingAnchor, constant: 10),
            streakPillLbl.trailingAnchor.constraint(equalTo: streakPill.trailingAnchor, constant: -10)
        ])
        let letters = ["A","B","C","D","E"]
        for (i, btn) in answerButtons.enumerated() {
            guard i < kahootColors.count else { continue }
            btn.backgroundColor = kahootColors[i]; btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17); btn.titleLabel?.textAlignment = .left
            btn.contentEdgeInsets = UIEdgeInsets(top:12,left:56,bottom:12,right:12)
            btn.layer.cornerRadius = 16; btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.25; btn.layer.shadowOffset = CGSize(width:0,height:4)
            btn.layer.shadowRadius = 6; btn.clipsToBounds = false
            let badge = UILabel()
            badge.tag=800+i; badge.text=letters[i]; badge.font=UIFont.boldSystemFont(ofSize:13)
            badge.textColor=UIColor.black.withAlphaComponent(0.80)
            badge.backgroundColor=UIColor.white.withAlphaComponent(0.88)
            badge.textAlignment = .center; badge.layer.cornerRadius=12; badge.clipsToBounds=true
            badge.translatesAutoresizingMaskIntoConstraints = false
            btn.addSubview(badge)
            NSLayoutConstraint.activate([
                badge.leadingAnchor.constraint(equalTo: btn.leadingAnchor, constant: 14),
                badge.centerYAnchor.constraint(equalTo: btn.centerYAnchor),
                badge.widthAnchor.constraint(equalToConstant: 24),
                badge.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
        feedbackPanel.translatesAutoresizingMaskIntoConstraints = false
        feedbackPanel.layer.cornerRadius = 28
        feedbackPanel.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        feedbackPanel.clipsToBounds=true; feedbackPanel.alpha=0
        feedbackPanel.transform = CGAffineTransform(translationX:0,y:260)
        view.addSubview(feedbackPanel)
        NSLayoutConstraint.activate([
            feedbackPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedbackPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedbackPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            feedbackPanel.heightAnchor.constraint(equalToConstant: 240)
        ])
        panelMascot.translatesAutoresizingMaskIntoConstraints = false
        panelMascot.font = UIFont.systemFont(ofSize: 44); panelMascot.textAlignment = .center
        feedbackPanel.addSubview(panelMascot)
        panelTitle.translatesAutoresizingMaskIntoConstraints = false
        panelTitle.font = UIFont.boldSystemFont(ofSize: 21); panelTitle.textColor = .white; panelTitle.numberOfLines=1
        feedbackPanel.addSubview(panelTitle)
        panelHint.translatesAutoresizingMaskIntoConstraints = false
        panelHint.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        panelHint.textColor = UIColor.white.withAlphaComponent(0.85); panelHint.numberOfLines=2
        feedbackPanel.addSubview(panelHint)
        NSLayoutConstraint.activate([
            panelMascot.leadingAnchor.constraint(equalTo: feedbackPanel.leadingAnchor, constant: 20),
            panelMascot.topAnchor.constraint(equalTo: feedbackPanel.topAnchor, constant: 20),
            panelMascot.widthAnchor.constraint(equalToConstant: 54),
            panelTitle.leadingAnchor.constraint(equalTo: panelMascot.trailingAnchor, constant: 14),
            panelTitle.trailingAnchor.constraint(equalTo: feedbackPanel.trailingAnchor, constant: -16),
            panelTitle.centerYAnchor.constraint(equalTo: panelMascot.centerYAnchor, constant: -12),
            panelHint.leadingAnchor.constraint(equalTo: panelTitle.leadingAnchor),
            panelHint.trailingAnchor.constraint(equalTo: panelTitle.trailingAnchor),
            panelHint.topAnchor.constraint(equalTo: panelTitle.bottomAnchor, constant: 4)
        ])
        confettiLayer.emitterShape = .line
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10); confettiLayer.birthRate = 0
        let cols: [UIColor] = [.systemYellow,.systemRed,.systemBlue,.systemGreen,.systemPurple,.white]
        confettiLayer.emitterCells = cols.map { col in
            let cell = CAEmitterCell()
            cell.birthRate=8; cell.lifetime=2.6; cell.velocity=260; cell.velocityRange=100
            cell.emissionLongitude = .pi; cell.emissionRange = .pi/4
            cell.spin=3.0; cell.spinRange=2; cell.scale=0.14; cell.scaleRange=0.08
            cell.color = col.cgColor
            cell.contents = UIImage(systemName:"star.fill")?.withTintColor(col,renderingMode:.alwaysOriginal).cgImage
            return cell
        }
        view.layer.addSublayer(confettiLayer)
    }
    private func showFeedbackPanel(isCorrect: Bool, correctAnswer: String?) {
        if isCorrect {
            feedbackPanel.backgroundColor = UIColor(red:0.09,green:0.62,blue:0.26,alpha:1)
            panelMascot.text = mascotYay
            panelTitle.text  = "✅  " + (correctMessages.randomElement() ?? "Correct!")
            panelHint.text   = streak >= 2 ? "🔥 \(streak) in a row! You're on fire!" : "Keep going! 💪"
        } else {
            feedbackPanel.backgroundColor = UIColor(red:0.72,green:0.09,blue:0.12,alpha:1)
            panelMascot.text = mascotOops
            panelTitle.text  = "❌  Almost there!"
            panelHint.text   = correctAnswer.map { "The correct answer was: \($0)" } ?? "Don't give up! 💪"
        }
        UIView.animate(withDuration:0.38,delay:0,usingSpringWithDamping:0.72,initialSpringVelocity:0.8,options:[]) {
            self.feedbackPanel.alpha=1; self.feedbackPanel.transform = .identity
        }
    }
    private func hideFeedbackPanel(completion: @escaping () -> Void) {
        UIView.animate(withDuration:0.24,delay:0,options:.curveEaseIn,animations:{
            self.feedbackPanel.alpha=0
            self.feedbackPanel.transform = CGAffineTransform(translationX:0,y:260)
        },completion:{ _ in completion() })
    }
    private func floatXP(from point: CGPoint) {
        let lbl = UILabel()
        lbl.text="+XP ⭐"; lbl.font=UIFont.boldSystemFont(ofSize: 22)
        lbl.textColor=UIColor(red:0.98,green:0.82,blue:0.10,alpha:1)
        lbl.sizeToFit(); lbl.center=point; view.addSubview(lbl)
        UIView.animate(withDuration:0.85,delay:0,options:.curveEaseOut,animations:{
            lbl.transform=CGAffineTransform(translationX:0,y:-80); lbl.alpha=0
        },completion:{ _ in lbl.removeFromSuperview() })
    }
    private func updateStreak(isCorrect: Bool) {
        streak = isCorrect ? streak+1 : 0
        if streak >= 2 {
            streakPill.isHidden=false; streakPillLbl.text="🔥 \(streak) streak"
            let pulse=CABasicAnimation(keyPath:"transform.scale")
            pulse.fromValue=1.0; pulse.toValue=1.18; pulse.autoreverses=true; pulse.duration=0.22
            streakPill.layer.add(pulse, forKey:"pulse")
        } else { streakPill.isHidden=true }
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Finish Quest

    private func finishQuest() {
        let xp = max(10, correctCount * 5)

        Session.shared.addXP(xp)

        let defaults = UserDefaults.standard
        let currentWorldXP = defaults.integer(forKey: worldXPKey)
        defaults.set(currentWorldXP + xp, forKey: worldXPKey)

        var completed = defaults.array(forKey: practiceCompletedKey) as? [Int] ?? []
        if !completed.contains(questNumber) {
            completed.append(questNumber)
            completed.sort()
        }
        defaults.set(completed, forKey: practiceCompletedKey)

        let currentUnlocked = max(defaults.integer(forKey: practiceUnlockedKey), 1)
        let next = max(currentUnlocked, questNumber + 1)
        defaults.set(min(next, 5), forKey: practiceUnlockedKey)

        DailyQuestManager.shared.recordGeoLesson()
        DailyQuestManager.shared.incrementTotalQuests()
        StreakManager.shared.recordPlay()

        showCompletionOverlay(xp: xp)
    }

    // MARK: - Completion Overlay

    private func showCompletionOverlay(xp: Int) {
        let dimView = UIView()
        dimView.translatesAutoresizingMaskIntoConstraints = false
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.85)
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
        card.backgroundColor = .white
        card.layer.cornerRadius = 28
        card.clipsToBounds = true
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.82, y: 0.82)
        view.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28)
        ])

        let emojiLbl = UILabel()
        emojiLbl.translatesAutoresizingMaskIntoConstraints = false
        emojiLbl.text = "🏛️"
        emojiLbl.font = UIFont.systemFont(ofSize: 56)
        emojiLbl.textAlignment = .center

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "Quest Complete!"
        titleLbl.font = UIFont.boldSystemFont(ofSize: 26)
        titleLbl.textColor = .black
        titleLbl.textAlignment = .center

        let scoreLbl = UILabel()
        scoreLbl.translatesAutoresizingMaskIntoConstraints = false
        scoreLbl.text = "\(correctCount) / 5 correct"
        scoreLbl.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        scoreLbl.textColor = UIColor.darkGray
        scoreLbl.textAlignment = .center

        let xpLbl = UILabel()
        xpLbl.translatesAutoresizingMaskIntoConstraints = false
        let displayXP = ShopEffects.hasXPBooster ? xp * 2 : xp
        xpLbl.text = ShopEffects.hasXPBooster ? "+\(displayXP) XP ⚡2x!" : "+\(displayXP) XP earned! ⭐"
        xpLbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        xpLbl.textColor = amberBrown
        xpLbl.textAlignment = .center

        let backBtn = UIButton(type: .system)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("Back to Map", for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backBtn.backgroundColor = amberBrown
        backBtn.layer.cornerRadius = 22
        backBtn.clipsToBounds = true

        backBtn.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let hisVC = self.navigationController?.viewControllers.first(where: { $0 is HistoryViewController }) {
                self.navigationController?.popToViewController(hisVC, animated: true)
            } else {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }, for: .touchUpInside)

        card.addSubview(emojiLbl)
        card.addSubview(titleLbl)
        card.addSubview(scoreLbl)
        card.addSubview(xpLbl)
        card.addSubview(backBtn)

        NSLayoutConstraint.activate([
            emojiLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),
            emojiLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLbl.topAnchor.constraint(equalTo: emojiLbl.bottomAnchor, constant: 12),
            titleLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            scoreLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            scoreLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            scoreLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            xpLbl.topAnchor.constraint(equalTo: scoreLbl.bottomAnchor, constant: 8),
            xpLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            xpLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            backBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 24),
            backBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            backBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            backBtn.heightAnchor.constraint(equalToConstant: 54),
            backBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        dimOverlayView = dimView
        completionCard = card

        UIView.animate(withDuration: 0.22) { dimView.alpha = 1 }

        UIView.animate(
            withDuration: 0.36,
            delay: 0.04,
            usingSpringWithDamping: 0.76,
            initialSpringVelocity: 0.9,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        }
    }
}
