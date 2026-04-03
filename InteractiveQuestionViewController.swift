import UIKit

final class InteractiveQuestionViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!

    @IBOutlet weak var topProgressView: UIProgressView!
    @IBOutlet weak var questionProgressView: UIProgressView!

    @IBOutlet weak var questionInfoLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var questionPercentLabel: UILabel!

    @IBOutlet weak var objectBankView: UIView!
    @IBOutlet weak var plateContainerView: UIView!
    @IBOutlet weak var plateImageView: UIImageView!
    @IBOutlet weak var plateTitleLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!

    var subject: String = "Math"
    var levelNumber: Int = 1
    var mapQuestNumber: Int = 1

    private let backButton = UIButton(type: .system)
    private let plateItemsAreaView = UIView()
    private let dropCountBadge = UILabel()

    private var dimOverlayView: UIView?
    private var resultCardView: UIView?

    private let questYellow = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1.0)

    private let practiceUnlockedKey = "math_practice_unlocked_quest"
    private let practiceCompletedKey = "math_practice_completed_quests"
    private let worldXPKey = "math_world_total_xp"

    private var questions: [PracticeQuestion] = []
    private var currentQuestionIndex: Int = 0
    private var correctAnswerCount: Int = 0
    private var rewardXPForThisLevel: Int = 0

    private var bankItemViews: [UIImageView] = []
    private var plateItemViews: [UIImageView] = []

    private var originalCenters: [UIImageView: CGPoint] = [:]
    private var itemIsOnPlate: [UIImageView: Bool] = [:]

    private let itemSize = CGSize(width: 54, height: 54)
    private let bankPadding: CGFloat = 16
    private let bankSpacing: CGFloat = 14
    private let itemsPerRow = 4
    private let platePadding: CGFloat = 8
    private let plateSpacing: CGFloat = 10
    private let plateItemsPerRow = 4

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopConfetti()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        questions = MathGameData.practiceQuestions(for: levelNumber, questNumber: mapQuestNumber)

        setupUI()
        setupBackButton()
        styleHeader()
        refreshHeader()
        loadQuestion()

        // XP label opens the Rewards Shop
        xpLabel.isUserInteractionEnabled = true
        xpLabel.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapXPArea))
        )
    }

    @objc private func didTapXPArea() {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RewardsShopViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2

        // Make check button span most of the screen width
        let btnWidth: CGFloat = view.bounds.width - 48
        checkButton.frame.size.width = btnWidth
        checkButton.frame.origin.x = 24
    }

    private func styleHeader() {
        let darkBrown = UIColor(red: 0.25, green: 0.15, blue: 0.05, alpha: 1.0)
        usernameLabel.textColor = darkBrown
        levelLabel.textColor = darkBrown
        xpLabel.textColor = darkBrown

        questionInfoLabel.textColor = darkBrown
        questionPercentLabel.textColor = darkBrown
        questionTextLabel.textColor = darkBrown
        plateTitleLabel.textColor = darkBrown

        topProgressView.trackTintColor = UIColor.black.withAlphaComponent(0.12)
        topProgressView.progressTintColor = questYellow

        questionProgressView.trackTintColor = UIColor.black.withAlphaComponent(0.12)
        questionProgressView.progressTintColor = questYellow

        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
    }

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        let shownXP = Session.shared.currentUser?.xp ?? 0

        usernameLabel.text = Session.shared.currentUser?.username ?? "radka"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        xpLabel.text = "\(shownXP) XP"
        topProgressView.progress = min(Float(shownXP % 500) / 500.0, 1.0)
    }

    private func setupBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor(red: 0.25, green: 0.15, blue: 0.05, alpha: 1.0)
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.08)
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

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    private func setupUI() {
        // objectBankView and plateContainerView keep their storyboard warm-peach colour
        objectBankView.layer.cornerRadius = 20
        objectBankView.clipsToBounds = true

        plateContainerView.clipsToBounds = true

        checkButton.layer.cornerRadius = 22
        checkButton.clipsToBounds = true
        checkButton.backgroundColor = questYellow
        checkButton.setTitleColor(.black, for: .normal)

        let darkBrown = UIColor(red: 0.25, green: 0.15, blue: 0.05, alpha: 1.0)
        resetButton.setTitleColor(darkBrown, for: .normal)
        plateImageView.contentMode = .scaleAspectFit

        questionTextLabel.numberOfLines = 0
        questionTextLabel.adjustsFontSizeToFitWidth = true
        questionTextLabel.minimumScaleFactor = 0.8

        setupPlateItemsArea()
    }

    private func setupPlateItemsArea() {
        plateItemsAreaView.translatesAutoresizingMaskIntoConstraints = false
        plateItemsAreaView.backgroundColor = .clear
        plateItemsAreaView.isUserInteractionEnabled = false
        plateContainerView.addSubview(plateItemsAreaView)

        NSLayoutConstraint.activate([
            plateItemsAreaView.leadingAnchor.constraint(equalTo: plateImageView.trailingAnchor, constant: 12),
            plateItemsAreaView.trailingAnchor.constraint(equalTo: plateContainerView.trailingAnchor, constant: -12),
            plateItemsAreaView.topAnchor.constraint(equalTo: plateContainerView.topAnchor, constant: 10),
            plateItemsAreaView.bottomAnchor.constraint(equalTo: plateContainerView.bottomAnchor, constant: -10)
        ])

        plateContainerView.bringSubviewToFront(plateTitleLabel)
        plateContainerView.bringSubviewToFront(resetButton)

        // Drop-count badge  -  shows how many items are currently on the plate
        dropCountBadge.font = UIFont.boldSystemFont(ofSize: 14)
        dropCountBadge.textColor = .white
        dropCountBadge.textAlignment = .center
        dropCountBadge.backgroundColor = UIColor(red: 0.75, green: 0.45, blue: 0.10, alpha: 1.0)
        dropCountBadge.layer.cornerRadius = 14
        dropCountBadge.clipsToBounds = true
        dropCountBadge.isHidden = true
        dropCountBadge.translatesAutoresizingMaskIntoConstraints = false
        plateContainerView.addSubview(dropCountBadge)
        plateContainerView.bringSubviewToFront(dropCountBadge)

        NSLayoutConstraint.activate([
            dropCountBadge.trailingAnchor.constraint(equalTo: plateContainerView.trailingAnchor, constant: -12),
            dropCountBadge.topAnchor.constraint(equalTo: plateContainerView.topAnchor, constant: 10),
            dropCountBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 28),
            dropCountBadge.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    private func updateDropCountBadge() {
        let count = plateItemViews.count
        if count == 0 {
            dropCountBadge.isHidden = true
        } else {
            dropCountBadge.isHidden = false
            dropCountBadge.text = " \(count) "
        }
    }

    private func loadQuestion() {
        guard !questions.isEmpty else {
            navigationController?.popViewController(animated: true)
            return
        }

        guard currentQuestionIndex < questions.count else {
            finishQuestAndShowCelebration()
            return
        }

        clearAllItemViews()

        let question = questions[currentQuestionIndex]
        refreshHeader()

        if let topic = MathGameData.topic(for: levelNumber) {
            questionInfoLabel.text = "Quest \(mapQuestNumber) • \(topic.nodeTitle) • Question \(currentQuestionIndex + 1) of \(questions.count)"
        } else {
            questionInfoLabel.text = "Quest \(mapQuestNumber) • Question \(currentQuestionIndex + 1) of \(questions.count)"
        }

        questionTextLabel.text = question.prompt

        let percent = Float(currentQuestionIndex) / Float(questions.count)
        questionPercentLabel.text = "\(Int(percent * 100))%"
        questionProgressView.progress = percent

        plateTitleLabel.text = question.plateTitle
        plateImageView.image = UIImage(named: question.plateImageName)

        createBankItems(for: question)
    }

    private func clearAllItemViews() {
        for item in bankItemViews { item.removeFromSuperview() }
        for item in plateItemViews { item.removeFromSuperview() }
        bankItemViews.removeAll()
        plateItemViews.removeAll()
        originalCenters.removeAll()
        itemIsOnPlate.removeAll()
        updateDropCountBadge()
    }

    private func createBankItems(for question: PracticeQuestion) {
        guard let itemImage = UIImage(named: question.objectType.assetName) else { return }

        // Add 2 extra distractor items so the bank count doesn't directly reveal the answer
        let bankCount = question.totalItems + 2

        for index in 0..<bankCount {
            let imageView = UIImageView(image: itemImage)
            imageView.frame.size = itemSize
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.tag = index + 1

            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            imageView.addGestureRecognizer(pan)

            objectBankView.addSubview(imageView)
            bankItemViews.append(imageView)
            itemIsOnPlate[imageView] = false
        }

        layoutBankItems()
    }

    private func layoutBankItems(animated: Bool = false) {
        for (index, itemView) in bankItemViews.enumerated() {
            guard itemIsOnPlate[itemView] == false else { continue }

            let row = index / itemsPerRow
            let col = index % itemsPerRow

            let x = bankPadding + CGFloat(col) * (itemSize.width + bankSpacing)
            let y = bankPadding + CGFloat(row) * (itemSize.height + bankSpacing)
            let targetCenter = CGPoint(x: x + itemSize.width / 2, y: y + itemSize.height / 2)

            if animated {
                UIView.animate(withDuration: 0.25) { itemView.center = targetCenter }
            } else {
                itemView.center = targetCenter
            }

            originalCenters[itemView] = targetCenter
        }
    }

    private func layoutPlateItems(animated: Bool = true) {
        for (index, itemView) in plateItemViews.enumerated() {
            let row = index / plateItemsPerRow
            let col = index % plateItemsPerRow

            let x = platePadding + CGFloat(col) * (itemSize.width + plateSpacing)
            let y = platePadding + CGFloat(row) * (itemSize.height + plateSpacing)
            let targetCenter = CGPoint(x: x + itemSize.width / 2, y: y + itemSize.height / 2)

            if animated {
                UIView.animate(withDuration: 0.25) { itemView.center = targetCenter }
            } else {
                itemView.center = targetCenter
            }
        }
    }

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let itemView = gesture.view as? UIImageView else { return }

        switch gesture.state {
        case .began:
            itemView.superview?.bringSubviewToFront(itemView)
            itemView.layer.zPosition = 999
            UIView.animate(withDuration: 0.15) {
                itemView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
            }

        case .changed:
            let translation = gesture.translation(in: view)
            itemView.center = CGPoint(
                x: itemView.center.x + translation.x,
                y: itemView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)

        case .ended, .cancelled:
            UIView.animate(withDuration: 0.15) {
                itemView.transform = .identity
            }

            let dropPointInMainView = itemView.superview?.convert(itemView.center, to: view) ?? itemView.center
            let plateFrameInMainView = plateContainerView.convert(plateContainerView.bounds, to: view)

            if plateFrameInMainView.contains(dropPointInMainView) {
                moveItemToPlate(itemView)
            } else {
                moveItemBackToBank(itemView)
            }

        default:
            break
        }
    }

    private func moveItemToPlate(_ itemView: UIImageView) {
        guard itemIsOnPlate[itemView] == false else {
            layoutPlateItems()
            return
        }

        let centerInPlateArea = view.convert(itemView.center, to: plateItemsAreaView)
        itemView.removeFromSuperview()
        plateItemsAreaView.addSubview(itemView)
        itemView.center = centerInPlateArea
        itemView.layer.zPosition = 20

        itemIsOnPlate[itemView] = true
        plateItemViews.append(itemView)

        if let bankIndex = bankItemViews.firstIndex(of: itemView) {
            bankItemViews.remove(at: bankIndex)
        }

        layoutBankItems(animated: true)
        layoutPlateItems(animated: true)
        updateDropCountBadge()
    }

    private func moveItemBackToBank(_ itemView: UIImageView) {
        if itemIsOnPlate[itemView] == true {
            let centerInBank = plateItemsAreaView.convert(itemView.center, to: objectBankView)
            itemView.removeFromSuperview()
            objectBankView.addSubview(itemView)
            itemView.center = centerInBank
            itemView.layer.zPosition = 0

            itemIsOnPlate[itemView] = false
            bankItemViews.append(itemView)

            if let plateIndex = plateItemViews.firstIndex(of: itemView) {
                plateItemViews.remove(at: plateIndex)
            }

            bankItemViews.sort { $0.tag < $1.tag }
            layoutBankItems(animated: true)
            layoutPlateItems(animated: true)
            updateDropCountBadge()
        } else if let original = originalCenters[itemView] {
            UIView.animate(withDuration: 0.25) { itemView.center = original }
        }
    }

    @IBAction func resetTapped(_ sender: UIButton) {
        resetCurrentQuestion()
    }

    @IBAction func checkTapped(_ sender: UIButton) {
        animateCheckButtonTap()

        guard currentQuestionIndex < questions.count else { return }

        let question = questions[currentQuestionIndex]
        let selectedCount = plateItemViews.count

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) { [weak self] in
            guard let self = self else { return }

            if selectedCount == question.selectedItems {
                self.correctAnswerCount += 1
                DailyQuestManager.shared.recordCorrectAnswer()
                self.showCorrectOverlay()
            } else {
                self.showWrongOverlay(
                    expected: question.selectedItems,
                    actual: selectedCount,
                    explanation: question.wrongExplanation
                )
            }
        }
    }

    private func animateCheckButtonTap() {
        UIView.animate(withDuration: 0.10, animations: {
            self.checkButton.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
            self.checkButton.alpha = 0.88
        }) { _ in
            UIView.animate(withDuration: 0.14) {
                self.checkButton.transform = .identity
                self.checkButton.alpha = 1.0
            }
        }
    }

    private func resetCurrentQuestion() {
        for itemView in plateItemViews {
            let centerInBank = plateItemsAreaView.convert(itemView.center, to: objectBankView)
            itemView.removeFromSuperview()
            objectBankView.addSubview(itemView)
            itemView.center = centerInBank
            itemView.layer.zPosition = 0
            itemIsOnPlate[itemView] = false
            bankItemViews.append(itemView)
        }

        plateItemViews.removeAll()
        bankItemViews.sort { $0.tag < $1.tag }
        layoutBankItems(animated: true)
    }

    private func saveQuestCompletion() {
        let defaults = UserDefaults.standard

        rewardXPForThisLevel = max(questions.count * 5, correctAnswerCount * 5)
        let currentWorldXP = defaults.integer(forKey: worldXPKey)
        defaults.set(currentWorldXP + rewardXPForThisLevel, forKey: worldXPKey)
        Session.shared.addXP(rewardXPForThisLevel)

        var completed = defaults.array(forKey: practiceCompletedKey) as? [Int] ?? []
        if !completed.contains(mapQuestNumber) {
            completed.append(mapQuestNumber)
            completed.sort()
        }
        defaults.set(completed, forKey: practiceCompletedKey)

        let currentUnlocked = max(defaults.integer(forKey: practiceUnlockedKey), 1)
        if mapQuestNumber < MathGameData.questsPerTopic {
            let nextUnlocked = max(currentUnlocked, mapQuestNumber + 1)
            defaults.set(nextUnlocked, forKey: practiceUnlockedKey)
        }

        // Record streak and sync XP to Supabase
        StreakManager.shared.recordPlay()
        Session.shared.addXP(rewardXPForThisLevel)

        // Daily quest tracking
        DailyQuestManager.shared.incrementTotalQuests()
        DailyQuestManager.shared.recordMathLesson()
    }

    private func finishQuestAndShowCelebration() {
        saveQuestCompletion()

        // Badge check  -  must happen after XP is saved
        BadgeManager.shared.incrementQuestCount()
        let totalXP = (Session.shared.currentUser?.xp ?? 0) +
                      UserDefaults.standard.integer(forKey: worldXPKey)
        let event = BadgeEvent(
            totalQuestsCompleted: BadgeManager.shared.totalQuestsCompleted,
            totalXP: totalXP,
            passedExam: false,
            subject: subject
        )
        let newBadges = BadgeManager.shared.checkAndAward(event: event)

        if newBadges.isEmpty {
            showQuestCompleteScreen()
        } else {
            showBadgesEarned(newBadges) { [weak self] in
                self?.showQuestCompleteScreen()
            }
        }
    }

    private func showQuestCompleteScreen() {
        removeResultOverlay()

        //  -  full-screen backdrop (same warm peach as the VC)
        let backdrop = UIView()
        backdrop.translatesAutoresizingMaskIntoConstraints = false
        backdrop.backgroundColor = UIColor(red: 0.9585, green: 0.8296, blue: 0.5659, alpha: 1.0)
        backdrop.alpha = 0
        view.addSubview(backdrop)
        NSLayoutConstraint.activate([
            backdrop.topAnchor.constraint(equalTo: view.topAnchor),
            backdrop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backdrop.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        //  -  content card (white, floating in the middle)
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .white
        card.layer.cornerRadius = 32
        card.clipsToBounds = false
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.10
        card.layer.shadowRadius = 20
        card.layer.shadowOffset = CGSize(width: 0, height: 6)
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        backdrop.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: backdrop.centerYAnchor, constant: -20),
            card.leadingAnchor.constraint(equalTo: backdrop.leadingAnchor, constant: 28),
            card.trailingAnchor.constraint(equalTo: backdrop.trailingAnchor, constant: -28)
        ])

        let darkBrown = UIColor(red: 0.25, green: 0.15, blue: 0.05, alpha: 1.0)

        let starLabel = UILabel()
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        starLabel.text = "⭐️"
        starLabel.font = UIFont.systemFont(ofSize: 72)
        starLabel.textAlignment = .center

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let isLastQuest = mapQuestNumber >= MathGameData.questsPerTopic - 1
        titleLabel.text = isLastQuest ? "All done!" : "Quest \(mapQuestNumber) complete!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = darkBrown
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        let xpBadge = UILabel()
        xpBadge.translatesAutoresizingMaskIntoConstraints = false
        let displayXP = ShopEffects.hasXPBooster ? rewardXPForThisLevel * 2 : rewardXPForThisLevel
        xpBadge.text = ShopEffects.hasXPBooster
            ? "  +\(displayXP) XP ⚡2x  "
            : "  +\(displayXP) XP  "
        xpBadge.font = UIFont.boldSystemFont(ofSize: 22)
        xpBadge.textColor = UIColor(red: 0.15, green: 0.55, blue: 0.15, alpha: 1.0)
        xpBadge.textAlignment = .center
        xpBadge.backgroundColor = UIColor(red: 0.87, green: 0.97, blue: 0.87, alpha: 1.0)
        xpBadge.layer.cornerRadius = 16
        xpBadge.clipsToBounds = true

        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = isLastQuest
            ? "You've mastered all the quests.\nTime for the exam! 🚀"
            : "Keep going  -  the next quest\nis waiting on the map! 🗺️"
        subLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subLabel.textColor = darkBrown.withAlphaComponent(0.70)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 0

        let backBtn = UIButton(type: .system)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setTitle("Back to Map", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        backBtn.backgroundColor = questYellow
        backBtn.layer.cornerRadius = 24
        backBtn.clipsToBounds = true

        card.addSubview(starLabel)
        card.addSubview(titleLabel)
        card.addSubview(xpBadge)
        card.addSubview(subLabel)
        card.addSubview(backBtn)

        NSLayoutConstraint.activate([
            starLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 32),
            starLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: starLabel.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            xpBadge.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            xpBadge.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 110),
            xpBadge.heightAnchor.constraint(equalToConstant: 40),

            subLabel.topAnchor.constraint(equalTo: xpBadge.bottomAnchor, constant: 16),
            subLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            subLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),

            backBtn.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 28),
            backBtn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            backBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),
            backBtn.heightAnchor.constraint(equalToConstant: 56),
            backBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        backBtn.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.stopConfetti()
            // Pop back to MathViewController specifically (not the main world map)
            if let mathVC = self.navigationController?.viewControllers.first(where: { $0 is MathViewController }) {
                self.navigationController?.popToViewController(mathVC, animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }, for: .touchUpInside)

        dimOverlayView = backdrop
        resultCardView = card

        //  -  animate in
        UIView.animate(withDuration: 0.22) { backdrop.alpha = 1.0 }
        UIView.animate(
            withDuration: 0.42,
            delay: 0.05,
            usingSpringWithDamping: 0.72,
            initialSpringVelocity: 0.8,
            options: [.curveEaseOut]
        ) {
            card.alpha = 1
            card.transform = .identity
        } completion: { [weak self] _ in
            self?.launchConfetti()
            self?.animateStar(starLabel)
        }
    }

    // MARK: - Confetti

    private var confettiLayer: CAEmitterLayer?

    private func launchConfetti() {
        // Use view.bounds  -  always valid; attach to view.layer so it renders above everything
        let width = view.bounds.width
        let height = view.bounds.height

        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 0, y: 0, width: width, height: height)
        emitter.emitterPosition = CGPoint(x: width / 2, y: -10)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: width * 1.2, height: 1)
        emitter.renderMode = .unordered

        let colors: [UIColor] = [
            UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1),   // gold
            UIColor(red: 1.0, green: 0.35, blue: 0.35, alpha: 1),  // red
            UIColor(red: 0.25, green: 0.70, blue: 1.0, alpha: 1),  // blue
            UIColor(red: 0.30, green: 0.90, blue: 0.45, alpha: 1), // green
            UIColor(red: 1.0, green: 0.60, blue: 0.20, alpha: 1),  // orange
            UIColor(red: 0.85, green: 0.35, blue: 1.0, alpha: 1)   // purple
        ]

        emitter.emitterCells = colors.flatMap { color -> [CAEmitterCell] in
            [makeConfettiCell(color: color, shape: "rect"),
             makeConfettiCell(color: color, shape: "circle")]
        }

        view.layer.addSublayer(emitter)
        confettiLayer = emitter

        // Stop emitting after 2 s so pieces finish falling naturally
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak emitter] in
            emitter?.birthRate = 0
        }
    }

    private func makeConfettiCell(color: UIColor, shape: String) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 7
        cell.lifetime = 4.5
        cell.lifetimeRange = 1.5
        cell.color = color.cgColor
        cell.velocity = CGFloat.random(in: 280...420)
        cell.velocityRange = 80
        cell.emissionLongitude = .pi            // straight down
        cell.emissionRange = .pi / 5            // slight spread
        cell.spin = CGFloat.random(in: 2...5)
        cell.spinRange = 3
        cell.scale = 1.0
        cell.scaleRange = 0.4
        cell.yAcceleration = 180                // gravity
        cell.xAcceleration = CGFloat.random(in: -30...30)
        cell.alphaSpeed = -0.18

        // Solid coloured shape rendered as a bitmap (large enough to be clearly visible)
        let size = CGSize(width: 14, height: 10)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        if shape == "circle" {
            UIBezierPath(ovalIn: CGRect(origin: .zero, size: size)).fill()
        } else {
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 2).fill()
        }
        cell.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()

        return cell
    }

    private func stopConfetti() {
        confettiLayer?.removeFromSuperlayer()
        confettiLayer = nil
    }

    private func animateStar(_ label: UILabel) {
        UIView.animate(
            withDuration: 0.22,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 1.2,
            options: []
        ) {
            label.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        } completion: { _ in
            UIView.animate(withDuration: 0.18) {
                label.transform = .identity
            }
        }
    }

    private func removeResultOverlay() {
        resultCardView?.removeFromSuperview()
        dimOverlayView?.removeFromSuperview()
        resultCardView = nil
        dimOverlayView = nil
    }

    private func showCorrectOverlay() {
        showResultOverlay(
            isCorrect: true,
            title: "Correct!",
            message: "Amazing job! You got it right.",
            explanation: nil,
            buttonTitle: "Next"
        ) { [weak self] in
            self?.removeResultOverlay()
            self?.goToNextQuestion()
        }
    }

    private func showWrongOverlay(expected: Int, actual: Int, explanation: String) {
        showResultOverlay(
            isCorrect: false,
            title: "Try again",
            message: "You placed \(actual), but the correct number is \(expected).",
            explanation: explanation,
            buttonTitle: "Try Again"
        ) { [weak self] in
            self?.removeResultOverlay()
            self?.resetCurrentQuestion()
        }
    }

    private func showResultOverlay(
        isCorrect: Bool,
        title: String,
        message: String,
        explanation: String?,
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        removeResultOverlay()

        let dimView = UIView()
        dimView.translatesAutoresizingMaskIntoConstraints = false
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.18)
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
        card.layer.cornerRadius = 30
        card.clipsToBounds = true
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        card.backgroundColor = isCorrect
            ? UIColor(red: 226/255, green: 247/255, blue: 225/255, alpha: 0.98)
            : UIColor(red: 252/255, green: 224/255, blue: 224/255, alpha: 0.98)

        view.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26)
        ])

        let iconLabel = UILabel()
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.text = isCorrect ? "✅" : "❌"
        iconLabel.font = UIFont.systemFont(ofSize: 52)
        iconLabel.textAlignment = .center

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black

        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black

        let explanationLabel = UILabel()
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.text = explanation
        explanationLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        explanationLabel.textAlignment = .center
        explanationLabel.numberOfLines = 0
        explanationLabel.textColor = UIColor.black.withAlphaComponent(0.75)
        explanationLabel.isHidden = explanation == nil

        let actionButton = UIButton(type: .system)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        actionButton.layer.cornerRadius = 22
        actionButton.clipsToBounds = true
        actionButton.backgroundColor = isCorrect
            ? UIColor(red: 157/255, green: 228/255, blue: 148/255, alpha: 1.0)
            : UIColor(red: 241/255, green: 153/255, blue: 153/255, alpha: 1.0)

        actionButton.addAction(UIAction { _ in action() }, for: .touchUpInside)

        card.addSubview(iconLabel)
        card.addSubview(titleLabel)
        card.addSubview(messageLabel)
        card.addSubview(explanationLabel)
        card.addSubview(actionButton)

        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 26),
            iconLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: iconLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            messageLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            explanationLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: explanation == nil ? 0 : 14),
            explanationLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            explanationLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),

            actionButton.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: explanation == nil ? 26 : 24),
            actionButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 26),
            actionButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -26),
            actionButton.heightAnchor.constraint(equalToConstant: 58),
            actionButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        dimOverlayView = dimView
        resultCardView = card

        UIView.animate(withDuration: 0.20) { dimView.alpha = 1 }
        UIView.animate(withDuration: 0.28, delay: 0.02, usingSpringWithDamping: 0.82, initialSpringVelocity: 0.7, options: [.curveEaseOut], animations: {
            card.alpha = 1
            card.transform = .identity
        })
    }

    private func showSimpleOverlay(
        title: String,
        emoji: String,
        message: String,
        subMessage: String,
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
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
        card.backgroundColor = UIColor(red: 226/255, green: 247/255, blue: 225/255, alpha: 0.98)
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
        actionButton.backgroundColor = UIColor(red: 157/255, green: 228/255, blue: 148/255, alpha: 1.0)
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

        UIView.animate(withDuration: 0.20) { dimView.alpha = 1 }
        UIView.animate(withDuration: 0.36, delay: 0.02, usingSpringWithDamping: 0.78, initialSpringVelocity: 0.9, options: [.curveEaseOut], animations: {
            card.alpha = 1
            card.transform = .identity
        })
    }

    private func goToNextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            loadQuestion()
        } else {
            finishQuestAndShowCelebration()
        }
    }
}
