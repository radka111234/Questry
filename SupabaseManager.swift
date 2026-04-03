import Foundation
import CryptoKit

struct Profile: Codable {
    let username: String
    let xp: Int
    let level: Int
    let avatar: Int
    let age: Int
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

    // MARK: - Fetch (optional for debugging)
    func fetchProfiles() {
        guard let url = URL(string: "\(baseURL)/rest/v1/Profiles") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Fetch error:", error)
                return
            }

            if let http = response as? HTTPURLResponse {
                print("Fetch status:", http.statusCode)
            }

            guard let data = data else { return }
            print("Fetch response:", String(data: data, encoding: .utf8) ?? "")
        }.resume()
    }

    // MARK: - Insert Profile (matches your current UI)
    func insertProfile(
        username: String,
        password: String,
        age: Int,
        grade: Int,
        isParent: Bool,
        avatar: Int,
        startingWorld: String,
        completion: @escaping (Bool) -> Void
    ) {
        guard let url = URL(string: "\(baseURL)/rest/v1/Profiles") else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("return=representation", forHTTPHeaderField: "Prefer")

        let body: [String: Any] = [
            "username": username,
            "password": hashPassword(password),   // stored as SHA-256 hash
            "age": age,
            "grade": grade,
            "is_parent": isParent,
            "avatar": avatar,
            "starting_world": startingWorld,
            "xp": 0,
            "level": 1
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Insert error:", error)
                completion(false)
                return
            }

            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            print("Insert status:", status)

            if let data = data {
                print("Insert response:", String(data: data, encoding: .utf8) ?? "")
            }

            completion(status == 200 || status == 201)
        }.resume()
    }
    
    // MARK: - Update XP & Level (PATCH)
    func updateProgress(
        username: String,
        xp: Int,
        level: Int,
        completion: @escaping (Bool) -> Void
    ) {
        guard var components = URLComponents(string: "\(baseURL)/rest/v1/Profiles") else {
            completion(false); return
        }

        components.queryItems = [
            URLQueryItem(name: "username", value: "eq.\(username)")
        ]

        guard let url = components.url else { completion(false); return }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("return=minimal", forHTTPHeaderField: "Prefer")

        let body: [String: Any] = ["xp": xp, "level": level]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print("updateProgress error:", error)
                completion(false)
                return
            }
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            print("updateProgress status:", status)
            completion(status == 200 || status == 204)
        }.resume()
    }

    // MARK: - Change Username (PATCH)
    func changeUsername(
        oldUsername: String,
        newUsername: String,
        completion: @escaping (Bool) -> Void
    ) {
        guard var components = URLComponents(string: "\(baseURL)/rest/v1/Profiles") else {
            completion(false); return
        }
        components.queryItems = [URLQueryItem(name: "username", value: "eq.\(oldUsername)")]
        guard let url = components.url else { completion(false); return }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("return=minimal", forHTTPHeaderField: "Prefer")

        let body: [String: Any] = ["username": newUsername]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, response, error in
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            completion(error == nil && (status == 200 || status == 204))
        }.resume()
    }

    // MARK: - Change Password (PATCH)
    func changePassword(
        username: String,
        newPassword: String,
        completion: @escaping (Bool) -> Void
    ) {
        guard var components = URLComponents(string: "\(baseURL)/rest/v1/Profiles") else {
            completion(false); return
        }
        components.queryItems = [URLQueryItem(name: "username", value: "eq.\(username)")]
        guard let url = components.url else { completion(false); return }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("return=minimal", forHTTPHeaderField: "Prefer")

        let body: [String: Any] = ["password": hashPassword(newPassword)]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { _, response, error in
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            completion(error == nil && (status == 200 || status == 204))
        }.resume()
    }

    func validateLogin(
        username: String,
        password: String,
        completion: @escaping (Profile?) -> Void
    ) {
        guard var components = URLComponents(string: "\(baseURL)/rest/v1/Profiles") else {
            completion(nil); return
        }

        components.queryItems = [
            URLQueryItem(name: "select", value: "username,xp,level,avatar,age"),
            URLQueryItem(name: "username", value: "eq.\(username)"),
            URLQueryItem(name: "password", value: "eq.\(hashPassword(password))"),
            URLQueryItem(name: "limit", value: "1")
        ]

        guard let url = components.url else { completion(nil); return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200,
                  let data = data
            else { completion(nil); return }

            do {
                let profiles = try JSONDecoder().decode([Profile].self, from: data)
                completion(profiles.first)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
