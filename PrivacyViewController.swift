import UIKit
import SafariServices

final class PrivacyViewController: GradientBackgroundViewController {

    @IBOutlet weak var privacyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        privacyLabel.numberOfLines = 0
        privacyLabel.text =
        """
        Questry respects your privacy.

        We store only what’s needed to run the game:
        • Username
        • XP and level progress
        • Avatar selection
        • Preferences

        We do not sell your data.

        For full details, view the full policy.
        """
    }

    @IBAction func didTapFullPolicy(_ sender: UIButton) {
        // Was pointing at a dead placeholder URL (https://example.com/privacy).
        // Now opens the real hosted privacy policy (required before App Store
        // / Play submission — Apple and Google both require this to be a live URL).
        present(SFSafariViewController(url: AppLinks.privacyPolicy), animated: true)
    }
}
