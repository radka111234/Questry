import UIKit

struct SignUpData {
    let username: String
    let password: String
    let age: Int
    let grade: Int
    let isParent: Bool
}

final class SignUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var gradePicker: UIPickerView!
    @IBOutlet weak var parentSwitch: UISwitch!

    private let ages = Array(1...100)

    // Human-readable grade labels; stored value = row index + 1 (1–16)
    private let gradeLabels: [String] = [
        "Grade 1", "Grade 2", "Grade 3",
        "Grade 4", "Grade 5", "Grade 6",
        "Grade 7", "Grade 8",
        "Grade 9", "Grade 10", "Grade 11", "Grade 12",
        "Year 1", "Year 2", "Year 3", "Year 4+"
    ]

    private var pendingSignUpData: SignUpData?   // ✅ must be inside the class

    override func viewDidLoad() {
        super.viewDidLoad()

        agePicker.dataSource = self
        agePicker.delegate = self

        gradePicker.dataSource = self
        gradePicker.delegate = self

        agePicker.selectRow(9, inComponent: 0, animated: false)
        gradePicker.selectRow(0, inComponent: 0, animated: false)

        passwordField.isSecureTextEntry = true
        confirmPasswordField.isSecureTextEntry = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        (pickerView == agePicker) ? ages.count : gradeLabels.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        (pickerView == agePicker) ? "\(ages[row])" : gradeLabels[row]
    }

    @IBAction func didTapNext(_ sender: UIButton) {
        let username = (usernameField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text ?? ""
        let confirm = confirmPasswordField.text ?? ""

        if username.isEmpty {
            showAlert(title: "Missing username", message: "Please choose a username.")
            return
        }
        if password.count < 4 {
            showAlert(title: "Password too short", message: "Use at least 4 characters.")
            return
        }
        if password != confirm {
            showAlert(title: "Passwords don’t match", message: "Please type the same password twice.")
            return
        }

        let selectedAge = ages[agePicker.selectedRow(inComponent: 0)]
        let selectedGrade = gradePicker.selectedRow(inComponent: 0) + 1  // 1-indexed (1=Grade 1 ... 16=Year 4+ Uni)
        let isParent = parentSwitch.isOn

        pendingSignUpData = SignUpData(
            username: username,
            password: password,
            age: selectedAge,
            grade: selectedGrade,
            isParent: isParent
        )

        performSegue(withIdentifier: "ShowSignUpDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowSignUpDetails" else { return }

        let destination = segue.destination
        let detailsVC =
            (destination as? SignUpDetailsViewController)
            ?? (destination as? UINavigationController)?.topViewController as? SignUpDetailsViewController

        guard let detailsVC else { return }
        detailsVC.signUpData = pendingSignUpData
    }

    @IBAction func didTapAlreadyHaveAccount(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let login = sb.instantiateViewController(withIdentifier: "LoginViewController")
        login.modalPresentationStyle = .fullScreen
        present(login, animated: true)
    }

    private func showAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }
}
