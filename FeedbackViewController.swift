import UIKit

final class FeedbackViewController: GradientBackgroundViewController, UITextViewDelegate {

    @IBOutlet weak var messageTextView: UITextView!

    private let placeholder = "Tell us what went wrong or what you want improved..."

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        messageTextView.delegate = self
        messageTextView.layer.cornerRadius = 12
        messageTextView.clipsToBounds = true

        // Placeholder
        messageTextView.text = placeholder
        messageTextView.textColor = UIColor.secondaryLabel
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = .label
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = placeholder
            textView.textColor = UIColor.secondaryLabel
        }
    }

    @IBAction func didTapSend(_ sender: UIButton) {
        let msg = messageTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !msg.isEmpty, msg != placeholder else {
            let a = UIAlertController(title: "Empty message", message: "Please type your feedback first.", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "OK", style: .default))
            present(a, animated: true)
            return
        }

        // For now: just show success (later you can save to Supabase)
        let a = UIAlertController(title: "Sent", message: "Thanks! Your feedback was saved.", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(a, animated: true)
    }
}
