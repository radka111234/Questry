import UIKit

/// Defines a visual theme that evolves as the player levels up.
/// Levels 1–3:  Apprentice (teal/navy — default fresh look)
/// Levels 4–6:  Explorer   (emerald/gold — earned richness)
/// Levels 7–9:  Champion   (purple/violet — powerful prestige)
/// Levels 10+:  Legend     (fire/cosmic   — ultimate tier)
final class ThemeManager {
    static let shared = ThemeManager()
    private init() {}

    // MARK: - Theme definition

    struct Theme {
        let name: String
        let tierEmoji: String
        /// Three stops for a top→bottom gradient
        let gradientColors: [UIColor]
        /// Primary accent colour (buttons, glow, XP bar)
        let accentColor: UIColor
        /// Softer tint for island glows & card borders
        let glowColor: UIColor
        /// Human-readable unlock message shown in level-up card
        let unlockMessage: String
    }

    // MARK: - Tiers

    static let apprentice = Theme(
        name: "Apprentice",
        tierEmoji: "🌱",
        gradientColors: [
            UIColor(red: 10/255,  green: 35/255, blue: 55/255,  alpha: 1),
            UIColor(red: 10/255,  green: 70/255, blue: 85/255,  alpha: 1),
            UIColor(red:  5/255,  green: 18/255, blue: 30/255,  alpha: 1)
        ],
        accentColor: UIColor(red: 0.25, green: 0.75, blue: 0.72, alpha: 1),
        glowColor:   UIColor.systemGreen,
        unlockMessage: "You're on your way, Apprentice! 🌱"
    )

    static let explorer = Theme(
        name: "Explorer",
        tierEmoji: "🌟",
        gradientColors: [
            UIColor(red: 12/255,  green: 42/255, blue: 22/255,  alpha: 1),
            UIColor(red: 25/255,  green: 65/255, blue: 15/255,  alpha: 1),
            UIColor(red:  5/255,  green: 22/255, blue: 10/255,  alpha: 1)
        ],
        accentColor: UIColor(red: 0.95, green: 0.75, blue: 0.10, alpha: 1),
        glowColor:   UIColor(red: 1.0,  green: 0.85, blue: 0.2,  alpha: 1),
        unlockMessage: "Explorer tier unlocked! Golden powers await! 🌟"
    )

    static let champion = Theme(
        name: "Champion",
        tierEmoji: "⚡",
        gradientColors: [
            UIColor(red: 28/255, green: 8/255,  blue: 58/255,  alpha: 1),
            UIColor(red: 55/255, green: 12/255, blue: 88/255,  alpha: 1),
            UIColor(red: 12/255, green: 4/255,  blue: 38/255,  alpha: 1)
        ],
        accentColor: UIColor(red: 0.68, green: 0.28, blue: 1.0, alpha: 1),
        glowColor:   UIColor(red: 0.7,  green: 0.3,  blue: 1.0, alpha: 1),
        unlockMessage: "Champion tier! The purple aura is yours! ⚡"
    )

    static let legend = Theme(
        name: "Legend",
        tierEmoji: "🔥",
        gradientColors: [
            UIColor(red:  8/255, green:  5/255, blue: 18/255,  alpha: 1),
            UIColor(red: 35/255, green: 12/255, blue: 55/255,  alpha: 1),
            UIColor(red: 65/255, green: 22/255, blue:  8/255,  alpha: 1)
        ],
        accentColor: UIColor(red: 1.0, green: 0.45, blue: 0.0, alpha: 1),
        glowColor:   UIColor(red: 1.0, green: 0.55, blue: 0.1, alpha: 1),
        unlockMessage: "LEGEND! You've reached the ultimate tier! 🔥"
    )

    // MARK: - Current theme

    func currentTheme() -> Theme {
        themeForLevel(Session.shared.currentUser?.level ?? 1)
    }

    func themeForLevel(_ level: Int) -> Theme {
        switch level {
        case 1...3:  return ThemeManager.apprentice
        case 4...6:  return ThemeManager.explorer
        case 7...9:  return ThemeManager.champion
        default:     return ThemeManager.legend
        }
    }

    /// Returns true when `newLevel` crosses into a new tier compared to `oldLevel`.
    func didUnlockNewTier(oldLevel: Int, newLevel: Int) -> Bool {
        themeForLevel(oldLevel).name != themeForLevel(newLevel).name
    }

    // MARK: - Apply helpers

    /// Animates a CAGradientLayer to the colours of the current theme.
    func applyGradient(_ layer: CAGradientLayer, animated: Bool = false) {
        let theme = currentTheme()
        let newColors = theme.gradientColors.map { $0.cgColor }
        if animated {
            let anim = CABasicAnimation(keyPath: "colors")
            anim.fromValue = layer.colors
            anim.toValue   = newColors
            anim.duration  = 1.2
            anim.fillMode  = .forwards
            layer.add(anim, forKey: "themeTransition")
        }
        layer.colors = newColors
    }

    /// Sets a UIProgressView tint to the current theme accent.
    func styleXPBar(_ bar: UIProgressView) {
        bar.tintColor = currentTheme().accentColor
    }

    /// Sets island glow shadow colour to current theme glow.
    func applyGlow(to button: UIButton?) {
        guard let button else { return }
        button.layer.shadowColor   = currentTheme().glowColor.cgColor
        button.layer.shadowRadius  = 12
        button.layer.shadowOpacity = 0.45
        button.layer.shadowOffset  = .zero
        button.layer.masksToBounds = false
    }
}
