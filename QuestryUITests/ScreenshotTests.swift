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

    /// Where finished PNGs are written. GITHUB_WORKSPACE is the checked-out
    /// repo root on the CI runner; DEVICE_TAG identifies which simulator
    /// this run used, so multiple device sizes don't overwrite each other.
    private var outputDir: URL {
        let base = ProcessInfo.processInfo.environment["GITHUB_WORKSPACE"] ?? NSTemporaryDirectory()
        let tag = ProcessInfo.processInfo.environment["DEVICE_TAG"] ?? "default"
        let dir = URL(fileURLWithPath: base).appendingPathComponent("screenshots").appendingPathComponent(tag)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir
    }

    /// Captures the screen, attaches it to the test report, and — the part
    /// that actually matters — writes the raw PNG straight to disk so the
    /// workflow can upload it as-is, at full native resolution.
    private func save(_ name: String) {
        let shot = XCUIScreen.main.screenshot()

        let attachment = XCTAttachment(screenshot: shot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)

        if let data = shot.image.pngData() {
            try? data.write(to: outputDir.appendingPathComponent("\(name).png"))
        } else {
            XCTFail("Could not encode screenshot '\(name)' as PNG")
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
}
