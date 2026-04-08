import UIKit

// MARK: - BodyBuilderItem

struct BodyBuilderItem {
    let id: String
    let name: String
    let imageName: String
    /// Normalized position (0…1) within the body silhouette image (not UIImageView bounds).
    let normalizedPosition: CGPoint
}

// MARK: - BodyBuilderViewController

final class BodyBuilderViewController: UIViewController {

    // MARK: - Public config
    var isHardMode: Bool = false

    // MARK: - Data sets

    // Positions are normalized (0–1) within the body_silhouette.png image bounds.
    // Pixel analysis: figure starts at y≈0.126, ends at y≈0.873 (not 0–1).
    // Head spans y=0.126–0.295. Arms span y=0.36–0.56. Legs y=0.59–0.87.
    private let easyItems: [BodyBuilderItem] = [
        .init(id: "eye",   name: "Eye",   imageName: "part_eye",   normalizedPosition: CGPoint(x: 0.560, y: 0.210)),
        .init(id: "ear",   name: "Ear",   imageName: "part_ear",   normalizedPosition: CGPoint(x: 0.638, y: 0.200)),
        .init(id: "nose",  name: "Nose",  imageName: "part_nose",  normalizedPosition: CGPoint(x: 0.500, y: 0.235)),
        .init(id: "mouth", name: "Mouth", imageName: "part_mouth", normalizedPosition: CGPoint(x: 0.500, y: 0.258)),
        // Viewer's left arm/hand (figure's right side — arm extends to x≈0.18)
        .init(id: "arm",   name: "Arm",   imageName: "part_arm",   normalizedPosition: CGPoint(x: 0.255, y: 0.445)),
        .init(id: "hand",  name: "Hand",  imageName: "part_hand",  normalizedPosition: CGPoint(x: 0.195, y: 0.545)),
        // Right leg from viewer (figure's left leg — x≈0.43)
        .init(id: "leg",   name: "Leg",   imageName: "part_leg",   normalizedPosition: CGPoint(x: 0.430, y: 0.730)),
        .init(id: "foot",  name: "Foot",  imageName: "part_foot",  normalizedPosition: CGPoint(x: 0.425, y: 0.855)),
    ]

    private let hardItems: [BodyBuilderItem] = [
        // Head
        .init(id: "brain",           name: "Brain",          imageName: "organ_brain",           normalizedPosition: CGPoint(x: 0.500, y: 0.175)),
        // Chest (y≈0.36–0.48)
        .init(id: "heart",           name: "Heart",          imageName: "organ_heart",           normalizedPosition: CGPoint(x: 0.450, y: 0.415)),
        .init(id: "lungs",           name: "Lungs",          imageName: "organ_lungs",           normalizedPosition: CGPoint(x: 0.545, y: 0.400)),
        // Upper abdomen (y≈0.46–0.52)
        .init(id: "liver",           name: "Liver",          imageName: "organ_liver",           normalizedPosition: CGPoint(x: 0.555, y: 0.475)),
        .init(id: "stomach",         name: "Stomach",        imageName: "organ_stomach",         normalizedPosition: CGPoint(x: 0.450, y: 0.478)),
        .init(id: "spleen",          name: "Spleen",         imageName: "organ_spleen",          normalizedPosition: CGPoint(x: 0.410, y: 0.475)),
        // Mid abdomen (y≈0.52–0.58)
        .init(id: "kidneys",         name: "Kidneys",        imageName: "organ_kidneys",         normalizedPosition: CGPoint(x: 0.500, y: 0.515)),
        .init(id: "small_intestine", name: "Small Int.",     imageName: "organ_small_intestine", normalizedPosition: CGPoint(x: 0.500, y: 0.558)),
        // Lower abdomen (y≈0.59–0.64)
        .init(id: "large_intestine", name: "Large Int.",     imageName: "organ_large_intestine", normalizedPosition: CGPoint(x: 0.500, y: 0.600)),
        .init(id: "bladder",         name: "Bladder",        imageName: "organ_bladder",         normalizedPosition: CGPoint(x: 0.500, y: 0.635)),
    ]

    private var allItems: [BodyBuilderItem] { isHardMode ? hardItems : easyItems }
    private var placedIds: Set<String> = []

    // MARK: - Theme
    private let sciGreen = UIColor(red: 0.10, green: 0.55, blue: 0.35, alpha: 1.0)
    private let cardBg   = UIColor(red: 0.10, green: 0.26, blue: 0.16, alpha: 1.0)

    // MARK: - UI
    private let gradientLayer  = CAGradientLayer()
    private let backBtn        = UIButton(type: .system)
    private let titleLabel     = UILabel()
    private let progressLabel  = UILabel()
    private let silhouetteView = UIImageView()
    private let trayScrollView = UIScrollView()
    private let trayStack      = UIStackView()

    // Per-item views
    private var dropZoneViews: [String: UIView] = [:]
    private var tileViews: [String: UIView] = [:]
    private var placedImageViews: [String: UIImageView] = [:]

    // Drag state
    private var activeDragId: String? = nil
    private var dragView: UIView? = nil
    private var dragOffset: CGPoint = .zero
    private var dragOriginInView: CGPoint = .zero

    // Layout guard — build drop zones only once
    private var dropZonesBuilt = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupBackButton()
        setupHeader()
        setupSilhouette()
        setupTray()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        buildDropZonesIfNeeded()
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

    // MARK: - Back button

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
        titleLabel.text = "🫀 Build It!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        progressLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        progressLabel.textAlignment = .center
        view.addSubview(progressLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        updateProgress()
    }

    // MARK: - Silhouette

    private func setupSilhouette() {
        silhouetteView.translatesAutoresizingMaskIntoConstraints = false
        silhouetteView.image = UIImage(named: "body_silhouette")
        silhouetteView.contentMode = .scaleAspectFit
        silhouetteView.clipsToBounds = false
        silhouetteView.isUserInteractionEnabled = false
        view.addSubview(silhouetteView)

        NSLayoutConstraint.activate([
            silhouetteView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 6),
            silhouetteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            silhouetteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            silhouetteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -144)
        ])
    }

    // MARK: - Drop zones

    private func buildDropZonesIfNeeded() {
        guard !dropZonesBuilt, silhouetteView.bounds.height > 0 else { return }
        dropZonesBuilt = true

        let imgRect = imageRect(in: silhouetteView)
        let zoneSize: CGFloat = 38

        for item in allItems {
            let cx = imgRect.minX + item.normalizedPosition.x * imgRect.width
            let cy = imgRect.minY + item.normalizedPosition.y * imgRect.height

            let zone = UIView()
            zone.frame = CGRect(x: cx - zoneSize / 2, y: cy - zoneSize / 2, width: zoneSize, height: zoneSize)
            zone.backgroundColor = UIColor.white.withAlphaComponent(0.10)
            zone.layer.cornerRadius = zoneSize / 2
            zone.layer.borderWidth  = 2.0
            zone.layer.borderColor  = sciGreen.withAlphaComponent(0.90).cgColor
            zone.isUserInteractionEnabled = false
            zone.accessibilityIdentifier = item.id
            silhouetteView.addSubview(zone)
            dropZoneViews[item.id] = zone

            pulseZone(zone)
        }
    }

    private func pulseZone(_ zone: UIView) {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1.0
        anim.toValue = 0.3
        anim.duration = 1.1
        anim.autoreverses = true
        anim.repeatCount = .infinity
        zone.layer.add(anim, forKey: "pulse")
    }

    // MARK: - Tray

    private func setupTray() {
        let trayBg = UIView()
        trayBg.translatesAutoresizingMaskIntoConstraints = false
        trayBg.backgroundColor = UIColor.black.withAlphaComponent(0.38)
        trayBg.layer.cornerRadius = 26
        trayBg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(trayBg)

        trayScrollView.translatesAutoresizingMaskIntoConstraints = false
        trayScrollView.showsHorizontalScrollIndicator = false
        trayScrollView.clipsToBounds = false
        trayScrollView.delaysContentTouches = false
        trayBg.addSubview(trayScrollView)

        trayStack.translatesAutoresizingMaskIntoConstraints = false
        trayStack.axis = .horizontal
        trayStack.spacing = 12
        trayStack.alignment = .center
        trayScrollView.addSubview(trayStack)

        NSLayoutConstraint.activate([
            trayBg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trayBg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trayBg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            trayBg.heightAnchor.constraint(equalToConstant: 136),

            trayScrollView.topAnchor.constraint(equalTo: trayBg.topAnchor, constant: 12),
            trayScrollView.leadingAnchor.constraint(equalTo: trayBg.leadingAnchor, constant: 16),
            trayScrollView.trailingAnchor.constraint(equalTo: trayBg.trailingAnchor, constant: -16),
            trayScrollView.bottomAnchor.constraint(equalTo: trayBg.bottomAnchor, constant: -8),

            trayStack.topAnchor.constraint(equalTo: trayScrollView.topAnchor),
            trayStack.leadingAnchor.constraint(equalTo: trayScrollView.leadingAnchor),
            trayStack.trailingAnchor.constraint(equalTo: trayScrollView.trailingAnchor),
            trayStack.bottomAnchor.constraint(equalTo: trayScrollView.bottomAnchor),
            trayStack.heightAnchor.constraint(equalTo: trayScrollView.heightAnchor)
        ])

        for item in allItems.shuffled() {
            let tile = makeTile(for: item)
            trayStack.addArrangedSubview(tile)
            tileViews[item.id] = tile
        }
    }

    private func makeTile(for item: BodyBuilderItem) -> UIView {
        let tile = UIView()
        tile.backgroundColor = cardBg
        tile.layer.cornerRadius = 16
        tile.layer.borderWidth  = 1.5
        tile.layer.borderColor  = sciGreen.withAlphaComponent(0.5).cgColor
        tile.accessibilityIdentifier = item.id
        tile.widthAnchor.constraint(equalToConstant: 82).isActive = true
        tile.heightAnchor.constraint(equalToConstant: 90).isActive = true

        let img = UIImageView(image: UIImage(named: item.imageName))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit

        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = item.name
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.7

        tile.addSubview(img)
        tile.addSubview(lbl)
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: tile.topAnchor, constant: 8),
            img.leadingAnchor.constraint(equalTo: tile.leadingAnchor, constant: 6),
            img.trailingAnchor.constraint(equalTo: tile.trailingAnchor, constant: -6),
            img.heightAnchor.constraint(equalToConstant: 52),
            lbl.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 3),
            lbl.leadingAnchor.constraint(equalTo: tile.leadingAnchor, constant: 4),
            lbl.trailingAnchor.constraint(equalTo: tile.trailingAnchor, constant: -4),
            lbl.bottomAnchor.constraint(equalTo: tile.bottomAnchor, constant: -4)
        ])

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        tile.addGestureRecognizer(pan)

        return tile
    }

    // MARK: - Drag & drop

    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let tile = gesture.view,
              let id   = tile.accessibilityIdentifier,
              !placedIds.contains(id) else { return }

        let touchInView = gesture.location(in: view)

        switch gesture.state {
        case .began:
            activeDragId = id
            dragOriginInView = view.convert(tile.center, from: tile.superview)

            // Create floating snapshot
            guard let snap = tile.snapshotView(afterScreenUpdates: false) else { return }
            snap.center = dragOriginInView
            snap.layer.shadowColor   = UIColor.black.cgColor
            snap.layer.shadowOpacity = 0.45
            snap.layer.shadowRadius  = 10
            snap.layer.shadowOffset  = CGSize(width: 0, height: 5)
            dragOffset = CGPoint(x: dragOriginInView.x - touchInView.x,
                                 y: dragOriginInView.y - touchInView.y)
            view.addSubview(snap)
            dragView = snap
            tile.alpha = 0.3

            UIView.animate(withDuration: 0.15) {
                snap.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            }

        case .changed:
            guard let dv = dragView else { return }
            dv.center = CGPoint(x: touchInView.x + dragOffset.x,
                                y: touchInView.y + dragOffset.y)
            highlightNearestZone(for: id, dragCenter: dv.center)

        case .ended, .cancelled:
            guard let dv = dragView, let id = activeDragId else { return }
            resetZoneHighlights()

            if let zone = matchingZone(for: id, near: dv.center) {
                snapToZone(zone, id: id, dragView: dv, sourceTile: tile)
            } else {
                bounceTileBack(dragView: dv, sourceTile: tile)
            }

            activeDragId = nil
            dragView = nil

        default: break
        }
    }

    private func highlightNearestZone(for id: String, dragCenter: CGPoint) {
        for (zId, zone) in dropZoneViews where !placedIds.contains(zId) {
            let zoneCenter = view.convert(zone.center, from: silhouetteView)
            let dist = hypot(dragCenter.x - zoneCenter.x, dragCenter.y - zoneCenter.y)
            let isTarget = (zId == id && dist < 60)
            UIView.animate(withDuration: 0.12) {
                zone.backgroundColor = isTarget
                    ? self.sciGreen.withAlphaComponent(0.40)
                    : UIColor.white.withAlphaComponent(0.08)
                zone.layer.borderColor = isTarget
                    ? UIColor.white.cgColor
                    : self.sciGreen.withAlphaComponent(0.85).cgColor
            }
        }
    }

    private func resetZoneHighlights() {
        for (id, zone) in dropZoneViews where !placedIds.contains(id) {
            zone.backgroundColor = UIColor.white.withAlphaComponent(0.08)
            zone.layer.borderColor = sciGreen.withAlphaComponent(0.85).cgColor
        }
    }

    private func matchingZone(for id: String, near point: CGPoint) -> UIView? {
        guard let zone = dropZoneViews[id] else { return nil }
        let zoneCenter = view.convert(zone.center, from: silhouetteView)
        let dist = hypot(point.x - zoneCenter.x, point.y - zoneCenter.y)
        return dist < 55 ? zone : nil
    }

    private func snapToZone(_ zone: UIView, id: String, dragView: UIView, sourceTile: UIView) {
        placedIds.insert(id)
        let zoneCenterInView = view.convert(zone.center, from: silhouetteView)

        UIView.animate(withDuration: 0.28, delay: 0,
                       usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) {
            dragView.center = zoneCenterInView
            dragView.transform = CGAffineTransform(scaleX: 0.82, y: 0.82)
        } completion: { _ in
            // Place a permanent image on the silhouette
            if let item = self.allItems.first(where: { $0.id == id }) {
                let placed = UIImageView(image: UIImage(named: item.imageName))
                placed.contentMode = .scaleAspectFit
                let expandedFrame = zone.frame.insetBy(dx: -8, dy: -8)
                placed.frame = expandedFrame
                placed.alpha = 0
                self.silhouetteView.addSubview(placed)
                self.placedImageViews[id] = placed
                UIView.animate(withDuration: 0.18) { placed.alpha = 1 }
            }
            zone.layer.removeAnimation(forKey: "pulse")
            zone.isHidden = true
            dragView.removeFromSuperview()
            sourceTile.isHidden = true
        }

        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        updateProgress()

        if placedIds.count == allItems.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                self.showCompletion()
            }
        }
    }

    private func bounceTileBack(dragView: UIView, sourceTile: UIView) {
        UIView.animate(withDuration: 0.35, delay: 0,
                       usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) {
            dragView.center = self.dragOriginInView
            dragView.transform = .identity
        } completion: { _ in
            dragView.removeFromSuperview()
            sourceTile.alpha = 1
        }
    }

    // MARK: - Progress

    private func updateProgress() {
        progressLabel.text = "\(placedIds.count)/\(allItems.count) placed"
    }

    // MARK: - Image rect helper

    private func imageRect(in imageView: UIImageView) -> CGRect {
        guard let image = imageView.image else { return imageView.bounds }
        let viewSize  = imageView.bounds.size
        let imageSize = image.size
        let scale = min(viewSize.width / imageSize.width, viewSize.height / imageSize.height)
        let w = imageSize.width  * scale
        let h = imageSize.height * scale
        return CGRect(x: (viewSize.width - w) / 2, y: (viewSize.height - h) / 2, width: w, height: h)
    }

    // MARK: - Completion

    private func showCompletion() {
        Session.shared.addXP(isHardMode ? 30 : 20)

        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        overlay.alpha = 0
        view.addSubview(overlay)

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(red: 0.08, green: 0.26, blue: 0.14, alpha: 1)
        card.layer.cornerRadius = 32
        card.layer.borderWidth  = 2
        card.layer.borderColor  = UIColor.systemYellow.cgColor
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.72, y: 0.72)
        overlay.addSubview(card)

        let emojiLbl = UILabel()
        emojiLbl.text = "🎉"; emojiLbl.font = UIFont.systemFont(ofSize: 64)
        emojiLbl.textAlignment = .center; emojiLbl.translatesAutoresizingMaskIntoConstraints = false

        let titleLbl = UILabel()
        titleLbl.text = "Body Complete!"
        titleLbl.textColor = .white; titleLbl.font = UIFont.boldSystemFont(ofSize: 26)
        titleLbl.textAlignment = .center; titleLbl.translatesAutoresizingMaskIntoConstraints = false

        let subLbl = UILabel()
        subLbl.text = "You built the \(isHardMode ? "organ system" : "human body")!"
        subLbl.textColor = UIColor.white.withAlphaComponent(0.7); subLbl.font = UIFont.systemFont(ofSize: 15)
        subLbl.textAlignment = .center; subLbl.translatesAutoresizingMaskIntoConstraints = false

        let xpLbl = UILabel()
        xpLbl.text = "+\(isHardMode ? 30 : 20) XP"
        xpLbl.textColor = UIColor.systemYellow; xpLbl.font = UIFont.boldSystemFont(ofSize: 20)
        xpLbl.textAlignment = .center; xpLbl.translatesAutoresizingMaskIntoConstraints = false

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

        for v in [emojiLbl, titleLbl, subLbl, xpLbl, doneBtn] { card.addSubview(v) }

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            card.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 300),

            emojiLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),
            emojiLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            titleLbl.topAnchor.constraint(equalTo: emojiLbl.bottomAnchor, constant: 10),
            titleLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 6),
            subLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: subLbl.bottomAnchor, constant: 12),
            xpLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 20),
            doneBtn.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            doneBtn.widthAnchor.constraint(equalToConstant: 160),
            doneBtn.heightAnchor.constraint(equalToConstant: 48),
            doneBtn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -28)
        ])

        UIView.animate(withDuration: 0.25) { overlay.alpha = 1 }
        UIView.animate(withDuration: 0.45, delay: 0.05,
                       usingSpringWithDamping: 0.65, initialSpringVelocity: 0.9) {
            card.alpha = 1; card.transform = .identity
        }
        addConfetti(to: overlay)
    }

    private func addConfetti(to parent: UIView) {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: parent.bounds.midX, y: -10)
        emitter.emitterSize  = CGSize(width: parent.bounds.width, height: 1)
        emitter.emitterShape = .line
        let colors: [UIColor] = [.systemYellow, .systemGreen, .systemTeal, .white, .systemOrange, .systemPink]
        emitter.emitterCells = colors.map { color in
            let cell = CAEmitterCell()
            cell.birthRate    = 6;  cell.lifetime     = 3.5; cell.velocity     = 220
            cell.velocityRange = 80; cell.emissionRange = .pi / 4
            cell.spin = 2;           cell.spinRange     = 3
            cell.scaleRange = 0.4;   cell.scale         = 0.5
            cell.color    = color.cgColor
            cell.contents = UIImage(systemName: "circle.fill")?.cgImage
            return cell
        }
        parent.layer.addSublayer(emitter)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { emitter.birthRate = 0 }
    }

    // MARK: - Actions

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BodyBuilderViewController: UIGestureRecognizerDelegate {
    /// Allow the pan gesture to run simultaneously with the scroll view's gesture,
    /// so the user can both scroll the tray and drag tiles.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith other: UIGestureRecognizer) -> Bool {
        // Allow simultaneous recognition only for horizontal swipes (tray scrolling).
        // Vertical drags (tile onto silhouette) should be exclusive to the tile's pan gesture.
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let vel = pan.velocity(in: pan.view)
            return abs(vel.x) > abs(vel.y)
        }
        return false
    }
}
