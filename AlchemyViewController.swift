import UIKit

// MARK: - AlchemyViewController

final class AlchemyViewController: UIViewController {

    // MARK: - State

    private var discoveredIds: [String] = []           // ordered list of discovered element ids
    private var slotA: String? = nil
    private var slotB: String? = nil

    private let saveKey = "alchemy_discovered_ids"

    // MARK: - Theme

    private let bg1 = UIColor(red: 0.04, green: 0.04, blue: 0.14, alpha: 1)
    private let bg2 = UIColor(red: 0.08, green: 0.06, blue: 0.22, alpha: 1)
    private let slotColor = UIColor(red: 0.18, green: 0.14, blue: 0.36, alpha: 1)
    private let accent = UIColor(red: 0.55, green: 0.32, blue: 1.00, alpha: 1)

    // MARK: - UI

    private let gradientLayer  = CAGradientLayer()
    private let backBtn        = UIButton(type: .system)
    private let titleLabel     = UILabel()
    private let countLabel     = UILabel()

    // Combine zone
    private let combinePanel   = UIView()
    private let slotAView      = SlotView()
    private let slotBView      = SlotView()
    private let plusLabel      = UILabel()
    private let arrowLabel     = UILabel()
    private let resultView     = SlotView()
    private let combineBtn     = UIButton(type: .system)
    private let hintBtn        = UIButton(type: .system)
    private var hintsUsed      = 0

    // Inventory
    private let inventoryLabel = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 12, left: 14, bottom: 12, right: 14)
        let itemSize: CGFloat = 76
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 18)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDiscovered()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Persistence

    private func loadDiscovered() {
        let saved = UserDefaults.standard.stringArray(forKey: saveKey) ?? []
        if saved.isEmpty {
            discoveredIds = Array(AlchemyGameData.starterIds).sorted()
        } else {
            discoveredIds = saved
        }
    }

    private func saveDiscovered() {
        UserDefaults.standard.set(discoveredIds, forKey: saveKey)
    }

    // MARK: - Setup

    private func setupUI() {
        // Gradient bg
        gradientLayer.colors = [bg1.cgColor, bg2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)

        setupBackButton()
        setupHeader()
        setupCombinePanel()
        setupInventory()
        updateCombineUI()
        updateCountLabel()
    }

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

    private func setupHeader() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "⚗️ Little Alchemy"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.textColor = UIColor.white.withAlphaComponent(0.55)
        countLabel.font = UIFont.systemFont(ofSize: 13)
        countLabel.textAlignment = .center
        view.addSubview(countLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupCombinePanel() {
        combinePanel.translatesAutoresizingMaskIntoConstraints = false
        combinePanel.backgroundColor = slotColor
        combinePanel.layer.cornerRadius = 24
        combinePanel.layer.borderWidth  = 1.5
        combinePanel.layer.borderColor  = accent.withAlphaComponent(0.4).cgColor
        view.addSubview(combinePanel)

        // Slots
        slotAView.layer.cornerRadius = 16
        slotBView.layer.cornerRadius = 16
        resultView.layer.cornerRadius = 16
        slotAView.onTap = { [weak self] in self?.clearSlot(.a) }
        slotBView.onTap = { [weak self] in self?.clearSlot(.b) }
        resultView.isUserInteractionEnabled = false

        // Operators
        plusLabel.text = "+"
        plusLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        plusLabel.font = UIFont.systemFont(ofSize: 26, weight: .thin)
        plusLabel.textAlignment = .center

        arrowLabel.text = "="
        arrowLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        arrowLabel.font = UIFont.systemFont(ofSize: 26, weight: .thin)
        arrowLabel.textAlignment = .center

        // Slots row stack
        let slotsRow = UIStackView(arrangedSubviews: [slotAView, plusLabel, slotBView, arrowLabel, resultView])
        slotsRow.axis = .horizontal
        slotsRow.distribution = .fill
        slotsRow.alignment = .center
        slotsRow.spacing = 4

        // Fixed widths for operators; slots expand equally
        plusLabel.setContentHuggingPriority(.required, for: .horizontal)
        arrowLabel.setContentHuggingPriority(.required, for: .horizontal)
        plusLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        arrowLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        slotAView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        slotBView.heightAnchor.constraint(equalTo: slotAView.heightAnchor).isActive = true
        resultView.heightAnchor.constraint(equalTo: slotAView.heightAnchor).isActive = true
        slotBView.widthAnchor.constraint(equalTo: slotAView.widthAnchor).isActive = true
        resultView.widthAnchor.constraint(equalTo: slotAView.widthAnchor).isActive = true

        // Combine button
        combineBtn.setTitle("✨ Combine!", for: .normal)
        combineBtn.setTitleColor(.black, for: .normal)
        combineBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        combineBtn.backgroundColor = UIColor.systemYellow
        combineBtn.layer.cornerRadius = 22

        combineBtn.addTarget(self, action: #selector(didTapCombine), for: .touchUpInside)

        // Hint button
        hintBtn.setTitle("💡 Hint", for: .normal)
        hintBtn.setTitleColor(.white, for: .normal)
        hintBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        hintBtn.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        hintBtn.layer.cornerRadius = 22
        hintBtn.layer.borderWidth = 1.5
        hintBtn.layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
        hintBtn.addTarget(self, action: #selector(didTapHint), for: .touchUpInside)

        // Buttons row stack
        let btnRow = UIStackView(arrangedSubviews: [combineBtn, hintBtn])
        btnRow.axis = .horizontal
        btnRow.spacing = 10
        btnRow.distribution = .fillEqually
        btnRow.heightAnchor.constraint(equalToConstant: 44).isActive = true

        // Outer vertical stack
        let outer = UIStackView(arrangedSubviews: [slotsRow, btnRow])
        outer.translatesAutoresizingMaskIntoConstraints = false
        outer.axis = .vertical
        outer.spacing = 14
        combinePanel.addSubview(outer)

        NSLayoutConstraint.activate([
            combinePanel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 12),
            combinePanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            combinePanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            outer.topAnchor.constraint(equalTo: combinePanel.topAnchor, constant: 14),
            outer.leadingAnchor.constraint(equalTo: combinePanel.leadingAnchor, constant: 12),
            outer.trailingAnchor.constraint(equalTo: combinePanel.trailingAnchor, constant: -12),
            outer.bottomAnchor.constraint(equalTo: combinePanel.bottomAnchor, constant: -14),
        ])
    }

    private func setupInventory() {
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        inventoryLabel.text = "Your Elements"
        inventoryLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        inventoryLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        view.addSubview(inventoryLabel)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white.withAlphaComponent(0.05)
        collectionView.layer.cornerRadius = 20
        collectionView.register(AlchemyCell.self, forCellWithReuseIdentifier: "AlchemyCell")
        collectionView.dataSource = self
        collectionView.delegate   = self
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            inventoryLabel.topAnchor.constraint(equalTo: combinePanel.bottomAnchor, constant: 16),
            inventoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            collectionView.topAnchor.constraint(equalTo: inventoryLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }

    // MARK: - Slot Management

    private enum SlotSide { case a, b }

    private func setSlot(_ side: SlotSide, elementId: String) {
        switch side {
        case .a:
            slotA = elementId
            slotAView.configure(with: elementId)
        case .b:
            slotB = elementId
            slotBView.configure(with: elementId)
        }
        updateCombineUI()
        autoTryCombine()
    }

    private func clearSlot(_ side: SlotSide) {
        switch side {
        case .a:
            slotA = nil
            slotAView.clear()
        case .b:
            slotB = nil
            slotBView.clear()
        }
        resultView.clear()
        updateCombineUI()
    }

    private func autoTryCombine() {
        guard let a = slotA, let b = slotB else { return }
        if let output = AlchemyGameData.combine(a, b) {
            resultView.configure(with: output)
        } else {
            resultView.showError()
        }
    }

    private func updateCombineUI() {
        let ready = slotA != nil && slotB != nil
        combineBtn.alpha = ready ? 1.0 : 0.45
        combineBtn.isEnabled = ready
    }

    private func updateCountLabel() {
        countLabel.text = "\(discoveredIds.count) / \(AlchemyGameData.allElements.count) discovered"
    }

    // MARK: - Actions

    @objc private func didTapCombine() {
        guard let a = slotA, let b = slotB else { return }

        if let outputId = AlchemyGameData.combine(a, b) {
            let isNew = !discoveredIds.contains(outputId)
            if isNew {
                discoveredIds.append(outputId)
                saveDiscovered()
                collectionView.reloadData()
                updateCountLabel()
                showNewElementBanner(outputId)
                Session.shared.addXP(3)
            } else {
                resultView.configure(with: outputId)
                resultView.shakeAlreadyKnown()
            }
        } else {
            resultView.showError()
            shakeCombinePanel()
        }
    }

    @objc private func didTapHint() {
        // Find a recipe where both inputs are discovered but output is not
        let shuffled = AlchemyGameData.recipes.shuffled()
        guard let recipe = shuffled.first(where: {
            discoveredIds.contains($0.inputA) &&
            discoveredIds.contains($0.inputB) &&
            !discoveredIds.contains($0.output)
        }) else {
            showHintBanner(text: "You've discovered everything! 🎉", isNoHint: true)
            return
        }

        hintsUsed += 1
        let nameA = AlchemyGameData.allElements.first(where: { $0.id == recipe.inputA })?.name ?? recipe.inputA
        let nameB = AlchemyGameData.allElements.first(where: { $0.id == recipe.inputB })?.name ?? recipe.inputB

        // Load the slots with the hinted elements
        setSlot(.a, elementId: recipe.inputA)
        setSlot(.b, elementId: recipe.inputB)

        showHintBanner(text: "Try: \(nameA) + \(nameB)", isNoHint: false)
    }

    private func showHintBanner(text: String, isNoHint: Bool) {
        let banner = UIView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.backgroundColor = isNoHint
            ? UIColor(red: 0.08, green: 0.40, blue: 0.12, alpha: 0.95)
            : UIColor(red: 0.20, green: 0.12, blue: 0.40, alpha: 0.95)
        banner.layer.cornerRadius = 16
        banner.layer.borderWidth  = 1.5
        banner.layer.borderColor  = UIColor.systemYellow.withAlphaComponent(0.7).cgColor
        banner.alpha = 0
        view.addSubview(banner)

        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = text
        lbl.textColor = UIColor.systemYellow
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        banner.addSubview(lbl)

        NSLayoutConstraint.activate([
            banner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            banner.topAnchor.constraint(equalTo: combinePanel.bottomAnchor, constant: 10),
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            lbl.topAnchor.constraint(equalTo: banner.topAnchor, constant: 12),
            lbl.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 12),
            lbl.trailingAnchor.constraint(equalTo: banner.trailingAnchor, constant: -12),
            lbl.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -12),
        ])

        UIView.animate(withDuration: 0.25) { banner.alpha = 1 }
        UIView.animate(withDuration: 0.25, delay: 2.2) { banner.alpha = 0 } completion: { _ in
            banner.removeFromSuperview()
        }
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Animations

    private func shakeCombinePanel() {
        let anim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        anim.values  = [0, -8, 8, -6, 6, -3, 3, 0]
        anim.duration = 0.35
        combinePanel.layer.add(anim, forKey: "shake")
    }

    private func showNewElementBanner(_ id: String) {
        guard let elem = AlchemyGameData.allElements.first(where: { $0.id == id }) else { return }

        let banner = UIView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.backgroundColor = UIColor(red: 0.25, green: 0.08, blue: 0.55, alpha: 0.95)
        banner.layer.cornerRadius = 20
        banner.layer.borderWidth  = 2
        banner.layer.borderColor  = UIColor.systemYellow.cgColor
        banner.alpha = 0
        banner.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        view.addSubview(banner)

        let img = UIImageView(image: UIImage(named: elem.assetName))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit

        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "✨ New! \(elem.name)"
        lbl.textColor = UIColor.systemYellow
        lbl.font = UIFont.boldSystemFont(ofSize: 18)

        banner.addSubview(img)
        banner.addSubview(lbl)

        NSLayoutConstraint.activate([
            banner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            banner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            banner.widthAnchor.constraint(equalToConstant: 220),

            img.topAnchor.constraint(equalTo: banner.topAnchor, constant: 20),
            img.centerXAnchor.constraint(equalTo: banner.centerXAnchor),
            img.widthAnchor.constraint(equalToConstant: 72),
            img.heightAnchor.constraint(equalToConstant: 72),

            lbl.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            lbl.centerXAnchor.constraint(equalTo: banner.centerXAnchor),
            lbl.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -20)
        ])

        UIView.animate(withDuration: 0.35, delay: 0,
                       usingSpringWithDamping: 0.65, initialSpringVelocity: 0.8) {
            banner.alpha = 1
            banner.transform = .identity
        }
        UIView.animate(withDuration: 0.3, delay: 1.6) {
            banner.alpha = 0
            banner.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        } completion: { _ in
            banner.removeFromSuperview()
            // Clear slots after discovery
            self.slotA = nil; self.slotB = nil
            self.slotAView.clear(); self.slotBView.clear()
            self.resultView.clear()
            self.updateCombineUI()
        }

        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
}

// MARK: - UICollectionView

extension AlchemyViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ cv: UICollectionView, numberOfItemsInSection s: Int) -> Int {
        discoveredIds.count
    }

    func collectionView(_ cv: UICollectionView, cellForItemAt ip: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "AlchemyCell", for: ip) as! AlchemyCell
        let id = discoveredIds[ip.item]
        if let elem = AlchemyGameData.allElements.first(where: { $0.id == id }) {
            cell.configure(with: elem)
        }
        return cell
    }

    func collectionView(_ cv: UICollectionView, didSelectItemAt ip: IndexPath) {
        let id = discoveredIds[ip.item]
        if slotA == nil {
            setSlot(.a, elementId: id)
        } else if slotB == nil {
            setSlot(.b, elementId: id)
        } else {
            // Both slots were full. This used to do `slotA = slotB` here, which
            // actually shifted the OLD slot B into A and silently discarded
            // whatever was in slot A — the opposite of what the comment promised
            // and what a player tapping a third element would expect (their first
            // pick vanishing with no explanation). Shift old A into B instead, so
            // the new tap replaces A and nothing picked is lost.
            slotB = slotA
            slotBView.configure(with: slotA!)
            setSlot(.a, elementId: id)
        }

        // Brief selection flash
        if let cell = cv.cellForItem(at: ip) {
            UIView.animate(withDuration: 0.12,
                           animations: { cell.transform = CGAffineTransform(scaleX: 0.88, y: 0.88) },
                           completion: { _ in
                UIView.animate(withDuration: 0.18, delay: 0,
                               usingSpringWithDamping: 0.6,
                               initialSpringVelocity: 0.8,
                               options: []) { cell.transform = .identity }
            })
        }
    }
}

// MARK: - SlotView

private class SlotView: UIView {

    var onTap: (() -> Void)?
    private let imageView  = UIImageView()
    private let nameLabel  = UILabel()
    private let placeholder = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white.withAlphaComponent(0.08)
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor

        placeholder.text = "?"
        placeholder.font = UIFont.systemFont(ofSize: 28, weight: .thin)
        placeholder.textColor = UIColor.white.withAlphaComponent(0.30)
        placeholder.textAlignment = .center
        placeholder.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0

        nameLabel.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        nameLabel.textColor = UIColor.white.withAlphaComponent(0.75)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(placeholder)
        addSubview(imageView)
        addSubview(nameLabel)

        NSLayoutConstraint.activate([
            placeholder.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholder.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -2),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with id: String) {
        if let elem = AlchemyGameData.allElements.first(where: { $0.id == id }) {
            imageView.image = UIImage(named: elem.assetName)
            nameLabel.text  = elem.name
        }
        placeholder.isHidden = true
        UIView.animate(withDuration: 0.2) { self.imageView.alpha = 1 }
        layer.borderColor = UIColor.systemYellow.withAlphaComponent(0.6).cgColor
    }

    func clear() {
        imageView.alpha = 0
        imageView.image = nil
        nameLabel.text  = nil
        placeholder.isHidden = false
        layer.borderColor = UIColor.white.withAlphaComponent(0.25).cgColor
    }

    func showError() {
        nameLabel.text = "No result"
        nameLabel.textColor = UIColor.systemRed.withAlphaComponent(0.8)
        layer.borderColor = UIColor.systemRed.withAlphaComponent(0.6).cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            self?.nameLabel.textColor = UIColor.white.withAlphaComponent(0.75)
            self?.clear()
        }
    }

    func shakeAlreadyKnown() {
        let anim = CAKeyframeAnimation(keyPath: "transform.translation.x")
        anim.values  = [0, -5, 5, -4, 4, 0]
        anim.duration = 0.28
        layer.add(anim, forKey: "shake")
    }

    @objc private func tapped() { onTap?() }
}

// MARK: - AlchemyCell

private class AlchemyCell: UICollectionViewCell {

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let bgView    = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = UIColor.white.withAlphaComponent(0.07)
        bgView.layer.cornerRadius = 14
        bgView.layer.borderWidth  = 1
        bgView.layer.borderColor  = UIColor.white.withAlphaComponent(0.12).cgColor
        contentView.addSubview(bgView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        nameLabel.textColor = UIColor.white.withAlphaComponent(0.85)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.7
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 76),

            imageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8),

            nameLabel.topAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with element: AlchemyElement) {
        imageView.image = UIImage(named: element.assetName)
        nameLabel.text  = element.name
    }
}
