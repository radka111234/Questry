import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window.rootViewController = storyboard.instantiateInitialViewController()

        self.window = window
        window.makeKeyAndVisible()

        // Reload the full UI when the user switches app language
        NotificationCenter.default.addObserver(
            forName: .appLanguageDidChange,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self, let window = self.window else { return }
            let newRoot: UIViewController = AuthState.isLoggedIn
                ? MainTabBarController()
                : { let sb = UIStoryboard(name: "Main", bundle: nil)
                    return sb.instantiateInitialViewController() ?? UIViewController() }()

            UIView.transition(with: window,
                              duration: 0.35,
                              options: .transitionCrossDissolve,
                              animations: { window.rootViewController = newRoot })
        }
    }
}
