import UIKit

final class EnglishViewController: UIViewController {

    // Header outlets — wired in storyboard.
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgress: UIProgressView!

    // Programmatic views (not wired in storyboard for this world)
    private let scrollView    = UIScrollView()
    private let mapImageView  = UIImageView(image: UIImage(named: "grassland_path"))

    private let diagnosticDoneKey     = "eng_diagnostic_done"
    private let startTopicKey         = "eng_start_topic"
    private let currentTopicKey       = "eng_current_topic"
    private let practiceUnlockedKey   = "eng_practice_unlocked_quest"
    private let practiceCompletedKey  = "eng_practice_completed_quests"
    private let worldXPKey            = "eng_world_total_xp"
    private let completedTopicsKey    = "eng_completed_topic_ids"

    private var programmaticContentView: UIView?
    private var nodeButtons: [UIButton] = []
    private var nodeGlowViews: [UIView] = []
    private var didBuildNodes = false
    private var lastBuiltTopicId: Int = -1
    private weak var backBtn: UIButton?
    private weak var puzzleBtn: UIButton?
    private weak var examBtn: UIButton?

    // Pending unlock animation  -  set in viewWillAppear, consumed in viewDidAppear
    private var pendingTopicUnlockId: Int?
    // Stored so the tap-to-dismiss gesture can call it
    private var dismissUnlockOverlay: (() -> Void)?

    private let nodeSize: CGFloat = 84
    private let glowSize: CGFloat = 96
    private let contentHeightMultiplier: CGFloat = 1.65
    private var questSectionHeight: CGFloat = 0
    private var lockedSectionHeight: CGFloat = 0
    private var completedSectionHeight: CGFloat = 0

    // Purple primary node color
    private let nodePurple = UIColor(red: 0.45, green: 0.20, blue: 0.80, alpha: 1.0)

    private let nodePositions: [CGPoint] = [
        CGPoint(x: 0.63, y: 0.18),
        CGPoint(x: 0.47, y: 0.36),
        CGPoint(x: 0.61, y: 0.54),
        CGPoint(x: 0.42, y: 0.72),
        CGPoint(x: 0.60, y: 0.90)
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add programmatic views to hierarchy before configuring them
        view.insertSubview(mapImageView, at: 0)
        view.addSubview(scrollView)

        mapImageView.isHidden = false
        mapImageView.contentMode = .scaleAspectFill
        mapImageView.clipsToBounds = true

        scrollView.backgroundColor = .clear
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false

        addBackButton()
        addPuzzleButton(emoji: "✍️", color: UIColor(red: 0.06, green: 0.38, blue: 0.42, alpha: 0.92))
        if let anchor = puzzleBtn {
            addExamButton(color: UIColor(red: 0.45, green: 0.08, blue: 0.42, alpha: 0.92), anchoredLeftOf: anchor)
        }

        if UserDefaults.standard.integer(forKey: practiceUnlockedKey) == 0 {
            UserDefaults.standard.set(1, forKey: practiceUnlockedKey)
        }

        // XP label + progress bar both open the Rewards Shop
        [xpLabel, xpProgress].forEach { view in
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshHeader()

        // If the active topic changed (e.g. after an exam pass), tear down the map
        // so viewDidLayoutSubviews rebuilds it fresh with the new topic.
        let currentTid = currentTopicId()
        if didBuildNodes && currentTid != lastBuiltTopicId {
            // Queue the unlock animation (shown in viewDidAppear after map is rebuilt)
            if lastBuiltTopicId > 0 {
                pendingTopicUnlockId = currentTid
            }
            programmaticContentView?.removeFromSuperview()
            programmaticContentView = nil
            nodeButtons.removeAll()
            nodeGlowViews.removeAll()
            didBuildNodes = false
            view.setNeedsLayout()
        }

        refreshNodeStates()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 1. First-time language selection takes highest priority
        if !LanguageManager.shared.hasChosenTeachingLanguage {
            let prompt = EnglishTeachingLangPromptViewController()
            prompt.onComplete = { [weak self] in
                // Continue normal flow once the user has chosen their teaching language
                self?.presentDiagnosticIfNeeded()
            }
            navigationController?.pushViewController(prompt, animated: true)
            return
        }

        // 2. Unlock animation takes priority on first appearance after exam pass
        if let unlockId = pendingTopicUnlockId {
            pendingTopicUnlockId = nil
            showTopicUnlockAnimation(for: unlockId)
            return
        }

        // 3. Show diagnostic for new users (viewDidAppear is safe for pushing VCs)
        presentDiagnosticIfNeeded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
        ShopEffects.applyAvatarCosmetics(to: avatarImageView)

        mapImageView.frame = view.bounds
        scrollView.frame = view.bounds

        if !didBuildNodes {
            buildMapContent()
            didBuildNodes = true
            lastBuiltTopicId = currentTopicId()
        }

        // Keep content frame and contentSize in sync with the view
        if let cv = programmaticContentView {
            questSectionHeight = view.bounds.height * contentHeightMultiplier
            let totalH = completedSectionHeight + questSectionHeight + lockedSectionHeight
            cv.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: totalH)
            scrollView.contentSize = CGSize(width: view.bounds.width, height: totalH)
            layoutQuestNodes()
        }

        refreshNodeStates()

        view.sendSubviewToBack(mapImageView)
        [avatarImageView, usernameLabel, levelLabel, xpLabel, xpProgress].forEach {
            if let v = $0 { view.bringSubviewToFront(v) }
        }
        if let btn = backBtn   { view.bringSubviewToFront(btn) }
        if let btn = puzzleBtn { view.bringSubviewToFront(btn) }
        if let btn = examBtn   { view.bringSubviewToFront(btn) }
    }

    private func addExamButton(color: UIColor, anchoredLeftOf anchor: UIButton) {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("⏱️ Exam", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        btn.backgroundColor = color
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        btn.addTarget(self, action: #selector(didTapExam), for: .touchUpInside)
        view.addSubview(btn)
        examBtn = btn
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: xpProgress.bottomAnchor, constant: 10),
            btn.trailingAnchor.constraint(equalTo: anchor.leadingAnchor, constant: -8),
            btn.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    @objc private func didTapExam() {
        let vc = TimedExamViewController()
        vc.subject = "English"
        vc.topicId = currentTopicId()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func addPuzzleButton(emoji: String, color: UIColor) {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("\(emoji) Puzzles", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        btn.backgroundColor = color
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        btn.addTarget(self, action: #selector(didTapPuzzles), for: .touchUpInside)
        view.addSubview(btn)
        puzzleBtn = btn
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: xpProgress.bottomAnchor, constant: 10),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            btn.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    @objc private func didTapPuzzles() {
        let hub = PuzzleHubViewController()
        hub.world = .english
        navigationController?.pushViewController(hub, animated: true)
    }

    // MARK: - Map construction

    private func buildMapContent() {
        let questH = view.bounds.height * contentHeightMultiplier
        questSectionHeight = questH

        let currentTid = currentTopicId()
        let cardH: CGFloat = 64

        //  -  Completed topics (shown above the quest nodes, scrollable upward)
        let completedIds = completedTopicIdsSorted()
        let completedTopics = completedIds.compactMap { EnglishGameData.topic(for: $0) }
        completedSectionHeight = completedTopics.isEmpty ? 0 :
            (42 + CGFloat(completedTopics.count) * (cardH + 10) + 16)

        //  -  Upcoming "Coming Soon" topics (next 5 after current)
        let lockedTopics = Array(EnglishGameData.topics.filter { $0.id > currentTid }.prefix(5))
        lockedSectionHeight = lockedTopics.isEmpty ? 0 :
            (58 + CGFloat(lockedTopics.count) * (cardH + 10) + 44 + 24)

        let totalH = completedSectionHeight + questH + lockedSectionHeight

        let cv = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: totalH))
        cv.backgroundColor = .clear

        // Five quest-node buttons (frames set later in layoutQuestNodes)
        for index in 0..<5 {
            let glow = UIView()
            glow.backgroundColor = nodePurple.withAlphaComponent(0.18)
            glow.layer.cornerRadius = glowSize / 2
            glow.isUserInteractionEnabled = false
            cv.addSubview(glow)

            let button = UIButton(type: .system)
            button.tag = index + 1
            button.setTitle("\(index + 1)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
            button.backgroundColor = nodePurple.withAlphaComponent(0.94)
            button.layer.cornerRadius = nodeSize / 2
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.withAlphaComponent(0.75).cgColor
            button.addTarget(self, action: #selector(didTapLevel(_:)), for: .touchUpInside)
            cv.addSubview(button)

            nodeGlowViews.append(glow)
            nodeButtons.append(button)
        }

        if !lockedTopics.isEmpty {
            addLockedTopicsSection(to: cv, startY: completedSectionHeight + questH,
                                   topics: lockedTopics, cardH: cardH)
        }

        if !completedTopics.isEmpty {
            addCompletedTopicsSection(to: cv, startY: 0,
                                      topics: completedTopics, topicIds: completedIds,
                                      cardH: cardH)
        }

        scrollView.addSubview(cv)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: totalH)
        programmaticContentView = cv

        // Scroll to show active quest nodes (completed topics are scrollable above)
        if completedSectionHeight > 0 {
            DispatchQueue.main.async {
                self.scrollView.setContentOffset(
                    CGPoint(x: 0, y: self.completedSectionHeight), animated: false)
            }
        }
    }

    // MARK: - Completed topics section

    private func addCompletedTopicsSection(
        to container: UIView,
        startY: CGFloat,
        topics: [EngTopicDefinition],
        topicIds: [Int],
        cardH: CGFloat
    ) {
        let sideInset: CGFloat = 20
        let cardW = container.bounds.width - sideInset * 2

        // Section header
        let header = UILabel()
        header.text = "🏆  Completed Topics"
        header.font = UIFont.boldSystemFont(ofSize: 14)
        header.textColor = UIColor.white.withAlphaComponent(0.75)
        header.textAlignment = .center
        header.frame = CGRect(x: sideInset, y: startY + 14, width: cardW, height: 20)
        container.addSubview(header)

        var yOffset = startY + 42

        for (idx, topic) in topics.enumerated() {
            // Use a UIButton so taps are easy to handle; tag = 1000 + topicId
            let card = UIButton(type: .system)
            card.frame = CGRect(x: sideInset, y: yOffset, width: cardW, height: cardH)
            card.backgroundColor = UIColor.white.withAlphaComponent(0.10)
            card.layer.cornerRadius = 18
            card.layer.borderColor = UIColor(red: 1.0, green: 0.84, blue: 0.2, alpha: 0.45).cgColor
            card.layer.borderWidth = 1.5
            card.clipsToBounds = true
            card.tag = 1000 + topicIds[idx]
            card.addTarget(self, action: #selector(didTapCompletedTopic(_:)), for: .touchUpInside)
            container.addSubview(card)

            // SF Symbol icon
            let iconCfg = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
            let iconView = UIImageView()
            if let customImg = UIImage(named: "q_eng_\(topicIds[idx])") {
                iconView.image = customImg
                iconView.tintColor = nil
            } else {
                iconView.image = UIImage(systemName: topic.iconSystemName, withConfiguration: iconCfg)
                iconView.tintColor = UIColor(red: 1.0, green: 0.84, blue: 0.2, alpha: 0.9)
            }
            iconView.contentMode = .scaleAspectFit
            iconView.frame = CGRect(x: 14, y: (cardH - 26) / 2, width: 26, height: 26)
            iconView.isUserInteractionEnabled = false
            card.addSubview(iconView)

            // Topic name
            let nameLabel = UILabel()
            nameLabel.text = topic.nodeTitle
            nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
            nameLabel.textColor = UIColor.white.withAlphaComponent(0.90)
            nameLabel.frame = CGRect(x: 50, y: cardH / 2 - 19, width: cardW - 100, height: 19)
            nameLabel.isUserInteractionEnabled = false
            card.addSubview(nameLabel)

            // Grade label
            let gradeLabel = UILabel()
            gradeLabel.text = topic.gradeLabel
            gradeLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            gradeLabel.textColor = UIColor.white.withAlphaComponent(0.55)
            gradeLabel.frame = CGRect(x: 50, y: cardH / 2 + 2, width: cardW - 100, height: 15)
            gradeLabel.isUserInteractionEnabled = false
            card.addSubview(gradeLabel)

            // Green checkmark badge
            let checkBadge = UILabel()
            checkBadge.text = "✓"
            checkBadge.font = UIFont.boldSystemFont(ofSize: 15)
            checkBadge.textColor = UIColor(red: 0.2, green: 0.9, blue: 0.4, alpha: 1.0)
            checkBadge.textAlignment = .center
            checkBadge.backgroundColor = UIColor(red: 0.2, green: 0.9, blue: 0.4, alpha: 0.18)
            checkBadge.layer.cornerRadius = 14
            checkBadge.clipsToBounds = true
            let bSize: CGFloat = 30
            checkBadge.frame = CGRect(x: cardW - bSize - 12, y: (cardH - bSize) / 2,
                                      width: bSize, height: bSize)
            checkBadge.isUserInteractionEnabled = false
            card.addSubview(checkBadge)

            yOffset += cardH + 10
        }
    }

    /// Returns sorted list of topic IDs the user has passed (exam completed).
    private func completedTopicIdsSorted() -> [Int] {
        let defaults = UserDefaults.standard
        let stored = defaults.array(forKey: completedTopicsKey) as? [Int] ?? []
        if !stored.isEmpty { return stored.sorted() }

        // Fallback for users who advanced before this feature existed:
        // treat all available topics from the diagnostic start up to (not including)
        // the current topic as completed.
        let start = max(defaults.integer(forKey: startTopicKey), 1)
        let current = currentTopicId()
        guard current > start else { return [] }
        let computed = EnglishGameData.availableTopicIds().filter { $0 >= start && $0 < current }
        if !computed.isEmpty {
            defaults.set(computed, forKey: completedTopicsKey)
        }
        return computed
    }

    // MARK: - Locked / coming-soon topics section

    private func addLockedTopicsSection(to container: UIView, startY: CGFloat,
                                        topics: [EngTopicDefinition], cardH: CGFloat) {
        let sideInset: CGFloat = 20
        let cardW = container.bounds.width - sideInset * 2

        let header = UILabel()
        header.text = "More Adventures Coming Soon"
        header.font = UIFont.boldSystemFont(ofSize: 15)
        header.textColor = UIColor.white.withAlphaComponent(0.70)
        header.textAlignment = .center
        header.frame = CGRect(x: sideInset, y: startY + 16, width: cardW, height: 22)
        container.addSubview(header)

        let line = UIView()
        line.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        line.frame = CGRect(x: sideInset + 24, y: startY + 46, width: cardW - 48, height: 1)
        container.addSubview(line)

        var yOffset = startY + 58

        for topic in topics {
            let card = UIView()
            card.frame = CGRect(x: sideInset, y: yOffset, width: cardW, height: cardH)
            card.backgroundColor = UIColor.black.withAlphaComponent(0.30)
            card.layer.cornerRadius = 18
            card.layer.borderColor = UIColor.white.withAlphaComponent(0.10).cgColor
            card.layer.borderWidth = 1
            card.clipsToBounds = true
            container.addSubview(card)

            let iconConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .semibold)
            let iconView = UIImageView()
            if let customImg = UIImage(named: "q_eng_\(topic.id)") {
                iconView.image = customImg
                iconView.tintColor = nil
            } else {
                iconView.image = UIImage(systemName: topic.iconSystemName, withConfiguration: iconConfig)
                iconView.tintColor = UIColor.white.withAlphaComponent(0.40)
            }
            iconView.contentMode = .scaleAspectFit
            iconView.frame = CGRect(x: 16, y: (cardH - 30) / 2, width: 30, height: 30)
            card.addSubview(iconView)

            let nameLabel = UILabel()
            nameLabel.text = topic.nodeTitle
            nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            nameLabel.textColor = UIColor.white.withAlphaComponent(0.50)
            nameLabel.frame = CGRect(x: 56, y: (cardH - 22) / 2, width: cardW - 106, height: 22)
            card.addSubview(nameLabel)

            let badge = UILabel()
            badge.text = "Soon"
            badge.font = UIFont.boldSystemFont(ofSize: 11)
            badge.textColor = UIColor.white.withAlphaComponent(0.50)
            badge.textAlignment = .center
            badge.backgroundColor = UIColor.white.withAlphaComponent(0.12)
            badge.layer.cornerRadius = 9
            badge.clipsToBounds = true
            let badgeW: CGFloat = 46
            let badgeH: CGFloat = 22
            badge.frame = CGRect(x: cardW - badgeW - 12, y: (cardH - badgeH) / 2,
                                 width: badgeW, height: badgeH)
            card.addSubview(badge)

            yOffset += cardH + 10
        }

        let footer = UILabel()
        footer.text = "🌟 New topics unlock as you progress"
        footer.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        footer.textColor = UIColor.white.withAlphaComponent(0.45)
        footer.textAlignment = .center
        footer.frame = CGRect(x: sideInset, y: yOffset + 12, width: cardW, height: 20)
        container.addSubview(footer)
    }

    private func layoutQuestNodes() {
        guard let cv = programmaticContentView,
              cv.bounds.width > 0, questSectionHeight > 0 else { return }

        for (index, point) in nodePositions.enumerated() {
            guard index < nodeButtons.count, index < nodeGlowViews.count else { continue }

            let centerX = cv.bounds.width * point.x
            // Offset by completedSectionHeight so nodes sit inside the quest band
            let centerY = completedSectionHeight + questSectionHeight * point.y

            nodeGlowViews[index].frame = CGRect(
                x: centerX - glowSize / 2,
                y: centerY - glowSize / 2,
                width: glowSize,
                height: glowSize
            )

            nodeButtons[index].frame = CGRect(
                x: centerX - nodeSize / 2,
                y: centerY - nodeSize / 2,
                width: nodeSize,
                height: nodeSize
            )

            cv.bringSubviewToFront(nodeGlowViews[index])
            cv.bringSubviewToFront(nodeButtons[index])
        }
    }

    // MARK: - Header

    private func refreshHeader() {
        let shownXP = Session.shared.currentUser?.xp ?? 0

        usernameLabel.text = Session.shared.currentUser?.username ?? "radka"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        xpLabel.text = "\(shownXP) XP"
        xpProgress.progress = min(Float(shownXP % 500) / 500.0, 1.0)

        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)
    }

    // MARK: - Node states

    private func refreshNodeStates() {
        guard !nodeButtons.isEmpty else { return }

        let unlocked = max(UserDefaults.standard.integer(forKey: practiceUnlockedKey), 1)
        let completed = Set(UserDefaults.standard.array(forKey: practiceCompletedKey) as? [Int] ?? [])

        for (index, button) in nodeButtons.enumerated() {
            let questNumber = index + 1

            if completed.contains(questNumber) {
                button.titleLabel?.numberOfLines = 2
                button.titleLabel?.lineBreakMode = .byWordWrapping
                let bigAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 20),
                    .foregroundColor: UIColor.white
                ]
                let smallAttr: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 9, weight: .semibold),
                    .foregroundColor: UIColor.white.withAlphaComponent(0.9)
                ]
                let attrStr = NSMutableAttributedString(string: "✓\n", attributes: bigAttr)
                attrStr.append(NSAttributedString(string: "↺ play", attributes: smallAttr))
                button.setAttributedTitle(attrStr, for: .normal)
                button.backgroundColor = UIColor(red: 88/255, green: 196/255, blue: 96/255, alpha: 0.95)
                button.layer.borderColor = UIColor.white.withAlphaComponent(0.85).cgColor
                button.isEnabled = true
                nodeGlowViews[index].backgroundColor = UIColor.green.withAlphaComponent(0.22)
                nodeGlowViews[index].alpha = 1

            } else if questNumber <= unlocked {
                button.setAttributedTitle(nil, for: .normal)
                button.titleLabel?.numberOfLines = 1
                button.setTitle("\(questNumber)", for: .normal)
                button.backgroundColor = nodePurple.withAlphaComponent(0.94)
                button.layer.borderColor = UIColor.white.withAlphaComponent(0.75).cgColor
                button.isEnabled = true
                nodeGlowViews[index].backgroundColor = nodePurple.withAlphaComponent(0.18)
                nodeGlowViews[index].alpha = 1

            } else {
                button.setAttributedTitle(nil, for: .normal)
                button.titleLabel?.numberOfLines = 1
                button.setTitle("🔒", for: .normal)
                button.backgroundColor = UIColor.black.withAlphaComponent(0.30)
                button.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
                button.isEnabled = false
                nodeGlowViews[index].alpha = 0
            }
        }
    }

    // MARK: - Navigation

    private func currentTopicId() -> Int {
        let saved = UserDefaults.standard.integer(forKey: currentTopicKey)
        if saved > 0 && EnglishGameData.hasQuestions(for: saved) {
            return saved
        }

        let start = max(UserDefaults.standard.integer(forKey: startTopicKey), 1)
        let available = EnglishGameData.availableTopicIds()
        let fallback = available.first(where: { $0 >= start }) ?? available.first ?? 1
        UserDefaults.standard.set(fallback, forKey: currentTopicKey)
        return fallback
    }

    private func presentDiagnosticIfNeeded() {
        let hasDoneDiagnostic = UserDefaults.standard.bool(forKey: diagnosticDoneKey)
        guard !hasDoneDiagnostic else { return }
        let vc = EngDiagnosticViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapLevel(_ sender: UIButton) {
        let questNumber = max(1, sender.tag)
        let unlocked = max(UserDefaults.standard.integer(forKey: practiceUnlockedKey), 1)
        guard questNumber <= unlocked else { return }

        let topicId = currentTopicId()
        let completed = Set(UserDefaults.standard.array(forKey: practiceCompletedKey) as? [Int] ?? [])

        if questNumber == 1 && !completed.contains(1) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "TopicIntroViewController")
                as? TopicIntroViewController {
                vc.subject = "English"
                vc.topicId = topicId
                vc.mapQuestNumber = 1
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if questNumber == 1 && completed.contains(1) {
            // Replay quest 1 — go straight to interactive questions
            let vc = EngInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 1
            navigationController?.pushViewController(vc, animated: true)
        } else if questNumber == 2 {
            let vc = EngInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 2
            navigationController?.pushViewController(vc, animated: true)
        } else if questNumber == 3 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ExamQuestViewController")
                as? ExamQuestViewController {
                vc.subject = "English"
                vc.topicId = topicId
                vc.mapQuestNumber = 3
                vc.isPracticeMode = true
                vc.practiceQuestNumber = 3
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if questNumber == 4 {
            // Quest 4: equation-format MCQ warm-up before the exam
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ExamQuestViewController")
                as? ExamQuestViewController {
                vc.subject = "English"
                vc.topicId = topicId
                vc.mapQuestNumber = 4
                vc.isPracticeMode = true
                vc.practiceQuestNumber = 4
                navigationController?.pushViewController(vc, animated: true)
            }
        } else if questNumber == 5 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ExamQuestViewController")
                as? ExamQuestViewController {
                vc.subject = "English"
                vc.topicId = topicId
                vc.mapQuestNumber = 5
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    @objc private func didTapCompletedTopic(_ sender: UIButton) {
        let topicId = sender.tag - 1000
        guard topicId > 0, let _ = EnglishGameData.topic(for: topicId) else { return }

        if let vc = storyboard?.instantiateViewController(withIdentifier: "TopicIntroViewController")
            as? TopicIntroViewController {
            vc.subject = "English"
            vc.topicId = topicId
            vc.mapQuestNumber = 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // MARK: - Topic unlock animation

    private func showTopicUnlockAnimation(for topicId: Int) {
        guard let topic = EnglishGameData.topic(for: topicId) else { return }

        //  -  Full-screen backdrop (purple/violet overlay)
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor(red: 0.10, green: 0.04, blue: 0.22, alpha: 0.96)
        overlay.alpha = 0
        view.addSubview(overlay)

        //  -  Lock emoji (will shake then transform to open lock)
        let lockLabel = UILabel()
        lockLabel.text = "🔒"
        lockLabel.font = UIFont.systemFont(ofSize: 88)
        lockLabel.textAlignment = .center
        lockLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(lockLabel)

        //  -  Sparkle burst (hidden until lock opens)
        let sparkLabel = UILabel()
        sparkLabel.text = "✨  ✨  ✨"
        sparkLabel.font = UIFont.systemFont(ofSize: 28)
        sparkLabel.textAlignment = .center
        sparkLabel.alpha = 0
        sparkLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(sparkLabel)

        //  -  "UNLOCKED!" heading
        let unlockedLabel = UILabel()
        unlockedLabel.text = "UNLOCKED!"
        unlockedLabel.font = UIFont.boldSystemFont(ofSize: 40)
        unlockedLabel.textColor = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1)
        unlockedLabel.textAlignment = .center
        unlockedLabel.alpha = 0
        unlockedLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        unlockedLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(unlockedLabel)

        //  -  Topic icon
        let iconCfg = UIImage.SymbolConfiguration(pointSize: 36, weight: .bold)
        let iconView = UIImageView()
        if let customImg = UIImage(named: "q_eng_\(topicId)") {
            iconView.image = customImg
            iconView.tintColor = nil
        } else {
            iconView.image = UIImage(systemName: topic.iconSystemName, withConfiguration: iconCfg)
            iconView.tintColor = .white
        }
        iconView.contentMode = .scaleAspectFit
        iconView.alpha = 0
        iconView.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(iconView)

        //  -  Topic name
        let topicLabel = UILabel()
        topicLabel.text = topic.nodeTitle
        topicLabel.font = UIFont.boldSystemFont(ofSize: 30)
        topicLabel.textColor = .white
        topicLabel.textAlignment = .center
        topicLabel.alpha = 0
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(topicLabel)

        //  -  Grade subtitle
        let gradeLabel = UILabel()
        gradeLabel.text = topic.gradeLabel
        gradeLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        gradeLabel.textColor = UIColor.white.withAlphaComponent(0.60)
        gradeLabel.textAlignment = .center
        gradeLabel.alpha = 0
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(gradeLabel)

        //  -  "Tap to continue" hint
        let hintLabel = UILabel()
        hintLabel.text = "Tap to continue"
        hintLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        hintLabel.textColor = UIColor.white.withAlphaComponent(0.35)
        hintLabel.textAlignment = .center
        hintLabel.alpha = 0
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        overlay.addSubview(hintLabel)

        NSLayoutConstraint.activate([
            lockLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            lockLabel.centerYAnchor.constraint(equalTo: overlay.centerYAnchor, constant: -90),

            sparkLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            sparkLabel.centerYAnchor.constraint(equalTo: lockLabel.centerYAnchor),

            unlockedLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            unlockedLabel.topAnchor.constraint(equalTo: lockLabel.bottomAnchor, constant: 18),

            iconView.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            iconView.topAnchor.constraint(equalTo: unlockedLabel.bottomAnchor, constant: 22),
            iconView.widthAnchor.constraint(equalToConstant: 52),
            iconView.heightAnchor.constraint(equalToConstant: 52),

            topicLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            topicLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            topicLabel.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 24),
            topicLabel.trailingAnchor.constraint(equalTo: overlay.trailingAnchor, constant: -24),

            gradeLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            gradeLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 6),

            hintLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            hintLabel.bottomAnchor.constraint(equalTo: overlay.bottomAnchor, constant: -56)
        ])

        //  -  Dismiss handler (tap or auto after 4 s)
        var dismissed = false
        let dismiss: () -> Void = {
            guard !dismissed else { return }
            dismissed = true
            UIView.animate(withDuration: 0.35, animations: { overlay.alpha = 0 }) { _ in
                overlay.removeFromSuperview()
            }
        }
        self.dismissUnlockOverlay = dismiss

        overlay.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleUnlockOverlayTap))
        )

        //  -  Animation sequence
        // 1. Fade in backdrop
        UIView.animate(withDuration: 0.35) { overlay.alpha = 1 } completion: { _ in

            // 2. Shake the lock (CAKeyframeAnimation for a chain-rattle feel)
            let shake = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            shake.values   = [0, -0.30, 0.30, -0.22, 0.22, -0.12, 0.12, 0]
            shake.duration = 0.72
            shake.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            lockLabel.layer.add(shake, forKey: "shake")

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {

                // 3. Lock explodes open: scale up + fade out, then swap to 🔓 + sparkles
                UIView.animate(withDuration: 0.22) {
                    lockLabel.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
                    lockLabel.alpha = 0
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    lockLabel.text = "🔓"
                    lockLabel.transform = .identity
                    lockLabel.alpha = 1

                    // Sparkle burst
                    UIView.animate(withDuration: 0.30) {
                        sparkLabel.alpha = 1
                        sparkLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    }

                    // 4. "UNLOCKED!" springs in
                    UIView.animate(
                        withDuration: 0.45, delay: 0.1,
                        usingSpringWithDamping: 0.60, initialSpringVelocity: 0.8
                    ) {
                        unlockedLabel.alpha = 1
                        unlockedLabel.transform = .identity
                    }

                    // 5. Topic info slides in
                    UIView.animate(
                        withDuration: 0.38, delay: 0.30,
                        options: [.curveEaseOut]
                    ) {
                        iconView.alpha  = 1
                        topicLabel.alpha = 1
                        gradeLabel.alpha = 1
                    }

                    // 6. Hint appears
                    UIView.animate(withDuration: 0.30, delay: 0.70, options: []) {
                        hintLabel.alpha = 1
                    }

                    // Auto-dismiss after 4 s
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { dismiss() }
                }
            }
        }
    }

    @objc private func handleUnlockOverlayTap() {
        dismissUnlockOverlay?()
        dismissUnlockOverlay = nil
    }

    // MARK: - Back button

    private func addBackButton() {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.30)
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        view.addSubview(btn)
        backBtn = btn

        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            btn.widthAnchor.constraint(equalToConstant: 36),
            btn.heightAnchor.constraint(equalToConstant: 36)
        ])
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
