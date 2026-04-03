import UIKit

final class PrivacyPolicyViewController: GradientBackgroundViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Privacy Policy"
        navigationController?.setNavigationBarHidden(false, animated: false)

        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text =
        """
        Privacy Policy

        Questry respects your privacy.

        We store only the information necessary to run the game:
        • Username
        • Learning progress (XP and level)
        • Avatar selection
        • App preferences

        Your data is securely stored using Supabase.

        We do not sell or share your personal data with third parties.

        If you have questions about your data, please contact support through the feedback section.
        """

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
