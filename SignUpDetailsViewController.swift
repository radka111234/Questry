import UIKit
import SafariServices

final class SignUpDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // Data passed from SignUp screen
    var signUpData: SignUpData?

    // MARK: - Outlets
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet var avatarImageViews: [UIImageView]!
    @IBOutlet weak var worldPicker: UIPickerView!

    // MARK: - State
    private var selectedAvatarIndex: Int? = nil

    private let worlds = [
        "Math Kingdom",
        "English Academy",
        "Geography Explorer"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        worldPicker.dataSource = self
        worldPicker.delegate = self
        worldPicker.selectRow(0, inComponent: 0, animated: false)

        setupAvatarTaps()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Make avatars circular
        for iv in avatarImageViews {
            iv.layer.cornerRadius = iv.bounds.height / 2
            iv.clipsToBounds = true
        }
    }

    // MARK: - Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return worlds.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return worlds[row]
    }

    // MARK: - Avatar selection
    private func setupAvatarTaps() {
        for (index, iv) in avatarImageViews.enumerated() {
            iv.isUserInteractionEnabled = true
            iv.tag = index
            iv.layer.borderWidth = 0

            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAvatarImage(_:)))
            iv.addGestureRecognizer(tap)
        }
    }

    @objc private func didTapAvatarImage(_ gesture: UITapGestureRecognizer) {
        guard let iv = gesture.view as? UIImageView else { return }

        selectedAvatarIndex = iv.tag

        for v in avatarImageViews { v.layer.borderWidth = 0 }
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.systemGreen.cgColor
    }

    // MARK: - Actions
    @IBAction func didTapSignUp(_ sender: UIButton) {
        guard let signUpData else {
            assertionFailure("signUpData was not set before showing SignUpDetailsViewController")
            return
        }

        let selectedWorld = worlds[worldPicker.selectedRow(inComponent: 0)]
        let avatarIndex = selectedAvatarIndex ?? 0

        // Map the avatar index to the image name used throughout the app
        let startupAvatarNames = ["avatar0", "avatar1", "avatar2", "avatar3"]
        let avatarName = avatarIndex < startupAvatarNames.count
            ? startupAvatarNames[avatarIndex]
            : "avatar0"
        UserDefaults.standard.set(avatarName, forKey: "selected_avatar_name")

        // Ask for a recovery PIN before finishing signup. This is what lets
        // "forgot password" actually verify identity later instead of just
        // trusting a username (the app collects no email/phone to verify
        // against otherwise). Kept as its own step so a typo here doesn't
        // get buried among the rest of the signup fields.
        askForRecoveryPIN { [weak self] pin in
            guard let self, let pin else { return }
            self.finishSignUp(signUpData: signUpData, selectedWorld: selectedWorld,
                               avatarIndex: avatarIndex, recoveryPIN: pin)
        }
    }

    private func askForRecoveryPIN(completion: @escaping (String?) -> Void) {
        let alert = UIAlertController(
            title: "Set a recovery PIN",
            message: "Pick a 4–6 digit PIN. You'll need it if you ever forget your password, so remember it (or write it down somewhere safe).",
            preferredStyle: .alert
        )
        alert.addTextField { tf in
            tf.placeholder = "PIN (4–6 digits)"
            tf.keyboardType = .numberPad
            tf.isSecureTextEntry = true
        }
        alert.addTextField { tf in
            tf.placeholder = "Repeat PIN"
            tf.keyboardType = .numberPad
            tf.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in completion(nil) })
        alert.addAction(UIAlertAction(title: "Continue", style: .default) { [weak self] _ in
            let pin1 = alert.textFields?[0].text ?? ""
            let pin2 = alert.textFields?[1].text ?? ""
            let isNumeric = !pin1.isEmpty && pin1.allSatisfy { $0.isNumber }

            guard isNumeric, (4...6).contains(pin1.count) else {
                self?.showAlert(title: "Invalid PIN", message: "PIN must be 4 to 6 digits.")
                completion(nil)
                return
            }
            guard pin1 == pin2 else {
                self?.showAlert(title: "Mismatch", message: "PINs don't match. Please try again.")
                completion(nil)
                return
            }
            completion(pin1)
        })
        present(alert, animated: true)
    }

    private func finishSignUp(signUpData: SignUpData, selectedWorld: String, avatarIndex: Int, recoveryPIN: String) {
        // Save session (so map can show username/avatar)
        // Switch account context — saves previous user's data and starts a clean slate.
        AccountSwitcher.switchToUser(signUpData.username)
        Session.shared.clearLocalProgress()

        Session.shared.currentUser = CurrentUser(
            username: signUpData.username,
            avatarIndex: avatarIndex,
            level: 1,
            xp: 0,
            age: signUpData.age
        )
        Session.shared.save()   // persist so session survives restarts

        // Insert into Supabase, then proceed
        SupabaseManager.shared.insertProfile(
            username: signUpData.username,
            password: signUpData.password,
            age: signUpData.age,
            grade: signUpData.grade,
            isParent: signUpData.isParent,
            avatar: avatarIndex,
            startingWorld: selectedWorld,
            recoveryPIN: recoveryPIN
        ) { token in
            DispatchQueue.main.async {
                if let token {
                    if var user = Session.shared.currentUser {
                        user.sessionToken = token
                        Session.shared.currentUser = user
                        Session.shared.save()
                    }
                    AuthState.isLoggedIn = true
                    // Reset onboarding so new account always sees the dragon guide
                    UserDefaults.standard.set(false, forKey: "onboarding_completed")
                    // Reset all diagnostic flags so new account sees diagnostic in every world
                    for key in ["math_diagnostic_done", "eng_diagnostic_done",
                                "geo_diagnostic_done", "sci_diagnostic_done",
                                "his_diagnostic_done"] {
                        UserDefaults.standard.set(false, forKey: key)
                    }
                    AppRouter.showMainApp()   // ✅ navigate once, after success
                } else {
                    self.showAlert(title: "Could not sign up",
                                    message: "That username may already be taken, or there was a connection problem. Please try again.")
                }
            }
        }
    }

    @IBAction func didTapPrivacyPolicy(_ sender: UIButton) {
        // Was pointing at a dead placeholder URL (https://example.com/privacy).
        // Now opens the real hosted privacy policy (required before App Store
        // / Play submission — Apple and Google both require this to be a live URL).
        present(SFSafariViewController(url: AppLinks.privacyPolicy), animated: true)
    }

    // MARK: - Helpers
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

