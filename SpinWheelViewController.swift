import UIKit

// MARK: - Prize model

struct WheelPrize {
    let label: String
    let emoji: String
    let xpValue: Int          // 0 = non-XP prize
    let isSpecial: Bool
    let color: UIColor
}

// MARK: - SpinWheelViewController

final class SpinWheelViewController: UIViewController {

    // MARK: Prizes (8 segments)
    private let prizes: [WheelPrize] = [
        WheelPrize(label: "+10 XP",        emoji: "⚡️", xpValue: 10,  isSpecial: false, color: UIColor(red: 0.12, green: 0.46, blue: 0.92, alpha: 1)),
        WheelPrize(label: "Rare Badge",    emoji: "🏅", xpValue: 0,   isSpecial: true,  color: UIColor(red: 0.98, green: 0.72, blue: 0.01, alpha: 1)),
        WheelPrize(label: "+50 XP",        emoji: "⚡️", xpValue: 50,  isSpecial: false, color: UIColor(red: 0.06, green: 0.73, blue: 0.45, alpha: 1)),
        WheelPrize(label: "Avatar Unlock", emoji: "🦸", xpValue: 0,   isSpecial: true,  color: UIColor(red: 0.55, green: 0.08, blue: 0.83, alpha: 1)),
        WheelPrize(label: "+25 XP",        emoji: "⚡️", xpValue: 25,  isSpecial: false, color: UIColor(red: 0.04, green: 0.76, blue: 0.92, alpha: 1)),
        WheelPrize(label: "Mystery Box",   emoji: "🎁", xpValue: 0,   isSpecial: true,  color: UIColor(red: 0.95, green: 0.22, blue: 0.38, alpha: 1)),
        WheelPrize(label: "+100 XP",       emoji: "⚡️", xpValue: 100, isSpecial: false, color: UIColor(red: 0.06, green: 0.73, blue: 0.45, alpha: 1)),
        WheelPrize(label: "+5 XP",         emoji: "⚡️", xpValue: 5,   isSpecial: false, color: UIColor(red: 0.98, green: 0.50, blue: 0.05, alpha: 1)),
    ]

    // MARK: State
    private var isSpinning = false
    private var currentAngle: CGFloat = 0      // total rotation so far (radians)

    private var canSpinToday: Bool {
        guard let last = UserDefaults.standard.object(forKey: "last_spin_date") as? Date else { return true }
        return !Calendar.current.isDateInToday(last)
    }

    // MARK: UI
    private let wheelView   = WheelView()
    private let pointerView = UIImageView()
    private let spinButton  = UIButton(type: .custom)
    private let titleLabel  = UILabel()
    private let subtitleLabel = UILabel()
    private let closeButton = UIButton(type: .system)
    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        applyBackground()
        buildUI()
        applyDailySpinState()
    }

    private func applyDailySpinState() {
        if !canSpinToday {
            spinButton.isEnabled = false
            spinButton.alpha = 0.5
            spinButton.setTitle("Come back tomorrow 🌙", for: .normal)
            subtitleLabel.text = "You've already spun today. See you tomorrow!"
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Background

    private func applyBackground() {
        gradientLayer.colors = [
            UIColor(red: 8/255,  green: 20/255, blue: 60/255,  alpha: 1).cgColor,
            UIColor(red: 20/255, green: 60/255, blue: 100/255, alpha: 1).cgColor,
            UIColor(red: 5/255,  green: 15/255, blue: 45/255,  alpha: 1).cgColor,
        ]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.7, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - UI

    private func buildUI() {
        // Close button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = UIColor.white.withAlphaComponent(0.8)
        closeButton.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        closeButton.layer.cornerRadius = 18
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        view.addSubview(closeButton)

        // Title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Daily Spin"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        // Subtitle
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Spin for XP and rare prizes!"
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subtitleLabel.textAlignment = .center
        view.addSubview(subtitleLabel)

        // Wheel
        wheelView.translatesAutoresizingMaskIntoConstraints = false
        wheelView.prizes = prizes
        wheelView.backgroundColor = .clear
        view.addSubview(wheelView)

        // Pointer (triangle pointing down at top-center of wheel)
        pointerView.translatesAutoresizingMaskIntoConstraints = false
        pointerView.image = makePointerImage()
        pointerView.contentMode = .scaleAspectFit
        view.addSubview(pointerView)

        // Spin button
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        spinButton.setTitle("SPIN!", for: .normal)
        spinButton.setTitleColor(.white, for: .normal)
        spinButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        spinButton.titleLabel?.adjustsFontSizeToFitWidth = true
        spinButton.titleLabel?.minimumScaleFactor = 0.7
        spinButton.backgroundColor = UIColor(red: 0.95, green: 0.61, blue: 0.07, alpha: 1)
        spinButton.layer.cornerRadius = 28
        spinButton.layer.shadowColor = UIColor(red: 0.95, green: 0.61, blue: 0.07, alpha: 1).cgColor
        spinButton.layer.shadowRadius = 14
        spinButton.layer.shadowOpacity = 0.55
        spinButton.layer.shadowOffset = .zero
        spinButton.addTarget(self, action: #selector(didTapSpin), for: .touchUpInside)
        view.addSubview(spinButton)

        // Layout  -  wheel is centered on screen, title floats above, button below
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 36),
            closeButton.heightAnchor.constraint(equalToConstant: 36),

            // Wheel exactly at screen center
            wheelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wheelView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            wheelView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            wheelView.heightAnchor.constraint(equalTo: wheelView.widthAnchor),

            // Pointer just above wheel
            pointerView.centerXAnchor.constraint(equalTo: wheelView.centerXAnchor),
            pointerView.bottomAnchor.constraint(equalTo: wheelView.topAnchor, constant: 16),
            pointerView.widthAnchor.constraint(equalToConstant: 34),
            pointerView.heightAnchor.constraint(equalToConstant: 40),

            // Title pinned to top of screen
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),

            // Subtitle just below title
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),

            // Spin button below wheel
            spinButton.topAnchor.constraint(equalTo: wheelView.bottomAnchor, constant: 32),
            spinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinButton.widthAnchor.constraint(equalToConstant: 180),
            spinButton.heightAnchor.constraint(equalToConstant: 58),
        ])
    }

    // MARK: - Pointer image

    private func makePointerImage() -> UIImage {
        let size = CGSize(width: 30, height: 36)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { ctx in
            let path = UIBezierPath()
            path.move(to: CGPoint(x: size.width / 2, y: size.height))   // tip (pointing down)
            path.addLine(to: CGPoint(x: 0,            y: 0))
            path.addLine(to: CGPoint(x: size.width,   y: 0))
            path.close()

            UIColor(red: 0.95, green: 0.61, blue: 0.07, alpha: 1).setFill()
            path.fill()

            UIColor.white.withAlphaComponent(0.4).setStroke()
            path.lineWidth = 1.5
            path.stroke()
        }
    }

    // MARK: - Spin

    @objc private func didTapSpin() {
        guard !isSpinning, canSpinToday else { return }
        isSpinning = true
        spinButton.isEnabled = false
        UserDefaults.standard.set(Date(), forKey: "last_spin_date")

        // Pick a winning segment index
        let winnerIndex = Int.random(in: 0..<prizes.count)

        // How many full rotations + land on winner
        let segmentAngle = (2 * CGFloat.pi) / CGFloat(prizes.count)
        let fullRotations = CGFloat.random(in: 5...8) * 2 * CGFloat.pi

        // Angle to land: winner segment mid-point should end at top (π*1.5 from right = 270°)
        // Wheel starts at angle 0 = right. Top = -π/2 = pointer at top-center.
        let winnerMidAngle = segmentAngle * CGFloat(winnerIndex) + segmentAngle / 2
        let targetAngle    = fullRotations - winnerMidAngle + (3 * CGFloat.pi / 2)

        let totalRotation  = targetAngle - currentAngle.truncatingRemainder(dividingBy: 2 * CGFloat.pi)
        let finalAngle     = currentAngle + totalRotation

        // CABasicAnimation (ease-out deceleration)
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = currentAngle
        anim.toValue   = finalAngle
        anim.duration  = 4.5
        anim.timingFunction = CAMediaTimingFunction(name: .easeOut)
        anim.fillMode  = .forwards
        anim.isRemovedOnCompletion = false

        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self else { return }
            self.currentAngle = finalAngle
            self.wheelView.layer.transform = CATransform3DMakeRotation(finalAngle, 0, 0, 1)
            self.wheelView.layer.removeAllAnimations()
            self.isSpinning = false
            // Keep button disabled  -  only one spin per day
            self.spinButton.isEnabled = false
            self.spinButton.alpha = 0.5
            self.spinButton.setTitle("Come back tomorrow! 🌙", for: .normal)
            self.showResult(prize: self.prizes[winnerIndex])
        }

        wheelView.layer.add(anim, forKey: "spin")
        CATransaction.commit()

        // Bounce the button
        UIView.animate(withDuration: 0.1, animations: {
            self.spinButton.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.spinButton.transform = .identity
            }
        }
    }

    // MARK: - Result

    private func showResult(prize: WheelPrize) {
        // Award XP via Session so Supabase sync + level-up fire correctly
        if prize.xpValue > 0 {
            Session.shared.addXP(prize.xpValue)
        }

        // Special prize effects
        if prize.isSpecial {
            if prize.label == "Avatar Unlock" {
                awardRandomAvatar()
            } else if prize.label == "Rare Badge" {
                awardRandomBadge()
            }
        }

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0)
        view.addSubview(overlay)

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let card = buildResultCard(prize: prize)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        overlay.addSubview(card)

        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 280),
        ])

        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) {
            overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            card.alpha = 1
            card.transform = .identity
        }

        // Dismiss overlay on tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay(_:)))
        overlay.addGestureRecognizer(tap)
        overlay.tag = 8888
    }

    // MARK: - Special prize helpers

    private func awardRandomAvatar() {
        let allAvatars = [
            "avatar_warrior_1","avatar_warrior_2","avatar_warrior_3",
            "avatar_cowboy_1","avatar_cowboy_2","avatar_cowboy_3",
            "avatar_princess_1","avatar_princess_2","avatar_princess_3",
            "avatar_mage_1","avatar_mage_2","avatar_mage_3"
        ]
        let current = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? ""
        let candidates = allAvatars.filter { $0 != current }
        if let winner = candidates.randomElement() {
            UserDefaults.standard.set(winner, forKey: "selected_avatar_name")
        }
    }

    private func awardRandomBadge() {
        let earned = BadgeManager.shared.earnedBadgeIds
        let unearned = BadgeDefinition.all.filter { !earned.contains($0.id) }
        guard let badge = unearned.randomElement() else { return }
        // Force-award by inserting directly  -  bypasses condition check intentionally
        var updated = BadgeManager.shared.earnedBadgeIds
        updated.insert(badge.id)
        BadgeManager.shared.earnedBadgeIds = updated
    }

    private func buildResultCard(prize: WheelPrize) -> UIView {
        let card = UIView()
        card.backgroundColor = UIColor(red: 0.08, green: 0.15, blue: 0.30, alpha: 1)
        card.layer.cornerRadius = 24
        card.layer.borderWidth  = 1.5
        card.layer.borderColor  = prize.color.withAlphaComponent(0.7).cgColor
        card.clipsToBounds = true

        // Top color bar
        let bar = UIView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = prize.color
        bar.heightAnchor.constraint(equalToConstant: 5).isActive = true

        // Emoji label
        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = prize.emoji
        emojiLabel.font = UIFont.systemFont(ofSize: 56)
        emojiLabel.textAlignment = .center

        // You won label
        let wonLabel = UILabel()
        wonLabel.translatesAutoresizingMaskIntoConstraints = false
        wonLabel.text = "YOU WON!"
        wonLabel.textColor = prize.color
        wonLabel.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        wonLabel.textAlignment = .center
        wonLabel.letterSpacing(1.5)

        // Prize label
        let prizeLabel = UILabel()
        prizeLabel.translatesAutoresizingMaskIntoConstraints = false
        prizeLabel.text = prize.label
        prizeLabel.textColor = .white
        prizeLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        prizeLabel.textAlignment = .center

        // Description
        let descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        if prize.xpValue > 0 {
            descLabel.text = "+\(prize.xpValue) XP added to your total!"
        } else {
            descLabel.text = prize.isSpecial ? "Rare prize unlocked 🎉" : "Nice reward!"
        }
        descLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        descLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        descLabel.textAlignment = .center

        // Claim button
        let claimButton = UIButton(type: .custom)
        claimButton.translatesAutoresizingMaskIntoConstraints = false
        claimButton.setTitle("Awesome! 🎉", for: .normal)
        claimButton.setTitleColor(.white, for: .normal)
        claimButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        claimButton.backgroundColor = prize.color
        claimButton.layer.cornerRadius = 14
        claimButton.addTarget(self, action: #selector(didTapClaimResult), for: .touchUpInside)

        // Assemble
        card.addSubview(bar)
        card.addSubview(emojiLabel)
        card.addSubview(wonLabel)
        card.addSubview(prizeLabel)
        card.addSubview(descLabel)
        card.addSubview(claimButton)

        bar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bar.topAnchor.constraint(equalTo: card.topAnchor),
            bar.leadingAnchor.constraint(equalTo: card.leadingAnchor),
            bar.trailingAnchor.constraint(equalTo: card.trailingAnchor),

            emojiLabel.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 24),
            emojiLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            wonLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 12),
            wonLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            prizeLabel.topAnchor.constraint(equalTo: wonLabel.bottomAnchor, constant: 4),
            prizeLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            prizeLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            descLabel.topAnchor.constraint(equalTo: prizeLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            claimButton.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 24),
            claimButton.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            claimButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),
            claimButton.heightAnchor.constraint(equalToConstant: 48),
            claimButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24),
        ])

        return card
    }

    @objc private func didTapOverlay(_ sender: UITapGestureRecognizer) {
        dismissOverlay()
    }

    @objc private func didTapClaimResult() {
        dismissOverlay()
    }

    private func dismissOverlay() {
        guard let overlay = view.subviews.first(where: { $0.tag == 8888 }) else { return }
        UIView.animate(withDuration: 0.2, animations: {
            overlay.alpha = 0
        }) { _ in
            overlay.removeFromSuperview()
        }
    }

    @objc private func didTapClose() {
        dismiss(animated: true)
    }
}

// MARK: - WheelView

final class WheelView: UIView {

    var prizes: [WheelPrize] = [] {
        didSet { setNeedsDisplay() }
    }

    override func draw(_ rect: CGRect) {
        guard !prizes.isEmpty, let ctx = UIGraphicsGetCurrentContext() else { return }

        let center     = CGPoint(x: rect.midX, y: rect.midY)
        let radius     = min(rect.width, rect.height) / 2 - 4
        let count      = CGFloat(prizes.count)
        let segAngle   = (2 * CGFloat.pi) / count

        // Outer ring shadow
        ctx.setShadow(offset: .zero, blur: 20, color: UIColor.black.withAlphaComponent(0.6).cgColor)

        for (i, prize) in prizes.enumerated() {
            let startAngle = segAngle * CGFloat(i) - CGFloat.pi / 2
            let endAngle   = startAngle + segAngle

            // Segment fill
            let path = UIBezierPath()
            path.move(to: center)
            path.addArc(withCenter: center, radius: radius,
                        startAngle: startAngle, endAngle: endAngle, clockwise: true)
            path.close()

            prize.color.setFill()
            path.fill()

            // Divider line
            ctx.setShadow(offset: .zero, blur: 0, color: UIColor.clear.cgColor)
            UIColor.white.withAlphaComponent(0.25).setStroke()
            path.lineWidth = 1.5
            path.stroke()

            // Emoji + text label
            let midAngle = startAngle + segAngle / 2
            let labelRadius = radius * 0.65
            let labelCenter = CGPoint(
                x: center.x + labelRadius * cos(midAngle),
                y: center.y + labelRadius * sin(midAngle)
            )

            ctx.saveGState()
            ctx.translateBy(x: labelCenter.x, y: labelCenter.y)
            ctx.rotate(by: midAngle + CGFloat.pi / 2)

            // Emoji
            let emojiAttr: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 26)
            ]
            let emojiStr = NSAttributedString(string: prize.emoji, attributes: emojiAttr)
            let emojiSize = emojiStr.size()
            emojiStr.draw(at: CGPoint(x: -emojiSize.width / 2, y: -emojiSize.height - 3))

            // Prize label
            let textAttr: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 13, weight: .heavy),
                .foregroundColor: UIColor.white
            ]
            let textStr  = NSAttributedString(string: prize.label, attributes: textAttr)
            let textSize = textStr.size()
            textStr.draw(at: CGPoint(x: -textSize.width / 2, y: 3))

            ctx.restoreGState()
        }

        // Center circle
        let centerCircle = UIBezierPath(arcCenter: center, radius: 22,
                                        startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        UIColor(red: 0.08, green: 0.15, blue: 0.30, alpha: 1).setFill()
        centerCircle.fill()
        UIColor.white.withAlphaComponent(0.3).setStroke()
        centerCircle.lineWidth = 2
        centerCircle.stroke()

        // Outer border ring
        let borderCircle = UIBezierPath(arcCenter: center, radius: radius + 3,
                                         startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        UIColor.white.withAlphaComponent(0.2).setStroke()
        borderCircle.lineWidth = 3
        borderCircle.stroke()
    }
}

// MARK: - UILabel helper

private extension UILabel {
    func letterSpacing(_ spacing: CGFloat) {
        guard let text else { return }
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.addAttribute(.kern, value: spacing,
                             range: NSRange(location: 0, length: attrStr.length - 1))
        attributedText = attrStr
    }
}
