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

        // Save session (so map can show username/avatar)
        // Clear any previous user's device-wide progress so the new account starts fresh
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
            startingWorld: selectedWorld
        ) { success in
            DispatchQueue.main.async {
                if success {
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
                    self.showAlert(title: "Database error", message: "Could not save Profile.")
                }
            }
        }
    }

    @IBAction func didTapPrivacyPolicy(_ sender: UIButton) {
        guard let url = URL(string: "https://example.com/privacy") else { return }
        present(SFSafariViewController(url: url), animated: true)
    }

    // MARK: - Helpers
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

