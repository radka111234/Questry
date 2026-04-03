import UIKit

final class RewardCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        contentView.clipsToBounds = true

        itemImageView.contentMode = .scaleAspectFit

        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        descriptionLabel.textColor = UIColor.white.withAlphaComponent(0.75)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        descriptionLabel.numberOfLines = 2

        priceLabel.textColor = .systemYellow
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)

        buyButton.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.9)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.layer.cornerRadius = 12
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }

    func configure(item: ShopItem, canAfford: Bool) {
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        descriptionLabel.text = item.subtitle
        priceLabel.text = "\(item.cost) XP"

        buyButton.setTitle(canAfford ? "Buy" : "Locked", for: .normal)
        buyButton.backgroundColor = canAfford
            ? UIColor.systemTeal.withAlphaComponent(0.9)
            : UIColor.white.withAlphaComponent(0.15)
        buyButton.isEnabled = false
    }
}
