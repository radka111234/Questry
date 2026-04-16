import UIKit

final class ExamQuestViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!

    @IBOutlet weak var examTitleLabel: UILabel!
    @IBOutlet weak var examProgressView: UIProgressView!
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

    var subject: String = "Math"
    var topicId: Int = 1
    var mapQuestNumber: Int = 5

    /// Set to true when used for practice quests 1–4 on topics 13+
    var isPracticeMode: Bool = false
    /// Which practice quest number (1–4) this is
    var practiceQuestNumber: Int = 1

    private let backButton = UIButton(type: .system)

    private let questYellow         = UIColor(red: 243/255, green: 234/255, blue: 72/255,  alpha: 1.0)
    private let questBlue           = UIColor(red: 25/255,  green: 157/255, blue: 222/255, alpha: 1.0)
    private let questSelectedPurple = UIColor(red: 72/255,  green: 18/255,  blue: 148/255, alpha: 1.0)

    private var worldXPKey: String {
        subject == "English" ? "eng_world_total_xp" :
        subject == "Geography" ? "geo_world_total_xp" :
        subject == "Science" ? "sci_world_total_xp" :
        subject == "History" ? "his_world_total_xp" : "math_world_total_xp"
    }
    private var currentTopicKey: String {
        subject == "English" ? "eng_current_topic" :
        subject == "Geography" ? "geo_current_topic" :
        subject == "Science" ? "sci_current_topic" :
        subject == "History" ? "his_current_topic" : "math_current_topic"
    }
    private var practiceUnlockedKey: String {
        subject == "English" ? "eng_practice_unlocked_quest" :
        subject == "Geography" ? "geo_practice_unlocked_quest" :
        subject == "Science" ? "sci_practice_unlocked_quest" :
        subject == "History" ? "his_practice_unlocked_quest" : "math_practice_unlocked_quest"
    }
    private var practiceCompletedKey: String {
        subject == "English" ? "eng_practice_completed_quests" :
        subject == "Geography" ? "geo_practice_completed_quests" :
        subject == "Science" ? "sci_practice_completed_quests" :
        subject == "History" ? "his_practice_completed_quests" : "math_practice_completed_quests"
    }
    private var completedTopicsKey: String {
        subject == "English" ? "eng_completed_topic_ids" :
        subject == "Geography" ? "geo_completed_topic_ids" :
        subject == "Science" ? "sci_completed_topic_ids" :
        subject == "History" ? "his_completed_topic_ids" : "math_completed_topic_ids"
    }

    private var questionPool: [MathExamQuestion] = []
    private var questions: [MathExamQuestion] = []
    private var currentQuestionIndex = 0
    private var selectedAnswerIndex: Int?
    private var correctAnswers = 0
    private var rewardXP = 0

    private var optionButtons: [UIButton] {
        [optionButton1, optionButton2, optionButton3, optionButton4, optionButton5]
    }

    private var dimOverlayView: UIView?
    private var resultCardView: UIView?

    // Game chrome
    private var streak           = 0
    private let gradientLayer    = CAGradientLayer()
    private var feedbackPanel    = UIView()
    private var panelMascot      = UILabel()
    private var panelTitle       = UILabel()
    private var panelHint        = UILabel()
    private var streakPill       = UIView()
    private var streakPillLbl    = UILabel()
    private var confettiLayer    = CAEmitterLayer()

    private let kahootColors: [UIColor] = [
        UIColor(red: 0.87, green: 0.13, blue: 0.21, alpha: 1),  // A red
        UIColor(red: 0.09, green: 0.39, blue: 0.88, alpha: 1),  // B blue
        UIColor(red: 0.88, green: 0.60, blue: 0.04, alpha: 1),  // C amber
        UIColor(red: 0.10, green: 0.65, blue: 0.30, alpha: 1),  // D green
        UIColor(red: 0.55, green: 0.12, blue: 0.88, alpha: 1)   // E purple
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        if subject == "Geography" {
            if isPracticeMode {
                questions = GeographyGameData.practiceQuestions(for: topicId, questNumber: practiceQuestNumber)
            } else {
                questions = GeographyGameData.examQuestions(for: topicId)
            }
        } else if subject == "English" {
            let teachLang = LanguageManager.shared.englishTeachingLanguage
            if teachLang != .english {
                if isPracticeMode {
                    questions = EnglishTeachingData.practiceQuestions(topicId: topicId, questNumber: practiceQuestNumber, language: teachLang)
                } else {
                    questions = EnglishTeachingData.examQuestions(topicId: topicId, language: teachLang)
                }
            } else {
                if isPracticeMode {
                    questions = EnglishGameData.practiceQuestions(for: topicId, questNumber: practiceQuestNumber)
                } else {
                    questions = EnglishGameData.examQuestions(for: topicId)
                }
            }
        } else if subject == "Science" {
            if isPracticeMode {
                questions = ScienceGameData.practiceQuestions(for: topicId, questNumber: practiceQuestNumber)
            } else {
                questions = ScienceGameData.examQuestions(for: topicId)
            }
        } else if subject == "History" {
            if isPracticeMode {
                questions = HistoryGameData.practiceQuestions(for: topicId, questNumber: practiceQuestNumber)
            } else {
                questions = HistoryGameData.examQuestions(for: topicId)
            }
        } else {
            if isPracticeMode {
                // Quest 4 for topics 1-12: use dedicated equation-format questions if available
                if practiceQuestNumber == 4 {
                    let eqQ = MathGameData.quest4EquationQuestions(for: topicId)
                    if !eqQ.isEmpty {
                        questions = eqQ.shuffled()
                    } else {
                        // Topics 13+: use the standard MCQ practice pool
                        let mcqQ = MathGameData.mcqPracticeQuestions(for: topicId, questNumber: practiceQuestNumber)
                        questions = mcqQ.isEmpty
                            ? Array(MathGameData.examQuestions(for: topicId).shuffled().prefix(5))
                            : mcqQ
                    }
                } else {
                    let mcqQ = MathGameData.mcqPracticeQuestions(for: topicId, questNumber: practiceQuestNumber)
                    questions = mcqQ.isEmpty
                        ? Array(MathGameData.examQuestions(for: topicId).shuffled().prefix(5))
                        : mcqQ
                }
            } else {
                questions = MathGameData.examQuestions(for: topicId)
            }
        }

        // Safety net: practice quests must always have at least 5 questions.
        // Pad from the exam pool when the practice bank runs short.
        let minQuestions = 5
        if isPracticeMode && questions.count < minQuestions {
            let examPool: [MathExamQuestion]
            switch subject {
            case "Geography": examPool = GeographyGameData.examQuestions(for: topicId)
            case "English":
                let teachLang = LanguageManager.shared.englishTeachingLanguage
                examPool = teachLang != .english
                    ? EnglishTeachingData.examQuestions(topicId: topicId, language: teachLang)
                    : EnglishGameData.examQuestions(for: topicId)
            case "Science":   examPool = ScienceGameData.examQuestions(for: topicId)
            case "History":   examPool = HistoryGameData.examQuestions(for: topicId)
            default:          examPool = MathGameData.examQuestions(for: topicId)
            }
            let existing = Set(questions.map { $0.id })
            let extras = examPool.filter { !existing.contains($0.id) }.shuffled()
            let needed  = minQuestions - questions.count
            questions += Array(extras.prefix(needed))
        }

        // Store full pool, then deal a fresh shuffled hand
        if !isPracticeMode {
            questionPool = questions
            questions = Array(questionPool.shuffled().prefix(MathGameData.examQuestionCount))
        }

        styleUI()
        refreshHeader()
        loadCurrentQuestion()
        setupBackButton()
        buildGameChrome()

        // XP taps open the Rewards Shop
        [xpLabel, xpProgressView].forEach { view in
            view?.isUserInteractionEnabled = true
            view?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(didTapXPArea))
            )
        }
    }

    @objc private func didTapXPArea() {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RewardsShopViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        gradientLayer.frame = view.bounds
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10)
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
        layoutOptionButtons()
    }

    /// Lay out the visible option buttons as full-width tiles between the
    /// question card and the bottom safe area.  Called from viewDidLayoutSubviews
    /// and after toggling button visibility in loadCurrentQuestion().
    private func layoutOptionButtons() {
        let sideMargin: CGFloat = 16
        let spacing: CGFloat    = 10
        let topGap: CGFloat     = 14   // gap below question card
        let bottomGap: CGFloat  = 20   // gap above safe-area bottom

        // Use the question card's actual position if it has been laid out,
        // otherwise fall back to the storyboard value (405 pt).
        let cardBottom: CGFloat
        if questionCardView.frame.height > 0 {
            cardBottom = questionCardView.frame.maxY
        } else {
            cardBottom = 405
        }

        let startY  = cardBottom + topGap
        let endY    = view.bounds.height - view.safeAreaInsets.bottom - bottomGap
        let available = endY - startY

        let visible = optionButtons.filter { !$0.isHidden }
        guard !visible.isEmpty, available > 50 else { return }

        let totalSpacing = spacing * CGFloat(visible.count - 1)
        let btnH = max(56, (available - totalSpacing) / CGFloat(visible.count))
        let btnW = view.bounds.width - sideMargin * 2

        var y = startY
        for btn in visible {
            btn.frame = CGRect(x: sideMargin, y: y, width: btnW, height: btnH)
            // Centre the letter badge vertically within the new button height
            let badgeIdx = optionButtons.firstIndex(of: btn) ?? 0
            if let badge = btn.viewWithTag(800 + badgeIdx) {
                badge.frame = CGRect(x: 16, y: (btnH - 28) / 2, width: 28, height: 28)
            }
            y += btnH + spacing
        }
    }

    private var subjectGradient: (top: UIColor, bot: UIColor) {
        switch subject {
        case "Science":   return (UIColor(red:0.04,green:0.30,blue:0.14,alpha:1), UIColor(red:0.01,green:0.12,blue:0.06,alpha:1))
        case "English":   return (UIColor(red:0.28,green:0.06,blue:0.55,alpha:1), UIColor(red:0.12,green:0.02,blue:0.28,alpha:1))
        case "Geography": return (UIColor(red:0.05,green:0.32,blue:0.55,alpha:1), UIColor(red:0.02,green:0.14,blue:0.28,alpha:1))
        case "History":   return (UIColor(red:0.42,green:0.20,blue:0.06,alpha:1), UIColor(red:0.20,green:0.09,blue:0.02,alpha:1))
        default:          return (UIColor(red:0.08,green:0.18,blue:0.55,alpha:1), UIColor(red:0.03,green:0.07,blue:0.28,alpha:1))
        }
    }
    private var subjectMascot: (idle: String, yay: String, oops: String) {
        switch subject {
        case "Science":   return ("🔬","🥳","😅")
        case "English":   return ("📚","🎉","😬")
        case "Geography": return ("🌍","🥳","😅")
        case "History":   return ("👑","🎉","😬")
        default:          return ("🤖","🥳","😬")
        }
    }
    private var correctMessages: [String] {
        switch subject {
        case "Science":   return ["Brilliant scientist! 🧪","You really know your science! ⚡","Amazing! Keep it up! 🌿"]
        case "English":   return ["Excellent! You're a word wizard! 📖","Superb vocabulary! 🏆","Brilliant English! ✨"]
        case "Geography": return ["You know your world! 🗺️","Amazing geographer! 🧭","Spot on! 🌏"]
        case "History":   return ["History master! 👑","You know your history! 📜","Incredible memory! ⚔️"]
        default:          return ["Math genius! 🤖","Perfect calculation! ✨","You're on fire! 🔥"]
        }
    }

    private func buildGameChrome() {
        // ── Gradient background ─────────────────────────────────────────
        let g = subjectGradient
        gradientLayer.colors = [g.top.cgColor, g.bot.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.75, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)

        // ── Floating decorative emojis ──────────────────────────────────
        let decos: [(String, CGFloat, CGFloat)] = [("✨",0.88,0.10),("⭐",0.07,0.28),("💫",0.90,0.55),("✨",0.06,0.72),("⭐",0.82,0.84)]
        for (e, rx, ry) in decos {
            let lbl = UILabel()
            lbl.text = e; lbl.font = .systemFont(ofSize: 22); lbl.alpha = 0.14
            lbl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(lbl)
            NSLayoutConstraint.activate([
                lbl.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * rx),
                lbl.centerYAnchor.constraint(equalTo: view.topAnchor,     constant: view.bounds.height * ry)
            ])
            let anim = CABasicAnimation(keyPath: "transform.translation.y")
            anim.fromValue = -5; anim.toValue = 5; anim.autoreverses = true
            anim.repeatCount = .infinity; anim.duration = Double.random(in: 2.0...3.5)
            anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            lbl.layer.add(anim, forKey: "float")
        }

        // ── Streak pill (just below progress bar area) ──────────────────
        streakPill.translatesAutoresizingMaskIntoConstraints = false
        streakPill.backgroundColor = UIColor(red:0.95,green:0.42,blue:0.02,alpha:1)
        streakPill.layer.cornerRadius = 12
        streakPill.isHidden = true
        view.addSubview(streakPill)

        streakPillLbl.translatesAutoresizingMaskIntoConstraints = false
        streakPillLbl.font = UIFont.boldSystemFont(ofSize: 13)
        streakPillLbl.textColor = .white
        streakPill.addSubview(streakPillLbl)

        NSLayoutConstraint.activate([
            streakPill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            streakPill.topAnchor.constraint(equalTo: examProgressView.bottomAnchor, constant: 8),
            streakPill.heightAnchor.constraint(equalToConstant: 24),
            streakPillLbl.centerXAnchor.constraint(equalTo: streakPill.centerXAnchor),
            streakPillLbl.centerYAnchor.constraint(equalTo: streakPill.centerYAnchor),
            streakPillLbl.leadingAnchor.constraint(equalTo: streakPill.leadingAnchor, constant: 10),
            streakPillLbl.trailingAnchor.constraint(equalTo: streakPill.trailingAnchor, constant: -10)
        ])

        // ── Kahoot-style option buttons — styled in place, laid out in viewDidLayoutSubviews ──
        // (The storyboard uses fixed-frame layout with no Auto Layout constraints,
        //  so we keep the buttons in their original superview and set proper frames
        //  once the view has its final size.)
        let letters = ["A","B","C","D","E"]

        for (i, btn) in optionButtons.enumerated() {
            guard i < kahootColors.count else { continue }

            // Must use translatesAutoresizingMaskIntoConstraints = true for frame-based layout
            btn.translatesAutoresizingMaskIntoConstraints = true

            if var cfg = btn.configuration {
                cfg.baseBackgroundColor = kahootColors[i]
                cfg.baseForegroundColor = .white
                cfg.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 58, bottom: 16, trailing: 16)
                cfg.titleAlignment = .leading
                cfg.titleLineBreakMode = .byWordWrapping
                cfg.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { attrs in
                    var a = attrs; a.font = UIFont.boldSystemFont(ofSize: 15); return a
                }
                btn.configuration = cfg
            } else {
                btn.tintColor = kahootColors[i]
                btn.setTitleColor(.white, for: .normal)
            }
            btn.titleLabel?.numberOfLines = 0
            btn.titleLabel?.lineBreakMode = .byWordWrapping
            btn.layer.cornerRadius = 18
            btn.layer.shadowColor   = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.28
            btn.layer.shadowOffset  = CGSize(width: 0, height: 4)
            btn.layer.shadowRadius  = 6
            btn.clipsToBounds = false

            // Letter badge pinned inside button on the left
            if btn.viewWithTag(800 + i) == nil {        // avoid duplicates on rebuild
                let badge = UILabel()
                badge.tag = 800 + i
                badge.text = letters[i]
                badge.font = UIFont.boldSystemFont(ofSize: 15)
                badge.textColor = UIColor.black.withAlphaComponent(0.85)
                badge.backgroundColor = UIColor.white.withAlphaComponent(0.85)
                badge.textAlignment = .center
                badge.layer.cornerRadius = 14
                badge.clipsToBounds = true
                badge.frame = CGRect(x: 16, y: 0, width: 28, height: 28)   // y set in layoutOptionButtons
                btn.addSubview(badge)
            }
        }

        // ── Feedback panel (slides up from bottom after tapping) ────────
        feedbackPanel.translatesAutoresizingMaskIntoConstraints = false
        feedbackPanel.layer.cornerRadius = 28
        feedbackPanel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        feedbackPanel.clipsToBounds = true
        feedbackPanel.alpha = 0
        feedbackPanel.transform = CGAffineTransform(translationX: 0, y: 260)
        view.addSubview(feedbackPanel)
        NSLayoutConstraint.activate([
            feedbackPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedbackPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedbackPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            feedbackPanel.heightAnchor.constraint(equalToConstant: 240)
        ])

        panelMascot.translatesAutoresizingMaskIntoConstraints = false
        panelMascot.font = UIFont.systemFont(ofSize: 46)
        panelMascot.textAlignment = .center
        feedbackPanel.addSubview(panelMascot)

        panelTitle.translatesAutoresizingMaskIntoConstraints = false
        panelTitle.font = UIFont.boldSystemFont(ofSize: 22)
        panelTitle.textColor = .white
        panelTitle.numberOfLines = 1
        feedbackPanel.addSubview(panelTitle)

        panelHint.translatesAutoresizingMaskIntoConstraints = false
        panelHint.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        panelHint.textColor = UIColor.white.withAlphaComponent(0.85)
        panelHint.numberOfLines = 2
        feedbackPanel.addSubview(panelHint)

        NSLayoutConstraint.activate([
            panelMascot.leadingAnchor.constraint(equalTo: feedbackPanel.leadingAnchor, constant: 20),
            panelMascot.topAnchor.constraint(equalTo: feedbackPanel.topAnchor, constant: 22),
            panelMascot.widthAnchor.constraint(equalToConstant: 56),

            panelTitle.leadingAnchor.constraint(equalTo: panelMascot.trailingAnchor, constant: 14),
            panelTitle.trailingAnchor.constraint(equalTo: feedbackPanel.trailingAnchor, constant: -16),
            panelTitle.centerYAnchor.constraint(equalTo: panelMascot.centerYAnchor, constant: -14),

            panelHint.leadingAnchor.constraint(equalTo: panelTitle.leadingAnchor),
            panelHint.trailingAnchor.constraint(equalTo: panelTitle.trailingAnchor),
            panelHint.topAnchor.constraint(equalTo: panelTitle.bottomAnchor, constant: 4)
        ])

        // ── Confetti emitter ─────────────────────────────────────────────
        confettiLayer.emitterShape  = .line
        confettiLayer.emitterSize   = CGSize(width: view.bounds.width, height: 1)
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: -10)
        confettiLayer.birthRate     = 0
        let colors: [UIColor] = [.systemYellow, .systemRed, .systemBlue, .systemGreen, .systemPurple, .white]
        confettiLayer.emitterCells = colors.map { col in
            let cell = CAEmitterCell()
            cell.birthRate  = 8
            cell.lifetime   = 2.8
            cell.velocity   = 280
            cell.velocityRange = 120
            cell.emissionLongitude = .pi
            cell.emissionRange     = .pi / 4
            cell.spin = 3.5; cell.spinRange = 2
            cell.scale = 0.18; cell.scaleRange = 0.10
            cell.color = col.cgColor
            cell.contents = UIImage(systemName: "star.fill")?.withTintColor(col, renderingMode: .alwaysOriginal).cgImage
            return cell
        }
        view.layer.addSublayer(confettiLayer)

        // ── Hide the Next button (auto-advanced by optionTapped) ─────────
        nextButton.isHidden = true
    }

    private func styleUI() {
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        usernameLabel.textColor = .white
        levelLabel.textColor = UIColor.white.withAlphaComponent(0.85)
        xpLabel.textColor = .white

        xpProgressView.progressTintColor = questYellow
        xpProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.35)
        xpProgressView.layer.cornerRadius = 4
        xpProgressView.clipsToBounds = true

        examTitleLabel.textColor = .white
        examTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        examTitleLabel.adjustsFontSizeToFitWidth = true
        examTitleLabel.minimumScaleFactor = 0.7
        examTitleLabel.numberOfLines = 1

        examProgressView.progressTintColor = questBlue
        examProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.35)
        examProgressView.layer.cornerRadius = 4
        examProgressView.clipsToBounds = true

        questionInfoLabel.textColor = UIColor.white.withAlphaComponent(0.85)
        questionPercentLabel.textColor = UIColor.white.withAlphaComponent(0.85)

        questionCardView.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        questionCardView.layer.cornerRadius = 24
        questionCardView.clipsToBounds = true
        // Let the card grow if the question text is long
        let minCardHeight = questionCardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 140)
        minCardHeight.priority = .defaultHigh
        minCardHeight.isActive = true

        questionCountLabel.isHidden = true
        questionCountLabel.textColor = UIColor.white.withAlphaComponent(0.72)
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont.boldSystemFont(ofSize: 15)

        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.backgroundColor = questYellow
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.alpha = 0.55
        nextButton.isEnabled = false
    }

    private func setupBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        let shownXP = Session.shared.currentUser?.xp ?? 0

        usernameLabel.text = Session.shared.currentUser?.username ?? "radka"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        xpLabel.text = "\(shownXP) XP"
        xpProgressView.progress = min(Float(shownXP % 500) / 500.0, 1.0)
    }

    private func loadCurrentQuestion() {
        guard !questions.isEmpty else {
            showOverlay(
                title: "No Exam Yet",
                emoji: "📝",
                message: "This topic does not have exam questions yet.",
                subMessage: "Add exam questions in MathGameData.",
                buttonTitle: "Back"
            ) { [weak self] in
                self?.removeOverlay()
                self?.navigationController?.popViewController(animated: true)
            }
            return
        }

        guard currentQuestionIndex < questions.count else {
            finishExam()
            return
        }

        let question = questions[currentQuestionIndex]
        selectedAnswerIndex = nil

        let topicTitle: String?
        if subject == "Geography" {
            topicTitle = GeographyGameData.topic(for: topicId)?.nodeTitle
        } else if subject == "English" {
            let teachLang = LanguageManager.shared.englishTeachingLanguage
            if teachLang != .english {
                topicTitle = EnglishTeachingData.topics(for: teachLang).first(where: { $0.id == topicId })?.title
            } else {
                topicTitle = EnglishGameData.topic(for: topicId)?.nodeTitle
            }
        } else if subject == "Science" {
            topicTitle = ScienceGameData.topic(for: topicId)?.nodeTitle
        } else if subject == "History" {
            topicTitle = HistoryGameData.topic(for: topicId)?.nodeTitle
        } else {
            topicTitle = MathGameData.topic(for: topicId)?.nodeTitle
        }
        if let title = topicTitle {
            examTitleLabel.text = isPracticeMode
                ? "\(title) – Quest \(practiceQuestNumber)"
                : "\(title) Exam"
        } else {
            examTitleLabel.text = isPracticeMode ? "Practice" : "Exam"
        }

        questionCountLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
        questionLabel.text = question.prompt
        questionInfoLabel.text = "Exam • Question \(currentQuestionIndex + 1) of \(questions.count)"

        let progressPercent = Int((Float(currentQuestionIndex) / Float(questions.count)) * 100)
        questionPercentLabel.text = "\(progressPercent)%"
        examProgressView.progress = Float(currentQuestionIndex) / Float(questions.count)

        for (index, button) in optionButtons.enumerated() {
            button.isHidden = index >= question.options.count
            if index < question.options.count {
                button.setTitle(question.options[index], for: .normal)
            }
            styleOptionButton(button, isSelected: false)
        }

        // Recalculate frames now that hidden states are set
        layoutOptionButtons()

        // Stagger buttons in with a bounce
        for (i, btn) in optionButtons.enumerated() where !btn.isHidden {
            btn.transform = CGAffineTransform(translationX: 0, y: 40)
            btn.alpha = 0
            UIView.animate(withDuration: 0.38, delay: Double(i) * 0.07,
                           usingSpringWithDamping: 0.72, initialSpringVelocity: 0.5) {
                btn.transform = .identity
                btn.alpha = 1
            }
        }
        // Re-enable buttons and reset Kahoot colors
        optionButtons.forEach { btn in
            btn.isEnabled = true
            if let idx = optionButtons.firstIndex(of: btn), idx < kahootColors.count {
                if var cfg = btn.configuration {
                    cfg.baseBackgroundColor = kahootColors[idx]
                    btn.configuration = cfg
                } else {
                    btn.tintColor = kahootColors[idx]
                }
            }
        }
    }

    private func styleOptionButton(_ button: UIButton, isSelected: Bool) {
        // Colors are managed by buildGameChrome and optionTapped; this is a no-op now
        // (kept for backward compatibility with any remaining call sites)
    }

    @IBAction func optionTapped(_ sender: UIButton) {
        guard let index = optionButtons.firstIndex(of: sender) else { return }
        // Prevent double-tapping
        optionButtons.forEach { $0.isEnabled = false }
        selectedAnswerIndex = index

        let question = questions[currentQuestionIndex]
        let isCorrect: Bool
        var correctAnswerText: String? = nil

        if let correctIndex = question.correctIndex {
            isCorrect = (index == correctIndex)
            if !isCorrect, correctIndex < question.options.count {
                correctAnswerText = question.options[correctIndex]
            }
            // Highlight correct green + selected red
            let greenColor = UIColor(red:0.09,green:0.62,blue:0.26,alpha:1)
            let redColor   = UIColor(red:0.72,green:0.09,blue:0.12,alpha:1)
            for (i, btn) in optionButtons.enumerated() {
                guard !btn.isHidden else { continue }
                let targetColor: UIColor? = (i == correctIndex) ? greenColor : (i == index && !isCorrect) ? redColor : nil
                guard let color = targetColor else { continue }
                UIView.animate(withDuration: 0.22) {
                    if var cfg = btn.configuration {
                        cfg.baseBackgroundColor = color
                        if i == correctIndex { btn.layer.shadowColor = color.cgColor }
                        btn.configuration = cfg
                    } else {
                        btn.tintColor = color
                    }
                }
                if i == index && !isCorrect {
                    let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
                    shake.values   = [0,-8,8,-6,6,-3,3,0]
                    shake.keyTimes = [0,0.1,0.25,0.4,0.55,0.7,0.85,1.0]
                    shake.duration = 0.4
                    btn.layer.add(shake, forKey: "shake")
                }
            }
        } else {
            isCorrect = false
        }

        // Record the answer for exam counting (reuse the existing selectedAnswerIndex logic)
        if isCorrect {
            correctAnswers += 1
            DailyQuestManager.shared.recordCorrectAnswer()
            // Confetti burst
            confettiLayer.birthRate = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.confettiLayer.birthRate = 0
            }
            // XP float from tapped button
            let btnCenter = view.convert(sender.center, from: sender.superview)
            floatXPLabel(from: btnCenter)
            // Button scale celebrate
            UIView.animate(withDuration: 0.18, animations: { sender.transform = CGAffineTransform(scaleX: 1.06, y: 1.06) }) { _ in
                UIView.animate(withDuration: 0.22) { sender.transform = .identity }
            }
        }

        updateStreak(isCorrect: isCorrect)
        showFeedbackPanel(isCorrect: isCorrect, correctAnswer: correctAnswerText)

        let delay: Double = isCorrect ? 1.5 : 2.2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            self.hideFeedbackPanel {
                self.currentQuestionIndex += 1
                self.loadCurrentQuestion()
            }
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        // Auto-advanced by optionTapped — this action is kept for storyboard compatibility only
    }

    private func showFeedbackPanel(isCorrect: Bool, correctAnswer: String?) {
        let mascot = subjectMascot
        if isCorrect {
            feedbackPanel.backgroundColor = UIColor(red:0.09,green:0.62,blue:0.26,alpha:1)
            panelMascot.text = mascot.yay
            let msg = correctMessages.randomElement() ?? "Correct! 🎉"
            panelTitle.text  = "✅  " + msg
            panelHint.text   = streak >= 2 ? "🔥 \(streak) in a row! You're on fire!" : "Keep it going!"
        } else {
            feedbackPanel.backgroundColor = UIColor(red:0.72,green:0.09,blue:0.12,alpha:1)
            panelMascot.text = mascot.oops
            panelTitle.text  = "❌  Almost there!"
            if let ans = correctAnswer {
                panelHint.text = "The correct answer was: \(ans)"
            } else {
                panelHint.text = "Don't give up — you got this! 💪"
            }
        }

        UIView.animate(withDuration: 0.38, delay: 0,
                       usingSpringWithDamping: 0.72, initialSpringVelocity: 0.8) {
            self.feedbackPanel.alpha     = 1
            self.feedbackPanel.transform = .identity
        }
    }

    private func hideFeedbackPanel(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.26, delay: 0, options: .curveEaseIn) {
            self.feedbackPanel.alpha     = 0
            self.feedbackPanel.transform = CGAffineTransform(translationX: 0, y: 260)
        } completion: { _ in completion() }
    }

    private func floatXPLabel(from point: CGPoint) {
        let lbl = UILabel()
        lbl.text = "+XP ⭐"
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textColor = UIColor(red:0.98,green:0.82,blue:0.10,alpha:1)
        lbl.sizeToFit()
        lbl.center = point
        view.addSubview(lbl)
        UIView.animate(withDuration: 0.9, delay: 0, options: .curveEaseOut) {
            lbl.transform = CGAffineTransform(translationX: 0, y: -90)
            lbl.alpha = 0
        } completion: { _ in lbl.removeFromSuperview() }
    }

    private func updateStreak(isCorrect: Bool) {
        if isCorrect {
            streak += 1
        } else {
            streak = 0
        }
        if streak >= 2 {
            streakPill.isHidden = false
            streakPillLbl.text = "🔥 \(streak) streak"
            // Pulse the streak pill
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.0; pulse.toValue = 1.18
            pulse.autoreverses = true; pulse.duration = 0.22
            streakPill.layer.add(pulse, forKey: "pulse")
        } else {
            streakPill.isHidden = true
        }
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    private func finishExam() {
        if isPracticeMode {
            finishPracticeMode()
            return
        }

        let needed: Int
        if subject == "Geography" {
            needed = GeographyGameData.minimumPassScore(for: questions.count)
        } else if subject == "English" {
            needed = EnglishGameData.minimumPassScore(for: questions.count)
        } else if subject == "Science" {
            needed = ScienceGameData.minimumPassScore(for: questions.count)
        } else if subject == "History" {
            needed = HistoryGameData.minimumPassScore(for: topicId)
        } else {
            needed = MathGameData.minimumPassScore(for: questions.count)
        }

        if correctAnswers >= needed {
            saveExamPass()

            // Record exam pass for this subject, then check badges
            BadgeManager.shared.recordExamPass(subject: subject)
            let event = BadgeEvent(
                totalQuestsCompleted: BadgeManager.shared.totalQuestsCompleted,
                totalXP: Session.shared.currentUser?.xp ?? 0,
                passedExam: true,
                subject: subject,
                passedExamSubjects: BadgeManager.shared.passedExamSubjects
            )
            let newBadges = BadgeManager.shared.checkAndAward(event: event)

            let showPassOverlay = { [weak self] in
                guard let self else { return }
                let accuracy = self.questions.isEmpty ? 0 : Int(Float(self.correctAnswers) / Float(self.questions.count) * 100)
                let stars = accuracy == 100 ? "⭐⭐⭐" : accuracy >= 80 ? "⭐⭐" : "⭐"
                let displayXP = ShopEffects.hasXPBooster ? self.rewardXP * 2 : self.rewardXP
                let xpLine = ShopEffects.hasXPBooster
                    ? "+\(displayXP) XP ⚡2x\nNext section unlocked."
                    : "+\(displayXP) XP\nNext section unlocked."
                self.showOverlay(
                    title: "Exam Passed!",
                    emoji: stars,
                    message: "\(self.correctAnswers) / \(self.questions.count) correct • \(accuracy)%",
                    subMessage: xpLine,
                    buttonTitle: "Back to Map"
                ) { [weak self] in
                    guard let self else { return }
                    self.removeOverlay()
                    if self.subject == "Geography" {
                        if let geoVC = self.navigationController?.viewControllers.first(where: { $0 is GeographyViewController }) {
                            self.navigationController?.popToViewController(geoVC, animated: true)
                        } else {
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    } else if self.subject == "English" {
                        if let engVC = self.navigationController?.viewControllers.first(where: { $0 is EnglishViewController }) {
                            self.navigationController?.popToViewController(engVC, animated: true)
                        } else {
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    } else if self.subject == "Science" {
                        if let sciVC = self.navigationController?.viewControllers.first(where: { $0 is ScienceViewController }) {
                            self.navigationController?.popToViewController(sciVC, animated: true)
                        } else {
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    } else if self.subject == "History" {
                        if let hisVC = self.navigationController?.viewControllers.first(where: { $0 is HistoryViewController }) {
                            self.navigationController?.popToViewController(hisVC, animated: true)
                        } else {
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    } else {
                        if let mathVC = self.navigationController?.viewControllers.first(where: { $0 is MathViewController }) {
                            self.navigationController?.popToViewController(mathVC, animated: true)
                        } else {
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    }
                }
            }

            if newBadges.isEmpty {
                showPassOverlay()
            } else {
                showBadgesEarned(newBadges) { showPassOverlay() }
            }
        } else {
            showOverlay(
                title: "Not Passed Yet",
                emoji: "📘",
                message: "You got \(correctAnswers) out of \(questions.count) correct.",
                subMessage: "You need \(needed) to pass. Try again.",
                buttonTitle: "Try Again",
                cardColor: UIColor(red: 255/255, green: 230/255, blue: 230/255, alpha: 0.98),
                buttonColor: UIColor(red: 210/255, green: 70/255,  blue: 70/255,  alpha: 1.0)
            ) { [weak self] in
                guard let self = self else { return }
                self.removeOverlay()
                // Deal a fresh set of questions from the pool so retries feel different
                if !self.questionPool.isEmpty {
                    self.questions = Array(self.questionPool.shuffled().prefix(MathGameData.examQuestionCount))
                }
                self.currentQuestionIndex = 0
                self.correctAnswers = 0
                self.selectedAnswerIndex = nil
                self.loadCurrentQuestion()
            }
        }
    }

    private func finishPracticeMode() {
        let xp = questions.count * 10
        let defaults = UserDefaults.standard

        // Save XP locally and sync to Supabase
        let currentWorldXP = defaults.integer(forKey: worldXPKey)
        defaults.set(currentWorldXP + xp, forKey: worldXPKey)
        Session.shared.addXP(xp)

        // Mark quest as completed
        var completed = defaults.array(forKey: practiceCompletedKey) as? [Int] ?? []
        if !completed.contains(practiceQuestNumber) {
            completed.append(practiceQuestNumber)
            completed.sort()
        }
        defaults.set(completed, forKey: practiceCompletedKey)

        // Unlock next quest
        let currentUnlocked = max(defaults.integer(forKey: practiceUnlockedKey), 1)
        let questsPerTopicForSubject: Int
        if subject == "Science" {
            questsPerTopicForSubject = 5
        } else {
            questsPerTopicForSubject = MathGameData.questsPerTopic
        }
        if practiceQuestNumber < questsPerTopicForSubject {
            let nextUnlocked = max(currentUnlocked, practiceQuestNumber + 1)
            defaults.set(nextUnlocked, forKey: practiceUnlockedKey)
        }

        // Record streak and sync XP to Supabase
        StreakManager.shared.recordPlay()
        Session.shared.addXP(xp)

        // Daily quest tracking
        DailyQuestManager.shared.incrementTotalQuests()
        switch subject {
        case "Geography": DailyQuestManager.shared.recordGeoLesson()
        case "English":   DailyQuestManager.shared.recordEngLesson()
        case "Science":   DailyQuestManager.shared.recordSciLesson()
        case "History":   DailyQuestManager.shared.recordHisLesson()
        default:          DailyQuestManager.shared.recordMathLesson()
        }

        // Badge check
        BadgeManager.shared.incrementQuestCount()
        let event = BadgeEvent(
            totalQuestsCompleted: BadgeManager.shared.totalQuestsCompleted,
            totalXP: Session.shared.currentUser?.xp ?? 0,
            passedExam: false,
            subject: subject,
            passedExamSubjects: BadgeManager.shared.passedExamSubjects
        )
        let newBadges = BadgeManager.shared.checkAndAward(event: event)

        let showComplete = { [weak self] in
            guard let self else { return }
            let accuracy = self.questions.isEmpty ? 0 : Int(Float(self.correctAnswers) / Float(self.questions.count) * 100)
            let stars = accuracy == 100 ? "⭐⭐⭐" : accuracy >= 70 ? "⭐⭐" : "⭐"
            let displayXP = ShopEffects.hasXPBooster ? xp * 2 : xp
            let xpLine = ShopEffects.hasXPBooster ? "+\(displayXP) XP ⚡2x!" : "+\(displayXP) XP earned!"
            self.showOverlay(
                title: "Quest \(self.practiceQuestNumber) Complete!",
                emoji: stars,
                message: "\(self.correctAnswers) / \(self.questions.count) correct • \(accuracy)%",
                subMessage: xpLine,
                buttonTitle: "Back to Map"
            ) { [weak self] in
                guard let self else { return }
                self.removeOverlay()
                if self.subject == "Geography" {
                    if let geoVC = self.navigationController?.viewControllers.first(where: { $0 is GeographyViewController }) {
                        self.navigationController?.popToViewController(geoVC, animated: true)
                    } else {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                } else if self.subject == "English" {
                    if let engVC = self.navigationController?.viewControllers.first(where: { $0 is EnglishViewController }) {
                        self.navigationController?.popToViewController(engVC, animated: true)
                    } else {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                } else if self.subject == "Science" {
                    if let sciVC = self.navigationController?.viewControllers.first(where: { $0 is ScienceViewController }) {
                        self.navigationController?.popToViewController(sciVC, animated: true)
                    } else {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                } else if self.subject == "History" {
                    if let hisVC = self.navigationController?.viewControllers.first(where: { $0 is HistoryViewController }) {
                        self.navigationController?.popToViewController(hisVC, animated: true)
                    } else {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                } else {
                    if let mathVC = self.navigationController?.viewControllers.first(where: { $0 is MathViewController }) {
                        self.navigationController?.popToViewController(mathVC, animated: true)
                    } else {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        }

        if newBadges.isEmpty {
            showComplete()
        } else {
            showBadgesEarned(newBadges) { showComplete() }
        }
    }

    private func saveExamPass() {
        let defaults = UserDefaults.standard

        rewardXP = max(questions.count * 15, correctAnswers * 15)
        let currentWorldXP = defaults.integer(forKey: worldXPKey)
        defaults.set(currentWorldXP + rewardXP, forKey: worldXPKey)
        Session.shared.addXP(rewardXP)

        let topicsCount: Int
        if subject == "Geography" {
            topicsCount = GeographyGameData.topics.count
        } else if subject == "English" {
            topicsCount = EnglishGameData.topics.count
        } else if subject == "Science" {
            topicsCount = ScienceGameData.topics.count
        } else if subject == "History" {
            topicsCount = HistoryGameData.topics.count
        } else {
            topicsCount = MathGameData.topics.count
        }
        let nextTopic = min(topicsCount, topicId + 1)
        defaults.set(nextTopic, forKey: currentTopicKey)

        defaults.set(1, forKey: practiceUnlockedKey)
        defaults.set([], forKey: practiceCompletedKey)

        // Mark this topic as permanently completed so it shows on the map history
        var doneTopics = defaults.array(forKey: completedTopicsKey) as? [Int] ?? []
        if !doneTopics.contains(topicId) {
            doneTopics.append(topicId)
            defaults.set(doneTopics, forKey: completedTopicsKey)
        }

        // Record streak and sync XP to Supabase
        StreakManager.shared.recordPlay()
        Session.shared.addXP(rewardXP)

        // Daily quest tracking
        DailyQuestManager.shared.incrementTotalQuests()
        DailyQuestManager.shared.recordTopicUnlock()
    }

    private func removeOverlay() {
        resultCardView?.removeFromSuperview()
        dimOverlayView?.removeFromSuperview()
        resultCardView = nil
        dimOverlayView = nil
    }

    private func showOverlay(
        title: String,
        emoji: String,
        message: String,
        subMessage: String,
        buttonTitle: String,
        cardColor: UIColor = UIColor(red: 226/255, green: 247/255, blue: 225/255, alpha: 0.98),
        buttonColor: UIColor = UIColor(red: 157/255, green: 228/255, blue: 148/255, alpha: 1.0),
        action: @escaping () -> Void
    ) {
        removeOverlay()

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
        card.backgroundColor = cardColor
        view.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])

        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = emoji
        emojiLabel.font = UIFont.systemFont(ofSize: 58)
        emojiLabel.textAlignment = .center

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0

        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = subMessage
        subLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subLabel.textAlignment = .center
        subLabel.textColor = UIColor.black.withAlphaComponent(0.72)
        subLabel.numberOfLines = 0

        let actionButton = UIButton(type: .system)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        actionButton.layer.cornerRadius = 24
        actionButton.clipsToBounds = true
        actionButton.backgroundColor = buttonColor
        actionButton.addAction(UIAction { _ in action() }, for: .touchUpInside)

        card.addSubview(emojiLabel)
        card.addSubview(titleLabel)
        card.addSubview(messageLabel)
        card.addSubview(subLabel)
        card.addSubview(actionButton)

        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),
            emojiLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            subLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 12),
            subLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            subLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            actionButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 24),
            actionButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 28),
            actionButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -28),
            actionButton.heightAnchor.constraint(equalToConstant: 58),
            actionButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
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
    }
}
