import Foundation

/// Support for automated App Store screenshot capture, driven by the
/// QuestryUITests target running on a GitHub Actions macOS runner (see
/// .github/workflows/screenshots.yml). This lets Radka generate real,
/// native-resolution Simulator screenshots without needing a Mac herself.
///
/// Only active when the app is launched with "-UITestScreenshots" as a
/// launch argument, which only the screenshot UI tests ever pass. A normal
/// install never sees this code path run.
enum ScreenshotTestSupport {

    static var isActive: Bool {
        ProcessInfo.processInfo.arguments.contains("-UITestScreenshots")
    }

    /// Whether this particular launch should show the onboarding overlay
    /// (used for the "dragon guide" welcome screenshot) instead of skipping
    /// straight to a populated main app.
    private static var showOnboarding: Bool {
        ProcessInfo.processInfo.arguments.contains("-UITestShowOnboarding")
    }

    /// Whether this particular launch should leave Math's diagnostic quiz
    /// un-done, so visiting the Math world shows the diagnostic screen
    /// instead of the normal hub. Every other screenshot test wants the
    /// diagnostic already out of the way, so this is false by default.
    private static var showDiagnostic: Bool {
        ProcessInfo.processInfo.arguments.contains("-UITestShowDiagnostic")
    }

    /// Seeds a fake logged-in session with representative progress data —
    /// no network calls, no real Supabase account — so every screen shows
    /// real-looking content instead of an empty new-account state.
    static func seedIfNeeded() {
        guard isActive else { return }

        let d = UserDefaults.standard
        let username = "Preview"

        d.set(showOnboarding ? false : true, forKey: "onboarding_completed")

        // Fake logged-in session (read back by Session.restoreFromDefaults()).
        d.set(username, forKey: "session_username")
        d.set(3, forKey: "session_avatarIndex")
        d.set(11, forKey: "session_age")
        d.set(750, forKey: "session_xp_\(username)")
        d.set(2, forKey: "session_level_\(username)")
        d.set("avatar_mage_2", forKey: "avatar_name_\(username)")
        d.set("avatar_mage_2", forKey: "selected_avatar_name")
        AuthState.isLoggedIn = true

        // Representative progress so islands/badges/streak aren't empty.
        d.set([0, 1, 2], forKey: "math_completed_topic_ids")
        d.set([0, 1], forKey: "eng_completed_topic_ids")
        d.set([0], forKey: "geo_completed_topic_ids")
        d.set(true, forKey: "exam_passed_math")
        d.set(true, forKey: "exam_passed_eng")
        d.set(true, forKey: "exam_passed_geo")
        d.set(23, forKey: "total_quests_completed")
        d.set(6, forKey: "math_streak_count")
        d.set(Date(), forKey: "math_streak_last_date")

        // Every subject hub pushes its own diagnostic quiz on first visit
        // unless this is marked done — leave Math's open when the caller
        // explicitly wants to screenshot the diagnostic itself, otherwise
        // every subject stays past it so the hub screenshots are clean.
        d.set(!showDiagnostic, forKey: "math_diagnostic_done")
        d.set(true, forKey: "eng_diagnostic_done")
        d.set(true, forKey: "geo_diagnostic_done")
        d.set(true, forKey: "sci_diagnostic_done")
        d.set(true, forKey: "his_diagnostic_done")

        // English also prompts for a teaching language on first visit —
        // mark it chosen so the hub screenshot isn't blocked by that prompt.
        d.set(true, forKey: "eng_teaching_language_chosen")

        // Today's Daily Quests — dq_date must match DailyQuestManager's own
        // "yyyy-MM-dd" format exactly, or it resets these flags on first access.
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        d.set(fmt.string(from: Date()), forKey: "dq_date")
        d.set(true, forKey: "dq_login")
        d.set(true, forKey: "dq_math")
        d.set(true, forKey: "dq_geo")
        d.set(false, forKey: "dq_eng")
        d.set(false, forKey: "dq_sci")
        d.set(false, forKey: "dq_his")

        Session.shared.restoreFromDefaults()
    }
}
