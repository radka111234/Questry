import UIKit

final class EnglishTeachingLangPromptViewController: UIViewController {

    /// Called after the user confirms their teaching language choice.
    var onComplete: (() -> Void)?

    private let languages = AppLanguage.allCases
    private var selectedLanguage: AppLanguage? = nil

    // MARK: - UI

    private let scrollView     = UIScrollView()
    private let contentWrapper = UIView()
    private let titleLabel     = UILabel()
    private let subtitleLabel  = UILabel()
    private let gridContainer  = UIView()
    private let confirmButton  = UIButton(type: .system)

    private var cardButtons: [UIButton] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupLayout()
        updateConfirmButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.sublayers?
            .filter { $0 is CAGradientLayer }
            .forEach { $0.frame = view.bounds }
    }

    // MARK: - Background

    private func setupGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 0.06, green: 0.04, blue: 0.18, alpha: 1.0).cgColor,
            UIColor(red: 0.14, green: 0.06, blue: 0.34, alpha: 1.0).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }

    // MARK: - Layout

    private func setupLayout() {
        // --- Scroll view fills the screen
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // --- Content wrapper inside scroll view
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentWrapper)

        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // --- Title
        titleLabel.text = t("eng_prompt_title")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(titleLabel)

        // --- Subtitle
        subtitleLabel.text = t("eng_prompt_subtitle")
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.70)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(subtitleLabel)

        // --- 2-column grid
        gridContainer.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(gridContainer)

        buildLanguageGrid()

        // --- Confirm button
        confirmButton.setTitle(t("eng_prompt_confirm"), for: .normal)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.setTitleColor(UIColor.white.withAlphaComponent(0.40), for: .disabled)
        confirmButton.backgroundColor = UIColor(red: 0.45, green: 0.20, blue: 0.80, alpha: 1.0)
        confirmButton.layer.cornerRadius = 16
        confirmButton.clipsToBounds = true
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        contentWrapper.addSubview(confirmButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -24),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 32),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),

            gridContainer.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
            gridContainer.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            gridContainer.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),

            confirmButton.topAnchor.constraint(equalTo: gridContainer.bottomAnchor, constant: 32),
            confirmButton.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 24),
            confirmButton.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -24),
            confirmButton.heightAnchor.constraint(equalToConstant: 56),
            confirmButton.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -40)
        ])
    }

    private func buildLanguageGrid() {
        let cardH: CGFloat = 80
        let spacing: CGFloat = 14
        let columns: CGFloat = 2

        let totalWidth = UIScreen.main.bounds.width - 40   // matches leading+trailing insets
        let cardW = (totalWidth - spacing) / columns

        for (index, lang) in languages.enumerated() {
            let col = CGFloat(index % 2)
            let row = CGFloat(index / 2)

            let x = col * (cardW + spacing)
            let y = row * (cardH + spacing)

            let card = makeLanguageCard(for: lang, tag: index)
            card.frame = CGRect(x: x, y: y, width: cardW, height: cardH)
            gridContainer.addSubview(card)
            cardButtons.append(card)
        }

        let rowCount = CGFloat((languages.count + 1) / 2)
        let gridHeight = rowCount * cardH + (rowCount - 1) * spacing
        gridContainer.heightAnchor.constraint(equalToConstant: gridHeight).isActive = true
    }

    private func makeLanguageCard(for language: AppLanguage, tag: Int) -> UIButton {
        let card = UIButton(type: .system)
        card.tag = tag
        card.backgroundColor = UIColor.white.withAlphaComponent(0.09)
        card.layer.cornerRadius = 18
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.white.withAlphaComponent(0.20).cgColor
        card.clipsToBounds = true
        card.addTarget(self, action: #selector(didTapLanguageCard(_:)), for: .touchUpInside)

        // Flag label
        let flagLabel = UILabel()
        flagLabel.text = language.flag
        flagLabel.font = UIFont.systemFont(ofSize: 30)
        flagLabel.textAlignment = .center
        flagLabel.isUserInteractionEnabled = false
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(flagLabel)

        // Language name
        let nameLabel = UILabel()
        nameLabel.text = language.displayName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.isUserInteractionEnabled = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            flagLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            flagLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),

            nameLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: flagLabel.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -6)
        ])

        return card
    }

    // MARK: - Interaction

    @objc private func didTapLanguageCard(_ sender: UIButton) {
        let lang = languages[sender.tag]
        selectedLanguage = lang

        // Update visual state of all cards
        for (idx, card) in cardButtons.enumerated() {
            let isSelected = idx == sender.tag
            UIView.animate(withDuration: 0.20) {
                card.backgroundColor = isSelected
                    ? UIColor(red: 0.45, green: 0.20, blue: 0.80, alpha: 0.35)
                    : UIColor.white.withAlphaComponent(0.09)
                card.layer.borderColor = isSelected
                    ? UIColor(red: 0.65, green: 0.40, blue: 1.0, alpha: 0.90).cgColor
                    : UIColor.white.withAlphaComponent(0.20).cgColor
                card.transform = isSelected
                    ? CGAffineTransform(scaleX: 1.04, y: 1.04)
                    : .identity
            }
        }

        updateConfirmButton()
    }

    @objc private func didTapConfirm() {
        guard let lang = selectedLanguage else { return }
        LanguageManager.shared.setEnglishTeachingLanguage(lang)
        UserDefaults.standard.set(true, forKey: "eng_teaching_language_chosen")
        onComplete?()

        // Pop back; the caller pushes EnglishViewController
        navigationController?.popViewController(animated: true)
    }

    private func updateConfirmButton() {
        let enabled = selectedLanguage != nil
        confirmButton.isEnabled = enabled
        UIView.animate(withDuration: 0.18) {
            self.confirmButton.alpha = enabled ? 1.0 : 0.45
        }
    }
}
