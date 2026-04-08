import UIKit

/// Landing screen for the Human Body activity in Science.
/// Kids choose: Matching Game or Body Builder, Easy or Hard.
final class HumanBodyHubViewController: UIViewController {

    // MARK: - Theme
    private let sciGreen  = UIColor(red: 0.10, green: 0.55, blue: 0.35, alpha: 1.0)
    private let darkBg    = UIColor(red: 0.04, green: 0.12, blue: 0.08, alpha: 1.0)
    private let cardBg    = UIColor(red: 0.10, green: 0.28, blue: 0.18, alpha: 1.0)

    // MARK: - State
    private var selectedDifficulty: Difficulty = .easy {
        didSet { updateDifficultyButtons() }
    }
    enum Difficulty { case easy, hard }

    // MARK: - UI
    private let gradientLayer  = CAGradientLayer()
    private let titleLabel     = UILabel()
    private let subtitleLabel  = UILabel()
    private let matchCard      = UIView()
    private let buildCard      = UIView()
    private let easyBtn        = UIButton(type: .system)
    private let hardBtn        = UIButton(type: .system)
    private let matchPlayBtn   = UIButton(type: .system)
    private let buildPlayBtn   = UIButton(type: .system)
    private let backBtn        = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupBackButton()
        setupTitle()
        setupDifficultyPicker()
        setupActivityCards()
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

    // MARK: - Back Button

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

    // MARK: - Title

    private func setupTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "🫀 Human Body"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Choose an activity and difficulty"
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.65)
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        subtitleLabel.textAlignment = .center
        view.addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - Difficulty Picker

    private func setupDifficultyPicker() {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.white.withAlphaComponent(0.10)
        container.layer.cornerRadius = 22
        view.addSubview(container)

        for (btn, title) in [(easyBtn, "⭐  Easy"), (hardBtn, "🔥  Hard")] {
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            btn.layer.cornerRadius = 18
            container.addSubview(btn)
        }
        easyBtn.addTarget(self, action: #selector(didTapEasy), for: .touchUpInside)
        hardBtn.addTarget(self, action: #selector(didTapHard), for: .touchUpInside)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 24),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.widthAnchor.constraint(equalToConstant: 260),
            container.heightAnchor.constraint(equalToConstant: 44),

            easyBtn.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4),
            easyBtn.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
            easyBtn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4),
            easyBtn.widthAnchor.constraint(equalToConstant: 126),

            hardBtn.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -4),
            hardBtn.topAnchor.constraint(equalTo: container.topAnchor, constant: 4),
            hardBtn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -4),
            hardBtn.widthAnchor.constraint(equalToConstant: 126)
        ])

        updateDifficultyButtons()
    }

    private func updateDifficultyButtons() {
        let activeColor = sciGreen
        let inactiveColor = UIColor.clear

        easyBtn.backgroundColor = selectedDifficulty == .easy ? activeColor : inactiveColor
        easyBtn.setTitleColor(selectedDifficulty == .easy ? .white : UIColor.white.withAlphaComponent(0.55), for: .normal)

        hardBtn.backgroundColor = selectedDifficulty == .hard ? activeColor : inactiveColor
        hardBtn.setTitleColor(selectedDifficulty == .hard ? .white : UIColor.white.withAlphaComponent(0.55), for: .normal)
    }

    // MARK: - Activity Cards

    private func setupActivityCards() {
        setupCard(
            matchCard,
            emoji: "🧩",
            title: "Match It!",
            subtitle: "Pair organ names\nwith pictures",
            playBtn: matchPlayBtn,
            action: #selector(didTapMatch),
            below: easyBtn
        )

        setupCard(
            buildCard,
            emoji: "🫀",
            title: "Build It!",
            subtitle: "Drag organs onto\nthe body",
            playBtn: buildPlayBtn,
            action: #selector(didTapBuild),
            below: matchCard
        )

        NSLayoutConstraint.activate([
            matchCard.topAnchor.constraint(equalTo: easyBtn.superview!.bottomAnchor, constant: 24),
            matchCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            matchCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            matchCard.heightAnchor.constraint(equalToConstant: 130),

            buildCard.topAnchor.constraint(equalTo: matchCard.bottomAnchor, constant: 16),
            buildCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buildCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buildCard.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    private func setupCard(_ card: UIView, emoji: String, title: String, subtitle: String,
                           playBtn: UIButton, action: Selector, below anchor: UIView) {
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = cardBg
        card.layer.cornerRadius = 22
        card.layer.borderWidth = 1.5
        card.layer.borderColor = sciGreen.withAlphaComponent(0.45).cgColor
        view.addSubview(card)

        let emojiLbl = UILabel()
        emojiLbl.translatesAutoresizingMaskIntoConstraints = false
        emojiLbl.text = emoji
        emojiLbl.font = UIFont.systemFont(ofSize: 48)

        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = title
        titleLbl.textColor = .white
        titleLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        let subLbl = UILabel()
        subLbl.translatesAutoresizingMaskIntoConstraints = false
        subLbl.text = subtitle
        subLbl.textColor = UIColor.white.withAlphaComponent(0.65)
        subLbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        subLbl.numberOfLines = 2

        playBtn.translatesAutoresizingMaskIntoConstraints = false
        playBtn.setTitle("Play →", for: .normal)
        playBtn.setTitleColor(.white, for: .normal)
        playBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        playBtn.backgroundColor = sciGreen
        playBtn.layer.cornerRadius = 16
        playBtn.addTarget(self, action: action, for: .touchUpInside)

        card.addSubview(emojiLbl)
        card.addSubview(titleLbl)
        card.addSubview(subLbl)
        card.addSubview(playBtn)

        NSLayoutConstraint.activate([
            emojiLbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            emojiLbl.centerYAnchor.constraint(equalTo: card.centerYAnchor),

            titleLbl.leadingAnchor.constraint(equalTo: emojiLbl.trailingAnchor, constant: 16),
            titleLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 24),

            subLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 4),
            subLbl.trailingAnchor.constraint(equalTo: playBtn.leadingAnchor, constant: -8),

            playBtn.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            playBtn.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            playBtn.widthAnchor.constraint(equalToConstant: 88),
            playBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - Actions

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func didTapEasy() { selectedDifficulty = .easy }
    @objc private func didTapHard() { selectedDifficulty = .hard }

    @objc private func didTapMatch() {
        let vc = BodyMatchingViewController()
        vc.isHardMode = (selectedDifficulty == .hard)
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapBuild() {
        let vc = BodyBuilderViewController()
        vc.isHardMode = (selectedDifficulty == .hard)
        navigationController?.pushViewController(vc, animated: true)
    }
}
