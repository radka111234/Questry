import UIKit

/// A tappable, draggable image tile used in interactive drag-and-drop questions.
///
/// - Add it as a subview of any view that has `clipsToBounds = false`
///   so the tile can be dragged visually outside the grid bounds.
/// - After `viewDidLayoutSubviews` sets the final frame, call
///   `recordHome()` once to fix the snap-back position.
final class DraggableObjectView: UIView {

    // MARK: - Callbacks

    /// Called the moment a drag begins (before any movement).
    var onDragBegan: ((DraggableObjectView) -> Void)?

    /// Called when the finger lifts.  The receiver decides whether to
    /// call `markPlaced()` or `snapHome()`.
    var onDragEnded: ((DraggableObjectView) -> Void)?

    // MARK: - Public state

    /// `true` once the object has been successfully dropped into the zone.
    private(set) var isPlaced = false

    /// The "rest" position this view returns to when the drop is rejected.
    var homeCenter: CGPoint = .zero

    // MARK: - Private UI

    private let imageView = UIImageView()

    // MARK: - Init

    /// Convenience initialiser used by `InteractiveQuestionViewController`.
    convenience init(image: UIImage?, size: CGFloat) {
        self.init(frame: CGRect(origin: .zero,
                                size: CGSize(width: size, height: size)))
        imageView.image = image
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Setup

    private func commonInit() {
        backgroundColor = .clear

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(handlePan(_:)))
        addGestureRecognizer(pan)
        isUserInteractionEnabled = true
    }

    // MARK: - State transitions

    /// Records the current `center` as the home position.
    /// Call this after the superview has done its layout pass.
    func recordHome() {
        homeCenter = center
    }

    /// Called by the host VC when the drop is accepted.
    /// Fades and shrinks the tile to show it has been "used".
    func markPlaced() {
        isPlaced = true
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.25) {
            self.alpha = 0.30
            self.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        }
    }

    /// Called by the host VC to fully restore the tile (wrong answer reset).
    func restore() {
        isPlaced = false
        isUserInteractionEnabled = true
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            usingSpringWithDamping: 0.65,
            initialSpringVelocity: 0.6
        ) {
            self.center    = self.homeCenter
            self.alpha     = 1.0
            self.transform = .identity
        }
    }

    /// Called by the host VC when the drop zone rejects the tile.
    func snapHome() {
        UIView.animate(
            withDuration: 0.45,
            delay: 0,
            usingSpringWithDamping: 0.55,
            initialSpringVelocity: 0.7
        ) {
            self.center    = self.homeCenter
            self.transform = .identity
        }
    }

    // MARK: - Pan gesture

    @objc private func handlePan(_ gr: UIPanGestureRecognizer) {
        guard let parent = superview else { return }

        switch gr.state {

        case .began:
            parent.bringSubviewToFront(self)
            onDragBegan?(self)
            UIView.animate(withDuration: 0.12) {
                self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            }

        case .changed:
            let delta = gr.translation(in: parent)
            center = CGPoint(x: center.x + delta.x,
                             y: center.y + delta.y)
            gr.setTranslation(.zero, in: parent)

        case .ended, .cancelled:
            UIView.animate(withDuration: 0.12) {
                self.transform = .identity
            }
            onDragEnded?(self)

        default:
            break
        }
    }
}
