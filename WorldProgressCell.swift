import UIKit

final class WorldProgressCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!

    func configure(with item: WorldProgressItem) {
        iconImageView.image = UIImage(named: item.iconName)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = false

        titleLabel.text = item.title
        progressView.progress = item.progress

        if item.isUnlocked {
            // Show topics progress; if nothing done yet, say "Not started"
            subtitleLabel.text = item.topicsDone == 0
                ? "Not started yet"
                : "\(item.topicsDone) / \(item.topicsTotal) topics completed"
            // Full visibility for unlocked worlds
            contentView.alpha = 1.0
            iconImageView.alpha = 1.0
        } else {
            subtitleLabel.text = "🔒 Locked — complete a topic to unlock"
            contentView.alpha = 0.45
            iconImageView.alpha = 0.45
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
}

