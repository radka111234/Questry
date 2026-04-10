import SpriteKit
import UIKit

// MARK: - RunnerGameScene
// Subway-Surfers-style endless runner.
// Avatar runs in 3 lanes; answer bubbles scroll down toward it.
// Swipe left/right to steer into the correct answer.

final class RunnerGameScene: SKScene {

    // MARK: - Public config
    var subject: String = "Geography"
    var topicId: Int    = 1
    var onDismiss: (() -> Void)?          // set by RunnerGameViewController

    // MARK: - Layout constants (set in didMove)
    private var laneXs:   [CGFloat] = []      // 3 lane centres (left/mid/right)
    private var avatarY:  CGFloat   = 0
    private var spawnY:   CGFloat   = 0
    private var exitY:    CGFloat   = 0

    // MARK: - Game state
    private var questions:    [MathExamQuestion] = []
    private var qIndex        = 0
    private var score         = 0
    private var lives         = 3
    private var bubbleSpeed: CGFloat = 180      // bubble pixels / second
    private var avatarLane    = 1              // 0=left 1=centre 2=right
    private var correctLane   = 1
    private var rowOnScreen   = false
    private var isGameOver    = false
    private var isChangingLane = false
    private var lastTime: TimeInterval = 0
    private var totalAnswered  = 0

    // MARK: - Nodes
    private var avatarSprite  = SKSpriteNode()
    private var avatarGlow    = SKSpriteNode()
    private var qCard         = SKSpriteNode()
    private var qLabel        = SKLabelNode()
    private var scoreLbl      = SKLabelNode()
    private var speedLbl      = SKLabelNode()
    private var heartNodes    = [SKNode]()
    private var bubbleNodes   = [SKNode]()     // current row of 3

    // Scrolling background tiles
    private var bgTiles       = [SKSpriteNode]()
    private var laneDividers  = [SKSpriteNode]()

    // Touch
    private var touchStart: CGPoint = .zero
    private var touchStartTime: TimeInterval = 0

    // MARK: - Subject colours
    private var accentColor: UIColor {
        switch subject.lowercased() {
        case "math":      return UIColor(red: 0.60, green: 0.20, blue: 0.95, alpha: 1)
        case "geography": return UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1)
        case "english":   return UIColor(red: 0.80, green: 0.20, blue: 0.90, alpha: 1)
        case "history":   return UIColor(red: 0.92, green: 0.42, blue: 0.08, alpha: 1)
        case "science":   return UIColor(red: 0.10, green: 0.80, blue: 0.55, alpha: 1)
        default:          return UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1)
        }
    }

    private var bgColor: UIColor {
        switch subject.lowercased() {
        case "math":      return UIColor(red: 0.10, green: 0.05, blue: 0.28, alpha: 1)
        case "geography": return UIColor(red: 0.06, green: 0.08, blue: 0.36, alpha: 1)
        case "english":   return UIColor(red: 0.14, green: 0.04, blue: 0.30, alpha: 1)
        case "history":   return UIColor(red: 0.22, green: 0.08, blue: 0.04, alpha: 1)
        case "science":   return UIColor(red: 0.04, green: 0.18, blue: 0.16, alpha: 1)
        default:          return UIColor(red: 0.08, green: 0.08, blue: 0.22, alpha: 1)
        }
    }

    private var subjectEmoji: String {
        switch subject.lowercased() {
        case "math": return "🔢"; case "geography": return "🗺️"
        case "english": return "✍️"; case "history": return "📜"
        case "science": return "🔬"; default: return "📚"
        }
    }

    // MARK: - Lifecycle

    override func didMove(to view: SKView) {
        backgroundColor = SKColor(cgColor: bgColor.cgColor)

        // Layout anchors
        laneXs  = [frame.width * 0.20, frame.width * 0.50, frame.width * 0.80]
        avatarY = frame.height * 0.20
        spawnY  = frame.height + 80
        exitY   = -80

        setupBackground()
        setupLaneDividers()
        setupAvatar()
        setupHUD()
        loadQuestions()

        run(.sequence([
            .wait(forDuration: 1.0),
            .run { [weak self] in self?.spawnRow() }
        ]))
    }

    // MARK: - Background (scrolling scenic)

    private func setupBackground() {
        // Sky gradient — two tall rects blended
        let skyTop    = makeBgTexture(size: CGSize(width: frame.width, height: frame.height * 0.75),
                                      topColor: skyTopColor, bottomColor: skyMidColor)
        let skyNode   = SKSpriteNode(texture: skyTop,
                                     size: CGSize(width: frame.width, height: frame.height * 0.75))
        skyNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        skyNode.position    = CGPoint(x: frame.midX, y: frame.height * 0.25)
        skyNode.zPosition   = -20
        addChild(skyNode)

        // Ground strip at bottom 25 %
        let groundH   = frame.height * 0.30
        let groundTex = makeBgTexture(size: CGSize(width: frame.width, height: groundH),
                                      topColor: groundTopColor, bottomColor: groundBottomColor)
        let groundNode = SKSpriteNode(texture: groundTex,
                                      size: CGSize(width: frame.width, height: groundH))
        groundNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        groundNode.position    = CGPoint(x: frame.midX, y: 0)
        groundNode.zPosition   = -18
        addChild(groundNode)

        // Scrolling clouds (3 pairs so gap is always covered)
        for i in 0..<5 {
            let cloud = makeCloud()
            let x = CGFloat.random(in: frame.width * 0.1 ... frame.width * 0.9)
            let y = frame.height * CGFloat.random(in: 0.55 ... 0.88)
            cloud.position  = CGPoint(x: x, y: y - CGFloat(i) * frame.height * 0.18)
            cloud.zPosition = -15
            addChild(cloud)
            bgTiles.append(cloud)   // reuse bgTiles array for scrolling
        }

        // Scrolling distant trees / buildings behind the lane area
        for i in 0..<6 {
            let tree = makeSceneryItem()
            let x = CGFloat(i) * frame.width / 5 + CGFloat.random(in: -10...10)
            tree.position  = CGPoint(x: x, y: frame.height * 0.27)
            tree.zPosition = -12
            addChild(tree)
            bgTiles.append(tree)
        }
    }

    // Gradient texture helper
    private func makeBgTexture(size: CGSize, topColor: UIColor, bottomColor: UIColor) -> SKTexture {
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
            let gradient = CGGradient(
                colorsSpace: CGColorSpaceCreateDeviceRGB(),
                colors: [topColor.cgColor, bottomColor.cgColor] as CFArray,
                locations: [0, 1]
            )!
            ctx.cgContext.drawLinearGradient(
                gradient,
                start: CGPoint(x: 0, y: 0),
                end: CGPoint(x: 0, y: size.height),
                options: []
            )
        }
        return SKTexture(image: img)
    }

    private var skyTopColor: UIColor {
        switch subject.lowercased() {
        case "math":      return UIColor(red: 0.12, green: 0.06, blue: 0.40, alpha: 1)
        case "geography": return UIColor(red: 0.18, green: 0.42, blue: 0.78, alpha: 1)
        case "english":   return UIColor(red: 0.28, green: 0.10, blue: 0.50, alpha: 1)
        case "history":   return UIColor(red: 0.40, green: 0.16, blue: 0.08, alpha: 1)
        case "science":   return UIColor(red: 0.05, green: 0.28, blue: 0.30, alpha: 1)
        default:          return UIColor(red: 0.12, green: 0.10, blue: 0.38, alpha: 1)
        }
    }
    private var skyMidColor: UIColor {
        switch subject.lowercased() {
        case "math":      return UIColor(red: 0.30, green: 0.15, blue: 0.60, alpha: 1)
        case "geography": return UIColor(red: 0.50, green: 0.72, blue: 0.95, alpha: 1)
        case "english":   return UIColor(red: 0.55, green: 0.25, blue: 0.70, alpha: 1)
        case "history":   return UIColor(red: 0.72, green: 0.38, blue: 0.12, alpha: 1)
        case "science":   return UIColor(red: 0.10, green: 0.55, blue: 0.50, alpha: 1)
        default:          return UIColor(red: 0.35, green: 0.30, blue: 0.65, alpha: 1)
        }
    }
    private var groundTopColor: UIColor {
        switch subject.lowercased() {
        case "geography": return UIColor(red: 0.25, green: 0.52, blue: 0.20, alpha: 1)
        case "history":   return UIColor(red: 0.45, green: 0.30, blue: 0.12, alpha: 1)
        case "science":   return UIColor(red: 0.10, green: 0.38, blue: 0.22, alpha: 1)
        default:          return UIColor(red: 0.14, green: 0.10, blue: 0.30, alpha: 1)
        }
    }
    private var groundBottomColor: UIColor {
        switch subject.lowercased() {
        case "geography": return UIColor(red: 0.15, green: 0.32, blue: 0.10, alpha: 1)
        case "history":   return UIColor(red: 0.28, green: 0.16, blue: 0.06, alpha: 1)
        case "science":   return UIColor(red: 0.06, green: 0.22, blue: 0.12, alpha: 1)
        default:          return UIColor(red: 0.06, green: 0.05, blue: 0.18, alpha: 1)
        }
    }

    private func makeCloud() -> SKSpriteNode {
        let w = CGFloat.random(in: 70...130)
        let h = w * 0.45
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: w, height: h))
        let img = renderer.image { ctx in
            UIColor.white.withAlphaComponent(0.55).setFill()
            // Three overlapping ellipses
            ctx.cgContext.fillEllipse(in: CGRect(x: 0,       y: h*0.3, width: w*0.5, height: h*0.7))
            ctx.cgContext.fillEllipse(in: CGRect(x: w*0.25,  y: 0,     width: w*0.5, height: h))
            ctx.cgContext.fillEllipse(in: CGRect(x: w*0.55,  y: h*0.2, width: w*0.45, height: h*0.75))
        }
        return SKSpriteNode(texture: SKTexture(image: img), size: CGSize(width: w, height: h))
    }

    private func makeSceneryItem() -> SKSpriteNode {
        // Simple stylised tree/building drawn into a texture
        let w: CGFloat = CGFloat.random(in: 18...30)
        let h: CGFloat = CGFloat.random(in: 40...80)
        let isTree = Bool.random()
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: w + 20, height: h))
        let col = groundTopColor.withAlphaComponent(0.7)
        let img = renderer.image { ctx in
            if isTree {
                // trunk
                col.withAlphaComponent(0.5).setFill()
                ctx.cgContext.fill(CGRect(x: w*0.4, y: 0, width: w*0.2, height: h*0.4))
                // canopy
                col.setFill()
                ctx.cgContext.fillEllipse(in: CGRect(x: 0, y: h*0.28, width: w, height: h*0.72))
            } else {
                col.setFill()
                ctx.cgContext.fill(CGRect(x: 2, y: 0, width: w - 4, height: h))
                // windows
                UIColor.white.withAlphaComponent(0.3).setFill()
                for row in 0..<3 {
                    for col2 in 0..<2 {
                        ctx.cgContext.fill(CGRect(
                            x: 4 + CGFloat(col2) * (w/2 - 2),
                            y: 8 + CGFloat(row) * (h/3.5),
                            width: w/2 - 6, height: h/5))
                    }
                }
            }
        }
        return SKSpriteNode(texture: SKTexture(image: img), size: CGSize(width: w + 20, height: h))
    }

    // MARK: - Lane dividers (scrolling dashes)

    private func setupLaneDividers() {
        for xFrac in [CGFloat(0.365), CGFloat(0.635)] {
            let x = frame.width * xFrac
            // Create a vertical column of small dashes
            let dashH: CGFloat = 24
            let gap:   CGFloat = 16
            let total  = Int(frame.height / (dashH + gap)) + 3
            for j in 0..<total {
                let dash = SKSpriteNode(
                    color: SKColor.white.withAlphaComponent(0.18),
                    size: CGSize(width: 3, height: dashH)
                )
                dash.position  = CGPoint(x: x, y: CGFloat(j) * (dashH + gap))
                dash.zPosition = -5
                addChild(dash)
                laneDividers.append(dash)
            }
        }
    }

    // MARK: - Avatar

    private func setupAvatar() {
        let avatarName = UserDefaults.standard.string(forKey: "selected_avatar_name") ?? "avatar0"
        let tex = SKTexture(imageNamed: avatarName)
        let size: CGFloat = 70

        // Glow ring
        avatarGlow = SKSpriteNode(color: SKColor(cgColor: accentColor.withAlphaComponent(0.45).cgColor),
                                  size: CGSize(width: size + 20, height: size + 20))
        avatarGlow.position  = CGPoint(x: laneXs[avatarLane], y: avatarY)
        avatarGlow.zPosition = 1
        avatarGlow.alpha     = 0.6
        let gTex = makeCircleTexture(size: size + 20, color: accentColor.withAlphaComponent(0.35))
        avatarGlow.texture  = gTex
        addChild(avatarGlow)

        avatarSprite = SKSpriteNode(texture: tex, size: CGSize(width: size, height: size))
        avatarSprite.position  = CGPoint(x: laneXs[avatarLane], y: avatarY)
        avatarSprite.zPosition = 2

        // Circular clip
        avatarSprite.physicsBody = nil

        addChild(avatarSprite)

        // Gentle bob animation
        let bob = SKAction.sequence([
            .moveBy(x: 0, y: 6, duration: 0.4),
            .moveBy(x: 0, y: -6, duration: 0.4)
        ])
        avatarSprite.run(.repeatForever(bob))
        avatarGlow.run(.repeatForever(bob.copy() as! SKAction))

        // Pulsing glow
        let pulse = SKAction.sequence([
            .fadeAlpha(to: 0.8, duration: 0.5),
            .fadeAlpha(to: 0.3, duration: 0.5)
        ])
        avatarGlow.run(.repeatForever(pulse))
    }

    private func makeCircleTexture(size: CGFloat, color: UIColor) -> SKTexture {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        let img = renderer.image { ctx in
            color.setFill()
            ctx.cgContext.fillEllipse(in: CGRect(x: 0, y: 0, width: size, height: size))
        }
        return SKTexture(image: img)
    }

    // MARK: - HUD

    private func setupHUD() {
        // Question card (top)
        let cardW = frame.width - 24
        let cardH: CGFloat = 110
        qCard = SKSpriteNode(color: SKColor.black.withAlphaComponent(0.55),
                             size: CGSize(width: cardW, height: cardH))
        qCard.position  = CGPoint(x: frame.midX, y: frame.height - cardH / 2 - 60)
        qCard.zPosition = 20
        qCard.color     = SKColor(red: 0.06, green: 0.04, blue: 0.20, alpha: 0.90)
        // round corners via texture
        let rounded = makeRoundedRectTexture(size: qCard.size, radius: 18,
                                             color: UIColor(red: 0.06, green: 0.04, blue: 0.20, alpha: 0.92))
        qCard.texture = rounded; qCard.color = .clear
        addChild(qCard)

        // Subject emoji top-left of card
        let emojiLbl = SKLabelNode(text: subjectEmoji)
        emojiLbl.fontSize   = 20
        emojiLbl.position   = CGPoint(x: -cardW / 2 + 24, y: 8)
        emojiLbl.zPosition  = 1
        emojiLbl.verticalAlignmentMode = .center
        qCard.addChild(emojiLbl)

        qLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        qLabel.fontSize              = 14
        qLabel.fontColor             = .white
        qLabel.numberOfLines         = 3
        qLabel.preferredMaxLayoutWidth = cardW - 60
        qLabel.horizontalAlignmentMode = .center
        qLabel.verticalAlignmentMode   = .center
        qLabel.position = CGPoint(x: 10, y: 0)
        qLabel.zPosition = 1
        qCard.addChild(qLabel)

        // Score (bottom-left)
        scoreLbl = SKLabelNode(fontNamed: "AvenirNext-Bold")
        scoreLbl.fontSize   = 18
        scoreLbl.fontColor  = SKColor(cgColor: accentColor.cgColor)
        scoreLbl.text       = "Score  0"
        scoreLbl.horizontalAlignmentMode = .left
        scoreLbl.position   = CGPoint(x: 20, y: 28)
        scoreLbl.zPosition  = 20
        addChild(scoreLbl)

        // Speed badge (bottom-right)
        speedLbl = SKLabelNode(fontNamed: "AvenirNext-Bold")
        speedLbl.fontSize   = 14
        speedLbl.fontColor  = SKColor.white.withAlphaComponent(0.5)
        speedLbl.text       = "Speed ▶"
        speedLbl.horizontalAlignmentMode = .right
        speedLbl.position   = CGPoint(x: frame.width - 20, y: 28)
        speedLbl.zPosition  = 20
        addChild(speedLbl)

        // Hearts
        updateHeartsDisplay()
    }

    private func makeRoundedRectTexture(size: CGSize, radius: CGFloat, color: UIColor) -> SKTexture {
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
            let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size),
                                    cornerRadius: radius)
            color.setFill()
            path.fill()
            // accent border
            accentColor.withAlphaComponent(0.4).setStroke()
            path.lineWidth = 1.5
            path.stroke()
        }
        return SKTexture(image: img)
    }

    private func updateHeartsDisplay() {
        heartNodes.forEach { $0.removeFromParent() }
        heartNodes.removeAll()

        let heartSize: CGFloat = 22
        let startX = frame.width - 20 - heartSize * CGFloat(lives) - 6 * CGFloat(lives - 1)

        for i in 0..<lives {
            let lbl = SKLabelNode(text: "❤️")
            lbl.fontSize  = 18
            lbl.position  = CGPoint(x: startX + CGFloat(i) * (heartSize + 4), y: 55)
            lbl.zPosition = 20
            addChild(lbl)
            heartNodes.append(lbl)
        }
    }

    // MARK: - Load questions

    private func loadQuestions() {
        let raw: [MathExamQuestion]
        switch subject.lowercased() {
        case "math":      raw = MathGameData.examQuestions(for: topicId)
        case "geography": raw = GeographyGameData.examQuestions(for: topicId)
        case "english":   raw = EnglishGameData.examQuestions(for: topicId)
        case "history":   raw = HistoryGameData.examQuestions(for: topicId)
        case "science":   raw = ScienceGameData.examQuestions(for: topicId)
        default:          raw = []
        }
        questions = Array(
            raw.filter { q in
                guard let ci = q.correctIndex else { return false }
                let clean = q.options.filter { !$0.lowercased().contains("don't know") }
                return clean.count >= 3 && ci < q.options.count
            }
            .shuffled()
            .prefix(12)
        )
    }

    // MARK: - Spawn a bubble row

    private func spawnRow() {
        guard !isGameOver, qIndex < questions.count else {
            endGame(); return
        }

        let q = questions[qIndex]
        guard let ci = q.correctIndex else { qIndex += 1; spawnRow(); return }

        // Build 3 display options: 1 correct + 2 wrong
        let correctStr = q.options[ci]
        let wrongs = q.options
            .enumerated()
            .filter { $0.offset != ci && !$0.element.lowercased().contains("don't know") }
            .map { $0.element }
            .shuffled()
            .prefix(2)
        var trio = [correctStr] + wrongs
        trio = trio.shuffled()

        // Which slot has the correct answer?
        correctLane = trio.firstIndex(of: correctStr) ?? 0

        // Update question label — trim to ~55 chars at word boundary for readability
        qLabel.text = Self.truncate(q.prompt, to: 55)

        // Spawn 3 bubbles
        bubbleNodes.removeAll()
        let bubbleColors: [UIColor] = [
            UIColor(red: 0.70, green: 0.15, blue: 0.85, alpha: 1),
            UIColor(red: 0.05, green: 0.55, blue: 0.90, alpha: 1),
            UIColor(red: 0.92, green: 0.42, blue: 0.08, alpha: 1),
        ].shuffled()

        for (i, text) in trio.enumerated() {
            let bubble = makeBubble(text: Self.shortenAnswer(text), color: bubbleColors[i % bubbleColors.count])
            bubble.position = CGPoint(x: laneXs[i], y: spawnY)
            bubble.zPosition = 5
            addChild(bubble)
            bubbleNodes.append(bubble)
        }

        rowOnScreen = true
    }

    private func makeBubble(text: String, color: UIColor) -> SKNode {
        let r: CGFloat = 54
        let container  = SKNode()

        // Circle background — all bubbles look identical so the correct one isn't obvious
        let circle = SKShapeNode(circleOfRadius: r)
        circle.fillColor   = SKColor(cgColor: color.cgColor)
        circle.strokeColor = SKColor.white.withAlphaComponent(0.30)
        circle.lineWidth   = 1.5
        circle.zPosition   = 1
        container.addChild(circle)

        // Answer label (2 lines max, scaled)
        let lbl = SKLabelNode(fontNamed: "AvenirNext-Bold")
        lbl.text                  = text
        lbl.fontSize              = text.count > 10 ? 13 : 16
        lbl.fontColor             = .white
        lbl.numberOfLines         = 2
        lbl.preferredMaxLayoutWidth = r * 1.8
        lbl.horizontalAlignmentMode = .center
        lbl.verticalAlignmentMode   = .center
        lbl.zPosition              = 2
        container.addChild(lbl)

        // Floating animation
        let float = SKAction.sequence([
            .moveBy(x: 0, y: 5, duration: 0.45),
            .moveBy(x: 0, y: -5, duration: 0.45)
        ])
        container.run(.repeatForever(float))

        return container
    }

    // MARK: - update (game loop)

    override func update(_ currentTime: TimeInterval) {
        guard !isGameOver else { return }

        let dt = lastTime == 0 ? 0 : currentTime - lastTime
        lastTime = currentTime

        scrollBackground(dt: dt)
        scrollLaneDividers(dt: dt)

        guard rowOnScreen, !bubbleNodes.isEmpty else { return }

        // Move bubbles downward
        let delta = CGFloat(dt) * bubbleSpeed
        for node in bubbleNodes {
            node.position.y -= delta
        }

        // Collision check: when any bubble passes the avatar's Y level
        let threshold: CGFloat = 55
        if let firstBubble = bubbleNodes.first, firstBubble.position.y < avatarY + threshold {
            rowOnScreen = false
            checkCollision()
        }

        // Safety: if bubbles exit bottom with no collision
        if let firstBubble = bubbleNodes.first, firstBubble.position.y < exitY {
            rowOnScreen = false
            clearBubbles()
            // Miss — same question
            run(.sequence([.wait(forDuration: 0.4), .run { [weak self] in self?.spawnRow() }]))
        }
    }

    private func scrollBackground(dt: TimeInterval) {
        // Clouds scroll slowly; scenery items scroll a bit faster
        for (idx, tile) in bgTiles.enumerated() {
            let speed: CGFloat = idx < 5 ? bubbleSpeed * 0.12 : bubbleSpeed * 0.28
            tile.position.y -= CGFloat(dt) * speed
            // Wrap: when fully off bottom, teleport to top of its zone
            let topY: CGFloat = idx < 5 ? frame.height * 0.95 : frame.height * 0.38
            if tile.position.y + tile.size.height / 2 < 0 {
                tile.position.x = CGFloat.random(in: tile.size.width / 2 ... frame.width - tile.size.width / 2)
                tile.position.y = topY
            }
        }
    }

    private func scrollLaneDividers(dt: TimeInterval) {
        let dashH: CGFloat = 24
        let gap:   CGFloat = 16
        let step   = dashH + gap
        let delta  = CGFloat(dt) * bubbleSpeed * 0.8
        for dash in laneDividers {
            dash.position.y -= delta
            if dash.position.y < -dashH {
                dash.position.y += step * CGFloat(laneDividers.count / 2)
            }
        }
    }

    // MARK: - Collision logic

    private func checkCollision() {
        if avatarLane == correctLane {
            handleCorrect()
        } else {
            handleWrong()
        }
    }

    private func handleCorrect() {
        guard let q = questions[safe: qIndex] else { return }
        score += 1
        totalAnswered += 1

        // Burst on correct bubble
        if correctLane < bubbleNodes.count {
            spawnBurst(at: bubbleNodes[correctLane].position, color: accentColor)
        }
        clearBubbles()

        // Speed ramp every 3 correct
        if totalAnswered % 3 == 0 {
            bubbleSpeed = min(bubbleSpeed + 20, 460)
            showSpeedBadge()
        }

        // Update HUD
        scoreLbl.text = "Score  \(score)"

        // Score pop animation
        let pop = SKAction.sequence([
            .scale(to: 1.4, duration: 0.12),
            .scale(to: 1.0, duration: 0.12)
        ])
        scoreLbl.run(pop)

        SpacedRepetitionManager.shared.clearPair(subject: subject.lowercased(),
                                                  prompt: q.prompt)

        qIndex += 1
        run(.sequence([
            .wait(forDuration: 0.5),
            .run { [weak self] in self?.spawnRow() }
        ]))
    }

    private func handleWrong() {
        lives -= 1
        totalAnswered += 1

        // Screen shake
        let shakeAmt: CGFloat = 12
        let shake = SKAction.sequence([
            .moveBy(x: -shakeAmt, y: 0, duration: 0.05),
            .moveBy(x: shakeAmt * 2, y: 0, duration: 0.05),
            .moveBy(x: -shakeAmt, y: 0, duration: 0.05),
        ])
        run(shake)

        // Red flash overlay
        let flash = SKSpriteNode(color: .red, size: frame.size)
        flash.position  = CGPoint(x: frame.midX, y: frame.midY)
        flash.zPosition = 50
        flash.alpha     = 0.25
        addChild(flash)
        flash.run(.sequence([.fadeOut(withDuration: 0.4), .removeFromParent()]))

        // Record miss for spaced repetition
        if let q = questions[safe: qIndex], let ci = q.correctIndex, ci < q.options.count {
            SpacedRepetitionManager.shared.recordMiss(subject: subject.lowercased(),
                                                       prompt: q.prompt,
                                                       answer: q.options[ci])
        }

        clearBubbles()
        updateHeartsDisplay()

        if lives <= 0 {
            run(.sequence([.wait(forDuration: 0.6), .run { [weak self] in self?.endGame() }]))
        } else {
            // Same question again
            run(.sequence([.wait(forDuration: 0.6), .run { [weak self] in self?.spawnRow() }]))
        }
    }

    private func clearBubbles() {
        for node in bubbleNodes {
            node.run(.sequence([.fadeOut(withDuration: 0.15), .removeFromParent()]))
        }
        bubbleNodes.removeAll()
        rowOnScreen = false
    }

    // MARK: - Particle burst on correct

    private func spawnBurst(at position: CGPoint, color: UIColor) {
        for _ in 0..<16 {
            let size: CGFloat = CGFloat.random(in: 5...12)
            let p = SKSpriteNode(color: SKColor(cgColor: color.cgColor),
                                 size: CGSize(width: size, height: size))
            p.position  = position
            p.zPosition = 10
            p.alpha     = 1
            let isCircle = Bool.random()
            if isCircle { p.color = SKColor(cgColor: UIColor(red: 1, green: 0.85, blue: 0, alpha: 1).cgColor) }
            addChild(p)

            let angle  = CGFloat.random(in: 0...(.pi * 2))
            let dist   = CGFloat.random(in: 60...140)
            let dx = cos(angle) * dist
            let dy = sin(angle) * dist
            p.run(.sequence([
                .group([
                    .moveBy(x: dx, y: dy, duration: 0.5),
                    .fadeOut(withDuration: 0.5),
                    .scale(to: 0.2, duration: 0.5),
                ]),
                .removeFromParent()
            ]))
        }

        // Star pop text
        let star = SKLabelNode(text: "✓ Correct!")
        star.fontName = "AvenirNext-Bold"
        star.fontSize  = 20
        star.fontColor = SKColor(cgColor: UIColor(red: 0.3, green: 1.0, blue: 0.4, alpha: 1).cgColor)
        star.position  = CGPoint(x: position.x, y: position.y + 30)
        star.zPosition = 15
        addChild(star)
        star.run(.sequence([
            .group([
                .moveBy(x: 0, y: 60, duration: 0.7),
                .fadeOut(withDuration: 0.7)
            ]),
            .removeFromParent()
        ]))
    }

    // MARK: - Speed badge

    private func showSpeedBadge() {
        let msgs = ["Faster! ⚡", "Blazing! 🔥", "MAX SPEED! 💥"]
        let tier = min(Int((bubbleSpeed - 180) / 20) / 3, msgs.count - 1)
        speedLbl.text = msgs[max(0, tier)]

        let pulse = SKAction.sequence([
            .scale(to: 1.4, duration: 0.15),
            .scale(to: 1.0, duration: 0.15),
        ])
        speedLbl.run(pulse)

        let speedStr: String
        switch bubbleSpeed {
        case ..<260: speedStr = "Speed ▶"
        case ..<340: speedStr = "Speed ▶▶"
        case ..<420: speedStr = "Speed ▶▶▶"
        default:     speedStr = "Speed ⚡MAX"
        }
        speedLbl.text = speedStr
    }

    // MARK: - Avatar lane switching

    private func switchLane(to newLane: Int) {
        guard newLane >= 0, newLane <= 2,
              newLane != avatarLane,
              !isChangingLane else { return }

        isChangingLane = true
        avatarLane = newLane
        let targetX = laneXs[newLane]

        // Lean slightly during switch
        let lean = newLane > avatarLane ? -15.0 : 15.0
        let moveAction = SKAction.sequence([
            .group([
                .moveTo(x: targetX, duration: 0.18),
                .rotate(byAngle: CGFloat(lean) * .pi / 180, duration: 0.09)
            ]),
            .rotate(toAngle: 0, duration: 0.09),
            .run { [weak self] in self?.isChangingLane = false }
        ])

        avatarSprite.run(moveAction)
        avatarGlow.run(.moveTo(x: targetX, duration: 0.18))
    }

    // MARK: - Touch handling (swipe left/right)

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, !isGameOver else { return }
        let end = touch.location(in: self)
        let dx  = end.x - touchStart.x
        let dy  = end.y - touchStart.y
        let dt  = touch.timestamp - touchStartTime

        // Ignore taps (very small movement)
        guard abs(dx) > 20 || abs(dy) > 30 else { return }

        // Prioritise horizontal swipes
        if abs(dx) > abs(dy) * 0.6 {
            if dx > 0 {
                switchLane(to: min(avatarLane + 1, 2))
            } else {
                switchLane(to: max(avatarLane - 1, 0))
            }
        }
        _ = dt // suppress unused warning
    }

    // MARK: - End game

    private func endGame() {
        guard !isGameOver else { return }
        isGameOver = true
        clearBubbles()

        let xp = score * 6
        if xp > 0 { Session.shared.addXP(xp) }

        let total = questions.count
        let pct   = total > 0 ? Int(Double(score) / Double(total) * 100) : 0
        let emoji = score == 0 ? "💪" : pct >= 70 ? "🏆" : "⭐️"
        let msg   = pct >= 70 ? "Amazing run!" : pct >= 40 ? "Good effort!" : "Keep practising!"

        // Dim overlay
        let dim = SKSpriteNode(color: .black, size: frame.size)
        dim.alpha    = 0
        dim.position = CGPoint(x: frame.midX, y: frame.midY)
        dim.zPosition = 40
        addChild(dim)
        dim.run(.fadeAlpha(to: 0.6, duration: 0.3))

        // Result card
        let cardW = frame.width - 60
        let cardH: CGFloat = 340
        let card  = SKSpriteNode(
            texture: makeRoundedRectTexture(
                size: CGSize(width: cardW, height: cardH),
                radius: 24,
                color: UIColor(red: 0.08, green: 0.05, blue: 0.24, alpha: 0.98)
            ),
            size: CGSize(width: cardW, height: cardH)
        )
        card.position  = CGPoint(x: frame.midX, y: frame.midY)
        card.zPosition = 45
        card.alpha     = 0
        card.setScale(0.7)
        addChild(card)
        card.run(.group([
            .fadeIn(withDuration: 0.35),
            .scale(to: 1.0, duration: 0.35)
        ]))

        func lbl(_ t: String, sz: CGFloat, bold: Bool = false, col: UIColor = .white, y: CGFloat) -> SKLabelNode {
            let l = SKLabelNode(fontNamed: bold ? "AvenirNext-Bold" : "AvenirNext-Regular")
            l.text      = t
            l.fontSize  = sz
            l.fontColor = SKColor(cgColor: col.cgColor)
            l.horizontalAlignmentMode = .center
            l.verticalAlignmentMode   = .center
            l.position  = CGPoint(x: 0, y: y)
            l.zPosition = 1
            return l
        }

        card.addChild(lbl(emoji, sz: 48, y: cardH / 2 - 60))
        card.addChild(lbl("Run Complete!", sz: 22, bold: true, y: cardH / 2 - 110))
        card.addChild(lbl("\(score) / \(total) correct  (\(pct)%)", sz: 17, bold: true,
                          col: accentColor, y: cardH / 2 - 150))
        card.addChild(lbl(msg, sz: 15, col: UIColor.white.withAlphaComponent(0.75), y: cardH / 2 - 180))
        card.addChild(lbl("+\(xp) XP", sz: 20, bold: true,
                          col: UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1), y: cardH / 2 - 210))

        // "Back" button node
        let btnBg = SKShapeNode(rectOf: CGSize(width: 180, height: 46), cornerRadius: 23)
        btnBg.fillColor   = SKColor(cgColor: accentColor.cgColor)
        btnBg.strokeColor = .clear
        btnBg.position    = CGPoint(x: 0, y: -(cardH / 2 - 50))
        btnBg.name        = "backBtn"
        btnBg.zPosition   = 2
        card.addChild(btnBg)

        let btnLbl = SKLabelNode(fontNamed: "AvenirNext-Bold")
        btnLbl.text                 = "Back to World"
        btnLbl.fontSize             = 16
        btnLbl.fontColor            = .white
        btnLbl.horizontalAlignmentMode = .center
        btnLbl.verticalAlignmentMode   = .center
        btnLbl.name                 = "backBtn"
        btnBg.addChild(btnLbl)

        // Confetti
        run(.sequence([.wait(forDuration: 0.3), .run { [weak self] in self?.spawnConfetti() }]))
    }

    private func spawnConfetti() {
        let colors: [UIColor] = [accentColor,
            UIColor(red: 1, green: 0.82, blue: 0, alpha: 1),
            UIColor(red: 0.95, green: 0.28, blue: 0.38, alpha: 1),
            UIColor(red: 0.10, green: 0.72, blue: 0.42, alpha: 1),
        ]
        for _ in 0..<30 {
            let size: CGFloat = CGFloat.random(in: 6...14)
            let p = SKSpriteNode(color: SKColor(cgColor: colors.randomElement()!.cgColor),
                                 size: CGSize(width: size, height: size))
            p.position  = CGPoint(x: CGFloat.random(in: 0...frame.width),
                                  y: frame.height + 10)
            p.zPosition = 48
            addChild(p)
            p.run(.sequence([
                .group([
                    .moveBy(x: CGFloat.random(in: -60...60),
                            y: -frame.height - 40,
                            duration: Double.random(in: 1.2...2.2)),
                    .sequence([
                        .wait(forDuration: 0.8),
                        .fadeOut(withDuration: 0.6)
                    ])
                ]),
                .removeFromParent()
            ]))
        }
    }

    // Handle "Back" button tap in result card
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameOver {
            guard let touch = touches.first else { return }
            let loc = touch.location(in: self)
            let nodes = self.nodes(at: loc)
            if nodes.contains(where: { $0.name == "backBtn" }) {
                onDismiss?()
            }
            return
        }
        guard let touch = touches.first else { return }
        touchStart     = touch.location(in: self)
        touchStartTime = touch.timestamp
    }
}

// MARK: - Text helpers
private extension RunnerGameScene {
    /// Trims a question prompt to `limit` chars at the nearest word boundary.
    static func truncate(_ text: String, to limit: Int) -> String {
        guard text.count > limit else { return text }
        let cut = text.prefix(limit)
        if let spaceIdx = cut.lastIndex(of: " ") {
            return String(cut[..<spaceIdx]) + "…"
        }
        return String(cut) + "…"
    }

    /// Condenses an answer option to 1–2 key words for the runner bubbles.
    /// Strips leading articles/filler, then keeps the first two words up to 14 chars total.
    static func shortenAnswer(_ text: String) -> String {
        // Remove common leading filler words
        let filler = ["to ", "the ", "a ", "an ", "it ", "by ", "in ", "on ",
                      "of ", "is ", "are ", "was ", "can ", "they ", "you ",
                      "he ", "she ", "we ", "its ", "this ", "that ", "these ",
                      "those ", "which ", "what ", "when ", "where ", "how "]
        var s = text.trimmingCharacters(in: .whitespaces)
        // strip leading filler (case-insensitive)
        let lower = s.lowercased()
        for f in filler where lower.hasPrefix(f) {
            s = String(s.dropFirst(f.count))
            break
        }
        // Take first two words
        let words = s.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        let short = words.prefix(2).joined(separator: " ")
        // Hard cap at 14 chars to fit the bubble
        if short.count <= 14 { return short }
        return String(short.prefix(13)) + "…"
    }
}

// MARK: - Safe array subscript
private extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

