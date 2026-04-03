import UIKit

final class AcknowledgementsViewController: GradientBackgroundViewController {

    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        textLabel.numberOfLines = 0
        textLabel.text =
        """
        Questry

        Created by Radka Roudová.

        Built with Xcode and Supabase.

        Thanks to everyone who tested early versions and helped improve the app.

        © \(Calendar.current.component(.year, from: Date())) Questry. All rights reserved.
        """
    }
}
