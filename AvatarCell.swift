import UIKit

final class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
    }

    func configure(image: String) {
        imageView.image = UIImage(named: image)
    }

    func setSelectedStyle(_ isSelected: Bool) {
        if isSelected {
            contentView.layer.shadowColor = UIColor.systemYellow.cgColor
            contentView.layer.shadowRadius = 12
            contentView.layer.shadowOpacity = 0.55
            contentView.layer.shadowOffset = .zero
            contentView.layer.masksToBounds = false
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        } else {
            contentView.layer.shadowOpacity = 0
            contentView.layer.masksToBounds = true
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        }
    }
}
