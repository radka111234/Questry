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
                Session.shared.save()   // persist so session survives restarts

                // Restore this user's avatar — always override so no other account's avatar leaks in
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

                // Show TAB BAR controller
                let tab = MainTabBarController()
                tab.modalPresentationStyle = .fullScreen
                self.present(tab, animated: true)
            }
        }
    }

    @IBAction func didTapForgotPassword(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Forgot password?",
            message: "Enter your username and we'll reset your password to a temporary one you can change after logging in.",
            preferredStyle: .alert
        )
        alert.addTextField { tf in
            tf.placeholder = "Your username"
            tf.autocapitalizationType = .none
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Reset", style: .default) { _ in
            let username = (alert.textFields?.first?.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            guard !username.isEmpty else { return }

            let tempPassword = "Questry1234"
            SupabaseManager.shared.changePassword(username: username, newPassword: tempPassword) { success in
                DispatchQueue.main.async {
                    if success {
                        let info = UIAlertController(
                            title: "Password reset ✅",
                            message: "Your temporary password is:\n\n\(tempPassword)\n\nLog in with it and then change your password in your profile.",
                            preferredStyle: .alert
                        )
                        info.addAction(UIAlertAction(title: "Got it", style: .default))
                        self.present(info, animated: true)
                    } else {
                        let err = UIAlertController(title: "Not found", message: "No account found with that username.", preferredStyle: .alert)
                        err.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(err, animated: true)
                    }
                }
            }
        })
        present(alert, animated: true)
    }

    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signup = storyboard.instantiateViewController(
            withIdentifier: "SignUpViewController"
        )
        navigationController?.pushViewController(signup, animated: true)
    }
}
