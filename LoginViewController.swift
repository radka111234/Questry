import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBAction func didTapLogin(_ sender: UIButton) {
        let username = usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordField.text ?? ""

        guard !username.isEmpty, !password.isEmpty else { return }

        sender.isEnabled = false

        SupabaseManager.shared.validateLogin(username: username, password: password) { profile in
            DispatchQueue.main.async {
                sender.isEnabled = true

                guard let profile = profile else {
                    let alert = UIAlertController(
                        title: "Login failed",
                        message: "Wrong username or password.",
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                    return
                }

                // Logged in
                AuthState.isLoggedIn = true

                // Update session — prefer the higher XP between Supabase and local.
                // Local key is per-username so it survives logout and re-login.
                let localXP    = UserDefaults.standard.integer(forKey: "session_xp_\(profile.username)")
                let bestXP     = max(profile.xp, localXP)
                let bestLevel  = max(1, (bestXP / 500) + 1)

                Session.shared.currentUser = CurrentUser(
                    username: profile.username,
                    avatarIndex: profile.avatar,
                    level: bestLevel,
                    xp: bestXP,
                    age: profile.age
                )

                // Restore this user's avatar BEFORE calling save() so save() captures
                // the correct avatar name under avatar_name_<username>.
                // Always override selected_avatar_name so no other account's avatar leaks in.
                let allAvatarNames = [
                    "avatar_warrior_1", "avatar_warrior_2", "avatar_warrior_3",
                    "avatar_cowboy_1",  "avatar_cowboy_2",  "avatar_cowboy_3",
                    "avatar_princess_1","avatar_princess_2","avatar_princess_3",
                    "avatar_mage_1",    "avatar_mage_2",    "avatar_mage_3",
                    "avatar0", "avatar1", "avatar2", "avatar3"
                ]
                // Prefer the per-user saved name (set via AvatarStudio), fall back to Supabase index
                let perUserName = UserDefaults.standard.string(forKey: "avatar_name_\(profile.username)")
                let avatarName = perUserName ?? {
                    let idx = max(0, min(profile.avatar, allAvatarNames.count - 1))
                    return allAvatarNames[idx]
                }()
                UserDefaults.standard.set(avatarName, forKey: "selected_avatar_name")

                Session.shared.save()   // persist — now reads the correct avatar for this user

                // Show TAB BAR controller
                let tab = MainTabBarController()
                tab.modalPresentationStyle = .fullScreen
                self.present(tab, animated: true)
            }
        }
    }

    @IBAction func didTapForgotPassword(_ sender: UIButton) {
        // Step 1: ask for username and verify it exists
        let step1 = UIAlertController(
            title: "Forgot password?",
            message: "Enter your username to continue.",
            preferredStyle: .alert
        )
        step1.addTextField { tf in
            tf.placeholder = "Username"
            tf.autocapitalizationType = .none
            tf.autocorrectionType = .no
        }
        step1.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        step1.addAction(UIAlertAction(title: "Next", style: .default) { [weak self] _ in
            let username = (step1.textFields?.first?.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            guard !username.isEmpty else { return }

            SupabaseManager.shared.checkUsernameExists(username: username) { exists in
                DispatchQueue.main.async {
                    if exists {
                        self?.showNewPasswordAlert(for: username)
                    } else {
                        let err = UIAlertController(
                            title: "Not found",
                            message: "No account found with that username.",
                            preferredStyle: .alert
                        )
                        err.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(err, animated: true)
                    }
                }
            }
        })
        present(step1, animated: true)
    }

    private func showNewPasswordAlert(for username: String) {
        // Step 2: ask for new password + confirmation
        let step2 = UIAlertController(
            title: "New password",
            message: "Choose a new password for \(username).",
            preferredStyle: .alert
        )
        step2.addTextField { tf in
            tf.placeholder = "New password"
            tf.isSecureTextEntry = true
        }
        step2.addTextField { tf in
            tf.placeholder = "Repeat password"
            tf.isSecureTextEntry = true
        }
        step2.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        step2.addAction(UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            let pw1 = step2.textFields?[0].text ?? ""
            let pw2 = step2.textFields?[1].text ?? ""

            guard pw1.count >= 4 else {
                self?.showSimpleAlert(title: "Too short", message: "Password must be at least 4 characters.")
                return
            }
            guard pw1 == pw2 else {
                self?.showSimpleAlert(title: "Mismatch", message: "Passwords don't match. Please try again.")
                return
            }

            SupabaseManager.shared.changePassword(username: username, newPassword: pw1) { success in
                DispatchQueue.main.async {
                    self?.showSimpleAlert(
                        title: success ? "Done ✅" : "Error",
                        message: success ? "Password updated. You can now log in with your new password." : "Could not update password. Please try again."
                    )
                }
            }
        })
        present(step2, animated: true)
    }

    private func showSimpleAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }

    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signup = storyboard.instantiateViewController(
            withIdentifier: "SignUpViewController"
        )
        navigationController?.pushViewController(signup, animated: true)
    }
}
