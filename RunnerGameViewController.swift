import UIKit
import SpriteKit

// MARK: - RunnerGameViewController
// Thin UIViewController wrapper around the SpriteKit runner scene.
// Set `subject` and `topicId` before pushing.

final class RunnerGameViewController: UIViewController {

    var subject: String = "Geography"
    var topicId: Int    = 1

    private var skView: SKView!
    private var scene:  RunnerGameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        skView = SKView(frame: view.bounds)
        skView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        skView.ignoresSiblingOrder = true
        skView.showsFPS            = false
        skView.showsNodeCount      = false
        view.addSubview(skView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard scene == nil else { return }

        scene = RunnerGameScene(size: skView.bounds.size)
        scene.subject    = subject
        scene.topicId    = topicId
        scene.scaleMode  = .aspectFill
        scene.onDismiss  = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        skView.presentScene(scene)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
