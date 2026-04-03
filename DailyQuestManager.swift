import Foundation

final class DailyQuestManager {
    static let shared = DailyQuestManager()
    private init() { resetIfNewDay() }

    // UserDefaults keys
    private let dateKey       = "dq_date"
    private let loginKey      = "dq_login"
    private let mathKey       = "dq_math"
    private let geoKey        = "dq_geo"
    private let engKey        = "dq_eng"
    private let sciKey        = "dq_sci"
    private let hisKey        = "dq_his"
    private let answersKey    = "dq_answers"
    private let avatarKey     = "dq_avatar"
    private let progressKey   = "dq_progress"
    private let unlockKey     = "dq_unlock"
    let totalQuestsKey        = "total_quests_completed"

    private var ud: UserDefaults { .standard }

    private func today() -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.string(from: Date())
    }

    func resetIfNewDay() {
        if (ud.string(forKey: dateKey) ?? "") != today() {
            ud.set(today(), forKey: dateKey)
            ud.set(false, forKey: loginKey)
            ud.set(false, forKey: mathKey)
            ud.set(false, forKey: geoKey)
            ud.set(false, forKey: engKey)
            ud.set(false, forKey: sciKey)
            ud.set(false, forKey: hisKey)
            ud.set(0, forKey: answersKey)
            ud.set(false, forKey: avatarKey)
            ud.set(false, forKey: progressKey)
            ud.set(false, forKey: unlockKey)
        }
    }

    // MARK: - State
    var isLoginDone: Bool     { ud.bool(forKey: loginKey) }
    var isMathDone: Bool      { ud.bool(forKey: mathKey) }
    var isGeoDone: Bool       { ud.bool(forKey: geoKey) }
    var isEngDone: Bool       { ud.bool(forKey: engKey) }
    var isSciDone: Bool       { ud.bool(forKey: sciKey) }
    var isHisDone: Bool       { ud.bool(forKey: hisKey) }
    var correctAnswers: Int   { ud.integer(forKey: answersKey) }
    var isAnswersDone: Bool   { correctAnswers >= 5 }
    var isAvatarDone: Bool    { ud.bool(forKey: avatarKey) }
    var isProgressDone: Bool  { ud.bool(forKey: progressKey) }
    var isUnlockDone: Bool    { ud.bool(forKey: unlockKey) }
    var totalQuestsCompleted: Int { ud.integer(forKey: totalQuestsKey) }

    // MARK: - Record Events

    @discardableResult
    func recordLogin() -> Bool {
        // Always update the streak when the user opens the app each day
        StreakManager.shared.recordPlay()
        guard !isLoginDone else { return false }
        ud.set(true, forKey: loginKey)
        Session.shared.addXP(10)
        return true
    }

    @discardableResult
    func recordMathLesson() -> Bool {
        guard !isMathDone else { return false }
        ud.set(true, forKey: mathKey)
        Session.shared.addXP(20)
        incrementTotalQuests()
        return true
    }

    @discardableResult
    func recordGeoLesson() -> Bool {
        guard !isGeoDone else { return false }
        ud.set(true, forKey: geoKey)
        Session.shared.addXP(20)
        incrementTotalQuests()
        return true
    }

    @discardableResult
    func recordEngLesson() -> Bool {
        guard !isEngDone else { return false }
        ud.set(true, forKey: engKey)
        Session.shared.addXP(20)
        incrementTotalQuests()
        return true
    }

    @discardableResult
    func recordSciLesson() -> Bool {
        guard !isSciDone else { return false }
        ud.set(true, forKey: sciKey)
        Session.shared.addXP(20)
        incrementTotalQuests()
        return true
    }

    @discardableResult
    func recordHisLesson() -> Bool {
        guard !isHisDone else { return false }
        ud.set(true, forKey: hisKey)
        Session.shared.addXP(20)
        incrementTotalQuests()
        return true
    }

    @discardableResult
    func recordCorrectAnswer() -> Bool {
        let current = correctAnswers
        guard current < 5 else { return false }
        ud.set(current + 1, forKey: answersKey)
        if current + 1 >= 5 {
            Session.shared.addXP(15)
            return true
        }
        return false
    }

    @discardableResult
    func recordAvatarVisit() -> Bool {
        guard !isAvatarDone else { return false }
        ud.set(true, forKey: avatarKey)
        Session.shared.addXP(5)
        return true
    }

    @discardableResult
    func recordProgressView() -> Bool {
        guard !isProgressDone else { return false }
        ud.set(true, forKey: progressKey)
        Session.shared.addXP(5)
        return true
    }

    @discardableResult
    func recordTopicUnlock() -> Bool {
        guard !isUnlockDone else { return false }
        ud.set(true, forKey: unlockKey)
        Session.shared.addXP(30)
        return true
    }

    /// Called from ExamQuestViewController and InteractiveQuestionViewController on quest/exam completion
    func incrementTotalQuests() {
        ud.set(totalQuestsCompleted + 1, forKey: totalQuestsKey)
    }
}
