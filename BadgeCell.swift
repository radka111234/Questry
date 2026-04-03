import UIKit

final class BadgeCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.06)
        contentView.layer.cornerRadius = 18
        contentView.layer.masksToBounds = true

        iconImageView.contentMode = .scaleAspectFit

        titleLabel.textColor = UIColor.white.withAlphaComponent(0.90)
        titleLabel.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1

        lockImageView.image = UIImage(systemName: "lock.fill")
        lockImageView.tintColor = UIColor.white.withAlphaComponent(0.85)
    }

    func configure(with badge: Badge) {
        iconImageView.image = UIImage(named: badge.image)
        titleLabel.text = badge.short

        if badge.unlocked {
            iconImageView.alpha = 1.0
            contentView.alpha = 1.0
            lockImageView.isHidden = true
        } else {
            iconImageView.alpha = 0.28
            contentView.alpha = 0.85
            lockImageView.isHidden = false
        }
    }
}
