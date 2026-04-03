import UIKit

enum ShopEffects {

    static var hasGoldFrame: Bool { UserDefaults.standard.bool(forKey: "item_gold_frame") }
    static var hasMagicAura: Bool { UserDefaults.standard.bool(forKey: "item_magic_aura") }
    static var hasXPBooster: Bool { UserDefaults.standard.bool(forKey: "item_xp_booster") }
    static var hasMapTheme:  Bool { UserDefaults.standard.bool(forKey: "item_map_theme") }

    private static let auraTag = 77_991

    /// Apply gold border and/or magic aura glow to an avatar imageView.
    /// Call from `viewDidLayoutSubviews` AFTER cornerRadius and clipsToBounds are set.
    static func applyAvatarCosmetics(to imageView: UIImageView) {
        // Gold frame  -  border on the imageView itself (shows over the circular clip edge)
        imageView.layer.borderWidth = hasGoldFrame ? 3.5 : 0
        imageView.layer.borderColor = hasGoldFrame
            ? UIColor(red: 1.0, green: 0.82, blue: 0.0, alpha: 1.0).cgColor
            : UIColor.clear.cgColor

        // Remove any previous aura ring
        imageView.superview?.viewWithTag(auraTag)?.removeFromSuperview()

        guard hasMagicAura, let parent = imageView.superview else { return }

        // Aura ring sits BEHIND the imageView in the same superview, slightly larger
        let inset: CGFloat = -7
        let frame = imageView.frame.insetBy(dx: inset, dy: inset)
        let ring = UIView(frame: frame)
        ring.tag = auraTag
        ring.isUserInteractionEnabled = false
        ring.backgroundColor = .clear
        ring.layer.cornerRadius = frame.width / 2
        ring.layer.borderColor  = UIColor(red: 0.65, green: 0.15, blue: 1.0, alpha: 0.88).cgColor
        ring.layer.borderWidth  = 3
        ring.layer.shadowColor  = UIColor(red: 0.65, green: 0.15, blue: 1.0, alpha: 1.0).cgColor
        ring.layer.shadowRadius = 12
        ring.layer.shadowOpacity = 0.95
        ring.layer.shadowOffset = .zero
        parent.insertSubview(ring, belowSubview: imageView)
    }

    /// Update xpLabel text to show "2x" badge when XP booster is active.
    static func formatXPLabel(_ baseText: String) -> String {
        hasXPBooster ? baseText + " ⚡2x" : baseText
    }

    /// Apply the purple map-theme tint overlay to a view (the main screen background).
    /// Pass the view whose layer should get a tinted sublayer tagged 88991.
    static func applyMapTheme(to view: UIView) {
        let themeTag = 88_991
        // Remove old overlay
        view.viewWithTag(themeTag)?.removeFromSuperview()

        guard hasMapTheme else { return }

        let overlay = UIView()
        overlay.tag = themeTag
        overlay.isUserInteractionEnabled = false
        overlay.backgroundColor = UIColor(red: 0.35, green: 0.05, blue: 0.65, alpha: 0.18)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        // Insert above gradient (index 1) but below all content
        if view.subviews.count > 0 {
            view.insertSubview(overlay, at: 1)
        } else {
            view.addSubview(overlay)
        }
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
