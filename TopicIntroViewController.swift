import UIKit

final class TopicIntroViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var xpLabel: UILabel!
    @IBOutlet weak var xpProgressView: UIProgressView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topicTitleLabel: UILabel?     // storyboard alias for titleLabel
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var topicImageView: UIImageView?  // storyboard alias for iconImageView
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var explanationCardView: UIView?  // storyboard container  -  not used in code
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var startPracticeButton: UIButton!

    var subject: String = "Math"
    var topicId: Int = 1
    var mapQuestNumber: Int = 1

    private let backButton = UIButton(type: .system)
    private let worldXPKey = "math_world_total_xp"
    private let questYellow = UIColor(red: 243/255, green: 234/255, blue: 72/255, alpha: 1.0)

    // mission/difficulty/XP labels removed  -  replaced by custom voice in a future update
    private let difficultyPillLabel = UILabel()  // kept as property to satisfy loadTopic() references
    private let xpRewardLabel       = UILabel()  // kept as property to satisfy loadTopic() references

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshHeader()
        loadTopic()
        setupBackButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Play pre-recorded ElevenLabs voice-over for this topic
        let prefix: String
        switch subject {
        case "Science":   prefix = "sci"
        case "Geography": prefix = "geo"
        case "English":   prefix = "eng"
        case "History":   prefix = "his"
        default:          prefix = "math"
        }
        QuestryAudioPlayer.shared.playTopicIntro(subject: prefix, topicId: topicId)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        QuestryAudioPlayer.shared.stop()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }

    private func setupUI() {
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        titleLabel.textColor = .black
        explanationLabel.textColor = .black
        exampleLabel.textColor = UIColor.black.withAlphaComponent(0.72)

        explanationLabel.numberOfLines = 0
        exampleLabel.numberOfLines = 0

        startPracticeButton.layer.cornerRadius = 22
        startPracticeButton.clipsToBounds = true
        startPracticeButton.backgroundColor = questYellow
        startPracticeButton.setTitleColor(.black, for: .normal)

        xpProgressView.progressTintColor = questYellow
        xpProgressView.trackTintColor = UIColor.white.withAlphaComponent(0.35)
    }

    private func refreshHeader() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        avatarImageView.image = UIImage(named: avatarName)

        let shownXP = Session.shared.currentUser?.xp ?? 0

        usernameLabel.text = Session.shared.currentUser?.username ?? "radka"
        levelLabel.text = "Level \(Session.shared.currentUser?.level ?? 1)"
        xpLabel.text = "\(shownXP) XP"
        xpProgressView.progress = min(Float(shownXP % 500) / 500.0, 1.0)
    }

    private func loadTopic() {
        if subject == "History" {
            guard let topic = HistoryGameData.topic(for: topicId) else { return }
            titleLabel.text = topic.introTitle
            explanationLabel.text = topic.introText
            exampleLabel.text = topic.exampleText
            let hisName = "q_his_\(topicId)"
            if let img = UIImage(named: hisName) {
                iconImageView.image = img
                iconImageView.tintColor = nil
            } else {
                iconImageView.image = UIImage(systemName: topic.iconSystemName)
                iconImageView.tintColor = UIColor(red: 0.72, green: 0.45, blue: 0.10, alpha: 1.0)
            }
            iconImageView.contentMode = .scaleAspectFit
        } else if subject == "Geography" {
            guard let topic = GeographyGameData.topic(for: topicId) else { return }
            titleLabel.text = topic.introTitle
            explanationLabel.text = topic.introText
            exampleLabel.text = topic.exampleText
            let geoName = "q_geo_\(topicId)"
            if let img = UIImage(named: geoName) {
                iconImageView.image = img
                iconImageView.tintColor = nil
            } else {
                iconImageView.image = UIImage(systemName: topic.iconSystemName)
                iconImageView.tintColor = UIColor(red: 0.2, green: 0.75, blue: 0.55, alpha: 1.0)
            }
            iconImageView.contentMode = .scaleAspectFit
        } else if subject == "Science" {
            guard let topic = ScienceGameData.topic(for: topicId) else { return }
            titleLabel.text = topic.introTitle
            explanationLabel.text = topic.introText
            exampleLabel.text = topic.exampleText
            let sciName = "q_sci_\(topicId)"
            if let img = UIImage(named: sciName) {
                iconImageView.image = img
                iconImageView.tintColor = nil
            } else {
                iconImageView.image = UIImage(systemName: topic.iconSystemName)
                iconImageView.tintColor = UIColor(red: 0.10, green: 0.55, blue: 0.35, alpha: 1.0)
            }
            iconImageView.contentMode = .scaleAspectFit
        } else if subject == "English" {
            let teachLang = LanguageManager.shared.englishTeachingLanguage
            let engName = "q_eng_\(topicId)"
            if teachLang != .english,
               let t = EnglishTeachingData.topics(for: teachLang).first(where: { $0.id == topicId }) {
                // Show teaching-language topic (explains English from the user's native language)
                titleLabel.text = t.title
                explanationLabel.text = t.intro
                exampleLabel.text = t.example
                if let img = UIImage(named: engName) {
                    iconImageView.image = img
                    iconImageView.tintColor = nil
                } else {
                    iconImageView.image = UIImage(systemName: "globe")
                    iconImageView.tintColor = UIColor(red: 0.55, green: 0.25, blue: 0.90, alpha: 1.0)
                }
                iconImageView.contentMode = .scaleAspectFit
            } else {
                guard let topic = EnglishGameData.topic(for: topicId) else { return }
                titleLabel.text = topic.introTitle
                explanationLabel.text = topic.introText
                exampleLabel.text = topic.exampleText
                if let img = UIImage(named: engName) {
                    iconImageView.image = img
                    iconImageView.tintColor = nil
                } else {
                    iconImageView.image = UIImage(systemName: topic.iconSystemName)
                    iconImageView.tintColor = UIColor(red: 0.55, green: 0.25, blue: 0.90, alpha: 1.0)
                }
                iconImageView.contentMode = .scaleAspectFit
            }
        } else {
            guard let topic = MathGameData.topic(for: topicId) else { return }
            titleLabel.text = topic.introTitle
            explanationLabel.text = topic.introText
            exampleLabel.text = topic.exampleText
            let assetName = "q_math_\(topicId)"
            iconImageView.image = UIImage(named: assetName) ?? UIImage(named: "icon_math")
            iconImageView.tintColor = nil
            iconImageView.contentMode = .scaleAspectFit
        }

        let diff = difficultyAndXP(for: topicId)
        difficultyPillLabel.text = diff.text
        difficultyPillLabel.backgroundColor = diff.color
        xpRewardLabel.text = diff.xp
    }

    // setupExtraUI removed  -  mission banner, difficulty pill and XP label no longer shown

    private func difficultyAndXP(for id: Int) -> (text: String, color: UIColor, xp: String) {
        if id <= 12 {
            return ("  ⭐ Novice  ", UIColor(red: 0.18, green: 0.72, blue: 0.44, alpha: 0.90), "💰 +50 XP reward")
        } else if id <= 24 {
            return ("  ⭐⭐ Apprentice  ", UIColor(red: 0.92, green: 0.58, blue: 0.08, alpha: 0.90), "💰 +100 XP reward")
        } else {
            return ("  ⭐⭐⭐ Master  ", UIColor(red: 0.65, green: 0.12, blue: 0.88, alpha: 0.90), "💰 +150 XP reward")
        }
    }

    private func setupBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func startPracticeTapped(_ sender: UIButton) {
        if subject == "History" {
            let vc = HisInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 1   // quest 1 = intro practice, marks node 1 complete
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } else if subject == "Geography" {
            let vc = GeoInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 1   // quest 1 = intro practice, marks node 1 complete
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } else if subject == "Science" {
            let vc = SciInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 1
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } else if subject == "English" {
            let vc = EngInteractiveViewController()
            vc.topicId = topicId
            vc.questNumber = 1
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "InteractiveQuestionViewController") as? InteractiveQuestionViewController {
                vc.subject = subject
                vc.levelNumber = topicId
                vc.mapQuestNumber = mapQuestNumber
                vc.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    // Storyboard also has a legacy "startTapped:" action wired  -  keep it alive to prevent crash
    @IBAction func startTapped(_ sender: UIButton) {
        startPracticeTapped(sender)
    }
}
