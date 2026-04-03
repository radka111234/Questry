import UIKit

final class TermsViewController: GradientBackgroundViewController {

    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        textLabel.numberOfLines = 0
        textLabel.text = """
        Terms of Service

        By using Questry, you agree to use the app for personal educational purposes only.

        You may not attempt to copy, modify, or redistribute the application without permission.

        Progress data and preferences are stored to provide the game experience.

        Questry may update features or content at any time to improve the learning experience.

        If you do not agree with these terms, please discontinue using the application.
        """
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
