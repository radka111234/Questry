import UIKit

// MARK: - Data

struct BodyMatchItem {
    let id: String
    let name: String
    let imageName: String
}

// MARK: - BodyMatchingViewController

final class BodyMatchingViewController: UIViewController {

    // MARK: - Public config
    var isHardMode: Bool = false

    // MARK: - Data sets
    private let easyItems: [BodyMatchItem] = [
        .init(id: "eye",   name: "Eye",   imageName: "part_eye"),
        .init(id: "ear",   name: "Ear",   imageName: "part_ear"),
        .init(id: "nose",  name: "Nose",  imageName: "part_nose"),
        .init(id: "mouth", name: "Mouth", imageName: "part_mouth"),
        .init(id: "arm",   name: "Arm",   imageName: "part_arm"),
        .init(id: "leg",   name: "Leg",   imageName: "part_leg"),
        .init(id: "hand",  name: "Hand",  imageName: "part_hand"),
        .init(id: "foot",  name: "Foot",  imageName: "part_foot"),
    ]
    private let hardItems: [BodyMatchItem] = [
        .init(id: "heart",           name: "Heart",           imageName: "organ_heart"),
        .init(id: "lungs",           name: "Lungs",           imageName: "organ_lungs"),
        .init(id: "brain",           name: "Brain",           imageName: "organ_brain"),
        .init(id: "liver",           name: "Liver",           imageName: "organ_liver"),
        .init(id: "stomach",         name: "Stomach",         imageName: "organ_stomach"),
        .init(id: "kidneys",         name: "Kidneys",         imageName: "organ_kidneys"),
        .init(id: "small_intestine", name: "Small Intestine", imageName: "organ_small_intestine"),
        .init(id: "large_intestine", name: "Large Intestine", imageName: "organ_large_intestine"),
        .init(id: "bladder",         name: "Bladder",         imageName: "organ_bladder"),
        .init(id: "spleen",          name: "Spleen",          imageName: "organ_spleen"),
    ]
    private var allItems: [BodyMatchItem] { isHardMode ? hardItems : easyItems }

    // MARK: - Round state
    private let itemsPerRound = 4
    private var roundIndex   = 0          // which set of 4 we're on
    private var currentItems: [BodyMatchItem] = []
    private var shuffledImages: [BodyMatchItem] = []
    private var matched: Set<String> = []
    private var selectedNameId:  String? = nil
    private var selectedImageId: String? = nil
    private var totalMatched = 0

    // MARK: - Theme
    private let sciGreen  = UIColor(red: 0.10, green: 0.55, blue: 0.35, alpha: 1.0)
    private let cardBg    = UIColor(red: 0.10, green: 0.26, blue: 0.16, alpha: 1.0)
    private let darkBg    = UIColor(red: 0.04, green: 0.12, blue: 0.08, alpha: 1.0)

    // MARK: - UI
    private let gradientLayer  = CAGradientLayer()
    private let backBtn        = UIButton(type: .system)
    private let titleLabel     = UILabel()
    private let progressLabel  = UILabel()
    private let instructionLbl = UILabel()
    private let nameStack      = UIStackView()
    private let imageStack     = UIStackView()
    private var nameCards:  [UIView] = []
    private var imageCards: [UIView] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupBackButton()
        setupHeader()
        setupColumns()
        startRound()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Background

    private func setupBackground() {
        gradientLayer.colors = [
            UIColor(red: 0.04, green: 0.18, blue: 0.10, alpha: 1).cgColor,
            UIColor(red: 0.06, green: 0.30, blue: 0.18, alpha: 1).cgColor,
            UIColor(red: 0.02, green: 0.10, blue: 0.06, alpha: 1).cgColor
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
        titleLabel.text = "🧩 Match It!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        progressLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        progressLabel.textAlignment = .center
        view.addSubview(progressLabel)

        instructionLbl.translatesAutoresizingMaskIntoConstraints = false
        instructionLbl.text = "Tap a name, then tap its picture"
        instructionLbl.textColor = UIColor.white.withAlphaComponent(0.55)
        instructionLbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        instructionLbl.textAlignment = .center
        view.addSubview(instructionLbl)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            progressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            instructionLbl.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 4),
            instructionLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - Two-column layout

    private func setupColumns() {
        for stack in [nameStack, imageStack] {
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 12
            stack.distribution = .fillEqually
            view.addSubview(stack)
        }

        let colHeader = makeColumnHeaders()
        view.addSubview(colHeader)

        NSLayoutConstraint.activate([
            colHeader.topAnchor.constraint(equalTo: instructionLbl.bottomAnchor, constant: 14),
            colHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            colHeader.heightAnchor.constraint(equalToConstant: 24),

            nameStack.topAnchor.constraint(equalTo: colHeader.bottomAnchor, constant: 8),
            nameStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
            nameStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

            imageStack.topAnchor.constraint(equalTo: colHeader.bottomAnchor, constant: 8),
            imageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
            imageStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func makeColumnHeaders() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let leftLbl = UILabel()
        leftLbl.translatesAutoresizingMaskIntoConstraints = false
        leftLbl.text = "NAME"
        leftLbl.textColor = UIColor.white.withAlphaComponent(0.45)
        leftLbl.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        leftLbl.letterSpacing(1.2)

        let rightLbl = UILabel()
        rightLbl.translatesAutoresizingMaskIntoConstraints = false
        rightLbl.text = "PICTURE"
        rightLbl.textColor = UIColor.white.withAlphaComponent(0.45)
        rightLbl.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        rightLbl.letterSpacing(1.2)

        container.addSubview(leftLbl)
        container.addSubview(rightLbl)
        NSLayoutConstraint.activate([
            leftLbl.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            leftLbl.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            rightLbl.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            rightLbl.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        return container
    }

    // MARK: - Round management

    private func startRound() {
        let start = roundIndex * itemsPerRound
        let end   = min(start + itemsPerRound, allItems.count)
        guard start < allItems.count else { showCompletion(); return }

        currentItems   = Array(allItems[start..<end])
        shuffledImages = currentItems.shuffled()
        matched        = []
        selectedNameId  = nil
        selectedImageId = nil

        updateProgress()
        buildCards()
    }

    private func updateProgress() {
        let total = allItems.count
        progressLabel.text = "\(totalMatched)/\(total) matched"
    }

    // MARK: - Build cards

    private func buildCards() {
        nameStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        imageStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        nameCards  = []
        imageCards = []

        for item in currentItems {
            let card = makeNameCard(item)
            nameStack.addArrangedSubview(card)
            nameCards.append(card)
        }
        for item in shuffledImages {
            let card = makeImageCard(item)
            imageStack.addArrangedSubview(card)
            imageCards.append(card)
        }
    }

    private func makeNameCard(_ item: BodyMatchItem) -> UIView {
        let card = UIView()
        card.tag = item.id.hashValue
        card.backgroundColor = cardBg
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        card.heightAnchor.constraint(equalToConstant: 70).isActive = true

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = item.name
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        card.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -8),
            label.centerYAnchor.constraint(equalTo: card.centerYAnchor)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapNameCard(_:)))
        card.addGestureRecognizer(tap)
        card.isUserInteractionEnabled = true
        card.accessibilityIdentifier = item.id
        return card
    }

    private func makeImageCard(_ item: BodyMatchItem) -> UIView {
        let card = UIView()
        card.backgroundColor = cardBg
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        card.heightAnchor.constraint(equalToConstant: 70).isActive = true
        card.clipsToBounds = true

        let imageView = UIImageView(image: UIImage(named: item.imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        card.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -8),
            imageView.topAnchor.constraint(equalTo: card.topAnchor, constant: 6),
            imageView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -6)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImageCard(_:)))
        card.addGestureRecognizer(tap)
        card.isUserInteractionEnabled = true
        card.accessibilityIdentifier = item.id
        return card
    }

    // MARK: - Tap handlers

    @objc private func didTapNameCard(_ gesture: UITapGestureRecognizer) {
        guard let card = gesture.view,
              let id   = card.accessibilityIdentifier,
              !matched.contains(id) else { return }

        selectedNameId = id
        highlightNameCard(id: id)
        tryMatch()
    }

    @objc private func didTapImageCard(_ gesture: UITapGestureRecognizer) {
        guard let card = gesture.view,
              let id   = card.accessibilityIdentifier,
              !matched.contains(id) else { return }

        selectedImageId = id
        highlightImageCard(id: id)
        tryMatch()
    }

    // MARK: - Matching logic

    private func tryMatch() {
        guard let nameId = selectedNameId, let imageId = selectedImageId else { return }

        if nameId == imageId {
            // Correct
            matched.insert(nameId)
            totalMatched += 1
            animateCorrect(id: nameId)
            selectedNameId  = nil
            selectedImageId = nil

            if matched.count == currentItems.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.roundIndex += 1
                    if self.roundIndex * self.itemsPerRound >= self.allItems.count {
                        self.showCompletion()
                    } else {
                        self.showRoundComplete()
                    }
                }
            }
        } else {
            // Wrong
            animateWrong(nameId: nameId, imageId: imageId)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.resetSelections()
            }
        }
    }

    // MARK: - Highlighting

    private func highlightNameCard(id: String) {
        nameCards.forEach { card in
            if card.accessibilityIdentifier == id {
                UIView.animate(withDuration: 0.15) {
                    card.layer.borderColor = UIColor.systemYellow.cgColor
                    card.backgroundColor  = UIColor.systemYellow.withAlphaComponent(0.25)
                }
            } else if !matched.contains(card.accessibilityIdentifier ?? "") {
                card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
                card.backgroundColor  = self.cardBg
            }
        }
    }

    private func highlightImageCard(id: String) {
        imageCards.forEach { card in
            if card.accessibilityIdentifier == id {
                UIView.animate(withDuration: 0.15) {
                    card.layer.borderColor = UIColor.systemYellow.cgColor
                    card.backgroundColor  = UIColor.systemYellow.withAlphaComponent(0.25)
                }
            } else if !matched.contains(card.accessibilityIdentifier ?? "") {
                card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
                card.backgroundColor  = self.cardBg
            }
        }
    }

    private func animateCorrect(id: String) {
        let matchCards = (nameCards + imageCards).filter { $0.accessibilityIdentifier == id }
        for card in matchCards {
            UIView.animate(withDuration: 0.25, animations: {
                card.layer.borderColor = UIColor.systemGreen.cgColor
                card.backgroundColor  = UIColor.systemGreen.withAlphaComponent(0.30)
                card.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
            }) { _ in
                UIView.animate(withDuration: 0.15) { card.transform = .identity }
            }
            // checkmark overlay
            let check = UILabel()
            check.text = "✓"
            check.textColor = .systemGreen
            check.font = UIFont.boldSystemFont(ofSize: 20)
            check.translatesAutoresizingMaskIntoConstraints = false
            check.alpha = 0
            card.addSubview(check)
            NSLayoutConstraint.activate([
                check.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -8),
                check.topAnchor.constraint(equalTo: card.topAnchor, constant: 6)
            ])
            UIView.animate(withDuration: 0.2) { check.alpha = 1 }
        }
        updateProgress()
    }

    private func animateWrong(nameId: String, imageId: String) {
        let wrongCards = (nameCards + imageCards).filter {
            $0.accessibilityIdentifier == nameId || $0.accessibilityIdentifier == imageId
        }
        for card in wrongCards {
            UIView.animate(withDuration: 0.08, animations: {
                card.layer.borderColor = UIColor.systemRed.cgColor
                card.backgroundColor  = UIColor.systemRed.withAlphaComponent(0.25)
                card.transform = CGAffineTransform(translationX: -8, y: 0)
            }) { _ in
                UIView.animate(withDuration: 0.08, animations: {
                    card.transform = CGAffineTransform(translationX: 8, y: 0)
                }) { _ in
                    UIView.animate(withDuration: 0.08) { card.transform = .identity }
                }
            }
        }
    }

    private func resetSelections() {
        selectedNameId  = nil
        selectedImageId = nil
        (nameCards + imageCards).forEach { card in
            if !matched.contains(card.accessibilityIdentifier ?? "") {
                card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
                card.backgroundColor  = cardBg
            }
        }
    }

    // MARK: - Round complete overlay

    private func showRoundComplete() {
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.55)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.26, blue: 0.14, alpha: 1)
        card.layer.cornerRadius = 28
        card.layer.borderWidth = 2
        card.layer.borderColor = sciGreen.cgColor
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        card.alpha = 0
        overlay.addSubview(card)

        let emoji = UILabel(); emoji.text = "🎉"; emoji.font = UIFont.systemFont(ofSize: 52); emoji.textAlignment = .center; emoji.translatesAutoresizingMaskIntoConstraints = false
        let msg   = UILabel(); msg.text   = "Round Complete!"; msg.textColor = .white; msg.font = UIFont.boldSystemFont(ofSize: 22); msg.textAlignment = .center; msg.translatesAutoresizingMaskIntoConstraints = false
        let sub   = UILabel(); sub.text   = "Ready for the next set?"; sub.textColor = UIColor.white.withAlphaComponent(0.65); sub.font = UIFont.systemFont(ofSize: 14); sub.textAlignment = .center; sub.translatesAutoresizingMaskIntoConstraints = false

        let nextBtn = UIButton(type: .system)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.setTitle("Next Set →", for: .normal)
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        nextBtn.backgroundColor = sciGreen
        nextBtn.layer.cornerRadius = 20
        nextBtn.addAction(UIAction { [weak self, weak overlay] _ in
            UIView.animate(withDuration: 0.2, animations: { overlay?.alpha = 0 }) { _ in
                overlay?.removeFromSuperview()
                self?.startRound()
            }
        }, for: .touchUpInside)

        card.addSubview(emoji); card.addSubview(msg); card.addSubview(sub); card.addSubview(nextBtn)

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 280),
            emoji.topAnchor.constraint(equalTo: card.topAnchor, constant: 28),
            emoji.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            msg.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 8),
            msg.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.topAnchor.constraint(equalTo: msg.bottomAnchor, constant: 6),
            sub.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            nextBtn.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 20),
            nextBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            nextBtn.widthAnchor.constraint(equalToConstant: 160),
            nextBtn.heightAnchor.constraint(equalToConstant: 44),
            nextBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24)
        ])

        UIView.animate(withDuration: 0.2) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.4, delay: 0.05, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.8) {
            card.alpha = 1; card.transform = .identity
        }
    }

    // MARK: - Completion

    private func showCompletion() {
        Session.shared.addXP(isHardMode ? 25 : 15)

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.26, blue: 0.14, alpha: 1)
        card.layer.cornerRadius = 32
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.systemYellow.cgColor
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        overlay.addSubview(card)

        let emoji = UILabel(); emoji.text = "🏆"; emoji.font = UIFont.systemFont(ofSize: 64); emoji.textAlignment = .center; emoji.translatesAutoresizingMaskIntoConstraints = false
        let title = UILabel(); title.text = "All Matched!"; title.textColor = .white; title.font = UIFont.boldSystemFont(ofSize: 26); title.textAlignment = .center; title.translatesAutoresizingMaskIntoConstraints = false
        let sub   = UILabel(); sub.text   = "You matched all \(allItems.count) parts!"; sub.textColor = UIColor.white.withAlphaComponent(0.7); sub.font = UIFont.systemFont(ofSize: 15); sub.textAlignment = .center; sub.translatesAutoresizingMaskIntoConstraints = false
        let xpLbl = UILabel(); xpLbl.text = "+\(isHardMode ? 25 : 15) XP"; xpLbl.textColor = UIColor.systemYellow; xpLbl.font = UIFont.boldSystemFont(ofSize: 18); xpLbl.textAlignment = .center; xpLbl.translatesAutoresizingMaskIntoConstraints = false

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

        card.addSubview(emoji); card.addSubview(title); card.addSubview(sub); card.addSubview(xpLbl); card.addSubview(doneBtn)

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 300),
            emoji.topAnchor.constraint(equalTo: card.topAnchor, constant: 32),
            emoji.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            title.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 10),
            title.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            sub.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6),
            sub.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: sub.bottomAnchor, constant: 10),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 18),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 160),
            doneBtn.heightAnchor.constraint(equalToConstant: 48),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        UIView.animate(withDuration: 0.25) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.45, delay: 0.05, usingSpringWithDamping: 0.65,
                       initialSpringVelocity: 0.9) {
            card.alpha = 1; card.transform = .identity
        }
        addConfetti(to: overlay)
    }

    // MARK: - Confetti

    private func addConfetti(to parent: UIView) {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: parent.bounds.midX, y: -10)
        emitter.emitterSize     = CGSize(width: parent.bounds.width, height: 1)
        emitter.emitterShape    = .line
        let colors: [UIColor] = [.systemYellow, .systemGreen, .systemTeal, .white, .systemOrange]
        emitter.emitterCells  = colors.map { color in
            let cell = CAEmitterCell()
            cell.birthRate   = 6; cell.lifetime = 3.5; cell.velocity = 220
            cell.velocityRange = 80; cell.emissionRange = .pi / 4
            cell.spin = 2; cell.spinRange = 3
            cell.scaleRange = 0.4; cell.scale = 0.5
            cell.color = color.cgColor
            cell.contents = UIImage(systemName: "circle.fill")?.cgImage
            return cell
        }
        parent.layer.addSublayer(emitter)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { emitter.birthRate = 0 }
    }

    // MARK: - Back

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UILabel helper

private extension UILabel {
    func letterSpacing(_ spacing: CGFloat) {
        guard let text = text else { return }
        attributedText = NSAttributedString(string: text, attributes: [.kern: spacing])
    }
}
