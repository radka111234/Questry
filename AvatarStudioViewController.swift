import UIKit

final class AvatarStudioViewController: GradientBackgroundViewController,
                                        UICollectionViewDataSource,
                                        UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var avatarPreviewImageView: UIImageView!
    @IBOutlet weak var classSegment: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!

    private enum K {
        static let selectedAvatarName = "selected_avatar_name"
        static let selectedCategoryIndex = "selected_avatar_category_index"
    }

    private let warriorAvatars = ["avatar_warrior_1", "avatar_warrior_2", "avatar_warrior_3"]
    private let cowboyAvatars = ["avatar_cowboy_1", "avatar_cowboy_2", "avatar_cowboy_3"]
    private let princessAvatars = ["avatar_princess_1", "avatar_princess_2", "avatar_princess_3"]
    private let mageAvatars = ["avatar_mage_1", "avatar_mage_2", "avatar_mage_3"]
    private let originalAvatars = [
        "avatar0",
        "avatar1",
        "avatar2",
        "avatar3"
    ]

    private var currentAvatars: [String] = []
    private var selectedAvatarName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false

        avatarPreviewImageView.contentMode = .scaleAspectFit
        avatarPreviewImageView.clipsToBounds = true
        avatarPreviewImageView.layer.cornerRadius = 18

        let savedCategory = UserDefaults.standard.integer(forKey: K.selectedCategoryIndex)
        classSegment.selectedSegmentIndex = savedCategory

        currentAvatars = avatarsForSelectedSegment()

        let savedAvatar = UserDefaults.standard.string(forKey: K.selectedAvatarName)
        selectedAvatarName = savedAvatar ?? currentAvatars.first ?? ""

        avatarPreviewImageView.image = UIImage(named: selectedAvatarName)

        collectionView.reloadData()
    }

    @IBAction func didChangeCategory(_ sender: UISegmentedControl) {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: K.selectedCategoryIndex)

        currentAvatars = avatarsForSelectedSegment()

        if !currentAvatars.contains(selectedAvatarName) {
            selectedAvatarName = currentAvatars.first ?? ""
        }

        avatarPreviewImageView.image = UIImage(named: selectedAvatarName)
        collectionView.reloadData()
    }

    @IBAction func didTapSelectHero(_ sender: UIButton) {
        UserDefaults.standard.set(selectedAvatarName, forKey: "selected_avatar_name")
        Session.shared.save()   // persists avatar_name_<username> so it doesn't leak to other accounts
        DailyQuestManager.shared.recordAvatarVisit()
        navigationController?.popViewController(animated: true)
    }

    private func avatarsForSelectedSegment() -> [String] {
        switch classSegment.selectedSegmentIndex {
        case 0: return warriorAvatars
        case 1: return cowboyAvatars
        case 2: return princessAvatars
        case 3: return mageAvatars
        default: return originalAvatars
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentAvatars.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as! AvatarCell
        let name = currentAvatars[indexPath.item]
        cell.configure(image: name)
        cell.setSelectedStyle(name == selectedAvatarName)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = currentAvatars[indexPath.item]

        selectedAvatarName = name
        avatarPreviewImageView.image = UIImage(named: name)

        if let cell = collectionView.cellForItem(at: indexPath) as? AvatarCell {
            UIView.animate(withDuration: 0.12, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
            }) { _ in
                UIView.animate(withDuration: 0.12) {
                    cell.transform = .identity
                }
            }
        }

        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let columns: CGFloat = 3
        let spacing: CGFloat = 12
        let sidePadding: CGFloat = 24

        let total = sidePadding * 2 + spacing * (columns - 1)
        let w = floor((collectionView.bounds.width - total) / columns)

        return CGSize(width: w, height: w)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 12 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat { 12 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 14, left: 24, bottom: 24, right: 24)
    }
}
