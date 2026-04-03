import UIKit

/// Base class for all gradient-background screens.
///
/// Provides:
///  - `background_image` asset as the lowest visual layer (the sandy texture).
///  - A semi-transparent dark gradient overlay on top, preserving the gradient feel.
///  - `addBackButton()`  -  call from `viewDidLoad` to get a ‹ chevron button.
class GradientBackgroundViewController: UIViewController {

    // MARK: - Background

    private let backgroundImageView = UIImageView()
    private let gradientLayer       = CAGradientLayer()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Background

    private func setupBackground() {
        // Layer 1: sandy background image
        backgroundImageView.image       = UIImage(named: "background_image")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Layer 2: semi-transparent gradient overlay  -  keeps the moody gradient
        // feel while letting the sandy texture show through underneath.
        gradientLayer.colors = [
            UIColor(red: 10/255, green: 35/255, blue: 55/255, alpha: 0.88).cgColor,
            UIColor(red: 10/255, green: 70/255, blue: 85/255, alpha: 0.88).cgColor,
            UIColor(red: 5/255,  green: 18/255, blue: 30/255, alpha: 0.88).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1.0)
        // Insert above the image view (index 1) but below all UIView subviews.
        view.layer.insertSublayer(gradientLayer, at: 1)
    }

    // MARK: - Back button

    /// Adds a ‹ chevron button anchored to the safe-area top-left.
    /// Call from `viewDidLoad` in any subclass that needs a back button.
    func addBackButton() {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.tintColor       = .white
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.30)
        btn.layer.cornerRadius = 16
        btn.clipsToBounds   = true
        btn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        view.addSubview(btn)

        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            btn.widthAnchor.constraint(equalToConstant: 32),
            btn.heightAnchor.constraint(equalToConstant: 32)
        ])
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
