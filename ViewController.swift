import UIKit

final class ViewController: UIViewController {

    private let backgroundImageView = UIImageView()
    private let dragonImageView = UIImageView()
    private let wordmarkImageView = UIImageView()

    private var iconViews: [UIImageView] = []

    private let iconNames = [
        "icon_math",
        "icon_history",
        "icon_language",
        "icon_science",
        "icon_geography"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runShortIntro()
    }

    private func setupUI() {
        // Gradient fallback — always shown, image layered on top if it loads
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [
            UIColor(red: 0.90, green: 0.96, blue: 0.60, alpha: 1).cgColor,
            UIColor(red: 0.98, green: 0.98, blue: 0.72, alpha: 1).cgColor
        ]
        gradLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        gradLayer.frame      = UIScreen.main.bounds
        view.layer.insertSublayer(gradLayer, at: 0)

        // Background image
        backgroundImageView.image = UIImage(named: "launch_background")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Dragon (center)
        dragonImageView.image = UIImage(named: "dragon_logo")
        dragonImageView.contentMode = .scaleAspectFit
        dragonImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dragonImageView)

        NSLayoutConstraint.activate([
            dragonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dragonImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            dragonImageView.widthAnchor.constraint(equalToConstant: 240),
            dragonImageView.heightAnchor.constraint(equalToConstant: 240)
        ])

        // Wordmark image under dragon
        wordmarkImageView.image = UIImage(named: "questry_wordmark") // MUST match Assets name exactly
        wordmarkImageView.contentMode = .scaleAspectFit
        wordmarkImageView.alpha = 0.0
        wordmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wordmarkImageView)

        NSLayoutConstraint.activate([
            wordmarkImageView.topAnchor.constraint(equalTo: dragonImageView.bottomAnchor, constant: 82),// moved down
            wordmarkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordmarkImageView.widthAnchor.constraint(equalToConstant: 340),
            wordmarkImageView.heightAnchor.constraint(equalToConstant: 94)
        ])

        // Build icon views
        var built: [UIImageView] = []
        for name in iconNames {
            if let img = UIImage(named: name) {
                let iv = UIImageView(image: img)
                iv.contentMode = .scaleAspectFit
                iv.alpha = 0.0
                iv.translatesAutoresizingMaskIntoConstraints = false
                built.append(iv)
            }
        }
        iconViews = built

        // Star-like positions (2 bottom, 2 midline, 1 top)
        let offsets: [CGPoint] = [
            CGPoint(x: 0,    y: -165), // top
            CGPoint(x: -135, y: -15),  // middle-left
            CGPoint(x: 135,  y: -15),  // middle-right
            CGPoint(x: -90,  y: 125),  // bottom-left
            CGPoint(x: 90,   y: 125)   // bottom-right
        ]

        // Place icons behind dragon
        for (i, iv) in iconViews.enumerated() {
            view.insertSubview(iv, belowSubview: dragonImageView)

            let off = offsets[min(i, offsets.count - 1)]

            NSLayoutConstraint.activate([
                iv.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: off.x),
                iv.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: off.y - 10),
                iv.widthAnchor.constraint(equalToConstant: 100),
                iv.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
    }

    private func runShortIntro() {
        
        let holdAfterAnimation: TimeInterval = 1.2   // <-- increase this
        view.layoutIfNeeded()

        // Fade in wordmark
        wordmarkImageView.transform = CGAffineTransform(translationX: 0, y: 6)
        UIView.animate(withDuration: 0.25, delay: 0.10, options: [.curveEaseOut]) {
            self.wordmarkImageView.alpha = 1.0
            self.wordmarkImageView.transform = .identity
        }

        // Dragon orbit (short circle)
        let startCenter = dragonImageView.center
        let radius: CGFloat = 95

        let circle = UIBezierPath(
            arcCenter: startCenter,
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: 1.5 * .pi,
            clockwise: true
        )

        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.path = circle.cgPath
        orbit.duration = 1.15
        orbit.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        orbit.isRemovedOnCompletion = true

        let wobble = CABasicAnimation(keyPath: "transform.rotation.z")
        wobble.fromValue = -0.08
        wobble.toValue = 0.08
        wobble.autoreverses = true
        wobble.duration = 0.25
        wobble.repeatCount = 5

        dragonImageView.layer.add(orbit, forKey: "orbit")
        dragonImageView.layer.add(wobble, forKey: "wobble")

        // Fade in icons (staggered)
        for (i, iv) in iconViews.enumerated() {
            iv.transform = CGAffineTransform(scaleX: 0.88, y: 0.88)
            UIView.animate(withDuration: 0.22,
                           delay: 0.18 + (0.08 * Double(i)),
                           options: [.curveEaseOut]) {
                iv.alpha = 0.95
                iv.transform = .identity
            }
        }

        // Snap dragon back to center + bounce
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.15) {
            self.dragonImageView.layer.removeAllAnimations()
            self.dragonImageView.center = startCenter

            UIView.animate(withDuration: 0.28,
                           delay: 0,
                           usingSpringWithDamping: 0.65,
                           initialSpringVelocity: 0.8,
                           options: []) {
                self.dragonImageView.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
            } completion: { _ in
                UIView.animate(withDuration: 0.12) {
                    self.dragonImageView.transform = .identity
                }

                // Hold longer before moving to main screen
                DispatchQueue.main.asyncAfter(deadline: .now() + holdAfterAnimation) {
                    self.performSegue(withIdentifier: "showLogin", sender: nil)
                }
            }
        }
    }

    private func transitionToMain(after seconds: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {

            let nextVC: UIViewController

            if AuthState.isLoggedIn {
                nextVC = MainTabBarController()
            } else {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = sb.instantiateViewController(withIdentifier: "LoginViewController")
                nextVC = UINavigationController(rootViewController: loginVC)
            }

            nextVC.modalPresentationStyle = .fullScreen

            // Keep your fade transition
            nextVC.view.alpha = 0
            self.present(nextVC, animated: false) {
                UIView.animate(withDuration: 0.20) {
                    nextVC.view.alpha = 1
                }
            }
        }
    }
}
