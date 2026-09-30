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
        // Show the in-app privacy policy screen instead until a real hosted
        // privacy policy URL exists (required before App Store / Play submission).
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PrivacyPolicyViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}
