import Foundation
import CryptoKit

struct Profile: Codable {
    let username: String
    let xp: Int
    let level: Int
    let avatar: Int
    let age: Int
    let sessionToken: String

    enum CodingKeys: String, CodingKey {
        case username, xp, level, avatar, age
        case sessionToken = "session_token"
    }
}

final class SupabaseManager {

    static let shared = SupabaseManager()

    private let baseURL = "https://ixbkkknalnalibetwkvg.supabase.co"

    // MARK: - Password hashing
    /// Returns a hex-encoded SHA-256 hash of the input string.
    /// Passwords are always stored and compared in hashed form  -  never plain text.
    func hashPassword(_ input: String) -> String {
        let digest = SHA256.hash(data: Data(input.utf8))
        return digest.compactMap { String(format: "%02x", $0) }.joined()
    }
    private let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4Ymtra25hbG5hbGliZXR3a3ZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI0MzEwNDgsImV4cCI6MjA4ODAwNzA0OH0.Ni_h0fU4YlkQkqc_Y6yQ4TM2C8moKjOCFL-DNHC19hQ"   // use anon public key only

    // MARK: - RPC helper
    //
    // Every write and every read of the Profiles table now goes through a
    // Postgres function (see questry_supabase_lockdown.sql) instead of the
    // table's REST endpoint directly. The table itself no longer grants the
    // anon key any direct access, so there is nothing left for the anon key
    // to read or overwrite except through these narrow, purpose-built calls.
    private func callRPC(
        _ function: String,
        params: [String: Any],
        completion: @escaping (Data?, Int) -> Void
    ) {
        guard let url = URL(string: "\(baseURL)/rest/v1/rpc/\(function)") else {
            completion(nil, -1)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("RPC \(function) error:", error)
                completion(nil, -1)
                return
            }
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            completion(data, status)
        }.resume()
    }

    // MARK: - Check username exists (signup availability check)
    func checkUsernameExists(username: String, completion: @escaping (Bool) -> Void) {
        callRPC("app_check_username", params: ["p_username": username]) { data, status in
            guard status == 200, let data = data,
                  let exists = try? JSONDecoder().decode(Bool.self, from: data)
            else { completion(false); return }
            completion(exists)
        }
    }

    // MARK: - Create profile (signup). Returns a session token on success.
    func insertProfile(
        username: String,
        password: String,
        age: Int,
        grade: Int,
        isParent: Bool,
        avatar: Int,
        startingWorld: String,
        completion: @escaping (String?) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_password_hash": hashPassword(password),
            "p_age": age,
            "p_grade": grade,
            "p_is_parent": isParent,
            "p_avatar": avatar,
            "p_starting_world": startingWorld
        ]
        callRPC("app_create_profile", params: params) { data, status in
            guard status == 200, let data = data,
                  let rows = try? JSONDecoder().decode([[String: String]].self, from: data),
                  let token = rows.first?["session_token"]
            else { completion(nil); return }
            completion(token)
        }
    }

    // MARK: - Login. Returns the profile (with a fresh session token) or nil.
    func validateLogin(
        username: String,
        password: String,
        completion: @escaping (Profile?) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_password_hash": hashPassword(password)
        ]
        callRPC("app_login", params: params) { data, status in
            guard status == 200, let data = data,
                  let profiles = try? JSONDecoder().decode([Profile].self, from: data),
                  let profile = profiles.first
            else { completion(nil); return }
            completion(profile)
        }
    }

    // MARK: - Update XP & level. Requires the session token issued at login.
    func updateProgress(
        username: String,
        sessionToken: String,
        xp: Int,
        level: Int,
        completion: @escaping (Bool) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_session_token": sessionToken,
            "p_xp": xp,
            "p_level": level
        ]
        callRPC("app_update_progress", params: params) { data, status in
            guard status == 200, let data = data,
                  let ok = try? JSONDecoder().decode(Bool.self, from: data)
            else { completion(false); return }
            completion(ok)
        }
    }

    // MARK: - Change username. Requires the session token.
    func changeUsername(
        username: String,
        sessionToken: String,
        newUsername: String,
        completion: @escaping (Bool) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_session_token": sessionToken,
            "p_new_username": newUsername
        ]
        callRPC("app_change_username", params: params) { data, status in
            guard status == 200, let data = data,
                  let ok = try? JSONDecoder().decode(Bool.self, from: data)
            else { completion(false); return }
            completion(ok)
        }
    }

    // MARK: - Change password from inside a logged-in session.
    // Requires the current session token; returns a new one on success.
    func changePasswordLoggedIn(
        username: String,
        sessionToken: String,
        newPassword: String,
        completion: @escaping (String?) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_session_token": sessionToken,
            "p_new_password_hash": hashPassword(newPassword)
        ]
        callRPC("app_change_password", params: params) { data, status in
            guard status == 200, let data = data,
                  let rows = try? JSONDecoder().decode([[String: String]].self, from: data),
                  let token = rows.first?["session_token"]
            else { completion(nil); return }
            completion(token)
        }
    }

    // MARK: - "Forgot password" reset.
    // NOTE: still only checks a username, same as the flow it replaces —
    // this app collects no email/phone to verify identity against, so this
    // cannot be made fully safe at the database layer. It's queued as a
    // product decision (collect a parent email, or add a recovery PIN),
    // not something this migration silently fixes. What this DOES fix is
    // that reaching it no longer means exposing the whole table.
    func resetPasswordUnverified(
        username: String,
        newPassword: String,
        completion: @escaping (Bool) -> Void
    ) {
        let params: [String: Any] = [
            "p_username": username,
            "p_new_password_hash": hashPassword(newPassword)
        ]
        callRPC("app_reset_password_unverified", params: params) { data, status in
            guard status == 200, let data = data,
                  let rows = try? JSONDecoder().decode([[String: String]].self, from: data),
                  rows.first?["session_token"] != nil
            else { completion(false); return }
            completion(true)
        }
    }
}
