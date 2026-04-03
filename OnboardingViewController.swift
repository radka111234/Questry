import UIKit

// MARK: - Delegate

/// Tells the presenting controller which tab to show behind each onboarding page.
protocol OnboardingPageDelegate: AnyObject {
    func onboarding(_ vc: OnboardingViewController, didChangeTo page: Int)
}

// MARK: - OnboardingViewController

class OnboardingViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Delegate
    weak var pageDelegate: OnboardingPageDelegate?

    // MARK: - Data

    private struct Page {
        let title: String
        let message: String
    }

    private let pages: [Page] = [
        Page(
            title: "Welcome to Questry! 🐉",
            message: "Hi, I'm Questry  -  your dragon guide! Together we'll explore magical worlds, answer questions, and become a true learning legend. Ready for your first quest?"
        ),
        Page(
            title: "Your Quest Map 🗺️",
            message: "This is your world map! Each island is a different subject  -  Math, English, Geography and more. Complete quests on each island to unlock new ones!"
        ),
        Page(
            title: "Earn XP & Level Up ⭐",
            message: "Every quest you complete earns you XP. Fill your XP bar to level up! The higher your level, the more powerful you become. I believe in you!"
        ),
        Page(
            title: "Daily Quests 📋",
            message: "Check your Daily Quests every day! Log in, answer questions, and complete lessons to earn bonus XP. Keep your streak alive 🔥  -  don't break the chain!"
        ),
        Page(
            title: "Badges & Rewards 🏅",
            message: "Earn badges for your achievements, spin the Daily Reward Wheel, and spend your XP in the shop for cool effects! Now  -  your adventure begins. Good luck, hero!"
        )
    ]

    // MARK: - UI Properties

    private let scrollView        = UIScrollView()
    private let dragonImageView   = UIImageView()
    private let bubbleCard        = UIView()
    private let bubbleTitleLabel  = UILabel()
    private let bubbleMessageLabel = UILabel()
    private let nextButton        = UIButton(type: .system)
    private let skipButton        = UIButton(type: .system)
    private var muteButton: UIButton?
    private var dotViews: [UIView] = []

    // Blur + dim layers shown behind everything
    private let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    private let dimView   = UIView()

    private var currentPage    = 0
    private var didLayoutPages = false

    // Animated constraint
    private var bubbleBottomConstraint: NSLayoutConstraint?
    private let bubbleTail = UIView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        setupBlurBackground()
        setupScrollView()
        setupDragon()
        setupBubble()
        setupDots()
        setupNextButton()
        setupSkipButton()
        setupMuteButton()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        QuestryAudioPlayer.shared.stop()
        DragonVoiceManager.shared.stop()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawBubbleTail()

        guard !didLayoutPages else { return }
        didLayoutPages = true
        layoutPages()
        updateDots(for: 0)
        updateBubble(for: 0, animated: false)

        // Tell parent to show the relevant tab for page 0
        pageDelegate?.onboarding(self, didChangeTo: 0)
    }

    // MARK: - Setup: Blur Background

    private func setupBlurBackground() {
        // Full visibility: no blur, no dim overlay  -  the app shows through completely
        blurView.effect = nil
        dimView.alpha   = 0
    }

    // MARK: - Setup: ScrollView

    private func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator   = false
        scrollView.delegate = self
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Setup: Dragon

    private func setupDragon() {
        dragonImageView.image       = UIImage(named: "dragon_logo")
        dragonImageView.contentMode = .scaleAspectFit
        dragonImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dragonImageView)

        NSLayoutConstraint.activate([
            dragonImageView.widthAnchor.constraint(equalToConstant: 200),
            dragonImageView.heightAnchor.constraint(equalToConstant: 200),
            dragonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dragonImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
    }

    // MARK: - Setup: Speech Bubble

    private func setupBubble() {
        // Card
        bubbleCard.backgroundColor    = .white
        bubbleCard.layer.cornerRadius  = 24
        bubbleCard.layer.shadowColor   = UIColor.black.cgColor
        bubbleCard.layer.shadowOpacity = 0.20
        bubbleCard.layer.shadowRadius  = 16
        bubbleCard.layer.shadowOffset  = CGSize(width: 0, height: 4)
        bubbleCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bubbleCard)

        // Title
        bubbleTitleLabel.font          = UIFont.boldSystemFont(ofSize: 22)
        bubbleTitleLabel.textColor     = .black
        bubbleTitleLabel.numberOfLines = 0
        bubbleTitleLabel.textAlignment = .center
        bubbleTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleCard.addSubview(bubbleTitleLabel)

        // Message
        bubbleMessageLabel.font          = UIFont.systemFont(ofSize: 16, weight: .medium)
        bubbleMessageLabel.textColor     = UIColor(white: 0.2, alpha: 1)
        bubbleMessageLabel.numberOfLines = 0
        bubbleMessageLabel.textAlignment = .center
        bubbleMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleCard.addSubview(bubbleMessageLabel)

        NSLayoutConstraint.activate([
            bubbleTitleLabel.topAnchor.constraint(equalTo: bubbleCard.topAnchor, constant: 20),
            bubbleTitleLabel.leadingAnchor.constraint(equalTo: bubbleCard.leadingAnchor, constant: 20),
            bubbleTitleLabel.trailingAnchor.constraint(equalTo: bubbleCard.trailingAnchor, constant: -20),

            bubbleMessageLabel.topAnchor.constraint(equalTo: bubbleTitleLabel.bottomAnchor, constant: 12),
            bubbleMessageLabel.leadingAnchor.constraint(equalTo: bubbleCard.leadingAnchor, constant: 20),
            bubbleMessageLabel.trailingAnchor.constraint(equalTo: bubbleCard.trailingAnchor, constant: -20),
            bubbleMessageLabel.bottomAnchor.constraint(equalTo: bubbleCard.bottomAnchor, constant: -20)
        ])

        // Tail
        bubbleTail.translatesAutoresizingMaskIntoConstraints = false
        bubbleTail.backgroundColor = .clear
        bubbleTail.isUserInteractionEnabled = false
        view.addSubview(bubbleTail)

        let bottomConstraint = bubbleCard.bottomAnchor.constraint(
            equalTo: dragonImageView.topAnchor, constant: -34
        )
        bubbleBottomConstraint = bottomConstraint

        NSLayoutConstraint.activate([
            bubbleCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            bubbleCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            bottomConstraint,

            bubbleTail.topAnchor.constraint(equalTo: bubbleCard.bottomAnchor),
            bubbleTail.centerXAnchor.constraint(equalTo: bubbleCard.centerXAnchor),
            bubbleTail.widthAnchor.constraint(equalToConstant: 28),
            bubbleTail.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    private func drawBubbleTail() {
        bubbleTail.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        let size = bubbleTail.bounds
        guard size.width > 0 else { return }

        let shape = CAShapeLayer()
        let path  = UIBezierPath()
        path.move(to:    CGPoint(x: 0,            y: 0))
        path.addLine(to: CGPoint(x: size.width,   y: 0))
        path.addLine(to: CGPoint(x: size.width/2, y: size.height))
        path.close()
        shape.path      = path.cgPath
        shape.fillColor = UIColor.white.cgColor
        bubbleTail.layer.addSublayer(shape)
    }

    // MARK: - Setup: Page Dots

    private func setupDots() {
        let stack = UIStackView()
        stack.axis      = .horizontal
        stack.spacing   = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        for _ in 0..<pages.count {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 5
            NSLayoutConstraint.activate([
                dot.widthAnchor.constraint(equalToConstant: 10),
                dot.heightAnchor.constraint(equalToConstant: 10)
            ])
            stack.addArrangedSubview(dot)
            dotViews.append(dot)
        }
    }

    // MARK: - Setup: Buttons

    private func setupNextButton() {
        let yellow = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1.0)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font     = UIFont.boldSystemFont(ofSize: 17)
        nextButton.backgroundColor      = yellow
        nextButton.layer.cornerRadius   = 22
        nextButton.contentEdgeInsets    = UIEdgeInsets(top: 12, left: 28, bottom: 12, right: 28)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44)
        ])
    }

    private func setupSkipButton() {
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        view.addSubview(skipButton)

        NSLayoutConstraint.activate([
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12)
        ])
    }

    private func setupMuteButton() {
        let btn = DragonVoiceManager.makeMuteButton(target: self, action: #selector(muteTapped))
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.widthAnchor.constraint(equalToConstant: 36),
            btn.heightAnchor.constraint(equalToConstant: 36)
        ])
        muteButton = btn
    }

    // MARK: - Page Layout

    private func layoutPages() {
        let width  = view.bounds.width
        let height = view.bounds.height
        scrollView.contentSize = CGSize(width: width * CGFloat(pages.count), height: height)

        for i in 0..<pages.count {
            let pageView = UIView()
            pageView.backgroundColor = .clear
            pageView.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height)
            scrollView.addSubview(pageView)
        }
    }

    // MARK: - Page Transition

    private func updateBubble(for index: Int, animated: Bool) {
        let page = pages[index]

        if animated {
            bubbleBottomConstraint?.constant = 30
            bubbleCard.alpha = 0
            bubbleTail.alpha = 0
            view.layoutIfNeeded()

            bubbleTitleLabel.text   = page.title
            bubbleMessageLabel.text = page.message

            bubbleBottomConstraint?.constant = -34
            UIView.animate(
                withDuration: 0.4, delay: 0,
                usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5,
                options: []
            ) {
                self.bubbleCard.alpha = 1
                self.bubbleTail.alpha = 1
                self.view.layoutIfNeeded()
            }
        } else {
            bubbleTitleLabel.text   = page.title
            bubbleMessageLabel.text = page.message
            bubbleBottomConstraint?.constant = -34
        }
    }

    private func animateDragonBounce() {
        dragonImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(
            withDuration: 0.25, delay: 0,
            usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8,
            options: []
        ) {
            self.dragonImageView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { _ in
            UIView.animate(withDuration: 0.15) {
                self.dragonImageView.transform = .identity
            }
        }
    }

    private func updateDots(for index: Int) {
        let activeColor   = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1.0)
        let inactiveColor = UIColor(white: 1, alpha: 0.3)
        for (i, dot) in dotViews.enumerated() {
            UIView.animate(withDuration: 0.25) {
                dot.backgroundColor = (i == index) ? activeColor : inactiveColor
            }
        }
    }

    private func updateNextButton(for index: Int) {
        let isLast = index == pages.count - 1
        UIView.transition(with: nextButton, duration: 0.2, options: .transitionCrossDissolve) {
            self.nextButton.setTitle(isLast ? "Let's go! ⚔️" : "Next", for: .normal)
        }
    }

    private func applyPageChange(to index: Int, animated: Bool) {
        updateDots(for: index)
        updateNextButton(for: index)
        updateBubble(for: index, animated: animated)
        if animated { animateDragonBounce() }

        // Tell parent to switch to relevant tab behind the overlay
        pageDelegate?.onboarding(self, didChangeTo: index)

        // Audio is only available in English; skip for other languages to avoid wrong-language TTS
        guard LanguageManager.shared.currentLanguage == .english else { return }

        // Play recorded voice-over; fall back to TTS if file is missing
        let delay = animated ? 0.45 : 0.6
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            QuestryAudioPlayer.shared.playOnboarding(page: index + 1)
            if !QuestryAudioPlayer.shared.isPlaying {
                DragonVoiceManager.shared.speak(self.pages[index].message)
            }
        }
    }

    // MARK: - Actions

    @objc private func nextTapped() {
        if currentPage == pages.count - 1 {
            completeOnboarding()
        } else {
            let nextIndex = currentPage + 1
            let offsetX = CGFloat(nextIndex) * view.bounds.width
            scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
            currentPage = nextIndex
            applyPageChange(to: currentPage, animated: true)
        }
    }

    @objc private func skipTapped() {
        completeOnboarding()
    }

    @objc private func muteTapped() {
        DragonVoiceManager.shared.toggleMute()
        if let btn = muteButton { DragonVoiceManager.refreshMuteButton(btn) }
        if DragonVoiceManager.shared.isMuted {
            QuestryAudioPlayer.shared.stop()
        } else {
            QuestryAudioPlayer.shared.playOnboarding(page: currentPage + 1)
            if !QuestryAudioPlayer.shared.isPlaying {
                DragonVoiceManager.shared.speak(pages[currentPage].message)
            }
        }
    }

    // MARK: - Complete

    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "onboarding_completed")
        dismiss(animated: true)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x / view.bounds.width))
        guard page != currentPage else { return }
        currentPage = page
        applyPageChange(to: currentPage, animated: true)
    }
}
