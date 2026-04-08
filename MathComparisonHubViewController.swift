import UIKit

/// Hub that lets kids choose Easy or Hard before playing Compare It!
final class MathComparisonHubViewController: UIViewController {

    private let mathPurple = UIColor(red: 0.38, green: 0.18, blue: 0.72, alpha: 1.0)
    private let cardBg     = UIColor(red: 0.22, green: 0.08, blue: 0.44, alpha: 1.0)

    private let gradientLayer = CAGradientLayer()
    private let backBtn       = UIButton(type: .system)
    private let easyBtn       = UIButton(type: .system)
    private let hardBtn       = UIButton(type: .system)
    private var isHard        = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupBackButton()
        setupContent()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    private func setupBackground() {
        gradientLayer.colors = [
            UIColor(red: 0.18, green: 0.06, blue: 0.38, alpha: 1).cgColor,
            UIColor(red: 0.28, green: 0.10, blue: 0.52, alpha: 1).cgColor,
            UIColor(red: 0.12, green: 0.04, blue: 0.26, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
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

    private func setupContent() {
        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = "⚖️ Compare It!"
        titleLbl.textColor = .white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 28)
        titleLbl.textAlignment = .center
        view.addSubview(titleLbl)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = "Compare two numbers and pick\nthe right symbol: < = >"
        subLbl.textColor = UIColor.white.withAlphaComponent(0.65)
        subLbl.font = UIFont.systemFont(ofSize: 15)
        subLbl.textAlignment = .center
        subLbl.numberOfLines = 0
        view.addSubview(subLbl)

        // Difficulty pill
        let diffStack = UIStackView(arrangedSubviews: [easyBtn, hardBtn])
        diffStack.translatesAutoresizingMaskIntoConstraints = false
        diffStack.axis = .horizontal
        diffStack.spacing = 0
        diffStack.distribution = .fillEqually
        diffStack.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        diffStack.layer.cornerRadius = 22
        diffStack.clipsToBounds = true
        view.addSubview(diffStack)

        for (btn, title) in [(easyBtn, "🟢  Easy"), (hardBtn, "🔴  Hard")] {
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            btn.addTarget(self, action: #selector(didToggleDifficulty(_:)), for: .touchUpInside)
        }
        updateDifficultyUI()

        // Info card
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = cardBg
        card.layer.cornerRadius = 24
        card.layer.borderWidth  = 1.5
        card.layer.borderColor  = UIColor.white.withAlphaComponent(0.15).cgColor
        view.addSubview(card)

        let cardLbl = UILabel()
        cardLbl.translatesAutoresizingMaskIntoConstraints = false
        cardLbl.text = "🟢 Easy: numbers 1–10\n\n🔴 Hard: numbers 1–20 + counting dots"
        cardLbl.textColor = UIColor.white.withAlphaComponent(0.80)
        cardLbl.font = UIFont.systemFont(ofSize: 15)
        cardLbl.numberOfLines = 0
        cardLbl.textAlignment = .center
        card.addSubview(cardLbl)

        // Play button
        let playBtn = UIButton(type: .system)
        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.setTitle("▶  Play", for: .normal)
        playBtn.setTitleColor(.black, for: .normal)
        playBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        playBtn.backgroundColor = UIColor.systemYellow
        playBtn.layer.cornerRadius = 26
        playBtn.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        view.addSubview(playBtn)

        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            subLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            subLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            diffStack.topAnchor.constraint(equalTo: subLbl.bottomAnchor, constant: 28),
            diffStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diffStack.widthAnchor.constraint(equalToConstant: 240),
            diffStack.heightAnchor.constraint(equalToConstant: 44),

            card.topAnchor.constraint(equalTo: diffStack.bottomAnchor, constant: 24),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            cardLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 20),
            cardLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            cardLbl.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            cardLbl.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20),

            playBtn.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 32),
            playBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playBtn.widthAnchor.constraint(equalToConstant: 200),
            playBtn.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func updateDifficultyUI() {
        easyBtn.backgroundColor = isHard ? .clear : UIColor.white.withAlphaComponent(0.25)
        hardBtn.backgroundColor = isHard ? UIColor.white.withAlphaComponent(0.25) : .clear
    }

    @objc private func didToggleDifficulty(_ sender: UIButton) {
        isHard = (sender == hardBtn)
        updateDifficultyUI()
    }

    @objc private func didTapPlay() {
        let vc = MathComparisonViewController()
        vc.isHardMode = isHard
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
