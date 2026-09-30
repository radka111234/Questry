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
        • Username and password (password is never stored as plain text)
        • A recovery PIN, used only to verify it's you if you reset your password
        • Age and grade level, to tailor content
        • Learning progress (XP, level, badges, streaks)
        • Avatar selection

        Your data is securely stored using Supabase, with database-level access
        restricted to only the specific actions the app needs.

        There is no advertising and no tracking in Questry, and we do not sell
        or share your personal data with third parties.

        For the full policy, see the link on the previous screen. If you have
        questions about your data, please contact support through the feedback
        section.
        """

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
