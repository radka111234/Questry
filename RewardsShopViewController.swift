import UIKit

struct ShopItem {
    let title: String
    let subtitle: String
    let cost: Int
    let imageName: String
}

final class RewardsShopViewController: UIViewController,
                                       UICollectionViewDataSource,
                                       UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!

    private let gradientLayer = CAGradientLayer()
    private let backButton = UIButton(type: .system)

    // Titles = 16 chars each
    // Subtitles = 16 chars each
    private let items: [ShopItem] = [
        .init(title: "Shiny Gold Frame", subtitle: "Hero border look", cost: 500,  imageName: "shop_gold_frame"),
        .init(title: "Arcane Glow Ring", subtitle: "Glow hero effect", cost: 750,  imageName: "shop_magic_aura"),
        .init(title: "Turbo XP Booster", subtitle: "2x your XP gains", cost: 1000, imageName: "shop_double_xp"),
        .init(title: "Legendary Badge", subtitle: "Unlock rare gems", cost: 1500,  imageName: "shop_badge_pack"),
        .init(title: "Mystic Map Look", subtitle: "Restyle your map", cost: 2000,  imageName: "shop_island_theme"),
        .init(title: "Mystery Loot Box", subtitle: "Rare loot inside", cost: 3000,  imageName: "shop_mystery_chest")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        applyBackground()
        styleHeader()
        addBackButton()
        addSpinBanner()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshHeader()
        collectionView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
        ShopEffects.applyAvatarCosmetics(to: avatarImageView)
    }

    // MARK: - Background

    private func applyBackground() {
        gradientLayer.colors = [
            UIColor(red: 8/255, green: 38/255, blue: 58/255, alpha: 1).cgColor,
            UIColor(red: 9/255, green: 72/255, blue: 88/255, alpha: 1).cgColor,
            UIColor(red: 6/255, green: 24/255, blue: 38/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Header

    private func styleHeader() {
        usernameLabel.textColor = .white
        levelLabel.textColor = .white
        xpLabel.textColor = .white

        xpProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.18)
        xpProgressView.progressTintColor = .systemYellow
    }

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        guard let user = Session.shared.currentUser else {
            usernameLabel.text = "Guest"
            levelLabel.text = "Level 1"
            xpLabel.text = ShopEffects.formatXPLabel("0 XP")
            xpProgressView.progress = 0
            return
        }

        usernameLabel.text = user.username
        levelLabel.text = "Level \(user.level)"
        xpLabel.text = ShopEffects.formatXPLabel("\(user.xp) XP")
        xpProgressView.progress = min(Float(user.xp % 500) / 500.0, 1.0)
    }

    // MARK: - Back Button

    private func addBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor.white.withAlphaComponent(0.95)
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

    @objc private func didTapBack() {
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }

    // MARK: - Spin Banner

    private func addSpinBanner() {
        let banner = UIView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.backgroundColor = UIColor(red: 0.10, green: 0.45, blue: 0.65, alpha: 0.20)
        banner.layer.cornerRadius = 18
        banner.layer.borderWidth  = 1.5
        banner.layer.borderColor  = UIColor(red: 0.20, green: 0.65, blue: 0.88, alpha: 0.55).cgColor

        let emoji = UILabel()
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.text = "🎡"
        emoji.font = UIFont.systemFont(ofSize: 28)

        let textStack = UIStackView()
        textStack.translatesAutoresizingMaskIntoConstraints = false
        textStack.axis = .vertical
        textStack.spacing = 2

        let topLine = UILabel()
        topLine.text = "Daily Spin Wheel"
        topLine.textColor = .white
        topLine.font = UIFont.systemFont(ofSize: 15, weight: .bold)

        let bottomLine = UILabel()
        bottomLine.text = "Win XP, badges & more!"
        bottomLine.textColor = UIColor.white.withAlphaComponent(0.65)
        bottomLine.font = UIFont.systemFont(ofSize: 12, weight: .medium)

        textStack.addArrangedSubview(topLine)
        textStack.addArrangedSubview(bottomLine)

        let arrow = UILabel()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.text = "›"
        arrow.textColor = UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1)
        arrow.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        banner.addSubview(emoji)
        banner.addSubview(textStack)
        banner.addSubview(arrow)

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSpinWheel))
        banner.addGestureRecognizer(tap)
        banner.isUserInteractionEnabled = true

        view.addSubview(banner)

        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: xpProgressView.bottomAnchor, constant: 32),
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            banner.heightAnchor.constraint(equalToConstant: 68),

            emoji.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 16),
            emoji.centerYAnchor.constraint(equalTo: banner.centerYAnchor),

            textStack.leadingAnchor.constraint(equalTo: emoji.trailingAnchor, constant: 12),
            textStack.centerYAnchor.constraint(equalTo: banner.centerYAnchor),

            arrow.trailingAnchor.constraint(equalTo: banner.trailingAnchor, constant: -16),
            arrow.centerYAnchor.constraint(equalTo: banner.centerYAnchor),
        ])

        // Push collection content down so cells appear below the banner
        collectionView.contentInset.top = 84
    }

    @objc private func didTapSpinWheel() {
        let vc = SpinWheelViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle   = .crossDissolve
        present(vc, animated: true)
    }

    // MARK: - Collection

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    // MARK: - Purchase helpers

    // Per-user key so purchases are isolated between accounts.
    private var shopOwnedKey: String {
        "shop_owned_items_\(Session.shared.currentUser?.username ?? "__guest__")"
    }

    private func isPurchased(_ item: ShopItem) -> Bool {
        let owned = UserDefaults.standard.string(forKey: shopOwnedKey) ?? ""
        return owned.components(separatedBy: ",").contains(item.imageName)
    }

    private func markPurchased(_ item: ShopItem) {
        var owned = UserDefaults.standard.string(forKey: shopOwnedKey) ?? ""
        if owned.isEmpty {
            owned = item.imageName
        } else {
            owned += ",\(item.imageName)"
        }
        UserDefaults.standard.set(owned, forKey: shopOwnedKey)
    }

    private func applyItemEffect(_ item: ShopItem) {
        let u = Session.shared.currentUser?.username ?? "__guest__"
        switch item.imageName {
        case "shop_gold_frame":
            UserDefaults.standard.set(true, forKey: "item_gold_frame_\(u)")
        case "shop_magic_aura":
            UserDefaults.standard.set(true, forKey: "item_magic_aura_\(u)")
        case "shop_double_xp":
            UserDefaults.standard.set(true, forKey: "item_xp_booster_\(u)")
        case "shop_badge_pack":
            UserDefaults.standard.set(true, forKey: "item_badge_pack_\(u)")
            // Unlock 'Math Explorer' and 'First World' badges for the player
            var earned = BadgeManager.shared.earnedBadgeIds
            earned.insert("badge_math_explorer")
            earned.insert("badge_first_world")
            BadgeManager.shared.earnedBadgeIds = earned
        case "shop_island_theme":
            UserDefaults.standard.set(true, forKey: "item_map_theme_\(u)")
        case "shop_mystery_chest":
            Session.shared.addXP(50)
            // Show reveal is handled by showMysteryChestReveal() called from handlePurchase
        default:
            break
        }
    }

    @objc private func didTapBuy(_ sender: UIButton) {
        let index = sender.tag
        guard index >= 0, index < items.count else { return }
        handlePurchase(at: index)
    }

    private func handlePurchase(at index: Int) {
        let item = items[index]

        if isPurchased(item) { return }

        let currentXP = Session.shared.currentUser?.xp ?? 0
        guard currentXP >= item.cost else {
            let alert = UIAlertController(
                title: "Not enough XP",
                message: "You need \(item.cost - currentXP) more XP to buy this.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        let confirm = UIAlertController(
            title: "Buy \(item.title)?",
            message: "This costs \(item.cost) XP.",
            preferredStyle: .alert
        )
        confirm.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        confirm.addAction(UIAlertAction(title: "Buy", style: .default) { [weak self] _ in
            guard let self else { return }
            if Session.shared.spendXP(item.cost) {
                self.markPurchased(item)
                self.applyItemEffect(item)
                self.refreshHeader()
                self.collectionView.reloadData()
                if item.imageName == "shop_mystery_chest" {
                    self.showMysteryChestReveal()
                } else if item.imageName == "shop_badge_pack" {
                    let badges = BadgeDefinition.all.filter { ["badge_math_explorer", "badge_first_world"].contains($0.id) }
                    self.showBadgesEarned(badges) {}
                }
            } else {
                let err = UIAlertController(title: "Not enough XP", message: nil, preferredStyle: .alert)
                err.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(err, animated: true)
            }
        })
        present(confirm, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardCell", for: indexPath)
        let item = items[indexPath.item]
        let currentXP = Session.shared.currentUser?.xp ?? 0
        let canAfford = currentXP >= item.cost
        let owned = isPurchased(item)

        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        card.layer.cornerRadius = 18
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        card.clipsToBounds = true

        let iconContainer = UIView()
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        iconContainer.layer.cornerRadius = 26

        let itemImageView = UIImageView()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.image = UIImage(named: item.imageName)
        itemImageView.contentMode = .scaleAspectFit

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = item.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.8

        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = item.subtitle
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.78)
        subtitleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        subtitleLabel.numberOfLines = 1
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.minimumScaleFactor = 0.8

        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "\(item.cost) XP"
        priceLabel.textColor = .systemYellow
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        priceLabel.textAlignment = .right

        let buyButton = UIButton(type: .system)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        if owned {
            buyButton.setTitle("Owned", for: .normal)
            buyButton.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.85)
        } else if canAfford {
            buyButton.setTitle("Buy", for: .normal)
            buyButton.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.9)
        } else {
            buyButton.setTitle("Locked", for: .normal)
            buyButton.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        }
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.layer.cornerRadius = 11
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        buyButton.isUserInteractionEnabled = true
        buyButton.tag = indexPath.item
        buyButton.addTarget(self, action: #selector(didTapBuy(_:)), for: .touchUpInside)

        cell.contentView.addSubview(card)
        card.addSubview(iconContainer)
        iconContainer.addSubview(itemImageView)
        card.addSubview(titleLabel)
        card.addSubview(subtitleLabel)
        card.addSubview(priceLabel)
        card.addSubview(buyButton)

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            card.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),

            iconContainer.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 14),
            iconContainer.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 74),
            iconContainer.heightAnchor.constraint(equalToConstant: 74),

            itemImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            itemImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            itemImageView.heightAnchor.constraint(equalToConstant: 60),

            priceLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            priceLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -14),
            priceLabel.widthAnchor.constraint(equalToConstant: 74),

            titleLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -14),

            buyButton.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -14),
            buyButton.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
            buyButton.widthAnchor.constraint(equalToConstant: 72),
            buyButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Purchase is handled by the buy button's didTapBuy action.
    }

    // MARK: - Layout

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideInset: CGFloat = 16
        let width = collectionView.bounds.width - (sideInset * 2)
        return CGSize(width: width, height: 88)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 16, left: 16, bottom: 120, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    // MARK: - Mystery Chest Reveal

    private func showMysteryChestReveal() {
        let dim = UIView()
        dim.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        dim.translatesAutoresizingMaskIntoConstraints = false
        dim.alpha = 0
        view.addSubview(dim)
        NSLayoutConstraint.activate([
            dim.topAnchor.constraint(equalTo: view.topAnchor),
            dim.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dim.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dim.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let card = UIView()
        card.backgroundColor = UIColor(red: 0.10, green: 0.08, blue: 0.22, alpha: 1.0)
        card.layer.cornerRadius = 32
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor(red: 0.6, green: 0.3, blue: 1.0, alpha: 0.8).cgColor
        card.translatesAutoresizingMaskIntoConstraints = false
        card.alpha = 0
        card.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        view.addSubview(card)
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.widthAnchor.constraint(equalToConstant: 280),
        ])

        let chestLabel = UILabel()
        chestLabel.text = "🎁"
        chestLabel.font = UIFont.systemFont(ofSize: 72)
        chestLabel.textAlignment = .center
        chestLabel.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = "Mystery Chest!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let rewardLabel = UILabel()
        rewardLabel.text = "You won 50 XP! ⭐"
        rewardLabel.textColor = UIColor.systemYellow
        rewardLabel.font = UIFont.boldSystemFont(ofSize: 18)
        rewardLabel.textAlignment = .center
        rewardLabel.translatesAutoresizingMaskIntoConstraints = false

        let btn = UIButton(type: .system)
        btn.setTitle("Awesome! 🎉", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.backgroundColor = UIColor(red: 0.95, green: 0.85, blue: 0.1, alpha: 1.0)
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(chestLabel)
        card.addSubview(titleLabel)
        card.addSubview(rewardLabel)
        card.addSubview(btn)

        NSLayoutConstraint.activate([
            chestLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 28),
            chestLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: chestLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            rewardLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            rewardLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            rewardLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            btn.topAnchor.constraint(equalTo: rewardLabel.bottomAnchor, constant: 24),
            btn.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 24),
            btn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -24),
            btn.heightAnchor.constraint(equalToConstant: 48),
            btn.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -24)
        ])

        UIView.animate(withDuration: 0.2) { dim.alpha = 1 }
        UIView.animate(
            withDuration: 0.55, delay: 0.05,
            usingSpringWithDamping: 0.55, initialSpringVelocity: 0.9,
            options: []
        ) {
            card.alpha = 1
            card.transform = .identity
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0.1) {
                chestLabel.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            } completion: { _ in
                UIView.animate(withDuration: 0.12) { chestLabel.transform = .identity }
            }
        }

        let dismiss = {
            UIView.animate(withDuration: 0.18, animations: {
                dim.alpha = 0; card.alpha = 0
                card.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            }) { _ in dim.removeFromSuperview(); card.removeFromSuperview() }
        }
        btn.addAction(UIAction { _ in dismiss() }, for: .touchUpInside)
    }
}
