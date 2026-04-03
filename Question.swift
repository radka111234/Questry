import Foundation

// MARK: - Interactive Config

/// Extra data needed to drive a drag-and-drop interactive question.
struct InteractiveConfig {
    /// Asset name for the individual draggable objects (e.g. "obj_pizza_slice").
    let objectImageName: String
    /// Asset name shown inside the drop zone (e.g. "dropzone_plate").
    let dropZoneImageName: String
    /// Short label shown beneath the drop zone image (e.g. "Anna's plate 🍽️").
    let dropZoneLabel: String
    /// How many objects are shown at the start.
    let totalObjects: Int
    /// How many objects the player must drag into the zone for a correct answer.
    /// NOTE: This is intentionally NOT shown to the player  -  they must work it out
    /// from the question text.  The "answer" they discover is the remainder left behind.
    let expectedDragCount: Int
}

// MARK: - Question

struct Question {
    let text: String
    /// Single image asset name  -  used as illustration for multiple-choice questions
    /// and as fallback when animation frames are unavailable.
    let illustrationName: String
    /// Frame names for UIImageView sequence animation.
    /// Falls back to a pulse animation when fewer than 2 frames are found.
    let animationNames: [String]
    let animationDuration: TimeInterval
    /// Four answer choices  -  used only for multiple-choice questions.
    let answers: [String]
    /// Index (0–3) of the correct answer  -  used only for multiple-choice questions.
    let correctIndex: Int
    let xpReward: Int
    /// When non-nil this question is rendered as a drag-and-drop interaction.
    /// When nil it is rendered as a standard four-button multiple-choice question.
    let interactiveConfig: InteractiveConfig?

    /// Convenience initialiser  -  all fields except text and xpReward have sensible defaults
    /// so existing multiple-choice question literals need no changes.
    init(
        text: String,
        illustrationName: String = "",
        animationNames: [String] = [],
        animationDuration: TimeInterval = 1.0,
        answers: [String] = [],
        correctIndex: Int = 0,
        xpReward: Int,
        interactiveConfig: InteractiveConfig? = nil
    ) {
        self.text = text
        self.illustrationName = illustrationName
        self.animationNames = animationNames
        self.animationDuration = animationDuration
        self.answers = answers
        self.correctIndex = correctIndex
        self.xpReward = xpReward
        self.interactiveConfig = interactiveConfig
    }
}

// MARK: - Question Bank

enum QuestionBank {

    static func questions(for subject: String, level: Int) -> [Question] {
        switch (subject.lowercased(), level) {
        case ("math", 1): return mathLevel1
        case ("math", 2): return mathLevel2
        default:          return mathLevel1
        }
    }

    // MARK: - Math · Level 1
    // Mix of interactive drag-and-drop (subtraction) and multiple-choice.

    private static let mathLevel1: [Question] = [

        // --- Interactive: drag slices to Anna's plate ---
        Question(
            text: "Sarah has 8 pizza slices 🍕. Anna eats 3 of them. Drag those 3 slices to her plate  -  how many are left?",
            illustrationName: "q_pizza",
            xpReward: 10,
            interactiveConfig: InteractiveConfig(
                objectImageName:   "obj_pizza_slice",
                dropZoneImageName: "dropzone_plate",
                dropZoneLabel:     "Anna's plate 🍽️",
                totalObjects:      8,
                expectedDragCount: 3
            )
        ),

        // --- Interactive: drag pencils to Anna's basket ---
        Question(
            text: "There are 12 pencils ✏️ in a box. Anna takes 5 out. Drag those 5 pencils to the basket  -  how many stay in the box?",
            illustrationName: "q_pencil",
            xpReward: 10,
            interactiveConfig: InteractiveConfig(
                objectImageName:   "obj_pencil_single",
                dropZoneImageName: "dropzone_basket",
                dropZoneLabel:     "Anna's basket 🧺",
                totalObjects:      12,
                expectedDragCount: 5
            )
        ),

        // --- Interactive: drag apples to the box ---
        Question(
            text: "A tree has 9 apples 🍎. A girl picks 4 of them. Drag those 4 apples to the box  -  how many are still on the tree?",
            illustrationName: "q_apple",
            xpReward: 10,
            interactiveConfig: InteractiveConfig(
                objectImageName:   "obj_apple_red",
                dropZoneImageName: "dropzone_box",
                dropZoneLabel:     "Picked apples 📦",
                totalObjects:      9,
                expectedDragCount: 4
            )
        ),

        // --- Multiple choice ---
        Question(
            text: "Tom has 6 Lego bricks 🧱 and gets 4 more. How many does he have now?",
            illustrationName: "q_lego",
            animationNames: ["q_lego_1", "q_lego_2", "q_lego_3"],
            animationDuration: 1.5,
            answers: ["8", "9", "10", "11"],
            correctIndex: 2,
            xpReward: 10
        ),

        Question(
            text: "A frog 🐸 jumps over 4 stones. Each stone is worth 3 points. How many points total?",
            illustrationName: "q_frog",
            animationNames: ["q_frog_1", "q_frog_2", "q_frog_3"],
            animationDuration: 1.8,
            answers: ["8", "10", "12", "14"],
            correctIndex: 2,
            xpReward: 10
        )
    ]

    // MARK: - Math · Level 2 (all multiple-choice)

    private static let mathLevel2: [Question] = [
        Question(
            text: "A baker makes 24 cookies 🍪 and packs them in bags of 6. How many bags?",
            illustrationName: "q_cookie",
            animationNames: ["q_cookie_1", "q_cookie_2", "q_cookie_3"],
            animationDuration: 1.2,
            answers: ["3", "4", "5", "6"],
            correctIndex: 1,
            xpReward: 15
        ),
        Question(
            text: "If one star ⭐ costs 7 coins, how many coins do 3 stars cost?",
            illustrationName: "q_star",
            animationNames: ["q_star_1", "q_star_2", "q_star_3"],
            animationDuration: 1.0,
            answers: ["14", "18", "21", "24"],
            correctIndex: 2,
            xpReward: 15
        ),
        Question(
            text: "Luna has 30 stickers 🌟 and shares them equally with 5 friends. How many does each friend get?",
            illustrationName: "q_sticker",
            animationNames: [],
            animationDuration: 1.0,
            answers: ["5", "6", "7", "8"],
            correctIndex: 1,
            xpReward: 15
        ),
        Question(
            text: "A garden has 7 rows of flowers 🌸. Each row has 9 flowers. How many flowers are there?",
            illustrationName: "q_flower",
            animationNames: [],
            animationDuration: 1.0,
            answers: ["54", "60", "63", "70"],
            correctIndex: 2,
            xpReward: 15
        ),
        Question(
            text: "There are 4 treasure chests 💰 with 8 coins each. How many coins in total?",
            illustrationName: "q_treasure",
            animationNames: [],
            animationDuration: 1.0,
            answers: ["24", "28", "32", "36"],
            correctIndex: 2,
            xpReward: 15
        )
    ]
}
