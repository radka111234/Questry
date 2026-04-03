import Foundation

enum AuthState {
    private static let key = "isLoggedIn"

    static var isLoggedIn: Bool {
        get { UserDefaults.standard.bool(forKey: key) }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }

    static func logout() {
        isLoggedIn = false
    }
}
