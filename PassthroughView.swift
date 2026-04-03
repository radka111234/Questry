import UIKit

final class PassthroughView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews.reversed() {
            let converted = subview.convert(point, from: self)
            if subview.point(inside: converted, with: event) {
                return true
            }
        }
        return false
    }
}
