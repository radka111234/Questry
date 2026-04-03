import UIKit

final class SubscriptionViewController: GradientBackgroundViewController {

    @IBOutlet weak var upgradeButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        stylePill(upgradeButton)
        stylePill(restoreButton)
    }

    private func stylePill(_ button: UIButton) {
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
    }

    @IBAction func didTapUpgrade(_ sender: UIButton) {
        alert("Coming soon", "Subscriptions aren’t enabled yet.")
    }

    @IBAction func didTapRestore(_ sender: UIButton) {
        alert("Coming soon", "Restore purchases isn’t enabled yet.")
    }

    private func alert(_ title: String, _ message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }
}
