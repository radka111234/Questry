import XCTest

/// Generates real, native-resolution App Store screenshots by driving the
/// app in the Simulator on a GitHub Actions macOS runner — no local Mac or
/// Xcode needed. Triggered manually from the repo's Actions tab
/// (workflow_dispatch on "Screenshots"), which uploads the results as a
/// downloadable zip.
///
/// Each test launches the app with "-UITestScreenshots" so it seeds a fake,
/// offline, logged-in session (see ScreenshotTestSupport.swift in the main
/// app target) instead of hitting real login/Supabase, then navigates to
/// one screen and saves a PNG.
final class ScreenshotTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // MARK: - Saving

    /// Where finished PNGs are written.
    ///
    /// This process runs inside the iOS Simulator, which does NOT reliably
    /// inherit the shell environment that invoked `xcodebuild test` (so
    /// GITHUB_WORKSPACE can't be trusted here) — but a Simulator process is
    /// otherwise unsandboxed and can write to any path on the real Mac. So
    /// this writes to a fixed, predictable location on the Mac itself, and
    /// the workflow copies it into the repo checkout afterward.
    private var outputDir: URL {
        let home = NSHomeDirectory()
        // A real "/Users/<name>" home means we can write there directly.
        // If NSHomeDirectory() instead points inside the Simulator's own
        // sandboxed container (path contains "CoreSimulator"), fall back to
        // GitHub's macOS runner user, which is always "runner".
        let base = home.contains("CoreSimulator")
            ? "/Users/runner/questry-screenshots"
            : home + "/questry-screenshots"
        let tag = ProcessInfo.processInfo.environment["DEVICE_TAG"] ?? "default"
        let dir = URL(fileURLWithPath: base).appendingPathComponent(tag)
        // Deliberately NOT `try?` here: a silently swallowed failure here
        // previously made every screenshot vanish without a trace. Print
        // plainly to stdout, which xcodebuild surfaces in the CI log, so a
        // wrong guess about the path is visible instead of just "no files".
        do {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            print("SCREENSHOTS: output dir ready at \(dir.path) (NSHomeDirectory=\(home))")
        } catch {
            print("SCREENSHOTS: FAILED to create \(dir.path) — \(error) (NSHomeDirectory=\(home))")
        }
        return dir
    }

    /// Captures the screen, attaches it to the test report, and — the part
    /// that actually matters — writes the raw PNG straight to disk so the
    /// workflow can upload it as-is, at full native resolution. Fails the
    /// test loudly if the write doesn't actually happen, instead of quietly
    /// reporting success with nothing on disk.
    private func save(_ name: String) {
        let shot = XCUIScreen.main.screenshot()

        let attachment = XCTAttachment(screenshot: shot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)

        guard let data = shot.image.pngData() else {
            XCTFail("Could not encode screenshot '\(name)' as PNG")
            return
        }

        let url = outputDir.appendingPathComponent("\(name).png")
        do {
            try data.write(to: url)
            print("SCREENSHOTS: wrote \(url.path) (\(data.count) bytes)")
        } catch {
            XCTFail("Could not write screenshot '\(name)' to \(url.path): \(error)")
        }
    }

    private func launchApp(showOnboarding: Bool = false) -> XCUIApplication {
        let app = XCUIApplication()
        var args = ["-UITestScreenshots"]
        if showOnboarding { args.append("-UITestShowOnboarding") }
        app.launchArguments = args
        app.launch()
        return app
    }

    // MARK: - Screens

    func test01_WorldMap() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20),
                      "Main tab bar never appeared")
        Thread.sleep(forTimeInterval: 1.0)   // let map artwork finish laying out
        save("world-map")
    }

    func test02_DragonWelcome() {
        let app = launchApp(showOnboarding: true)
        XCTAssertTrue(app.staticTexts["Welcome to Questry! 🐉"].waitForExistence(timeout: 20),
                      "Onboarding welcome page never appeared")
        Thread.sleep(forTimeInterval: 0.5)
        save("dragon-welcome")
    }

    func test03_DailyQuests() {
        let app = launchApp()
        let questsTab = app.tabBars.buttons["tab.quests"]
        XCTAssertTrue(questsTab.waitForExistence(timeout: 20))
        questsTab.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("daily-quests")
    }

    func test04_Badges() {
        let app = launchApp()
        let profileTab = app.tabBars.buttons["tab.profile"]
        XCTAssertTrue(profileTab.waitForExistence(timeout: 20))
        profileTab.tap()

        let badgesButton = app.buttons["profile.badges"]
        XCTAssertTrue(badgesButton.waitForExistence(timeout: 10))
        badgesButton.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("badges")
    }

    func test05_AvatarStudio() {
        let app = launchApp()
        let profileTab = app.tabBars.buttons["tab.profile"]
        XCTAssertTrue(profileTab.waitForExistence(timeout: 20))
        profileTab.tap()

        let avatarButton = app.buttons["profile.avatarStudio"]
        XCTAssertTrue(avatarButton.waitForExistence(timeout: 10))
        avatarButton.tap()

        let segment = app.segmentedControls["avatarStudio.classSegment"]
        XCTAssertTrue(segment.waitForExistence(timeout: 10))
        // Warrior, Cowboy, Princess, Mage, Original — Mage is index 3.
        segment.buttons.element(boundBy: 3).tap()
        Thread.sleep(forTimeInterval: 0.8)
        save("avatar-studio")
    }

    // MARK: - Profile extras

    func test06_RewardsShop() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.profile"].waitForExistence(timeout: 20))
        app.tabBars.buttons["tab.profile"].tap()
        let btn = app.buttons["profile.rewardsShop"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 0.8)
        save("rewards-shop")
    }

    func test07_WorldProgress() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.profile"].waitForExistence(timeout: 20))
        app.tabBars.buttons["tab.profile"].tap()
        let btn = app.buttons["profile.worldProgress"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 0.8)
        save("world-progress")
    }

    func test08_ProgressAnalytics() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.profile"].waitForExistence(timeout: 20))
        app.tabBars.buttons["tab.profile"].tap()
        let btn = app.buttons["profile.analytics"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 0.8)
        save("progress-analytics")
    }

    // MARK: - Settings and legal/support screens
    //
    // All chained into one launch since they share one Settings table —
    // Settings explicitly re-enables the native nav bar for itself and
    // everything pushed from it (see SettingsViewController.swift), so
    // the standard back button is used to step back between rows. A
    // missing row or back button is logged and skipped rather than
    // failing the whole chain, so one unexpected screen doesn't cost
    // every screenshot after it.

    func test09_SettingsAndLegal() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.profile"].waitForExistence(timeout: 20))
        app.tabBars.buttons["tab.profile"].tap()

        let settingsBtn = app.buttons["profile.settings"]
        guard settingsBtn.waitForExistence(timeout: 10) else {
            XCTFail("Settings button never appeared")
            return
        }
        settingsBtn.tap()
        Thread.sleep(forTimeInterval: 0.6)
        save("settings")

        func goBack() {
            let back = app.navigationBars.buttons.element(boundBy: 0)
            if back.waitForExistence(timeout: 8) {
                back.tap()
                Thread.sleep(forTimeInterval: 0.3)
            } else {
                print("SCREENSHOTS: no back button found, settings chain may be stuck")
            }
        }

        func openRow(_ label: String, saveAs name: String, thenBack: Bool = true) {
            let cell = app.staticTexts[label]
            guard cell.waitForExistence(timeout: 8) else {
                print("SCREENSHOTS: settings row '\(label)' not found, skipping")
                return
            }
            cell.tap()
            Thread.sleep(forTimeInterval: 0.6)
            save(name)
            if thenBack { goBack() }
        }

        // Preferences has a nested Language Picker worth its own shot.
        openRow("Preferences", saveAs: "preferences", thenBack: false)
        let langRow = app.cells["pref.language.0"]
        if langRow.waitForExistence(timeout: 8) {
            langRow.tap()
            Thread.sleep(forTimeInterval: 0.6)
            save("language-picker")
            goBack()
        } else {
            print("SCREENSHOTS: language picker row not found, skipping")
        }
        goBack() // out of Preferences

        openRow("Notifications", saveAs: "notifications")
        openRow("Privacy", saveAs: "privacy")
        openRow("Subscription", saveAs: "subscription")
        openRow("Help Center", saveAs: "help-center")
        openRow("Your Feedback", saveAs: "feedback")
        openRow("Terms of Service", saveAs: "terms-of-service", thenBack: false)
        openRow("Privacy Policy", saveAs: "privacy-policy", thenBack: false)
        openRow("Acknowledgements", saveAs: "acknowledgements", thenBack: false)
    }

    // MARK: - Subject hubs (all five islands — same template, distinct art)

    func test10_MathHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.math"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("math-hub")
    }

    func test11_EnglishHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.english"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("english-hub")
    }

    func test12_GeographyHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.geography"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("geography-hub")
    }

    func test13_ScienceHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.science"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("science-hub")
    }

    func test14_HistoryHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.history"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("history-hub")
    }

    // MARK: - Diagnostic quiz (one representative — all five subjects
    // share the same template)

    func test15_MathDiagnostic() {
        let app = XCUIApplication()
        app.launchArguments = ["-UITestScreenshots", "-UITestShowDiagnostic"]
        app.launch()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        let btn = app.buttons["home.island.math"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("diagnostic")
    }

    // MARK: - Subject-hub extras (minigames and side activities)

    func test16_MathExam() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.math"].tap()
        let btn = app.buttons["math.examBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("math-exam")
    }

    func test17_MathRunner() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.math"].tap()
        let btn = app.buttons["math.runnerBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("math-runner")
    }

    func test18_MathComparisonHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.math"].tap()
        let btn = app.buttons["math.compareBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("math-comparison-hub")
    }

    func test19_GeographyPuzzleHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.geography"].tap()
        let btn = app.buttons["geo.puzzleBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("geography-puzzle-hub")
    }

    func test20_ScienceBodyLabHub() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.science"].tap()
        let btn = app.buttons["sci.bodyLabBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("science-body-lab-hub")
    }

    func test21_ScienceAlchemy() {
        let app = launchApp()
        XCTAssertTrue(app.tabBars.buttons["tab.home"].waitForExistence(timeout: 20))
        app.buttons["home.island.science"].tap()
        let btn = app.buttons["sci.alchemyBtn"]
        XCTAssertTrue(btn.waitForExistence(timeout: 10))
        btn.tap()
        Thread.sleep(forTimeInterval: 1.0)
        save("science-alchemy")
    }
}
