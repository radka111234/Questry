import UIKit

final class WorldProgressCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!

    func configure(with item: WorldProgressItem) {
        iconImageView.image = UIImage(named: item.iconName)
        titleLabel.text = item.title
        subtitleLabel.text = "Level \(item.level) • \(item.xp) XP"
        progressView.progress = item.progress
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
}

