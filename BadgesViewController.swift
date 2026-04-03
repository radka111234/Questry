import UIKit

struct Badge {
    let name: String      // popup title
    let short: String     // label under icon
    let image: String
    let unlocked: Bool
}

final class BadgesViewController: GradientBackgroundViewController,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    // Badges computed live from real user data so they unlock automatically
    private var badges: [Badge] {
        let d = UserDefaults.standard
        let xp       = Session.shared.currentUser?.xp ?? 0
        let quests   = DailyQuestManager.shared.totalQuestsCompleted
        let mathDone = (d.array(forKey: "math_completed_topic_ids") as? [Int] ?? []).count
        let engDone  = (d.array(forKey: "eng_completed_topic_ids")  as? [Int] ?? []).count
        let geoDone  = (d.array(forKey: "geo_completed_topic_ids")  as? [Int] ?? []).count
        let examMath = d.bool(forKey: "exam_passed_math")
        let examEng  = d.bool(forKey: "exam_passed_eng")
        let examGeo  = d.bool(forKey: "exam_passed_geo")
        let anyWorld = mathDone + engDone + geoDone > 0

        return [
            .init(name:"First Quest",          short:"First",  image:"badge_first_quest",          unlocked: quests >= 1),
            .init(name:"10 Quests",            short:"10x",    image:"badge_10_quests",            unlocked: quests >= 10),
            .init(name:"50 Quests",            short:"50x",    image:"badge_50_quests",            unlocked: quests >= 50),
            .init(name:"100 Quests",           short:"100x",   image:"badge_100_quests",           unlocked: quests >= 100),
            .init(name:"100 XP",               short:"100XP",  image:"badge_100xp",               unlocked: xp >= 100),
            .init(name:"500 XP",               short:"500XP",  image:"badge_500xp",               unlocked: xp >= 500),
            .init(name:"1000 XP",              short:"1K XP",  image:"badge_1000xp",              unlocked: xp >= 1000),
            .init(name:"Math Explorer",        short:"Math",   image:"badge_math_explorer",        unlocked: examMath),
            .init(name:"Language Master",      short:"Lang",   image:"badge_language_master",      unlocked: examEng),
            .init(name:"Geography Discoverer", short:"Geo",    image:"badge_geography_discoverer", unlocked: examGeo),
            .init(name:"First World",          short:"World1", image:"badge_first_world",          unlocked: anyWorld),
            .init(name:"All Worlds",           short:"All",    image:"badge_all_worlds",           unlocked: xp >= 500 && quests >= 15)
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 3
        let spacing: CGFloat = 14
        let sidePadding: CGFloat = 24

        let total = sidePadding * 2 + spacing * (columns - 1)
        let w = floor((collectionView.bounds.width - total) / columns)

        return CGSize(width: w, height: w)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 18, left: 24, bottom: 28, right: 24)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 14 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { 16 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        badges.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadgeCell", for: indexPath) as! BadgeCell
        cell.configure(with: badges[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let badge = badges[indexPath.item]

        if badge.unlocked {
            let a = UIAlertController(title: badge.name, message: "Unlocked.", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "OK", style: .default))
            present(a, animated: true)
        } else {
            let a = UIAlertController(title: badge.name, message: "Locked. Keep playing to unlock this badge.", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "OK", style: .default))
            present(a, animated: true)
        }
    }
}
