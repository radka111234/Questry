import UIKit

enum AppRouter {

    static func showMainApp() {
        let tab = MainTabBarController()

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        window.rootViewController = tab
        window.makeKeyAndVisible()
    }

    static func showLogin() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let login = sb.instantiateViewController(withIdentifier: "LoginViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }

        window.rootViewController = login
        window.makeKeyAndVisible()
    }
}
