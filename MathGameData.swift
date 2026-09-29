import UIKit

// MARK: - Topic Type

enum MathTopicType {
    case counting
    case addition
    case subtraction
    case multiplication
    case division
    case wordProblems
    case fractions
    case geometry
    case decimals
    case algebra
    case percentages
    case measurement

    var nodeTitle: String {
        switch self {
        case .counting:      return "Counting"
        case .addition:      return "Addition"
        case .subtraction:   return "Subtraction"
        case .multiplication: return "Multiplication"
        case .division:      return "Division"
        case .wordProblems:  return "Word Problems"
        case .fractions:     return "Fractions"
        case .geometry:      return "Geometry"
        case .decimals:      return "Decimals"
        case .algebra:       return "Algebra"
        case .percentages:   return "Percentages"
        case .measurement:   return "Measurement"
        }
    }

    var introTitle: String {
        switch self {
        case .counting:      return "Counting Quest"
        case .addition:      return "Addition Quest"
        case .subtraction:   return "Subtraction Quest"
        case .multiplication: return "Multiplication Quest"
        case .division:      return "Division Quest"
        case .wordProblems:  return "Word Problem Quest"
        case .fractions:     return "Fractions Quest"
        case .geometry:      return "Geometry Quest"
        case .decimals:      return "Decimals Quest"
        case .algebra:       return "Algebra Quest"
        case .percentages:   return "Percentages Quest"
        case .measurement:   return "Measurement Quest"
        }
    }

    var iconSystemName: String {
        switch self {
        case .counting:      return "number"
        case .addition:      return "plus.circle.fill"
        case .subtraction:   return "minus.circle.fill"
        case .multiplication: return "xmark.circle.fill"
        case .division:      return "divide.circle.fill"
        case .wordProblems:  return "text.book.closed.fill"
        case .fractions:     return "divide"
        case .geometry:      return "square.on.circle"
        case .decimals:      return "number.circle.fill"
        case .algebra:       return "x.squareroot"
        case .percentages:   return "percent"
        case .measurement:   return "ruler.fill"
        }
    }

    var introText: String {
        switch self {
        case .counting:
            return "Counting is finding out how many things there are. We point to each one, one at a time, so we do not miss any."

        case .addition:
            return "Addition means putting things together. When two groups join, we get a bigger group."

        case .subtraction:
            return "Subtraction means taking some away. We start with a group, take some out, and see how many stay behind."

        case .multiplication:
            return "Multiplication is a fast way to count equal groups. If each group has the same number, we can count them more easily."

        case .division:
            return "Division means sharing fairly. Everyone gets the same amount, so it is equal for all."

        case .wordProblems:
            return "Word problems are little math stories. We listen to the story, look for the important numbers, and figure out what is happening."
        case .fractions:
            return "Fractions show parts of a whole. If you split a pizza into 4 equal slices and take 1, you have one quarter."
        case .geometry:
            return "Geometry is all about shapes, sizes, and spaces. We learn about circles, squares, triangles and how they fit in the world."
        case .decimals:
            return "Decimals are another way to write parts of a number. The dot separates the whole number from the smaller part."
        case .algebra:
            return "Algebra uses letters to stand for unknown numbers. We find what the missing number must be."
        case .percentages:
            return "A percentage tells us how many out of 100. 50% means half, and 100% means all of it."
        case .measurement:
            return "Measurement tells us how long, heavy, or full something is. We use rulers, scales, and cups to measure."
        }
    }

    var exampleText: String {
        switch self {
        case .counting:
            return """
            Example:

            🍎 🍎 🍎 🍎

            Count them one by one.
            There are 4 apples.
            """

        case .addition:
            return """
            Example:

            🍎🍎🍎 + 🍎🍎

            Put them together.
            Now there are 5 apples.
            """

        case .subtraction:
            return """
            Example:

            🍪🍪🍪🍪🍪🍪🍪

            Take 2 away.

            5 cookies are left.
            """

        case .multiplication:
            return """
            Example:

            ⭐⭐   ⭐⭐   ⭐⭐

            That is 3 groups of 2.
            Altogether that makes 6 stars.
            """

        case .division:
            return """
            Example:

            🍪🍪🍪🍪   |   🍪🍪🍪🍪

            8 cookies shared between 2 kids.
            Each kid gets 4.
            """

        case .wordProblems:
            return """
            Example:

            Mia had 5 pencils.
            She got 2 more.

            Now Mia has 7 pencils.
            """
        case .fractions:
            return """
            Example:

            🍕🍕🍕🍕  (4 slices)

            Take 1 slice → that's 1/4
            """
        case .geometry:
            return """
            Example:

            🔺 Triangle   -   3 sides
            🟦 Square     -   4 sides
            ⭕ Circle     -   no corners
            """
        case .decimals:
            return """
            Example:

            1.5 means one and a half.
            0.25 means one quarter.
            """
        case .algebra:
            return """
            Example:

            x + 3 = 7

            What is x?  x = 4 ✓
            """
        case .percentages:
            return """
            Example:

            10 out of 100 = 10%
            50 out of 100 = 50%
            """
        case .measurement:
            return """
            Example:

            📏  A pencil is 15 cm long.
            ⚖️  An apple weighs 120 g.
            """
        }
    }
}

// MARK: - Models

struct TopicDefinition {
    let id: Int
    let nodeTitle: String
    let introTitle: String
    let introText: String
    let exampleText: String
    let iconSystemName: String
    let gradeLabel: String

    /// Convenience init for the 12 original MathTopicType-backed topics.
    init(id: Int, type: MathTopicType) {
        self.id = id
        self.nodeTitle     = type.nodeTitle
        self.introTitle    = type.introTitle
        self.introText     = type.introText
        self.exampleText   = type.exampleText
        self.iconSystemName = type.iconSystemName
        self.gradeLabel    = ""
    }

    /// Direct init for all other topics.
    init(id: Int, title: String, icon: String, grade: String,
         introTitle: String = "", introText: String = "", exampleText: String = "") {
        self.id            = id
        self.nodeTitle     = title
        self.introTitle    = introTitle.isEmpty ? "\(title) Quest" : introTitle
        self.introText     = introText
        self.exampleText   = exampleText
        self.iconSystemName = icon
        self.gradeLabel    = grade
    }
}

enum PracticeObjectType {
    case apple
    case cookie
    case coin
    case pencil
    case pizza
    case lego

    var assetName: String {
        switch self {
        case .apple: return "obj_apple_red"
        case .cookie: return "obj_cookie_single"
        case .coin: return "obj_coin_gold"
        case .pencil: return "obj_pencil_single_blue"
        case .pizza: return "obj_pizza_slice"
        case .lego: return "obj_lego_brick_blue"
        }
    }
}

enum PracticeQuestionKind {
    case dragToPlate
}

struct PracticeQuestion {
    let id: String
    let topicId: Int
    let kind: PracticeQuestionKind
    let objectType: PracticeObjectType
    let totalItems: Int
    let selectedItems: Int
    let prompt: String
    let wrongExplanation: String
    let plateTitle: String
    let plateImageName: String
}

struct MathExamQuestion {
    let id: String
    let topicId: Int
    let prompt: String
    let options: [String]
    let correctIndex: Int?
}

struct DiagnosticQuestion {
    let id: String
    let topicLabel: String   // Human-readable topic name (e.g. "Fractions", "Algebra")
    let prompt: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

// MARK: - Data

enum MathGameData {

    static let questsPerTopic = 5
    static let questionsPerQuest = 5
    static let examQuestionCount = 10
    static let examPassRatio: Double = 0.7

    static let topics: [TopicDefinition] = [
        TopicDefinition(id: 1,  type: .counting),
        TopicDefinition(id: 2,  type: .addition),
        TopicDefinition(id: 3,  type: .subtraction),
        TopicDefinition(id: 4,  type: .multiplication),
        TopicDefinition(id: 5,  type: .division),
        TopicDefinition(id: 6,  type: .wordProblems),
        TopicDefinition(id: 7,  type: .fractions),
        TopicDefinition(id: 8,  type: .geometry),
        TopicDefinition(id: 9,  type: .decimals),
        TopicDefinition(id: 10, type: .algebra),
        TopicDefinition(id: 11, type: .percentages),
        TopicDefinition(id: 12, type: .measurement),

        // ── GRADE 3-4 ──────────────────────────────────────────────────────
        TopicDefinition(id: 13, title: "Place Value",       icon: "list.number",                     grade: "Grade 3",
            introTitle: "Place Value Quest",
            introText: "Every digit in a number has a place  -  ones, tens, hundreds and beyond. Understanding place value helps you read, write and compare big numbers.",
            exampleText: "Example:\n\n🔢  In 347:\n   3 is in the hundreds place (300)\n   4 is in the tens place (40)\n   7 is in the ones place (7)"),
        TopicDefinition(id: 14, title: "Rounding Numbers",  icon: "plusminus",                       grade: "Grade 3",
            introTitle: "Rounding Quest",
            introText: "Rounding means replacing a number with a close, simpler number. We look at the digit to the right of where we're rounding to decide whether to round up or down.",
            exampleText: "Example:\n\n↗️  67 rounded to the nearest 10 is 70\n↙️  43 rounded to the nearest 10 is 40\n   (5 or more? Round up. Less than 5? Round down.)"),
        TopicDefinition(id: 15, title: "Time",              icon: "clock.fill",                      grade: "Grade 3",
            introTitle: "Time Quest",
            introText: "We measure time using clocks and calendars. The short hand shows hours, the long hand shows minutes. There are 60 minutes in an hour and 24 hours in a day.",
            exampleText: "Example:\n\n🕒  3:15 is fifteen minutes past three\n⏱  45 minutes = 3/4 of an hour\n📅  7 days = 1 week"),
        TopicDefinition(id: 16, title: "Money",             icon: "dollarsign.circle.fill",           grade: "Grade 3",
            introTitle: "Money Quest",
            introText: "Money uses coins and notes of different values. We add prices together, work out change, and compare costs.",
            exampleText: "Example:\n\n💰  25p + 50p = 75p\n🛒  Item costs £1.20, you pay £2.00 → change = 80p"),
        TopicDefinition(id: 17, title: "Patterns & Sequences", icon: "repeat.circle.fill",           grade: "Grade 3",
            introTitle: "Patterns Quest",
            introText: "A pattern is a rule that repeats. In number sequences, we find the rule (add, subtract, multiply) and use it to predict the next terms.",
            exampleText: "Example:\n\n📈  2, 4, 6, 8, … (add 2 each time)\n📉  20, 15, 10, 5, … (subtract 5 each time)"),
        TopicDefinition(id: 18, title: "Factors & Multiples", icon: "grid",                          grade: "Grade 4",
            introTitle: "Factors Quest",
            introText: "A factor divides evenly into a number. A multiple is what you get when you multiply a number. Knowing factors and multiples helps you simplify fractions and find common ground between numbers.",
            exampleText: "Example:\n\n🔢  Factors of 12: 1, 2, 3, 4, 6, 12\n📋  Multiples of 3: 3, 6, 9, 12, 15 …"),

        // ── GRADE 4-5 ──────────────────────────────────────────────────────
        TopicDefinition(id: 19, title: "Mixed Numbers",     icon: "circle.lefthalf.filled",          grade: "Grade 4",
            introTitle: "Mixed Numbers Quest",
            introText: "A mixed number has a whole part and a fraction part  -  like 2½. An improper fraction has a numerator bigger than its denominator  -  like 5/2. They mean the same thing!",
            exampleText: "Example:\n\n🍕  2½ pizzas = 5/2 pizzas\n   5/2 → 2 whole pizzas plus 1 extra half"),
        TopicDefinition(id: 20, title: "Comparing Fractions", icon: "arrow.left.and.right",          grade: "Grade 4",
            introTitle: "Comparing Fractions Quest",
            introText: "To compare fractions we can draw pictures, use a number line, or find a common denominator. The larger denominator means smaller pieces!",
            exampleText: "Example:\n\n⚖️  1/3 vs 1/4: thirds are bigger pieces, so 1/3 > 1/4\n   3/8 vs 1/2 = 4/8, so 3/8 < 1/2"),
        TopicDefinition(id: 21, title: "Adding Fractions",  icon: "plus.forwardslash.minus",         grade: "Grade 4-5",
            introTitle: "Adding Fractions Quest",
            introText: "To add fractions, the denominators (bottom numbers) must match. Once they match, just add the numerators (top numbers).",
            exampleText: "Example:\n\n➕  1/4 + 2/4 = 3/4\n   1/3 + 1/6 → make same size: 2/6 + 1/6 = 3/6 = 1/2"),
        TopicDefinition(id: 22, title: "Multiplying Fractions", icon: "xmark.square.fill",           grade: "Grade 5",
            introTitle: "Multiplying Fractions Quest",
            introText: "To multiply fractions, multiply the tops together and the bottoms together. It's simpler than adding  -  no common denominator needed!",
            exampleText: "Example:\n\n✖️  2/3 × 3/4 = (2×3)/(3×4) = 6/12 = 1/2"),
        TopicDefinition(id: 23, title: "Ratios",            icon: "chart.pie.fill",                  grade: "Grade 5-6",
            introTitle: "Ratios Quest",
            introText: "A ratio compares two quantities. If there are 3 red balls and 5 blue balls, the ratio of red to blue is 3:5.",
            exampleText: "Example:\n\n⚖️  Juice to water ratio 1:3 means 1 part juice for every 3 parts water\n   For 12 cups total: 3 juice + 9 water"),
        TopicDefinition(id: 24, title: "Data & Graphs",     icon: "chart.bar.fill",                  grade: "Grade 5",
            introTitle: "Data & Graphs Quest",
            introText: "Graphs show data visually. Bar charts compare categories, line graphs show change over time, and pictograms use pictures to represent quantities.",
            exampleText: "Example:\n\n📊  A bar chart showing favourite colours\n📈  A line graph showing temperature each day"),

        // ── GRADE 5-6 ──────────────────────────────────────────────────────
        TopicDefinition(id: 25, title: "Prime Numbers",     icon: "seal.fill",                       grade: "Grade 5-6",
            introTitle: "Prime Numbers Quest",
            introText: "A prime number has exactly two factors: 1 and itself. 2, 3, 5, 7, 11 are all prime. 4 is not prime because 4 = 2 × 2.",
            exampleText: "Example:\n\n✅  7 is prime  -  only 1 × 7 works\n❌  9 is not prime  -  9 = 3 × 3\n   The first 5 primes: 2, 3, 5, 7, 11"),
        TopicDefinition(id: 26, title: "Negative Numbers",  icon: "thermometer.snowflake",            grade: "Grade 5-6",
            introTitle: "Negative Numbers Quest",
            introText: "Negative numbers are less than zero. We see them in temperatures, debts, and below sea level. The number line extends left of zero into negatives.",
            exampleText: "Example:\n\n🌡  -5°C is 5 degrees below zero\n   -3 + 7 = 4 (move 7 steps right from -3)\n   -2 - 4 = -6 (move 4 steps left from -2)"),
        TopicDefinition(id: 27, title: "Coordinates",       icon: "location.fill",                   grade: "Grade 5-6",
            introTitle: "Coordinates Quest",
            introText: "Coordinates (x, y) pinpoint a location on a grid. The first number moves left or right (x-axis), the second moves up or down (y-axis).",
            exampleText: "Example:\n\n📍  (3, 2) means 3 right and 2 up from the origin (0, 0)\n   Plot A(1,4), B(3,4), C(3,1) to draw a shape"),
        TopicDefinition(id: 28, title: "Volume",            icon: "cube.fill",                       grade: "Grade 5-6",
            introTitle: "Volume Quest",
            introText: "Volume measures how much space a 3D shape takes up. For a box (cuboid), multiply length × width × height.",
            exampleText: "Example:\n\n📦  A box: 4cm × 3cm × 2cm = 24 cm³\n🧊  Volume of a cube with side 5 = 5 × 5 × 5 = 125 cm³"),
        TopicDefinition(id: 29, title: "Angles",            icon: "rotate.3d",                       grade: "Grade 5-6",
            introTitle: "Angles Quest",
            introText: "Angles measure the amount of turn between two lines. A right angle is 90°, a straight line is 180°, and a full turn is 360°.",
            exampleText: "Example:\n\n📐  Acute angle: less than 90°\n📏  Right angle: exactly 90°\n↔️  Obtuse angle: between 90° and 180°"),
        TopicDefinition(id: 30, title: "Symmetry",          icon: "arrow.left.and.right.text.vertical", grade: "Grade 5-6",
            introTitle: "Symmetry Quest",
            introText: "A shape has symmetry if one half mirrors the other perfectly. The mirror line is called a line of symmetry.",
            exampleText: "Example:\n\n🦋  A butterfly has 1 line of symmetry\n🔷  A square has 4 lines of symmetry\n⭕️  A circle has infinite lines of symmetry"),

        // ── GRADE 6-7 ──────────────────────────────────────────────────────
        TopicDefinition(id: 31, title: "Ratio & Proportion", icon: "slider.horizontal.3",            grade: "Grade 6-7",
            introTitle: "Ratio & Proportion Quest",
            introText: "When two ratios are equal, they are proportional. If one quantity increases, the other increases by the same factor (direct proportion).",
            exampleText: "Example:\n\n🧪  Recipe uses 2 cups flour : 3 cups milk\n   Double the recipe: 4 cups flour : 6 cups milk\n   (same ratio 2:3  -  proportional!)"),
        TopicDefinition(id: 32, title: "Speed, Distance & Time", icon: "gauge.high",                 grade: "Grade 6-7",
            introTitle: "Speed & Time Quest",
            introText: "Speed = Distance ÷ Time. Knowing any two of these lets you find the third. Distance = Speed × Time. Time = Distance ÷ Speed.",
            exampleText: "Example:\n\n🚗  Car travels 120 km in 2 hours\n   Speed = 120 ÷ 2 = 60 km/h\n   In 3 hours at 60 km/h: 60 × 3 = 180 km"),
        TopicDefinition(id: 33, title: "Percentages (Advanced)", icon: "percent",                   grade: "Grade 6-7",
            introTitle: "Advanced Percentages Quest",
            introText: "We use percentages to find discounts, calculate tax, track change over time, and compare values. Percentage change = (change ÷ original) × 100.",
            exampleText: "Example:\n\n🏷  30% off £80 → save £24 → pay £56\n📈  Price rises from £50 to £60 → 20% increase"),
        TopicDefinition(id: 34, title: "Probability",       icon: "dice.fill",                       grade: "Grade 6-7",
            introTitle: "Probability Quest",
            introText: "Probability measures how likely an event is, from 0 (impossible) to 1 (certain). P(event) = number of favourable outcomes ÷ total outcomes.",
            exampleText: "Example:\n\n🎲  Rolling a 4 on a die: P = 1/6\n🔴  Drawing red from 3 red, 7 blue: P = 3/10"),
        TopicDefinition(id: 35, title: "Statistics: Mean, Median & Mode", icon: "chart.bar.xaxis",  grade: "Grade 6-7",
            introTitle: "Statistics Quest",
            introText: "Mean = sum ÷ count. Median = middle value when sorted. Mode = most frequent value. These averages describe a data set.",
            exampleText: "Example:\n\n📊  Data: 3, 5, 5, 7, 10\n   Mean = 30 ÷ 5 = 6\n   Median = 5  |  Mode = 5"),
        TopicDefinition(id: 36, title: "Integers & Absolute Value", icon: "arrow.up.and.down",      grade: "Grade 6-7",
            introTitle: "Integers Quest",
            introText: "Integers are all whole numbers  -  positive, negative, and zero. The absolute value of a number is its distance from zero (always positive).",
            exampleText: "Example:\n\n|−7| = 7   |4| = 4\n   −3 + (−5) = −8\n   −3 × −4 = +12 (two negatives multiply to positive)"),

        // ── GRADE 7-8 ──────────────────────────────────────────────────────
        TopicDefinition(id: 37, title: "Algebraic Expressions", icon: "function",                   grade: "Grade 7-8",
            introTitle: "Expressions Quest",
            introText: "An algebraic expression uses letters and numbers. We simplify by collecting like terms and expand brackets using the distributive law.",
            exampleText: "Example:\n\n📝  3x + 2x = 5x\n   2(x + 3) = 2x + 6\n   Evaluate: if x=4, then 3x + 1 = 13"),
        TopicDefinition(id: 38, title: "Linear Equations",  icon: "equal.circle.fill",              grade: "Grade 7-8",
            introTitle: "Linear Equations Quest",
            introText: "A linear equation has one unknown (like x) and we solve it by doing the same operation to both sides until x is alone.",
            exampleText: "Example:\n\n⚖️  2x + 5 = 13\n   Subtract 5: 2x = 8\n   Divide by 2: x = 4"),
        TopicDefinition(id: 39, title: "Inequalities",      icon: "lessthan.circle.fill",           grade: "Grade 7-8",
            introTitle: "Inequalities Quest",
            introText: "Inequalities use < (less than), > (greater than), ≤ and ≥. We solve them like equations but must flip the sign when multiplying or dividing by a negative.",
            exampleText: "Example:\n\n3x + 2 > 11\n   3x > 9\n   x > 3  (any number greater than 3 works)"),
        TopicDefinition(id: 40, title: "Powers & Exponents", icon: "arrow.up.right.circle.fill",    grade: "Grade 7-8",
            introTitle: "Exponents Quest",
            introText: "An exponent tells you how many times to multiply a base by itself. 2⁴ means 2 × 2 × 2 × 2 = 16.",
            exampleText: "Example:\n\n⬆️  3² = 9   3³ = 27\n   10⁰ = 1 (anything to the power 0 = 1)\n   2⁻¹ = 1/2 (negative exponent = reciprocal)"),
        TopicDefinition(id: 41, title: "Square Roots & Cube Roots", icon: "x.squareroot",          grade: "Grade 7-8",
            introTitle: "Roots Quest",
            introText: "The square root undoes squaring. √25 = 5 because 5² = 25. The cube root undoes cubing. ∛27 = 3 because 3³ = 27.",
            exampleText: "Example:\n\n√144 = 12   ∛64 = 4\n   √2 ≈ 1.414 (irrational  -  never ends)\n   Estimate: √50 is between 7 and 8"),
        TopicDefinition(id: 42, title: "Graphs of Linear Functions", icon: "arrow.up.right",        grade: "Grade 7-8",
            introTitle: "Linear Graphs Quest",
            introText: "A linear equation produces a straight line graph. The equation y = mx + c tells us the gradient m (steepness) and y-intercept c (where it crosses the y-axis).",
            exampleText: "Example:\n\n📈  y = 2x + 1\n   When x=0: y=1 (y-intercept)\n   When x=3: y=7\n   Gradient = 2 (rises 2 for every 1 right)"),

        // ── GRADE 8-9 ──────────────────────────────────────────────────────
        TopicDefinition(id: 43, title: "Scientific Notation", icon: "scope",                        grade: "Grade 8-9",
            introTitle: "Scientific Notation Quest",
            introText: "Scientific notation writes very large or very small numbers as a number between 1 and 10 multiplied by a power of 10.",
            exampleText: "Example:\n\n🔭  5,400,000 = 5.4 × 10⁶\n🔬  0.00032 = 3.2 × 10⁻⁴\n   Used in astronomy, chemistry, and physics"),
        TopicDefinition(id: 44, title: "Pythagorean Theorem", icon: "triangle.fill",                grade: "Grade 8-9",
            introTitle: "Pythagorean Theorem Quest",
            introText: "In any right-angled triangle, a² + b² = c², where c is the hypotenuse (the longest side, opposite the right angle).",
            exampleText: "Example:\n\n📐  Legs: 3 and 4 → hypotenuse: √(9+16) = √25 = 5\n   Legs: 5 and 12 → √(25+144) = √169 = 13"),
        TopicDefinition(id: 45, title: "Systems of Equations", icon: "list.bullet.indent",          grade: "Grade 8-9",
            introTitle: "Systems of Equations Quest",
            introText: "A system of equations is two or more equations with the same unknowns. We solve by substitution or elimination to find values that satisfy both.",
            exampleText: "Example:\n\nx + y = 7\nx − y = 1\nAdd: 2x = 8 → x = 4, then y = 3"),
        TopicDefinition(id: 46, title: "Quadratic Equations", icon: "waveform.path.ecg",            grade: "Grade 8-9",
            introTitle: "Quadratic Equations Quest",
            introText: "A quadratic equation has an x² term. We solve by factoring, completing the square, or using the quadratic formula: x = (−b ± √(b²−4ac)) / 2a.",
            exampleText: "Example:\n\nx² − 5x + 6 = 0\n   (x − 2)(x − 3) = 0\n   x = 2  or  x = 3"),
        TopicDefinition(id: 47, title: "3D Geometry",        icon: "cube.transparent",              grade: "Grade 8-9",
            introTitle: "3D Geometry Quest",
            introText: "3D shapes have length, width, and height. We calculate volumes and surface areas of prisms, cylinders, cones, and spheres.",
            exampleText: "Example:\n\n🔵  Cylinder: V = πr²h\n🔺  Cone: V = ⅓πr²h\n⚽️  Sphere: V = ⁴⁄₃πr³"),
        TopicDefinition(id: 48, title: "Geometric Transformations", icon: "arrow.2.circlepath",     grade: "Grade 8-9",
            introTitle: "Transformations Quest",
            introText: "Transformations move or change shapes: translation (slide), rotation (turn), reflection (flip), and enlargement (resize).",
            exampleText: "Example:\n\n↔️  Reflect triangle in the y-axis\n🔄  Rotate 90° clockwise around origin\n➡️  Translate 3 right and 2 up"),

        // ── GRADE 9-10 ─────────────────────────────────────────────────────
        TopicDefinition(id: 49, title: "Functions",          icon: "f.circle.fill",                  grade: "Grade 9-10",
            introTitle: "Functions Quest",
            introText: "A function maps every input to exactly one output. We write f(x) to mean 'the function of x'. Functions can be linear, quadratic, exponential, and more.",
            exampleText: "Example:\n\n🔧  f(x) = 3x − 2\n   f(5) = 3(5) − 2 = 13\n   Domain = all inputs; Range = all outputs"),
        TopicDefinition(id: 50, title: "Polynomials",        icon: "chart.line.uptrend.xyaxis.circle", grade: "Grade 9-10",
            introTitle: "Polynomials Quest",
            introText: "A polynomial is an expression with one or more terms involving powers of x. We add, subtract, multiply, and factor polynomials.",
            exampleText: "Example:\n\n📝  (x + 2)(x + 3) = x² + 5x + 6\n   Factor x² − x − 6 = (x−3)(x+2)"),
        TopicDefinition(id: 51, title: "Quadratic Functions", icon: "waveform",                      grade: "Grade 9-10",
            introTitle: "Quadratic Functions Quest",
            introText: "A quadratic function f(x) = ax² + bx + c draws a parabola. The vertex is the minimum or maximum point, and the axis of symmetry runs through it.",
            exampleText: "Example:\n\n🎢  f(x) = x² − 4x + 3\n   Roots at x=1 and x=3\n   Vertex at x=2, y=−1 (the minimum)"),
        TopicDefinition(id: 52, title: "Exponential Growth & Decay", icon: "chart.line.uptrend.xyaxis", grade: "Grade 9-10",
            introTitle: "Exponential Growth Quest",
            introText: "Exponential growth multiplies by the same factor each period. Exponential decay divides. Formula: y = a × bˣ where b > 1 is growth, 0 < b < 1 is decay.",
            exampleText: "Example:\n\n🦠  Bacteria double every hour: y = 100 × 2ˣ\n💰  Compound interest: £1000 at 5% after 3 years = 1000 × 1.05³ ≈ £1158"),
        TopicDefinition(id: 53, title: "Trigonometry Basics", icon: "triangle",                      grade: "Grade 9-10",
            introTitle: "Trigonometry Quest",
            introText: "In right triangles, sine, cosine, and tangent relate angles to side ratios. Remember: SOH-CAH-TOA.",
            exampleText: "Example:\n\nsin(30°) = 1/2   cos(60°) = 1/2\n   tan(45°) = 1\n   Opposite=3, Hypotenuse=5 → sin(θ)=3/5 → θ≈37°"),
        TopicDefinition(id: 54, title: "Advanced Probability", icon: "chart.pie",                   grade: "Grade 9-10",
            introTitle: "Advanced Probability Quest",
            introText: "Probability trees, conditional probability, and the addition and multiplication rules help us calculate complex probabilities.",
            exampleText: "Example:\n\n🌲  Tree diagram for 2 coin flips:\n   P(HH) = 1/2 × 1/2 = 1/4\n   P(at least 1 head) = 1 − P(TT) = 3/4"),

        // ── GRADE 10-11 ────────────────────────────────────────────────────
        TopicDefinition(id: 55, title: "Logarithms",         icon: "text.magnifyingglass",           grade: "Grade 10-11",
            introTitle: "Logarithms Quest",
            introText: "A logarithm is the inverse of an exponent. logₐ(b) = c means aᶜ = b. Logarithms help us solve equations where the unknown is in the exponent.",
            exampleText: "Example:\n\nlog₂(8) = 3  because 2³ = 8\n   log₁₀(1000) = 3  because 10³ = 1000\n   Useful for: earthquakes, sound levels, pH"),
        TopicDefinition(id: 56, title: "Sequences & Series", icon: "ellipsis.circle.fill",           grade: "Grade 10-11",
            introTitle: "Sequences Quest",
            introText: "An arithmetic sequence adds a constant difference each time. A geometric sequence multiplies by a constant ratio. A series is the sum of a sequence's terms.",
            exampleText: "Example:\n\n➕  Arithmetic: 2, 5, 8, 11 … (add 3)\n✖️  Geometric: 3, 6, 12, 24 … (×2)\n   Sum of first n terms of arithmetic: n/2 × (first + last)"),
        TopicDefinition(id: 57, title: "Trigonometric Functions", icon: "waveform.and.magnifyingglass", grade: "Grade 10-11",
            introTitle: "Trig Functions Quest",
            introText: "Sine, cosine, and tangent are functions that repeat (periodic). Their graphs are waves. Key identities like sin²θ + cos²θ = 1 link them.",
            exampleText: "Example:\n\n📉  sin(x) and cos(x) have period 360° (2π)\n🔄  sin(90°) = 1 = cos(0°)\n   tan(θ) = sin(θ) / cos(θ)"),
        TopicDefinition(id: 58, title: "Vectors",            icon: "arrow.up.right.circle",          grade: "Grade 10-11",
            introTitle: "Vectors Quest",
            introText: "A vector has both magnitude (size) and direction. We add vectors tip-to-tail and use components (x, y) to calculate resultants.",
            exampleText: "Example:\n\n➡️  Vector a = (3, 4) has magnitude √(9+16) = 5\n   a + b = (3+1, 4+2) = (4, 6)\n   Used in: physics, navigation, computer graphics"),
        TopicDefinition(id: 59, title: "Matrices",           icon: "tablecells.fill",                grade: "Grade 10-11",
            introTitle: "Matrices Quest",
            introText: "A matrix is a grid of numbers. We can add matrices (same size), multiply them, and find determinants and inverses. Matrices are used to solve systems of equations.",
            exampleText: "Example:\n\n🔲  A = [1 2 / 3 4]\n   det(A) = 1×4 − 2×3 = −2\n   Used in: graphics, machine learning, physics"),
        TopicDefinition(id: 60, title: "Complex Numbers",    icon: "c.circle.fill",                  grade: "Grade 10-11",
            introTitle: "Complex Numbers Quest",
            introText: "A complex number has a real part and an imaginary part: a + bi, where i = √(−1). Complex numbers extend our number system to solve equations like x² = −1.",
            exampleText: "Example:\n\n🔮  (3 + 2i) + (1 + 4i) = 4 + 6i\n   (2 + i)(2 − i) = 4 + 1 = 5\n   |3 + 4i| = √(9 + 16) = 5"),

        // ── GRADE 11-12 ────────────────────────────────────────────────────
        TopicDefinition(id: 61, title: "Combinatorics",      icon: "shuffle.circle.fill",            grade: "Grade 11-12",
            introTitle: "Combinatorics Quest",
            introText: "Combinatorics counts arrangements and selections. Permutations count ordered arrangements; combinations count unordered selections.",
            exampleText: "Example:\n\n🃏  Arrangements of 3 from 5: P(5,3) = 5×4×3 = 60\n   Groups of 3 from 5: C(5,3) = 10\n   Used in: probability, cryptography, scheduling"),
        TopicDefinition(id: 62, title: "Statistics: Standard Deviation", icon: "chart.bar.doc.horizontal", grade: "Grade 11-12",
            introTitle: "Standard Deviation Quest",
            introText: "Standard deviation measures how spread out data is around the mean. A small SD means data is clustered; a large SD means it is spread out. The normal distribution is bell-shaped.",
            exampleText: "Example:\n\n📊  Data: 2, 4, 4, 4, 5, 5, 7, 9 → mean = 5\n   SD ≈ 2 (most values within 2 of the mean)\n   In a normal curve: 68% within 1 SD of mean"),
        TopicDefinition(id: 63, title: "Calculus: Limits",   icon: "arrow.right.to.line",            grade: "Grade 11-12",
            introTitle: "Limits Quest",
            introText: "A limit describes the value a function approaches as the input gets close to a point. Limits are the foundation of calculus.",
            exampleText: "Example:\n\n🔍  lim(x→2) (x²−4)/(x−2) = lim(x→2)(x+2) = 4\n   lim(x→∞) 1/x = 0\n   Continuity means limit = function value"),
        TopicDefinition(id: 64, title: "Calculus: Derivatives", icon: "chart.line.uptrend.xyaxis",   grade: "Grade 11-12",
            introTitle: "Derivatives Quest",
            introText: "A derivative measures the instantaneous rate of change  -  the slope of a curve at a point. d/dx(xⁿ) = nxⁿ⁻¹ is the power rule.",
            exampleText: "Example:\n\nd/dx(x³) = 3x²\n   d/dx(sin x) = cos x\n   f(x) = 3x² + 2x → f'(x) = 6x + 2\n   Used to find maximums, minimums, velocity"),
        TopicDefinition(id: 65, title: "Calculus: Integration", icon: "sum",                         grade: "Grade 11-12",
            introTitle: "Integration Quest",
            introText: "Integration is the reverse of differentiation. It finds areas under curves. The fundamental theorem of calculus links derivatives and integrals.",
            exampleText: "Example:\n\n∫ 2x dx = x² + C\n   ∫₀³ x² dx = [x³/3]₀³ = 9 − 0 = 9\n   Area under a curve = definite integral"),

        // ── UNIVERSITY ─────────────────────────────────────────────────────
        TopicDefinition(id: 66, title: "Linear Algebra",     icon: "grid.circle.fill",               grade: "University Year 1",
            introTitle: "Linear Algebra Quest",
            introText: "Linear algebra studies vectors, matrices, and linear transformations. Eigenvalues and eigenvectors reveal the fundamental behaviour of transformations.",
            exampleText: "Example:\n\n🔢  Ax = λx  (eigenvector equation)\n   Row reduce to solve systems of equations\n   Used in: machine learning, physics, graphics"),
        TopicDefinition(id: 67, title: "Multivariable Calculus", icon: "globe",                      grade: "University Year 1",
            introTitle: "Multivariable Calculus Quest",
            introText: "Multivariable calculus extends derivatives and integrals to functions of two or more variables. Partial derivatives, gradients, and double integrals are key tools.",
            exampleText: "Example:\n\n∂f/∂x of f(x,y) = x²y → 2xy\n   ∇f = (∂f/∂x, ∂f/∂y) is the gradient\n   Used to find max/min of 3D surfaces"),
        TopicDefinition(id: 68, title: "Differential Equations", icon: "waveform.path",              grade: "University Year 1",
            introTitle: "Differential Equations Quest",
            introText: "A differential equation relates a function to its derivatives. They model how things change over time: population growth, heat flow, circuits.",
            exampleText: "Example:\n\ndy/dx = ky  →  y = Aeᵏˣ\n   Exponential growth/decay model\n   Second-order: y'' + y = 0 → y = sin(x) or cos(x)"),
        TopicDefinition(id: 69, title: "Discrete Mathematics", icon: "network",                      grade: "University Year 1",
            introTitle: "Discrete Maths Quest",
            introText: "Discrete mathematics studies structures that are countable: graphs, logic, sets, combinatorics. It underpins computer science and cryptography.",
            exampleText: "Example:\n\n🔗  Graph theory: shortest path algorithms\n🔐  Modular arithmetic: 17 mod 5 = 2\n⊃  Set theory: A ∪ B, A ∩ B"),
        TopicDefinition(id: 70, title: "Abstract Algebra",   icon: "sparkles",                       grade: "University Year 2",
            introTitle: "Abstract Algebra Quest",
            introText: "Abstract algebra studies algebraic structures  -  groups, rings, and fields  -  defined by operations and axioms. It generalises arithmetic to its essence.",
            exampleText: "Example:\n\n🌀  A group: (ℤ, +)  -  integers under addition\n   Symmetry groups describe rotations of shapes\n   Fields: rational, real, complex numbers"),

        // ── AGES 8-12 CORE TOPICS ──────────────────────────────────────────
        TopicDefinition(id: 71, title: "Ratios & Proportions", icon: "slider.horizontal.3",           grade: "Grade 5-6",
            introTitle: "Ratios & Proportions Quest",
            introText: "A ratio compares two quantities. Two ratios are proportional when they are equal. We use cross-multiplication to check and to find missing values.",
            exampleText: "Example:\n\n⚖️  Ratio 3:4 — for every 3 red there are 4 blue\n   3:4 = 9:12 (multiply both parts by 3)\n   If 2:5 = x:20, then x = 8"),

        TopicDefinition(id: 72, title: "Negative Numbers",    icon: "thermometer.snowflake",           grade: "Grade 5-6",
            introTitle: "Negative Numbers Quest",
            introText: "Negative numbers are less than zero. On a number line they sit to the left of zero. We use them for temperatures, debts, and depths below sea level.",
            exampleText: "Example:\n\n🌡  −5°C is 5 degrees below freezing\n   −3 + 7 = 4 (move 7 right from −3)\n   −2 − 4 = −6 (move 4 left from −2)"),

        TopicDefinition(id: 73, title: "Statistics & Graphs", icon: "chart.bar.fill",                 grade: "Grade 5-6",
            introTitle: "Statistics & Graphs Quest",
            introText: "Statistics helps us understand data. We find the mean (average), median (middle), and mode (most common). Graphs like bar charts and line graphs show data visually.",
            exampleText: "Example:\n\n📊  Data: 3, 5, 5, 7, 10\n   Mean = 30 ÷ 5 = 6\n   Median = 5   Mode = 5"),

        TopicDefinition(id: 74, title: "Probability",         icon: "dice.fill",                      grade: "Grade 6-7",
            introTitle: "Probability Quest",
            introText: "Probability measures how likely an event is, on a scale from 0 (impossible) to 1 (certain). P(event) = number of favourable outcomes ÷ total possible outcomes.",
            exampleText: "Example:\n\n🎲  Roll a die: P(rolling 3) = 1/6\n🃏  Pick a red card from 52: P = 26/52 = 1/2"),

        TopicDefinition(id: 75, title: "Patterns & Sequences", icon: "repeat.circle.fill",            grade: "Grade 4-5",
            introTitle: "Patterns & Sequences Quest",
            introText: "A number sequence follows a rule. In an arithmetic sequence we add or subtract the same amount each time. In a geometric sequence we multiply or divide by the same amount.",
            exampleText: "Example:\n\n📈  2, 5, 8, 11, … (add 3 each time)\n📉  81, 27, 9, 3, … (divide by 3 each time)"),

        TopicDefinition(id: 76, title: "Area & Volume",       icon: "cube.fill",                      grade: "Grade 5-6",
            introTitle: "Area & Volume Quest",
            introText: "Area measures the space inside a flat shape (in square units). Volume measures the space inside a 3D shape (in cubic units). Rectangle area = length × width. Cuboid volume = length × width × height.",
            exampleText: "Example:\n\n📐  Rectangle 6 cm × 4 cm → Area = 24 cm²\n📦  Box 5 × 3 × 2 → Volume = 30 cm³"),

        TopicDefinition(id: 77, title: "Factors & Multiples", icon: "grid",                           grade: "Grade 4-5",
            introTitle: "Factors & Multiples Quest",
            introText: "A factor divides exactly into a number. A multiple is the result of multiplying a number by a whole number. The HCF is the largest shared factor; the LCM is the smallest shared multiple.",
            exampleText: "Example:\n\n🔢  Factors of 12: 1, 2, 3, 4, 6, 12\n📋  Multiples of 5: 5, 10, 15, 20, 25 …\n   HCF(12, 8) = 4   LCM(4, 6) = 12"),

        TopicDefinition(id: 78, title: "Introduction to Coordinates", icon: "location.fill",          grade: "Grade 4-5",
            introTitle: "Coordinates Quest",
            introText: "Coordinates (x, y) tell us where a point is on a grid. The first number (x) says how far to go right; the second number (y) says how far to go up. The starting point (0, 0) is called the origin.",
            exampleText: "Example:\n\n📍  (3, 2): go 3 right and 2 up from the origin\n   (0, 4): on the y-axis, 4 up\n   (5, 0): on the x-axis, 5 right")
    ]

    static func topic(for id: Int) -> TopicDefinition? {
        topics.first(where: { $0.id == id })
    }

    static func practiceQuestions(for topicId: Int, questNumber: Int) -> [PracticeQuestion] {
        let all = practiceQuestionsByTopic[topicId] ?? []
        guard questNumber >= 1 else { return [] }

        let start = (questNumber - 1) * questionsPerQuest
        let end = min(start + questionsPerQuest, all.count)

        guard start < all.count else { return [] }
        return Array(all[start..<end])
    }

    static func examQuestions(for topicId: Int) -> [MathExamQuestion] {
        examQuestionsByTopic[topicId] ?? []
    }

    static func minimumPassScore(for totalQuestions: Int) -> Int {
        Int(ceil(Double(totalQuestions) * examPassRatio))
    }

    // MARK: - Quest 4 Equation Questions (topics 1-12)
    // These use true equation format ("3 + 4 = ?") instead of sentence prompts.

    static func quest4EquationQuestions(for topicId: Int) -> [MathExamQuestion] {
        quest4EquationsByTopic[topicId] ?? []
    }

    private static let quest4EquationsByTopic: [Int: [MathExamQuestion]] = [

        // ── Topic 1: Counting ────────────────────────────────────────────────
        1: [
            MathExamQuestion(id: "q4_cnt_1", topicId: 1, prompt: "2 + 3 = ?", options: ["4", "5", "6", "7"], correctIndex: 1),
            MathExamQuestion(id: "q4_cnt_2", topicId: 1, prompt: "10 - 4 = ?", options: ["4", "5", "6", "7"], correctIndex: 2),
            MathExamQuestion(id: "q4_cnt_3", topicId: 1, prompt: "3 × 2 = ?", options: ["4", "5", "6", "7"], correctIndex: 2),
            MathExamQuestion(id: "q4_cnt_4", topicId: 1, prompt: "4 + ___ = 9", options: ["3", "4", "5", "6"], correctIndex: 2),
            MathExamQuestion(id: "q4_cnt_5", topicId: 1, prompt: "12 ÷ 3 = ?", options: ["2", "3", "4", "5"], correctIndex: 2),
        ],

        // ── Topic 2: Addition ────────────────────────────────────────────────
        2: [
            MathExamQuestion(id: "q4_add_1", topicId: 2, prompt: "7 + 5 = ?", options: ["10", "11", "12", "13"], correctIndex: 2),
            MathExamQuestion(id: "q4_add_2", topicId: 2, prompt: "14 + 8 = ?", options: ["20", "21", "22", "23"], correctIndex: 2),
            MathExamQuestion(id: "q4_add_3", topicId: 2, prompt: "23 + 17 = ?", options: ["38", "40", "41", "42"], correctIndex: 1),
            MathExamQuestion(id: "q4_add_4", topicId: 2, prompt: "156 + 244 = ?", options: ["390", "400", "410", "420"], correctIndex: 1),
            MathExamQuestion(id: "q4_add_5", topicId: 2, prompt: "347 + 253 = ?", options: ["590", "598", "600", "610"], correctIndex: 2),
        ],

        // ── Topic 3: Subtraction ─────────────────────────────────────────────
        3: [
            MathExamQuestion(id: "q4_sub_1", topicId: 3, prompt: "9 - 4 = ?", options: ["3", "4", "5", "6"], correctIndex: 2),
            MathExamQuestion(id: "q4_sub_2", topicId: 3, prompt: "15 - 7 = ?", options: ["6", "7", "8", "9"], correctIndex: 2),
            MathExamQuestion(id: "q4_sub_3", topicId: 3, prompt: "42 - 18 = ?", options: ["22", "24", "26", "28"], correctIndex: 1),
            MathExamQuestion(id: "q4_sub_4", topicId: 3, prompt: "100 - 37 = ?", options: ["63", "67", "73", "77"], correctIndex: 0),
            MathExamQuestion(id: "q4_sub_5", topicId: 3, prompt: "504 - 268 = ?", options: ["226", "236", "246", "256"], correctIndex: 1),
        ],

        // ── Topic 4: Multiplication ──────────────────────────────────────────
        4: [
            MathExamQuestion(id: "q4_mul_1", topicId: 4, prompt: "3 × 4 = ?", options: ["10", "11", "12", "13"], correctIndex: 2),
            MathExamQuestion(id: "q4_mul_2", topicId: 4, prompt: "6 × 7 = ?", options: ["40", "42", "44", "46"], correctIndex: 1),
            MathExamQuestion(id: "q4_mul_3", topicId: 4, prompt: "8 × 9 = ?", options: ["70", "72", "74", "76"], correctIndex: 1),
            MathExamQuestion(id: "q4_mul_4", topicId: 4, prompt: "12 × 5 = ?", options: ["55", "60", "65", "70"], correctIndex: 1),
            MathExamQuestion(id: "q4_mul_5", topicId: 4, prompt: "15 × 8 = ?", options: ["110", "115", "120", "125"], correctIndex: 2),
        ],

        // ── Topic 5: Division ────────────────────────────────────────────────
        5: [
            MathExamQuestion(id: "q4_div_1", topicId: 5, prompt: "12 ÷ 4 = ?", options: ["2", "3", "4", "5"], correctIndex: 1),
            MathExamQuestion(id: "q4_div_2", topicId: 5, prompt: "20 ÷ 5 = ?", options: ["3", "4", "5", "6"], correctIndex: 1),
            MathExamQuestion(id: "q4_div_3", topicId: 5, prompt: "48 ÷ 6 = ?", options: ["6", "7", "8", "9"], correctIndex: 2),
            MathExamQuestion(id: "q4_div_4", topicId: 5, prompt: "63 ÷ 9 = ?", options: ["6", "7", "8", "9"], correctIndex: 1),
            MathExamQuestion(id: "q4_div_5", topicId: 5, prompt: "144 ÷ 12 = ?", options: ["10", "11", "12", "13"], correctIndex: 2),
        ],

        // ── Topic 6: Word Problems ───────────────────────────────────────────
        6: [
            MathExamQuestion(id: "q4_wrd_1", topicId: 6, prompt: "4 × 3 + 2 = ?", options: ["12", "13", "14", "16"], correctIndex: 2),
            MathExamQuestion(id: "q4_wrd_2", topicId: 6, prompt: "20 - 4 × 3 = ?", options: ["8", "12", "16", "48"], correctIndex: 0),
            MathExamQuestion(id: "q4_wrd_3", topicId: 6, prompt: "36 ÷ 6 + 5 = ?", options: ["9", "10", "11", "12"], correctIndex: 2),
            MathExamQuestion(id: "q4_wrd_4", topicId: 6, prompt: "7 × 8 - 16 = ?", options: ["38", "40", "42", "44"], correctIndex: 1),
            MathExamQuestion(id: "q4_wrd_5", topicId: 6, prompt: "(15 + 5) ÷ 4 = ?", options: ["4", "5", "6", "7"], correctIndex: 1),
        ],

        // ── Topic 7: Fractions ───────────────────────────────────────────────
        7: [
            MathExamQuestion(id: "q4_frc_1", topicId: 7, prompt: "1/2 + 1/4 = ?", options: ["1/6", "2/6", "3/4", "1/3"], correctIndex: 2),
            MathExamQuestion(id: "q4_frc_2", topicId: 7, prompt: "3/4 - 1/4 = ?", options: ["1/4", "1/2", "2/3", "3/8"], correctIndex: 1),
            MathExamQuestion(id: "q4_frc_3", topicId: 7, prompt: "2/3 + 1/3 = ?", options: ["1/2", "1", "4/3", "5/6"], correctIndex: 1),
            MathExamQuestion(id: "q4_frc_4", topicId: 7, prompt: "5/6 - 1/3 = ?", options: ["1/2", "4/3", "2/3", "1/6"], correctIndex: 0),
            MathExamQuestion(id: "q4_frc_5", topicId: 7, prompt: "1/4 × 8 = ?", options: ["1", "2", "3", "4"], correctIndex: 1),
        ],

        // ── Topic 8: Geometry ────────────────────────────────────────────────
        8: [
            MathExamQuestion(id: "q4_geo_1", topicId: 8, prompt: "P = 4 × 6 = ?", options: ["20", "22", "24", "26"], correctIndex: 2),
            MathExamQuestion(id: "q4_geo_2", topicId: 8, prompt: "A = 7 × 5 = ?", options: ["30", "33", "35", "40"], correctIndex: 2),
            MathExamQuestion(id: "q4_geo_3", topicId: 8, prompt: "A = 1/2 × 8 × 6 = ?", options: ["20", "22", "24", "26"], correctIndex: 2),
            MathExamQuestion(id: "q4_geo_4", topicId: 8, prompt: "P = 2 × (9 + 4) = ?", options: ["24", "26", "28", "30"], correctIndex: 1),
            MathExamQuestion(id: "q4_geo_5", topicId: 8, prompt: "V = 4 × 3 × 2 = ?", options: ["18", "20", "24", "28"], correctIndex: 2),
        ],

        // ── Topic 9: Decimals ────────────────────────────────────────────────
        9: [
            MathExamQuestion(id: "q4_dec_1", topicId: 9, prompt: "2.5 + 1.5 = ?", options: ["3.5", "4.0", "4.5", "5.0"], correctIndex: 1),
            MathExamQuestion(id: "q4_dec_2", topicId: 9, prompt: "7.8 - 3.4 = ?", options: ["4.2", "4.4", "4.6", "4.8"], correctIndex: 1),
            MathExamQuestion(id: "q4_dec_3", topicId: 9, prompt: "3.2 × 4 = ?", options: ["11.8", "12.8", "13.2", "14.0"], correctIndex: 1),
            MathExamQuestion(id: "q4_dec_4", topicId: 9, prompt: "9.6 ÷ 3 = ?", options: ["2.2", "2.8", "3.2", "3.6"], correctIndex: 2),
            MathExamQuestion(id: "q4_dec_5", topicId: 9, prompt: "0.75 × 100 = ?", options: ["7.5", "75", "750", "0.075"], correctIndex: 1),
        ],

        // ── Topic 10: Algebra ────────────────────────────────────────────────
        10: [
            MathExamQuestion(id: "q4_alg_1", topicId: 10, prompt: "x + 5 = 12   →   x = ?", options: ["5", "6", "7", "8"], correctIndex: 2),
            MathExamQuestion(id: "q4_alg_2", topicId: 10, prompt: "2x = 18   →   x = ?", options: ["7", "8", "9", "10"], correctIndex: 2),
            MathExamQuestion(id: "q4_alg_3", topicId: 10, prompt: "x - 4 = 11   →   x = ?", options: ["14", "15", "16", "17"], correctIndex: 1),
            MathExamQuestion(id: "q4_alg_4", topicId: 10, prompt: "3x + 2 = 17   →   x = ?", options: ["4", "5", "6", "7"], correctIndex: 1),
            MathExamQuestion(id: "q4_alg_5", topicId: 10, prompt: "x² = 49   →   x = ?", options: ["6", "7", "8", "9"], correctIndex: 1),
        ],

        // ── Topic 11: Percentages ────────────────────────────────────────────
        11: [
            MathExamQuestion(id: "q4_pct_1", topicId: 11, prompt: "50% of 60 = ?", options: ["20", "25", "30", "35"], correctIndex: 2),
            MathExamQuestion(id: "q4_pct_2", topicId: 11, prompt: "25% of 80 = ?", options: ["15", "18", "20", "22"], correctIndex: 2),
            MathExamQuestion(id: "q4_pct_3", topicId: 11, prompt: "10% of 350 = ?", options: ["30", "35", "40", "45"], correctIndex: 1),
            MathExamQuestion(id: "q4_pct_4", topicId: 11, prompt: "75% of 40 = ?", options: ["25", "28", "30", "32"], correctIndex: 2),
            MathExamQuestion(id: "q4_pct_5", topicId: 11, prompt: "15% of 200 = ?", options: ["25", "28", "30", "35"], correctIndex: 2),
        ],

        // ── Topic 12: Measurement ────────────────────────────────────────────
        12: [
            MathExamQuestion(id: "q4_msr_1", topicId: 12, prompt: "1.5 m = ? cm", options: ["15", "150", "1,500", "0.15"], correctIndex: 1),
            MathExamQuestion(id: "q4_msr_2", topicId: 12, prompt: "2.5 kg = ? g", options: ["250", "2,500", "25,000", "25"], correctIndex: 1),
            MathExamQuestion(id: "q4_msr_3", topicId: 12, prompt: "90 min = ? hours", options: ["1", "1.5", "2", "0.9"], correctIndex: 1),
            MathExamQuestion(id: "q4_msr_4", topicId: 12, prompt: "4 L = ? mL", options: ["400", "4,000", "40,000", "40"], correctIndex: 1),
            MathExamQuestion(id: "q4_msr_5", topicId: 12, prompt: "360 cm = ? m", options: ["3.6", "36", "3,600", "0.36"], correctIndex: 0),
        ],
    ]

    // MARK: - MCQ Practice (topics 13+)

    /// MCQ-style practice questions for topics that don't have drag-and-drop content.
    /// Dictionary key = topicId, value = all 20 practice questions for that topic.
    /// Quests split: questions 0-4 = quest 1, 5-9 = quest 2, 10-14 = quest 3, 15-19 = quest 4.
    static var mcqPracticeByTopic: [Int: [MathExamQuestion]] = [

        13: [
            // Quest 1
            MathExamQuestion(id: "pv_prac_1_1", topicId: 13, prompt: "What is the value of the digit 3 in 345?", options: ["3", "30", "300", "3,000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_prac_1_2", topicId: 13, prompt: "How many tens are in 472?", options: ["4", "7", "2", "47", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_prac_1_3", topicId: 13, prompt: "Which digit is in the hundreds place in 816?", options: ["1", "6", "8", "81", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_prac_1_4", topicId: 13, prompt: "What is 500 + 60 + 3?", options: ["563", "536", "653", "356", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_prac_1_5", topicId: 13, prompt: "In the number 924, what is the value of the digit 2?", options: ["2", "200", "20", "920", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "pv_prac_2_1", topicId: 13, prompt: "Write 700 + 40 + 8 as a single number.", options: ["748", "784", "478", "847", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_prac_2_2", topicId: 13, prompt: "What is the expanded form of 631?", options: ["600 + 30 + 1", "600 + 3 + 1", "60 + 31 + 0", "630 + 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_prac_2_3", topicId: 13, prompt: "Which number has 5 hundreds, 0 tens, and 9 ones?", options: ["590", "905", "509", "950", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_prac_2_4", topicId: 13, prompt: "What is the value of the digit 7 in 1,732?", options: ["7", "70", "700", "7,000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_prac_2_5", topicId: 13, prompt: "In 4,056, which digit is in the tens place?", options: ["4", "0", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "pv_prac_3_1", topicId: 13, prompt: "What is the value of the 3 in 3,847?", options: ["3", "30", "300", "3,000", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pv_prac_3_2", topicId: 13, prompt: "Write 500 + 60 + 9 in standard form:", options: ["596", "569", "659", "956", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_prac_3_3", topicId: 13, prompt: "4 × 100 + 7 × 10 + 2 × 1 = ?", options: ["472", "427", "742", "247", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_prac_3_4", topicId: 13, prompt: "In 6,251, the digit 2 is in the ___ place.", options: ["ones", "tens", "hundreds", "thousands", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_prac_3_5", topicId: 13, prompt: "Which digit is in the hundreds place of 7,394?", options: ["7", "3", "9", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "pv_prac_4_1", topicId: 13, prompt: "8 × 1,000 + 0 × 100 + 5 × 10 + 3 × 1 = ?", options: ["8,530", "8,053", "8,503", "8,350", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_prac_4_2", topicId: 13, prompt: "In 45,732, what is the value of the digit 5?", options: ["5", "50", "500", "5,000", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pv_prac_4_3", topicId: 13, prompt: "Write 30,000 + 2,000 + 400 + 0 + 6 in standard form:", options: ["32,046", "32,406", "32,460", "30,246", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_prac_4_4", topicId: 13, prompt: "Which digit is in the ten-thousands place of 63,501?", options: ["6", "3", "5", "1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_prac_4_5", topicId: 13, prompt: "9 × 10,000 + 4 × 1,000 + 2 × 100 + 8 × 10 + 1 × 1 = ?", options: ["94,128", "94,281", "94,218", "94,812", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        14: [
            // Quest 1
            MathExamQuestion(id: "rnd_prac_1_1", topicId: 14, prompt: "Round 34 to the nearest 10.", options: ["30", "40", "35", "34", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "rnd_prac_1_2", topicId: 14, prompt: "Round 57 to the nearest 10.", options: ["50", "55", "60", "70", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rnd_prac_1_3", topicId: 14, prompt: "Round 85 to the nearest 10.", options: ["80", "90", "85", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_1_4", topicId: 14, prompt: "Round 142 to the nearest 10.", options: ["140", "150", "100", "145", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "rnd_prac_1_5", topicId: 14, prompt: "Round 276 to the nearest 10.", options: ["270", "280", "275", "300", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 2
            MathExamQuestion(id: "rnd_prac_2_1", topicId: 14, prompt: "Round 320 to the nearest 100.", options: ["200", "300", "400", "350", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_2_2", topicId: 14, prompt: "Round 450 to the nearest 100.", options: ["400", "500", "450", "550", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_2_3", topicId: 14, prompt: "Round 763 to the nearest 100.", options: ["700", "800", "760", "750", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_2_4", topicId: 14, prompt: "Round 938 to the nearest 100.", options: ["900", "1,000", "930", "940", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_2_5", topicId: 14, prompt: "Round 1,249 to the nearest 100.", options: ["1,200", "1,300", "1,250", "1,000", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 3
            MathExamQuestion(id: "rnd_prac_3_1", topicId: 14, prompt: "Round 347 to the nearest 10:", options: ["340", "350", "300", "400", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_3_2", topicId: 14, prompt: "Round 5,820 to the nearest 1,000:", options: ["5,000", "6,000", "5,800", "5,900", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_3_3", topicId: 14, prompt: "Round 4.67 to the nearest whole number:", options: ["4", "5", "4.6", "4.7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_3_4", topicId: 14, prompt: "3,450 rounded to the nearest 100 = ___", options: ["3,400", "3,500", "3,000", "4,000", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_3_5", topicId: 14, prompt: "Round 8,749 to the nearest 1,000:", options: ["8,000", "9,000", "8,700", "8,800", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "rnd_prac_4_1", topicId: 14, prompt: "Round 6,500 to the nearest 1,000:", options: ["6,000", "7,000", "6,500", "5,000", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_4_2", topicId: 14, prompt: "3.45 rounded to the nearest tenth = ___", options: ["3.4", "3.5", "3.0", "4.0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_4_3", topicId: 14, prompt: "Round 29,561 to the nearest 10,000:", options: ["20,000", "30,000", "29,000", "29,600", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_4_4", topicId: 14, prompt: "Which of these rounds to 400 to the nearest 100? 349 / 351 / 449 / 450", options: ["349", "351", "449", "450", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_prac_4_5", topicId: 14, prompt: "Round 7.085 to the nearest hundredth:", options: ["7.08", "7.09", "7.10", "7.00", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        15: [
            // Quest 1
            MathExamQuestion(id: "time_prac_1_1", topicId: 15, prompt: "What time does a clock show when both hands point to 12?", options: ["6:00", "12:00", "3:00", "9:00", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_1_2", topicId: 15, prompt: "The hour hand points to 3 and the minute hand points to 12. What time is it?", options: ["12:03", "3:12", "3:00", "12:15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_1_3", topicId: 15, prompt: "How many minutes are in 1 hour?", options: ["30", "100", "60", "24", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_1_4", topicId: 15, prompt: "The minute hand points to 6. How many minutes past the hour is it?", options: ["6", "16", "30", "60", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_1_5", topicId: 15, prompt: "What time is it when the hour hand is between 4 and 5, and the minute hand points to 12?", options: ["5:00", "4:30", "4:00", "12:04", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "time_prac_2_1", topicId: 15, prompt: "What time is 30 minutes after 2:00?", options: ["2:03", "2:30", "3:00", "2:13", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_2_2", topicId: 15, prompt: "A movie starts at 3:15 and lasts 1 hour. What time does it end?", options: ["4:15", "3:45", "4:00", "4:30", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "time_prac_2_3", topicId: 15, prompt: "How many minutes are in 2 hours?", options: ["102", "200", "120", "90", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_2_4", topicId: 15, prompt: "School starts at 8:45 AM and ends at 3:15 PM. How long is the school day?", options: ["6 hours 30 minutes", "7 hours", "6 hours", "7 hours 30 minutes", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "time_prac_2_5", topicId: 15, prompt: "It is 11:50 AM. What time will it be in 20 minutes?", options: ["11:70 AM", "12:00 PM", "12:10 PM", "12:20 PM", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "time_prac_3_1", topicId: 15, prompt: "2 hours 45 min + 1 hour 30 min = ___", options: ["3 hours 75 min", "4 hours 15 min", "4 hours 5 min", "3 hours 15 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_3_2", topicId: 15, prompt: "3:00 PM − 1 hour 25 min = ___", options: ["1:25 PM", "1:35 PM", "2:25 PM", "2:35 PM", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_3_3", topicId: 15, prompt: "120 minutes = ___ hours", options: ["1", "1.5", "2", "3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_3_4", topicId: 15, prompt: "4 hours 10 min − 1 hour 45 min = ___", options: ["2 hours 15 min", "2 hours 25 min", "3 hours 25 min", "2 hours 35 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_3_5", topicId: 15, prompt: "6:15 AM + 3 hours 50 min = ___", options: ["9:05 AM", "10:05 AM", "9:55 AM", "10:15 AM", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 4
            MathExamQuestion(id: "time_prac_4_1", topicId: 15, prompt: "270 minutes = ___ hours ___ minutes", options: ["3 h 70 min", "4 h 30 min", "4 h 10 min", "3 h 50 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_4_2", topicId: 15, prompt: "11:47 PM + 35 min = ___", options: ["12:17 AM", "12:22 AM", "11:82 PM", "0:22 AM", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_4_3", topicId: 15, prompt: "1 day 3 hours − 5 hours = ___", options: ["18 hours", "20 hours", "22 hours", "23 hours", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_prac_4_4", topicId: 15, prompt: "7:30 AM to 2:15 PM = ___ hours ___ minutes", options: ["6 h 15 min", "6 h 45 min", "7 h 15 min", "7 h 45 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_prac_4_5", topicId: 15, prompt: "3 weeks 4 days = ___ days", options: ["21", "24", "25", "28", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        16: [
            // Quest 1
            MathExamQuestion(id: "mon_prac_1_1", topicId: 16, prompt: "How much is 2 quarters worth?", options: ["20¢", "25¢", "50¢", "75¢", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_1_2", topicId: 16, prompt: "You have 3 dimes and 2 nickels. How much do you have?", options: ["32¢", "35¢", "40¢", "50¢", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_1_3", topicId: 16, prompt: "Which set of coins makes exactly $1.00?", options: ["3 quarters + 1 dime", "3 quarters + 1 nickel", "4 quarters", "5 dimes + 5 nickels", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_1_4", topicId: 16, prompt: "A pencil costs 45¢. You pay with 50¢. How much change do you get?", options: ["5¢", "15¢", "10¢", "4¢", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mon_prac_1_5", topicId: 16, prompt: "You buy a toy for $1.25. You pay with $2.00. How much change do you get?", options: ["65¢", "85¢", "75¢", "$1.25", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "mon_prac_2_1", topicId: 16, prompt: "A book costs £3.50 and a pen costs £1.20. How much do they cost together?", options: ["£4.50", "£4.70", "£5.70", "£4.30", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_2_2", topicId: 16, prompt: "You have £5.00 and spend £2.75. How much do you have left?", options: ["£2.75", "£2.25", "£3.25", "£2.50", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_2_3", topicId: 16, prompt: "Which costs more: 3 items at £1.20 each, or 1 item at £4.00?", options: ["3 items at £1.20", "1 item at £4.00", "They cost the same", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mon_prac_2_4", topicId: 16, prompt: "A bag of crisps costs 85p. How much do 2 bags cost?", options: ["£1.50", "£1.60", "£1.70", "£1.80", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_2_5", topicId: 16, prompt: "You want to buy items costing £2.40 and £3.80. Do you have enough with £6.00?", options: ["Yes, and you'll have £0.20 change", "No, you need 20p more", "Yes, exact amount", "Yes, and you'll have £1.00 change", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "mon_prac_3_1", topicId: 16, prompt: "$4.75 + $2.50 = ___", options: ["$6.25", "$7.25", "$7.00", "$6.75", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_3_2", topicId: 16, prompt: "$10.00 − $3.85 = ___", options: ["$6.05", "$6.15", "$7.15", "$7.05", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_3_3", topicId: 16, prompt: "3 × $1.25 = ___", options: ["$3.25", "$3.75", "$4.25", "$2.75", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_3_4", topicId: 16, prompt: "$5.00 − $1.37 = ___", options: ["$3.53", "$3.63", "$4.53", "$3.73", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_3_5", topicId: 16, prompt: "$2.40 + $3.60 + $1.50 = ___", options: ["$6.50", "$7.00", "$7.50", "$6.00", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "mon_prac_4_1", topicId: 16, prompt: "4 × $3.75 = ___", options: ["$12.00", "$14.00", "$15.00", "$16.00", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_4_2", topicId: 16, prompt: "$20.00 − $7.49 = ___", options: ["$12.41", "$12.51", "$13.51", "$12.61", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_4_3", topicId: 16, prompt: "$15.60 ÷ 4 = ___", options: ["$3.40", "$3.90", "$4.40", "$3.15", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_prac_4_4", topicId: 16, prompt: "50% of $28.00 = ___", options: ["$8.00", "$12.00", "$14.00", "$18.00", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_prac_4_5", topicId: 16, prompt: "$6.99 × 3 − $5.00 = ___", options: ["$15.97", "$16.97", "$17.97", "$14.97", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        17: [
            // Quest 1
            MathExamQuestion(id: "pat_prac_1_1", topicId: 17, prompt: "What comes next? 2, 4, 6, 8, ___", options: ["9", "10", "12", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_1_2", topicId: 17, prompt: "What comes next? 5, 10, 15, 20, ___", options: ["24", "25", "30", "22", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_1_3", topicId: 17, prompt: "What is the rule? 1, 3, 5, 7, 9, ...", options: ["Add 1", "Add 2", "Add 3", "Multiply by 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_1_4", topicId: 17, prompt: "What comes next? 20, 18, 16, 14, ___", options: ["13", "12", "10", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_1_5", topicId: 17, prompt: "What is the rule for 3, 6, 9, 12?", options: ["Add 2", "Add 4", "Add 3", "Multiply by 2", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "pat_prac_2_1", topicId: 17, prompt: "Find the missing number: 10, ___, 30, 40, 50", options: ["15", "20", "25", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_2_2", topicId: 17, prompt: "What comes next? 100, 90, 80, 70, ___", options: ["55", "65", "60", "50", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pat_prac_2_3", topicId: 17, prompt: "Find the missing number: 4, 8, ___, 16, 20", options: ["10", "14", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pat_prac_2_4", topicId: 17, prompt: "What is the rule? 100, 95, 90, 85, ...", options: ["Subtract 4", "Subtract 5", "Subtract 6", "Add 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_2_5", topicId: 17, prompt: "Find the missing number: 7, 14, ___, 28, 35", options: ["21", "20", "22", "19", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 3
            MathExamQuestion(id: "pat_prac_3_1", topicId: 17, prompt: "5, 10, 15, 20, ___", options: ["24", "25", "30", "22", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_3_2", topicId: 17, prompt: "3, 6, 12, 24, ___", options: ["36", "42", "48", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pat_prac_3_3", topicId: 17, prompt: "100, 90, 80, ___", options: ["75", "70", "65", "60", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_3_4", topicId: 17, prompt: "1, 4, 9, 16, ___ (square numbers)", options: ["20", "25", "24", "36", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_3_5", topicId: 17, prompt: "2, 6, 18, 54, ___ (×3 each time)", options: ["108", "162", "180", "216", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "pat_prac_4_1", topicId: 17, prompt: "nth term = 4n + 1: what is the 5th term?", options: ["20", "21", "22", "25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_4_2", topicId: 17, prompt: "nth term = 3n − 2: what is the 6th term?", options: ["14", "16", "18", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_4_3", topicId: 17, prompt: "Sequence: 7, 11, 15, 19 … nth term = ___", options: ["3n + 4", "4n + 3", "4n − 3", "3n + 7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_prac_4_4", topicId: 17, prompt: "1, 1, 2, 3, 5, 8, ___ (Fibonacci)", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pat_prac_4_5", topicId: 17, prompt: "nth term = n² − 1: what is the 4th term?", options: ["8", "9", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        18: [
            // Quest 1
            MathExamQuestion(id: "fct_prac_1_1", topicId: 18, prompt: "Which of the following is a factor of 12?", options: ["5", "7", "4", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_1_2", topicId: 18, prompt: "How many factors does 6 have?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_1_3", topicId: 18, prompt: "Which of these is a multiple of 4?", options: ["14", "22", "28", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_1_4", topicId: 18, prompt: "Is 36 a multiple of 9?", options: ["Yes", "No", "Only sometimes", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fct_prac_1_5", topicId: 18, prompt: "List all factors of 10. How many are there?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "fct_prac_2_1", topicId: 18, prompt: "What are all the factors of 18?", options: ["1,2,3,6,9,18", "1,2,4,9,18", "1,3,6,9,18", "2,3,6,9,18", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fct_prac_2_2", topicId: 18, prompt: "What is the lowest common multiple (LCM) of 4 and 6?", options: ["10", "12", "18", "24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_prac_2_3", topicId: 18, prompt: "Is 7 a prime number?", options: ["No, it has 3 factors", "Yes, it only has 2 factors", "No, it is composite", "Yes, because it is odd", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_prac_2_4", topicId: 18, prompt: "What is the HCF (greatest common factor) of 12 and 18?", options: ["3", "4", "6", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_2_5", topicId: 18, prompt: "Which of these numbers is composite (not prime)?", options: ["11", "13", "17", "15", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 3
            MathExamQuestion(id: "fct_prac_3_1", topicId: 18, prompt: "HCF(12, 18) = ___", options: ["3", "4", "6", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_3_2", topicId: 18, prompt: "LCM(4, 6) = ___", options: ["10", "12", "18", "24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_prac_3_3", topicId: 18, prompt: "3 × ___ = 24", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_3_4", topicId: 18, prompt: "HCF(20, 30) = ___", options: ["5", "6", "10", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_3_5", topicId: 18, prompt: "LCM(3, 5, 6) = ___", options: ["15", "20", "30", "60", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "fct_prac_4_1", topicId: 18, prompt: "HCF(48, 64) = ___", options: ["8", "12", "16", "24", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_4_2", topicId: 18, prompt: "LCM(8, 12) = ___", options: ["16", "24", "32", "48", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_prac_4_3", topicId: 18, prompt: "___ × 7 = 63", options: ["7", "8", "9", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_prac_4_4", topicId: 18, prompt: "HCF(36, 54) = ___", options: ["6", "9", "12", "18", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "fct_prac_4_5", topicId: 18, prompt: "LCM(6, 10, 15) = ___", options: ["30", "60", "90", "150", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        19: [
            // Quest 1
            MathExamQuestion(id: "mn_prac_1_1", topicId: 19, prompt: "What mixed number is shown by 3 whole and 1/2?", options: ["1/2", "3 1/2", "3/2", "3 + 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_1_2", topicId: 19, prompt: "How many halves make 2 wholes?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_1_3", topicId: 19, prompt: "Which improper fraction equals 1 whole?", options: ["2/3", "3/4", "4/4", "5/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_1_4", topicId: 19, prompt: "What is 7/2 as a mixed number?", options: ["2 1/2", "3 1/2", "3", "2 3/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_1_5", topicId: 19, prompt: "Convert 9/4 to a mixed number.", options: ["2 1/4", "2 3/4", "3 1/4", "1 5/4", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 2
            MathExamQuestion(id: "mn_prac_2_1", topicId: 19, prompt: "Convert 2 3/5 to an improper fraction.", options: ["5/5", "11/5", "13/5", "10/5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_2_2", topicId: 19, prompt: "What is 11/3 as a mixed number?", options: ["3 1/3", "3 2/3", "4 1/3", "2 5/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_2_3", topicId: 19, prompt: "Convert 4 1/2 to an improper fraction.", options: ["8/2", "9/2", "10/2", "5/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_2_4", topicId: 19, prompt: "Which mixed number equals 17/5?", options: ["3 1/5", "3 2/5", "4 1/5", "2 7/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_2_5", topicId: 19, prompt: "Convert 3 3/4 to an improper fraction.", options: ["12/4", "14/4", "15/4", "9/4", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "mn_prac_3_1", topicId: 19, prompt: "7/2 = ___ and ___", options: ["3 and 1/2", "3 and 2", "3 and 1", "2 and 1/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mn_prac_3_2", topicId: 19, prompt: "2 3/4 = ___/4", options: ["9", "10", "11", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_3_3", topicId: 19, prompt: "5/3 + 7/3 = ___", options: ["4", "4 1/3", "12/3", "2 1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mn_prac_3_4", topicId: 19, prompt: "3 1/5 = ___/5", options: ["13", "15", "16", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_3_5", topicId: 19, prompt: "19/4 = ___ (mixed number)", options: ["4 1/4", "4 3/4", "5 1/4", "3 3/4", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "mn_prac_4_1", topicId: 19, prompt: "3 2/5 + 1 4/5 = ___", options: ["4 6/5", "5 1/5", "4 1/5", "5 6/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_prac_4_2", topicId: 19, prompt: "5 1/6 − 2 5/6 = ___", options: ["2 1/3", "3 1/3", "2 2/3", "3 2/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mn_prac_4_3", topicId: 19, prompt: "29/6 as a mixed number = ___", options: ["4 5/6", "5 1/6", "4 4/6", "5 5/6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mn_prac_4_4", topicId: 19, prompt: "4 2/3 × 3 = ___", options: ["12 2/3", "13", "14", "14 2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_prac_4_5", topicId: 19, prompt: "6 1/4 − 3 3/4 = ___", options: ["2 1/2", "2 3/4", "3 1/2", "3 1/4", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        20: [
            // Quest 1
            MathExamQuestion(id: "cf_prac_1_1", topicId: 20, prompt: "Which fraction is larger: 1/2 or 1/4?", options: ["1/4", "1/2", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_1_2", topicId: 20, prompt: "Which fraction is smaller: 2/3 or 3/4?", options: ["2/3", "3/4", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_prac_1_3", topicId: 20, prompt: "Which fraction is equivalent to 1/2?", options: ["2/6", "3/6", "4/6", "2/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_1_4", topicId: 20, prompt: "Is 2/4 equal to 1/2?", options: ["No", "Yes", "Only sometimes", "Not sure", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_1_5", topicId: 20, prompt: "Order from smallest to largest: 1/4, 1/2, 1/3", options: ["1/4, 1/3, 1/2", "1/2, 1/3, 1/4", "1/3, 1/4, 1/2", "1/4, 1/2, 1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 2
            MathExamQuestion(id: "cf_prac_2_1", topicId: 20, prompt: "Which fraction is equivalent to 3/4?", options: ["6/10", "9/12", "6/8", "Both 9/12 and 6/8", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "cf_prac_2_2", topicId: 20, prompt: "Which is greater: 3/5 or 5/8?", options: ["3/5", "5/8", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_2_3", topicId: 20, prompt: "Order from greatest to smallest: 3/4, 2/3, 7/12", options: ["3/4, 2/3, 7/12", "2/3, 3/4, 7/12", "7/12, 2/3, 3/4", "3/4, 7/12, 2/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_prac_2_4", topicId: 20, prompt: "Which fraction is NOT equivalent to 2/3?", options: ["4/6", "6/9", "8/12", "6/10", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "cf_prac_2_5", topicId: 20, prompt: "Fill in the blank: 3/4 = ___/12", options: ["6", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "cf_prac_3_1", topicId: 20, prompt: "3/4 ___ 2/3 (< or >?)", options: ["<", ">", "=", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_3_2", topicId: 20, prompt: "1/2 = ___/8", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_prac_3_3", topicId: 20, prompt: "Order from least to greatest: 3/4, 1/2, 5/8", options: ["1/2, 5/8, 3/4", "3/4, 5/8, 1/2", "5/8, 1/2, 3/4", "1/2, 3/4, 5/8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_prac_3_4", topicId: 20, prompt: "5/6 ___ 7/9 (< or >?)", options: ["<", ">", "=", "Can't compare", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_3_5", topicId: 20, prompt: "2/3 = ___/12", options: ["6", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "cf_prac_4_1", topicId: 20, prompt: "Order from least to greatest: 2/9, 1/3, 5/12", options: ["2/9, 1/3, 5/12", "1/3, 2/9, 5/12", "5/12, 1/3, 2/9", "2/9, 5/12, 1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_prac_4_2", topicId: 20, prompt: "7/8 ___ 5/6 (< or >?)", options: ["<", ">", "=", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_prac_4_3", topicId: 20, prompt: "4/5 = ___/20", options: ["12", "14", "16", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_prac_4_4", topicId: 20, prompt: "Order from greatest to least: 11/12, 5/6, 7/9, 2/3", options: ["11/12, 5/6, 7/9, 2/3", "2/3, 7/9, 5/6, 11/12", "5/6, 11/12, 7/9, 2/3", "7/9, 11/12, 5/6, 2/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_prac_4_5", topicId: 20, prompt: "3/4 ___ 9/12 (< , > or =?)", options: ["<", ">", "=", "Can't compare", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        21: [
            // Quest 1
            MathExamQuestion(id: "af_prac_1_1", topicId: 21, prompt: "What is 1/4 + 2/4?", options: ["2/8", "3/8", "3/4", "1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_prac_1_2", topicId: 21, prompt: "What is 3/5 + 1/5?", options: ["4/10", "4/5", "2/5", "3/10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_1_3", topicId: 21, prompt: "What is 5/6 − 2/6?", options: ["3/0", "3/12", "3/6", "1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_prac_1_4", topicId: 21, prompt: "Simplify 4/8.", options: ["2/4", "1/2", "2/8", "Both 2/4 and 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "af_prac_1_5", topicId: 21, prompt: "What is 7/9 − 4/9?", options: ["3/0", "11/9", "3/9", "1/3", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "af_prac_2_1", topicId: 21, prompt: "What is 1/3 + 1/4? (Find a common denominator first)", options: ["2/7", "7/12", "5/12", "2/12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_2_2", topicId: 21, prompt: "What is 1/2 + 1/3?", options: ["2/5", "2/6", "5/6", "3/6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_prac_2_3", topicId: 21, prompt: "What is 3/4 − 1/3?", options: ["2/1", "5/12", "7/12", "2/12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_2_4", topicId: 21, prompt: "What is 2/5 + 1/3?", options: ["3/8", "11/15", "3/15", "7/15", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_2_5", topicId: 21, prompt: "What is 5/6 − 1/4?", options: ["4/2", "7/12", "4/12", "8/12", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "af_prac_3_1", topicId: 21, prompt: "3/8 + 5/8 = ___", options: ["8/16", "1", "8/8", "Both 1 and 8/8", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "af_prac_3_2", topicId: 21, prompt: "1/4 + 1/3 = ___", options: ["2/7", "5/12", "7/12", "2/12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_3_3", topicId: 21, prompt: "5/6 − 1/3 = ___", options: ["4/3", "1/2", "4/6", "Both 1/2 and 4/6", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "af_prac_3_4", topicId: 21, prompt: "3/4 + 2/5 = ___", options: ["5/9", "22/20", "23/20", "1 3/20", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "af_prac_3_5", topicId: 21, prompt: "7/8 − 1/4 = ___", options: ["6/4", "5/8", "6/8", "Both 5/8 and 6/4", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "af_prac_4_1", topicId: 21, prompt: "3/4 + 5/6 = ___", options: ["8/10", "1 7/12", "1 5/12", "8/12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_4_2", topicId: 21, prompt: "2 − 3/8 = ___", options: ["1 3/8", "1 5/8", "1 1/2", "1 7/8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_prac_4_3", topicId: 21, prompt: "2/3 + 1/4 + 1/6 = ___", options: ["4/13", "13/12", "1 1/12", "1 3/12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_prac_4_4", topicId: 21, prompt: "5 1/6 − 2 5/6 = ___", options: ["2 1/3", "3 1/3", "2 2/3", "3 2/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "af_prac_4_5", topicId: 21, prompt: "2 3/4 + 1 5/6 = ___", options: ["4 7/12", "3 8/10", "4 1/2", "4 8/12", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        22: [
            // Quest 1
            MathExamQuestion(id: "mf_prac_1_1", topicId: 22, prompt: "What is 1/2 × 4?", options: ["1/8", "2", "4/2", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_prac_1_2", topicId: 22, prompt: "What is 1/3 × 3?", options: ["1/9", "3/9", "1", "3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mf_prac_1_3", topicId: 22, prompt: "What is 3/4 × 2?", options: ["3/8", "6/4", "1 1/2", "Both 6/4 and 1 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_1_4", topicId: 22, prompt: "What is 2/5 × 5?", options: ["2/25", "10/5", "2", "Both 10/5 and 2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_1_5", topicId: 22, prompt: "A recipe uses 3/8 cup of sugar. How much is needed for 4 batches?", options: ["3/32", "12/8", "1 1/2", "Both 12/8 and 1 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 2
            MathExamQuestion(id: "mf_prac_2_1", topicId: 22, prompt: "What is 1/2 × 1/3?", options: ["2/3", "1/6", "2/6", "1/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_prac_2_2", topicId: 22, prompt: "What is 2/3 × 3/4?", options: ["5/7", "6/7", "6/12", "1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mf_prac_2_3", topicId: 22, prompt: "Simplify 6/12.", options: ["2/4", "3/6", "1/2", "All of the above", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_2_4", topicId: 22, prompt: "What is 3/5 × 2/3?", options: ["6/8", "5/8", "6/15", "2/5", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_2_5", topicId: 22, prompt: "What is 4/7 × 7/8?", options: ["28/56", "1/2", "11/15", "Both 28/56 and 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 3
            MathExamQuestion(id: "mf_prac_3_1", topicId: 22, prompt: "3/4 × 2/5 = ___", options: ["5/9", "6/20", "3/10", "Both 6/20 and 3/10", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_3_2", topicId: 22, prompt: "6 × 2/3 = ___", options: ["4", "12/3", "3", "12/6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mf_prac_3_3", topicId: 22, prompt: "1/2 × 1/2 = ___", options: ["1", "2/4", "1/4", "Both 2/4 and 1/4", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_3_4", topicId: 22, prompt: "5/6 × 4/5 = ___", options: ["9/11", "20/30", "2/3", "Both 20/30 and 2/3", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_3_5", topicId: 22, prompt: "7/8 × 4/7 = ___", options: ["28/56", "1/2", "11/15", "Both 28/56 and 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 4
            MathExamQuestion(id: "mf_prac_4_1", topicId: 22, prompt: "2 1/2 × 4/5 = ___", options: ["2", "8/10", "1 4/5", "2 2/10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mf_prac_4_2", topicId: 22, prompt: "3/4 × 12 = ___", options: ["8", "9", "10", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_prac_4_3", topicId: 22, prompt: "1 3/4 × 2/7 = ___", options: ["3/14", "1/2", "7/28", "5/14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_prac_4_4", topicId: 22, prompt: "2/3 × 3/4 = ___", options: ["5/7", "6/12", "1/2", "Both 6/12 and 1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mf_prac_4_5", topicId: 22, prompt: "2/3 × 3/4 × 8 = ___", options: ["4", "6/9", "12/12", "16/9", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        23: [
            // Quest 1
            MathExamQuestion(id: "rat_prac_1_1", topicId: 23, prompt: "A basket has 3 red apples and 5 green apples. What is the ratio of red to green?", options: ["5:3", "3:5", "3:8", "8:3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_1_2", topicId: 23, prompt: "Simplify the ratio 6:9.", options: ["3:4", "2:3", "3:6", "6:9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_1_3", topicId: 23, prompt: "Which ratio is equivalent to 1:3?", options: ["2:9", "3:9", "4:9", "2:3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_1_4", topicId: 23, prompt: "In a class, the ratio of boys to girls is 2:3. If there are 10 boys, how many girls are there?", options: ["12", "15", "6", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_1_5", topicId: 23, prompt: "Simplify the ratio 15:20.", options: ["5:7", "3:5", "3:4", "4:5", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "rat_prac_2_1", topicId: 23, prompt: "A recipe uses 2 cups of flour for every 3 cups of milk. If you use 6 cups of flour, how many cups of milk do you need?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_prac_2_2", topicId: 23, prompt: "The ratio of cats to dogs at a shelter is 5:2. There are 14 dogs. How many cats are there?", options: ["28", "30", "35", "40", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_prac_2_3", topicId: 23, prompt: "Which pair of ratios are equivalent?", options: ["1:2 and 2:5", "3:4 and 9:16", "5:6 and 10:12", "2:3 and 4:5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_prac_2_4", topicId: 23, prompt: "Fill in the blank: 4:7 = 12:___", options: ["14", "18", "21", "28", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_prac_2_5", topicId: 23, prompt: "A paint colour is mixed using red and blue in a ratio of 3:5. You need 24 parts total. How many parts are red?", options: ["6", "8", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "rat_prac_3_1", topicId: 23, prompt: "12:8 simplified = ___", options: ["4:3", "3:2", "6:4", "2:3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_3_2", topicId: 23, prompt: "If 3:x = 6:10, x = ___", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_prac_3_3", topicId: 23, prompt: "Ratio of 15 to 25 = ___:___", options: ["5:3", "3:5", "15:25", "1:5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_3_4", topicId: 23, prompt: "20:30:50 simplified = ___", options: ["4:6:10", "2:3:5", "1:2:3", "4:3:5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_3_5", topicId: 23, prompt: "If a:b = 4:5 and a = 24, then b = ___", options: ["20", "25", "28", "30", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 4
            MathExamQuestion(id: "rat_prac_4_1", topicId: 23, prompt: "Share 120 in ratio 3:5  -  smaller share = ___", options: ["40", "45", "60", "75", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_4_2", topicId: 23, prompt: "x:y = 2:7; if x = 10, y = ___", options: ["28", "35", "40", "14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_4_3", topicId: 23, prompt: "Ratio 1:25; if total = 104, larger part = ___", options: ["96", "100", "104", "80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_prac_4_4", topicId: 23, prompt: "Increase 80 in ratio 5:4 = ___", options: ["100", "90", "64", "70", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "rat_prac_4_5", topicId: 23, prompt: "Ratio 7:3 of total 200  -  larger part = ___", options: ["60", "120", "140", "150", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        24: [
            // Quest 1
            MathExamQuestion(id: "dg_prac_1_1", topicId: 24, prompt: "A bar chart shows apples: 8, bananas: 5, oranges: 3. Which fruit is most popular?", options: ["Bananas", "Oranges", "Apples", "All equal", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_1_2", topicId: 24, prompt: "What is the mean of 2, 4, 6, 8?", options: ["4", "5", "6", "3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_1_3", topicId: 24, prompt: "A pictogram shows ★ = 2 votes. If a movie has 4 stars, how many votes does it have?", options: ["4", "6", "8", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_1_4", topicId: 24, prompt: "What is the mean of 10, 20, 30?", options: ["15", "20", "25", "30", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_1_5", topicId: 24, prompt: "On a bar chart the scale goes up by 5s. A bar reaches the 4th line. What value does it show?", options: ["4", "15", "20", "25", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "dg_prac_2_1", topicId: 24, prompt: "What is the mean of 3, 7, 5, 9, 6?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_2_2", topicId: 24, prompt: "A bar chart shows Mon: 12, Tue: 8, Wed: 15, Thu: 10. What is the total?", options: ["40", "43", "45", "50", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_2_3", topicId: 24, prompt: "Five students scored: 6, 8, 7, 9, 5. What is the mean score?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_2_4", topicId: 24, prompt: "In a pictogram, ● = 5 children. Football shows 3 full circles. How many children chose football?", options: ["3", "8", "15", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_2_5", topicId: 24, prompt: "In a bar chart, Class A: 30, Class B: 24, Class C: 18. How many more students does A have than C?", options: ["6", "8", "12", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "dg_prac_3_1", topicId: 24, prompt: "Mean of 4, 8, 6, 10, 2 = ___", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_3_2", topicId: 24, prompt: "Range of 3, 9, 5, 1, 7 = ___", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_3_3", topicId: 24, prompt: "Median of 2, 5, 8, 11, 14 = ___", options: ["5", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_3_4", topicId: 24, prompt: "Mean of 6 numbers is 12 → total = ___", options: ["18", "60", "72", "120", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_3_5", topicId: 24, prompt: "Mode of 4, 4, 6, 8, 8 = ___", options: ["4 only", "8 only", "4 and 8", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "dg_prac_4_1", topicId: 24, prompt: "Mean of 70, 80, 75, 65, 90 = ___", options: ["75", "76", "78", "80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_prac_4_2", topicId: 24, prompt: "Mean = 14, n = 5, four values: 10, 15, 18, 12 → 5th = ___", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_4_3", topicId: 24, prompt: "Range of 3, 7, 12, 5, 19, 8 = ___", options: ["12", "14", "16", "19", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_4_4", topicId: 24, prompt: "Median of 5, 3, 8, 1, 9, 4, 7 = ___", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_prac_4_5", topicId: 24, prompt: "Mean of 12, 18, 15, 21 = ___", options: ["15", "16", "16.5", "17", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        25: [
            // Quest 1
            MathExamQuestion(id: "prm_prac_1_1", topicId: 25, prompt: "Is 2 a prime number?", options: ["No, it's even", "No, it's too small", "Yes, it has exactly 2 factors", "No, 1 is its only factor", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_prac_1_2", topicId: 25, prompt: "Which number is prime?", options: ["9", "11", "15", "21", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_1_3", topicId: 25, prompt: "Is 1 a prime number?", options: ["Yes", "No  -  it only has one factor", "Yes, because it's odd", "No  -  it's even", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_1_4", topicId: 25, prompt: "How many prime numbers are between 1 and 10?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_1_5", topicId: 25, prompt: "Which of these is NOT prime?", options: ["5", "7", "11", "9", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 2
            MathExamQuestion(id: "prm_prac_2_1", topicId: 25, prompt: "Write 12 as a product of prime factors.", options: ["2 × 6", "3 × 4", "2 × 2 × 3", "2 × 2 × 2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_prac_2_2", topicId: 25, prompt: "What is the prime factorisation of 18?", options: ["2 × 9", "2 × 3 × 3", "3 × 6", "2 × 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_2_3", topicId: 25, prompt: "Which list shows only prime numbers?", options: ["2, 3, 5, 7", "2, 4, 6, 8", "1, 3, 5, 7", "3, 5, 9, 11", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prm_prac_2_4", topicId: 25, prompt: "What is the prime factorisation of 30?", options: ["2 × 3 × 5", "5 × 6", "2 × 15", "3 × 10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prm_prac_2_5", topicId: 25, prompt: "Express 20 as a product of its prime factors.", options: ["4 × 5", "2 × 10", "2 × 2 × 5", "2 × 2 × 5 is same as 4 × 5", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "prm_prac_3_1", topicId: 25, prompt: "24 = 2³ × ___", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_3_2", topicId: 25, prompt: "HCF(30, 42) using prime factors = ___", options: ["3", "6", "7", "14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_3_3", topicId: 25, prompt: "Is 91 prime or composite?", options: ["Prime", "Composite (7 × 13)", "Prime (only odd)", "Composite (9 × 10)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_3_4", topicId: 25, prompt: "36 = 2² × ___", options: ["6", "9", "3²", "Both 9 and 3²", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "prm_prac_3_5", topicId: 25, prompt: "48 = 2⁴ × ___", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "prm_prac_4_1", topicId: 25, prompt: "HCF(24, 36) using prime factors = ___", options: ["6", "8", "12", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_prac_4_2", topicId: 25, prompt: "LCM(12, 18) using prime factors = ___", options: ["24", "36", "72", "216", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_prac_4_3", topicId: 25, prompt: "100 = 2² × ___", options: ["25", "5²", "10", "Both 25 and 5²", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "prm_prac_4_4", topicId: 25, prompt: "Is 97 prime? (check divisibility up to √97 ≈ 9.8)", options: ["No, ÷ 7", "No, ÷ 3", "Yes, prime", "No, ÷ 11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_prac_4_5", topicId: 25, prompt: "2³ × 3² = ___", options: ["24", "36", "48", "72", "I don't know / Wasn't taught"], correctIndex: 3),
        ],

        26: [
            // Quest 1
            MathExamQuestion(id: "neg_prac_1_1", topicId: 26, prompt: "Which number is smaller: −3 or −7?", options: ["−3", "−7", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_1_2", topicId: 26, prompt: "Order from smallest to largest: −1, 3, −5, 0", options: ["−5, −1, 0, 3", "3, 0, −1, −5", "0, −1, −5, 3", "−1, −5, 0, 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "neg_prac_1_3", topicId: 26, prompt: "What is the temperature if it is 3°C and drops by 5°C?", options: ["8°C", "−2°C", "2°C", "−8°C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_1_4", topicId: 26, prompt: "Which is the correct position on a number line? (−4 is to the ___ of 0)", options: ["right", "left", "above", "below", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_1_5", topicId: 26, prompt: "What is −2 + 5?", options: ["−7", "−3", "3", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "neg_prac_2_1", topicId: 26, prompt: "What is −6 + 4?", options: ["10", "2", "−2", "−10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_prac_2_2", topicId: 26, prompt: "What is 3 − 8?", options: ["5", "11", "−5", "−11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_prac_2_3", topicId: 26, prompt: "What is −3 − 4?", options: ["1", "−1", "7", "−7", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "neg_prac_2_4", topicId: 26, prompt: "The temperature is −8°C at night and rises 12°C by noon. What is the noon temperature?", options: ["4°C", "−4°C", "20°C", "−20°C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "neg_prac_2_5", topicId: 26, prompt: "Which is larger: −12 or −9?", options: ["−12", "−9", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "neg_prac_3_1", topicId: 26, prompt: "−5 + 8 = ___", options: ["−13", "−3", "3", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_prac_3_2", topicId: 26, prompt: "3 − (−4) = ___", options: ["−1", "−7", "1", "7", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "neg_prac_3_3", topicId: 26, prompt: "−6 × (−3) = ___", options: ["−18", "−9", "9", "18", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "neg_prac_3_4", topicId: 26, prompt: "−12 ÷ 4 = ___", options: ["3", "−3", "48", "−48", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_3_5", topicId: 26, prompt: "−9 − (−3) = ___", options: ["−12", "12", "−6", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "neg_prac_4_1", topicId: 26, prompt: "−3 + 8 = ___", options: ["5", "11", "−11", "−5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "neg_prac_4_2", topicId: 26, prompt: "−20 + 35 − 10 = ___", options: ["5", "−5", "45", "−45", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "neg_prac_4_3", topicId: 26, prompt: "−7 × 3 = ___", options: ["21", "−21", "10", "−10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_4_4", topicId: 26, prompt: "−4 × (−5) = ___", options: ["−20", "20", "−9", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_prac_4_5", topicId: 26, prompt: "(−3)² = ___", options: ["−9", "9", "6", "−6", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        27: [
            // Quest 1
            MathExamQuestion(id: "coord_prac_1_1", topicId: 27, prompt: "Which coordinate is read first (horizontal or vertical)?", options: ["Vertical (y)", "Horizontal (x)", "Either order", "Diagonal", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_1_2", topicId: 27, prompt: "What are the coordinates of the origin?", options: ["(1, 1)", "(0, 1)", "(0, 0)", "(1, 0)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "coord_prac_1_3", topicId: 27, prompt: "A point is 3 units right and 4 units up from the origin. What are its coordinates?", options: ["(4, 3)", "(3, 4)", "(−3, 4)", "(4, −3)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_1_4", topicId: 27, prompt: "What are the coordinates of a point 5 right and 0 up?", options: ["(0, 5)", "(5, 5)", "(5, 0)", "(0, 0)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "coord_prac_1_5", topicId: 27, prompt: "Point A is at (2, 6) and point B is at (2, 1). Are they on the same vertical line?", options: ["No", "Yes, same x-value", "Yes, same y-value", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 2
            MathExamQuestion(id: "coord_prac_2_1", topicId: 27, prompt: "In which quadrant is the point (−3, 4)?", options: ["Quadrant 1", "Quadrant 2", "Quadrant 3", "Quadrant 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_2_2", topicId: 27, prompt: "In which quadrant is the point (5, −2)?", options: ["Quadrant 1", "Quadrant 2", "Quadrant 3", "Quadrant 4", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "coord_prac_2_3", topicId: 27, prompt: "A square has three vertices at (1,1), (4,1), and (4,4). What are the coordinates of the fourth vertex?", options: ["(1, 4)", "(4, 1)", "(1, −4)", "(−1, 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_prac_2_4", topicId: 27, prompt: "What are the coordinates of a point in Quadrant 3?", options: ["(3, 5)", "(−3, 5)", "(3, −5)", "(−3, −5)", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "coord_prac_2_5", topicId: 27, prompt: "The midpoint of (2, 4) and (6, 8) is:", options: ["(4, 4)", "(4, 6)", "(8, 12)", "(3, 5)", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "coord_prac_3_1", topicId: 27, prompt: "Plot A(3, −2): which quadrant?", options: ["Q1", "Q2", "Q3", "Q4", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "coord_prac_3_2", topicId: 27, prompt: "Midpoint of (2,4) and (6,8) = (___,___)", options: ["(4,6)", "(4,4)", "(8,12)", "(3,5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_prac_3_3", topicId: 27, prompt: "Distance from (0,0) to (3,4) = ___", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "coord_prac_3_4", topicId: 27, prompt: "Reflect (4, −3) in x-axis → ___", options: ["(−4, −3)", "(4, 3)", "(−4, 3)", "(3, 4)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_3_5", topicId: 27, prompt: "Midpoint of (−2,4) and (6,−2) = ___", options: ["(2, 1)", "(4, 2)", "(2, 2)", "(1, 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 4
            MathExamQuestion(id: "coord_prac_4_1", topicId: 27, prompt: "(5, 3) translated 3 left, 4 down → ___", options: ["(8, 7)", "(2, −1)", "(2, 7)", "(8, −1)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_4_2", topicId: 27, prompt: "Distance between (1,3) and (1,9) = ___", options: ["3", "6", "9", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_prac_4_3", topicId: 27, prompt: "Reflect (−3, −2) in both axes → ___", options: ["(3, 2)", "(−3, 2)", "(3, −2)", "(2, 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_prac_4_4", topicId: 27, prompt: "Rotate (3, −4) by 180° about origin → ___", options: ["(−3, 4)", "(4, 3)", "(−4, 3)", "(3, 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_prac_4_5", topicId: 27, prompt: "Distance from (−3,0) to (5,0) = ___", options: ["5", "8", "3", "2", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        28: [
            // Quest 1
            MathExamQuestion(id: "vol_prac_1_1", topicId: 28, prompt: "What unit is used to measure volume?", options: ["cm²", "cm³", "cm", "kg", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_1_2", topicId: 28, prompt: "How many unit cubes fit in a layer 3 cubes wide and 2 cubes long?", options: ["5", "6", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_1_3", topicId: 28, prompt: "A box is 2 cm × 3 cm × 4 cm. What is its volume?", options: ["9 cm³", "18 cm³", "24 cm³", "12 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_prac_1_4", topicId: 28, prompt: "A cube has a side length of 3 cm. What is its volume?", options: ["9 cm³", "18 cm³", "27 cm³", "6 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_prac_1_5", topicId: 28, prompt: "A shape is made of 12 unit cubes. What is its volume?", options: ["12 cm", "12 cm²", "12 cm³", "6 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "vol_prac_2_1", topicId: 28, prompt: "What is the volume of a cuboid with length 5, width 4, and height 3?", options: ["12 cm³", "20 cm³", "60 cm³", "24 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_prac_2_2", topicId: 28, prompt: "A swimming pool is 10 m long, 5 m wide, and 2 m deep. What is its volume?", options: ["17 m³", "100 m³", "50 m³", "35 m³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_2_3", topicId: 28, prompt: "A cube has a volume of 8 cm³. What is its side length?", options: ["1 cm", "2 cm", "4 cm", "8 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_2_4", topicId: 28, prompt: "A box has volume 120 cm³, length 10 cm, width 4 cm. What is its height?", options: ["2 cm", "3 cm", "4 cm", "6 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_2_5", topicId: 28, prompt: "Two cuboids: A is 4×3×2 and B is 3×4×2. How do their volumes compare?", options: ["A is bigger", "B is bigger", "They are equal", "Can't tell", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "vol_prac_3_1", topicId: 28, prompt: "V = l×w×h: 5×4×3 = ___", options: ["12 cm³", "20 cm³", "60 cm³", "24 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_prac_3_2", topicId: 28, prompt: "If V = 60 and l×w = 12, h = ___", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_3_3", topicId: 28, prompt: "A cube with side 4: V = ___", options: ["12 cm³", "16 cm³", "32 cm³", "64 cm³", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "vol_prac_3_4", topicId: 28, prompt: "V = 8×6×5 = ___", options: ["48 cm³", "120 cm³", "160 cm³", "240 cm³", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "vol_prac_3_5", topicId: 28, prompt: "V = 210 cm³, base area = 35 cm², h = ___", options: ["4 cm", "5 cm", "6 cm", "7 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "vol_prac_4_1", topicId: 28, prompt: "Side doubled → V multiplied by ___", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "vol_prac_4_2", topicId: 28, prompt: "V = 120×15×8 = ___", options: ["1,440 cm³", "14,400 cm³", "143 cm³", "1,200 cm³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_prac_4_3", topicId: 28, prompt: "V = 20×12×8 = ___", options: ["1,920 cm³", "192 cm³", "2,400 cm³", "960 cm³", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vol_prac_4_4", topicId: 28, prompt: "V = 360 cm³, l = 12, w = 5, h = ___", options: ["4 cm", "5 cm", "6 cm", "8 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_prac_4_5", topicId: 28, prompt: "(4×2×3) + (5×2×3) = ___", options: ["24 cm³", "30 cm³", "54 cm³", "18 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        29: [
            // Quest 1
            MathExamQuestion(id: "ang_prac_1_1", topicId: 29, prompt: "What type of angle is exactly 90°?", options: ["Acute", "Obtuse", "Right angle", "Straight", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_prac_1_2", topicId: 29, prompt: "What type of angle is 45°?", options: ["Right", "Obtuse", "Reflex", "Acute", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_prac_1_3", topicId: 29, prompt: "What type of angle is 135°?", options: ["Acute", "Reflex", "Right", "Obtuse", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_prac_1_4", topicId: 29, prompt: "Angles on a straight line add up to:", options: ["90°", "270°", "360°", "180°", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_prac_1_5", topicId: 29, prompt: "Two angles on a straight line are 70° and ___°.", options: ["70°", "90°", "110°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "ang_prac_2_1", topicId: 29, prompt: "The angles in a triangle add up to:", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_2_2", topicId: 29, prompt: "A triangle has angles of 50° and 70°. What is the third angle?", options: ["50°", "60°", "80°", "90°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_2_3", topicId: 29, prompt: "What type of angle is 200°?", options: ["Acute", "Obtuse", "Right", "Reflex", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_prac_2_4", topicId: 29, prompt: "Two angles together make a right angle. One is 35°. What is the other?", options: ["35°", "45°", "55°", "65°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_prac_2_5", topicId: 29, prompt: "Angles around a full point add up to:", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 3
            MathExamQuestion(id: "ang_prac_3_1", topicId: 29, prompt: "180° − 47° − 82° = ___", options: ["41°", "51°", "61°", "71°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_3_2", topicId: 29, prompt: "Supplementary angle of 63° = ___", options: ["27°", "107°", "117°", "127°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_prac_3_3", topicId: 29, prompt: "x + 55 + 70 = 180, x = ___", options: ["45°", "55°", "65°", "75°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_3_4", topicId: 29, prompt: "90° + 120° + ___ = 360°", options: ["140°", "150°", "160°", "170°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_3_5", topicId: 29, prompt: "Complementary angle of 38° = ___", options: ["42°", "52°", "62°", "142°", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "ang_prac_4_1", topicId: 29, prompt: "Each interior angle of regular pentagon = (5−2)×180°÷5 = ___", options: ["100°", "108°", "120°", "72°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_4_2", topicId: 29, prompt: "Co-interior angles (parallel lines): 112° + x = 180°, x = ___", options: ["58°", "68°", "78°", "88°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_4_3", topicId: 29, prompt: "Sum of interior angles of hexagon = (6−2) × 180° = ___", options: ["540°", "600°", "720°", "900°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_prac_4_4", topicId: 29, prompt: "Isosceles triangle: top = 40°, each base angle = ___", options: ["40°", "70°", "60°", "80°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_prac_4_5", topicId: 29, prompt: "Exterior angle of regular hexagon = 360°÷6 = ___", options: ["45°", "60°", "72°", "90°", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        30: [
            // Quest 1
            MathExamQuestion(id: "sym_prac_1_1", topicId: 30, prompt: "How many lines of symmetry does a square have?", options: ["2", "4", "1", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_1_2", topicId: 30, prompt: "Which letter has exactly 1 line of symmetry?", options: ["S", "Z", "A", "N", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_prac_1_3", topicId: 30, prompt: "A shape is reflected across a vertical line. The original point is 3 units to the left of the line. Where is the reflected point?", options: ["3 units to the left", "3 units above", "3 units to the right", "6 units to the left", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_prac_1_4", topicId: 30, prompt: "How many lines of symmetry does an equilateral triangle have?", options: ["1", "2", "3", "0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_prac_1_5", topicId: 30, prompt: "Which of these shapes has NO lines of symmetry?", options: ["Circle", "Rectangle", "Scalene triangle", "Isosceles triangle", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "sym_prac_2_1", topicId: 30, prompt: "A rectangle has how many lines of symmetry?", options: ["4", "1", "2", "0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_prac_2_2", topicId: 30, prompt: "What is rotational symmetry?", options: ["When a shape can be folded in half", "When a shape looks the same after being rotated less than a full turn", "When a shape is reflected in a mirror", "When a shape has no lines of symmetry", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_2_3", topicId: 30, prompt: "A regular hexagon has how many lines of symmetry?", options: ["3", "4", "8", "6", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "sym_prac_2_4", topicId: 30, prompt: "Point A is at (2, 5). It is reflected across the x-axis. What are the new coordinates?", options: ["(−2, 5)", "(2, −5)", "(5, 2)", "(−2, −5)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_2_5", topicId: 30, prompt: "Which shape has rotational symmetry of order 4?", options: ["Equilateral triangle", "Rectangle", "Square", "Regular pentagon", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "sym_prac_3_1", topicId: 30, prompt: "A square has ___ lines of symmetry", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_3_2", topicId: 30, prompt: "Reflect (3, 2) across x-axis: (___,___)", options: ["(3, −2)", "(−3, 2)", "(−3, −2)", "(2, 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sym_prac_3_3", topicId: 30, prompt: "A regular hexagon has ___ lines of symmetry", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "sym_prac_3_4", topicId: 30, prompt: "Reflect (−3, 4) across y-axis → ___", options: ["(3, −4)", "(−3, −4)", "(4, −3)", "(3, 4)", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "sym_prac_3_5", topicId: 30, prompt: "Order 3 rotational symmetry: shape looks same every ___ degrees", options: ["90°", "120°", "180°", "240°", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "sym_prac_4_1", topicId: 30, prompt: "Reflect (5, −2) across y-axis → ___", options: ["(−5, −2)", "(5, 2)", "(−5, 2)", "(2, −5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sym_prac_4_2", topicId: 30, prompt: "A regular octagon has ___ lines of symmetry", options: ["4", "6", "8", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_prac_4_3", topicId: 30, prompt: "Reflect (−2, 5) across x-axis → ___", options: ["(2, 5)", "(−2, −5)", "(5, −2)", "(2, −5)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_4_4", topicId: 30, prompt: "A regular pentagon has rotational symmetry of order ___", options: ["4", "5", "6", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_prac_4_5", topicId: 30, prompt: "Reflect (4, −3) across both axes → ___", options: ["(−4, 3)", "(4, 3)", "(−4, −3)", "(3, −4)", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 31 – Percentages
        31: [
            MathExamQuestion(id: "pct_prac_1_1", topicId: 31, prompt: "What does 'percent' mean?", options: ["Per ten", "Per hundred", "Per thousand", "Per million", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_prac_1_2", topicId: 31, prompt: "What is 50% as a fraction?", options: ["1/4", "1/3", "1/2", "3/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_1_3", topicId: 31, prompt: "What is 25% as a decimal?", options: ["2.5", "0.025", "0.25", "25.0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_1_4", topicId: 31, prompt: "What is 100% of 80?", options: ["8", "40", "80", "800", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_1_5", topicId: 31, prompt: "Write 7/10 as a percentage.", options: ["7%", "17%", "70%", "700%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_2_1", topicId: 31, prompt: "What is 10% of 200?", options: ["2", "10", "20", "200", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_2_2", topicId: 31, prompt: "What is 50% of 64?", options: ["16", "32", "36", "48", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_prac_2_3", topicId: 31, prompt: "Convert 3/4 to a percentage.", options: ["34%", "43%", "70%", "75%", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pct_prac_2_4", topicId: 31, prompt: "What is 20% of 150?", options: ["15", "20", "30", "35", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_2_5", topicId: 31, prompt: "A shirt costs £40 and is 10% off. How much is the discount?", options: ["£2", "£4", "£8", "£10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_prac_3_1", topicId: 31, prompt: "What is 35% of 200?", options: ["35", "60", "70", "75", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_3_2", topicId: 31, prompt: "A price rises from £50 to £60. What is the percentage increase?", options: ["10%", "15%", "20%", "25%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_3_3", topicId: 31, prompt: "What is 15% of 80?", options: ["8", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_3_4", topicId: 31, prompt: "Convert 0.6 to a percentage.", options: ["6%", "16%", "60%", "600%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_3_5", topicId: 31, prompt: "A score of 18 out of 25  -  what percentage is that?", options: ["64%", "68%", "72%", "76%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_4_1", topicId: 31, prompt: "A laptop costs £800. VAT is 20%. What is the final price?", options: ["£820", "£840", "£960", "£1000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_4_2", topicId: 31, prompt: "A population of 2400 grows by 5%. What is the new population?", options: ["2420", "2450", "2500", "2520", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pct_prac_4_3", topicId: 31, prompt: "What is 12.5% of 160?", options: ["16", "18", "20", "22", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_prac_4_4", topicId: 31, prompt: "A value decreases from 250 to 200. What is the percentage decrease?", options: ["15%", "20%", "25%", "50%", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_prac_4_5", topicId: 31, prompt: "If 30% of a number is 90, what is the number?", options: ["27", "270", "300", "900", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 32 – Algebra Basics
        32: [
            MathExamQuestion(id: "alg_prac_1_1", topicId: 32, prompt: "In algebra, what does a letter like x represent?", options: ["A label", "An unknown number", "The letter x only", "A unit of measurement", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_1_2", topicId: 32, prompt: "Simplify: 3a + 2a", options: ["32a", "5a", "6a", "5a²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_1_3", topicId: 32, prompt: "What is the value of 4x when x = 5?", options: ["9", "15", "20", "45", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_1_4", topicId: 32, prompt: "Which of these is an algebraic expression?", options: ["4 + 3 = 7", "5 × 2", "2x + 1", "10 ÷ 2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_1_5", topicId: 32, prompt: "Simplify: b + b + b", options: ["b³", "3b", "b3", "3 + b", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_2_1", topicId: 32, prompt: "Simplify: 5x − 2x + 3x", options: ["3x", "5x", "6x", "10x", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_2_2", topicId: 32, prompt: "Evaluate 2a − b when a = 4 and b = 3.", options: ["2", "5", "8", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_2_3", topicId: 32, prompt: "Which terms are 'like terms'?", options: ["3x and 3y", "4x² and 4x", "2a and 5a", "6b and 6b²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_2_4", topicId: 32, prompt: "Simplify: 4m + 2n − m", options: ["3m + 2n", "5m + 2n", "4m + n", "3mn", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_prac_2_5", topicId: 32, prompt: "What is the value of x² when x = 3?", options: ["6", "8", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_3_1", topicId: 32, prompt: "Simplify: 3(x + 4)  -  expand first, then simplify.", options: ["3x + 4", "3x + 7", "3x + 12", "x + 12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_3_2", topicId: 32, prompt: "Evaluate 3x² − 2 when x = 2.", options: ["8", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_3_3", topicId: 32, prompt: "Simplify: 6xy − 2xy + xy", options: ["3xy", "4xy", "5xy", "9xy", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_3_4", topicId: 32, prompt: "Which expression equals 2(3x − 1)?", options: ["5x − 1", "6x − 1", "6x − 2", "6x + 2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_prac_3_5", topicId: 32, prompt: "If p = 3 and q = −2, what is p + 2q?", options: ["−7", "−1", "1", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_4_1", topicId: 32, prompt: "Simplify: (2x + 3) + (4x − 1)", options: ["6x + 2", "6x + 4", "6x − 2", "8x + 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_prac_4_2", topicId: 32, prompt: "Evaluate 5a² + 2a − 1 when a = 2.", options: ["21", "23", "25", "27", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_prac_4_3", topicId: 32, prompt: "Simplify: 4(2x − 3) − 2x", options: ["6x − 12", "6x + 12", "10x − 12", "10x + 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_prac_4_4", topicId: 32, prompt: "Which is NOT a correct simplification of 3x + 6?", options: ["3(x + 2)", "6 + 3x", "3x + 6", "9x", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "alg_prac_4_5", topicId: 32, prompt: "If the perimeter of a rectangle is 2l + 2w and l = 5, w = 3, what is the perimeter?", options: ["13", "15", "16", "18", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 33 – Solving Equations
        33: [
            MathExamQuestion(id: "eq_prac_1_1", topicId: 33, prompt: "What does solving an equation mean?", options: ["Simplifying both sides", "Finding the value of the unknown", "Expanding brackets", "Collecting like terms", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_1_2", topicId: 33, prompt: "Solve: x + 5 = 12", options: ["x = 5", "x = 6", "x = 7", "x = 17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_1_3", topicId: 33, prompt: "Solve: x − 3 = 10", options: ["x = 7", "x = 13", "x = 14", "x = 30", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_1_4", topicId: 33, prompt: "Solve: 4x = 20", options: ["x = 4", "x = 5", "x = 16", "x = 80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_1_5", topicId: 33, prompt: "Solve: x/3 = 6", options: ["x = 2", "x = 3", "x = 9", "x = 18", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "eq_prac_2_1", topicId: 33, prompt: "Solve: 2x + 3 = 11", options: ["x = 3", "x = 4", "x = 7", "x = 8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_2_2", topicId: 33, prompt: "Solve: 3x − 4 = 14", options: ["x = 3", "x = 5", "x = 6", "x = 8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_2_3", topicId: 33, prompt: "Solve: 5x + 1 = 26", options: ["x = 4", "x = 5", "x = 6", "x = 7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_2_4", topicId: 33, prompt: "Solve: x/4 + 2 = 5", options: ["x = 3", "x = 8", "x = 12", "x = 28", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_2_5", topicId: 33, prompt: "Solve: 7 − x = 2", options: ["x = 2", "x = 5", "x = 7", "x = 9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_3_1", topicId: 33, prompt: "Solve: 4(x + 2) = 20", options: ["x = 2", "x = 3", "x = 5", "x = 7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_3_2", topicId: 33, prompt: "Solve: 2(3x − 1) = 16", options: ["x = 2", "x = 3", "x = 4", "x = 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_3_3", topicId: 33, prompt: "Solve: 5x − 3 = 3x + 7", options: ["x = 2", "x = 4", "x = 5", "x = 10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_3_4", topicId: 33, prompt: "Solve: 3(x − 4) = 9", options: ["x = 3", "x = 5", "x = 7", "x = 9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_3_5", topicId: 33, prompt: "Solve: 2x/3 = 8", options: ["x = 4", "x = 6", "x = 12", "x = 16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_4_1", topicId: 33, prompt: "Solve: 4x + 5 = 2x + 13", options: ["x = 2", "x = 3", "x = 4", "x = 9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_4_2", topicId: 33, prompt: "Solve: 3(2x + 1) = 2(x + 9)", options: ["x = 2", "x = 3", "x = 4", "x = 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_4_3", topicId: 33, prompt: "Solve: (x + 3)/2 = 7", options: ["x = 8", "x = 10", "x = 11", "x = 14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_prac_4_4", topicId: 33, prompt: "Solve: 6x − 2 = 4x + 10", options: ["x = 4", "x = 6", "x = 8", "x = 12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_prac_4_5", topicId: 33, prompt: "A number doubled then increased by 7 equals 25. What is the number?", options: ["6", "8", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 34 – Inequalities
        34: [
            MathExamQuestion(id: "ineq_prac_1_1", topicId: 34, prompt: "What does the symbol > mean?", options: ["Less than", "Greater than", "Equal to", "Not equal to", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_1_2", topicId: 34, prompt: "Which value satisfies x > 5?", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ineq_prac_1_3", topicId: 34, prompt: "Is x = 4 a solution to x ≤ 4?", options: ["Yes", "No", "Only if x > 0", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "ineq_prac_1_4", topicId: 34, prompt: "Which symbol means 'less than or equal to'?", options: ["<", ">", "≤", "≥", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_1_5", topicId: 34, prompt: "On a number line, an open circle at 3 pointing right represents:", options: ["x ≤ 3", "x ≥ 3", "x > 3", "x < 3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_2_1", topicId: 34, prompt: "Solve: x + 3 > 7", options: ["x > 3", "x > 4", "x > 7", "x > 10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_2_2", topicId: 34, prompt: "Solve: 2x ≤ 10", options: ["x ≤ 2", "x ≤ 5", "x ≤ 8", "x ≤ 20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_2_3", topicId: 34, prompt: "Solve: x − 4 < 3", options: ["x < −1", "x < 1", "x < 7", "x < 12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_2_4", topicId: 34, prompt: "Solve: 3x ≥ 12", options: ["x ≥ 3", "x ≥ 4", "x ≥ 9", "x ≥ 15", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_2_5", topicId: 34, prompt: "List the integers that satisfy: 1 < x ≤ 5", options: ["1, 2, 3, 4", "2, 3, 4, 5", "1, 2, 3, 4, 5", "2, 3, 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_3_1", topicId: 34, prompt: "Solve: 4x − 2 > 10", options: ["x > 2", "x > 3", "x > 4", "x > 8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_3_2", topicId: 34, prompt: "When you multiply or divide an inequality by a negative number, what happens to the sign?", options: ["It stays the same", "It reverses", "It becomes =", "It disappears", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_3_3", topicId: 34, prompt: "Solve: −2x < 8", options: ["x < −4", "x > −4", "x < 4", "x > 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_3_4", topicId: 34, prompt: "Solve: 3x + 5 ≤ 20", options: ["x ≤ 3", "x ≤ 5", "x ≤ 7", "x ≤ 8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_3_5", topicId: 34, prompt: "Which integers satisfy −2 ≤ x < 2?", options: ["−2, −1, 0, 1, 2", "−1, 0, 1", "−2, −1, 0, 1", "0, 1, 2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_4_1", topicId: 34, prompt: "Solve: 5 − 3x > −1", options: ["x < 1", "x < 2", "x > 2", "x > −2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_4_2", topicId: 34, prompt: "Solve: 2(x + 3) ≥ 14", options: ["x ≥ 4", "x ≥ 5", "x ≥ 7", "x ≥ 8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_prac_4_3", topicId: 34, prompt: "Solve: (x − 1)/3 < 4", options: ["x < 11", "x < 12", "x < 13", "x < 15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_4_4", topicId: 34, prompt: "Solve: −3x + 6 ≤ 0", options: ["x ≤ −2", "x ≤ 2", "x ≥ 2", "x ≥ 3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ineq_prac_4_5", topicId: 34, prompt: "Solve the combined inequality: 3 < 2x + 1 ≤ 11", options: ["1 < x ≤ 5", "1 < x < 5", "2 < x ≤ 6", "1 ≤ x ≤ 5", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 35 – Speed Distance Time
        35: [
            MathExamQuestion(id: "sdt_prac_1_1", topicId: 35, prompt: "What is the formula for speed?", options: ["Speed = Distance + Time", "Speed = Distance × Time", "Speed = Distance ÷ Time", "Speed = Time ÷ Distance", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_1_2", topicId: 35, prompt: "A car travels 60 km in 1 hour. What is its speed?", options: ["30 km/h", "60 km/h", "120 km/h", "600 km/h", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_1_3", topicId: 35, prompt: "A cyclist rides at 10 km/h for 2 hours. How far do they travel?", options: ["5 km", "12 km", "20 km", "100 km", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_1_4", topicId: 35, prompt: "How long does it take to walk 6 km at 3 km/h?", options: ["1 hour", "2 hours", "3 hours", "18 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_1_5", topicId: 35, prompt: "What unit is speed usually measured in?", options: ["km", "hours", "km/h", "km²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_2_1", topicId: 35, prompt: "A train travels 240 km in 3 hours. What is its average speed?", options: ["60 km/h", "70 km/h", "80 km/h", "90 km/h", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_2_2", topicId: 35, prompt: "A bus travels at 50 km/h for 4 hours. How far does it travel?", options: ["100 km", "150 km", "200 km", "250 km", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_2_3", topicId: 35, prompt: "How long does it take to drive 150 km at 50 km/h?", options: ["2 hours", "3 hours", "4 hours", "5 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_2_4", topicId: 35, prompt: "A runner covers 400 m in 50 seconds. What is their speed?", options: ["4 m/s", "6 m/s", "8 m/s", "10 m/s", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_2_5", topicId: 35, prompt: "Convert 90 minutes to hours.", options: ["0.9 hours", "1.3 hours", "1.5 hours", "9 hours", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_3_1", topicId: 35, prompt: "A car travels at 60 km/h. How far does it travel in 2.5 hours?", options: ["100 km", "120 km", "150 km", "180 km", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_3_2", topicId: 35, prompt: "A plane flies 1800 km at 600 km/h. How long is the flight?", options: ["2 hours", "3 hours", "4 hours", "5 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_3_3", topicId: 35, prompt: "A cyclist travels 45 km in 1.5 hours. What is their average speed?", options: ["20 km/h", "25 km/h", "30 km/h", "35 km/h", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_3_4", topicId: 35, prompt: "Convert 2 hours 30 minutes into hours as a decimal.", options: ["2.3 hours", "2.5 hours", "2.6 hours", "2.8 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_3_5", topicId: 35, prompt: "A car travels 200 km at 80 km/h. How long does it take?", options: ["2 hours", "2.5 hours", "3 hours", "4 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_4_1", topicId: 35, prompt: "Two towns are 360 km apart. A car leaves at 9am at 90 km/h. When does it arrive?", options: ["12:00", "13:00", "14:00", "15:00", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_4_2", topicId: 35, prompt: "Convert 72 km/h to m/s.", options: ["10 m/s", "20 m/s", "36 m/s", "72 m/s", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_4_3", topicId: 35, prompt: "A person walks 3 km at 4 km/h, then 5 km at 5 km/h. What is total time?", options: ["1.5 hours", "1.75 hours", "2 hours", "2.25 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_prac_4_4", topicId: 35, prompt: "A train leaves at 08:00 and arrives at 11:30, travelling 420 km. What is its average speed?", options: ["100 km/h", "110 km/h", "120 km/h", "140 km/h", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_prac_4_5", topicId: 35, prompt: "Car A travels 300 km in 4 hours. Car B travels 280 km in 3.5 hours. Which is faster?", options: ["Car A (75 km/h)", "Car B (80 km/h)", "They are the same speed", "Cannot be determined", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 36 – Area of Triangles & Quadrilaterals
        36: [
            MathExamQuestion(id: "area_prac_1_1", topicId: 36, prompt: "What is the formula for the area of a rectangle?", options: ["l + w", "2(l + w)", "l × w", "l × w × h", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_1_2", topicId: 36, prompt: "Find the area of a rectangle with length 8 cm and width 5 cm.", options: ["13 cm²", "26 cm²", "40 cm²", "80 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_1_3", topicId: 36, prompt: "What is the formula for the area of a triangle?", options: ["base × height", "(base × height)/2", "base + height", "2 × base × height", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_1_4", topicId: 36, prompt: "Find the area of a triangle with base 10 cm and height 6 cm.", options: ["16 cm²", "30 cm²", "60 cm²", "120 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_1_5", topicId: 36, prompt: "A square has side 7 cm. What is its area?", options: ["14 cm²", "28 cm²", "49 cm²", "56 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_2_1", topicId: 36, prompt: "What is the formula for area of a parallelogram?", options: ["base × height", "(base + height)/2", "base × slant height", "2 × base × height", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "area_prac_2_2", topicId: 36, prompt: "Find the area of a parallelogram with base 9 m and height 4 m.", options: ["13 m²", "26 m²", "36 m²", "72 m²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_2_3", topicId: 36, prompt: "What is the formula for the area of a trapezoid?", options: ["(a + b) × h", "(a + b) × h / 2", "a × b × h", "a × h / 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_2_4", topicId: 36, prompt: "Find the area of a trapezoid with parallel sides 6 cm and 10 cm, height 4 cm.", options: ["32 cm²", "40 cm²", "64 cm²", "80 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "area_prac_2_5", topicId: 36, prompt: "A triangle has base 12 cm and height 7 cm. What is its area?", options: ["19 cm²", "42 cm²", "84 cm²", "168 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_3_1", topicId: 36, prompt: "A room is 6 m long and 4.5 m wide. What is its floor area?", options: ["21 m²", "27 m²", "28 m²", "30 m²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_3_2", topicId: 36, prompt: "A trapezoid has parallel sides of 8 m and 14 m and a height of 5 m. What is its area?", options: ["50 m²", "55 m²", "60 m²", "110 m²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_3_3", topicId: 36, prompt: "A right-angled triangle has legs of 9 cm and 12 cm. What is its area?", options: ["54 cm²", "60 cm²", "108 cm²", "216 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "area_prac_3_4", topicId: 36, prompt: "A rectangle has area 72 cm² and width 8 cm. What is its length?", options: ["6 cm", "8 cm", "9 cm", "12 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_3_5", topicId: 36, prompt: "Two identical triangles each have area 15 cm². What is total area of the combined shape?", options: ["15 cm²", "20 cm²", "30 cm²", "45 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_4_1", topicId: 36, prompt: "A composite shape is made of a 10 × 4 rectangle with a triangle on top (base 10, height 3). What is the total area?", options: ["50 cm²", "55 cm²", "60 cm²", "70 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_prac_4_2", topicId: 36, prompt: "A parallelogram has area 54 m² and height 6 m. What is the base?", options: ["6 m", "8 m", "9 m", "12 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_4_3", topicId: 36, prompt: "A trapezoid has area 60 cm² and height 6 cm. The parallel sides sum to:", options: ["10 cm", "12 cm", "20 cm", "24 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_prac_4_4", topicId: 36, prompt: "Find the area of a triangle with base 15 cm and height 8 cm.", options: ["60 cm²", "120 cm²", "45 cm²", "90 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "area_prac_4_5", topicId: 36, prompt: "A lawn is a trapezoid with parallel sides 20 m and 30 m and height 12 m. What is the area?", options: ["240 m²", "300 m²", "360 m²", "600 m²", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 37 – Circles
        37: [
            MathExamQuestion(id: "circ_prac_1_1", topicId: 37, prompt: "What is the radius of a circle?", options: ["The full width across the circle", "The distance from centre to edge", "The distance around the circle", "Half the circumference", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_1_2", topicId: 37, prompt: "If the radius is 5 cm, what is the diameter?", options: ["2.5 cm", "5 cm", "10 cm", "25 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_1_3", topicId: 37, prompt: "What is the approximate value of π?", options: ["2.17", "3.14", "3.41", "31.4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_1_4", topicId: 37, prompt: "What is the formula for circumference using radius?", options: ["C = πr", "C = πr²", "C = 2πr", "C = 2πr²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_1_5", topicId: 37, prompt: "What is the formula for the area of a circle?", options: ["A = 2πr", "A = πr", "A = πr²", "A = 2πr²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_2_1", topicId: 37, prompt: "Find the circumference of a circle with radius 7 cm. (Use π ≈ 3.14)", options: ["21.98 cm", "43.96 cm", "153.86 cm", "87.92 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_2_2", topicId: 37, prompt: "Find the area of a circle with radius 5 cm. (Use π ≈ 3.14)", options: ["15.7 cm²", "31.4 cm²", "78.5 cm²", "157 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_2_3", topicId: 37, prompt: "A circle has diameter 12 cm. What is its radius?", options: ["3 cm", "4 cm", "6 cm", "24 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_2_4", topicId: 37, prompt: "Find the circumference of a circle with diameter 10 cm. (Use π ≈ 3.14)", options: ["15.7 cm", "31.4 cm", "62.8 cm", "314 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_2_5", topicId: 37, prompt: "A circle has radius 3 cm. What is its area? (Use π ≈ 3.14)", options: ["9.42 cm²", "18.84 cm²", "28.26 cm²", "56.52 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_3_1", topicId: 37, prompt: "A wheel has diameter 50 cm. How far does it travel in one full rotation? (Use π ≈ 3.14)", options: ["78.5 cm", "100 cm", "157 cm", "314 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_3_2", topicId: 37, prompt: "Find the area of a circle with diameter 8 cm. (Use π ≈ 3.14)", options: ["25.12 cm²", "50.24 cm²", "100.48 cm²", "200.96 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_3_3", topicId: 37, prompt: "A circle has circumference 62.8 cm. What is its radius? (Use π ≈ 3.14)", options: ["5 cm", "10 cm", "20 cm", "100 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_3_4", topicId: 37, prompt: "A semicircle has diameter 10 cm. What is the area? (Use π ≈ 3.14)", options: ["19.63 cm²", "39.25 cm²", "78.5 cm²", "157 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_3_5", topicId: 37, prompt: "A pizza has radius 15 cm. What is its area? (Use π ≈ 3.14)", options: ["47.1 cm²", "94.2 cm²", "706.5 cm²", "1413 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_prac_4_1", topicId: 37, prompt: "A circle has area 113.04 cm². What is its radius? (Use π ≈ 3.14)", options: ["4 cm", "6 cm", "8 cm", "12 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_4_2", topicId: 37, prompt: "A circular track has radius 100 m. How far is one lap? (Use π ≈ 3.14)", options: ["314 m", "628 m", "942 m", "1256 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_4_3", topicId: 37, prompt: "Find the perimeter of a semicircle with radius 6 cm. (Use π ≈ 3.14, include the diameter)", options: ["18.84 cm", "24.84 cm", "37.68 cm", "48 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_4_4", topicId: 37, prompt: "Two circles have radii 3 cm and 4 cm. What is the combined area? (Use π ≈ 3.14)", options: ["21.98 cm²", "43.96 cm²", "78.5 cm²", "78.5 cm² + 28.26 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_prac_4_5", topicId: 37, prompt: "A circle's area is doubled. By what factor does the radius change?", options: ["×2", "×√2", "×4", "×√4", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 38 – Pythagoras Theorem
        38: [
            MathExamQuestion(id: "pyth_prac_1_1", topicId: 38, prompt: "What does Pythagoras' theorem state?", options: ["a + b = c", "a² + b² = c²", "a × b = c²", "a² − b² = c", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_1_2", topicId: 38, prompt: "In a right-angled triangle, the hypotenuse is:", options: ["The shortest side", "The side opposite the right angle", "Any of the sides", "Adjacent to the right angle", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_1_3", topicId: 38, prompt: "A triangle has legs 3 and 4. What is the hypotenuse?", options: ["5", "6", "7", "√7", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_prac_1_4", topicId: 38, prompt: "If a = 5 and b = 12, what is c?", options: ["11", "13", "15", "17", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_1_5", topicId: 38, prompt: "Does Pythagoras apply to ALL triangles?", options: ["Yes, all triangles", "Only equilateral triangles", "Only right-angled triangles", "Only isosceles triangles", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_2_1", topicId: 38, prompt: "Find c when a = 6 and b = 8.", options: ["10", "12", "14", "100", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_prac_2_2", topicId: 38, prompt: "Find the missing leg when c = 10 and a = 6.", options: ["4", "6", "8", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_2_3", topicId: 38, prompt: "Find c when a = 9 and b = 12.", options: ["13", "14", "15", "21", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_2_4", topicId: 38, prompt: "Which set of numbers is a Pythagorean triple?", options: ["2, 3, 4", "5, 12, 13", "6, 7, 8", "4, 5, 7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_2_5", topicId: 38, prompt: "Find the missing leg when c = 13 and a = 5.", options: ["8", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_3_1", topicId: 38, prompt: "Find c when a = 7 and b = 24. (Give exact value)", options: ["25", "26", "28", "31", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_prac_3_2", topicId: 38, prompt: "A ladder 10 m long leans against a wall. The foot is 6 m from the wall. How high up the wall does it reach?", options: ["6 m", "7 m", "8 m", "9 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_3_3", topicId: 38, prompt: "Find c when a = 8 and b = 15.", options: ["15", "17", "18", "23", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_3_4", topicId: 38, prompt: "A rectangle is 5 cm by 12 cm. What is the length of the diagonal?", options: ["11 cm", "13 cm", "15 cm", "17 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_3_5", topicId: 38, prompt: "Find the missing leg when c = 17 and a = 8.", options: ["9", "13", "15", "√225", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_4_1", topicId: 38, prompt: "Find c when a = 20 and b = 21.", options: ["25", "28", "29", "41", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_prac_4_2", topicId: 38, prompt: "A right triangle has hypotenuse √50 and one leg 5. What is the other leg?", options: ["√5", "5", "√25", "√75", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_4_3", topicId: 38, prompt: "Is a triangle with sides 8, 15, 17 a right-angled triangle?", options: ["Yes", "No", "Only if the angle is acute", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_prac_4_4", topicId: 38, prompt: "A square has diagonal 10 cm. What is the side length? (Answer in simplified surd form)", options: ["5 cm", "5√2 cm", "√50 cm", "√100 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_prac_4_5", topicId: 38, prompt: "Find the distance between the points (0, 0) and (6, 8).", options: ["10", "12", "14", "100", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 39 – Probability
        39: [
            MathExamQuestion(id: "prob_prac_1_1", topicId: 39, prompt: "What is probability measured on?", options: ["0 to 10", "0 to 100", "0 to 1", "−1 to 1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_1_2", topicId: 39, prompt: "A bag has 3 red and 7 blue balls. What is the probability of picking red?", options: ["3/7", "3/10", "7/10", "7/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_1_3", topicId: 39, prompt: "If probability of rain is 0.3, what is probability of no rain?", options: ["0.3", "0.7", "3", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_1_4", topicId: 39, prompt: "A fair coin is flipped. What is the probability of getting heads?", options: ["1/4", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_1_5", topicId: 39, prompt: "An event is certain. Its probability is:", options: ["0", "0.5", "1", "Cannot be determined", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_2_1", topicId: 39, prompt: "A die is rolled. What is the probability of rolling a 4?", options: ["1/4", "1/6", "1/3", "4/6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_2_2", topicId: 39, prompt: "What is the probability of rolling an even number on a standard die?", options: ["1/6", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_2_3", topicId: 39, prompt: "A bag has 4 green, 3 yellow, and 3 red balls. What is the probability of picking yellow?", options: ["3/7", "3/10", "4/10", "7/10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_2_4", topicId: 39, prompt: "The probabilities of three outcomes are 0.2, 0.5, and x. What is x?", options: ["0.2", "0.3", "0.5", "0.7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_2_5", topicId: 39, prompt: "A card is drawn from a standard deck of 52. What is the probability it is an ace?", options: ["1/52", "1/26", "1/13", "1/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_3_1", topicId: 39, prompt: "What is the probability of NOT rolling a 6 on a die?", options: ["1/6", "5/6", "1/5", "6/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_3_2", topicId: 39, prompt: "If P(A) = 0.4, what is P(not A)?", options: ["0.4", "0.6", "0.5", "1.4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_3_3", topicId: 39, prompt: "A box has 5 black and x white balls. The probability of black is 1/3. What is x?", options: ["5", "10", "15", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_prac_3_4", topicId: 39, prompt: "A spinner has 4 equal sections numbered 1–4. What is P(even)?", options: ["1/4", "1/3", "1/2", "3/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_3_5", topicId: 39, prompt: "50 students were surveyed. 20 like football. What is the relative frequency of liking football?", options: ["0.2", "0.3", "0.4", "0.5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_4_1", topicId: 39, prompt: "Two coins are flipped. What is the probability of both being heads?", options: ["1/4", "1/3", "1/2", "3/4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prob_prac_4_2", topicId: 39, prompt: "A bag has 6 balls. 2 are red. What is P(not red)?", options: ["1/6", "1/3", "2/3", "3/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_4_3", topicId: 39, prompt: "A fair die is rolled twice. What is P(6, 6)?", options: ["1/6", "1/12", "1/36", "1/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_4_4", topicId: 39, prompt: "P(A) = 0.3 and P(B) = 0.5, A and B are mutually exclusive. What is P(A or B)?", options: ["0.15", "0.5", "0.8", "1.5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_prac_4_5", topicId: 39, prompt: "A student guesses randomly on a 4-option multiple choice question. What is P(correct)?", options: ["1/2", "1/3", "1/4", "1/5", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 40 – Statistics
        40: [
            MathExamQuestion(id: "stat_prac_1_1", topicId: 40, prompt: "What is the mode?", options: ["The middle value", "The most common value", "The average", "The highest minus lowest", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_1_2", topicId: 40, prompt: "What is the median?", options: ["The most common value", "The average", "The middle value when sorted", "The highest value", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_1_3", topicId: 40, prompt: "What is the mean of 4, 6, 8, 10?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_1_4", topicId: 40, prompt: "What is the range of 3, 7, 12, 5, 9?", options: ["5", "7", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_1_5", topicId: 40, prompt: "Find the mode of: 2, 4, 4, 5, 6, 6, 6, 7", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_2_1", topicId: 40, prompt: "Find the median of: 3, 5, 7, 9, 11", options: ["5", "7", "9", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_2_2", topicId: 40, prompt: "Find the mean of: 10, 20, 30, 40", options: ["20", "25", "30", "40", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_2_3", topicId: 40, prompt: "Find the median of: 1, 3, 5, 7 (even number of values)", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_2_4", topicId: 40, prompt: "Find the range of: 15, 22, 8, 31, 19", options: ["14", "19", "23", "31", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_2_5", topicId: 40, prompt: "5 students scored: 6, 8, 7, 9, 10. What is the mean?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_3_1", topicId: 40, prompt: "The mean of 5 numbers is 12. What is the sum of all 5 numbers?", options: ["12", "17", "60", "120", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_3_2", topicId: 40, prompt: "Data: 3, 7, 7, 9, 10, 12. Find the median.", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_3_3", topicId: 40, prompt: "A data set has mean 8. A new value of 8 is added. What happens to the mean?", options: ["Increases", "Decreases", "Stays the same", "Doubles", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_3_4", topicId: 40, prompt: "Find the mean of: 4.5, 6.5, 7, 8, 9", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_3_5", topicId: 40, prompt: "A bimodal dataset is one that has:", options: ["No mode", "One mode", "Two modes", "Three modes", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_4_1", topicId: 40, prompt: "The mean of 4 tests is 75. If a 5th test score is 85, what is the new mean?", options: ["75", "77", "78", "80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_prac_4_2", topicId: 40, prompt: "Which measure is most affected by an extreme outlier?", options: ["Mode", "Median", "Mean", "Range", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_4_3", topicId: 40, prompt: "Data: 2, 5, 7, 9, 12, 15, 18. Find the interquartile range (Q3 − Q1).", options: ["6", "8", "10", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_prac_4_4", topicId: 40, prompt: "A class average (mean) is 70 with 30 students. Another class has mean 80 with 20 students. What is the combined mean?", options: ["74", "75", "76", "78", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "stat_prac_4_5", topicId: 40, prompt: "Which measure of average best represents a dataset with a very large outlier?", options: ["Mean", "Median", "Mode", "Range", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 41 – Linear Equations & Graphs
        41: [
            MathExamQuestion(id: "lin_prac_1_1", topicId: 41, prompt: "What is the gradient in y = 3x + 2?", options: ["2", "3", "5", "x", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_1_2", topicId: 41, prompt: "What is the y-intercept of y = 4x − 5?", options: ["−5", "4", "5", "−4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_prac_1_3", topicId: 41, prompt: "What does the gradient tell you about a line?", options: ["Where it crosses the x-axis", "How steep it is", "The y-intercept", "The midpoint", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_1_4", topicId: 41, prompt: "Which equation represents a horizontal line?", options: ["x = 4", "y = 4", "y = 4x", "y = x + 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_1_5", topicId: 41, prompt: "A line has equation y = 2x + 1. What is y when x = 3?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lin_prac_2_1", topicId: 41, prompt: "What is the gradient of a line through (0, 0) and (4, 8)?", options: ["0.5", "2", "4", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_2_2", topicId: 41, prompt: "Which of these lines has a negative gradient?", options: ["y = 3x + 2", "y = x + 5", "y = −2x + 1", "y = 2x − 3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lin_prac_2_3", topicId: 41, prompt: "Find the gradient of the line through (1, 3) and (3, 7).", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_2_4", topicId: 41, prompt: "What is the equation of a line with gradient 2 and y-intercept 5?", options: ["y = 2x − 5", "y = 5x + 2", "y = 2x + 5", "y = 2 + 5x", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lin_prac_2_5", topicId: 41, prompt: "Do two parallel lines have the same gradient?", options: ["Yes always", "No, never", "Only if they cross", "Only if both pass through origin", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_prac_3_1", topicId: 41, prompt: "Find the equation of the line through (0, 3) with gradient 4.", options: ["y = 3x + 4", "y = 4x", "y = 4x + 3", "y = 4 + 3x", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lin_prac_3_2", topicId: 41, prompt: "Rearrange 2y = 6x + 10 into y = mx + c form.", options: ["y = 6x + 10", "y = 3x + 5", "y = 3x + 10", "y = 6x + 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_3_3", topicId: 41, prompt: "Two lines: y = 3x + 1 and y = 3x − 4. Are they parallel?", options: ["Yes", "No", "Only if x > 0", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_prac_3_4", topicId: 41, prompt: "Find the gradient of the line through (2, 5) and (6, 13).", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_3_5", topicId: 41, prompt: "A line passes through (0, −2) and (5, 8). What is its equation?", options: ["y = 2x − 2", "y = 2x + 2", "y = x − 2", "y = 5x − 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_prac_4_1", topicId: 41, prompt: "Where does y = 3x − 6 cross the x-axis?", options: ["x = −6", "x = 2", "x = 3", "x = 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_4_2", topicId: 41, prompt: "Find the equation of the line through (2, 7) with gradient 3.", options: ["y = 3x + 1", "y = 3x + 7", "y = 7x + 3", "y = 3x − 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_prac_4_3", topicId: 41, prompt: "A line is perpendicular to y = 2x + 1. What is its gradient?", options: ["2", "−2", "1/2", "−1/2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "lin_prac_4_4", topicId: 41, prompt: "At what point do y = x + 1 and y = 3x − 3 intersect?", options: ["(1, 2)", "(2, 3)", "(3, 4)", "(4, 5)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_prac_4_5", topicId: 41, prompt: "The line y = mx + 4 passes through (2, 10). What is m?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 42 – Simultaneous Equations
        42: [
            MathExamQuestion(id: "sim_prac_1_1", topicId: 42, prompt: "What does it mean to 'solve simultaneous equations'?", options: ["Simplify one equation", "Find values satisfying both equations", "Expand both equations", "Find the gradient", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_1_2", topicId: 42, prompt: "Solve: x + y = 5 and x − y = 1. What is x?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_1_3", topicId: 42, prompt: "Using the answers from above (x=3), what is y?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_1_4", topicId: 42, prompt: "Solve by substitution: y = x + 2 and y = 2x − 1. What is x?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_1_5", topicId: 42, prompt: "Two lines y = 2x + 1 and y = x + 4 intersect at x = :", options: ["1", "2", "3", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_2_1", topicId: 42, prompt: "Solve: 2x + y = 7 and x + y = 4. What is x?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_2_2", topicId: 42, prompt: "Solve: 3x + 2y = 12 and x = 2. What is y?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_2_3", topicId: 42, prompt: "Solve: 2x + 3y = 13 and 2x + y = 7. What is y?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_2_4", topicId: 42, prompt: "Solve: x + 2y = 8 and x = 2. What is y?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_2_5", topicId: 42, prompt: "For the solution (3, 5), which pair of equations is satisfied?", options: ["x + y = 7; x − y = 2", "x + y = 8; x − y = 2", "x + y = 8; 2x − y = 1", "x + y = 8; x + y = 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_3_1", topicId: 42, prompt: "Solve: 3x + y = 11 and 2x − y = 4. What is x?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_3_2", topicId: 42, prompt: "Solve: 4x + 2y = 14 and 2x + 2y = 10. What is x?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_3_3", topicId: 42, prompt: "Solve by substitution: y = 2x and 3x + y = 15. What is x?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_3_4", topicId: 42, prompt: "Solve: 5x − 3y = 7 and 2x + 3y = 14. What is x?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_3_5", topicId: 42, prompt: "Solve: x + y = 6 and xy = 8 (trial). One pair of values is (x, y) =", options: ["(2, 4)", "(4, 2)", "Both are valid", "Neither works", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_4_1", topicId: 42, prompt: "Solve: 3x + 4y = 24 and 6x + 4y = 36. What is x?", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sim_prac_4_2", topicId: 42, prompt: "Solve: 2x + 5y = 16 and 2x + 3y = 10. What is y?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_4_3", topicId: 42, prompt: "Two numbers add to 20 and differ by 4. What is the larger number?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sim_prac_4_4", topicId: 42, prompt: "Solve: 3x − 2y = 1 and x + y = 7. What is x?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_prac_4_5", topicId: 42, prompt: "Two coffees and one cake costs £7. One coffee and two cakes costs £8. How much is one coffee?", options: ["£1", "£2", "£3", "£4", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 43 – Expanding Brackets
        43: [
            MathExamQuestion(id: "exp_prac_1_1", topicId: 43, prompt: "Expand: 3(x + 4)", options: ["3x + 4", "3x + 7", "3x + 12", "x + 12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "exp_prac_1_2", topicId: 43, prompt: "Expand: 2(5 − y)", options: ["5 − 2y", "10 − 2y", "10 − y", "10 + 2y", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_prac_1_3", topicId: 43, prompt: "Expand: −3(x + 2)", options: ["−3x + 2", "−3x − 6", "3x + 6", "−3x + 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_prac_1_4", topicId: 43, prompt: "Expand: 4(2x − 3)", options: ["8x − 3", "6x − 12", "8x − 12", "8x + 12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "exp_prac_1_5", topicId: 43, prompt: "Expand and simplify: 2(x + 3) + 3(x + 1)", options: ["5x + 9", "5x + 4", "5x + 7", "6x + 9", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_2_1", topicId: 43, prompt: "Expand: (x + 2)(x + 3)", options: ["x² + 5x + 5", "x² + 5x + 6", "x² + 6x + 6", "x² + 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_prac_2_2", topicId: 43, prompt: "Expand: (x + 4)(x − 1)", options: ["x² + 3x − 4", "x² − 3x − 4", "x² + 3x + 4", "x² − 4x + 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_2_3", topicId: 43, prompt: "Expand: (x − 3)(x − 5)", options: ["x² − 8x + 15", "x² + 8x − 15", "x² − 8x − 15", "x² + 8x + 15", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_2_4", topicId: 43, prompt: "Expand: (2x + 1)(x + 3)", options: ["2x² + 7x + 3", "2x² + 6x + 3", "2x² + 5x + 3", "2x² + 7x + 6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_2_5", topicId: 43, prompt: "Expand: (x + 5)²", options: ["x² + 25", "x² + 5x + 25", "x² + 10x + 25", "x² + 10x + 5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "exp_prac_3_1", topicId: 43, prompt: "Expand: (3x + 2)(2x − 1)", options: ["6x² + x − 2", "6x² − x − 2", "5x² + x − 2", "6x² + x + 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_3_2", topicId: 43, prompt: "Expand: (x − 4)²", options: ["x² − 8x + 16", "x² + 8x + 16", "x² − 8x − 16", "x² − 4x + 16", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_3_3", topicId: 43, prompt: "Expand and simplify: (x + 3)(x − 3)", options: ["x² − 9", "x² + 9", "x² − 3", "x² − 6x + 9", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_3_4", topicId: 43, prompt: "Expand: (2x − 3)(2x + 3)", options: ["4x² − 9", "4x² + 9", "4x² − 12x + 9", "4x² + 12x − 9", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_3_5", topicId: 43, prompt: "Expand and simplify: (x + 1)² − (x − 1)²", options: ["0", "2x", "4x", "2x²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "exp_prac_4_1", topicId: 43, prompt: "Expand: (2x + 3)²", options: ["4x² + 9", "4x² + 12x + 9", "4x² + 6x + 9", "4x² + 12x + 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_prac_4_2", topicId: 43, prompt: "Expand: (x + 2)(x² + 3x − 1)", options: ["x³ + 5x² + 5x − 2", "x³ + 3x² + 5x − 2", "x³ + 5x² − 5x − 2", "x³ + 5x² + 5x + 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_4_3", topicId: 43, prompt: "Simplify: (x + 3)(x − 3) + (x + 1)(x − 1)", options: ["2x² − 10", "2x² + 10", "2x² − 8", "2x²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_4_4", topicId: 43, prompt: "Expand: −(2x − 1)(3x + 4)", options: ["−6x² − 5x + 4", "6x² + 5x − 4", "−6x² + 5x − 4", "−6x² + 11x + 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_prac_4_5", topicId: 43, prompt: "Expand and simplify: (x + 4)² − 2(x + 5)", options: ["x² + 6x + 6", "x² + 10x + 6", "x² + 6x + 16", "x² + 8x + 6", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 44 – Factorising
        44: [
            MathExamQuestion(id: "fac_prac_1_1", topicId: 44, prompt: "Factorise: 6x + 9", options: ["2(3x + 4)", "3(2x + 3)", "6(x + 3)", "9(x + 1)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fac_prac_1_2", topicId: 44, prompt: "Factorise: 4x − 8", options: ["2(2x − 4)", "4(x − 2)", "4(x − 8)", "2(4x − 4)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fac_prac_1_3", topicId: 44, prompt: "Factorise: x² + 5x", options: ["x(x + 5)", "5(x + x)", "x(5 + x²)", "x + 5x", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_1_4", topicId: 44, prompt: "Factorise: 12a² − 8a", options: ["4a(3a − 2)", "4(3a² − 2a)", "8a(a − 1)", "12a(a − 1)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_1_5", topicId: 44, prompt: "Factorise: 15x + 10y − 5", options: ["5(3x + 2y − 1)", "5(3x + 2y)", "5(3x − 2y − 1)", "15(x + y − 1)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_2_1", topicId: 44, prompt: "Factorise: x² − 9", options: ["(x − 3)²", "(x + 3)²", "(x + 3)(x − 3)", "(x − 9)(x + 1)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fac_prac_2_2", topicId: 44, prompt: "Factorise: 4x² − 25", options: ["(2x − 5)(2x + 5)", "(4x − 5)(x + 5)", "(2x − 5)²", "(4x + 5)(x − 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_2_3", topicId: 44, prompt: "Factorise: x² + 6x + 8", options: ["(x + 2)(x + 4)", "(x + 1)(x + 8)", "(x + 3)(x + 3)", "(x + 6)(x + 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_2_4", topicId: 44, prompt: "Factorise: x² − 7x + 12", options: ["(x − 3)(x − 4)", "(x + 3)(x + 4)", "(x − 2)(x − 6)", "(x − 6)(x − 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_2_5", topicId: 44, prompt: "Factorise: x² + 2x − 15", options: ["(x + 5)(x − 3)", "(x − 5)(x + 3)", "(x + 3)(x − 5)", "(x − 3)(x + 5)", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "fac_prac_3_1", topicId: 44, prompt: "Factorise: 2x² + 7x + 3", options: ["(2x + 1)(x + 3)", "(2x + 3)(x + 1)", "(x + 3)(2x + 3)", "(x + 1)(2x + 7)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_3_2", topicId: 44, prompt: "Factorise: 3x² − 5x − 2", options: ["(3x + 1)(x − 2)", "(3x − 1)(x + 2)", "(x + 2)(3x − 1)", "(3x + 2)(x − 1)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_3_3", topicId: 44, prompt: "Factorise: x² − 16", options: ["(x − 4)²", "(x + 4)²", "(x − 4)(x + 4)", "(x − 2)(x + 8)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fac_prac_3_4", topicId: 44, prompt: "Factorise: 5x² + 15x", options: ["5(x² + 3)", "5x(x + 3)", "15x(x + 1)", "5(x + 3)²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fac_prac_3_5", topicId: 44, prompt: "Factorise: x² − 2x − 8", options: ["(x − 4)(x + 2)", "(x + 4)(x − 2)", "(x − 8)(x + 1)", "(x − 2)(x + 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_4_1", topicId: 44, prompt: "Factorise fully: 4x² − 36", options: ["4(x² − 9)", "4(x − 3)(x + 3)", "(2x − 6)(2x + 6)", "2(2x − 6)(x + 3)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fac_prac_4_2", topicId: 44, prompt: "Factorise: 6x² + x − 2", options: ["(2x − 1)(3x + 2)", "(2x + 1)(3x − 2)", "(3x + 2)(2x − 1)", "(6x − 1)(x + 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_4_3", topicId: 44, prompt: "Factorise: x³ + x² − 6x", options: ["x(x + 3)(x − 2)", "x(x − 3)(x + 2)", "x(x + 2)(x − 3)", "x²(x − 6)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_4_4", topicId: 44, prompt: "Factorise: 9x² − 6x + 1", options: ["(3x − 1)²", "(9x − 1)(x − 1)", "(3x + 1)²", "(3x − 1)(3x + 1)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_prac_4_5", topicId: 44, prompt: "Factorise: 2x³ − 8x", options: ["2x(x − 2)(x + 2)", "2(x³ − 4x)", "2x(x − 4)", "2x²(x − 4)", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 45 – Quadratic Equations
        45: [
            MathExamQuestion(id: "quad_prac_1_1", topicId: 45, prompt: "A quadratic equation has degree:", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_1_2", topicId: 45, prompt: "Solve: x² = 9", options: ["x = 3 only", "x = ±3", "x = 9", "x = ±9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_1_3", topicId: 45, prompt: "Solve by factorising: x² + 5x + 6 = 0", options: ["x = 2, x = 3", "x = −2, x = −3", "x = 2, x = −3", "x = −2, x = 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_1_4", topicId: 45, prompt: "Solve: x² − 4 = 0", options: ["x = 4 only", "x = 2 only", "x = ±2", "x = ±4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "quad_prac_1_5", topicId: 45, prompt: "Solve: x² − 7x + 12 = 0", options: ["x = 3, x = 4", "x = −3, x = −4", "x = 3, x = −4", "x = −3, x = 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_2_1", topicId: 45, prompt: "What is the quadratic formula?", options: ["x = (−b ± √(b² − 4ac)) / 2a", "x = (b ± √(b² + 4ac)) / 2a", "x = −b / 2a", "x = (−b ± √(b + 4ac)) / 2a", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_2_2", topicId: 45, prompt: "For 2x² − 3x − 2 = 0, what are a, b, c?", options: ["a=2, b=3, c=2", "a=2, b=−3, c=−2", "a=2, b=3, c=−2", "a=−2, b=3, c=2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_2_3", topicId: 45, prompt: "Solve x² + x − 6 = 0 by factorising.", options: ["x = 2, x = −3", "x = −2, x = 3", "x = 3, x = 2", "x = −3, x = −2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_2_4", topicId: 45, prompt: "The discriminant b² − 4ac tells you:", options: ["The gradient", "Number and type of solutions", "The y-intercept", "The vertex", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_2_5", topicId: 45, prompt: "If b² − 4ac = 0, how many solutions does the quadratic have?", options: ["0", "1", "2", "Infinite", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_prac_3_1", topicId: 45, prompt: "Use the formula to solve x² − 5x + 6 = 0. Solutions are:", options: ["x = 2, x = 3", "x = −2, x = −3", "x = 1, x = 6", "x = 5, x = 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_3_2", topicId: 45, prompt: "Solve 2x² + 5x + 2 = 0 by factorising.", options: ["x = −1/2, x = −2", "x = 1/2, x = 2", "x = −2, x = 2", "x = 1/2, x = −2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_3_3", topicId: 45, prompt: "Solve x² + 6x + 9 = 0.", options: ["x = −3 (repeated)", "x = 3 (repeated)", "x = 3, x = −3", "x = −3, x = 9", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_3_4", topicId: 45, prompt: "Solve 3x² − 12 = 0.", options: ["x = ±2", "x = ±4", "x = 2", "x = 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_3_5", topicId: 45, prompt: "If x² − 10x + 25 = 0, what is x?", options: ["x = 5 (repeated)", "x = −5 (repeated)", "x = 5, x = −5", "x = 10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_4_1", topicId: 45, prompt: "Solve x² − x − 12 = 0.", options: ["x = 4, x = −3", "x = −4, x = 3", "x = 4, x = 3", "x = −4, x = −3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_4_2", topicId: 45, prompt: "Use the formula to solve x² + 4x + 1 = 0. Which is correct?", options: ["x = −2 ± √3", "x = 4 ± √3", "x = −2 ± √5", "x = 2 ± √3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_4_3", topicId: 45, prompt: "Solve 2x² − 7x + 3 = 0.", options: ["x = 3, x = 1/2", "x = −3, x = 1/2", "x = 3, x = −1/2", "x = 1, x = 3/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_prac_4_4", topicId: 45, prompt: "For x² + 2x + 5 = 0, the discriminant is −16. What does this mean?", options: ["Two real solutions", "One repeated solution", "No real solutions", "Solutions are irrational", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "quad_prac_4_5", topicId: 45, prompt: "Solve 6x² + 5x − 6 = 0.", options: ["x = 2/3, x = −3/2", "x = −2/3, x = 3/2", "x = 3/2, x = −2/3", "x = 6/5, x = −1", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 46 – Powers & Indices
        46: [
            MathExamQuestion(id: "pow_prac_1_1", topicId: 46, prompt: "What does 2³ mean?", options: ["2 × 3", "2 + 2 + 2", "2 × 2 × 2", "3 × 3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_prac_1_2", topicId: 46, prompt: "Evaluate: 3²", options: ["6", "8", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_prac_1_3", topicId: 46, prompt: "What is x⁰ equal to (x ≠ 0)?", options: ["0", "1", "x", "Undefined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_1_4", topicId: 46, prompt: "Simplify: x³ × x⁴", options: ["x⁷", "x¹²", "2x⁷", "x⁷⁺⁴", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_prac_1_5", topicId: 46, prompt: "Simplify: x⁶ ÷ x²", options: ["x³", "x⁴", "x⁸", "x¹²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_2_1", topicId: 46, prompt: "Simplify: (x³)²", options: ["x⁵", "x⁶", "2x³", "x⁹", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_2_2", topicId: 46, prompt: "What is 2⁻² equal to?", options: ["−4", "−1/4", "1/4", "1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_prac_2_3", topicId: 46, prompt: "Simplify: a⁵ × a³ ÷ a²", options: ["a⁶", "a⁸", "a¹⁰", "a²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_prac_2_4", topicId: 46, prompt: "Evaluate: 4^(1/2)", options: ["1", "2", "8", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_2_5", topicId: 46, prompt: "What is 27^(1/3)?", options: ["3", "9", "81", "√27", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_prac_3_1", topicId: 46, prompt: "Simplify: (2x²)³", options: ["6x⁵", "8x⁶", "6x⁶", "8x⁵", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_3_2", topicId: 46, prompt: "Evaluate: 8^(2/3)", options: ["2", "4", "16", "24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_3_3", topicId: 46, prompt: "Simplify: (3a²b)²", options: ["6a²b²", "9a²b²", "9a⁴b²", "6a⁴b²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_prac_3_4", topicId: 46, prompt: "What is x^(−3) equal to?", options: ["−x³", "x³", "1/x³", "−1/x³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_prac_3_5", topicId: 46, prompt: "Simplify: 2⁴ × 2³ ÷ 2⁵", options: ["2", "4", "8", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_4_1", topicId: 46, prompt: "Solve: 2^x = 32", options: ["x = 4", "x = 5", "x = 6", "x = 16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_4_2", topicId: 46, prompt: "Simplify: (x^(1/2))⁴", options: ["x", "x²", "x⁴", "x^(1/8)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_4_3", topicId: 46, prompt: "Evaluate: 16^(3/4)", options: ["4", "8", "16", "64", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_prac_4_4", topicId: 46, prompt: "Simplify: (4x²y³)^(1/2)", options: ["2xy^(3/2)", "2x²y³", "4xy^(3/2)", "2xy", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_prac_4_5", topicId: 46, prompt: "Solve: 3^(x+1) = 27", options: ["x = 1", "x = 2", "x = 3", "x = 4", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 47 – Standard Form
        47: [
            MathExamQuestion(id: "std_prac_1_1", topicId: 47, prompt: "What is standard form (scientific notation)?", options: ["A × 10^n where 1 ≤ A < 10", "A × 10^n where A can be any number", "A + 10^n", "A/10^n", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_1_2", topicId: 47, prompt: "Write 4500 in standard form.", options: ["45 × 10²", "4.5 × 10³", "0.45 × 10⁴", "4500 × 10⁰", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_1_3", topicId: 47, prompt: "Write 0.0036 in standard form.", options: ["3.6 × 10²", "3.6 × 10⁻³", "36 × 10⁻⁴", "0.36 × 10⁻²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_1_4", topicId: 47, prompt: "Convert 7.2 × 10⁴ to an ordinary number.", options: ["720", "7200", "72000", "720000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "std_prac_1_5", topicId: 47, prompt: "Convert 5.1 × 10⁻³ to an ordinary number.", options: ["0.0051", "0.051", "0.51", "5100", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_2_1", topicId: 47, prompt: "Write 0.00000285 in standard form.", options: ["2.85 × 10⁻⁷", "2.85 × 10⁻⁶", "2.85 × 10⁶", "28.5 × 10⁻⁷", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_2_2", topicId: 47, prompt: "Calculate: (3 × 10⁴) × (2 × 10³)", options: ["6 × 10⁷", "6 × 10¹²", "5 × 10⁷", "6 × 10¹", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_2_3", topicId: 47, prompt: "Calculate: (8 × 10⁶) ÷ (4 × 10²)", options: ["2 × 10³", "2 × 10⁴", "4 × 10³", "2 × 10⁸", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_2_4", topicId: 47, prompt: "Write 93,000,000 in standard form.", options: ["9.3 × 10⁶", "9.3 × 10⁷", "9.3 × 10⁸", "93 × 10⁶", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_2_5", topicId: 47, prompt: "Which is the largest: 3.1 × 10³, 9.9 × 10², or 2.5 × 10⁴?", options: ["3.1 × 10³", "9.9 × 10²", "2.5 × 10⁴", "They are equal", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "std_prac_3_1", topicId: 47, prompt: "Add: (3.4 × 10⁵) + (2.1 × 10⁵)", options: ["5.5 × 10⁵", "5.5 × 10¹⁰", "3.61 × 10⁵", "5.5 × 10⁶", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_3_2", topicId: 47, prompt: "Calculate: (5 × 10⁻³) × (6 × 10⁵)", options: ["3 × 10²", "3 × 10³", "11 × 10²", "30 × 10²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_3_3", topicId: 47, prompt: "A red blood cell is 8 × 10⁻⁶ m wide. How wide are 1000 cells in a row?", options: ["8 × 10⁻³ m", "8 × 10⁻² m", "8 × 10⁻⁹ m", "8 × 10³ m", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_3_4", topicId: 47, prompt: "Subtract: (7 × 10⁴) − (3 × 10⁴)", options: ["4 × 10⁰", "4 × 10⁴", "4 × 10⁸", "10 × 10⁴", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_3_5", topicId: 47, prompt: "Write 1 billion (1,000,000,000) in standard form.", options: ["1 × 10⁸", "1 × 10⁹", "1 × 10¹⁰", "10 × 10⁸", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_4_1", topicId: 47, prompt: "Calculate: (2.4 × 10⁸) ÷ (6 × 10³)", options: ["4 × 10⁴", "4 × 10⁵", "0.4 × 10⁵", "4 × 10¹¹", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_prac_4_2", topicId: 47, prompt: "The mass of a proton is 1.67 × 10⁻²⁷ kg. The mass of an electron is 9.11 × 10⁻³¹ kg. How many times heavier is a proton?", options: ["~183", "~1830", "~18300", "~183000", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_4_3", topicId: 47, prompt: "Calculate: (3 × 10⁴)²", options: ["6 × 10⁸", "9 × 10⁸", "9 × 10⁶", "9 × 10⁷", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_4_4", topicId: 47, prompt: "Add: (4.5 × 10⁶) + (5 × 10⁵). Answer in standard form.", options: ["4.55 × 10⁶", "5 × 10⁶", "9.5 × 10⁶", "9.5 × 10¹¹", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_prac_4_5", topicId: 47, prompt: "Light travels at 3 × 10⁸ m/s. How far in 1 minute?", options: ["1.8 × 10¹⁰ m", "3 × 10¹⁰ m", "1.8 × 10¹¹ m", "3 × 10¹¹ m", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 48 – Surds
        48: [
            MathExamQuestion(id: "surd_prac_1_1", topicId: 48, prompt: "What is a surd?", options: ["Any square root", "An irrational root that can't be simplified to a whole number", "A fraction", "A negative number", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "surd_prac_1_2", topicId: 48, prompt: "Simplify: √12", options: ["2√3", "3√2", "4√3", "√6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_1_3", topicId: 48, prompt: "Simplify: √50", options: ["5√2", "25√2", "10√5", "2√25", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_1_4", topicId: 48, prompt: "Simplify: √8", options: ["2√2", "4√2", "2√4", "√4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_1_5", topicId: 48, prompt: "Is √16 a surd?", options: ["Yes, always", "No, it simplifies to 4", "Only if in a fraction", "Yes, because 16 is large", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "surd_prac_2_1", topicId: 48, prompt: "Simplify: 3√2 × 4√2", options: ["12√4", "24", "7√2", "12√2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "surd_prac_2_2", topicId: 48, prompt: "Simplify: √18 + √8", options: ["√26", "5√2", "6√2", "√26 + 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "surd_prac_2_3", topicId: 48, prompt: "Rationalise the denominator: 1/√2", options: ["√2/2", "2/√2", "1/2", "√2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_2_4", topicId: 48, prompt: "Simplify: √75", options: ["5√3", "25√3", "15√5", "3√25", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_2_5", topicId: 48, prompt: "Simplify: 2√3 + 5√3", options: ["7√3", "7√6", "10√3", "10√6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_3_1", topicId: 48, prompt: "Rationalise: 3/√5", options: ["3√5/5", "3√5", "√5/3", "15/√5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_3_2", topicId: 48, prompt: "Expand: (√3 + 1)²", options: ["4 + 2√3", "3 + 1", "4 + √3", "6 + 2√3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_3_3", topicId: 48, prompt: "Simplify: √48 − √12", options: ["2√3", "√36", "4√3", "√60", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_3_4", topicId: 48, prompt: "Simplify: (2 + √3)(2 − √3)", options: ["1", "4 − 3", "4 − √3", "4 + 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_3_5", topicId: 48, prompt: "Rationalise: 6/(2 + √2)", options: ["(12 − 6√2)/2", "3(2 − √2)", "6(2 − √2)/2", "Both b and c are correct", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "surd_prac_4_1", topicId: 48, prompt: "Simplify: √(18/2)", options: ["3", "√9", "3 only", "Both a and b are the same", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "surd_prac_4_2", topicId: 48, prompt: "Express 5/( √7 − 2) with a rational denominator.", options: ["5(√7 + 2)/3", "5(√7 − 2)/3", "(√7 + 2)", "5/(√7 + 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_4_3", topicId: 48, prompt: "Simplify: (√5 + √3)(√5 − √3)", options: ["2", "8", "√2", "2√5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_prac_4_4", topicId: 48, prompt: "Simplify: √(50) ÷ √(2)", options: ["5", "√25", "5√2", "Both a and b", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "surd_prac_4_5", topicId: 48, prompt: "Rationalise and simplify: 4/(3 − √5)", options: ["(12 + 4√5)/4", "3 + √5", "4(3 + √5)/4", "Both a and c simplify to 3 + √5", "I don't know / Wasn't taught"], correctIndex: 3),
        ],

        // MARK: Topic 49 – Trigonometry Basics
        49: [
            MathExamQuestion(id: "trig_prac_1_1", topicId: 49, prompt: "In a right triangle, what is sin(θ)?", options: ["adjacent/hypotenuse", "opposite/hypotenuse", "opposite/adjacent", "hypotenuse/adjacent", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_1_2", topicId: 49, prompt: "What is cos(θ)?", options: ["opposite/hypotenuse", "opposite/adjacent", "adjacent/hypotenuse", "hypotenuse/opposite", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_1_3", topicId: 49, prompt: "What is tan(θ)?", options: ["adjacent/opposite", "opposite/adjacent", "opposite/hypotenuse", "adjacent/hypotenuse", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_1_4", topicId: 49, prompt: "Which mnemonic helps remember SOH CAH TOA?", options: ["Some Old Hippos Can Always Have Their Own Areas", "Sine Opposite Hypotenuse Cosine Adjacent Hypotenuse Tangent Opposite Adjacent", "Both are valid", "Neither is standard", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_1_5", topicId: 49, prompt: "In a right triangle with hypotenuse 10 and opposite side 6, what is sin(θ)?", options: ["0.4", "0.6", "0.75", "0.8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_2_1", topicId: 49, prompt: "Find x: right triangle, angle 30°, hypotenuse 10. Opposite = ?", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_2_2", topicId: 49, prompt: "Find adjacent side: angle 45°, hypotenuse 8. (cos 45° ≈ 0.707)", options: ["4.0", "5.66", "6.0", "7.07", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_2_3", topicId: 49, prompt: "tan(θ) = 1 when θ = ?", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_prac_2_4", topicId: 49, prompt: "Find the hypotenuse if opposite = 5 and angle = 30°. (sin 30° = 0.5)", options: ["5", "8", "10", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_2_5", topicId: 49, prompt: "Which ratio uses opposite and adjacent?", options: ["sin", "cos", "tan", "All of the above", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_3_1", topicId: 49, prompt: "Find angle θ if sin(θ) = 0.5.", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trig_prac_3_2", topicId: 49, prompt: "Find angle if adjacent = 6 and hypotenuse = 12.", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_3_3", topicId: 49, prompt: "Find the opposite side: angle 60°, adjacent = 5. (tan 60° = √3 ≈ 1.73)", options: ["5.0", "7.5", "8.66", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_3_4", topicId: 49, prompt: "cos(0°) = ?", options: ["0", "0.5", "1", "√2/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_3_5", topicId: 49, prompt: "Find the angle θ if tan(θ) = √3.", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_4_1", topicId: 49, prompt: "A ladder 5 m long leans at 60° to the ground. How high up the wall does it reach? (sin 60° ≈ 0.866)", options: ["3 m", "4 m", "4.33 m", "5 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_4_2", topicId: 49, prompt: "Angle of elevation to a building top is 45° from 30 m away. How tall is the building? (tan 45° = 1)", options: ["20 m", "25 m", "30 m", "45 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_prac_4_3", topicId: 49, prompt: "In a 3-4-5 right triangle, what is tan of the angle opposite the side of length 3?", options: ["3/4", "4/3", "3/5", "4/5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trig_prac_4_4", topicId: 49, prompt: "sin(90°) = ?", options: ["0", "0.5", "√2/2", "1", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "trig_prac_4_5", topicId: 49, prompt: "A ramp makes an angle of 20° with the ground and is 10 m long. What is the horizontal distance? (cos 20° ≈ 0.94)", options: ["7.5 m", "8.5 m", "9.4 m", "10 m", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 50 – Vectors
        50: [
            MathExamQuestion(id: "vec_prac_1_1", topicId: 50, prompt: "What is a vector?", options: ["A number with only magnitude", "A quantity with both magnitude and direction", "A type of matrix", "A scalar", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_prac_1_2", topicId: 50, prompt: "If a = (3, 4), what is |a| (magnitude)?", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vec_prac_1_3", topicId: 50, prompt: "Add vectors (2, 3) and (4, 1).", options: ["(6, 4)", "(2, 2)", "(6, 2)", "(8, 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_1_4", topicId: 50, prompt: "Subtract: (5, 7) − (2, 3)", options: ["(2, 3)", "(3, 4)", "(7, 10)", "(3, 10)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_prac_1_5", topicId: 50, prompt: "Multiply vector (2, 5) by scalar 3.", options: ["(5, 8)", "(6, 8)", "(6, 15)", "(2, 15)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vec_prac_2_1", topicId: 50, prompt: "If OA = (1, 2) and OB = (4, 6), find AB.", options: ["(3, 4)", "(5, 8)", "(−3, −4)", "(3, 8)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_2_2", topicId: 50, prompt: "What is the magnitude of (−3, 4)?", options: ["1", "5", "7", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_prac_2_3", topicId: 50, prompt: "Two vectors are equal if:", options: ["They have the same starting point", "They have the same magnitude only", "They have the same magnitude and direction", "They are parallel", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vec_prac_2_4", topicId: 50, prompt: "Find the unit vector of (3, 4).", options: ["(3/5, 4/5)", "(3/7, 4/7)", "(3, 4)/5", "Both a and c are the same", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "vec_prac_2_5", topicId: 50, prompt: "If a = 2i + 3j, what does this mean in column form?", options: ["(2, 3)", "(3, 2)", "(2j, 3i)", "(2+3, 3+2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_3_1", topicId: 50, prompt: "If OA = a and OB = b, express AB in terms of a and b.", options: ["a + b", "b − a", "a − b", "2a − b", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_prac_3_2", topicId: 50, prompt: "If M is the midpoint of AB, and OA = a, OB = b, what is OM?", options: ["(a + b)/2", "(b − a)/2", "a + b", "2a + b", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_3_3", topicId: 50, prompt: "Vectors p = (1, −2) and q = (−3, 4). Find 2p + q.", options: ["(−1, 0)", "(1, −2)", "(−1, −2)", "(1, 0)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_3_4", topicId: 50, prompt: "What does a negative vector −a represent?", options: ["Same direction, double magnitude", "Opposite direction, same magnitude", "No direction", "Half magnitude", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_prac_3_5", topicId: 50, prompt: "If a = (4, 3) and b = (4, 3), are they parallel?", options: ["Yes, they are equal so parallel", "No, parallel requires different magnitudes", "Only if they start at origin", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_4_1", topicId: 50, prompt: "Prove collinearity: If AB = 2a and AC = 4a, what can you conclude?", options: ["A, B, C are collinear", "AB and AC are equal", "B and C are the same point", "They form a right angle", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_4_2", topicId: 50, prompt: "Find |3a| if |a| = 5.", options: ["5", "8", "15", "25", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vec_prac_4_3", topicId: 50, prompt: "ABCD is a parallelogram. AB = p and AD = q. What is AC?", options: ["p + q", "p − q", "2p + q", "p + 2q", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_4_4", topicId: 50, prompt: "Given OA = (5, 2) and OB = (1, −2), find |AB|.", options: ["4√2", "4√5", "4√2 + 4", "√(16+16)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_prac_4_5", topicId: 50, prompt: "Vector p = 3i − 4j. What is |p|?", options: ["1", "5", "7", "12", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 51 – Sequences & Series
        51: [
            MathExamQuestion(id: "seq_prac_1_1", topicId: 51, prompt: "What is the next term: 3, 7, 11, 15, ...?", options: ["17", "18", "19", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_1_2", topicId: 51, prompt: "What type of sequence has a constant difference between terms?", options: ["Geometric", "Arithmetic", "Fibonacci", "Quadratic", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_1_3", topicId: 51, prompt: "Find the common difference: 5, 9, 13, 17", options: ["3", "4", "5", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_1_4", topicId: 51, prompt: "What is the 10th term of the sequence: 2, 5, 8, 11, ...?", options: ["27", "28", "29", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_1_5", topicId: 51, prompt: "The nth term formula for 4, 7, 10, 13, ... is:", options: ["3n + 1", "3n + 2", "4n", "n + 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "seq_prac_2_1", topicId: 51, prompt: "What type of sequence: 2, 6, 18, 54, ...?", options: ["Arithmetic", "Fibonacci", "Geometric", "Quadratic", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_2_2", topicId: 51, prompt: "Find the common ratio: 5, 10, 20, 40, ...", options: ["2", "5", "10", "20", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "seq_prac_2_3", topicId: 51, prompt: "Find the 5th term of geometric sequence: 3, 6, 12, ...?", options: ["24", "36", "48", "96", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_2_4", topicId: 51, prompt: "Find the nth term formula for the arithmetic sequence: 1, 4, 7, 10, ...", options: ["2n + 1", "3n − 2", "n + 3", "3n", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_2_5", topicId: 51, prompt: "What is the 20th term of the sequence with nth term = 5n − 3?", options: ["95", "97", "100", "97", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_3_1", topicId: 51, prompt: "Sum of the first n terms of an arithmetic sequence: Sₙ = n/2 × (first + last). Sum of 1 to 10:", options: ["45", "55", "60", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_3_2", topicId: 51, prompt: "The sequence 2, x, 8 is arithmetic. Find x.", options: ["4", "5", "6", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_3_3", topicId: 51, prompt: "Find the nth term formula for the sequence: 4, 9, 16, 25, ...", options: ["n²", "(n+1)²", "n² + 3", "n² + 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_3_4", topicId: 51, prompt: "The 3rd and 5th terms of arithmetic sequence are 7 and 13. What is the common difference?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_3_5", topicId: 51, prompt: "For geometric sequence with first term 1 and ratio 1/2, what is the sum to infinity (S = a/(1−r))?", options: ["1", "2", "4", "Infinity", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_4_1", topicId: 51, prompt: "The nth term of a sequence is 2n² − 1. What is the 5th term?", options: ["31", "40", "49", "50", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_4_2", topicId: 51, prompt: "An arithmetic series has first term 6 and common difference 3. What is the sum of the first 10 terms?", options: ["150", "195", "210", "225", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_prac_4_3", topicId: 51, prompt: "A geometric sequence has first term 2 and ratio 3. What is the 6th term?", options: ["162", "243", "486", "729", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_4_4", topicId: 51, prompt: "Find term number in: 1, 3, 5, 7, ... that equals 99.", options: ["48", "49", "50", "51", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_prac_4_5", topicId: 51, prompt: "A geometric series has first term 100 and ratio 0.5. Sum to infinity:", options: ["100", "200", "300", "400", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 52 – Functions
        52: [
            MathExamQuestion(id: "func_prac_1_1", topicId: 52, prompt: "What does f(x) = 2x + 3 mean?", options: ["f multiplied by x", "A function that maps x to 2x + 3", "A fraction f divided by x", "An equation f equals x", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_1_2", topicId: 52, prompt: "If f(x) = 5x − 1, find f(3).", options: ["12", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_1_3", topicId: 52, prompt: "If g(x) = x², find g(4).", options: ["8", "12", "16", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_prac_1_4", topicId: 52, prompt: "What is the domain of a function?", options: ["The output values", "The input values", "The gradient", "The y-intercept", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_1_5", topicId: 52, prompt: "What is the range of a function?", options: ["The input values", "The output values", "The gradient", "The domain", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_2_1", topicId: 52, prompt: "If f(x) = 3x + 2, what is f(−1)?", options: ["−5", "−1", "1", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_2_2", topicId: 52, prompt: "Given f(x) = x + 4, find x when f(x) = 10.", options: ["4", "6", "10", "14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_2_3", topicId: 52, prompt: "If g(x) = 1/x, what is g(4)?", options: ["4", "1/4", "2", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_2_4", topicId: 52, prompt: "What value is excluded from the domain of f(x) = 1/(x−3)?", options: ["x = 0", "x = 1", "x = 3", "x = −3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_prac_2_5", topicId: 52, prompt: "For f(x) = x², what is the range if domain is all real numbers?", options: ["All real numbers", "x ≥ 0", "x > 0", "x ≤ 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_3_1", topicId: 52, prompt: "If f(x) = 2x and g(x) = x + 3, find fg(x) (f composed with g).", options: ["2x + 3", "2x + 6", "2(x + 3)", "Both b and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "func_prac_3_2", topicId: 52, prompt: "If f(x) = x² and g(x) = x + 1, find gf(x).", options: ["x² + 1", "(x+1)²", "x² + 2x + 1", "x² × x + 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_prac_3_3", topicId: 52, prompt: "Find the inverse of f(x) = 2x − 4.", options: ["f⁻¹(x) = (x + 4)/2", "f⁻¹(x) = 2x + 4", "f⁻¹(x) = (x − 4)/2", "f⁻¹(x) = x/2 − 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_prac_3_4", topicId: 52, prompt: "For f(x) = 3x + 1, find ff(2).", options: ["17", "20", "21", "22", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "func_prac_3_5", topicId: 52, prompt: "f(x) = √(x − 2). What is the smallest value in the domain?", options: ["0", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_prac_4_1", topicId: 52, prompt: "Find the inverse of g(x) = (x + 5)/3.", options: ["g⁻¹(x) = 3x − 5", "g⁻¹(x) = (x − 5)/3", "g⁻¹(x) = 3x + 5", "g⁻¹(x) = 3/(x + 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_prac_4_2", topicId: 52, prompt: "If f(x) = x² + 1, is it a one-to-one function?", options: ["Yes, always", "No, since e.g. f(2)=f(−2)=5", "Only for x ≥ 0", "Only for x > 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_prac_4_3", topicId: 52, prompt: "Solve: f(x) = g(x) where f(x) = 2x + 1 and g(x) = x + 4.", options: ["x = 1", "x = 2", "x = 3", "x = 5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_prac_4_4", topicId: 52, prompt: "f(x) = 2x − 1. What is f(f⁻¹(5))?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_prac_4_5", topicId: 52, prompt: "Find fg(3) if f(x) = x² and g(x) = 2x − 1.", options: ["24", "25", "36", "49", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 53 – Transformations of Graphs
        53: [
            MathExamQuestion(id: "trf_prac_1_1", topicId: 53, prompt: "What does y = f(x) + 3 do to the graph of y = f(x)?", options: ["Shifts right 3", "Shifts left 3", "Shifts up 3", "Shifts down 3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_prac_1_2", topicId: 53, prompt: "What does y = f(x − 2) do to the graph?", options: ["Shifts right 2", "Shifts left 2", "Shifts up 2", "Shifts down 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_1_3", topicId: 53, prompt: "What does y = −f(x) do?", options: ["Reflects in y-axis", "Reflects in x-axis", "Stretches vertically", "Translates down", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_1_4", topicId: 53, prompt: "What does y = f(−x) do?", options: ["Reflects in x-axis", "Reflects in y-axis", "Stretches horizontally", "Translates left", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_1_5", topicId: 53, prompt: "What does y = 2f(x) do to the graph?", options: ["Horizontal stretch ×2", "Vertical stretch ×2", "Translates up 2", "Shrinks vertically", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_2_1", topicId: 53, prompt: "y = f(2x) represents:", options: ["Vertical stretch ×2", "Horizontal stretch ×2", "Horizontal compression ×1/2", "Vertical compression ×1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_prac_2_2", topicId: 53, prompt: "A point (3, 4) on f(x) moves to (3, 7) after transformation. This is:", options: ["f(x) + 3", "f(x − 3)", "f(x + 3)", "3f(x)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_2_3", topicId: 53, prompt: "A point (3, 4) moves to (5, 4). This transformation is:", options: ["f(x + 2)", "f(x − 2)", "f(x) + 2", "f(x) − 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_2_4", topicId: 53, prompt: "What does y = f(x + 3) − 1 do to the graph?", options: ["Right 3, down 1", "Left 3, up 1", "Left 3, down 1", "Right 3, up 1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_prac_2_5", topicId: 53, prompt: "What is the image of (2, 5) after y = −f(x)?", options: ["(2, −5)", "(−2, 5)", "(2, 5)", "(−2, −5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_3_1", topicId: 53, prompt: "What is the image of (4, 3) after y = f(−x)?", options: ["(4, 3)", "(4, −3)", "(−4, 3)", "(−4, −3)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_prac_3_2", topicId: 53, prompt: "Graph y = f(x/2) is a:", options: ["Horizontal stretch by factor 2", "Vertical stretch by factor 2", "Horizontal compression", "Vertical compression", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_3_3", topicId: 53, prompt: "A curve has equation y = x². What is the equation after shifting left 4 and up 2?", options: ["y = (x+4)² + 2", "y = (x−4)² + 2", "y = (x+4)² − 2", "y = x² + 6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_3_4", topicId: 53, prompt: "y = 3f(x) compared to y = f(x): all y-values are:", options: ["1/3 of original", "3 times original", "shifted up 3", "stretched horizontally", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_3_5", topicId: 53, prompt: "The graph y = sinx is transformed to y = sin(x) + 2. The amplitude:", options: ["Increases to 2", "Decreases to 0", "Stays at 1", "Doubles to 2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_prac_4_1", topicId: 53, prompt: "Describe fully: y = 2f(x + 1) − 3", options: ["Shift left 1, stretch vertically ×2, shift down 3", "Shift right 1, stretch ×2, shift up 3", "Shift left 1, compress ×2, shift down 3", "Shift left 2, stretch ×1, shift down 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_4_2", topicId: 53, prompt: "What single transformation maps y = x² to y = (x−5)² + 2?", options: ["Translation (5, 2)", "Translation (−5, 2)", "Reflection and translation", "Stretch and translation", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_4_3", topicId: 53, prompt: "Image of (2, −1) under y = f(x+2) + 3:", options: ["(0, 2)", "(4, 2)", "(0, −4)", "(4, −4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_prac_4_4", topicId: 53, prompt: "If y = cos(x), what is the equation after reflecting in the x-axis?", options: ["y = cos(−x)", "y = −cos(x)", "y = cos(x) + 1", "y = 1 − cos(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_prac_4_5", topicId: 53, prompt: "Stretch y = x³ horizontally by factor 3:", options: ["y = (x/3)³", "y = 3x³", "y = (3x)³", "y = x³/3", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Topic 54 – Circle Theorems
        54: [
            MathExamQuestion(id: "cth_prac_1_1", topicId: 54, prompt: "The angle in a semicircle is always:", options: ["45°", "60°", "90°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_1_2", topicId: 54, prompt: "A tangent to a circle meets the radius at:", options: ["30°", "45°", "90°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_1_3", topicId: 54, prompt: "Angles in the same segment subtended by the same arc are:", options: ["Supplementary", "Equal", "Complementary", "Twice the central angle", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_1_4", topicId: 54, prompt: "The central angle is ___ the inscribed angle subtending the same arc.", options: ["Half", "Equal to", "Twice", "Three times", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_1_5", topicId: 54, prompt: "Opposite angles of a cyclic quadrilateral sum to:", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_2_1", topicId: 54, prompt: "A chord's perpendicular bisector passes through:", options: ["Any tangent", "The centre", "An inscribed angle", "The circumference", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_2_2", topicId: 54, prompt: "The angle between a tangent and a chord equals:", options: ["The central angle", "The inscribed angle in the alternate segment", "90°", "Half the arc", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_2_3", topicId: 54, prompt: "Two tangents drawn from an external point are:", options: ["Always perpendicular", "Different lengths", "Equal in length", "Parallel", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_2_4", topicId: 54, prompt: "Inscribed angle subtending a major arc is:", options: ["Greater than 180°", "Less than 90°", "Equal to the minor arc angle", "Less than the major arc angle/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_2_5", topicId: 54, prompt: "A cyclic quadrilateral has angles 85°, 95°, x°, y° where x + y = 180°. If x = 100°, y = ?", options: ["60°", "70°", "80°", "90°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_3_1", topicId: 54, prompt: "Central angle AOB = 140°. What is inscribed angle ACB?", options: ["40°", "70°", "140°", "280°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_3_2", topicId: 54, prompt: "Inscribed angle in a semicircle = 90°. What is the central angle for that diameter?", options: ["45°", "90°", "180°", "360°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_3_3", topicId: 54, prompt: "A tangent-chord angle is 55°. What is the inscribed angle in the alternate segment?", options: ["35°", "45°", "55°", "70°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_3_4", topicId: 54, prompt: "In cyclic quadrilateral ABCD, angle A = 70°. What is angle C?", options: ["70°", "90°", "110°", "120°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_3_5", topicId: 54, prompt: "Two chords AB and CD of a circle intersect at P. Which theorem applies?", options: ["Tangent-radius theorem", "Intersecting chords theorem", "Alternate segment theorem", "Cyclic quadrilateral theorem", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_4_1", topicId: 54, prompt: "Chords PA = 4, PB = 6, PC = 3. Find PD (intersecting chords: PA×PB = PC×PD).", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_4_2", topicId: 54, prompt: "Angle in major segment = 40°. What is angle in minor segment?", options: ["40°", "80°", "140°", "320°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_prac_4_3", topicId: 54, prompt: "Two tangents from external point P touch circle at A and B. PA = 7 cm. What is PB?", options: ["3.5 cm", "7 cm", "14 cm", "49 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_prac_4_4", topicId: 54, prompt: "In circle with centre O, angle AOB = 2x. Inscribed angle ACB = ?", options: ["x", "2x", "x/2", "4x", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cth_prac_4_5", topicId: 54, prompt: "If ABCD is a cyclic quadrilateral and angle DAB = 115°, what is angle BCD?", options: ["55°", "65°", "75°", "90°", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 55 – Logarithms
        55: [
            MathExamQuestion(id: "log_prac_1_1", topicId: 55, prompt: "log₂(8) = ?", options: ["2", "3", "4", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_1_2", topicId: 55, prompt: "What does log₁₀(100) equal?", options: ["1", "2", "10", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_1_3", topicId: 55, prompt: "log_a(1) = ?", options: ["0", "1", "a", "−1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "log_prac_1_4", topicId: 55, prompt: "log_a(a) = ?", options: ["0", "1", "a", "a²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_1_5", topicId: 55, prompt: "If log₂(x) = 5, what is x?", options: ["10", "16", "32", "64", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_prac_2_1", topicId: 55, prompt: "Simplify: log(A) + log(B)", options: ["log(A+B)", "log(AB)", "log(A/B)", "log(A)×log(B)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_2_2", topicId: 55, prompt: "Simplify: log(A) − log(B)", options: ["log(A−B)", "log(AB)", "log(A/B)", "log(A)×log(B)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_prac_2_3", topicId: 55, prompt: "Simplify: 3 log(x)", options: ["log(3x)", "log(x³)", "3/log(x)", "log(x/3)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_2_4", topicId: 55, prompt: "Evaluate: log₃(81)", options: ["3", "4", "9", "27", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_2_5", topicId: 55, prompt: "Solve: log₂(x) = 4", options: ["x = 2", "x = 8", "x = 16", "x = 64", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_prac_3_1", topicId: 55, prompt: "Solve: 2^x = 32 using logarithms.", options: ["x = 3", "x = 4", "x = 5", "x = 6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_prac_3_2", topicId: 55, prompt: "log₁₀(1000) = ?", options: ["2", "3", "4", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_3_3", topicId: 55, prompt: "Simplify: log₂(8) + log₂(4)", options: ["log₂(12)", "log₂(32)", "log₂(2)", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_3_4", topicId: 55, prompt: "Change of base formula: log_b(a) = ?", options: ["ln(a)/ln(b)", "log(b)/log(a)", "log(a)/log(b)", "Both a and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "log_prac_3_5", topicId: 55, prompt: "Solve: log(x + 1) = 2 (base 10)", options: ["x = 9", "x = 10", "x = 99", "x = 100", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_prac_4_1", topicId: 55, prompt: "Solve: 3^x = 20 (use log). x ≈ ?", options: ["2.4", "2.7", "3.0", "3.3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_prac_4_2", topicId: 55, prompt: "Solve: 2 log(x) = log(25). What is x?", options: ["5", "12.5", "25", "50", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "log_prac_4_3", topicId: 55, prompt: "Evaluate: log₅(1/25)", options: ["−2", "−1", "2", "5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "log_prac_4_4", topicId: 55, prompt: "Simplify: log(x²) + log(x³)", options: ["log(x⁵)", "5 log(x)", "log(x⁶)", "Both a and b", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "log_prac_4_5", topicId: 55, prompt: "Solve: log₃(x − 1) = 3", options: ["x = 27", "x = 28", "x = 30", "x = 81", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 56 – Binomial Theorem
        56: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "binom_p1_1", topicId: 56, prompt: "Expand (x + 1)³ using the binomial theorem. What is the coefficient of x²?", options: ["1", "2", "3", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p1_2", topicId: 56, prompt: "A maths teacher asks students to expand (a + b)⁴. What is the third term?", options: ["4a²b²", "6a²b²", "4ab³", "a⁴", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p1_3", topicId: 56, prompt: "Using Pascal's triangle, what is the 4th row (starting from row 0)?", options: ["1 2 1", "1 3 3 1", "1 4 6 4 1", "1 1 1 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p1_4", topicId: 56, prompt: "Find the coefficient of x³ in the expansion of (1 + x)⁵.", options: ["5", "10", "15", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p1_5", topicId: 56, prompt: "The binomial coefficient C(6,2) equals:", options: ["6", "12", "15", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p1_6", topicId: 56, prompt: "In the expansion of (2x + 1)³, what is the constant term?", options: ["0", "1", "2", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p1_7", topicId: 56, prompt: "Find the 3rd term in the expansion of (x + 2)⁴.", options: ["24x²", "6x²", "24x³", "8x²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "binom_p1_8", topicId: 56, prompt: "C(n, 0) always equals:", options: ["0", "1", "n", "n!", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p1_9", topicId: 56, prompt: "What is the sum of all binomial coefficients in (1 + x)⁶?", options: ["12", "32", "64", "128", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p1_10", topicId: 56, prompt: "Evaluate C(7, 3).", options: ["21", "35", "42", "70", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "binom_p2_1", topicId: 56, prompt: "(1 + x)⁴ = 1 + 4x + ?x² + 4x³ + x⁴. What is the missing coefficient?", options: ["4", "6", "8", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_2", topicId: 56, prompt: "C(5, 2) = ?", options: ["5", "8", "10", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p2_3", topicId: 56, prompt: "The rth term of (a+b)ⁿ is C(n, r-1) × aⁿ⁻ʳ⁺¹ × bʳ⁻¹. Find the 3rd term of (x+2)⁵.", options: ["40x³", "80x³", "80x²", "40x²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_4", topicId: 56, prompt: "(a − b)³ = a³ − 3a²b + 3ab² − b³. Which term has coefficient −3?", options: ["a³", "a²b", "ab²", "b³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_5", topicId: 56, prompt: "In (2 + x)⁴, the coefficient of x² is C(4,2) × 2² = ?", options: ["12", "24", "48", "96", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_6", topicId: 56, prompt: "C(n, r) = n! ÷ (r! × (n−r)!). Find C(8, 3).", options: ["28", "40", "56", "70", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p2_7", topicId: 56, prompt: "(1 + 2x)³ = 1 + 6x + ?x² + 8x³. Missing coefficient?", options: ["8", "12", "16", "24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_8", topicId: 56, prompt: "Find the coefficient of x⁴ in (1 + x)⁷.", options: ["21", "28", "35", "42", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_p2_9", topicId: 56, prompt: "C(10, 10) = ?", options: ["0", "1", "10", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_p2_10", topicId: 56, prompt: "The term independent of x in (x + 1/x)⁴ is:", options: ["1", "4", "6", "12", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Practice Topic 57 – Advanced Circle Theorems
        57: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "advcir_p1_1", topicId: 57, prompt: "A tangent and a chord meet at a point on the circle. The angle between them equals the inscribed angle in the:", options: ["Same segment", "Alternate segment", "Major arc", "Minor arc", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p1_2", topicId: 57, prompt: "Two circles intersect at P and Q. What can you say about angles in the two segments at P?", options: ["They are equal", "They are supplementary", "They add to 360°", "They are each 90°", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "advcir_p1_3", topicId: 57, prompt: "A chord of length 16 cm is 6 cm from the centre of a circle. Find the radius.", options: ["8 cm", "9 cm", "10 cm", "11 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p1_4", topicId: 57, prompt: "Two tangents from external point P touch the circle at A and B. PA = 9. The length PB = ?", options: ["3", "6", "9", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p1_5", topicId: 57, prompt: "Angle at centre AOB = 140°. The angle in the major segment ACB = ?", options: ["40°", "70°", "110°", "140°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p1_6", topicId: 57, prompt: "In a cyclic quadrilateral, one angle is 115°. The opposite angle is:", options: ["65°", "75°", "115°", "245°", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "advcir_p1_7", topicId: 57, prompt: "A tangent at A makes an angle of 55° with chord AB. The inscribed angle ACB in the alternate segment = ?", options: ["25°", "35°", "55°", "125°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p1_8", topicId: 57, prompt: "A perpendicular from the centre to a chord bisects it. A chord is 10 cm long. How far from each end is the midpoint?", options: ["4 cm", "5 cm", "8 cm", "10 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p1_9", topicId: 57, prompt: "Secant from P passes through the circle at A and B. PT is a tangent. PT = 6, PA = 4. Find PB.", options: ["6", "8", "9", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p1_10", topicId: 57, prompt: "The angle subtended by an arc at the centre is twice the angle subtended at the circumference. If the arc subtends 80° at the circumference, the angle at the centre is:", options: ["40°", "80°", "120°", "160°", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "advcir_p2_1", topicId: 57, prompt: "Central angle = 2 × inscribed angle. If inscribed ∠ACB = 42°, central ∠AOB = ?", options: ["21°", "42°", "84°", "138°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p2_2", topicId: 57, prompt: "In cyclic quad ABCD: ∠A + ∠C = ?", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p2_3", topicId: 57, prompt: "Tangent-radius angle: OT ⊥ PT → ∠OTP = ?", options: ["45°", "60°", "90°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p2_4", topicId: 57, prompt: "Chord-chord: PA × PB = PC × PD. PA=2, PB=9, PC=3. PD = ?", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p2_5", topicId: 57, prompt: "Tangent-secant: PT² = PA × PB. PT=6, PA=4. PB = ?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p2_6", topicId: 57, prompt: "Angles in same segment are equal. ∠APB = 38°. Then ∠AQB = ?", options: ["19°", "38°", "76°", "142°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p2_7", topicId: 57, prompt: "Reflex ∠AOB = 250°. The non-reflex angle = ?", options: ["50°", "110°", "125°", "250°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p2_8", topicId: 57, prompt: "Radius r = 13, chord distance from centre = 5. Chord length = 2 × √(r² − d²) = ?", options: ["20", "22", "24", "26", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_p2_9", topicId: 57, prompt: "Two tangents from P: PA = PB always because:", options: ["Tangent perpendicular to radius", "Tangents from external point are equal", "Circle is symmetric", "Chord bisection theorem", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_p2_10", topicId: 57, prompt: "∠ACB = 90° when AB is a diameter because:", options: ["Alternate segment theorem", "Angle in semicircle theorem", "Cyclic quad theorem", "Tangent-chord theorem", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 58 – Exponential & Log Functions
        58: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "explog_p1_1", topicId: 58, prompt: "A bacteria culture doubles every hour. Starting with 100 bacteria, how many after 4 hours?", options: ["400", "800", "1200", "1600", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "explog_p1_2", topicId: 58, prompt: "A car loses 15% of its value each year. It starts at £20,000. What's it worth after 2 years?", options: ["£14,450", "£15,200", "£16,000", "£17,000", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "explog_p1_3", topicId: 58, prompt: "The natural log ln(e³) equals:", options: ["1", "2", "3", "e", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "explog_p1_4", topicId: 58, prompt: "If f(x) = eˣ, what is the gradient at x = 0?", options: ["0", "1", "e", "e²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p1_5", topicId: 58, prompt: "A population P = 500e^(0.03t). After how many years does it reach 1000? (ln 2 ≈ 0.693)", options: ["t ≈ 15", "t ≈ 20", "t ≈ 23", "t ≈ 30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "explog_p1_6", topicId: 58, prompt: "log₁₀(1000) = ?", options: ["2", "3", "4", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p1_7", topicId: 58, prompt: "The graph of y = eˣ always passes through which point?", options: ["(0, 0)", "(0, 1)", "(1, 0)", "(1, e)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p1_8", topicId: 58, prompt: "If ln(x) = 5, then x = ?", options: ["e⁵", "5e", "5²", "5 × ln(e)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "explog_p1_9", topicId: 58, prompt: "Carbon dating uses N = N₀e^(−0.000121t). If 50% remains, find t. (ln 0.5 ≈ −0.693)", options: ["t ≈ 4,700 years", "t ≈ 5,730 years", "t ≈ 6,200 years", "t ≈ 7,000 years", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p1_10", topicId: 58, prompt: "Simplify: log₂(8) + log₂(4)", options: ["log₂(12)", "log₂(32)", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "explog_p2_1", topicId: 58, prompt: "e^(ln x) = ?", options: ["ln(x)", "x", "e", "1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_2", topicId: 58, prompt: "ln(ab) = ?", options: ["ln(a) × ln(b)", "ln(a) + ln(b)", "ln(a) − ln(b)", "ln(a/b)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_3", topicId: 58, prompt: "d/dx[eˣ] = ?", options: ["xeˣ⁻¹", "eˣ", "eˣ⁺¹", "e", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_4", topicId: 58, prompt: "Solve: eˣ = 20. x = ? (ln 20 ≈ 2.996)", options: ["x ≈ 2.30", "x ≈ 2.99", "x ≈ 3.69", "x ≈ 4.61", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_5", topicId: 58, prompt: "log_a(xⁿ) = ?", options: ["n + log_a(x)", "n × log_a(x)", "log_a(n) × log_a(x)", "log_a(x/n)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_6", topicId: 58, prompt: "Solve: 2eˣ − 5 = 7. x = ?", options: ["ln(4)", "ln(6)", "ln(7)", "ln(12)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_7", topicId: 58, prompt: "d/dx[ln(x)] = ?", options: ["x", "1/x", "ln(x)/x", "eˣ", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_8", topicId: 58, prompt: "∫eˣ dx = ?", options: ["xeˣ + C", "eˣ + C", "eˣ⁺¹ + C", "e^(x+1)/(x+1) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_9", topicId: 58, prompt: "log_b(b) = ?", options: ["0", "1", "b", "b²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_p2_10", topicId: 58, prompt: "Change of base: log_a(b) = log(b) / log(a). Find log₂(32).", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 59 – Differentiation
        59: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "diff_p1_1", topicId: 59, prompt: "A ball is thrown upward. Its height h = 20t − 5t². When does it reach maximum height?", options: ["t = 1 s", "t = 2 s", "t = 3 s", "t = 4 s", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_2", topicId: 59, prompt: "A car's position is x = t³ − 6t² + 9t. Find the velocity at t = 2.", options: ["−1", "0", "1", "3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "diff_p1_3", topicId: 59, prompt: "Find the gradient of y = x² − 4x + 3 at x = 3.", options: ["0", "2", "3", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_4", topicId: 59, prompt: "The profit P = 50x − x² where x is units sold. Find the value of x that maximises profit.", options: ["x = 20", "x = 25", "x = 50", "x = 100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_5", topicId: 59, prompt: "Differentiate y = sin(x). What is dy/dx?", options: ["−cos(x)", "cos(x)", "sin(x)", "−sin(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_6", topicId: 59, prompt: "Find dy/dx if y = (3x + 1)⁴ using the chain rule.", options: ["4(3x+1)³", "12(3x+1)³", "4(3x+1)⁴", "3(3x+1)³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_7", topicId: 59, prompt: "The area of a square is A = s². The rate of change of area with side length when s = 5 is:", options: ["5", "10", "20", "25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p1_8", topicId: 59, prompt: "Find the turning point of y = x² − 6x + 8.", options: ["(3, −1)", "(2, 0)", "(3, 0)", "(6, 8)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_p1_9", topicId: 59, prompt: "Differentiate y = x² × sin(x) using the product rule. dy/dx = ?", options: ["2x × sin(x)", "x² × cos(x)", "2x sin(x) + x² cos(x)", "2x sin(x) − x² cos(x)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "diff_p1_10", topicId: 59, prompt: "If y = eˣ, then d²y/dx² = ?", options: ["xeˣ", "eˣ", "e²ˣ", "eˣ/2", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "diff_p2_1", topicId: 59, prompt: "d/dx[x⁵] = ?", options: ["5x⁴", "x⁶/6", "5x⁵", "4x⁵", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_p2_2", topicId: 59, prompt: "d/dx[3x² + 2x − 7] = ?", options: ["6x + 2", "3x + 2", "6x − 7", "6x² + 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_p2_3", topicId: 59, prompt: "d/dx[cos(x)] = ?", options: ["sin(x)", "−sin(x)", "cos(x)", "−cos(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_4", topicId: 59, prompt: "Chain rule: d/dx[f(g(x))] = ? ", options: ["f'(x) × g'(x)", "f'(g(x)) × g'(x)", "f(g'(x))", "f'(g(x)) + g'(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_5", topicId: 59, prompt: "d/dx[x⁻²] = ?", options: ["−2x⁻¹", "−2x⁻³", "2x⁻³", "−x⁻³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_6", topicId: 59, prompt: "d/dx[ln(3x)] = ?", options: ["3/x", "1/x", "ln(3)/x", "3 ln(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_7", topicId: 59, prompt: "Quotient rule: d/dx[u/v] = ?", options: ["(u'v − uv')/v²", "(u'v + uv')/v²", "(uv' − u'v)/v²", "u'v'", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_p2_8", topicId: 59, prompt: "Find dy/dx when y = sin(2x).", options: ["cos(2x)", "2cos(2x)", "−cos(2x)", "2sin(2x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_9", topicId: 59, prompt: "d/dx[e^(3x)] = ?", options: ["e^(3x)", "3e^(3x)", "3xe^(2x)", "e^(3x)/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_p2_10", topicId: 59, prompt: "If f'(x) = 0 at x = a and f''(a) > 0, then x = a is a:", options: ["Local maximum", "Local minimum", "Point of inflection", "Saddle point", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 60 – Integration
        60: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "integ_p1_1", topicId: 60, prompt: "Find the area under y = x² between x = 0 and x = 3.", options: ["6", "9", "18", "27", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_2", topicId: 60, prompt: "A velocity function is v = 3t². What is the displacement from t = 0 to t = 2?", options: ["4", "6", "8", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_p1_3", topicId: 60, prompt: "Integrate f(x) = 6x + 4. What is F(x)?", options: ["6x² + 4x + C", "3x² + 4x + C", "6 + C", "3x² + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_4", topicId: 60, prompt: "∫cos(x) dx = ?", options: ["−sin(x) + C", "sin(x) + C", "cos(x) + C", "−cos(x) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_5", topicId: 60, prompt: "The area between y = x and y = x² from 0 to 1 is:", options: ["1/6", "1/4", "1/3", "1/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_p1_6", topicId: 60, prompt: "Water flows into a tank at rate R(t) = 2t + 1 litres/min. Total flow from t=0 to t=4?", options: ["16 L", "20 L", "24 L", "28 L", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_7", topicId: 60, prompt: "∫eˣ dx = ?", options: ["eˣ/x + C", "eˣ + C", "e^(x+1)/(x+1) + C", "xeˣ + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_8", topicId: 60, prompt: "Evaluate ∫₀² (x + 1) dx.", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_9", topicId: 60, prompt: "Integration by substitution: ∫2x(x² + 1)⁵ dx. Let u = x² + 1. Result = ?", options: ["(x² + 1)⁶ + C", "(x² + 1)⁶/6 + C", "2(x² + 1)⁶ + C", "12(x² + 1)⁶ + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p1_10", topicId: 60, prompt: "∫(1/x) dx = ?", options: ["x⁻² + C", "ln|x| + C", "x + C", "1/(2x²) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "integ_p2_1", topicId: 60, prompt: "∫x⁴ dx = ?", options: ["4x³ + C", "x⁵ + C", "x⁵/5 + C", "5x⁵ + C", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_p2_2", topicId: 60, prompt: "∫(3x² − 2x + 1) dx = ?", options: ["x³ − x² + x + C", "6x − 2 + C", "3x³ − x² + x + C", "x³ − 2x + C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_p2_3", topicId: 60, prompt: "∫sin(x) dx = ?", options: ["cos(x) + C", "−cos(x) + C", "sin(x) + C", "−sin(x) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p2_4", topicId: 60, prompt: "∫₁³ 2x dx = ?", options: ["4", "6", "8", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_p2_5", topicId: 60, prompt: "∫e^(2x) dx = ?", options: ["e^(2x) + C", "2e^(2x) + C", "e^(2x)/2 + C", "e^(2x+1) + C", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_p2_6", topicId: 60, prompt: "∫₀^π sin(x) dx = ?", options: ["0", "1", "2", "π", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_p2_7", topicId: 60, prompt: "∫x × eˣ dx (integration by parts: u = x, dv = eˣ) = ?", options: ["xeˣ + C", "xeˣ − eˣ + C", "eˣ(x − 1) + C", "Both b and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "integ_p2_8", topicId: 60, prompt: "∫(2x + 3)⁴ dx = ?", options: ["(2x+3)⁵/5 + C", "(2x+3)⁵/10 + C", "4(2x+3)³ + C", "2(2x+3)⁵ + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p2_9", topicId: 60, prompt: "The definite integral ∫ᵃᵇ f(x) dx represents:", options: ["The derivative of f", "The area under f from a to b", "f(b) − f(a)", "The average of f", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_p2_10", topicId: 60, prompt: "∫₀¹ x² dx = ?", options: ["1/4", "1/3", "1/2", "1", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 61 – Differential Equations
        61: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "diffeq_p1_1", topicId: 61, prompt: "A population grows at rate dP/dt = 0.05P. If P(0) = 200, what is P(t)?", options: ["P = 200 + 0.05t", "P = 200e^(0.05t)", "P = 200 × 0.05t", "P = e^(200t)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_2", topicId: 61, prompt: "A cooling equation: dT/dt = −k(T − 20). What type of DE is this?", options: ["Quadratic", "First-order linear", "Second-order", "Partial", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_3", topicId: 61, prompt: "Solve dy/dx = 2x by integrating both sides. y = ?", options: ["2 + C", "x² + C", "2x + C", "x² + 2 + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_4", topicId: 61, prompt: "The general solution of dy/dx = y is:", options: ["y = x + C", "y = Ceˣ", "y = C ln(x)", "y = Ce^(x²)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_5", topicId: 61, prompt: "Separable DE: dy/dx = x/y. Solve it.", options: ["y² = x + C", "y² = x² + C", "y = x²/2 + C", "xy = C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_6", topicId: 61, prompt: "A radioactive substance decays: dN/dt = −λN. The solution is:", options: ["N = N₀ − λt", "N = N₀e^(−λt)", "N = N₀/λt", "N = λe^(−N₀t)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_7", topicId: 61, prompt: "Which method is used for dy/dx = f(x)g(y)?", options: ["Integration by parts", "Separation of variables", "Chain rule", "Substitution only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_8", topicId: 61, prompt: "Solve dy/dx = 3y with y(0) = 5.", options: ["y = 5 + 3x", "y = 5e^(3x)", "y = 3e^(5x)", "y = 5 × 3ˣ", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_9", topicId: 61, prompt: "A second-order DE d²y/dx² + y = 0 has solutions:", options: ["y = eˣ", "y = sin(x) and cos(x)", "y = x and x²", "y = ln(x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p1_10", topicId: 61, prompt: "The order of a differential equation is determined by:", options: ["The number of variables", "The highest derivative", "The coefficient", "The number of terms", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "diffeq_p2_1", topicId: 61, prompt: "dy/dx = ky → y = ?", options: ["y = k + C", "y = Ce^(kx)", "y = kx + C", "y = Cx^k", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_2", topicId: 61, prompt: "Solve: dy/dx = 4x³. y = ?", options: ["y = 12x² + C", "y = x⁴ + C", "y = 4x⁴ + C", "y = 4x² + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_3", topicId: 61, prompt: "For dy/dx = x/y, separate: y dy = x dx → ∫y dy = ∫x dx → ?", options: ["y = x + C", "y²/2 = x²/2 + C", "y² = x + C", "y = x²/2 + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_4", topicId: 61, prompt: "d²y/dx² = 6. Integrate twice to find y.", options: ["y = 3x² + C", "y = 6x + C₁", "y = 3x² + C₁x + C₂", "y = x³ + C", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "diffeq_p2_5", topicId: 61, prompt: "dP/dt = 0.02P, P(0) = 1000. Find P(50).", options: ["P = 1000 × e", "P ≈ 2718", "P = 2000", "P ≈ 7389", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_6", topicId: 61, prompt: "A particular solution requires:", options: ["Only the general solution", "An initial condition", "A second derivative", "No constants", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_7", topicId: 61, prompt: "Solve dy/dx = sin(x). y = ?", options: ["y = cos(x) + C", "y = −cos(x) + C", "y = sin(x) + C", "y = −sin(x) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_8", topicId: 61, prompt: "The equation d²y/dx² − 4y = 0 has characteristic equation:", options: ["m² = 4", "m + 4 = 0", "m − 4 = 0", "2m = 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diffeq_p2_9", topicId: 61, prompt: "If y = Ae^(2x) + Be^(−2x) is the general solution of y'' = 4y, what are the two characteristic roots?", options: ["m = ±1", "m = ±2", "m = ±4", "m = 0, 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_p2_10", topicId: 61, prompt: "Euler's method approximates solutions by:", options: ["Exact integration", "Small step linearisation", "Polynomial fitting", "Series expansion", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 62 – Limits
        62: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "lim_p1_1", topicId: 62, prompt: "What does lim(x→2) (x² − 4)/(x − 2) equal?", options: ["0", "2", "4", "Undefined", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p1_2", topicId: 62, prompt: "As x → ∞, what happens to f(x) = 1/x?", options: ["Goes to ∞", "Goes to 1", "Goes to 0", "Goes to −1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p1_3", topicId: 62, prompt: "lim(x→0) sin(x)/x = ?", options: ["0", "1", "∞", "Undefined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p1_4", topicId: 62, prompt: "lim(x→3) (x² − 9)/(x − 3) = ?", options: ["0", "3", "6", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p1_5", topicId: 62, prompt: "A function f(x) is continuous at x = a if lim(x→a) f(x) = ?", options: ["0", "f(a)", "f(0)", "a", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p1_6", topicId: 62, prompt: "lim(x→∞) (3x² + 2)/(x² + 1) = ?", options: ["0", "2", "3", "∞", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p1_7", topicId: 62, prompt: "When does a limit NOT exist?", options: ["When f(a) is defined", "When left and right limits differ", "When f is continuous", "When x = 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p1_8", topicId: 62, prompt: "lim(x→0⁺) (1/x) = ?", options: ["−∞", "0", "1", "+∞", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "lim_p1_9", topicId: 62, prompt: "lim(x→∞) (5x³ − 2x)/(2x³ + x²) = ?", options: ["0", "2.5", "5", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p1_10", topicId: 62, prompt: "By L'Hôpital's rule, lim(x→0) sin(x)/x = lim(x→0) cos(x)/1 = ?", options: ["0", "1", "∞", "sin(0)", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "lim_p2_1", topicId: 62, prompt: "lim(x→5) (x − 5)/(x² − 25) = ?", options: ["0", "1/10", "1/5", "Undefined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p2_2", topicId: 62, prompt: "lim(x→∞) e^(−x) = ?", options: ["−∞", "0", "1", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p2_3", topicId: 62, prompt: "lim(h→0) [f(x+h) − f(x)]/h is the definition of:", options: ["A limit", "The integral", "The derivative", "A series", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p2_4", topicId: 62, prompt: "lim(x→2) (x² + x − 6)/(x − 2) = ?", options: ["0", "3", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p2_5", topicId: 62, prompt: "lim(x→0) (eˣ − 1)/x = ?", options: ["0", "1", "e", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p2_6", topicId: 62, prompt: "If lim(x→a⁻) f(x) = 3 and lim(x→a⁺) f(x) = 5, the two-sided limit:", options: ["= 3", "= 5", "= 4", "does not exist", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "lim_p2_7", topicId: 62, prompt: "lim(x→∞) (2x + 1)/(3x − 2) = ?", options: ["1/2", "2/3", "1", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_p2_8", topicId: 62, prompt: "L'Hôpital's rule applies when the limit gives 0/0 or:", options: ["0/∞", "∞/0", "∞/∞", "1/0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_p2_9", topicId: 62, prompt: "lim(x→4) √x = ?", options: ["2", "4", "√2", "16", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lim_p2_10", topicId: 62, prompt: "lim(x→0) (tan x)/x = ?", options: ["0", "1", "∞", "tan 0", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 63 – Series Convergence
        63: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "serconv_p1_1", topicId: 63, prompt: "The series 1 + 1/2 + 1/4 + 1/8 + ... converges. What is its sum?", options: ["1.5", "2", "2.5", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p1_2", topicId: 63, prompt: "The harmonic series 1 + 1/2 + 1/3 + 1/4 + ... is:", options: ["Convergent", "Divergent", "Oscillating", "Zero", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p1_3", topicId: 63, prompt: "The ratio test: if |aₙ₊₁/aₙ| → L < 1, the series:", options: ["Diverges", "Converges absolutely", "Oscillates", "Cannot be determined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p1_4", topicId: 63, prompt: "Does the series Σ(1/n²) converge?", options: ["Yes, it's a p-series with p > 1", "No, it diverges", "Yes, because all terms are positive", "No, it's like the harmonic series", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_p1_5", topicId: 63, prompt: "The geometric series Σ rⁿ converges when:", options: ["|r| < 1", "|r| > 1", "r = 1", "r > 0", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_p1_6", topicId: 63, prompt: "Maclaurin series for eˣ = ?", options: ["1 + x + x²/2 + x³/6 + ...", "1 + x + x² + x³ + ...", "x − x³/6 + x⁵/120 − ...", "1 − x + x²/2 − ...", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_p1_7", topicId: 63, prompt: "The p-series Σ(1/nᵖ) converges when:", options: ["p > 0", "p > 1", "p ≥ 1", "p = 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p1_8", topicId: 63, prompt: "For an alternating series (−1)ⁿ/n, if terms decrease to 0, the series:", options: ["Diverges", "Converges by alternating series test", "Cannot be tested", "Converges to 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p1_9", topicId: 63, prompt: "Sum of geometric series: a = 3, r = 1/2. Sum to infinity = ?", options: ["3", "5", "6", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "serconv_p1_10", topicId: 63, prompt: "A Taylor series represents a function as:", options: ["A finite sum", "An infinite sum of derivative terms", "A differential equation", "A definite integral", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "serconv_p2_1", topicId: 63, prompt: "Σ(1/2)ⁿ from n=0 to ∞ = a/(1−r) = ?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p2_2", topicId: 63, prompt: "Ratio test: aₙ = 1/n!. |aₙ₊₁/aₙ| → ?", options: ["0", "1", "∞", "1/n", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_p2_3", topicId: 63, prompt: "Maclaurin: sin(x) = x − x³/3! + x⁵/5! − ... The coefficient of x³ is:", options: ["1/3", "−1/6", "1/6", "−1/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p2_4", topicId: 63, prompt: "Root test: if lim(n→∞) ⁿ√|aₙ| = L < 1, the series:", options: ["Diverges", "Converges", "Oscillates", "Requires another test", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p2_5", topicId: 63, prompt: "Σ rⁿ for |r| < 1: sum = a/(1−r). For a=5, r=1/3, sum = ?", options: ["5/2", "15/2", "7.5", "Both b and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "serconv_p2_6", topicId: 63, prompt: "The series Σ n/(n+1) as n→∞: each term approaches:", options: ["0", "1", "∞", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p2_7", topicId: 63, prompt: "If lim(n→∞) aₙ ≠ 0, the series Σ aₙ:", options: ["Converges", "Diverges (nth term test)", "May converge", "Converges conditionally", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_p2_8", topicId: 63, prompt: "cos(x) Maclaurin = 1 − x²/2! + x⁴/4! − ... The 3rd term (index 2) is:", options: ["x²/2", "−x²/2", "x⁴/24", "−x⁴/24", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "serconv_p2_9", topicId: 63, prompt: "Σ(2ⁿ/n!) converges because ratio test gives L = ?", options: ["0", "2", "∞", "1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_p2_10", topicId: 63, prompt: "Σ(1/n) diverges but Σ(1/n²) converges. The difference is:", options: ["Signs", "The value of p in p-series", "Number of terms", "Starting index", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 64 – Multivariable Calculus
        64: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "multcalc_p1_1", topicId: 64, prompt: "The partial derivative ∂/∂x of f(x,y) = x²y treats y as:", options: ["A variable", "A constant", "Zero", "Equal to x", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_2", topicId: 64, prompt: "Find ∂f/∂x where f(x,y) = 3x²y + y³.", options: ["3x² + 3y²", "6xy", "6xy + y³", "3x²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_3", topicId: 64, prompt: "The gradient ∇f of f(x,y) = x² + y² is:", options: ["(x, y)", "(2x, 2y)", "(x², y²)", "(2, 2)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_4", topicId: 64, prompt: "A surface z = f(x,y) has a local minimum where:", options: ["∇f = (1,1)", "∇f = (0,0) and second derivative conditions hold", "z = 0", "fx = 1, fy = 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_5", topicId: 64, prompt: "∂/∂y [x²y + sin(y)] = ?", options: ["x²", "x² + cos(y)", "2xy + cos(y)", "sin(y)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_6", topicId: 64, prompt: "A double integral ∫∫_R f(x,y) dA computes:", options: ["A line integral", "Volume under f over region R", "Surface area", "A gradient", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_7", topicId: 64, prompt: "Find fxx where f(x,y) = x³ + x²y.", options: ["6x + 2y", "3x² + 2xy", "6x", "3x²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "multcalc_p1_8", topicId: 64, prompt: "The directional derivative Dᵤf in direction u measures:", options: ["The total derivative", "Rate of change of f in direction u", "The gradient length", "The Laplacian", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p1_9", topicId: 64, prompt: "For f(x,y), the mixed partials fxy and fyx are equal when:", options: ["Always", "f is continuous", "The partials are continuous", "f = 0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "multcalc_p1_10", topicId: 64, prompt: "∫₀¹ ∫₀¹ (x + y) dx dy = ?", options: ["0.5", "1", "1.5", "2", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "multcalc_p2_1", topicId: 64, prompt: "∂/∂x[x²y³] = ?", options: ["2xy³", "x²·3y²", "2x·y³", "Both a and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "multcalc_p2_2", topicId: 64, prompt: "∂/∂y[e^(xy)] = ?", options: ["xe^(xy)", "ye^(xy)", "e^(xy)", "e^y", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "multcalc_p2_3", topicId: 64, prompt: "∇f = (∂f/∂x, ∂f/∂y). If f = x² + y², ∇f = ?", options: ["(x, y)", "(2x, 2y)", "(2, 2)", "(x², y²)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p2_4", topicId: 64, prompt: "Critical point requires: fx = ? and fy = ?", options: ["1 and 1", "0 and 0", "∞ and ∞", "Equal values", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p2_5", topicId: 64, prompt: "∫₀² ∫₀¹ 2x dy dx = ?", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p2_6", topicId: 64, prompt: "The Hessian determinant D = fxx·fyy − (fxy)². If D > 0 and fxx > 0:", options: ["Saddle point", "Local maximum", "Local minimum", "Inflection point", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "multcalc_p2_7", topicId: 64, prompt: "∂²f/∂x∂y means differentiate first with respect to:", options: ["x then y", "y then x", "Both simultaneously", "x twice", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p2_8", topicId: 64, prompt: "Chain rule: if z = f(x,y), x = g(t), y = h(t), then dz/dt = ?", options: ["∂z/∂x + ∂z/∂y", "(∂z/∂x)(dx/dt) + (∂z/∂y)(dy/dt)", "∂z/∂t", "(dz/dx)(dz/dy)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_p2_9", topicId: 64, prompt: "∫∫_R 1 dA where R is the unit square [0,1]×[0,1] = ?", options: ["0", "0.5", "1", "2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "multcalc_p2_10", topicId: 64, prompt: "Lagrange multipliers: to maximise f subject to g = 0, set ∇f = ?", options: ["∇f = 0", "∇f = λ∇g", "∇f = g", "f = λg", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 65 – Linear Algebra
        65: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "linalg_p1_1", topicId: 65, prompt: "A 2×2 matrix A = [[1,2],[3,4]]. What is det(A)?", options: ["−2", "2", "10", "−10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_p1_2", topicId: 65, prompt: "Matrix multiplication: [[1,0],[0,1]] × [[3,4],[5,6]] = ?", options: ["[[3,4],[5,6]]", "[[0,0],[0,0]]", "[[1,1],[1,1]]", "[[4,4],[5,7]]", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_p1_3", topicId: 65, prompt: "A matrix is invertible if and only if its determinant is:", options: ["0", "1", "Not zero", "Positive", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_p1_4", topicId: 65, prompt: "The eigenvalue equation is Av = λv. Eigenvalues satisfy:", options: ["det(A) = λ", "det(A − λI) = 0", "Av = 0", "trace(A) = λ", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p1_5", topicId: 65, prompt: "The rank of a matrix is:", options: ["Number of rows", "Number of columns", "Dimension of column space", "The determinant", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_p1_6", topicId: 65, prompt: "Two vectors u and v are orthogonal if:", options: ["u × v = 0", "u · v = 0", "|u| = |v|", "u = v", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p1_7", topicId: 65, prompt: "Row reduce [[2,4],[1,3]] to find its rank. Rank = ?", options: ["0", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_p1_8", topicId: 65, prompt: "The null space of A contains all x such that:", options: ["Ax = b", "Ax = 0", "det(A) = x", "Aᵀ = x", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p1_9", topicId: 65, prompt: "If A is 3×3 with eigenvalues 1, 2, 3, then det(A) = ?", options: ["3", "6", "9", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p1_10", topicId: 65, prompt: "The trace of [[3,1],[2,4]] = ?", options: ["3", "5", "7", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "linalg_p2_1", topicId: 65, prompt: "det([[a,b],[c,d]]) = ?", options: ["ab − cd", "ad − bc", "ac − bd", "a + d", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_2", topicId: 65, prompt: "A⁻¹ exists when det(A) ≠ ?", options: ["1", "0", "∞", "−1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_3", topicId: 65, prompt: "If Av = λv, then v is an:", options: ["Eigenvalue", "Eigenvector", "Determinant", "Inverse", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_4", topicId: 65, prompt: "(A + B)ᵀ = ?", options: ["Aᵀ + Bᵀ", "Bᵀ + Aᵀ", "Both a and b", "Aᵀ × Bᵀ", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_p2_5", topicId: 65, prompt: "For 2×2 A: A⁻¹ = (1/det(A)) × [[d,−b],[−c,a]]. If det = 2 and A=[[1,2],[0,2]], find A⁻¹[0][0].", options: ["0.5", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_6", topicId: 65, prompt: "u · v = |u||v|cos(θ). If u · v = 0, then θ = ?", options: ["0°", "45°", "90°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_p2_7", topicId: 65, prompt: "(AB)ᵀ = ?", options: ["AᵀBᵀ", "BᵀAᵀ", "AᵀB", "BAᵀ", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_8", topicId: 65, prompt: "Characteristic polynomial of [[2,0],[0,3]] is det(A − λI) = ?", options: ["(2−λ)(3−λ)", "(λ−2)(λ−3)", "λ² − 5λ + 6", "All of the above", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "linalg_p2_9", topicId: 65, prompt: "A system Ax = b has a unique solution when rank(A) = ?", options: ["0", "n (number of unknowns)", "n − 1", "det(A)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_p2_10", topicId: 65, prompt: "Gram-Schmidt orthogonalisation produces vectors that are:", options: ["Parallel", "Orthonormal", "Linearly dependent", "Symmetric", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 66 – Abstract Algebra
        66: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "absalg_p1_1", topicId: 66, prompt: "A group G must have: closure, associativity, identity element, and:", options: ["Commutativity", "Inverses for all elements", "Distributivity", "Finite order", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_2", topicId: 66, prompt: "The integers under addition form a group. The identity element is:", options: ["1", "0", "−1", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_3", topicId: 66, prompt: "A group is abelian if:", options: ["Every element has order 2", "The group operation is commutative", "It has finite order", "It is cyclic", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_4", topicId: 66, prompt: "The order of element g in a group is the smallest positive n such that:", options: ["g^n = g", "g^n = identity", "n × g = 0", "g = n", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_5", topicId: 66, prompt: "Lagrange's theorem states that the order of a subgroup divides:", options: ["The order of the element", "The order of the group", "The number of generators", "The rank of the group", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_6", topicId: 66, prompt: "A ring requires two operations. Which pair?", options: ["Multiplication and division", "Addition and multiplication", "Subtraction and exponentiation", "Addition and subtraction", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_7", topicId: 66, prompt: "Z/5Z (integers mod 5) has how many elements?", options: ["4", "5", "6", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_8", topicId: 66, prompt: "A field is a ring where every nonzero element has a:", options: ["Square root", "Multiplicative inverse", "Additive inverse", "Prime factorisation", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_9", topicId: 66, prompt: "The group S₃ (permutations of 3 elements) has order:", options: ["3", "6", "9", "27", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p1_10", topicId: 66, prompt: "A homomorphism φ: G → H preserves:", options: ["Element order only", "Group structure (operation)", "Size of G", "Commutativity only", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "absalg_p2_1", topicId: 66, prompt: "Group axiom: ∀a∈G, ∃a⁻¹∈G such that a × a⁻¹ = ?", options: ["a", "a²", "e (identity)", "0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_p2_2", topicId: 66, prompt: "In Z/7Z, what is 5 + 4 (mod 7)?", options: ["1", "2", "3", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p2_3", topicId: 66, prompt: "|G| = 12. By Lagrange's theorem, possible subgroup orders are:", options: ["1, 2, 3, 6, 12", "1, 2, 3, 4, 6, 12", "2, 4, 6, 12", "1, 6, 12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p2_4", topicId: 66, prompt: "Order of element 2 in Z/6Z under addition:", options: ["2", "3", "6", "Infinite", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p2_5", topicId: 66, prompt: "Ker(φ) = {g ∈ G : φ(g) = eH}. Kernel is always a:", options: ["Normal subgroup of G", "Subgroup of H", "Quotient group", "Coset", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "absalg_p2_6", topicId: 66, prompt: "Z (integers) under + is a group. Inverse of 5 is:", options: ["1/5", "−5", "0", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p2_7", topicId: 66, prompt: "A cyclic group is generated by:", options: ["All elements", "A single element g", "Two elements", "The identity", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_p2_8", topicId: 66, prompt: "In ring R, distributive law: a(b + c) = ?", options: ["ab + c", "a + bc", "ab + ac", "abc", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_p2_9", topicId: 66, prompt: "Isomorphism φ: G → H means φ is bijective and:", options: ["A homomorphism", "Order-preserving", "Both a and b (φ(ab)=φ(a)φ(b))", "A surjection only", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_p2_10", topicId: 66, prompt: "Normal subgroup N ◁ G means: for all g ∈ G, gNg⁻¹ = ?", options: ["G", "N", "e", "gN", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 67 – Real Analysis
        67: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "realana_p1_1", topicId: 67, prompt: "A sequence {aₙ} converges to L if for every ε > 0, there exists N such that for all n > N, |aₙ − L| < ?", options: ["0", "N", "ε", "1/n", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "realana_p1_2", topicId: 67, prompt: "The sequence aₙ = 1/n converges to:", options: ["1", "0", "∞", "e", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_3", topicId: 67, prompt: "A monotone increasing bounded sequence:", options: ["Diverges", "Must converge", "Oscillates", "May or may not converge", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_4", topicId: 67, prompt: "The Bolzano-Weierstrass theorem states: every bounded sequence in ℝ has a:", options: ["Limit", "Convergent subsequence", "Monotone subsequence only", "Divergent tail", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_5", topicId: 67, prompt: "A function f is continuous at x = a using the ε-δ definition if:", options: ["f(a) = 0", "For every ε>0, ∃δ>0: |x−a|<δ → |f(x)−f(a)|<ε", "f is differentiable at a", "f has a limit at a only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_6", topicId: 67, prompt: "The Intermediate Value Theorem guarantees that if f is continuous on [a,b] and f(a) < 0 < f(b), then:", options: ["f is monotone", "∃c ∈ (a,b) with f(c) = 0", "f(a) = f(b)", "f has a maximum", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_7", topicId: 67, prompt: "The sup (supremum) of the set {1/n : n ∈ ℕ} is:", options: ["0", "1", "∞", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_8", topicId: 67, prompt: "A Cauchy sequence has the property that:", options: ["aₙ → ∞", "|aₙ − aₘ| → 0 as n,m → ∞", "aₙ = constant", "aₙ is monotone", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_9", topicId: 67, prompt: "The Mean Value Theorem guarantees that if f is differentiable on (a,b), then ∃c ∈ (a,b) with f'(c) = ?", options: ["0", "[f(b) − f(a)]/(b − a)", "f(a)", "(a + b)/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p1_10", topicId: 67, prompt: "A set S ⊆ ℝ is compact if and only if it is:", options: ["Open and unbounded", "Closed and bounded", "Open and bounded", "Closed only", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "realana_p2_1", topicId: 67, prompt: "lim(n→∞) n/(n+1) = ?", options: ["0", "1", "∞", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p2_2", topicId: 67, prompt: "ε-δ: |x − 3| < δ implies |2x − 6| < ε. Choose δ = ?", options: ["ε", "ε/2", "2ε", "ε + 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p2_3", topicId: 67, prompt: "sup{x ∈ ℝ : x² < 9} = ?", options: ["3", "9", "−3", "∞", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "realana_p2_4", topicId: 67, prompt: "A sequence is Cauchy iff it is:", options: ["Monotone", "Bounded", "Convergent (in ℝ)", "Positive", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "realana_p2_5", topicId: 67, prompt: "IVT: f continuous on [a,b], f(a) = −2, f(b) = 4. Then ∃c with f(c) = ?", options: ["Any value in [−2,4]", "0 only", "The maximum", "−2 or 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "realana_p2_6", topicId: 67, prompt: "MVT: f(0) = 1, f(4) = 9. ∃c ∈ (0,4): f'(c) = ?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p2_7", topicId: 67, prompt: "inf{1/n : n ∈ ℕ} = ?", options: ["0", "1", "1/∞", "Does not exist", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "realana_p2_8", topicId: 67, prompt: "lim(n→∞) (2n² + 1)/(n² − 3) = ?", options: ["1", "2", "∞", "−1/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_p2_9", topicId: 67, prompt: "f'(c) = 0 and f''(c) = 0. This means x = c is:", options: ["Local max", "Local min", "Inconclusive (need more info)", "A saddle point", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "realana_p2_10", topicId: 67, prompt: "Heine-Borel: compact in ℝⁿ ↔ closed and:", options: ["Connected", "Bounded", "Finite", "Open", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 68 – Complex Analysis
        68: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "compan_p1_1", topicId: 68, prompt: "The modulus of z = 3 + 4i is:", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "compan_p1_2", topicId: 68, prompt: "The argument of z = −1 + 0i (in radians) is:", options: ["0", "π/2", "π", "3π/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "compan_p1_3", topicId: 68, prompt: "Find (2 + 3i)(1 − i).", options: ["2 + i", "5 + i", "5 − i", "−1 + 5i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p1_4", topicId: 68, prompt: "The complex conjugate of z = 4 − 7i is:", options: ["4 + 7i", "−4 + 7i", "−4 − 7i", "7 − 4i", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p1_5", topicId: 68, prompt: "Euler's formula: e^(iθ) = ?", options: ["cos(θ) + i·sin(θ)", "cos(θ) − i·sin(θ)", "sin(θ) + i·cos(θ)", "i·e^θ", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p1_6", topicId: 68, prompt: "z·z̄ = ?", options: ["0", "|z|", "|z|²", "Re(z)²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "compan_p1_7", topicId: 68, prompt: "In polar form, z = r(cos θ + i sin θ). If r = 2, θ = π/3, what is Re(z)?", options: ["1", "√3", "2", "√2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p1_8", topicId: 68, prompt: "i² = ?, i³ = ?, i⁴ = ?", options: ["−1, i, 1", "−1, −i, 1", "1, i, −1", "−1, 1, i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p1_9", topicId: 68, prompt: "Divide (3 + 4i)/(1 + 2i). Multiply numerator and denominator by:", options: ["1 − 2i", "1 + 2i", "3 − 4i", "−1 − 2i", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p1_10", topicId: 68, prompt: "De Moivre's theorem: (r·e^(iθ))ⁿ = ?", options: ["r·e^(inθ)", "rⁿ·e^(inθ)", "n·r·e^(iθ)", "rⁿ·e^(iθ/n)", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "compan_p2_1", topicId: 68, prompt: "|3 + 4i| = √(3² + 4²) = ?", options: ["5", "7", "√5", "25", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p2_2", topicId: 68, prompt: "arg(i) = ?", options: ["0", "π/4", "π/2", "π", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "compan_p2_3", topicId: 68, prompt: "e^(iπ) + 1 = ? (Euler's identity)", options: ["2", "1", "0", "e", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "compan_p2_4", topicId: 68, prompt: "(1 + i)² = ?", options: ["2", "2i", "1 + 2i", "0 + 2i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p2_5", topicId: 68, prompt: "z = 2e^(iπ/2). Then z = ?", options: ["2 + 0i", "0 + 2i", "−2 + 0i", "2 + 2i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p2_6", topicId: 68, prompt: "Roots of z² = −1 are:", options: ["z = ±1", "z = ±i", "z = ±√i", "z = 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p2_7", topicId: 68, prompt: "Re(z) + Im(z)i = z. If z = 5 − 3i, Im(z) = ?", options: ["5", "−3", "3", "3i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p2_8", topicId: 68, prompt: "(cos θ + i sin θ)³ = cos(3θ) + i sin(3θ) by:", options: ["Euler's formula", "De Moivre's theorem", "Argand diagram", "Polar decomposition", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_p2_9", topicId: 68, prompt: "1/z = z̄/|z|². If z = 1 + i, find 1/z.", options: ["(1−i)/2", "(1+i)/2", "(1−i)", "1/2 + i", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_p2_10", topicId: 68, prompt: "|z₁ × z₂| = ?", options: ["|z₁| + |z₂|", "|z₁| × |z₂|", "|z₁|² × |z₂|²", "|z₁ + z₂|", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 69 – Probability Theory
        69: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "prob_p1_1", topicId: 69, prompt: "A fair coin is tossed 3 times. Probability of exactly 2 heads = ?", options: ["1/4", "3/8", "1/2", "5/8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p1_2", topicId: 69, prompt: "E(X) of a fair die = ?", options: ["2.5", "3", "3.5", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p1_3", topicId: 69, prompt: "If P(A) = 0.4 and P(B) = 0.5 and A, B are independent, find P(A ∩ B).", options: ["0.1", "0.2", "0.45", "0.9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p1_4", topicId: 69, prompt: "P(A ∪ B) = P(A) + P(B) − P(A ∩ B). If P(A)=0.3, P(B)=0.5, P(A∩B)=0.15, find P(A∪B).", options: ["0.5", "0.65", "0.8", "0.95", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p1_5", topicId: 69, prompt: "X ~ Binomial(n=10, p=0.5). E(X) = ?", options: ["2", "4", "5", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p1_6", topicId: 69, prompt: "For X ~ N(μ, σ²), about 68% of data lies within:", options: ["μ ± 2σ", "μ ± σ", "μ ± 3σ", "μ only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p1_7", topicId: 69, prompt: "Bayes' theorem: P(A|B) = P(B|A)P(A) / ?", options: ["P(A)", "P(B|A)", "P(B)", "P(A∩B)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p1_8", topicId: 69, prompt: "Var(X) for fair die = E(X²) − [E(X)]². E(X)=3.5, E(X²)=91/6. Var(X) ≈ ?", options: ["1.75", "2.5", "2.92", "3.5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p1_9", topicId: 69, prompt: "The Poisson distribution models:", options: ["Heights of people", "Number of events in fixed time/space", "Binary outcomes", "Continuous growth", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p1_10", topicId: 69, prompt: "If X and Y are independent, E(XY) = ?", options: ["E(X) + E(Y)", "E(X) × E(Y)", "E(X) / E(Y)", "0", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "prob_p2_1", topicId: 69, prompt: "P(X = k) = C(n,k) × pᵏ × (1−p)ⁿ⁻ᵏ is the:", options: ["Poisson formula", "Binomial PMF", "Normal PDF", "Geometric PMF", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_2", topicId: 69, prompt: "E(aX + b) = ?", options: ["aE(X) + b", "a²E(X) + b", "E(X) + ab", "a × b × E(X)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prob_p2_3", topicId: 69, prompt: "Var(aX) = ?", options: ["aVar(X)", "a²Var(X)", "Var(X)/a", "a + Var(X)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_4", topicId: 69, prompt: "Poisson: P(X = k) = e^(−λ) × λᵏ / k!. For λ=2, P(X=0) = ?", options: ["0", "e⁻²", "1/2", "2e⁻²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_5", topicId: 69, prompt: "Normal distribution: Z = (X − μ)/σ is called:", options: ["The variance", "The standardised score (z-score)", "The skewness", "The kurtosis", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_6", topicId: 69, prompt: "P(A|B) = P(A∩B)/P(B). This is:", options: ["Bayes' theorem", "Conditional probability", "Law of total probability", "Independence rule", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_7", topicId: 69, prompt: "If X ~ Bin(20, 0.3), E(X) = np = ?", options: ["3", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p2_8", topicId: 69, prompt: "For continuous X: P(X = a) = ?", options: ["f(a)", "1", "0", "F(a)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_p2_9", topicId: 69, prompt: "Var(X + Y) = Var(X) + Var(Y) when X and Y are:", options: ["Normal", "Independent", "Identical", "Positive", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_p2_10", topicId: 69, prompt: "Central Limit Theorem: for large n, X̄ ~ N(μ, σ²/n). As n → ∞, the distribution:", options: ["Widens", "Narrows around μ", "Becomes uniform", "Stays the same", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Practice Topic 70 – Mathematical Proof
        70: [
            // Quest 1-2: Word problems (indices 0-9)
            MathExamQuestion(id: "proof_p1_1", topicId: 70, prompt: "In proof by induction, after proving the base case P(1), you assume P(k) and prove:", options: ["P(1)", "P(k-1)", "P(k+1)", "P(k²)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p1_2", topicId: 70, prompt: "In proof by contradiction, you assume the statement is:", options: ["True and show it leads to truth", "False and derive a contradiction", "True and derive a contradiction", "False and show it's consistent", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p1_3", topicId: 70, prompt: "To prove '∀x ∈ ℕ, x² + x is even', what method works best?", options: ["Proof by contradiction", "Direct proof (factor x²+x = x(x+1))", "Proof by example", "Induction only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p1_4", topicId: 70, prompt: "The contrapositive of 'If P then Q' is:", options: ["If Q then P", "If not P then not Q", "If not Q then not P", "If P then not Q", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p1_5", topicId: 70, prompt: "Prove √2 is irrational. This classic proof uses:", options: ["Induction", "Direct proof", "Contradiction", "Construction", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p1_6", topicId: 70, prompt: "The statement '∃x ∈ ℝ: x² = 2' is disproved by:", options: ["Finding a counterexample", "Showing no such x exists in ℕ? Actually it exists in ℝ  -  this is TRUE", "Induction", "Contradiction", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p1_7", topicId: 70, prompt: "To disprove '∀n ∈ ℕ, n² + n + 41 is prime', you need:", options: ["A general proof", "A single counterexample", "Induction", "The fundamental theorem", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p1_8", topicId: 70, prompt: "Prove by induction: Σk (k=1 to n) = n(n+1)/2. The inductive step adds term:", options: ["n", "n+1", "n(n+1)/2", "(n+1)(n+2)/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p1_9", topicId: 70, prompt: "A biconditional 'P ↔ Q' requires proving:", options: ["P → Q only", "Q → P only", "Both P → Q and Q → P", "P and Q separately", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p1_10", topicId: 70, prompt: "The well-ordering principle states every non-empty subset of ℕ has a:", options: ["Maximum element", "Minimum element", "Mean element", "Prime element", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3-4: Symbolic format (indices 10-19)
            MathExamQuestion(id: "proof_p2_1", topicId: 70, prompt: "P(n): Σk=1 to n of k = n(n+1)/2. Base case n=1: LHS = 1, RHS = ?", options: ["0", "1", "2", "3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_2", topicId: 70, prompt: "Inductive step: assume Σk=1 to n of k = n(n+1)/2. Add (n+1): new sum = n(n+1)/2 + (n+1) = ?", options: ["(n+1)(n+2)/2", "(n+1)²/2", "n(n+2)/2", "(n+1)n/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "proof_p2_3", topicId: 70, prompt: "Contrapositive of 'If n² is even → n is even': If n is odd → ?", options: ["n² is even", "n² is odd", "n is prime", "n² = 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_4", topicId: 70, prompt: "To prove '∀n ∈ ℕ, 2ⁿ ≥ n + 1', show base n=1: 2¹=2 ≥ 1+1=2. ✓ Inductive step: assume 2ᵏ ≥ k+1. Then 2^(k+1) = 2×2ᵏ ≥ 2(k+1). Is 2(k+1) ≥ (k+2)?", options: ["No, never", "Yes, since k ≥ 0", "Only for even k", "Only if k > 2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_5", topicId: 70, prompt: "Proof by exhaustion works by:", options: ["Trying one case", "Checking all finite cases", "Assuming the result", "Contradiction", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_6", topicId: 70, prompt: "If P → Q is true, which is also true?", options: ["Q → P", "¬P → ¬Q", "¬Q → ¬P (contrapositive)", "P ↔ Q", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p2_7", topicId: 70, prompt: "Strong induction assumes P(1), P(2), ..., P(k) all hold to prove:", options: ["P(1)", "P(k)", "P(k+1)", "P(2k)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_p2_8", topicId: 70, prompt: "Prove: n is even ↔ n² is even. The ← direction needs:", options: ["Direct proof: n even → n² even", "Contrapositive: n odd → n² odd", "Contradiction", "Induction", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_9", topicId: 70, prompt: "In a direct proof of 'if a|b and b|c then a|c', write b = ka and c = lb. Then c = ?", options: ["(k+l)a", "kla", "k/l × a", "a(kl)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_p2_10", topicId: 70, prompt: "¬(P ∧ Q) ≡ ?", options: ["¬P ∧ ¬Q", "¬P ∨ ¬Q (De Morgan's)", "P ∨ Q", "¬P ∧ Q", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 71 – Ratios & Proportions
        71: [
            // Quest 1
            MathExamQuestion(id: "math_71_p1_q1", topicId: 71, prompt: "A bag has 3 red balls and 5 blue balls. What is the ratio of red to blue?", options: ["5:3", "3:5", "3:8", "5:8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p1_q2", topicId: 71, prompt: "Simplify the ratio 6:9.", options: ["3:4", "2:3", "3:6", "1:3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p1_q3", topicId: 71, prompt: "Which ratio is equivalent to 1:2?", options: ["2:6", "3:6", "4:6", "2:3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p1_q4", topicId: 71, prompt: "In a class the ratio of boys to girls is 2:3. If there are 12 boys, how many girls are there?", options: ["8", "15", "18", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p1_q5", topicId: 71, prompt: "Simplify the ratio 20:25.", options: ["4:5", "5:4", "4:6", "2:5", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 2
            MathExamQuestion(id: "math_71_p2_q1", topicId: 71, prompt: "A recipe uses 1 cup sugar for every 3 cups flour. If you use 4 cups sugar, how many cups of flour do you need?", options: ["8", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p2_q2", topicId: 71, prompt: "Are 2:3 and 8:12 equivalent ratios?", options: ["No", "Yes", "Only if both are simplified", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p2_q3", topicId: 71, prompt: "Fill in the blank: 3:7 = 9:___", options: ["21", "18", "14", "27", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_71_p2_q4", topicId: 71, prompt: "Paint is mixed in ratio 2:5 (red:white). You need 14 litres of white. How many litres of red?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p2_q5", topicId: 71, prompt: "What is 3:4 expressed as a fraction (part to whole)?", options: ["3/4", "3/7", "4/7", "4/3", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "math_71_p3_q1", topicId: 71, prompt: "Simplify 18:24.", options: ["3:4", "6:8", "9:12", "2:3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_71_p3_q2", topicId: 71, prompt: "If 5:x = 10:6, then x = ___", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_71_p3_q3", topicId: 71, prompt: "Share 60 sweets in ratio 2:3. The smaller share is:", options: ["20", "24", "30", "36", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_71_p3_q4", topicId: 71, prompt: "A map scale is 1:50 000. A distance of 2 cm on the map represents ___ km in real life.", options: ["0.1 km", "0.5 km", "1 km", "5 km", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p3_q5", topicId: 71, prompt: "If a:b = 5:2 and a = 20, then b = ___", options: ["6", "7", "8", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "math_71_p4_q1", topicId: 71, prompt: "Share £90 in ratio 1:2. The larger share is:", options: ["£30", "£45", "£60", "£70", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p4_q2", topicId: 71, prompt: "x:y = 3:8. If x = 15, y = ___", options: ["30", "36", "40", "45", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p4_q3", topicId: 71, prompt: "Three people share a prize in ratio 1:2:3. The largest share of £120 is:", options: ["£20", "£40", "£60", "£80", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p4_q4", topicId: 71, prompt: "Ratio 5:4 — if the total quantity is 72, the larger part is:", options: ["32", "36", "40", "45", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_71_p4_q5", topicId: 71, prompt: "A car travels 240 km in 4 hours. At the same rate, how far does it travel in 7 hours?", options: ["360 km", "400 km", "420 km", "480 km", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 72 – Negative Numbers
        72: [
            // Quest 1
            MathExamQuestion(id: "math_72_p1_q1", topicId: 72, prompt: "Which number is smaller: −3 or −8?", options: ["−3", "−8", "They are equal", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p1_q2", topicId: 72, prompt: "Order from smallest to largest: −2, 4, −6, 0", options: ["−6, −2, 0, 4", "4, 0, −2, −6", "0, −2, −6, 4", "−2, −6, 0, 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_72_p1_q3", topicId: 72, prompt: "The temperature is 2°C and drops by 7°C. What is the new temperature?", options: ["9°C", "−5°C", "5°C", "−9°C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p1_q4", topicId: 72, prompt: "On a number line, −5 is to the ___ of 0.", options: ["right", "left", "above", "below", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p1_q5", topicId: 72, prompt: "What is −3 + 8?", options: ["−11", "−5", "5", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "math_72_p2_q1", topicId: 72, prompt: "What is −7 + 3?", options: ["10", "4", "−4", "−10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_72_p2_q2", topicId: 72, prompt: "What is 4 − 9?", options: ["5", "13", "−5", "−13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_72_p2_q3", topicId: 72, prompt: "What is −4 − 5?", options: ["1", "−1", "9", "−9", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_72_p2_q4", topicId: 72, prompt: "The temperature at midnight is −6°C. By noon it has risen 10°C. What is the noon temperature?", options: ["4°C", "−4°C", "16°C", "−16°C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_72_p2_q5", topicId: 72, prompt: "Which is greater: −15 or −9?", options: ["−15", "−9", "They are equal", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "math_72_p3_q1", topicId: 72, prompt: "−6 + 10 = ___", options: ["−16", "−4", "4", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_72_p3_q2", topicId: 72, prompt: "5 − (−3) = ___", options: ["2", "−2", "8", "−8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_72_p3_q3", topicId: 72, prompt: "−4 × (−5) = ___", options: ["−20", "−9", "9", "20", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_72_p3_q4", topicId: 72, prompt: "−15 ÷ 3 = ___", options: ["5", "−5", "45", "−45", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p3_q5", topicId: 72, prompt: "−8 − (−2) = ___", options: ["−10", "10", "−6", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "math_72_p4_q1", topicId: 72, prompt: "−4 + 11 = ___", options: ["7", "15", "−15", "−7", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_72_p4_q2", topicId: 72, prompt: "−10 + 25 − 8 = ___", options: ["7", "−7", "43", "−43", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_72_p4_q3", topicId: 72, prompt: "−6 × 4 = ___", options: ["24", "−24", "10", "−10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p4_q4", topicId: 72, prompt: "−5 × (−6) = ___", options: ["−30", "30", "−11", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_72_p4_q5", topicId: 72, prompt: "(−4)² = ___", options: ["−16", "16", "8", "−8", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 73 – Statistics & Graphs
        73: [
            // Quest 1
            MathExamQuestion(id: "math_73_p1_q1", topicId: 73, prompt: "A bar chart shows apples: 6, bananas: 9, oranges: 3. Which fruit is most popular?", options: ["Apples", "Oranges", "Bananas", "All equal", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p1_q2", topicId: 73, prompt: "What is the mean of 4, 6, 8, 10?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_73_p1_q3", topicId: 73, prompt: "In a pictogram, one star = 5 votes. A film has 4 stars. How many votes?", options: ["4", "10", "20", "25", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p1_q4", topicId: 73, prompt: "What is the mean of 5, 15, 25?", options: ["10", "15", "20", "25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_73_p1_q5", topicId: 73, prompt: "A bar chart scale goes up in 10s. A bar reaches the 4th line. What value does it show?", options: ["4", "30", "40", "50", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "math_73_p2_q1", topicId: 73, prompt: "What is the mean of 2, 4, 6, 8, 10?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p2_q2", topicId: 73, prompt: "Find the median of: 3, 7, 1, 9, 5.", options: ["1", "5", "7", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_73_p2_q3", topicId: 73, prompt: "What is the mode of: 4, 7, 4, 9, 4, 7?", options: ["4", "7", "9", "4 and 7", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_73_p2_q4", topicId: 73, prompt: "The range of 3, 8, 5, 12, 1 is:", options: ["9", "10", "11", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p2_q5", topicId: 73, prompt: "Five students scored: 7, 9, 5, 8, 6. What is the mean?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 3
            MathExamQuestion(id: "math_73_p3_q1", topicId: 73, prompt: "Mean of 5, 10, 15, 20, 25 = ___", options: ["12", "13", "15", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p3_q2", topicId: 73, prompt: "Median of 2, 5, 8, 11, 14 = ___", options: ["5", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p3_q3", topicId: 73, prompt: "Mode of 3, 6, 3, 9, 6, 3 = ___", options: ["3", "6", "9", "3 and 6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_73_p3_q4", topicId: 73, prompt: "Mean of 6 numbers is 10. Total sum = ___", options: ["16", "30", "60", "100", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p3_q5", topicId: 73, prompt: "Range of 14, 8, 20, 5, 17 = ___", options: ["10", "12", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "math_73_p4_q1", topicId: 73, prompt: "Mean of 60, 70, 80, 90, 100 = ___", options: ["75", "80", "85", "90", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_73_p4_q2", topicId: 73, prompt: "Mean = 12, n = 5. Four values: 9, 14, 11, 13. Fifth value = ___", options: ["11", "12", "13", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p4_q3", topicId: 73, prompt: "Median of 4, 7, 2, 9, 5, 1, 8 = ___", options: ["4", "5", "7", "2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_73_p4_q4", topicId: 73, prompt: "Range of 12, 27, 6, 19, 34 = ___", options: ["21", "25", "28", "34", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_73_p4_q5", topicId: 73, prompt: "Mean of 11, 17, 14, 20 = ___", options: ["14", "15", "15.5", "16", "I don't know / Wasn't taught"], correctIndex: 3),
        ],

        // MARK: Topic 74 – Probability
        74: [
            // Quest 1
            MathExamQuestion(id: "math_74_p1_q1", topicId: 74, prompt: "A bag has 3 red and 7 blue counters. What is the probability of picking red?", options: ["3/10", "7/10", "3/7", "1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_74_p1_q2", topicId: 74, prompt: "A fair coin is flipped. What is P(heads)?", options: ["1/4", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_74_p1_q3", topicId: 74, prompt: "A die is rolled. What is P(rolling a 6)?", options: ["1/2", "1/3", "1/4", "1/6", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_74_p1_q4", topicId: 74, prompt: "A spinner has 4 equal sections: red, blue, green, yellow. P(green) = ___", options: ["1/8", "1/4", "1/3", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p1_q5", topicId: 74, prompt: "P(impossible event) = ___", options: ["0", "1/2", "1", "Cannot say", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 2
            MathExamQuestion(id: "math_74_p2_q1", topicId: 74, prompt: "A die is rolled. P(even number) = ___", options: ["1/6", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_74_p2_q2", topicId: 74, prompt: "A bag has 5 red, 3 blue, 2 green. P(not red) = ___", options: ["1/2", "1/3", "2/3", "3/5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_74_p2_q3", topicId: 74, prompt: "If P(rain) = 0.3, then P(no rain) = ___", options: ["0.3", "0.6", "0.7", "1.3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_74_p2_q4", topicId: 74, prompt: "A jar has 2 yellow and 8 purple sweets. P(yellow) = ___", options: ["1/4", "1/5", "2/8", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p2_q5", topicId: 74, prompt: "P(certain event) = ___", options: ["0", "0.5", "1", "Cannot say", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "math_74_p3_q1", topicId: 74, prompt: "A die is rolled. P(greater than 4) = ___", options: ["1/6", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p3_q2", topicId: 74, prompt: "P(A) = 3/5. P(not A) = ___", options: ["2/5", "3/5", "5/3", "1/5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_74_p3_q3", topicId: 74, prompt: "Flip two coins. P(both heads) = ___", options: ["1/2", "1/3", "1/4", "1/8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_74_p3_q4", topicId: 74, prompt: "A bag has 4 red, 4 blue. Two draws with replacement. P(both red) = ___", options: ["1/2", "1/4", "1/6", "1/8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p3_q5", topicId: 74, prompt: "P(A) = 0.4, P(B) = 0.5, A and B are mutually exclusive. P(A or B) = ___", options: ["0.2", "0.5", "0.9", "0.1", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "math_74_p4_q1", topicId: 74, prompt: "P(A) = 1/3, P(B) = 1/4. P(A and B) if independent = ___", options: ["7/12", "1/12", "1/6", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p4_q2", topicId: 74, prompt: "Out of 200 trials a 6 appeared 40 times. Experimental P(6) = ___", options: ["1/6", "1/5", "2/5", "4/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_74_p4_q3", topicId: 74, prompt: "P(at least one head in 2 flips) = ___", options: ["1/4", "1/2", "3/4", "1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_74_p4_q4", topicId: 74, prompt: "Roll two dice. P(sum = 7) = ___", options: ["1/6", "6/36", "7/36", "Both 1/6 and 6/36", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_74_p4_q5", topicId: 74, prompt: "P(A) = 0.6, P(B|A) = 0.5. P(A and B) = ___", options: ["0.1", "0.3", "0.5", "0.6", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 75 – Patterns & Sequences
        75: [
            // Quest 1
            MathExamQuestion(id: "math_75_p1_q1", topicId: 75, prompt: "What comes next? 3, 6, 9, 12, ___", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p1_q2", topicId: 75, prompt: "What is the rule? 1, 4, 7, 10, 13, ...", options: ["Add 2", "Add 3", "Add 4", "Multiply by 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p1_q3", topicId: 75, prompt: "What comes next? 25, 20, 15, 10, ___", options: ["6", "4", "5", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p1_q4", topicId: 75, prompt: "Find the missing number: 8, ___, 24, 32, 40", options: ["12", "14", "16", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p1_q5", topicId: 75, prompt: "What is the rule for 5, 10, 20, 40?", options: ["Add 5", "Add 10", "Multiply by 2", "Multiply by 3", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "math_75_p2_q1", topicId: 75, prompt: "What are the next two terms? 2, 5, 8, 11, ___, ___", options: ["13, 15", "14, 17", "14, 16", "13, 16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p2_q2", topicId: 75, prompt: "In the sequence 4, 8, 16, 32, what is the 6th term?", options: ["64", "96", "128", "256", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p2_q3", topicId: 75, prompt: "What is the missing term? 1, 1, 2, 3, 5, ___, 13", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p2_q4", topicId: 75, prompt: "Arithmetic sequence: first term 7, common difference 4. What is the 5th term?", options: ["23", "27", "31", "35", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_75_p2_q5", topicId: 75, prompt: "Geometric sequence: first term 3, ratio 3. What is the 4th term?", options: ["27", "54", "81", "243", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "math_75_p3_q1", topicId: 75, prompt: "nth term = 5n − 2. What is the 6th term?", options: ["25", "28", "30", "32", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p3_q2", topicId: 75, prompt: "Sequence: 6, 11, 16, 21. nth term = ___", options: ["4n + 2", "5n + 1", "5n − 1", "6n − 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p3_q3", topicId: 75, prompt: "nth term = 3n + 4. Which term equals 25?", options: ["5th", "6th", "7th", "8th", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p3_q4", topicId: 75, prompt: "1, 4, 9, 16, 25 … These are called:", options: ["Triangular numbers", "Cube numbers", "Square numbers", "Prime numbers", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p3_q5", topicId: 75, prompt: "Geometric sequence: 2, 6, 18, 54, ___", options: ["108", "162", "180", "216", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "math_75_p4_q1", topicId: 75, prompt: "nth term = 4n − 3. What is the 8th term?", options: ["27", "29", "31", "33", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p4_q2", topicId: 75, prompt: "Sequence: 10, 7, 4, 1, −2 … nth term = ___", options: ["−3n + 13", "3n − 7", "−3n + 12", "10 − 3n", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_75_p4_q3", topicId: 75, prompt: "Is 100 a term in the sequence nth term = 7n + 2?", options: ["Yes, it is the 14th term", "No", "Yes, it is the 13th term", "Yes, it is the 15th term", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_75_p4_q4", topicId: 75, prompt: "nth term = n² + 1. What is the 5th term?", options: ["21", "24", "26", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_75_p4_q5", topicId: 75, prompt: "Sum of first 5 terms of 2, 4, 6, 8, 10 = ___", options: ["25", "28", "30", "32", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 76 – Area & Volume
        76: [
            // Quest 1
            MathExamQuestion(id: "math_76_p1_q1", topicId: 76, prompt: "What is the area of a rectangle 5 cm wide and 3 cm tall?", options: ["8 cm²", "15 cm²", "16 cm²", "30 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_76_p1_q2", topicId: 76, prompt: "What unit do we use to measure area?", options: ["cm", "cm²", "cm³", "kg", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_76_p1_q3", topicId: 76, prompt: "A square has side 4 cm. What is its area?", options: ["8 cm²", "12 cm²", "16 cm²", "20 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p1_q4", topicId: 76, prompt: "Area of a triangle = ½ × base × height. Base = 6, height = 4. Area = ___", options: ["12 cm²", "24 cm²", "10 cm²", "8 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_76_p1_q5", topicId: 76, prompt: "A rectangle has area 24 cm² and width 4 cm. Its length = ___", options: ["4 cm", "6 cm", "8 cm", "20 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 2
            MathExamQuestion(id: "math_76_p2_q1", topicId: 76, prompt: "Area of a parallelogram = base × height. Base = 8, height = 5. Area = ___", options: ["13 cm²", "26 cm²", "40 cm²", "80 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p2_q2", topicId: 76, prompt: "A cuboid is 4 cm × 3 cm × 2 cm. What is its volume?", options: ["9 cm³", "18 cm³", "24 cm³", "48 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p2_q3", topicId: 76, prompt: "What unit do we use for volume?", options: ["cm", "cm²", "cm³", "m²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p2_q4", topicId: 76, prompt: "A cube has side 3 cm. Its volume = ___", options: ["9 cm³", "18 cm³", "27 cm³", "6 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p2_q5", topicId: 76, prompt: "Area of a triangle with base 10 cm and height 7 cm = ___", options: ["35 cm²", "70 cm²", "17 cm²", "50 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 3
            MathExamQuestion(id: "math_76_p3_q1", topicId: 76, prompt: "Area of rectangle: l = 12, w = 7. Area = ___", options: ["38 cm²", "76 cm²", "84 cm²", "19 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p3_q2", topicId: 76, prompt: "V = l × w × h: 6 × 5 × 4 = ___", options: ["60 cm³", "120 cm³", "90 cm³", "150 cm³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_76_p3_q3", topicId: 76, prompt: "If V = 90 cm³ and base area = 15 cm², height = ___", options: ["4 cm", "5 cm", "6 cm", "7 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p3_q4", topicId: 76, prompt: "Area of compound shape: a 6×4 rectangle with a 2×3 rectangle removed. Area = ___", options: ["18 cm²", "24 cm²", "20 cm²", "22 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_76_p3_q5", topicId: 76, prompt: "A cube with side 5 cm. Volume = ___", options: ["25 cm³", "75 cm³", "100 cm³", "125 cm³", "I don't know / Wasn't taught"], correctIndex: 3),
            // Quest 4
            MathExamQuestion(id: "math_76_p4_q1", topicId: 76, prompt: "Area of a trapezium = ½ × (a + b) × h. a = 5, b = 9, h = 4. Area = ___", options: ["24 cm²", "28 cm²", "32 cm²", "36 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_76_p4_q2", topicId: 76, prompt: "Volume = 360 cm³, l = 10 cm, w = 6 cm. h = ___", options: ["4 cm", "5 cm", "6 cm", "8 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_76_p4_q3", topicId: 76, prompt: "If each side of a cube doubles, its volume is multiplied by ___", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_76_p4_q4", topicId: 76, prompt: "Area of a circle ≈ π × r². r = 7, π ≈ 3.14. Area ≈ ___", options: ["44 cm²", "154 cm²", "49 cm²", "22 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_76_p4_q5", topicId: 76, prompt: "Two cuboids: A = 3×4×5, B = 6×2×5. Which has larger volume?", options: ["A (60 cm³)", "B (60 cm³)", "They are equal (60 cm³ each)", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Topic 77 – Factors & Multiples
        77: [
            // Quest 1
            MathExamQuestion(id: "math_77_p1_q1", topicId: 77, prompt: "Which of these is a factor of 18?", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p1_q2", topicId: 77, prompt: "How many factors does 10 have?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p1_q3", topicId: 77, prompt: "Which of these is a multiple of 6?", options: ["14", "20", "24", "32", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p1_q4", topicId: 77, prompt: "Is 42 a multiple of 7?", options: ["Yes", "No", "Only sometimes", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_77_p1_q5", topicId: 77, prompt: "List all factors of 15. How many are there?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 2
            MathExamQuestion(id: "math_77_p2_q1", topicId: 77, prompt: "What are all factors of 20?", options: ["1,2,4,5,10,20", "1,2,4,10,20", "1,4,5,10,20", "2,4,5,10,20", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_77_p2_q2", topicId: 77, prompt: "What is the HCF (Highest Common Factor) of 12 and 16?", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p2_q3", topicId: 77, prompt: "What is the LCM (Lowest Common Multiple) of 4 and 10?", options: ["14", "20", "40", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_77_p2_q4", topicId: 77, prompt: "Which of these numbers is prime?", options: ["9", "15", "19", "21", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p2_q5", topicId: 77, prompt: "Which is composite (not prime)?", options: ["11", "13", "21", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 3
            MathExamQuestion(id: "math_77_p3_q1", topicId: 77, prompt: "HCF(24, 36) = ___", options: ["6", "8", "12", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p3_q2", topicId: 77, prompt: "LCM(6, 9) = ___", options: ["3", "18", "27", "54", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_77_p3_q3", topicId: 77, prompt: "4 × ___ = 36", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p3_q4", topicId: 77, prompt: "HCF(30, 45) = ___", options: ["5", "10", "15", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p3_q5", topicId: 77, prompt: "LCM(4, 6, 8) = ___", options: ["12", "24", "48", "96", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 4
            MathExamQuestion(id: "math_77_p4_q1", topicId: 77, prompt: "HCF(60, 90) = ___", options: ["10", "15", "20", "30", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_77_p4_q2", topicId: 77, prompt: "LCM(12, 15) = ___", options: ["30", "45", "60", "180", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p4_q3", topicId: 77, prompt: "___ × 8 = 72", options: ["7", "8", "9", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_77_p4_q4", topicId: 77, prompt: "HCF(48, 72) = ___", options: ["8", "12", "18", "24", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "math_77_p4_q5", topicId: 77, prompt: "LCM(5, 8, 10) = ___", options: ["20", "40", "80", "400", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 78 – Introduction to Coordinates
        78: [
            // Quest 1
            MathExamQuestion(id: "math_78_p1_q1", topicId: 78, prompt: "In a coordinate pair (x, y), which number tells you how far to go right?", options: ["y", "x", "Either", "Neither", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p1_q2", topicId: 78, prompt: "What are the coordinates of the origin?", options: ["(1, 1)", "(0, 1)", "(0, 0)", "(1, 0)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_78_p1_q3", topicId: 78, prompt: "A point is 4 units right and 2 units up. Its coordinates are:", options: ["(2, 4)", "(4, 2)", "(0, 4)", "(2, 0)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p1_q4", topicId: 78, prompt: "What are the coordinates of a point 3 right and 0 up?", options: ["(0, 3)", "(3, 3)", "(3, 0)", "(0, 0)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_78_p1_q5", topicId: 78, prompt: "Points A(1, 5) and B(1, 2) — are they on the same vertical line?", options: ["No", "Yes, same x-value", "Yes, same y-value", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 1),
            // Quest 2
            MathExamQuestion(id: "math_78_p2_q1", topicId: 78, prompt: "What are the coordinates of the point 0 right and 6 up?", options: ["(6, 0)", "(0, 6)", "(6, 6)", "(3, 6)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p2_q2", topicId: 78, prompt: "A square has corners at (1,1), (5,1), (5,5). What is the fourth corner?", options: ["(1, 5)", "(5, 1)", "(1, −5)", "(−1, 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_78_p2_q3", topicId: 78, prompt: "Which point is on the x-axis?", options: ["(0, 3)", "(3, 3)", "(3, 0)", "(0, 0)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_78_p2_q4", topicId: 78, prompt: "Which point is on the y-axis?", options: ["(4, 0)", "(0, 4)", "(4, 4)", "(2, 4)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p2_q5", topicId: 78, prompt: "The midpoint of (2, 4) and (6, 8) is:", options: ["(4, 6)", "(4, 4)", "(8, 12)", "(3, 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            // Quest 3
            MathExamQuestion(id: "math_78_p3_q1", topicId: 78, prompt: "Plot A(3, 2), B(7, 2), C(7, 6), D(3, 6). What shape do they make?", options: ["Triangle", "Rectangle", "Circle", "Pentagon", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p3_q2", topicId: 78, prompt: "Midpoint of (0, 0) and (8, 6) = ___", options: ["(4, 3)", "(8, 6)", "(4, 6)", "(3, 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_78_p3_q3", topicId: 78, prompt: "Distance between (1, 3) and (1, 8) = ___", options: ["3", "5", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p3_q4", topicId: 78, prompt: "A point at (5, 3) is moved 2 right and 4 up. New position = ___", options: ["(7, 7)", "(3, 7)", "(7, 1)", "(7, 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_78_p3_q5", topicId: 78, prompt: "Distance between (2, 5) and (6, 5) = ___", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            // Quest 4
            MathExamQuestion(id: "math_78_p4_q1", topicId: 78, prompt: "(4, 6) translated 3 left and 2 down → ___", options: ["(7, 8)", "(1, 4)", "(7, 4)", "(1, 8)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "math_78_p4_q2", topicId: 78, prompt: "Rectangle with corners (1,2), (5,2), (5,6), (1,6). What is its area?", options: ["8 units²", "12 units²", "16 units²", "24 units²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_78_p4_q3", topicId: 78, prompt: "Midpoint of (−2, 4) and (6, −2) = ___", options: ["(2, 1)", "(4, 2)", "(2, 2)", "(1, 2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "math_78_p4_q4", topicId: 78, prompt: "Distance from (0, 0) to (3, 4) = ___", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "math_78_p4_q5", topicId: 78, prompt: "A line segment has endpoints (1, 2) and (9, 2). Its midpoint is at x = ___", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
    ]

    /// Returns 5 MCQ practice questions for the given topic and quest number (1–4).
    static func mcqPracticeQuestions(for topicId: Int, questNumber: Int) -> [MathExamQuestion] {
        let all = mcqPracticeByTopic[topicId] ?? []
        guard !all.isEmpty else { return [] }
        let startIndex = (questNumber - 1) * questionsPerQuest
        let endIndex = min(startIndex + questionsPerQuest, all.count)
        guard startIndex < endIndex else { return [] }
        return Array(all[startIndex..<endIndex])
    }

    /// Returns true if topicId has questions in either the drag-and-drop bank or the MCQ bank.
    static func hasQuestions(for topicId: Int) -> Bool {
        !(practiceQuestionsByTopic[topicId] ?? []).isEmpty ||
        !(mcqPracticeByTopic[topicId] ?? []).isEmpty
    }

    /// Returns all topic IDs that have at least one question in either bank, sorted ascending.
    static func availableTopicIds() -> [Int] {
        let ids = Set(practiceQuestionsByTopic.keys).union(Set(mcqPracticeByTopic.keys))
        return ids.sorted()
    }

    // MARK: - Diagnostic

    // MARK: - Diagnostic Questions
    // 25 questions spanning Grade 1 → University.
    // They are ordered from easiest to hardest so that the score maps cleanly
    // to a recommended starting topic. See DiagnosticViewController.recommendedTopic().

    static let diagnosticQuestions: [DiagnosticQuestion] = [

        // ── LEVEL 1: Grade 1-2 – Basic Arithmetic ──────────────────────────
        DiagnosticQuestion(
            id: "diag_1",
            topicLabel: "Counting",
            prompt: "What number comes after 8?",
            options: ["7", "8", "9", "10", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "After 8 comes 9. We count one more each time."
        ),
        DiagnosticQuestion(
            id: "diag_2",
            topicLabel: "Addition",
            prompt: "What is 4 + 5?",
            options: ["7", "8", "9", "10", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "4 + 5 = 9."
        ),
        DiagnosticQuestion(
            id: "diag_3",
            topicLabel: "Subtraction",
            prompt: "What is 12 − 7?",
            options: ["3", "4", "5", "6", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "12 − 7 = 5."
        ),

        // ── LEVEL 2: Grade 2-3 – Multiplication & Division ─────────────────
        DiagnosticQuestion(
            id: "diag_4",
            topicLabel: "Multiplication",
            prompt: "What is 4 × 3?",
            options: ["9", "10", "11", "12", "I don't know / Wasn't taught"],
            correctIndex: 3,
            explanation: "4 × 3 = 12. Four groups of three."
        ),
        DiagnosticQuestion(
            id: "diag_5",
            topicLabel: "Division",
            prompt: "20 sweets are shared equally among 4 children. How many does each child get?",
            options: ["4", "5", "6", "8", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "20 ÷ 4 = 5. Each child gets 5 sweets."
        ),

        // ── LEVEL 3: Grade 3-4 – Place Value & Rounding ────────────────────
        DiagnosticQuestion(
            id: "diag_6",
            topicLabel: "Place Value",
            prompt: "What is the value of the digit 4 in the number 347?",
            options: ["4", "40", "400", "4,000", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "In 347, the digit 4 is in the tens place, so its value is 40."
        ),
        DiagnosticQuestion(
            id: "diag_7",
            topicLabel: "Rounding",
            prompt: "Round 673 to the nearest hundred.",
            options: ["600", "670", "700", "800", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "673 is closer to 700 than to 600. The tens digit 7 is ≥ 5, so we round up."
        ),

        // ── LEVEL 4: Grade 4-5 – Fractions (gateway concept) ───────────────
        DiagnosticQuestion(
            id: "diag_8",
            topicLabel: "Fractions",
            prompt: "Which fraction is equivalent to 2/4?",
            options: ["1/4", "1/3", "1/2", "3/4", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "2/4 simplifies to 1/2  -  divide numerator and denominator both by 2."
        ),
        DiagnosticQuestion(
            id: "diag_9",
            topicLabel: "Fractions",
            prompt: "What is 1/2 + 1/4?",
            options: ["2/6", "1/6", "3/4", "2/4", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "1/2 = 2/4, so 2/4 + 1/4 = 3/4."
        ),

        // ── LEVEL 5: Grade 5-6 – Decimals & Percentages ────────────────────
        DiagnosticQuestion(
            id: "diag_10",
            topicLabel: "Decimals",
            prompt: "What is 0.25 × 4?",
            options: ["0.5", "0.75", "1.0", "1.25", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "0.25 × 4 = 1.0. One quarter of something, taken four times, equals the whole."
        ),
        DiagnosticQuestion(
            id: "diag_11",
            topicLabel: "Percentages",
            prompt: "What is 15% of 60?",
            options: ["6", "9", "12", "15", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "10% of 60 = 6. 5% = 3. So 15% = 6 + 3 = 9."
        ),

        // ── LEVEL 6: Grade 6-7 – Ratios & Negative Numbers ─────────────────
        DiagnosticQuestion(
            id: "diag_12",
            topicLabel: "Ratios",
            prompt: "The ratio of cats to dogs is 2:3. If there are 6 cats, how many dogs are there?",
            options: ["7", "8", "9", "12", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "6 cats ÷ 2 = 3 (one unit). 3 units of dogs = 3 × 3 = 9."
        ),
        DiagnosticQuestion(
            id: "diag_13",
            topicLabel: "Negative Numbers",
            prompt: "What is −5 + 8?",
            options: ["3", "−3", "13", "−13", "I don't know / Wasn't taught"],
            correctIndex: 0,
            explanation: "Start at −5 and count 8 forwards: −5, −4, −3, −2, −1, 0, 1, 2, 3."
        ),

        // ── LEVEL 7: Grade 7-8 – Algebra & Probability ─────────────────────
        DiagnosticQuestion(
            id: "diag_14",
            topicLabel: "Algebra",
            prompt: "Solve for x:  2x + 5 = 13",
            options: ["3", "4", "5", "6", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "Subtract 5 from both sides: 2x = 8. Divide by 2: x = 4."
        ),
        DiagnosticQuestion(
            id: "diag_15",
            topicLabel: "Probability",
            prompt: "A bag has 3 red and 7 blue balls. What is the probability of picking a red ball?",
            options: ["3/7", "3/10", "7/10", "1/3", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "Probability = favourable ÷ total = 3 ÷ (3+7) = 3/10."
        ),

        // ── LEVEL 8: Grade 8-9 – Geometry & Systems ────────────────────────
        DiagnosticQuestion(
            id: "diag_16",
            topicLabel: "Pythagorean Theorem",
            prompt: "A right triangle has legs of 3 cm and 4 cm. What is the length of the hypotenuse?",
            options: ["5 cm", "6 cm", "7 cm", "√7 cm", "I don't know / Wasn't taught"],
            correctIndex: 0,
            explanation: "a² + b² = c² → 9 + 16 = 25 → c = √25 = 5 cm."
        ),
        DiagnosticQuestion(
            id: "diag_17",
            topicLabel: "Systems of Equations",
            prompt: "Solve:  x + y = 7  and  x − y = 1.  What is x?",
            options: ["3", "4", "5", "6", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "Add both equations: 2x = 8, so x = 4. Then y = 3."
        ),

        // ── LEVEL 9: Grade 9-10 – Quadratics & Trigonometry ────────────────
        DiagnosticQuestion(
            id: "diag_18",
            topicLabel: "Quadratic Equations",
            prompt: "What are the solutions to x² − 5x + 6 = 0?",
            options: ["x = 2 and x = 3", "x = 2 and x = 4", "x = 1 and x = 6", "x = 3 and x = 4", "I don't know / Wasn't taught"],
            correctIndex: 0,
            explanation: "Factor: (x−2)(x−3) = 0, so x = 2 or x = 3."
        ),
        DiagnosticQuestion(
            id: "diag_19",
            topicLabel: "Trigonometry",
            prompt: "In a right triangle, what is sin(30°)?",
            options: ["1/2", "√2/2", "√3/2", "1", "I don't know / Wasn't taught"],
            correctIndex: 0,
            explanation: "sin(30°) = 1/2. This is one of the key exact trig values."
        ),

        // ── LEVEL 10: Grade 10-11 – Functions & Statistics ──────────────────
        DiagnosticQuestion(
            id: "diag_20",
            topicLabel: "Functions",
            prompt: "If f(x) = 3x − 2, what is f(5)?",
            options: ["11", "12", "13", "15", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "f(5) = 3(5) − 2 = 15 − 2 = 13."
        ),
        DiagnosticQuestion(
            id: "diag_21",
            topicLabel: "Statistics",
            prompt: "What is the standard deviation measuring?",
            options: ["The middle value", "How spread out data is from the mean", "The most common value", "The largest minus the smallest value", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "Standard deviation measures the spread of data around the mean. Small SD = data clustered tightly."
        ),

        // ── LEVEL 11: Grade 11-12 – Logarithms & Sequences ─────────────────
        DiagnosticQuestion(
            id: "diag_22",
            topicLabel: "Logarithms",
            prompt: "What is log₁₀(1000)?",
            options: ["2", "3", "4", "10", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "log₁₀(1000) = 3 because 10³ = 1000."
        ),
        DiagnosticQuestion(
            id: "diag_23",
            topicLabel: "Sequences & Series",
            prompt: "A geometric sequence starts: 2, 6, 18, 54 … What is the sum of the first 5 terms?",
            options: ["122", "182", "242", "486", "I don't know / Wasn't taught"],
            correctIndex: 2,
            explanation: "5th term = 162. Sum = 2+6+18+54+162 = 242."
        ),

        // ── LEVEL 12: Calculus ──────────────────────────────────────────────
        DiagnosticQuestion(
            id: "diag_24",
            topicLabel: "Calculus: Derivatives",
            prompt: "What is the derivative of f(x) = x³ + 2x?",
            options: ["3x² + 2", "3x² + 2x", "x² + 2", "3x³ + 2", "I don't know / Wasn't taught"],
            correctIndex: 0,
            explanation: "Using the power rule: d/dx(x³) = 3x², d/dx(2x) = 2. So f'(x) = 3x² + 2."
        ),
        DiagnosticQuestion(
            id: "diag_25",
            topicLabel: "Calculus: Integration",
            prompt: "What is ∫ 2x dx?",
            options: ["x + C", "x² + C", "2x² + C", "x²/2 + C", "I don't know / Wasn't taught"],
            correctIndex: 1,
            explanation: "∫ 2x dx = x² + C. The power rule for integration: ∫ xⁿ dx = xⁿ⁺¹/(n+1)."
        )
    ]

    // MARK: - Practice Questions
    // Fully filled for Division topic (topic 5). Other topics can be added the same way.

    static let practiceQuestionsByTopic: [Int: [PracticeQuestion]] = [

        1: [
            // QUEST 1  -  Count 1–5, drag all to plate
            PracticeQuestion(id: "cnt_q1_1", topicId: 1, kind: .dragToPlate, objectType: .apple,  totalItems: 3,  selectedItems: 3,  prompt: "Count the apples. How many are there? Put them all on the plate.", wrongExplanation: "Count each apple one at a time. There are 3 apples.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q1_2", topicId: 1, kind: .dragToPlate, objectType: .cookie, totalItems: 4,  selectedItems: 4,  prompt: "How many cookies do you see? Drag all of them to the box.", wrongExplanation: "Count each cookie. There are 4 cookies.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "cnt_q1_3", topicId: 1, kind: .dragToPlate, objectType: .coin,   totalItems: 2,  selectedItems: 2,  prompt: "Count the coins and put them all in the basket.", wrongExplanation: "Count each coin. There are 2 coins.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "cnt_q1_4", topicId: 1, kind: .dragToPlate, objectType: .pencil, totalItems: 5,  selectedItems: 5,  prompt: "How many pencils are here? Drag all 5 to the plate.", wrongExplanation: "Count each pencil one by one. There are 5 pencils.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q1_5", topicId: 1, kind: .dragToPlate, objectType: .pizza,  totalItems: 1,  selectedItems: 1,  prompt: "There is 1 pizza slice. Drag it to the plate.", wrongExplanation: "There is only 1 pizza slice.", plateTitle: "Put it here", plateImageName: "dropzone_plate"),

            // QUEST 2  -  Count 5–8, drag all to plate
            PracticeQuestion(id: "cnt_q2_1", topicId: 1, kind: .dragToPlate, objectType: .apple,  totalItems: 5,  selectedItems: 5,  prompt: "Count all the apples and collect them on the plate.", wrongExplanation: "Count each apple. There are 5 apples.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q2_2", topicId: 1, kind: .dragToPlate, objectType: .cookie, totalItems: 6,  selectedItems: 6,  prompt: "How many cookies are there? Drag all of them to the box.", wrongExplanation: "Count each cookie. There are 6 cookies.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "cnt_q2_3", topicId: 1, kind: .dragToPlate, objectType: .coin,   totalItems: 7,  selectedItems: 7,  prompt: "Count the coins and put them all in the basket.", wrongExplanation: "Count each coin. There are 7 coins.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "cnt_q2_4", topicId: 1, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 8,  prompt: "There are 8 lego bricks. Collect all of them on the plate.", wrongExplanation: "Count each brick. There are 8 bricks.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q2_5", topicId: 1, kind: .dragToPlate, objectType: .pencil, totalItems: 6,  selectedItems: 6,  prompt: "Count all the pencils and drag them to the box.", wrongExplanation: "Count each pencil. There are 6 pencils.", plateTitle: "Put them here", plateImageName: "dropzone_box"),

            // QUEST 3  -  Pick a specific count from a bigger group
            PracticeQuestion(id: "cnt_q3_1", topicId: 1, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 5,  prompt: "There are many apples. Count out 5 and put them on the plate.", wrongExplanation: "Count exactly 5 apples and drag them to the plate.", plateTitle: "Put 5 here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q3_2", topicId: 1, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 6,  prompt: "Pick 6 cookies from the group and put them in the box.", wrongExplanation: "Count exactly 6 cookies and drag them to the box.", plateTitle: "Put 6 here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "cnt_q3_3", topicId: 1, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 7,  prompt: "Take 7 coins from the pile and put them in the basket.", wrongExplanation: "Count exactly 7 coins and drag them to the basket.", plateTitle: "Put 7 here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "cnt_q3_4", topicId: 1, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 4,  prompt: "Take 4 pencils from the group and put them on the plate.", wrongExplanation: "Count exactly 4 pencils and drag them to the plate.", plateTitle: "Put 4 here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q3_5", topicId: 1, kind: .dragToPlate, objectType: .pizza,  totalItems: 9,  selectedItems: 8,  prompt: "Count out 8 pizza slices and put them on the plate.", wrongExplanation: "Count exactly 8 slices and drag them to the plate.", plateTitle: "Put 8 here", plateImageName: "dropzone_plate"),

            // QUEST 4  -  Larger counts and mixed
            PracticeQuestion(id: "cnt_q4_1", topicId: 1, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 8,  prompt: "Count out 8 apples and collect them on the plate.", wrongExplanation: "Count exactly 8 apples and drag them to the plate.", plateTitle: "Put 8 here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q4_2", topicId: 1, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 9,  prompt: "Pick 9 cookies and put them in the box.", wrongExplanation: "Count exactly 9 cookies and drag them to the box.", plateTitle: "Put 9 here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "cnt_q4_3", topicId: 1, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 10, prompt: "Count all 10 coins and put every one in the basket.", wrongExplanation: "Count all 10 coins and drag each one to the basket.", plateTitle: "Put 10 here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "cnt_q4_4", topicId: 1, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 7,  prompt: "Take 7 lego bricks and put them on the plate.", wrongExplanation: "Count exactly 7 bricks and drag them to the plate.", plateTitle: "Put 7 here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "cnt_q4_5", topicId: 1, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 6,  prompt: "Count out 6 pencils and put them in the box.", wrongExplanation: "Count exactly 6 pencils and drag them to the box.", plateTitle: "Put 6 here", plateImageName: "dropzone_box")
        ],

        5: [
            // QUEST 1
            PracticeQuestion(id: "div_q1_1", topicId: 5, kind: .dragToPlate, objectType: .cookie, totalItems: 6, selectedItems: 3, prompt: "There are 6 cookies. Two kids want the same number. Move one kid's cookies.", wrongExplanation: "6 cookies shared equally between 2 kids means 3 cookies each.", plateTitle: "One kid's cookies", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q1_2", topicId: 5, kind: .dragToPlate, objectType: .apple, totalItems: 8, selectedItems: 4, prompt: "There are 8 apples. Two baskets should get the same number. Move the apples for one basket.", wrongExplanation: "8 apples shared equally into 2 baskets means 4 apples in each basket.", plateTitle: "One basket", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q1_3", topicId: 5, kind: .dragToPlate, objectType: .coin, totalItems: 10, selectedItems: 5, prompt: "There are 10 coins. Two pirates share them fairly. Move one pirate's share.", wrongExplanation: "10 coins shared equally between 2 pirates means 5 coins each.", plateTitle: "One pirate's share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q1_4", topicId: 5, kind: .dragToPlate, objectType: .pencil, totalItems: 12, selectedItems: 6, prompt: "There are 12 pencils. Two kids get the same amount. Move one kid's pencils.", wrongExplanation: "12 pencils shared equally between 2 kids means 6 pencils each.", plateTitle: "One kid's pencils", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q1_5", topicId: 5, kind: .dragToPlate, objectType: .pizza, totalItems: 14, selectedItems: 7, prompt: "There are 14 pizza slices. Two tables should get the same number. Move the slices for one table.", wrongExplanation: "14 slices shared equally between 2 tables means 7 slices each.", plateTitle: "One table", plateImageName: "dropzone_plate"),

            // QUEST 2
            PracticeQuestion(id: "div_q2_1", topicId: 5, kind: .dragToPlate, objectType: .cookie, totalItems: 8, selectedItems: 4, prompt: "8 cookies are shared by 2 kids. Show one kid's share.", wrongExplanation: "8 shared equally by 2 means 4 each.", plateTitle: "One share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q2_2", topicId: 5, kind: .dragToPlate, objectType: .apple, totalItems: 12, selectedItems: 6, prompt: "12 apples are shared fairly by 2 baskets. Show one basket's apples.", wrongExplanation: "12 shared equally by 2 means 6 each.", plateTitle: "One basket", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q2_3", topicId: 5, kind: .dragToPlate, objectType: .coin, totalItems: 16, selectedItems: 8, prompt: "16 coins are shared by 2 pirates. Show one pirate's share.", wrongExplanation: "16 shared equally by 2 means 8 each.", plateTitle: "One pirate's share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q2_4", topicId: 5, kind: .dragToPlate, objectType: .pencil, totalItems: 18, selectedItems: 9, prompt: "18 pencils are shared fairly by 2 kids. Show one kid's pencils.", wrongExplanation: "18 shared equally by 2 means 9 each.", plateTitle: "One kid's pencils", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q2_5", topicId: 5, kind: .dragToPlate, objectType: .lego, totalItems: 20, selectedItems: 10, prompt: "20 lego bricks are shared by 2 builders. Show one builder's bricks.", wrongExplanation: "20 shared equally by 2 means 10 each.", plateTitle: "One builder's share", plateImageName: "dropzone_plate"),

            // QUEST 3
            PracticeQuestion(id: "div_q3_1", topicId: 5, kind: .dragToPlate, objectType: .cookie, totalItems: 9, selectedItems: 3, prompt: "9 cookies are shared equally by 3 kids. Show one kid's cookies.", wrongExplanation: "9 shared equally by 3 means 3 each.", plateTitle: "One kid's cookies", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q3_2", topicId: 5, kind: .dragToPlate, objectType: .apple, totalItems: 12, selectedItems: 4, prompt: "12 apples are shared equally by 3 baskets. Show one basket's apples.", wrongExplanation: "12 shared equally by 3 means 4 each.", plateTitle: "One basket", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q3_3", topicId: 5, kind: .dragToPlate, objectType: .coin, totalItems: 15, selectedItems: 5, prompt: "15 coins are shared equally by 3 pirates. Show one pirate's share.", wrongExplanation: "15 shared equally by 3 means 5 each.", plateTitle: "One pirate's share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q3_4", topicId: 5, kind: .dragToPlate, objectType: .pencil, totalItems: 18, selectedItems: 6, prompt: "18 pencils are shared equally by 3 kids. Show one kid's pencils.", wrongExplanation: "18 shared equally by 3 means 6 each.", plateTitle: "One kid's pencils", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q3_5", topicId: 5, kind: .dragToPlate, objectType: .pizza, totalItems: 21, selectedItems: 7, prompt: "21 pizza slices are shared equally by 3 tables. Show one table's slices.", wrongExplanation: "21 shared equally by 3 means 7 each.", plateTitle: "One table", plateImageName: "dropzone_plate"),

            // QUEST 4
            PracticeQuestion(id: "div_q4_1", topicId: 5, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3, prompt: "12 cookies are shared equally by 4 kids. Show one kid's cookies.", wrongExplanation: "12 shared equally by 4 means 3 each.", plateTitle: "One kid's cookies", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q4_2", topicId: 5, kind: .dragToPlate, objectType: .apple, totalItems: 16, selectedItems: 4, prompt: "16 apples are shared equally by 4 baskets. Show one basket's apples.", wrongExplanation: "16 shared equally by 4 means 4 each.", plateTitle: "One basket", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q4_3", topicId: 5, kind: .dragToPlate, objectType: .coin, totalItems: 20, selectedItems: 5, prompt: "20 coins are shared equally by 4 pirates. Show one pirate's share.", wrongExplanation: "20 shared equally by 4 means 5 each.", plateTitle: "One pirate's share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q4_4", topicId: 5, kind: .dragToPlate, objectType: .pencil, totalItems: 24, selectedItems: 6, prompt: "24 pencils are shared equally by 4 kids. Show one kid's pencils.", wrongExplanation: "24 shared equally by 4 means 6 each.", plateTitle: "One kid's pencils", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q4_5", topicId: 5, kind: .dragToPlate, objectType: .lego, totalItems: 28, selectedItems: 7, prompt: "28 lego bricks are shared equally by 4 builders. Show one builder's bricks.", wrongExplanation: "28 shared equally by 4 means 7 each.", plateTitle: "One builder's share", plateImageName: "dropzone_plate"),

            // QUEST 5
            PracticeQuestion(id: "div_q5_1", topicId: 5, kind: .dragToPlate, objectType: .cookie, totalItems: 15, selectedItems: 3, prompt: "15 cookies are shared equally by 5 kids. Show one kid's cookies.", wrongExplanation: "15 shared equally by 5 means 3 each.", plateTitle: "One kid's cookies", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q5_2", topicId: 5, kind: .dragToPlate, objectType: .apple, totalItems: 20, selectedItems: 4, prompt: "20 apples are shared equally by 5 baskets. Show one basket's apples.", wrongExplanation: "20 shared equally by 5 means 4 each.", plateTitle: "One basket", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q5_3", topicId: 5, kind: .dragToPlate, objectType: .coin, totalItems: 25, selectedItems: 5, prompt: "25 coins are shared equally by 5 pirates. Show one pirate's share.", wrongExplanation: "25 shared equally by 5 means 5 each.", plateTitle: "One pirate's share", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q5_4", topicId: 5, kind: .dragToPlate, objectType: .pencil, totalItems: 30, selectedItems: 6, prompt: "30 pencils are shared equally by 5 kids. Show one kid's pencils.", wrongExplanation: "30 shared equally by 5 means 6 each.", plateTitle: "One kid's pencils", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "div_q5_5", topicId: 5, kind: .dragToPlate, objectType: .pizza, totalItems: 35, selectedItems: 7, prompt: "35 pizza slices are shared equally by 5 tables. Show one table's slices.", wrongExplanation: "35 shared equally by 5 means 7 each.", plateTitle: "One table", plateImageName: "dropzone_plate")
        ],

        2: [
            // QUEST 1  -  sums 2–6, drag all
            PracticeQuestion(id: "add_q1_1", topicId: 2, kind: .dragToPlate, objectType: .apple,  totalItems: 3,  selectedItems: 3,  prompt: "You picked 1 apple and then 2 more. How many apples do you have? Put them all on the plate.", wrongExplanation: "1 + 2 = 3. Count all the apples together.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q1_2", topicId: 2, kind: .dragToPlate, objectType: .cookie, totalItems: 4,  selectedItems: 4,  prompt: "Mom baked 2 cookies and then 2 more. How many cookies are there? Put them all in the box.", wrongExplanation: "2 + 2 = 4. Count all the cookies together.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "add_q1_3", topicId: 2, kind: .dragToPlate, objectType: .lego,   totalItems: 5,  selectedItems: 5,  prompt: "You have 3 red bricks and 2 blue bricks. How many bricks in total? Put them all in the basket.", wrongExplanation: "3 + 2 = 5. Count all the bricks together.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "add_q1_4", topicId: 2, kind: .dragToPlate, objectType: .coin,   totalItems: 6,  selectedItems: 6,  prompt: "You found 4 coins on the table and 2 more in your pocket. How many coins do you have? Put them all on the plate.", wrongExplanation: "4 + 2 = 6. Count all the coins together.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q1_5", topicId: 2, kind: .dragToPlate, objectType: .pencil, totalItems: 2,  selectedItems: 2,  prompt: "You have 1 blue pencil and 1 yellow pencil. How many pencils is that? Put them all in the box.", wrongExplanation: "1 + 1 = 2. Count both pencils together.", plateTitle: "Put them here", plateImageName: "dropzone_box"),

            // QUEST 2  -  sums 5–10, drag all
            PracticeQuestion(id: "add_q2_1", topicId: 2, kind: .dragToPlate, objectType: .apple,  totalItems: 7,  selectedItems: 7,  prompt: "There are 3 green apples and 4 red apples in the bowl. How many apples altogether? Put them all on the plate.", wrongExplanation: "3 + 4 = 7. Add the green and red apples together.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q2_2", topicId: 2, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 8,  prompt: "You have 5 cookies and bake 3 more. How many cookies do you have now? Put them all in the basket.", wrongExplanation: "5 + 3 = 8. Count all the cookies together.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "add_q2_3", topicId: 2, kind: .dragToPlate, objectType: .pizza,  totalItems: 9,  selectedItems: 9,  prompt: "The chef made 4 pizza slices in the morning and 5 more in the afternoon. How many slices in total? Put them all on the plate.", wrongExplanation: "4 + 5 = 9. Add the morning and afternoon slices.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q2_4", topicId: 2, kind: .dragToPlate, objectType: .lego,   totalItems: 10, selectedItems: 10, prompt: "You built a tower with 6 bricks, then added 4 more. How many bricks did you use? Put them all in the box.", wrongExplanation: "6 + 4 = 10. Count all the bricks together.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "add_q2_5", topicId: 2, kind: .dragToPlate, objectType: .coin,   totalItems: 5,  selectedItems: 5,  prompt: "You have 2 coins in your left hand and 3 in your right hand. How many coins altogether? Put them all on the plate.", wrongExplanation: "2 + 3 = 5. Count all the coins together.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),

            // QUEST 3  -  sums 8–14, count out from slightly larger group
            PracticeQuestion(id: "add_q3_1", topicId: 2, kind: .dragToPlate, objectType: .apple,  totalItems: 12, selectedItems: 9,  prompt: "There are 5 apples in one bag and 4 in another. How many apples do you need? Drag exactly that many to the plate.", wrongExplanation: "5 + 4 = 9. You need to drag 9 apples.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q3_2", topicId: 2, kind: .dragToPlate, objectType: .cookie, totalItems: 14, selectedItems: 11, prompt: "You need 7 cookies for your friends and 4 more for your family. How many cookies should you take? Drag the right number to the basket.", wrongExplanation: "7 + 4 = 11. Drag exactly 11 cookies.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "add_q3_3", topicId: 2, kind: .dragToPlate, objectType: .pencil, totalItems: 15, selectedItems: 12, prompt: "You put 8 pencils in the jar and then added 4 more. How many pencils are in the jar now? Drag the right number to the box.", wrongExplanation: "8 + 4 = 12. Drag exactly 12 pencils.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "add_q3_4", topicId: 2, kind: .dragToPlate, objectType: .lego,   totalItems: 16, selectedItems: 13, prompt: "You have 6 yellow bricks and 7 blue bricks. How many bricks altogether? Drag that many to the basket.", wrongExplanation: "6 + 7 = 13. Drag exactly 13 bricks.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "add_q3_5", topicId: 2, kind: .dragToPlate, objectType: .coin,   totalItems: 16, selectedItems: 14, prompt: "You saved 9 coins and then found 5 more. How many coins do you have in total? Drag the right number to the plate.", wrongExplanation: "9 + 5 = 14. Drag exactly 14 coins.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),

            // QUEST 4  -  sums 10–16, count out from larger group
            PracticeQuestion(id: "add_q4_1", topicId: 2, kind: .dragToPlate, objectType: .pizza,  totalItems: 17, selectedItems: 12, prompt: "The kitchen has 7 cheese pizzas and 5 veggie pizzas. How many pizza slices are there? Drag the right number to the plate.", wrongExplanation: "7 + 5 = 12. Drag exactly 12 pizza slices.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q4_2", topicId: 2, kind: .dragToPlate, objectType: .apple,  totalItems: 18, selectedItems: 13, prompt: "One basket has 8 apples and another has 5. How many apples in total? Drag the right number to the plate.", wrongExplanation: "8 + 5 = 13. Drag exactly 13 apples.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "add_q4_3", topicId: 2, kind: .dragToPlate, objectType: .cookie, totalItems: 18, selectedItems: 14, prompt: "You baked 9 chocolate cookies and 5 vanilla cookies. How many cookies in all? Drag the right number to the basket.", wrongExplanation: "9 + 5 = 14. Drag exactly 14 cookies.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "add_q4_4", topicId: 2, kind: .dragToPlate, objectType: .coin,   totalItems: 18, selectedItems: 15, prompt: "You earned 8 coins doing chores and 7 coins for your birthday. How many coins do you have? Drag the right number to the box.", wrongExplanation: "8 + 7 = 15. Drag exactly 15 coins.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "add_q4_5", topicId: 2, kind: .dragToPlate, objectType: .lego,   totalItems: 18, selectedItems: 16, prompt: "You have 9 red bricks and 7 blue bricks. How many bricks altogether? Drag the right number to the basket.", wrongExplanation: "9 + 7 = 16. Drag exactly 16 bricks.", plateTitle: "Put them here", plateImageName: "dropzone_basket")
        ],

        3: [
            // QUEST 1  -  minuends 4–7, differences 1–3
            PracticeQuestion(id: "sub_q1_1", topicId: 3, kind: .dragToPlate, objectType: .apple,  totalItems: 4,  selectedItems: 3,  prompt: "There are 4 apples. You eat 1. How many are left? Drag the remaining apples to the plate.", wrongExplanation: "4 - 1 = 3. One apple was eaten, so 3 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q1_2", topicId: 3, kind: .dragToPlate, objectType: .cookie, totalItems: 5,  selectedItems: 3,  prompt: "You have 5 cookies. You give 2 to your friend. How many do you keep? Drag them to the box.", wrongExplanation: "5 - 2 = 3. Two cookies were given away, so 3 remain.", plateTitle: "Cookies left", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "sub_q1_3", topicId: 3, kind: .dragToPlate, objectType: .lego,   totalItems: 6,  selectedItems: 4,  prompt: "You have 6 bricks. You use 2 to build a wall. How many bricks do you still have? Drag them to the basket.", wrongExplanation: "6 - 2 = 4. Two bricks were used, so 4 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q1_4", topicId: 3, kind: .dragToPlate, objectType: .coin,   totalItems: 7,  selectedItems: 5,  prompt: "You have 7 coins. You spend 2 at the shop. How many coins are left? Drag them to the plate.", wrongExplanation: "7 - 2 = 5. Two coins were spent, so 5 remain.", plateTitle: "Coins left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q1_5", topicId: 3, kind: .dragToPlate, objectType: .pencil, totalItems: 6,  selectedItems: 5,  prompt: "You had 6 pencils. You lend 1 to a friend. How many pencils do you have left? Drag them to the box.", wrongExplanation: "6 - 1 = 5. One pencil was lent, so 5 remain.", plateTitle: "Pencils left", plateImageName: "dropzone_box"),

            // QUEST 2  -  minuends 6–10, differences 3–5
            PracticeQuestion(id: "sub_q2_1", topicId: 3, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 5,  prompt: "There are 8 apples in the basket. 3 roll away. How many apples are left? Drag them to the plate.", wrongExplanation: "8 - 3 = 5. Three apples rolled away, so 5 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q2_2", topicId: 3, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 5,  prompt: "You baked 9 cookies. Your family ate 4. How many are left? Drag them to the basket.", wrongExplanation: "9 - 4 = 5. Four cookies were eaten, so 5 remain.", plateTitle: "Cookies left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q2_3", topicId: 3, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 6,  prompt: "You have 10 coins. You buy a toy for 4 coins. How many coins do you have left? Drag them to the plate.", wrongExplanation: "10 - 4 = 6. Four coins were spent, so 6 remain.", plateTitle: "Coins left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q2_4", topicId: 3, kind: .dragToPlate, objectType: .pizza,  totalItems: 7,  selectedItems: 3,  prompt: "There are 7 pizza slices. Your friends eat 4. How many slices are left? Drag them to the box.", wrongExplanation: "7 - 4 = 3. Four slices were eaten, so 3 remain.", plateTitle: "Slices left", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "sub_q2_5", topicId: 3, kind: .dragToPlate, objectType: .lego,   totalItems: 9,  selectedItems: 4,  prompt: "You have 9 bricks. You share 5 with your brother. How many bricks do you keep? Drag them to the basket.", wrongExplanation: "9 - 5 = 4. Five bricks were shared, so 4 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),

            // QUEST 3  -  minuends 9–14, differences 4–7
            PracticeQuestion(id: "sub_q3_1", topicId: 3, kind: .dragToPlate, objectType: .apple,  totalItems: 11, selectedItems: 6,  prompt: "There are 11 apples. A bird takes away 5. How many apples remain? Drag them to the plate.", wrongExplanation: "11 - 5 = 6. Five apples were taken, so 6 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q3_2", topicId: 3, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 6,  prompt: "You start with 12 cookies. You give 6 to your class. How many are left? Drag them to the basket.", wrongExplanation: "12 - 6 = 6. Six cookies were given away, so 6 remain.", plateTitle: "Cookies left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q3_3", topicId: 3, kind: .dragToPlate, objectType: .coin,   totalItems: 13, selectedItems: 7,  prompt: "You had 13 coins. You lost 6 in the park. How many coins do you have now? Drag them to the box.", wrongExplanation: "13 - 6 = 7. Six coins were lost, so 7 remain.", plateTitle: "Coins left", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "sub_q3_4", topicId: 3, kind: .dragToPlate, objectType: .lego,   totalItems: 14, selectedItems: 7,  prompt: "You have 14 bricks. You use 7 to build a castle. How many are left over? Drag them to the basket.", wrongExplanation: "14 - 7 = 7. Seven bricks were used, so 7 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q3_5", topicId: 3, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 6,  prompt: "You have 10 pencils. Your teacher borrows 4. How many pencils do you have left? Drag them to the plate.", wrongExplanation: "10 - 4 = 6. Four pencils were borrowed, so 6 remain.", plateTitle: "Pencils left", plateImageName: "dropzone_plate"),

            // QUEST 4  -  minuends 11–16, differences 5–9
            PracticeQuestion(id: "sub_q4_1", topicId: 3, kind: .dragToPlate, objectType: .apple,  totalItems: 14, selectedItems: 6,  prompt: "The orchard had 14 apples. Workers picked 8. How many apples are still on the tree? Drag them to the plate.", wrongExplanation: "14 - 8 = 6. Eight apples were picked, so 6 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "sub_q4_2", topicId: 3, kind: .dragToPlate, objectType: .cookie, totalItems: 15, selectedItems: 7,  prompt: "You baked 15 cookies for a party. 8 were eaten right away. How many are left? Drag them to the basket.", wrongExplanation: "15 - 8 = 7. Eight cookies were eaten, so 7 remain.", plateTitle: "Cookies left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q4_3", topicId: 3, kind: .dragToPlate, objectType: .coin,   totalItems: 16, selectedItems: 9,  prompt: "You had 16 coins. You spent 7 at the fair. How many coins do you still have? Drag them to the box.", wrongExplanation: "16 - 7 = 9. Seven coins were spent, so 9 remain.", plateTitle: "Coins left", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "sub_q4_4", topicId: 3, kind: .dragToPlate, objectType: .lego,   totalItems: 13, selectedItems: 5,  prompt: "You had 13 bricks. Your sister borrowed 8. How many bricks do you have left? Drag them to the basket.", wrongExplanation: "13 - 8 = 5. Eight bricks were borrowed, so 5 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "sub_q4_5", topicId: 3, kind: .dragToPlate, objectType: .pizza,  totalItems: 12, selectedItems: 5,  prompt: "There were 12 pizza slices at the party. The guests ate 7. How many slices are left? Drag them to the plate.", wrongExplanation: "12 - 7 = 5. Seven slices were eaten, so 5 remain.", plateTitle: "Slices left", plateImageName: "dropzone_plate")
        ],

        4: [
            // QUEST 1  -  products ≤ 8
            PracticeQuestion(id: "mul_q1_1", topicId: 4, kind: .dragToPlate, objectType: .apple,  totalItems: 4,  selectedItems: 4,  prompt: "You have 2 bags with 2 apples each. How many apples in total? Put them all on the plate.", wrongExplanation: "2 × 2 = 4. Two groups of two equals four.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q1_2", topicId: 4, kind: .dragToPlate, objectType: .cookie, totalItems: 6,  selectedItems: 6,  prompt: "You have 2 plates with 3 cookies each. How many cookies altogether? Put them all in the basket.", wrongExplanation: "2 × 3 = 6. Two groups of three equals six.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q1_3", topicId: 4, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 8,  prompt: "You build 2 towers with 4 bricks each. How many bricks did you use? Put them all in the box.", wrongExplanation: "2 × 4 = 8. Two groups of four equals eight.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "mul_q1_4", topicId: 4, kind: .dragToPlate, objectType: .coin,   totalItems: 6,  selectedItems: 6,  prompt: "You find 3 piles of coins with 2 coins in each pile. How many coins is that? Put them all on the plate.", wrongExplanation: "3 × 2 = 6. Three groups of two equals six.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q1_5", topicId: 4, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 8,  prompt: "There are 4 pencil cases with 2 pencils each. How many pencils in total? Put them all in the basket.", wrongExplanation: "4 × 2 = 8. Four groups of two equals eight.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),

            // QUEST 2  -  products 9–15
            PracticeQuestion(id: "mul_q2_1", topicId: 4, kind: .dragToPlate, objectType: .apple,  totalItems: 9,  selectedItems: 9,  prompt: "You plant 3 rows of apple trees with 3 trees each. How many trees did you plant? Put them all on the plate.", wrongExplanation: "3 × 3 = 9. Three groups of three equals nine.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q2_2", topicId: 4, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 12, prompt: "You bake 3 trays of cookies with 4 cookies on each tray. How many cookies in all? Put them all in the basket.", wrongExplanation: "3 × 4 = 12. Three groups of four equals twelve.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q2_3", topicId: 4, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 10, prompt: "You earn 5 coins each day for 2 days. How many coins did you earn? Put them all on the plate.", wrongExplanation: "5 × 2 = 10. Five coins per day for two days equals ten.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q2_4", topicId: 4, kind: .dragToPlate, objectType: .lego,   totalItems: 15, selectedItems: 15, prompt: "You make 5 LEGO cars with 3 bricks each. How many bricks did you use? Put them all in the box.", wrongExplanation: "5 × 3 = 15. Five groups of three equals fifteen.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "mul_q2_5", topicId: 4, kind: .dragToPlate, objectType: .pizza,  totalItems: 12, selectedItems: 12, prompt: "There are 4 pizzas cut into 3 slices each. How many slices altogether? Put them all on the plate.", wrongExplanation: "4 × 3 = 12. Four groups of three equals twelve.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),

            // QUEST 3  -  products 12–18, count out from slightly larger group
            PracticeQuestion(id: "mul_q3_1", topicId: 4, kind: .dragToPlate, objectType: .apple,  totalItems: 16, selectedItems: 12, prompt: "You have 4 bags with 3 apples each. How many apples do you need? Drag exactly that many to the plate.", wrongExplanation: "4 × 3 = 12. Four groups of three equals twelve.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q3_2", topicId: 4, kind: .dragToPlate, objectType: .cookie, totalItems: 17, selectedItems: 15, prompt: "You put 5 cookies in each of 3 lunchboxes. How many cookies do you need? Drag the right number to the basket.", wrongExplanation: "5 × 3 = 15. Five cookies times three boxes equals fifteen.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q3_3", topicId: 4, kind: .dragToPlate, objectType: .coin,   totalItems: 17, selectedItems: 14, prompt: "You save 7 coins every week for 2 weeks. How many coins have you saved? Drag the right number to the box.", wrongExplanation: "7 × 2 = 14. Seven coins per week times two weeks equals fourteen.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "mul_q3_4", topicId: 4, kind: .dragToPlate, objectType: .lego,   totalItems: 18, selectedItems: 16, prompt: "You build 4 towers with 4 bricks each. How many bricks did you use? Drag exactly that many to the basket.", wrongExplanation: "4 × 4 = 16. Four groups of four equals sixteen.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q3_5", topicId: 4, kind: .dragToPlate, objectType: .pizza,  totalItems: 20, selectedItems: 18, prompt: "There are 6 pizza boxes with 3 slices in each. How many slices altogether? Drag that many to the plate.", wrongExplanation: "6 × 3 = 18. Six groups of three equals eighteen.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),

            // QUEST 4  -  products 15–24, count out from larger group
            PracticeQuestion(id: "mul_q4_1", topicId: 4, kind: .dragToPlate, objectType: .apple,  totalItems: 18, selectedItems: 15, prompt: "You pack 5 apples into each of 3 bags. How many apples did you pack? Drag the right number to the plate.", wrongExplanation: "5 × 3 = 15. Five apples per bag times three bags equals fifteen.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "mul_q4_2", topicId: 4, kind: .dragToPlate, objectType: .coin,   totalItems: 18, selectedItems: 16, prompt: "You earn 4 coins per chore and do 4 chores. How many coins did you earn? Drag the right number to the box.", wrongExplanation: "4 × 4 = 16. Four coins per chore times four chores equals sixteen.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "mul_q4_3", topicId: 4, kind: .dragToPlate, objectType: .lego,   totalItems: 20, selectedItems: 18, prompt: "You use 6 bricks to build each of 3 LEGO houses. How many bricks in total? Drag them to the basket.", wrongExplanation: "6 × 3 = 18. Six bricks per house times three houses equals eighteen.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q4_4", topicId: 4, kind: .dragToPlate, objectType: .cookie, totalItems: 22, selectedItems: 20, prompt: "You bake 4 batches of cookies with 5 cookies each. How many cookies did you bake? Drag the right number to the basket.", wrongExplanation: "4 × 5 = 20. Four batches of five cookies equals twenty.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "mul_q4_5", topicId: 4, kind: .dragToPlate, objectType: .pizza,  totalItems: 26, selectedItems: 24, prompt: "There are 4 tables with 6 pizza slices on each. How many slices in total? Drag the right number to the plate.", wrongExplanation: "4 × 6 = 24. Four tables with six slices each equals twenty-four.", plateTitle: "Put them here", plateImageName: "dropzone_plate")
        ],

        6: [
            // QUEST 1  -  simple addition word problems
            PracticeQuestion(id: "wp_q1_1", topicId: 6, kind: .dragToPlate, objectType: .apple,  totalItems: 7,  selectedItems: 5,  prompt: "Lily has 3 apples. Her mom gives her 2 more. How many apples does Lily have now? Drag that many to the plate.", wrongExplanation: "3 + 2 = 5. Lily started with 3 and got 2 more.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q1_2", topicId: 6, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 6,  prompt: "Tom baked 4 cookies in the morning and 2 more after lunch. How many cookies did he bake in all? Drag that many to the basket.", wrongExplanation: "4 + 2 = 6. Tom baked 4 then 2 more.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q1_3", topicId: 6, kind: .dragToPlate, objectType: .lego,   totalItems: 9,  selectedItems: 7,  prompt: "Sam has 5 LEGO bricks. His friend gives him 2 more. How many bricks does Sam have? Drag that many to the box.", wrongExplanation: "5 + 2 = 7. Sam had 5 and got 2 more.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "wp_q1_4", topicId: 6, kind: .dragToPlate, objectType: .coin,   totalItems: 9,  selectedItems: 8,  prompt: "Maya found 5 coins under the sofa and 3 more in her jacket. How many coins did she find altogether? Drag that many to the plate.", wrongExplanation: "5 + 3 = 8. Maya found 5 then 3 more coins.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q1_5", topicId: 6, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 4,  prompt: "Jake has 1 pencil. The teacher gives him 3 more. How many pencils does Jake have now? Drag that many to the basket.", wrongExplanation: "1 + 3 = 4. Jake had 1 and got 3 more.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),

            // QUEST 2  -  subtraction word problems
            PracticeQuestion(id: "wp_q2_1", topicId: 6, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 5,  prompt: "There are 8 apples on the tree. 3 fall down. How many apples are still on the tree? Drag that many to the plate.", wrongExplanation: "8 - 3 = 5. Three apples fell, so 5 are left.", plateTitle: "Apples on tree", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q2_2", topicId: 6, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 5,  prompt: "You had 9 cookies. You ate 4 of them. How many cookies are left? Drag them to the basket.", wrongExplanation: "9 - 4 = 5. Four cookies were eaten, so 5 remain.", plateTitle: "Cookies left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q2_3", topicId: 6, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 4,  prompt: "Mia had 10 coins. She spent 6 at the market. How many coins does she have left? Drag them to the box.", wrongExplanation: "10 - 6 = 4. Six coins were spent, so 4 remain.", plateTitle: "Coins left", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "wp_q2_4", topicId: 6, kind: .dragToPlate, objectType: .pizza,  totalItems: 7,  selectedItems: 3,  prompt: "The pizza had 7 slices. Your family ate 4. How many slices are left? Drag them to the plate.", wrongExplanation: "7 - 4 = 3. Four slices were eaten, so 3 remain.", plateTitle: "Slices left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q2_5", topicId: 6, kind: .dragToPlate, objectType: .lego,   totalItems: 10, selectedItems: 6,  prompt: "You had 10 bricks. You used 4 to build a fence. How many bricks are left? Drag them to the basket.", wrongExplanation: "10 - 4 = 6. Four bricks were used, so 6 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),

            // QUEST 3  -  mixed addition/subtraction/multiplication
            PracticeQuestion(id: "wp_q3_1", topicId: 6, kind: .dragToPlate, objectType: .apple,  totalItems: 15, selectedItems: 12, prompt: "A tree had 15 apples. Birds ate 3. How many apples are left on the tree? Drag them to the plate.", wrongExplanation: "15 - 3 = 12. Three apples were eaten, so 12 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q3_2", topicId: 6, kind: .dragToPlate, objectType: .cookie, totalItems: 16, selectedItems: 12, prompt: "You bake 3 batches of 4 cookies each for a party. How many cookies did you bake? Drag that many to the basket.", wrongExplanation: "3 × 4 = 12. Three batches of four cookies is twelve.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q3_3", topicId: 6, kind: .dragToPlate, objectType: .coin,   totalItems: 17, selectedItems: 13, prompt: "You earned 8 coins on Monday and 5 coins on Tuesday. How many coins did you earn in total? Drag that many to the box.", wrongExplanation: "8 + 5 = 13. Add both days' coins together.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "wp_q3_4", topicId: 6, kind: .dragToPlate, objectType: .lego,   totalItems: 18, selectedItems: 14, prompt: "You had 18 bricks but used 4 to fix your car. How many bricks do you have left? Drag them to the basket.", wrongExplanation: "18 - 4 = 14. Four bricks were used, so 14 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q3_5", topicId: 6, kind: .dragToPlate, objectType: .pizza,  totalItems: 18, selectedItems: 15, prompt: "There are 5 friends, and each gets 3 pizza slices. How many slices do you need in total? Drag that many to the plate.", wrongExplanation: "5 × 3 = 15. Five friends times three slices each equals fifteen.", plateTitle: "Put them here", plateImageName: "dropzone_plate"),

            // QUEST 4  -  harder word problems
            PracticeQuestion(id: "wp_q4_1", topicId: 6, kind: .dragToPlate, objectType: .apple,  totalItems: 18, selectedItems: 14, prompt: "A farmer had 20 apples. He sold 6 at the market. How many apples does he have left? Drag that many to the plate.", wrongExplanation: "20 - 6 = 14. Six were sold, so 14 remain.", plateTitle: "Apples left", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "wp_q4_2", topicId: 6, kind: .dragToPlate, objectType: .cookie, totalItems: 18, selectedItems: 16, prompt: "You bake 4 trays with 4 cookies each. How many cookies do you have? Drag that many to the basket.", wrongExplanation: "4 × 4 = 16. Four trays of four cookies equals sixteen.", plateTitle: "Put them here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q4_3", topicId: 6, kind: .dragToPlate, objectType: .coin,   totalItems: 18, selectedItems: 16, prompt: "You had 7 coins. You earned 9 more doing chores. How many coins do you have now? Drag them to the box.", wrongExplanation: "7 + 9 = 16. Add what you had plus what you earned.", plateTitle: "Put them here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "wp_q4_4", topicId: 6, kind: .dragToPlate, objectType: .lego,   totalItems: 18, selectedItems: 15, prompt: "You had 20 bricks. You gave 5 to your sister. How many bricks do you have left? Drag that many to the basket.", wrongExplanation: "20 - 5 = 15. Five bricks were given away, so 15 remain.", plateTitle: "Bricks left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "wp_q4_5", topicId: 6, kind: .dragToPlate, objectType: .pizza,  totalItems: 18, selectedItems: 18, prompt: "You order 3 pizzas, each cut into 6 slices. How many slices do you have in total? Drag them all to the plate.", wrongExplanation: "3 × 6 = 18. Three pizzas times six slices each equals eighteen.", plateTitle: "Put them here", plateImageName: "dropzone_plate")
        ],

        // MARK: Topic 7  -  Fractions

        7: [
            // QUEST 1  -  Half of a group
            PracticeQuestion(id: "fr_q1_1", topicId: 7, kind: .dragToPlate, objectType: .apple,  totalItems: 6,  selectedItems: 3,  prompt: "There are 6 apples. Take half of them and put them on the plate.", wrongExplanation: "Half of 6 is 3. Divide 6 by 2 to get 3.", plateTitle: "Half goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q1_2", topicId: 7, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 4,  prompt: "There are 8 cookies. Put half of them in the box.", wrongExplanation: "Half of 8 is 4. Divide 8 by 2 to get 4.", plateTitle: "Half goes here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "fr_q1_3", topicId: 7, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 5,  prompt: "You have 10 coins. Put half in the basket.", wrongExplanation: "Half of 10 is 5. Divide 10 by 2 to get 5.", plateTitle: "Half goes here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "fr_q1_4", topicId: 7, kind: .dragToPlate, objectType: .lego,   totalItems: 4,  selectedItems: 2,  prompt: "There are 4 lego bricks. Take half and put them on the plate.", wrongExplanation: "Half of 4 is 2. Divide 4 by 2 to get 2.", plateTitle: "Half goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q1_5", topicId: 7, kind: .dragToPlate, objectType: .pencil, totalItems: 12, selectedItems: 6,  prompt: "There are 12 pencils. Put half of them in the box.", wrongExplanation: "Half of 12 is 6. Divide 12 by 2 to get 6.", plateTitle: "Half goes here", plateImageName: "dropzone_box"),

            // QUEST 2  -  Quarter of a group (1/4)
            PracticeQuestion(id: "fr_q2_1", topicId: 7, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 2,  prompt: "There are 8 apples. One quarter (1/4) is on the plate. Drag that many.", wrongExplanation: "1/4 of 8 is 2. Divide 8 by 4 to get 2.", plateTitle: "Quarter here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q2_2", topicId: 7, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3,  prompt: "There are 12 cookies. Put 1/4 of them in the box.", wrongExplanation: "1/4 of 12 is 3. Divide 12 by 4 to get 3.", plateTitle: "Quarter here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "fr_q2_3", topicId: 7, kind: .dragToPlate, objectType: .coin,   totalItems: 16, selectedItems: 4,  prompt: "You have 16 coins. Put one quarter of them in the basket.", wrongExplanation: "1/4 of 16 is 4. Divide 16 by 4 to get 4.", plateTitle: "Quarter here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "fr_q2_4", topicId: 7, kind: .dragToPlate, objectType: .lego,   totalItems: 4,  selectedItems: 1,  prompt: "There are 4 lego bricks. One quarter means 1 brick. Put 1/4 on the plate.", wrongExplanation: "1/4 of 4 is 1. Divide 4 by 4 to get 1.", plateTitle: "Quarter here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q2_5", topicId: 7, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 2,  prompt: "There are 8 pencils. Put one quarter in the box.", wrongExplanation: "1/4 of 8 is 2. Divide 8 by 4 to get 2.", plateTitle: "Quarter here", plateImageName: "dropzone_box"),

            // QUEST 3  -  Third of a group (1/3)
            PracticeQuestion(id: "fr_q3_1", topicId: 7, kind: .dragToPlate, objectType: .apple,  totalItems: 9,  selectedItems: 3,  prompt: "There are 9 apples. One third (1/3) of them goes on the plate. Drag that many.", wrongExplanation: "1/3 of 9 is 3. Divide 9 by 3 to get 3.", plateTitle: "One third here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q3_2", topicId: 7, kind: .dragToPlate, objectType: .cookie, totalItems: 6,  selectedItems: 2,  prompt: "There are 6 cookies. Put 1/3 of them in the box.", wrongExplanation: "1/3 of 6 is 2. Divide 6 by 3 to get 2.", plateTitle: "One third here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "fr_q3_3", topicId: 7, kind: .dragToPlate, objectType: .coin,   totalItems: 12, selectedItems: 4,  prompt: "You have 12 coins. Put 1/3 of them in the basket.", wrongExplanation: "1/3 of 12 is 4. Divide 12 by 3 to get 4.", plateTitle: "One third here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "fr_q3_4", topicId: 7, kind: .dragToPlate, objectType: .lego,   totalItems: 15, selectedItems: 5,  prompt: "There are 15 lego bricks. Take one third and put them on the plate.", wrongExplanation: "1/3 of 15 is 5. Divide 15 by 3 to get 5.", plateTitle: "One third here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q3_5", topicId: 7, kind: .dragToPlate, objectType: .pencil, totalItems: 9,  selectedItems: 3,  prompt: "There are 9 pencils. Put 1/3 of them in the box.", wrongExplanation: "1/3 of 9 is 3. Divide 9 by 3 to get 3.", plateTitle: "One third here", plateImageName: "dropzone_box"),

            // QUEST 4  -  Mixed fractions (1/2, 1/4, 1/3, 3/4)
            PracticeQuestion(id: "fr_q4_1", topicId: 7, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 5,  prompt: "There are 10 apples. Put 1/2 of them on the plate.", wrongExplanation: "1/2 of 10 is 5. Half of 10 is 5.", plateTitle: "Half goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q4_2", topicId: 7, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3,  prompt: "There are 12 cookies. Put 1/4 of them in the box.", wrongExplanation: "1/4 of 12 is 3. Divide 12 by 4 to get 3.", plateTitle: "Quarter here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "fr_q4_3", topicId: 7, kind: .dragToPlate, objectType: .coin,   totalItems: 9,  selectedItems: 3,  prompt: "You have 9 coins. Put 1/3 of them in the basket.", wrongExplanation: "1/3 of 9 is 3. Divide 9 by 3 to get 3.", plateTitle: "One third here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "fr_q4_4", topicId: 7, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 6,  prompt: "There are 8 lego bricks. Three quarters (3/4) of them go on the plate. Drag that many.", wrongExplanation: "3/4 of 8 is 6. Three out of every four, so 6 out of 8.", plateTitle: "Three quarters", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "fr_q4_5", topicId: 7, kind: .dragToPlate, objectType: .pizza,  totalItems: 6,  selectedItems: 3,  prompt: "There are 6 pizza slices. Put half of them on the plate.", wrongExplanation: "1/2 of 6 is 3. Half of 6 is 3.", plateTitle: "Half goes here", plateImageName: "dropzone_plate")
        ],

        // MARK: Topic 8  -  Geometry

        8: [
            // QUEST 1  -  Count sides of triangles and squares
            PracticeQuestion(id: "geo_q1_1", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 6,  selectedItems: 3,  prompt: "A triangle has 3 sides. Drag 3 coins to show how many sides a triangle has.", wrongExplanation: "A triangle always has exactly 3 sides.", plateTitle: "Sides of a triangle", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q1_2", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 4,  prompt: "A square has 4 corners. Drag 4 coins to the box to show how many corners it has.", wrongExplanation: "A square has exactly 4 corners  -  one at each edge.", plateTitle: "Corners of a square", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "geo_q1_3", topicId: 8, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 4,  prompt: "A rectangle has 4 sides. Drag 4 lego bricks to show how many sides it has.", wrongExplanation: "A rectangle has 4 sides, just like a square.", plateTitle: "Sides of a rectangle", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "geo_q1_4", topicId: 8, kind: .dragToPlate, objectType: .pencil, totalItems: 6,  selectedItems: 3,  prompt: "A triangle has 3 corners. Drag 3 pencils to the plate.", wrongExplanation: "A triangle has 3 corners, one at each point.", plateTitle: "Corners of a triangle", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q1_5", topicId: 8, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 4,  prompt: "A square has 4 sides. Drag 4 apples to the box.", wrongExplanation: "A square has 4 equal sides.", plateTitle: "Sides of a square", plateImageName: "dropzone_box"),

            // QUEST 2  -  Pentagon (5 sides) and Hexagon (6 sides)
            PracticeQuestion(id: "geo_q2_1", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 5,  prompt: "A pentagon has 5 sides. Drag 5 coins to the plate to show how many sides.", wrongExplanation: "Penta means 5. A pentagon always has 5 sides.", plateTitle: "Sides of a pentagon", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q2_2", topicId: 8, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 6,  prompt: "A hexagon has 6 sides. Drag 6 cookies to the box.", wrongExplanation: "Hex means 6. A hexagon always has 6 sides.", plateTitle: "Sides of a hexagon", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "geo_q2_3", topicId: 8, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 5,  prompt: "A pentagon has 5 corners. Drag 5 lego bricks to the basket.", wrongExplanation: "A pentagon has 5 corners, one at each point.", plateTitle: "Corners of a pentagon", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "geo_q2_4", topicId: 8, kind: .dragToPlate, objectType: .pencil, totalItems: 9,  selectedItems: 6,  prompt: "A hexagon has 6 corners. Drag 6 pencils to the plate.", wrongExplanation: "A hexagon has 6 corners, one at each of its 6 points.", plateTitle: "Corners of a hexagon", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q2_5", topicId: 8, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 5,  prompt: "A stop sign is a pentagon  -  it has 5 sides. Drag 5 apples to show how many.", wrongExplanation: "A pentagon has 5 sides. Stop signs are pentagons!", plateTitle: "Sides of a pentagon", plateImageName: "dropzone_box"),

            // QUEST 3  -  Compare shapes and count mixed
            PracticeQuestion(id: "geo_q3_1", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 6,  selectedItems: 3,  prompt: "How many sides does a triangle have? Drag that many coins to the plate.", wrongExplanation: "A triangle has 3 sides.", plateTitle: "Count the sides", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q3_2", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 9,  selectedItems: 6,  prompt: "How many corners does a hexagon have? Drag that many coins to the box.", wrongExplanation: "A hexagon has 6 corners.", plateTitle: "Count the corners", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "geo_q3_3", topicId: 8, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 4,  prompt: "A diamond (rhombus) has 4 sides  -  just like a square. Drag 4 bricks to show this.", wrongExplanation: "A rhombus has 4 sides, same as a square.", plateTitle: "Sides of a diamond", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "geo_q3_4", topicId: 8, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 5,  prompt: "How many sides does a pentagon have? Drag that many pencils to the plate.", wrongExplanation: "A pentagon has 5 sides.", plateTitle: "Count the sides", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q3_5", topicId: 8, kind: .dragToPlate, objectType: .apple,  totalItems: 6,  selectedItems: 3,  prompt: "A shape has 3 sides and 3 corners. Drag 3 apples to show its sides.", wrongExplanation: "That shape is a triangle  -  it has 3 sides and 3 corners.", plateTitle: "It's a triangle!", plateImageName: "dropzone_box"),

            // QUEST 4  -  Adding sides of two shapes
            PracticeQuestion(id: "geo_q4_1", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 9,  selectedItems: 7,  prompt: "A triangle has 3 sides and a square has 4 sides. How many sides in total? Drag that many coins.", wrongExplanation: "3 + 4 = 7. Triangle's 3 sides plus square's 4 sides equals 7.", plateTitle: "Sides together", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q4_2", topicId: 8, kind: .dragToPlate, objectType: .lego,   totalItems: 9,  selectedItems: 6,  prompt: "How many corners does a hexagon have? Drag that many lego bricks to the box.", wrongExplanation: "A hexagon has 6 corners.", plateTitle: "Count the corners", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "geo_q4_3", topicId: 8, kind: .dragToPlate, objectType: .pencil, totalItems: 9,  selectedItems: 5,  prompt: "How many sides does a pentagon have? Drag that many pencils to the basket.", wrongExplanation: "A pentagon has 5 sides.", plateTitle: "Count the sides", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "geo_q4_4", topicId: 8, kind: .dragToPlate, objectType: .apple,  totalItems: 9,  selectedItems: 6,  prompt: "Two triangles are put together. How many sides do both triangles have in total? Drag them.", wrongExplanation: "Each triangle has 3 sides. 3 + 3 = 6. Two triangles have 6 sides altogether.", plateTitle: "Total sides", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "geo_q4_5", topicId: 8, kind: .dragToPlate, objectType: .coin,   totalItems: 9,  selectedItems: 9,  prompt: "A hexagon has 6 corners. Add a triangle's 3 corners. How many corners altogether? Drag them all.", wrongExplanation: "6 + 3 = 9. Hexagon has 6 corners plus triangle's 3 corners equals 9 total.", plateTitle: "Total corners", plateImageName: "dropzone_box")
        ],

        // MARK: Topic 9  -  Decimals

        9: [
            // QUEST 1  -  0.5 means half
            PracticeQuestion(id: "dec_q1_1", topicId: 9, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 5,  prompt: "0.5 means half. What is 0.5 of 10 apples? Drag them to the plate.", wrongExplanation: "0.5 is the same as 1/2. Half of 10 is 5.", plateTitle: "0.5 of apples", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q1_2", topicId: 9, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 4,  prompt: "What is 0.5 of 8 cookies? (Half of 8.) Drag them to the box.", wrongExplanation: "0.5 means half. Half of 8 is 4.", plateTitle: "0.5 of cookies", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "dec_q1_3", topicId: 9, kind: .dragToPlate, objectType: .coin,   totalItems: 6,  selectedItems: 3,  prompt: "0.5 of 6 coins is 3. Drag those 3 coins to the basket.", wrongExplanation: "0.5 means half. Half of 6 is 3.", plateTitle: "0.5 of coins", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "dec_q1_4", topicId: 9, kind: .dragToPlate, objectType: .lego,   totalItems: 12, selectedItems: 6,  prompt: "What is 0.5 of 12 lego bricks? Drag that many to the plate.", wrongExplanation: "0.5 means half. Half of 12 is 6.", plateTitle: "0.5 of bricks", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q1_5", topicId: 9, kind: .dragToPlate, objectType: .pizza,  totalItems: 4,  selectedItems: 2,  prompt: "0.5 of 4 pizza slices is 2. Drag them to the plate.", wrongExplanation: "0.5 means half. Half of 4 is 2.", plateTitle: "0.5 of pizza", plateImageName: "dropzone_plate"),

            // QUEST 2  -  0.25 means one quarter
            PracticeQuestion(id: "dec_q2_1", topicId: 9, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 2,  prompt: "0.25 means one quarter. What is 0.25 of 8 apples? Drag them to the plate.", wrongExplanation: "0.25 is the same as 1/4. One quarter of 8 is 2.", plateTitle: "0.25 of apples", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q2_2", topicId: 9, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3,  prompt: "0.25 of 12 cookies is 3. Drag 3 cookies to the box.", wrongExplanation: "0.25 means 1/4. One quarter of 12 is 3.", plateTitle: "0.25 of cookies", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "dec_q2_3", topicId: 9, kind: .dragToPlate, objectType: .coin,   totalItems: 16, selectedItems: 4,  prompt: "What is 0.25 of 16 coins? (16 ÷ 4 = 4.) Drag 4 coins to the basket.", wrongExplanation: "0.25 means 1/4. One quarter of 16 is 4.", plateTitle: "0.25 of coins", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "dec_q2_4", topicId: 9, kind: .dragToPlate, objectType: .lego,   totalItems: 4,  selectedItems: 1,  prompt: "0.25 of 4 lego bricks is 1. Drag 1 brick to the plate.", wrongExplanation: "0.25 means 1/4. One quarter of 4 is 1.", plateTitle: "0.25 of bricks", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q2_5", topicId: 9, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 2,  prompt: "What is 0.25 of 8 pencils? Drag them to the box.", wrongExplanation: "0.25 means 1/4. One quarter of 8 is 2.", plateTitle: "0.25 of pencils", plateImageName: "dropzone_box"),

            // QUEST 3  -  0.1, 0.2, 0.3 (tenths)
            PracticeQuestion(id: "dec_q3_1", topicId: 9, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 1,  prompt: "0.1 means 1 out of 10. Drag 1 apple to show 0.1 of 10 apples.", wrongExplanation: "0.1 = one tenth. One tenth of 10 is 1.", plateTitle: "0.1 of apples", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q3_2", topicId: 9, kind: .dragToPlate, objectType: .cookie, totalItems: 10, selectedItems: 2,  prompt: "0.2 means 2 out of 10. Drag 2 cookies to show 0.2 of 10 cookies.", wrongExplanation: "0.2 = two tenths. Two tenths of 10 is 2.", plateTitle: "0.2 of cookies", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "dec_q3_3", topicId: 9, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 3,  prompt: "0.3 means 3 out of 10. Drag 3 coins to show 0.3 of 10 coins.", wrongExplanation: "0.3 = three tenths. Three tenths of 10 is 3.", plateTitle: "0.3 of coins", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "dec_q3_4", topicId: 9, kind: .dragToPlate, objectType: .lego,   totalItems: 10, selectedItems: 5,  prompt: "0.5 means 5 out of 10. Drag 5 lego bricks to show 0.5 of 10 bricks.", wrongExplanation: "0.5 = five tenths = half. Five tenths of 10 is 5.", plateTitle: "0.5 of bricks", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q3_5", topicId: 9, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 4,  prompt: "0.4 means 4 out of 10. Drag 4 pencils to show 0.4 of 10 pencils.", wrongExplanation: "0.4 = four tenths. Four tenths of 10 is 4.", plateTitle: "0.4 of pencils", plateImageName: "dropzone_box"),

            // QUEST 4  -  Mixed decimals
            PracticeQuestion(id: "dec_q4_1", topicId: 9, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 4,  prompt: "What is 0.5 of 8 apples? (Half of 8.) Drag them to the plate.", wrongExplanation: "0.5 means half. Half of 8 is 4.", plateTitle: "0.5 of apples", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q4_2", topicId: 9, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3,  prompt: "What is 0.25 of 12 cookies? (One quarter.) Drag them to the box.", wrongExplanation: "0.25 = 1/4. One quarter of 12 is 3.", plateTitle: "0.25 of cookies", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "dec_q4_3", topicId: 9, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 3,  prompt: "0.3 of 10 coins is 3. Drag 3 coins to the basket.", wrongExplanation: "0.3 = three tenths. Three tenths of 10 is 3.", plateTitle: "0.3 of coins", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "dec_q4_4", topicId: 9, kind: .dragToPlate, objectType: .lego,   totalItems: 10, selectedItems: 5,  prompt: "What is 0.5 of 10 lego bricks? Drag them to the plate.", wrongExplanation: "0.5 means half. Half of 10 is 5.", plateTitle: "0.5 of bricks", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "dec_q4_5", topicId: 9, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 2,  prompt: "0.25 of 8 pencils is 2. Drag 2 pencils to the box.", wrongExplanation: "0.25 = 1/4. One quarter of 8 is 2.", plateTitle: "0.25 of pencils", plateImageName: "dropzone_box")
        ],

        // MARK: Topic 10  -  Algebra

        10: [
            // QUEST 1  -  Find the missing number (addition)
            PracticeQuestion(id: "alg_q1_1", topicId: 10, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 4,  prompt: "? + 3 = 7. What is the missing number? Drag that many apples to the plate.", wrongExplanation: "7 - 3 = 4. The missing number is 4.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q1_2", topicId: 10, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 5,  prompt: "? + 4 = 9. What number is missing? Drag that many cookies to the box.", wrongExplanation: "9 - 4 = 5. The missing number is 5.", plateTitle: "Missing number", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "alg_q1_3", topicId: 10, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 6,  prompt: "? + 2 = 8. Find the missing number and drag that many coins to the basket.", wrongExplanation: "8 - 2 = 6. The missing number is 6.", plateTitle: "Missing number", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "alg_q1_4", topicId: 10, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 3,  prompt: "? + 5 = 8. What is the missing number? Drag that many lego bricks to the plate.", wrongExplanation: "8 - 5 = 3. The missing number is 3.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q1_5", topicId: 10, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 4,  prompt: "? + 6 = 10. Find the missing number. Drag that many pencils to the box.", wrongExplanation: "10 - 6 = 4. The missing number is 4.", plateTitle: "Missing number", plateImageName: "dropzone_box"),

            // QUEST 2  -  Find the missing number (more addition with bigger totals)
            PracticeQuestion(id: "alg_q2_1", topicId: 10, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 7,  prompt: "? + 3 = 10. Find the missing number. Drag that many apples to the plate.", wrongExplanation: "10 - 3 = 7. The missing number is 7.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q2_2", topicId: 10, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 7,  prompt: "? + 5 = 12. What is missing? Drag that many cookies to the box.", wrongExplanation: "12 - 5 = 7. The missing number is 7.", plateTitle: "Missing number", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "alg_q2_3", topicId: 10, kind: .dragToPlate, objectType: .coin,   totalItems: 11, selectedItems: 6,  prompt: "5 + ? = 11. Find the missing number. Drag that many coins to the basket.", wrongExplanation: "11 - 5 = 6. The missing number is 6.", plateTitle: "Missing number", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "alg_q2_4", topicId: 10, kind: .dragToPlate, objectType: .lego,   totalItems: 9,  selectedItems: 3,  prompt: "? + 6 = 9. Drag that many lego bricks to the plate.", wrongExplanation: "9 - 6 = 3. The missing number is 3.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q2_5", topicId: 10, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 7,  prompt: "3 + ? = 10. Find the missing number. Drag that many pencils to the box.", wrongExplanation: "10 - 3 = 7. The missing number is 7.", plateTitle: "Missing number", plateImageName: "dropzone_box"),

            // QUEST 3  -  Missing factor in multiplication
            PracticeQuestion(id: "alg_q3_1", topicId: 10, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 4,  prompt: "? × 2 = 8. What is the missing number? Drag that many apples to the plate.", wrongExplanation: "8 ÷ 2 = 4. The missing number is 4.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q3_2", topicId: 10, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 3,  prompt: "3 × ? = 9. Find the missing number. Drag that many cookies to the box.", wrongExplanation: "9 ÷ 3 = 3. The missing number is 3.", plateTitle: "Missing number", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "alg_q3_3", topicId: 10, kind: .dragToPlate, objectType: .coin,   totalItems: 12, selectedItems: 4,  prompt: "? × 3 = 12. What number is missing? Drag that many coins to the basket.", wrongExplanation: "12 ÷ 3 = 4. The missing number is 4.", plateTitle: "Missing number", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "alg_q3_4", topicId: 10, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 2,  prompt: "4 × ? = 8. Find the missing number. Drag that many lego bricks to the plate.", wrongExplanation: "8 ÷ 4 = 2. The missing number is 2.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q3_5", topicId: 10, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 2,  prompt: "? × 5 = 10. Find the missing number. Drag that many pencils to the box.", wrongExplanation: "10 ÷ 5 = 2. The missing number is 2.", plateTitle: "Missing number", plateImageName: "dropzone_box"),

            // QUEST 4  -  Mixed unknown operations
            PracticeQuestion(id: "alg_q4_1", topicId: 10, kind: .dragToPlate, objectType: .apple,  totalItems: 11, selectedItems: 7,  prompt: "? + 4 = 11. Find the missing number. Drag that many apples to the plate.", wrongExplanation: "11 - 4 = 7. The missing number is 7.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q4_2", topicId: 10, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 5,  prompt: "8 - ? = 3. What is the missing number? Drag that many cookies to the box.", wrongExplanation: "8 - 3 = 5. The missing number is 5.", plateTitle: "Missing number", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "alg_q4_3", topicId: 10, kind: .dragToPlate, objectType: .coin,   totalItems: 15, selectedItems: 5,  prompt: "? × 3 = 15. Find the missing number. Drag that many coins to the basket.", wrongExplanation: "15 ÷ 3 = 5. The missing number is 5.", plateTitle: "Missing number", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "alg_q4_4", topicId: 10, kind: .dragToPlate, objectType: .lego,   totalItems: 6,  selectedItems: 3,  prompt: "12 ÷ ? = 4. Find the missing number. Drag that many lego bricks to the plate.", wrongExplanation: "12 ÷ 4 = 3. The missing number is 3.", plateTitle: "Missing number", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "alg_q4_5", topicId: 10, kind: .dragToPlate, objectType: .pencil, totalItems: 15, selectedItems: 8,  prompt: "? + 7 = 15. Find the missing number. Drag that many pencils to the box.", wrongExplanation: "15 - 7 = 8. The missing number is 8.", plateTitle: "Missing number", plateImageName: "dropzone_box")
        ],

        // MARK: Topic 11  -  Percentages

        11: [
            // QUEST 1  -  50% (half)
            PracticeQuestion(id: "pct_q1_1", topicId: 11, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 5,  prompt: "50% means half. What is 50% of 10 apples? Drag them to the plate.", wrongExplanation: "50% is the same as half. Half of 10 is 5.", plateTitle: "50% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q1_2", topicId: 11, kind: .dragToPlate, objectType: .cookie, totalItems: 8,  selectedItems: 4,  prompt: "50% of 8 cookies is 4. Drag 4 cookies to the box.", wrongExplanation: "50% means half. Half of 8 is 4.", plateTitle: "50% goes here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "pct_q1_3", topicId: 11, kind: .dragToPlate, objectType: .coin,   totalItems: 12, selectedItems: 6,  prompt: "What is 50% of 12 coins? Drag them to the basket.", wrongExplanation: "50% means half. Half of 12 is 6.", plateTitle: "50% goes here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "pct_q1_4", topicId: 11, kind: .dragToPlate, objectType: .lego,   totalItems: 6,  selectedItems: 3,  prompt: "50% of 6 lego bricks is 3. Drag 3 bricks to the plate.", wrongExplanation: "50% means half. Half of 6 is 3.", plateTitle: "50% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q1_5", topicId: 11, kind: .dragToPlate, objectType: .pizza,  totalItems: 4,  selectedItems: 2,  prompt: "What is 50% of 4 pizza slices? Drag them to the plate.", wrongExplanation: "50% means half. Half of 4 is 2.", plateTitle: "50% goes here", plateImageName: "dropzone_plate"),

            // QUEST 2  -  25% (one quarter)
            PracticeQuestion(id: "pct_q2_1", topicId: 11, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 2,  prompt: "25% means one quarter. What is 25% of 8 apples? Drag them to the plate.", wrongExplanation: "25% is 1/4. One quarter of 8 is 2.", plateTitle: "25% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q2_2", topicId: 11, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 3,  prompt: "25% of 12 cookies is 3. Drag 3 cookies to the box.", wrongExplanation: "25% is 1/4. One quarter of 12 is 3.", plateTitle: "25% goes here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "pct_q2_3", topicId: 11, kind: .dragToPlate, objectType: .coin,   totalItems: 16, selectedItems: 4,  prompt: "What is 25% of 16 coins? (16 ÷ 4 = 4.) Drag them to the basket.", wrongExplanation: "25% is 1/4. One quarter of 16 is 4.", plateTitle: "25% goes here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "pct_q2_4", topicId: 11, kind: .dragToPlate, objectType: .lego,   totalItems: 4,  selectedItems: 1,  prompt: "25% of 4 lego bricks is 1. Drag 1 brick to the plate.", wrongExplanation: "25% is 1/4. One quarter of 4 is 1.", plateTitle: "25% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q2_5", topicId: 11, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 2,  prompt: "What is 25% of 8 pencils? Drag them to the box.", wrongExplanation: "25% is 1/4. One quarter of 8 is 2.", plateTitle: "25% goes here", plateImageName: "dropzone_box"),

            // QUEST 3  -  10%, 20%, 30%
            PracticeQuestion(id: "pct_q3_1", topicId: 11, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 1,  prompt: "10% means 1 out of 10. What is 10% of 10 apples? Drag 1 apple to the plate.", wrongExplanation: "10% = 1/10. One tenth of 10 is 1.", plateTitle: "10% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q3_2", topicId: 11, kind: .dragToPlate, objectType: .cookie, totalItems: 10, selectedItems: 2,  prompt: "20% of 10 cookies is 2. Drag 2 cookies to the box.", wrongExplanation: "20% = 2/10. Two tenths of 10 is 2.", plateTitle: "20% goes here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "pct_q3_3", topicId: 11, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 3,  prompt: "30% of 10 coins is 3. Drag 3 coins to the basket.", wrongExplanation: "30% = 3/10. Three tenths of 10 is 3.", plateTitle: "30% goes here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "pct_q3_4", topicId: 11, kind: .dragToPlate, objectType: .lego,   totalItems: 10, selectedItems: 1,  prompt: "What is 10% of 10 lego bricks? Drag that many bricks to the plate.", wrongExplanation: "10% = 1/10. One tenth of 10 is 1.", plateTitle: "10% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q3_5", topicId: 11, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 5,  prompt: "50% of 10 pencils is 5. Drag them to the box.", wrongExplanation: "50% = half. Half of 10 is 5.", plateTitle: "50% goes here", plateImageName: "dropzone_box"),

            // QUEST 4  -  75% and mixed review
            PracticeQuestion(id: "pct_q4_1", topicId: 11, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 6,  prompt: "75% means three quarters. What is 75% of 8 apples? Drag 6 apples to the plate.", wrongExplanation: "75% = 3/4. Three quarters of 8 is 6.", plateTitle: "75% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q4_2", topicId: 11, kind: .dragToPlate, objectType: .cookie, totalItems: 12, selectedItems: 6,  prompt: "50% of 12 cookies is 6. Drag them to the box.", wrongExplanation: "50% means half. Half of 12 is 6.", plateTitle: "50% goes here", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "pct_q4_3", topicId: 11, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 2,  prompt: "25% of 8 coins is 2. Drag them to the basket.", wrongExplanation: "25% = 1/4. One quarter of 8 is 2.", plateTitle: "25% goes here", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "pct_q4_4", topicId: 11, kind: .dragToPlate, objectType: .lego,   totalItems: 12, selectedItems: 9,  prompt: "75% of 12 lego bricks is 9. Drag 9 bricks to the plate.", wrongExplanation: "75% = 3/4. Three quarters of 12 is 9.", plateTitle: "75% goes here", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "pct_q4_5", topicId: 11, kind: .dragToPlate, objectType: .pizza,  totalItems: 6,  selectedItems: 3,  prompt: "50% of 6 pizza slices is 3. Drag them to the plate.", wrongExplanation: "50% means half. Half of 6 is 3.", plateTitle: "50% goes here", plateImageName: "dropzone_plate")
        ],

        // MARK: Topic 12  -  Measurement

        12: [
            // QUEST 1  -  Area as rows × columns (small grids)
            PracticeQuestion(id: "msr_q1_1", topicId: 12, kind: .dragToPlate, objectType: .apple,  totalItems: 8,  selectedItems: 6,  prompt: "A garden has 2 rows with 3 flowers each. How many flowers in total? Drag that many to the plate.", wrongExplanation: "2 × 3 = 6. Two rows of three flowers equals six flowers.", plateTitle: "Flowers total", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q1_2", topicId: 12, kind: .dragToPlate, objectType: .cookie, totalItems: 9,  selectedItems: 8,  prompt: "A baking tray has 2 rows with 4 cookies each. How many cookies? Drag them to the box.", wrongExplanation: "2 × 4 = 8. Two rows of four cookies equals eight cookies.", plateTitle: "Cookies total", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "msr_q1_3", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 6,  prompt: "A chest has 3 rows with 2 coins each. How many coins in total? Drag them.", wrongExplanation: "3 × 2 = 6. Three rows of two coins equals six coins.", plateTitle: "Coins total", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "msr_q1_4", topicId: 12, kind: .dragToPlate, objectType: .lego,   totalItems: 6,  selectedItems: 4,  prompt: "A wall has 2 rows with 2 lego bricks each. How many bricks? Drag them to the plate.", wrongExplanation: "2 × 2 = 4. Two rows of two bricks equals four bricks.", plateTitle: "Bricks total", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q1_5", topicId: 12, kind: .dragToPlate, objectType: .pencil, totalItems: 10, selectedItems: 9,  prompt: "A shelf has 3 rows with 3 pencils each. How many pencils? Drag them to the box.", wrongExplanation: "3 × 3 = 9. Three rows of three pencils equals nine pencils.", plateTitle: "Pencils total", plateImageName: "dropzone_box"),

            // QUEST 2  -  Larger area grids
            PracticeQuestion(id: "msr_q2_1", topicId: 12, kind: .dragToPlate, objectType: .apple,  totalItems: 14, selectedItems: 12, prompt: "A field has 3 rows with 4 trees each. How many trees in total? Drag them to the plate.", wrongExplanation: "3 × 4 = 12. Three rows of four trees equals twelve trees.", plateTitle: "Trees total", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q2_2", topicId: 12, kind: .dragToPlate, objectType: .cookie, totalItems: 16, selectedItems: 15, prompt: "A bakery tray has 3 rows with 5 cookies each. How many cookies? Drag them to the box.", wrongExplanation: "3 × 5 = 15. Three rows of five cookies equals fifteen cookies.", plateTitle: "Cookies total", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "msr_q2_3", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 14, selectedItems: 12, prompt: "A grid has 4 rows with 3 coins each. How many coins? Drag them to the basket.", wrongExplanation: "4 × 3 = 12. Four rows of three coins equals twelve coins.", plateTitle: "Coins total", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "msr_q2_4", topicId: 12, kind: .dragToPlate, objectType: .lego,   totalItems: 18, selectedItems: 16, prompt: "A lego board has 4 rows with 4 bricks each. How many bricks? Drag them to the plate.", wrongExplanation: "4 × 4 = 16. Four rows of four bricks equals sixteen bricks.", plateTitle: "Bricks total", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q2_5", topicId: 12, kind: .dragToPlate, objectType: .pencil, totalItems: 14, selectedItems: 12, prompt: "A case has 2 rows with 6 pencils each. How many pencils? Drag them to the box.", wrongExplanation: "2 × 6 = 12. Two rows of six pencils equals twelve pencils.", plateTitle: "Pencils total", plateImageName: "dropzone_box"),

            // QUEST 3  -  Length and difference
            PracticeQuestion(id: "msr_q3_1", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 8,  selectedItems: 3,  prompt: "A pencil is 6 cm long. An eraser is 3 cm. How much longer is the pencil? Drag that many coins.", wrongExplanation: "6 - 3 = 3. The pencil is 3 cm longer than the eraser.", plateTitle: "Difference in cm", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q3_2", topicId: 12, kind: .dragToPlate, objectType: .lego,   totalItems: 8,  selectedItems: 5,  prompt: "A table is 8 units wide. A chair is 3 units wide. How many more units wide is the table? Drag them.", wrongExplanation: "8 - 3 = 5. The table is 5 units wider than the chair.", plateTitle: "Difference in units", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "msr_q3_3", topicId: 12, kind: .dragToPlate, objectType: .pencil, totalItems: 9,  selectedItems: 5,  prompt: "A ribbon is 9 cm. You cut 4 cm off. How long is the piece left? Drag that many pencils.", wrongExplanation: "9 - 4 = 5. After cutting 4 cm, 5 cm of ribbon is left.", plateTitle: "Ribbon left", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "msr_q3_4", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 7,  selectedItems: 4,  prompt: "A path is 7 steps long. Another is 3 steps. How much longer is the first path? Drag that many coins.", wrongExplanation: "7 - 3 = 4. The first path is 4 steps longer.", plateTitle: "Steps difference", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q3_5", topicId: 12, kind: .dragToPlate, objectType: .apple,  totalItems: 10, selectedItems: 4,  prompt: "A rope is 10 cm. You use 6 cm. How many cm are left? Drag that many apples.", wrongExplanation: "10 - 6 = 4. After using 6 cm, 4 cm of rope remains.", plateTitle: "Rope left", plateImageName: "dropzone_box"),

            // QUEST 4  -  Mixed measurement
            PracticeQuestion(id: "msr_q4_1", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 14, selectedItems: 12, prompt: "A rectangle is 3 units wide and 4 units tall. What is the area? (3 × 4 = 12.) Drag 12 coins.", wrongExplanation: "Area = width × height = 3 × 4 = 12 square units.", plateTitle: "Area in squares", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q4_2", topicId: 12, kind: .dragToPlate, objectType: .apple,  totalItems: 12, selectedItems: 10, prompt: "A garden has 2 rows with 5 plants each. How many plants? Drag them to the box.", wrongExplanation: "2 × 5 = 10. Two rows of five plants equals ten plants.", plateTitle: "Plants total", plateImageName: "dropzone_box"),
            PracticeQuestion(id: "msr_q4_3", topicId: 12, kind: .dragToPlate, objectType: .pencil, totalItems: 8,  selectedItems: 5,  prompt: "A pencil is 8 cm. An eraser is 3 cm. How much longer is the pencil? Drag those pencils.", wrongExplanation: "8 - 3 = 5. The pencil is 5 cm longer than the eraser.", plateTitle: "Length difference", plateImageName: "dropzone_basket"),
            PracticeQuestion(id: "msr_q4_4", topicId: 12, kind: .dragToPlate, objectType: .lego,   totalItems: 14, selectedItems: 12, prompt: "A box is 3 units × 4 units. What is the area? Drag 12 lego bricks to show the answer.", wrongExplanation: "Area = 3 × 4 = 12 square units.", plateTitle: "Area in squares", plateImageName: "dropzone_plate"),
            PracticeQuestion(id: "msr_q4_5", topicId: 12, kind: .dragToPlate, objectType: .coin,   totalItems: 10, selectedItems: 4,  prompt: "A shelf is 10 cm. Books fill 6 cm. How many cm of shelf are empty? Drag that many coins.", wrongExplanation: "10 - 6 = 4. Four centimetres of shelf are empty.", plateTitle: "Empty space", plateImageName: "dropzone_box")
        ]
    ]

    // MARK: - Exam Questions

    static let examQuestionsByTopic: [Int: [MathExamQuestion]] = [
        1: [
            MathExamQuestion(id: "cnt_exam_1",  topicId: 1, prompt: "How many apples are in a group of 3 red apples and 2 green apples?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_2",  topicId: 1, prompt: "Which number comes after 7?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_3",  topicId: 1, prompt: "Which number comes before 5?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cnt_exam_4",  topicId: 1, prompt: "You count 6 ducks in the pond. 2 more swim over. How many ducks are there now?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_5",  topicId: 1, prompt: "Which group has more  -  4 cats or 7 dogs?", options: ["The cats (4)", "They are equal", "The dogs (7)", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_6",  topicId: 1, prompt: "What is the missing number? 1, 2, 3, __, 5", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_7",  topicId: 1, prompt: "How many fingers are on 2 hands?", options: ["8", "9", "10", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_8",  topicId: 1, prompt: "Which number is greatest: 3, 9, 5, or 7?", options: ["3", "5", "7", "9", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "cnt_exam_9",  topicId: 1, prompt: "Which number is smallest: 8, 2, 6, or 4?", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cnt_exam_10", topicId: 1, prompt: "You have 10 balloons. 3 fly away. How many are left?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_11", topicId: 1, prompt: "Count by 2s: 2, 4, 6, 8, ___. What comes next?", options: ["9", "10", "12", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cnt_exam_12", topicId: 1, prompt: "There are 4 rows of chairs with 3 chairs in each row. How many chairs are there altogether?", options: ["7", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_13", topicId: 1, prompt: "Which number is between 14 and 17?", options: ["13", "15", "18", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cnt_exam_14", topicId: 1, prompt: "Skip count by 5s: 5, 10, 15, ___. What comes next?", options: ["18", "20", "25", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cnt_exam_15", topicId: 1, prompt: "You have 3 bags with 4 apples in each bag. If you count all apples one by one, how many do you count?", options: ["7", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_16", topicId: 1, prompt: "Skip count by 3s starting at 0: 0, 3, 6, 9, 12, ___. What comes next?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_17", topicId: 1, prompt: "Skip count by 10s: 340, 350, 360, ___. What comes next?", options: ["365", "370", "380", "400", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cnt_exam_18", topicId: 1, prompt: "Order these 3-digit numbers from smallest to largest: 412, 421, 142, 214.", options: ["142, 214, 412, 421", "142, 214, 421, 412", "214, 142, 412, 421", "412, 421, 214, 142", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cnt_exam_19", topicId: 1, prompt: "What is the missing number in this pattern: 6, 9, 12, ___, 18, 21?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cnt_exam_20", topicId: 1, prompt: "A farmer counts his sheep in groups of 3: 3, 6, 9, 12, 15. How many groups of 3 did he count?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        2: [
            MathExamQuestion(id: "add_exam_1",  topicId: 2, prompt: "What is 3 + 4?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_2",  topicId: 2, prompt: "What is 5 + 3?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_3",  topicId: 2, prompt: "What is 6 + 4?", options: ["8", "9", "10", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_4",  topicId: 2, prompt: "What is 2 + 7?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_5",  topicId: 2, prompt: "What is 4 + 5?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_6",  topicId: 2, prompt: "What is 7 + 5?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_7",  topicId: 2, prompt: "What is 8 + 6?", options: ["12", "13", "14", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_8",  topicId: 2, prompt: "What is 9 + 4?", options: ["11", "12", "13", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_9",  topicId: 2, prompt: "What is 7 + 8?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_10", topicId: 2, prompt: "What is 9 + 7?", options: ["14", "15", "16", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_11", topicId: 2, prompt: "What is 27 + 45?", options: ["62", "70", "72", "82", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_12", topicId: 2, prompt: "What is 136 + 247?", options: ["373", "383", "363", "403", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "add_exam_13", topicId: 2, prompt: "A shop sold 58 toys in the morning and 76 toys in the afternoon. How many toys were sold in total?", options: ["124", "130", "134", "144", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_14", topicId: 2, prompt: "What is the sum of 489 + 364?", options: ["843", "853", "753", "863", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "add_exam_15", topicId: 2, prompt: "What is 99 + 99 + 2?", options: ["190", "198", "200", "202", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_16", topicId: 2, prompt: "What is 1,456 + 2,789?", options: ["4,135", "4,145", "4,245", "4,345", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_17", topicId: 2, prompt: "What is 3,748 + 1,965?", options: ["5,603", "5,613", "5,703", "5,713", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "add_exam_18", topicId: 2, prompt: "A school collected 1,342 cans in the morning and 978 cans in the afternoon. How many cans were collected in total?", options: ["2,210", "2,310", "2,320", "2,420", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_19", topicId: 2, prompt: "What is 4,607 + 3,895?", options: ["8,402", "8,412", "8,502", "8,512", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "add_exam_20", topicId: 2, prompt: "Jamie scored 2,850 points on Monday, 1,475 on Tuesday, and 3,200 on Wednesday. What is his total score?", options: ["7,425", "7,525", "7,625", "7,725", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        3: [
            MathExamQuestion(id: "sub_exam_1",  topicId: 3, prompt: "What is 6 - 2?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_2",  topicId: 3, prompt: "What is 8 - 3?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_3",  topicId: 3, prompt: "What is 7 - 4?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_4",  topicId: 3, prompt: "What is 9 - 5?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_5",  topicId: 3, prompt: "What is 10 - 6?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_6",  topicId: 3, prompt: "What is 12 - 5?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_7",  topicId: 3, prompt: "What is 14 - 6?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_8",  topicId: 3, prompt: "What is 13 - 7?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_9",  topicId: 3, prompt: "What is 15 - 8?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_10", topicId: 3, prompt: "What is 16 - 9?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_11", topicId: 3, prompt: "What is 53 - 28?", options: ["21", "23", "25", "27", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_12", topicId: 3, prompt: "What is 200 - 137?", options: ["53", "63", "73", "83", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_13", topicId: 3, prompt: "A jar had 95 sweets. 48 were eaten. How many are left?", options: ["37", "43", "47", "53", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sub_exam_14", topicId: 3, prompt: "What is 1,002 - 567?", options: ["335", "435", "445", "535", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_15", topicId: 3, prompt: "A farmer had 304 eggs. He sold 178. How many eggs are left?", options: ["116", "126", "136", "146", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_16", topicId: 3, prompt: "What is 5,003 - 2,476?", options: ["2,427", "2,527", "2,537", "2,627", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_17", topicId: 3, prompt: "What is 8,200 - 3,657?", options: ["4,443", "4,543", "4,553", "4,643", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_18", topicId: 3, prompt: "A factory made 6,000 toys. It sold 4,382. How many toys are unsold?", options: ["1,518", "1,618", "1,628", "1,718", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_19", topicId: 3, prompt: "Tom had £4,250. He spent £1,875 on a computer. How much money does he have left?", options: ["£2,275", "£2,375", "£2,475", "£2,575", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sub_exam_20", topicId: 3, prompt: "A library had 7,040 books. 2,963 were borrowed. How many books remain on the shelves?", options: ["3,977", "4,077", "4,177", "4,277", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        4: [
            MathExamQuestion(id: "mul_exam_1",  topicId: 4, prompt: "What is 2 × 3?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_2",  topicId: 4, prompt: "What is 3 × 3?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "mul_exam_3",  topicId: 4, prompt: "What is 4 × 2?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_4",  topicId: 4, prompt: "What is 2 × 5?", options: ["8", "9", "10", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_5",  topicId: 4, prompt: "What is 3 × 4?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_6",  topicId: 4, prompt: "What is 4 × 4?", options: ["14", "15", "16", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_7",  topicId: 4, prompt: "What is 5 × 3?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_8",  topicId: 4, prompt: "What is 5 × 4?", options: ["18", "19", "20", "21", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_9",  topicId: 4, prompt: "What is 5 × 5?", options: ["20", "23", "25", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_10", topicId: 4, prompt: "What is 3 × 5?", options: ["12", "13", "15", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_11", topicId: 4, prompt: "What is 7 × 8?", options: ["48", "54", "56", "64", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_12", topicId: 4, prompt: "What is 9 × 6?", options: ["48", "52", "54", "56", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_13", topicId: 4, prompt: "A box holds 8 oranges. How many oranges are in 9 boxes?", options: ["62", "70", "72", "80", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_14", topicId: 4, prompt: "What is 12 × 7?", options: ["74", "82", "84", "86", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_15", topicId: 4, prompt: "What is 6 × 8 × 2?", options: ["82", "88", "96", "112", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_16", topicId: 4, prompt: "What is 14 × 12?", options: ["158", "164", "168", "176", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_17", topicId: 4, prompt: "What is 23 × 17?", options: ["371", "381", "391", "401", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_18", topicId: 4, prompt: "A school has 24 classrooms. Each classroom has 32 students. How many students are in the school altogether?", options: ["668", "728", "768", "828", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_19", topicId: 4, prompt: "What is 35 × 24?", options: ["800", "820", "840", "860", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mul_exam_20", topicId: 4, prompt: "A baker makes 18 trays of cookies. Each tray holds 16 cookies. How many cookies does he make in total?", options: ["272", "278", "284", "288", "I don't know / Wasn't taught"], correctIndex: 3)
        ],

        5: [
            MathExamQuestion(id: "div_exam_1", topicId: 5, prompt: "8 cookies are shared equally by 2 kids. How many cookies does each kid get?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_2", topicId: 5, prompt: "12 apples are shared equally by 3 baskets. How many apples go in each basket?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "div_exam_3", topicId: 5, prompt: "16 coins are shared equally by 4 pirates. How many coins does each pirate get?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_4", topicId: 5, prompt: "20 pencils are shared equally by 5 kids. How many pencils does each kid get?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_5", topicId: 5, prompt: "18 cookies are shared equally by 2 kids. How many cookies does each kid get?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_6", topicId: 5, prompt: "24 apples are shared equally by 4 baskets. How many apples go in each basket?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_7", topicId: 5, prompt: "21 coins are shared equally by 3 pirates. How many coins does each pirate get?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_8", topicId: 5, prompt: "28 lego bricks are shared equally by 4 builders. How many bricks does each builder get?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_9", topicId: 5, prompt: "30 pizza slices are shared equally by 5 tables. How many slices does each table get?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_10", topicId: 5, prompt: "35 pencils are shared equally by 5 kids. How many pencils does each kid get?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_11", topicId: 5, prompt: "72 eggs are packed into boxes of 9. How many boxes are needed?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_12", topicId: 5, prompt: "56 students are split into groups of 8. How many groups are there?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "div_exam_13", topicId: 5, prompt: "A baker bakes 84 cupcakes and puts 7 on each tray. How many trays does he need?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_14", topicId: 5, prompt: "96 ÷ 8 = ?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_15", topicId: 5, prompt: "A bookshelf has 132 books arranged equally on 11 shelves. How many books are on each shelf?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_16", topicId: 5, prompt: "What is 175 ÷ 7?", options: ["23", "24", "25", "26", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_17", topicId: 5, prompt: "What is 256 ÷ 8?", options: ["30", "31", "32", "33", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "div_exam_18", topicId: 5, prompt: "What is 143 ÷ 6? Give the answer with a remainder.", options: ["22 r 1", "23 r 5", "24 r 1", "23 r 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "div_exam_19", topicId: 5, prompt: "A baker has 197 cookies and packs them into boxes of 9. How many full boxes does he fill, and how many cookies are left over?", options: ["21 boxes, r 8", "22 boxes, r 0", "21 boxes, r 7", "22 boxes, r 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "div_exam_20", topicId: 5, prompt: "What is 432 ÷ 12?", options: ["34", "35", "36", "37", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        6: [
            MathExamQuestion(id: "wp_exam_1",  topicId: 6, prompt: "Lena has 4 stickers. She gets 5 more from her friend. How many stickers does she have now?", options: ["7", "8", "9", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_2",  topicId: 6, prompt: "There are 12 birds on a fence. 5 fly away. How many birds are left?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_3",  topicId: 6, prompt: "A baker puts 4 muffins in each box. She fills 3 boxes. How many muffins did she bake?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_4",  topicId: 6, prompt: "You have 14 marbles and give 6 to your brother. How many marbles do you have left?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_5",  topicId: 6, prompt: "There are 5 cars in the parking lot and 8 more arrive. How many cars are there in total?", options: ["11", "12", "13", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_6",  topicId: 6, prompt: "Each child gets 3 balloons. There are 5 children. How many balloons are needed?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_7",  topicId: 6, prompt: "You scored 9 points in the first game and 7 in the second. How many points did you score altogether?", options: ["14", "15", "16", "17", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_8",  topicId: 6, prompt: "There are 18 apples shared equally among 3 friends. How many apples does each friend get?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_9",  topicId: 6, prompt: "A bookshelf has 4 shelves with 5 books each. How many books in total?", options: ["18", "19", "20", "21", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_10", topicId: 6, prompt: "You had 20 coins, spent 8 on a snack, then earned 5 more doing chores. How many coins do you have now?", options: ["15", "16", "17", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_11", topicId: 6, prompt: "A train has 6 carriages. Each carriage holds 48 passengers. How many passengers can the train carry in total?", options: ["248", "268", "288", "308", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_12", topicId: 6, prompt: "A cinema has 24 rows with 32 seats per row. If 519 tickets were sold, how many seats are empty?", options: ["229", "239", "249", "259", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_13", topicId: 6, prompt: "Maya saves £15 each week for 8 weeks, then spends £47 on a book. How much does she have left?", options: ["£63", "£73", "£83", "£93", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "wp_exam_14", topicId: 6, prompt: "Three friends share a prize of £246 equally. How much does each person get?", options: ["£72", "£78", "£82", "£86", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "wp_exam_15", topicId: 6, prompt: "A water tank holds 560 litres. Each day, 35 litres are used. After how many days will the tank be empty?", options: ["14", "16", "18", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "wp_exam_16", topicId: 6, prompt: "Alice buys 3 packs of pens at £2.75 each and 2 notebooks at £1.80 each. How much does she spend in total?", options: ["£11.35", "£11.55", "£11.75", "£12.00", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "wp_exam_17", topicId: 6, prompt: "A runner completes 4 laps on Monday (each lap 650 m) and 3 laps on Tuesday (each lap 800 m). How far did she run in total over both days?", options: ["4,600 m", "5,000 m", "5,000 m", "5,200 m", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "wp_exam_18", topicId: 6, prompt: "A shop sells apples for 35p each and bananas for 20p each. Jake buys 4 apples and 5 bananas. How much does he pay in total?", options: ["£2.20", "£2.40", "£2.60", "£2.80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "wp_exam_19", topicId: 6, prompt: "A hall has 18 rows of chairs with 24 chairs per row. After the event, 137 chairs are put away. How many chairs remain?", options: ["285", "295", "295", "295", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "wp_exam_20", topicId: 6, prompt: "Sam earns £8.50 per hour. He works 6 hours on Saturday and 4 hours on Sunday. After spending £23.00, how much money does he have left?", options: ["£51.00", "£57.00", "£61.00", "£63.00", "I don't know / Wasn't taught"], correctIndex: 0)
        ],

        // MARK: Topic 7  -  Fractions Exam

        7: [
            MathExamQuestion(id: "fr_exam_1",  topicId: 7, prompt: "What is 1/2 of 10?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_2",  topicId: 7, prompt: "What is 1/4 of 8?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_3",  topicId: 7, prompt: "What is 1/3 of 9?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_4",  topicId: 7, prompt: "A pizza has 8 slices. You eat 1/4 of them. How many slices did you eat?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_5",  topicId: 7, prompt: "Which fraction is bigger: 1/2 or 1/4?", options: ["1/4", "They are equal", "1/2", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_6",  topicId: 7, prompt: "What is 1/2 of 12?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_7",  topicId: 7, prompt: "A bag has 15 marbles. You take 1/3 of them. How many did you take?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_8",  topicId: 7, prompt: "What is 3/4 of 8?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_9",  topicId: 7, prompt: "A bar of chocolate has 12 pieces. You eat 1/4 of it. How many pieces did you eat?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_10", topicId: 7, prompt: "What is 1/2 of 14?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_11", topicId: 7, prompt: "What is 2/3 of 18?", options: ["9", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_12", topicId: 7, prompt: "Which fraction is equivalent to 6/9?", options: ["1/3", "2/3", "3/4", "4/6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_13", topicId: 7, prompt: "What is 3/5 of 25?", options: ["10", "12", "15", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_14", topicId: 7, prompt: "A ribbon is 36 cm long. You cut off 3/4 of it. How many cm did you cut off?", options: ["18", "24", "27", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_15", topicId: 7, prompt: "Which is largest: 3/4, 5/8, or 7/12?", options: ["5/8", "7/12", "3/4", "They are equal", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_16", topicId: 7, prompt: "What is 2 + 3/4?", options: ["2 1/4", "2 3/4", "3 3/4", "5/4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_17", topicId: 7, prompt: "Which fraction is greater: 5/6 or 7/9?", options: ["7/9", "5/6", "They are equal", "Cannot compare", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fr_exam_18", topicId: 7, prompt: "What is 1 2/5 + 2 3/5?", options: ["3 4/5", "3 5/5", "4", "4 1/5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fr_exam_19", topicId: 7, prompt: "Order from smallest to largest: 2/3, 1/2, 5/6, 3/4.", options: ["1/2, 2/3, 3/4, 5/6", "1/2, 3/4, 2/3, 5/6", "2/3, 1/2, 5/6, 3/4", "1/2, 2/3, 5/6, 3/4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fr_exam_20", topicId: 7, prompt: "A jug holds 2 1/2 litres. You pour out 3/4 of a litre. How much is left?", options: ["1 1/2", "1 3/4", "2", "2 1/4", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        // MARK: Topic 8  -  Geometry Exam

        8: [
            MathExamQuestion(id: "geo_exam_1",  topicId: 8, prompt: "How many sides does a triangle have?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_2",  topicId: 8, prompt: "How many corners does a square have?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_3",  topicId: 8, prompt: "How many sides does a pentagon have?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_4",  topicId: 8, prompt: "How many sides does a hexagon have?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_5",  topicId: 8, prompt: "A triangle has 3 sides. A square has 4 sides. How many sides do they have together?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_6",  topicId: 8, prompt: "Which shape has the most sides: triangle, square, or pentagon?", options: ["Triangle (3)", "Square (4)", "Pentagon (5)", "They are the same", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_7",  topicId: 8, prompt: "How many corners does a triangle have?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_8",  topicId: 8, prompt: "How many corners does a hexagon have?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_9",  topicId: 8, prompt: "A shape has 4 equal sides and 4 corners. What is it?", options: ["Triangle", "Circle", "Square", "Pentagon", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_10", topicId: 8, prompt: "Two triangles are placed together. How many sides do they have in total?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_11", topicId: 8, prompt: "A square has a perimeter of 28 cm. What is the length of one side?", options: ["4 cm", "6 cm", "7 cm", "8 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_12", topicId: 8, prompt: "A rectangle is 8 cm long and 5 cm wide. What is its perimeter?", options: ["20 cm", "24 cm", "26 cm", "40 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_13", topicId: 8, prompt: "How many lines of symmetry does a regular hexagon have?", options: ["3", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_14", topicId: 8, prompt: "An octagon has how many sides?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_15", topicId: 8, prompt: "What is the area of a rectangle that is 9 cm long and 4 cm wide?", options: ["26 cm²", "32 cm²", "36 cm²", "40 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_16", topicId: 8, prompt: "A rectangle has a length of 15 cm and a width of 7 cm. What is its perimeter?", options: ["40 cm", "42 cm", "44 cm", "46 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_17", topicId: 8, prompt: "What is the area of a right triangle with a base of 10 cm and a height of 8 cm?", options: ["36 cm²", "40 cm²", "44 cm²", "80 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_18", topicId: 8, prompt: "An angle that measures exactly 90° is called a ___.", options: ["Acute angle", "Obtuse angle", "Right angle", "Straight angle", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_exam_19", topicId: 8, prompt: "A rectangle has an area of 84 cm² and a length of 12 cm. What is its width?", options: ["6 cm", "7 cm", "8 cm", "9 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_exam_20", topicId: 8, prompt: "Two angles in a triangle measure 65° and 45°. What is the third angle?", options: ["60°", "65°", "70°", "75°", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        // MARK: Topic 9  -  Decimals Exam

        9: [
            MathExamQuestion(id: "dec_exam_1",  topicId: 9, prompt: "What does 0.5 mean?", options: ["One quarter", "Half", "One third", "One tenth", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_2",  topicId: 9, prompt: "What is 0.5 of 10?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_3",  topicId: 9, prompt: "What does 0.25 mean?", options: ["One half", "One third", "One quarter", "One tenth", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_4",  topicId: 9, prompt: "What is 0.25 of 8?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_5",  topicId: 9, prompt: "What is 0.1 of 10?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "dec_exam_6",  topicId: 9, prompt: "What is 0.5 of 14?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_7",  topicId: 9, prompt: "Which is bigger: 0.5 or 0.25?", options: ["0.25", "They are equal", "0.5", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_8",  topicId: 9, prompt: "What is 0.25 of 12?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_9",  topicId: 9, prompt: "0.1 means 1 out of 10. What is 0.3 of 10?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_10", topicId: 9, prompt: "What is 0.5 of 20?", options: ["5", "8", "10", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_11", topicId: 9, prompt: "What is 1.7 + 2.4?", options: ["3.9", "4.0", "4.1", "4.2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_12", topicId: 9, prompt: "What is 5.3 - 1.8?", options: ["3.3", "3.5", "3.7", "4.5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_13", topicId: 9, prompt: "Order from smallest to largest: 0.8, 0.08, 0.80, 0.008", options: ["0.008, 0.08, 0.80, 0.8", "0.008, 0.08, 0.8, 0.80", "They are all different sizes", "0.8 = 0.80, then 0.08, then 0.008", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "dec_exam_14", topicId: 9, prompt: "What is 3.6 × 4?", options: ["12.4", "13.4", "14.4", "14.8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_15", topicId: 9, prompt: "What is 8.4 ÷ 0.7?", options: ["10", "12", "14", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_16", topicId: 9, prompt: "What is 4.625 + 3.148?", options: ["7.673", "7.763", "7.773", "7.873", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dec_exam_17", topicId: 9, prompt: "What is 10.050 - 4.375?", options: ["5.575", "5.625", "5.675", "6.575", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_18", topicId: 9, prompt: "Order from smallest to largest: 0.305, 0.35, 0.035, 3.05.", options: ["0.035, 0.305, 0.35, 3.05", "0.035, 0.35, 0.305, 3.05", "0.305, 0.035, 0.35, 3.05", "0.305, 0.35, 0.035, 3.05", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "dec_exam_19", topicId: 9, prompt: "What is 2.45 × 3?", options: ["6.15", "7.15", "7.35", "7.45", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dec_exam_20", topicId: 9, prompt: "A ribbon is 5.250 m long. It is cut into pieces of 0.750 m each. How many pieces are there?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        // MARK: Topic 10  -  Algebra Exam

        10: [
            MathExamQuestion(id: "alg_exam_1_t10",  topicId: 10, prompt: "? + 3 = 7. What is the missing number?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_2_t10",  topicId: 10, prompt: "5 + ? = 9. What is the missing number?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_3_t10",  topicId: 10, prompt: "? - 4 = 3. What is the missing number?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_4_t10",  topicId: 10, prompt: "? × 2 = 8. What is the missing number?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_5_t10",  topicId: 10, prompt: "3 × ? = 12. What is the missing number?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_6_t10",  topicId: 10, prompt: "? + 6 = 14. What is the missing number?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_7_t10",  topicId: 10, prompt: "10 - ? = 4. What is the missing number?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_8_t10",  topicId: 10, prompt: "? ÷ 3 = 4. What is the missing number?", options: ["9", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_9_t10",  topicId: 10, prompt: "? + 8 = 15. What is the missing number?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_10_t10", topicId: 10, prompt: "4 × ? = 20. What is the missing number?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_11", topicId: 10, prompt: "2 × ? + 3 = 11. What is the missing number?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_12", topicId: 10, prompt: "? ÷ 4 + 5 = 11. What is the missing number?", options: ["20", "22", "24", "28", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_13", topicId: 10, prompt: "3 × ? - 7 = 14. What is the missing number?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_14", topicId: 10, prompt: "If n = 5, what is the value of 4n - 9?", options: ["9", "10", "11", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_15", topicId: 10, prompt: "Which value of x makes both equations true: x + 4 = 9 AND 2x - 1 = 9?", options: ["x = 4", "x = 5", "x = 6", "No value works for both", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_16", topicId: 10, prompt: "Solve for x: 3x + 7 = 28.", options: ["x = 6", "x = 7", "x = 8", "x = 9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_17", topicId: 10, prompt: "Solve for y: 5y - 12 = 33.", options: ["y = 7", "y = 8", "y = 9", "y = 10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_18", topicId: 10, prompt: "If a = 4 and b = 3, what is the value of 2a² - 3b?", options: ["19", "21", "23", "25", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "alg_exam_19", topicId: 10, prompt: "Solve for x: 4(x - 2) = 20.", options: ["x = 5", "x = 6", "x = 7", "x = 8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_20", topicId: 10, prompt: "If p = 6, what is the value of 3p² ÷ 9?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        // MARK: Topic 11  -  Percentages Exam

        11: [
            MathExamQuestion(id: "pct_exam_1_t11",  topicId: 11, prompt: "What is 50% of 10?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_2_t11",  topicId: 11, prompt: "What is 25% of 8?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_3_t11",  topicId: 11, prompt: "What is 10% of 10?", options: ["0", "1", "2", "3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_4_t11",  topicId: 11, prompt: "What is 75% of 8?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_5_t11",  topicId: 11, prompt: "What is 50% of 20?", options: ["5", "8", "10", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_6_t11",  topicId: 11, prompt: "Which percentage is the same as one half?", options: ["25%", "50%", "75%", "100%", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_7_t11",  topicId: 11, prompt: "What is 25% of 12?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_8_t11",  topicId: 11, prompt: "What is 10% of 20?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_9_t11",  topicId: 11, prompt: "Which is bigger: 75% or 50%?", options: ["50%", "They are equal", "75%", "Cannot tell", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_10_t11", topicId: 11, prompt: "What is 50% of 14?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_11", topicId: 11, prompt: "A jacket costs £80. It is reduced by 30%. What is the sale price?", options: ["£50", "£54", "£56", "£60", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_12", topicId: 11, prompt: "What percentage of 40 is 10?", options: ["10%", "20%", "25%", "40%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_13", topicId: 11, prompt: "A price rises from £60 to £75. What is the percentage increase?", options: ["15%", "20%", "25%", "30%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_14", topicId: 11, prompt: "If 35% of a number is 21, what is the number?", options: ["50", "55", "60", "65", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_15", topicId: 11, prompt: "Which is greater: 40% of 90 or 60% of 55?", options: ["40% of 90 (= 36)", "60% of 55 (= 33)", "They are equal", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pct_exam_16", topicId: 11, prompt: "A television costs £450. The price increases by 12%. What is the new price?", options: ["£494", "£500", "£504", "£514", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_17", topicId: 11, prompt: "A shop reduces a £320 coat by 35%. What is the sale price?", options: ["£196", "£204", "£208", "£212", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_18", topicId: 11, prompt: "15% of a number is 45. What is the number?", options: ["270", "290", "300", "315", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_19", topicId: 11, prompt: "A price drops from £250 to £175. What is the percentage decrease?", options: ["25%", "28%", "30%", "35%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_20", topicId: 11, prompt: "In a class of 40 students, 35% are boys. How many girls are there in the class?", options: ["14", "22", "24", "26", "I don't know / Wasn't taught"], correctIndex: 3)
        ],

        // MARK: Topic 12  -  Measurement Exam

        12: [
            MathExamQuestion(id: "msr_exam_1",  topicId: 12, prompt: "A rectangle is 3 units wide and 4 units tall. What is its area?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_2",  topicId: 12, prompt: "A pencil is 8 cm. An eraser is 3 cm. How much longer is the pencil?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_3",  topicId: 12, prompt: "A garden has 3 rows with 5 flowers each. How many flowers in total?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_4",  topicId: 12, prompt: "A rope is 10 cm. You cut off 4 cm. How much is left?", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_5",  topicId: 12, prompt: "A box is 4 units × 4 units. What is the area?", options: ["12", "14", "16", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_6",  topicId: 12, prompt: "A table is 5 units long. A shelf is 2 units long. How much longer is the table?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "msr_exam_7",  topicId: 12, prompt: "A grid has 4 rows with 3 items each. How many items in total?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_8",  topicId: 12, prompt: "A ribbon is 9 cm. You use 5 cm. How much ribbon is left?", options: ["3", "4", "5", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "msr_exam_9",  topicId: 12, prompt: "A room is 5 units wide and 3 units long. What is the area?", options: ["13", "14", "15", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_10", topicId: 12, prompt: "Two pencils are each 6 cm long. How long are they together?", options: ["10", "11", "12", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_11", topicId: 12, prompt: "Convert 2.5 km to metres.", options: ["250 m", "2,500 m", "25,000 m", "250,000 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "msr_exam_12", topicId: 12, prompt: "A swimming pool is 25 m long and 10 m wide. What is its area?", options: ["70 m²", "150 m²", "250 m²", "350 m²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_13", topicId: 12, prompt: "Convert 4,800 ml to litres.", options: ["0.48 L", "4.8 L", "48 L", "480 L", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "msr_exam_14", topicId: 12, prompt: "A rectangular field is 120 m long and 85 m wide. What is its perimeter?", options: ["205 m", "360 m", "410 m", "480 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_15", topicId: 12, prompt: "How many 250 ml cups can be filled from a 3-litre jug?", options: ["8", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_16", topicId: 12, prompt: "Convert 3.75 km to metres.", options: ["375 m", "3,750 m", "37,500 m", "375,000 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "msr_exam_17", topicId: 12, prompt: "A car travels at 60 km/h. How far does it travel in 2 hours 30 minutes?", options: ["120 km", "135 km", "150 km", "165 km", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_18", topicId: 12, prompt: "A rectangular room is 6.5 m long and 4.2 m wide. What is its area?", options: ["25.30 m²", "26.30 m²", "27.30 m²", "28.30 m²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_19", topicId: 12, prompt: "A bag of rice weighs 2.75 kg. How many grams is that?", options: ["275 g", "2,075 g", "2,750 g", "27,500 g", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "msr_exam_20", topicId: 12, prompt: "A fence runs around a rectangular garden that is 14 m long and 9 m wide. Fence panels are each 1.5 m wide. How many fence panels are needed?", options: ["30", "31", "32", "33", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        13: [
            MathExamQuestion(id: "pv_exam_1", topicId: 13, prompt: "What is the value of the digit 7 in the number 4,738?", options: ["7", "70", "700", "7,000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_2", topicId: 13, prompt: "Write 5,306 in expanded form.", options: ["5,000 + 300 + 6", "5,000 + 30 + 6", "500 + 300 + 6", "5,000 + 300 + 60", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_exam_3", topicId: 13, prompt: "In the number 82,419, which digit is in the ten-thousands place?", options: ["4", "2", "8", "1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_4", topicId: 13, prompt: "Which number has a 6 in the hundreds place and a 3 in the tens place?", options: ["6,304", "3,640", "2,631", "1,632", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_5", topicId: 13, prompt: "What number is represented by 40,000 + 700 + 50 + 9?", options: ["47,509", "40,759", "4,759", "40,059", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_exam_6", topicId: 13, prompt: "In 306,214, what is the value of the digit 3?", options: ["3,000", "30,000", "300,000", "300", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_7", topicId: 13, prompt: "How many tens are in 4,560?", options: ["45", "456", "56", "4,560", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_exam_8", topicId: 13, prompt: "Which of the following is equal to 200,000 + 30,000 + 400 + 5?", options: ["230,045", "230,405", "203,405", "230,450", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_exam_9", topicId: 13, prompt: "The digit 9 in 9,870,000 represents:", options: ["Nine thousand", "Nine hundred thousand", "Nine million", "Ninety thousand", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_10", topicId: 13, prompt: "Which number has the digit 5 worth 50,000?", options: ["5,432", "45,321", "152,300", "501,200", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pv_exam_11", topicId: 13, prompt: "The number 4,070,309 has a digit 0 in how many different place-value positions?", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_12", topicId: 13, prompt: "In 58,246,731, what is the value of the digit 2?", options: ["2,000", "20,000", "200,000", "2,000,000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pv_exam_13", topicId: 13, prompt: "Which number is 10,000 more than 2,985,600?", options: ["2,986,600", "2,995,600", "3,085,600", "2,985,700", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_exam_14", topicId: 13, prompt: "Write 7 × 10⁶ + 4 × 10⁴ + 3 × 10² + 9 in standard form.", options: ["7,040,309", "7,004,039", "7,400,309", "7,040,039", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pv_exam_15", topicId: 13, prompt: "Which of these represents the number with digit 6 in the hundred-thousands place and digit 3 in the tens place?", options: ["263,741", "632,031", "1,637,200", "1,064,830", "I don't know / Wasn't taught"], correctIndex: 0),
        ],
        14: [
            MathExamQuestion(id: "rnd_exam_1", topicId: 14, prompt: "Round 4,763 to the nearest hundred.", options: ["4,700", "4,800", "5,000", "4,760", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_exam_2", topicId: 14, prompt: "Round 2,845 to the nearest ten.", options: ["2,840", "2,850", "2,900", "2,800", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_exam_3", topicId: 14, prompt: "Round 73,499 to the nearest thousand.", options: ["73,000", "74,000", "73,500", "70,000", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "rnd_exam_4", topicId: 14, prompt: "Which number rounds to 6,000 when rounded to the nearest thousand?", options: ["5,499", "6,501", "5,500", "6,499", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rnd_exam_5", topicId: 14, prompt: "Round 99,950 to the nearest hundred.", options: ["99,900", "100,000", "99,000", "99,960", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_exam_6", topicId: 14, prompt: "A number rounded to the nearest 10 gives 380. Which could be the original number?", options: ["371", "385", "389", "374", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "rnd_exam_7", topicId: 14, prompt: "Round 0.67 to the nearest whole number.", options: ["0", "0.7", "1", "0.6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rnd_exam_8", topicId: 14, prompt: "Estimate 49 × 61 by rounding both numbers to the nearest ten.", options: ["2,500", "3,000", "2,940", "3,500", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rnd_exam_9", topicId: 14, prompt: "Round 4.45 to the nearest tenth.", options: ["4.5", "4.4", "4.0", "5.0", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "rnd_exam_10", topicId: 14, prompt: "A distance is 2,350 m. Rounded to the nearest kilometre, this is:", options: ["2 km", "3 km", "2.5 km", "23 km", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        15: [
            MathExamQuestion(id: "time_exam_1", topicId: 15, prompt: "A film starts at 14:45 and lasts 1 hour 50 minutes. What time does it end?", options: ["16:25", "16:35", "15:95", "16:15", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_exam_2", topicId: 15, prompt: "How many minutes are in 2 hours and 35 minutes?", options: ["135", "145", "155", "165", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_exam_3", topicId: 15, prompt: "A clock shows 20 past 9. In 24-hour time, this is:", options: ["09:20", "21:20", "20:09", "09:02", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "time_exam_4", topicId: 15, prompt: "A train leaves at 08:55 and arrives at 11:20. How long is the journey?", options: ["2 h 15 min", "2 h 25 min", "3 h 15 min", "2 h 35 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_exam_5", topicId: 15, prompt: "How many seconds are in 4 minutes and 30 seconds?", options: ["250", "260", "270", "280", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_exam_6", topicId: 15, prompt: "A clock shows quarter to 7. What time is this in 24-hour format (in the evening)?", options: ["07:15", "18:45", "19:15", "18:15", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_exam_7", topicId: 15, prompt: "A runner starts a race at 10:37 and finishes at 11:04. How long did the race take?", options: ["23 minutes", "27 minutes", "33 minutes", "37 minutes", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_exam_8", topicId: 15, prompt: "Convert 185 minutes to hours and minutes.", options: ["2 h 55 min", "3 h 5 min", "3 h 25 min", "2 h 45 min", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "time_exam_9", topicId: 15, prompt: "How many days are in 3 weeks and 4 days?", options: ["21", "24", "25", "28", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "time_exam_10", topicId: 15, prompt: "A school day starts at 08:45 and ends at 15:30. How many hours and minutes is that?", options: ["6 h 45 min", "6 h 85 min", "7 h 15 min", "6 h 15 min", "I don't know / Wasn't taught"], correctIndex: 0),
        ],
        16: [
            MathExamQuestion(id: "mon_exam_1", topicId: 16, prompt: "A book costs £4.75 and a pen costs £1.30. How much do they cost together?", options: ["£5.95", "£6.05", "£6.15", "£5.05", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_2", topicId: 16, prompt: "You pay £10 for an item costing £6.85. How much change do you get?", options: ["£3.25", "£3.15", "£4.15", "£2.85", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_3", topicId: 16, prompt: "Which is cheaper: 3 items at £2.50 each or 4 items at £1.80 each?", options: ["3 items at £2.50 (costs £7.50)", "4 items at £1.80 (costs £7.20)", "They cost the same", "Cannot be determined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_4", topicId: 16, prompt: "A jacket costs $45.99. It is on sale for 20% off. What is the sale price?", options: ["$36.79", "$36.99", "$36.59", "$37.99", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mon_exam_5", topicId: 16, prompt: "You have 3 × £2 coins, 2 × 50p coins, and 4 × 10p coins. How much is that in total?", options: ["£7.30", "£7.40", "£7.90", "£6.40", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_6", topicId: 16, prompt: "A meal costs £23.60. Four friends split the bill equally. How much does each pay?", options: ["£5.40", "£5.90", "£6.40", "£5.80", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_7", topicId: 16, prompt: "Items priced at $3.49, $7.99, and $2.52 are placed in a basket. What is the total?", options: ["$13.00", "$14.00", "$13.90", "$14.10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_8", topicId: 16, prompt: "A toy costs £18. It increases in price by 15%. What is the new price?", options: ["£19.80", "£20.70", "£21.00", "£20.00", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mon_exam_9", topicId: 16, prompt: "You earn $12.50 per hour and work 6 hours. How much do you earn?", options: ["$72.00", "£75.00", "$75.00", "$70.00", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mon_exam_10", topicId: 16, prompt: "Two items cost £5.60 together. One costs £2.85. How much does the other cost?", options: ["£2.65", "£2.75", "£3.25", "£3.75", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        17: [
            MathExamQuestion(id: "pat_exam_1", topicId: 17, prompt: "What is the next term in the sequence: 3, 7, 11, 15, __?", options: ["17", "18", "19", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pat_exam_2", topicId: 17, prompt: "Find the rule for the sequence: 80, 72, 64, 56, ...", options: ["Add 8", "Subtract 8", "Multiply by 0.9", "Subtract 9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_3", topicId: 17, prompt: "What is the 6th term in the sequence 5, 10, 20, 40, ...?", options: ["80", "120", "160", "200", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pat_exam_4", topicId: 17, prompt: "A sequence starts at 3 and each term is found by multiplying the previous term by 3. What is the 5th term?", options: ["81", "243", "27", "729", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_5", topicId: 17, prompt: "In the arithmetic sequence 7, 12, 17, 22, ... what is the 10th term?", options: ["47", "52", "57", "62", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_6", topicId: 17, prompt: "Which sequence has the rule 'subtract 6 each time'?", options: ["100, 106, 112, 118", "100, 94, 88, 82", "100, 96, 92, 88", "100, 90, 80, 70", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_7", topicId: 17, prompt: "The sequence is 2, 5, 10, 17, 26, ... What is the pattern?", options: ["Add 3, add 4, add 5...", "Add 3 each time", "Multiply by 2 each time", "Add odd numbers: +3, +5, +7...", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pat_exam_8", topicId: 17, prompt: "What is the missing term? 4, __, 16, 32, 64", options: ["6", "8", "10", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_9", topicId: 17, prompt: "A tile pattern uses 4 tiles for 1 square, 8 tiles for 2 squares, and 12 tiles for 3 squares. How many tiles for 8 squares?", options: ["28", "32", "36", "40", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pat_exam_10", topicId: 17, prompt: "Find the next two terms: 1, 1, 2, 3, 5, 8, __, __", options: ["10, 15", "11, 16", "13, 21", "12, 20", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        18: [
            MathExamQuestion(id: "fct_exam_1", topicId: 18, prompt: "What are all the factors of 36?", options: ["1, 2, 3, 4, 6, 9, 12, 18, 36", "1, 2, 3, 6, 12, 18, 36", "1, 3, 4, 6, 9, 12, 36", "2, 3, 4, 6, 9, 18, 36", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fct_exam_2", topicId: 18, prompt: "What is the Greatest Common Factor (GCF) of 24 and 36?", options: ["6", "8", "12", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_exam_3", topicId: 18, prompt: "What is the Lowest Common Multiple (LCM) of 4 and 6?", options: ["8", "12", "24", "2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_exam_4", topicId: 18, prompt: "Which of the following is a prime number?", options: ["27", "33", "41", "49", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_exam_5", topicId: 18, prompt: "What is the GCF of 48 and 60?", options: ["6", "8", "12", "24", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_exam_6", topicId: 18, prompt: "A composite number is one that:", options: ["Has exactly two factors", "Has only one factor", "Has more than two factors", "Is odd", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fct_exam_7", topicId: 18, prompt: "What is the LCM of 8 and 12?", options: ["16", "24", "48", "96", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_exam_8", topicId: 18, prompt: "How many factors does 48 have?", options: ["8", "10", "12", "6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fct_exam_9", topicId: 18, prompt: "What is the prime factorisation of 60?", options: ["2 × 2 × 3 × 5", "2 × 3 × 10", "4 × 3 × 5", "2 × 2 × 15", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fct_exam_10", topicId: 18, prompt: "Two buses leave the depot together. One comes every 12 minutes, one every 8 minutes. When do they next leave at the same time?", options: ["16 minutes", "20 minutes", "24 minutes", "96 minutes", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        19: [
            MathExamQuestion(id: "mn_exam_1", topicId: 19, prompt: "Convert 11/4 to a mixed number.", options: ["2 1/4", "2 3/4", "3 1/4", "3 3/4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_exam_2", topicId: 19, prompt: "Convert 3 2/5 to an improper fraction.", options: ["15/5", "17/5", "11/5", "13/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_exam_3", topicId: 19, prompt: "Which improper fraction equals 4 3/7?", options: ["28/7", "30/7", "31/7", "29/7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_exam_4", topicId: 19, prompt: "Convert 23/6 to a mixed number.", options: ["3 5/6", "3 1/6", "4 1/6", "2 5/6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mn_exam_5", topicId: 19, prompt: "Which of these is the same as 2 3/8?", options: ["16/8", "18/8", "19/8", "21/8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_exam_6", topicId: 19, prompt: "Convert 5 1/3 to an improper fraction.", options: ["15/3", "16/3", "17/3", "14/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_exam_7", topicId: 19, prompt: "Add 1 1/2 + 2 3/4. Give your answer as a mixed number.", options: ["3 5/4", "3 1/4", "4 1/4", "4 3/4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_exam_8", topicId: 19, prompt: "Which mixed number is between 3 and 4?", options: ["7/2", "9/4", "11/3", "13/5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mn_exam_9", topicId: 19, prompt: "Subtract 4 1/5 − 1 3/5. Give your answer as a mixed number.", options: ["3 2/5", "2 3/5", "2 2/5", "3 3/5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mn_exam_10", topicId: 19, prompt: "Tom ate 2 2/3 pizzas on Saturday and 1 5/6 pizzas on Sunday. How many pizzas did he eat in total?", options: ["3 1/2", "4 1/6", "4 1/2", "3 5/6", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        20: [
            MathExamQuestion(id: "cf_exam_1", topicId: 20, prompt: "Which fraction is larger: 3/4 or 5/8?", options: ["5/8", "3/4", "They are equal", "Cannot compare", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_exam_2", topicId: 20, prompt: "Order from smallest to largest: 1/2, 2/5, 3/4", options: ["2/5, 1/2, 3/4", "1/2, 2/5, 3/4", "3/4, 1/2, 2/5", "2/5, 3/4, 1/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "cf_exam_3", topicId: 20, prompt: "Which fraction is equivalent to 2/3?", options: ["4/9", "6/8", "8/12", "3/5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_exam_4", topicId: 20, prompt: "Compare 7/9 and 3/4. Which is greater?", options: ["3/4", "7/9", "They are equal", "Cannot be determined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_exam_5", topicId: 20, prompt: "Which fraction is NOT equivalent to 1/2?", options: ["3/6", "5/10", "4/9", "8/16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_exam_6", topicId: 20, prompt: "Order from largest to smallest: 5/6, 3/4, 7/8", options: ["5/6, 3/4, 7/8", "7/8, 5/6, 3/4", "3/4, 5/6, 7/8", "7/8, 3/4, 5/6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_exam_7", topicId: 20, prompt: "Which fraction is equivalent to 6/10?", options: ["2/3", "3/5", "4/7", "12/25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cf_exam_8", topicId: 20, prompt: "Find a fraction between 1/3 and 1/2.", options: ["1/4", "2/3", "5/12", "2/5", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_exam_9", topicId: 20, prompt: "Which list shows fractions in ascending order?", options: ["3/5, 1/2, 4/7", "1/2, 3/5, 4/7", "1/2, 4/7, 3/5", "4/7, 3/5, 1/2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cf_exam_10", topicId: 20, prompt: "A recipe uses 2/3 cup of sugar and 3/5 cup of flour. Which ingredient has the larger amount?", options: ["Flour (3/5)", "Sugar (2/3)", "They are equal", "Cannot compare different ingredients", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        21: [
            MathExamQuestion(id: "af_exam_1", topicId: 21, prompt: "Calculate 3/8 + 1/8.", options: ["4/16", "4/8", "2/8", "4/0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_exam_2", topicId: 21, prompt: "Calculate 5/6 − 1/4. Simplify your answer.", options: ["7/12", "4/2", "2/3", "1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "af_exam_3", topicId: 21, prompt: "Add 2/3 + 3/5.", options: ["5/8", "5/15", "19/15", "6/15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_exam_4", topicId: 21, prompt: "Subtract 7/8 − 2/3.", options: ["5/24", "5/5", "1/8", "5/8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "af_exam_5", topicId: 21, prompt: "Add 1 3/4 + 2 1/2. Simplify.", options: ["3 3/4", "4 1/4", "3 5/4", "4 1/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_exam_6", topicId: 21, prompt: "Subtract 3 1/3 − 1 2/3.", options: ["1 1/3", "1 2/3", "2 1/3", "2 2/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_exam_7", topicId: 21, prompt: "3/4 + 5/6 = ?", options: ["8/10", "19/12", "8/12", "15/24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_exam_8", topicId: 21, prompt: "A jug holds 4/5 litres. 1/3 litre is poured out. How much is left?", options: ["3/15", "7/15", "3/5", "7/8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "af_exam_9", topicId: 21, prompt: "Simplify 18/24.", options: ["9/12", "6/8", "3/4", "2/3", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "af_exam_10", topicId: 21, prompt: "5/9 + 2/9 − 1/9 = ?", options: ["6/9", "6/27", "2/3", "7/9", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        22: [
            MathExamQuestion(id: "mf_exam_1", topicId: 22, prompt: "Calculate 2/3 × 3/4.", options: ["5/7", "6/12", "1/2", "6/7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mf_exam_2", topicId: 22, prompt: "Calculate 5/6 × 3/5.", options: ["1/2", "15/30", "8/11", "2/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mf_exam_3", topicId: 22, prompt: "What is 3/4 × 8?", options: ["24/4", "6", "8", "3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_exam_4", topicId: 22, prompt: "What is 2/5 × 15?", options: ["4", "5", "6", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mf_exam_5", topicId: 22, prompt: "Multiply 4/7 × 7/8.", options: ["28/56", "1/2", "11/15", "7/14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_exam_6", topicId: 22, prompt: "A recipe needs 3/4 cup of butter. If you make 1/2 of the recipe, how much butter do you need?", options: ["1/4 cup", "3/8 cup", "1/2 cup", "1/8 cup", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_exam_7", topicId: 22, prompt: "What is 1 1/2 × 2/3?", options: ["2/3", "1", "4/3", "3/4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "mf_exam_8", topicId: 22, prompt: "Calculate 5/8 × 4/5.", options: ["20/40", "9/13", "1/2", "4/8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "mf_exam_9", topicId: 22, prompt: "A ribbon is 5/6 m long. You use 3/4 of it. How long is the piece used?", options: ["5/8 m", "8/10 m", "4/6 m", "15/24 m", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "mf_exam_10", topicId: 22, prompt: "What is 7/10 × 20?", options: ["12", "13", "14", "15", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        23: [
            MathExamQuestion(id: "rat_exam_1", topicId: 23, prompt: "Simplify the ratio 12:20.", options: ["6:10", "3:5", "4:7", "2:4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_2", topicId: 23, prompt: "In a class, the ratio of boys to girls is 3:4. There are 24 girls. How many boys are there?", options: ["16", "18", "21", "32", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_3", topicId: 23, prompt: "Find the missing value: 5:8 = ?:40", options: ["20", "25", "30", "32", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_4", topicId: 23, prompt: "Paint is mixed in the ratio 2:3 (red:blue). If you use 10 litres of red, how many litres of blue do you need?", options: ["12", "15", "6", "20", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_5", topicId: 23, prompt: "Which ratio is equivalent to 4:6?", options: ["2:4", "8:10", "6:9", "12:16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_exam_6", topicId: 23, prompt: "Share £60 in the ratio 2:3. What is the larger share?", options: ["£24", "£30", "£36", "£40", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "rat_exam_7", topicId: 23, prompt: "A map uses a scale of 1:50,000. A road measures 4 cm on the map. How long is the real road in km?", options: ["1 km", "2 km", "4 km", "5 km", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_8", topicId: 23, prompt: "Simplify 45:30:15.", options: ["15:10:5", "3:2:1", "9:6:3", "5:3:1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_9", topicId: 23, prompt: "A juice mix uses water and concentrate in the ratio 7:1. How much concentrate is needed for 400 ml of drink?", options: ["40 ml", "50 ml", "56 ml", "57 ml", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "rat_exam_10", topicId: 23, prompt: "Three friends share £90 in the ratio 1:2:3. What does the person with the largest share receive?", options: ["£30", "£40", "£45", "£50", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        24: [
            MathExamQuestion(id: "dg_exam_1", topicId: 24, prompt: "A bar chart shows: Apples=8, Bananas=5, Oranges=11. What is the mean number of fruits?", options: ["7", "8", "9", "11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_exam_2", topicId: 24, prompt: "In a pictogram, each symbol = 4 students. If Science shows 3½ symbols, how many students chose Science?", options: ["12", "14", "16", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_exam_3", topicId: 24, prompt: "Five numbers are: 3, 7, 5, 9, 6. What is their mean?", options: ["5", "6", "7", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_exam_4", topicId: 24, prompt: "The mean of four numbers is 8. Three of the numbers are 6, 9, and 7. What is the fourth number?", options: ["8", "9", "10", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_exam_5", topicId: 24, prompt: "A bar chart shows monthly rainfall. Jan=30mm, Feb=20mm, Mar=40mm, Apr=10mm. What is the mean rainfall?", options: ["20 mm", "25 mm", "30 mm", "35 mm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_exam_6", topicId: 24, prompt: "A data set has 6 values with mean 9. What is the sum of all 6 values?", options: ["15", "45", "54", "63", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_exam_7", topicId: 24, prompt: "In a bar chart, Year 5 scored 45 and Year 6 scored 60. How many more points did Year 6 score?", options: ["10", "15", "20", "25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "dg_exam_8", topicId: 24, prompt: "What type of graph best shows how something changes over time?", options: ["Bar chart", "Pictogram", "Line graph", "Pie chart", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_exam_9", topicId: 24, prompt: "Scores in a test: 12, 15, 18, 9, 6. What is the range?", options: ["9", "10", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "dg_exam_10", topicId: 24, prompt: "A pie chart is divided into 4 equal sections. What percentage does each section represent?", options: ["20%", "25%", "30%", "40%", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        25: [
            MathExamQuestion(id: "prm_exam_1", topicId: 25, prompt: "Which of the following is a prime number?", options: ["51", "57", "59", "63", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_exam_2", topicId: 25, prompt: "What is the prime factorisation of 84?", options: ["2 × 2 × 3 × 7", "2 × 3 × 14", "4 × 3 × 7", "2 × 42", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prm_exam_3", topicId: 25, prompt: "How many prime numbers are between 1 and 20?", options: ["6", "7", "8", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_exam_4", topicId: 25, prompt: "Which of these is NOT a prime number?", options: ["2", "37", "51", "53", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_exam_5", topicId: 25, prompt: "Write 90 as a product of prime factors.", options: ["2 × 45", "2 × 3 × 3 × 5", "2 × 3 × 15", "3 × 30", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_exam_6", topicId: 25, prompt: "What is special about the number 2 in the prime numbers?", options: ["It is the smallest prime", "It is the only even prime", "It is a composite number", "It has three factors", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_exam_7", topicId: 25, prompt: "Is 97 a prime number?", options: ["No, it is divisible by 7", "No, it is divisible by 3", "Yes, it is prime", "No, it is divisible by 9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prm_exam_8", topicId: 25, prompt: "What are the prime factors of 100?", options: ["2 and 5", "2, 4, 5, 10", "2, 5, 25", "2, 5, 10, 20", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "prm_exam_9", topicId: 25, prompt: "Find the prime factorisation of 48 using index notation.", options: ["2³ × 6", "2⁴ × 3", "2³ × 3²", "4² × 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prm_exam_10", topicId: 25, prompt: "Which pair are both prime numbers?", options: ["15 and 21", "17 and 23", "25 and 29", "33 and 37", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        26: [
            MathExamQuestion(id: "neg_exam_1", topicId: 26, prompt: "Which is colder: −8°C or −3°C?", options: ["−3°C", "−8°C", "They are the same", "Cannot compare", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_exam_2", topicId: 26, prompt: "Calculate −4 + 9.", options: ["−13", "−5", "5", "13", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_exam_3", topicId: 26, prompt: "Order from smallest to largest: −5, 3, −1, 0, 2", options: ["−1, −5, 0, 2, 3", "−5, −1, 0, 2, 3", "3, 2, 0, −1, −5", "0, −1, −5, 2, 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_exam_4", topicId: 26, prompt: "The temperature drops from 4°C to −7°C. By how many degrees did it fall?", options: ["3°C", "7°C", "11°C", "13°C", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_exam_5", topicId: 26, prompt: "Calculate 3 − 8.", options: ["5", "11", "−5", "−11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_exam_6", topicId: 26, prompt: "What is −6 + (−3)?", options: ["3", "9", "−3", "−9", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "neg_exam_7", topicId: 26, prompt: "What is −2 − (−5)?", options: ["−7", "−3", "3", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "neg_exam_8", topicId: 26, prompt: "A submarine is at −120 m. It rises 45 m. What is its new depth?", options: ["−75 m", "−65 m", "75 m", "165 m", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "neg_exam_9", topicId: 26, prompt: "Which number is exactly halfway between −8 and 4?", options: ["−4", "−2", "0", "2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "neg_exam_10", topicId: 26, prompt: "What is the result of −10 + 4 − (−2)?", options: ["−8", "−4", "−16", "8", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        27: [
            MathExamQuestion(id: "coord_exam_1", topicId: 27, prompt: "What are the coordinates of a point 4 units right and 3 units up from the origin?", options: ["(3, 4)", "(4, 3)", "(−4, 3)", "(4, −3)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_exam_2", topicId: 27, prompt: "In which quadrant is the point (−3, 5)?", options: ["Quadrant 1", "Quadrant 2", "Quadrant 3", "Quadrant 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_exam_3", topicId: 27, prompt: "A point is at (6, −4). It is reflected across the x-axis. What are the new coordinates?", options: ["(−6, −4)", "(6, 4)", "(−6, 4)", "(4, −6)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_exam_4", topicId: 27, prompt: "What are the coordinates of the midpoint of (2, 4) and (8, 10)?", options: ["(4, 6)", "(5, 7)", "(6, 7)", "(10, 14)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_exam_5", topicId: 27, prompt: "Three corners of a square are at (1,1), (4,1), and (4,4). What are the coordinates of the fourth corner?", options: ["(1, 4)", "(4, 0)", "(0, 4)", "(1, 0)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_exam_6", topicId: 27, prompt: "Which point lies on the y-axis?", options: ["(3, 0)", "(0, −5)", "(2, 2)", "(−1, −1)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "coord_exam_7", topicId: 27, prompt: "A point is translated 3 right and 2 down from (−1, 5). What are the new coordinates?", options: ["(2, 3)", "(2, 7)", "(−4, 3)", "(4, 7)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "coord_exam_8", topicId: 27, prompt: "In which quadrant is the point (−7, −2)?", options: ["Quadrant 1", "Quadrant 2", "Quadrant 3", "Quadrant 4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "coord_exam_9", topicId: 27, prompt: "What is the distance between (1, 3) and (1, 9) on a coordinate grid?", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "coord_exam_10", topicId: 27, prompt: "A point at (5, 3) is reflected across the y-axis. What are the new coordinates?", options: ["(5, −3)", "(−5, −3)", "(−3, 5)", "(−5, 3)", "I don't know / Wasn't taught"], correctIndex: 3),
        ],
        28: [
            MathExamQuestion(id: "vol_exam_1", topicId: 28, prompt: "What is the volume of a cuboid with length 5 cm, width 3 cm, height 4 cm?", options: ["47 cm³", "60 cm³", "48 cm³", "56 cm³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_exam_2", topicId: 28, prompt: "A cube has side length 6 cm. What is its volume?", options: ["36 cm³", "180 cm³", "216 cm³", "18 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_3", topicId: 28, prompt: "A box has volume 240 cm³, length 8 cm, and width 5 cm. What is its height?", options: ["4 cm", "5 cm", "6 cm", "8 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_4", topicId: 28, prompt: "How many unit cubes fit inside a cuboid that is 4 × 3 × 2?", options: ["9", "18", "24", "36", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_5", topicId: 28, prompt: "A swimming pool is 25 m long, 10 m wide, and 2 m deep. What is its volume?", options: ["370 m³", "500 m³", "250 m³", "750 m³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_exam_6", topicId: 28, prompt: "1 litre = 1000 cm³. A container holds 4,500 cm³. How many litres is that?", options: ["0.45 litres", "4.5 litres", "45 litres", "450 litres", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vol_exam_7", topicId: 28, prompt: "What is the volume of a cuboid with length 12 m, width 4 m, and height 3 m?", options: ["19 m³", "96 m³", "144 m³", "112 m³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_8", topicId: 28, prompt: "A solid is made of 5 layers of unit cubes, each layer being a 4 × 3 grid. What is the total volume?", options: ["12 cm³", "20 cm³", "60 cm³", "72 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_9", topicId: 28, prompt: "Two identical cuboids each have volume 48 cm³. What is their combined volume?", options: ["24 cm³", "48 cm³", "96 cm³", "192 cm³", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "vol_exam_10", topicId: 28, prompt: "A cube has volume 125 cm³. What is the length of one side?", options: ["4 cm", "5 cm", "6 cm", "25 cm", "I don't know / Wasn't taught"], correctIndex: 1),
        ],
        29: [
            MathExamQuestion(id: "ang_exam_1", topicId: 29, prompt: "Two angles on a straight line are 65° and x°. What is x?", options: ["105°", "115°", "125°", "135°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_exam_2", topicId: 29, prompt: "A triangle has angles of 50° and 70°. What is the third angle?", options: ["50°", "60°", "70°", "80°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_exam_3", topicId: 29, prompt: "What type of angle is 145°?", options: ["Acute", "Right", "Obtuse", "Reflex", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_exam_4", topicId: 29, prompt: "Angles around a full point add up to:", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_exam_5", topicId: 29, prompt: "An isosceles triangle has one angle of 40°. If the 40° is the unique angle, what are the base angles?", options: ["40°", "60°", "70°", "80°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_exam_6", topicId: 29, prompt: "Two angles are vertically opposite. One is 72°. What is the other?", options: ["18°", "72°", "108°", "118°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ang_exam_7", topicId: 29, prompt: "What is the sum of interior angles in a quadrilateral?", options: ["180°", "270°", "360°", "540°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_exam_8", topicId: 29, prompt: "An angle is 250°. What type of angle is it?", options: ["Obtuse", "Right", "Straight", "Reflex", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ang_exam_9", topicId: 29, prompt: "Three angles in a triangle are in the ratio 1:2:3. What is the largest angle?", options: ["30°", "60°", "90°", "120°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "ang_exam_10", topicId: 29, prompt: "One angle of a right-angled triangle is 38°. What is the third angle?", options: ["38°", "42°", "52°", "62°", "I don't know / Wasn't taught"], correctIndex: 2),
        ],
        30: [
            MathExamQuestion(id: "sym_exam_1", topicId: 30, prompt: "A regular polygon has 8 lines of symmetry. What is the polygon?", options: ["Hexagon", "Heptagon", "Octagon", "Nonagon", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_2", topicId: 30, prompt: "A shape has rotational symmetry of order 5. Through how many degrees does it rotate each time it looks the same?", options: ["45°", "60°", "72°", "90°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_3", topicId: 30, prompt: "Point P is at (−2, 6). It is reflected in the line y = 0 (x-axis). What are the new coordinates?", options: ["(2, 6)", "(−2, −6)", "(2, −6)", "(6, −2)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_exam_4", topicId: 30, prompt: "Which shape has both rotational symmetry of order 2 AND exactly 2 lines of symmetry?", options: ["Square", "Equilateral triangle", "Rectangle", "Regular pentagon", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_5", topicId: 30, prompt: "A shape is reflected in the line x = 3. A point at (1, 4) maps to:", options: ["(5, 4)", "(1, −4)", "(3, 4)", "(6, 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sym_exam_6", topicId: 30, prompt: "A shape has rotational symmetry. Its order of rotation is 6. How many degrees does it rotate between each identical position?", options: ["36°", "45°", "60°", "72°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_7", topicId: 30, prompt: "Which capital letter has exactly 2 lines of symmetry?", options: ["Y", "T", "X", "C", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_8", topicId: 30, prompt: "A rhombus has how many lines of symmetry?", options: ["0", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sym_exam_9", topicId: 30, prompt: "Point Q is at (4, 7). It is reflected in the line y = x. What are the new coordinates?", options: ["(−4, −7)", "(7, 4)", "(−7, 4)", "(4, −7)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sym_exam_10", topicId: 30, prompt: "A regular star with 5 points  -  what is its order of rotational symmetry?", options: ["2", "3", "5", "10", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 31 – Percentages
        31: [
            MathExamQuestion(id: "pct_exam_1_t31", topicId: 31, prompt: "What is 45% as a decimal?", options: ["4.5", "0.045", "0.45", "45.0", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_2_t31", topicId: 31, prompt: "Convert 2/5 to a percentage.", options: ["25%", "35%", "40%", "52%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_3_t31", topicId: 31, prompt: "What is 30% of 250?", options: ["60", "70", "75", "90", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_4_t31", topicId: 31, prompt: "A jacket costs £120. It is reduced by 15%. What is the sale price?", options: ["£96", "£100", "£102", "£108", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_5_t31", topicId: 31, prompt: "A value increases from 400 to 500. What is the percentage increase?", options: ["20%", "25%", "40%", "80%", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_6_t31", topicId: 31, prompt: "If 40% of a number is 60, what is the number?", options: ["24", "100", "150", "240", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_7_t31", topicId: 31, prompt: "What is 7.5% of 200?", options: ["10", "15", "20", "75", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_8_t31", topicId: 31, prompt: "A population decreases from 800 to 680. What is the percentage decrease?", options: ["12%", "15%", "17%", "20%", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pct_exam_9_t31", topicId: 31, prompt: "A price is £60 after a 20% discount. What was the original price?", options: ["£48", "£72", "£75", "£80", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pct_exam_10_t31", topicId: 31, prompt: "Which is the largest: 3/8, 35%, or 0.4?", options: ["3/8", "35%", "0.4", "They are all equal", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 32 – Algebra Basics
        32: [
            MathExamQuestion(id: "alg_exam_1_t32", topicId: 32, prompt: "Simplify: 7x − 2x + 4x", options: ["5x", "7x", "9x", "13x", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_2_t32", topicId: 32, prompt: "Evaluate 3x + 2y when x = 4 and y = −1.", options: ["8", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_3_t32", topicId: 32, prompt: "Expand: 5(2x − 3)", options: ["7x − 8", "10x − 3", "10x − 15", "10x + 15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_4_t32", topicId: 32, prompt: "Simplify: 4ab − ab + 3ab", options: ["4ab", "5ab", "6ab", "7ab", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "alg_exam_5_t32", topicId: 32, prompt: "If p = −2, what is p² + 3p?", options: ["−2", "−10", "10", "2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_exam_6_t32", topicId: 32, prompt: "Which expression is equivalent to 6x + 9?", options: ["3(2x + 3)", "2(3x + 4)", "6(x + 9)", "9(x + 6)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_exam_7_t32", topicId: 32, prompt: "Simplify: 3(x + 2) + 2(x − 1)", options: ["5x + 4", "5x + 6", "5x + 8", "6x + 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "alg_exam_8_t32", topicId: 32, prompt: "Evaluate 2a² − 3b when a = 3, b = 2.", options: ["10", "12", "18", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "alg_exam_9_t32", topicId: 32, prompt: "A rectangle has length (2x + 5) and width 3. What is its perimeter?", options: ["6x + 5", "6x + 10", "6x + 15", "6x + 16", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "alg_exam_10_t32", topicId: 32, prompt: "Simplify: 4(x + 3) − 2(x + 1)", options: ["2x + 10", "2x + 5", "6x + 10", "2x + 14", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 33 – Solving Equations
        33: [
            MathExamQuestion(id: "eq_exam_1", topicId: 33, prompt: "Solve: 3x + 7 = 22", options: ["x = 4", "x = 5", "x = 6", "x = 7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_exam_2", topicId: 33, prompt: "Solve: 5x − 3 = 2x + 9", options: ["x = 2", "x = 3", "x = 4", "x = 6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_3", topicId: 33, prompt: "Solve: 4(x − 2) = 12", options: ["x = 3", "x = 4", "x = 5", "x = 7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_4", topicId: 33, prompt: "Solve: (2x + 6)/4 = 5", options: ["x = 5", "x = 7", "x = 8", "x = 10", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eq_exam_5", topicId: 33, prompt: "Solve: 7 − 2x = x − 5", options: ["x = 2", "x = 3", "x = 4", "x = 6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_6", topicId: 33, prompt: "Solve: 3(2x + 1) = 5(x + 2)", options: ["x = 5", "x = 6", "x = 7", "x = 9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_7", topicId: 33, prompt: "A number is tripled and 8 is subtracted to give 19. What is the number?", options: ["7", "8", "9", "11", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_8", topicId: 33, prompt: "Solve: x/5 − 3 = 1", options: ["x = 5", "x = 10", "x = 20", "x = 25", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_9", topicId: 33, prompt: "Solve: 2(x + 4) = 3(x − 1)", options: ["x = 5", "x = 7", "x = 11", "x = 14", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eq_exam_10", topicId: 33, prompt: "Solve: 4x/3 + 2 = 10", options: ["x = 4", "x = 6", "x = 8", "x = 12", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 34 – Inequalities
        34: [
            MathExamQuestion(id: "ineq_exam_1", topicId: 34, prompt: "Solve: 3x − 4 > 8", options: ["x > 3", "x > 4", "x > 5", "x > 12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_2", topicId: 34, prompt: "Solve: −4x ≥ 20", options: ["x ≥ −5", "x ≤ −5", "x ≥ 5", "x ≤ 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_3", topicId: 34, prompt: "List the integers satisfying: −3 < x ≤ 2", options: ["−2, −1, 0, 1, 2", "−3, −2, −1, 0, 1, 2", "−3, −2, −1, 0, 1", "−2, −1, 0, 1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "ineq_exam_4", topicId: 34, prompt: "Solve: 2(x + 5) < 16", options: ["x < 2", "x < 3", "x < 5", "x < 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_5", topicId: 34, prompt: "Solve: 5 − 2x ≥ 1", options: ["x ≤ 1", "x ≤ 2", "x ≥ 2", "x ≥ 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_6", topicId: 34, prompt: "Solve: (x + 3)/2 > 4", options: ["x > 4", "x > 5", "x > 7", "x > 11", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_7", topicId: 34, prompt: "Which values satisfy both x > 1 AND x < 5?", options: ["1, 2, 3, 4, 5", "2, 3, 4", "1, 2, 3, 4", "2, 3, 4, 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_8", topicId: 34, prompt: "Solve: 3x + 2 ≤ 5x − 4", options: ["x ≥ 2", "x ≥ 3", "x ≤ 2", "x ≤ 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "ineq_exam_9", topicId: 34, prompt: "On a number line, a closed circle at 4 pointing left represents:", options: ["x > 4", "x < 4", "x ≥ 4", "x ≤ 4", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "ineq_exam_10", topicId: 34, prompt: "Solve: 4 < 3x − 2 ≤ 13", options: ["2 < x ≤ 5", "2 ≤ x < 5", "1 < x ≤ 5", "2 < x < 5", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 35 – Speed Distance Time
        35: [
            MathExamQuestion(id: "sdt_exam_1", topicId: 35, prompt: "A car travels 180 km at 60 km/h. How long does it take?", options: ["2 hours", "3 hours", "4 hours", "6 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_2", topicId: 35, prompt: "A runner runs at 8 m/s for 45 seconds. How far do they run?", options: ["270 m", "320 m", "360 m", "400 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_exam_3", topicId: 35, prompt: "A cyclist travels 90 km in 2.5 hours. What is their average speed?", options: ["30 km/h", "36 km/h", "40 km/h", "45 km/h", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_4", topicId: 35, prompt: "Convert 54 km/h into m/s.", options: ["10 m/s", "15 m/s", "20 m/s", "54 m/s", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_5", topicId: 35, prompt: "A bus leaves at 10:15 and travels 120 km at 80 km/h. When does it arrive?", options: ["11:45", "12:00", "12:15", "12:30", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sdt_exam_6", topicId: 35, prompt: "Two cars start at the same place. Car A goes at 60 km/h, Car B at 90 km/h in the same direction. After 2 hours, how far apart are they?", options: ["30 km", "60 km", "90 km", "150 km", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_7", topicId: 35, prompt: "A train travels 500 km at 125 km/h. How long is the journey?", options: ["3 hours", "4 hours", "5 hours", "6 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_8", topicId: 35, prompt: "A person walks 4 km at 5 km/h then 6 km at 4 km/h. What is total travel time?", options: ["2 hours", "2.3 hours", "2.5 hours", "3 hours", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sdt_exam_9", topicId: 35, prompt: "If distance = 240 m and time = 30 seconds, what is speed in m/s?", options: ["4 m/s", "6 m/s", "8 m/s", "10 m/s", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "sdt_exam_10", topicId: 35, prompt: "A car's average speed is 70 km/h for a 3.5-hour journey. How far did it travel?", options: ["175 km", "210 km", "245 km", "280 km", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 36 – Area of Triangles & Quadrilaterals
        36: [
            MathExamQuestion(id: "area_exam_1", topicId: 36, prompt: "Find the area of a parallelogram with base 11 m and height 6 m.", options: ["17 m²", "34 m²", "66 m²", "132 m²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_exam_2", topicId: 36, prompt: "A trapezoid has parallel sides 9 cm and 15 cm and height 8 cm. What is its area?", options: ["72 cm²", "96 cm²", "144 cm²", "192 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_exam_3", topicId: 36, prompt: "A triangle has base 18 cm and height 10 cm. What is its area?", options: ["90 cm²", "80 cm²", "180 cm²", "72 cm²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "area_exam_4", topicId: 36, prompt: "A rectangle has area 84 cm² and width 7 cm. What is its length?", options: ["10 cm", "11 cm", "12 cm", "14 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_exam_5", topicId: 36, prompt: "A composite shape is a rectangle (12 × 5) with a triangle cut out (base 6, height 4). What is the remaining area?", options: ["42 cm²", "48 cm²", "54 cm²", "60 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_exam_6", topicId: 36, prompt: "A trapezoid has area 45 m², height 5 m, and one parallel side of 7 m. What is the other parallel side?", options: ["9 m", "10 m", "11 m", "18 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_exam_7", topicId: 36, prompt: "Two triangles each have base 8 cm and height 6 cm. What is the total area?", options: ["24 cm²", "48 cm²", "96 cm²", "192 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "area_exam_8", topicId: 36, prompt: "A parallelogram has area 96 cm² and height 8 cm. What is the base?", options: ["10 cm", "11 cm", "12 cm", "16 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "area_exam_9", topicId: 36, prompt: "A floor is shaped like an L: two rectangles of 6×4 and 3×2. What is the total area?", options: ["24 m²", "26 m²", "28 m²", "30 m²", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "area_exam_10", topicId: 36, prompt: "A kite has diagonals of 10 cm and 14 cm. Area = (d₁ × d₂)/2. What is its area?", options: ["35 cm²", "50 cm²", "70 cm²", "140 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 37 – Circles
        37: [
            MathExamQuestion(id: "circ_exam_1", topicId: 37, prompt: "Find the circumference of a circle with diameter 20 cm. (Use π ≈ 3.14)", options: ["31.4 cm", "62.8 cm", "125.6 cm", "314 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_2", topicId: 37, prompt: "Find the area of a circle with radius 9 cm. (Use π ≈ 3.14)", options: ["28.26 cm²", "56.52 cm²", "254.34 cm²", "508.68 cm²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_exam_3", topicId: 37, prompt: "A circle has circumference 94.2 cm. What is the radius? (Use π ≈ 3.14)", options: ["10 cm", "15 cm", "20 cm", "30 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_4", topicId: 37, prompt: "A semicircle has radius 7 cm. What is its area? (Use π ≈ 3.14)", options: ["43.96 cm²", "76.93 cm²", "153.86 cm²", "307.72 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_5", topicId: 37, prompt: "A circle has area 200.96 cm². What is its radius? (Use π ≈ 3.14)", options: ["4 cm", "6 cm", "8 cm", "10 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "circ_exam_6", topicId: 37, prompt: "A wheel of radius 0.5 m completes 100 rotations. How far does it travel? (Use π ≈ 3.14)", options: ["157 m", "314 m", "628 m", "1000 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_7", topicId: 37, prompt: "The area of a large circle is 4 times the area of a smaller one. What is the ratio of their radii?", options: ["1:2", "1:4", "2:1", "4:1", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "circ_exam_8", topicId: 37, prompt: "Find the perimeter of a semicircle with diameter 12 cm. (Use π ≈ 3.14, include diameter)", options: ["18.84 cm", "30.84 cm", "37.68 cm", "43.96 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_9", topicId: 37, prompt: "A circular pond has radius 5 m. A path of width 1 m surrounds it. What is the outer radius?", options: ["5 m", "6 m", "7 m", "10 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "circ_exam_10", topicId: 37, prompt: "What is the area of the annulus (ring) between circles of radius 5 and 3? (Use π ≈ 3.14)", options: ["25.12 cm²", "50.24 cm²", "78.5 cm²", "100.48 cm²", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 38 – Pythagoras Theorem
        38: [
            MathExamQuestion(id: "pyth_exam_1", topicId: 38, prompt: "Find the hypotenuse when a = 9 and b = 40.", options: ["41", "43", "49", "√1681", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_exam_2", topicId: 38, prompt: "Find the missing leg when c = 25 and a = 7.", options: ["18", "20", "24", "√576", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_exam_3", topicId: 38, prompt: "A 13 m ladder leans against a wall with the foot 5 m from the base. How high up the wall?", options: ["10 m", "12 m", "13 m", "15 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_exam_4", topicId: 38, prompt: "Do the sides 7, 24, 25 form a right-angled triangle?", options: ["Yes", "No", "Only approximately", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pyth_exam_5", topicId: 38, prompt: "Find the distance between (1, 2) and (4, 6).", options: ["3", "4", "5", "7", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_exam_6", topicId: 38, prompt: "A rectangle is 8 cm by 6 cm. What is the length of its diagonal?", options: ["8 cm", "9 cm", "10 cm", "14 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pyth_exam_7", topicId: 38, prompt: "Find c when a = 11 and b = 60.", options: ["60", "61", "62", "71", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_exam_8", topicId: 38, prompt: "An equilateral triangle has side 10 cm. What is its height? (Use Pythagoras)", options: ["5√2 cm", "5√3 cm", "√50 cm", "10√2 cm", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_exam_9", topicId: 38, prompt: "Find the missing leg when c = √200 and a = 10.", options: ["5√2", "10", "√100", "√300", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pyth_exam_10", topicId: 38, prompt: "The diagonal of a square is 8√2 cm. What is the side of the square?", options: ["4 cm", "8 cm", "8√2 cm", "16 cm", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 39 – Probability
        39: [
            MathExamQuestion(id: "prob_exam_1_t39", topicId: 39, prompt: "A bag has 4 red, 5 blue, and 6 green balls. What is P(blue)?", options: ["1/3", "4/15", "5/15", "6/15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_2_t39", topicId: 39, prompt: "P(A) = 0.35. What is P(not A)?", options: ["0.35", "0.55", "0.65", "0.75", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_3_t39", topicId: 39, prompt: "Two dice are rolled. What is P(both showing 3)?", options: ["1/6", "1/12", "1/36", "3/36", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_4_t39", topicId: 39, prompt: "From 52 cards, what is P(king or queen)?", options: ["1/13", "2/13", "4/52", "8/52", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_5_t39", topicId: 39, prompt: "In 200 trials, event A occurred 70 times. What is the relative frequency of A?", options: ["0.3", "0.35", "0.4", "0.7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_6_t39", topicId: 39, prompt: "P(A) = 0.4, P(B) = 0.3, A and B mutually exclusive. What is P(A or B)?", options: ["0.12", "0.5", "0.7", "1.2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_7_t39", topicId: 39, prompt: "A spinner has sectors of 1/4, 1/4, 1/2. Probability of the 1/2 sector is:", options: ["0.25", "0.5", "0.75", "1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_8_t39", topicId: 39, prompt: "There are 3 red and 2 blue balls. One is drawn and not replaced. What is P(second is red | first was red)?", options: ["3/5", "2/4", "2/5", "3/4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_9_t39", topicId: 39, prompt: "A fair die is rolled. What is P(greater than 4)?", options: ["1/6", "1/3", "1/2", "2/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_10_t39", topicId: 39, prompt: "In a class of 30, 12 like maths and 18 don't. If one student is chosen, P(likes maths) =", options: ["2/5", "3/5", "1/3", "2/3", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 40 – Statistics
        40: [
            MathExamQuestion(id: "stat_exam_1", topicId: 40, prompt: "Find the mean of: 5, 8, 12, 15, 20.", options: ["10", "11", "12", "15", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_exam_2", topicId: 40, prompt: "Find the median of: 4, 7, 9, 11, 13, 17.", options: ["9", "10", "11", "13", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_exam_3", topicId: 40, prompt: "The mean of 6 values is 14. What is their total?", options: ["14", "20", "84", "140", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_exam_4", topicId: 40, prompt: "Which measure of average should you use for non-numerical data (categories)?", options: ["Mean", "Median", "Mode", "Range", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_exam_5", topicId: 40, prompt: "Data: 3, 3, 5, 7, 8, 9, 9, 9. What is the mode?", options: ["3", "5", "7", "9", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "stat_exam_6", topicId: 40, prompt: "The mean of 5 numbers is 10. Four of them are 8, 9, 11, 12. What is the fifth?", options: ["8", "9", "10", "12", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "stat_exam_7", topicId: 40, prompt: "Data: 2, 4, 6, 8, 100. Which average best represents the data?", options: ["Mean (24)", "Median (6)", "Mode (none)", "Range (98)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_exam_8", topicId: 40, prompt: "Class A (30 students) has mean 65. Class B (20 students) has mean 75. What is combined mean?", options: ["68", "69", "70", "71", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "stat_exam_9", topicId: 40, prompt: "Find the range of: 4, −3, 12, 0, −7, 15.", options: ["15", "18", "20", "22", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "stat_exam_10", topicId: 40, prompt: "A grouped frequency table has 10 values in 0–10, 20 values in 10–20, and 30 values in 20–30. Which interval has the modal class?", options: ["0–10", "10–20", "20–30", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 41 – Linear Equations & Graphs
        41: [
            MathExamQuestion(id: "lin_exam_1", topicId: 41, prompt: "What is the gradient of y = −3x + 7?", options: ["7", "−7", "3", "−3", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "lin_exam_2", topicId: 41, prompt: "Find the equation of the line with gradient 2 passing through (3, 8).", options: ["y = 2x + 2", "y = 2x + 3", "y = 2x + 5", "y = 3x + 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_exam_3", topicId: 41, prompt: "Where does y = 4x − 8 cross the x-axis?", options: ["x = −2", "x = 2", "x = 4", "x = 8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_exam_4", topicId: 41, prompt: "Two lines are perpendicular. One has gradient 3. What is the other's gradient?", options: ["3", "−3", "1/3", "−1/3", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "lin_exam_5", topicId: 41, prompt: "Find the gradient of a line through (−1, 3) and (3, 11).", options: ["1", "2", "3", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_exam_6", topicId: 41, prompt: "Rearrange 3x + 2y = 12 into y = mx + c form.", options: ["y = −3x/2 + 6", "y = 3x/2 + 6", "y = −3/2 x + 6", "y = 2x/3 + 6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lin_exam_7", topicId: 41, prompt: "At what point do lines y = x + 3 and y = 2x − 1 intersect?", options: ["(3, 6)", "(4, 7)", "(5, 8)", "(2, 5)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_exam_8", topicId: 41, prompt: "Which line is parallel to y = 4x − 3?", options: ["y = −4x + 3", "y = 4x + 7", "y = 3x − 4", "y = 1/4 x + 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lin_exam_9", topicId: 41, prompt: "A line has gradient −2 and passes through (0, 5). What is y when x = 3?", options: ["−1", "0", "1", "11", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lin_exam_10", topicId: 41, prompt: "The midpoint of AB is (3, 4). A is (1, 2). What are the coordinates of B?", options: ["(4, 6)", "(5, 6)", "(4, 5)", "(5, 7)", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 42 – Simultaneous Equations
        42: [
            MathExamQuestion(id: "sim_exam_1", topicId: 42, prompt: "Solve: x + y = 10 and x − y = 4.", options: ["x=6, y=4", "x=7, y=3", "x=8, y=2", "x=5, y=5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_2", topicId: 42, prompt: "Solve: 3x + 2y = 16 and x + 2y = 8.", options: ["x=3, y=2", "x=4, y=2", "x=2, y=5", "x=4, y=3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_3", topicId: 42, prompt: "Solve by substitution: y = x + 1 and 2x + y = 10.", options: ["x=2, y=3", "x=3, y=4", "x=4, y=5", "x=5, y=0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_4", topicId: 42, prompt: "Solve: 5x − 2y = 11 and 3x + 2y = 13.", options: ["x=2, y=2", "x=3, y=2", "x=3, y=3", "x=2, y=3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_5", topicId: 42, prompt: "Two numbers sum to 15. One is twice the other. What are they?", options: ["4 and 11", "5 and 10", "6 and 9", "3 and 12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_6", topicId: 42, prompt: "Solve: 4x + 3y = 24 and 4x + y = 16.", options: ["x=3, y=4", "x=4, y=3", "x=3, y=3", "x=2, y=4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "sim_exam_7", topicId: 42, prompt: "Solve: 2x + 3y = 13 and 4x + 3y = 19.", options: ["x=2, y=3", "x=3, y=2", "x=3, y=3", "x=2, y=2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_8", topicId: 42, prompt: "Solve: 3x − 4y = −1 and 2x + y = 7.", options: ["x=2, y=3", "x=3, y=2", "x=3, y=1", "x=1, y=5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_9", topicId: 42, prompt: "Pencils cost p and rulers cost r. Two pencils and a ruler cost £1.50; one pencil and two rulers cost £1.80. Find p.", options: ["£0.30", "£0.40", "£0.50", "£0.60", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "sim_exam_10", topicId: 42, prompt: "Solve: x/2 + y = 5 and x − y = 1.", options: ["x=3, y=2", "x=4, y=3", "x=5, y=2", "x=2, y=4", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 43 – Expanding Brackets
        43: [
            MathExamQuestion(id: "exp_exam_1", topicId: 43, prompt: "Expand and simplify: (x + 5)(x − 2)", options: ["x² + 3x − 10", "x² − 3x − 10", "x² + 7x − 10", "x² + 3x + 10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_2", topicId: 43, prompt: "Expand: (2x − 3)²", options: ["4x² − 9", "4x² − 12x + 9", "4x² + 12x + 9", "4x² − 6x + 9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_exam_3", topicId: 43, prompt: "Expand: (3x + 1)(2x − 4)", options: ["6x² − 10x − 4", "6x² + 10x − 4", "5x² − 10x − 4", "6x² − 10x + 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_4", topicId: 43, prompt: "Expand and simplify: (x + 4)² − (x − 4)²", options: ["0", "8x", "16x", "32", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "exp_exam_5", topicId: 43, prompt: "Expand: (x + 2)(x² − 3x + 1)", options: ["x³ − x² − 5x + 2", "x³ + x² − 5x + 2", "x³ − x² + 5x + 2", "x³ − x² − 5x − 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_6", topicId: 43, prompt: "Expand: (4x − 5)(4x + 5)", options: ["16x² + 25", "16x² − 25", "16x² − 40x + 25", "16x² + 40x − 25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "exp_exam_7", topicId: 43, prompt: "Simplify: 3(2x − 1)² − 5", options: ["12x² − 12x − 2", "12x² − 12x + 3", "12x² − 12x − 8", "6x² − 6x − 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_8", topicId: 43, prompt: "Expand: (x + 1)(x + 2)(x + 3)", options: ["x³ + 6x² + 11x + 6", "x³ + 5x² + 9x + 6", "x³ + 6x² + 9x + 6", "x³ + 3x² + 6x + 6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_9", topicId: 43, prompt: "Expand and simplify: 2(x + 3)² − (2x + 1)²", options: ["−2x² + 8x + 17", "−2x² + 8x − 17", "2x² + 8x + 17", "2x² − 8x + 17", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "exp_exam_10", topicId: 43, prompt: "Expand: (x − 2)(x + 2) and state the product type.", options: ["Difference of two squares: x² − 4", "Sum of squares: x² + 4", "Perfect square: x² − 4x + 4", "Cubic: x³ − 8", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 44 – Factorising
        44: [
            MathExamQuestion(id: "fac_exam_1", topicId: 44, prompt: "Factorise fully: 12x² + 18x", options: ["6(2x² + 3x)", "6x(2x + 3)", "3x(4x + 6)", "12x(x + 18)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "fac_exam_2", topicId: 44, prompt: "Factorise: x² − 25", options: ["(x − 5)²", "(x + 5)²", "(x − 5)(x + 5)", "(x + 25)(x − 1)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "fac_exam_3", topicId: 44, prompt: "Factorise: x² + 8x + 15", options: ["(x + 3)(x + 5)", "(x + 1)(x + 15)", "(x + 5)²", "(x + 4)(x + 4)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_4", topicId: 44, prompt: "Factorise: 2x² + 9x + 4", options: ["(2x + 1)(x + 4)", "(2x + 4)(x + 1)", "(x + 2)(2x + 2)", "(2x + 9)(x + 1)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_5", topicId: 44, prompt: "Factorise fully: 3x² − 75", options: ["3(x − 5)(x + 5)", "3(x − 25)(x + 1)", "(3x − 5)(x + 5)", "3x(x − 25)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_6", topicId: 44, prompt: "Factorise: x² − 9x + 20", options: ["(x − 4)(x − 5)", "(x + 4)(x + 5)", "(x − 2)(x − 10)", "(x − 4)(x + 5)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_7", topicId: 44, prompt: "Factorise: 4x² − 12x + 9", options: ["(2x − 3)²", "(4x − 3)(x − 3)", "(2x + 3)²", "(2x − 3)(2x + 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_8", topicId: 44, prompt: "Factorise: 6x² − 7x − 3", options: ["(2x − 3)(3x + 1)", "(3x − 1)(2x + 3)", "(6x + 1)(x − 3)", "(2x + 1)(3x − 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_9", topicId: 44, prompt: "Simplify by factorising: (x² − 4) / (x + 2)", options: ["x − 2", "x + 2", "x² − 2", "x − 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "fac_exam_10", topicId: 44, prompt: "Factorise: x⁴ − 16", options: ["(x² − 4)(x² + 4)", "(x − 2)(x + 2)(x² + 4)", "(x² − 4)²", "(x − 4)(x + 4)", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 45 – Quadratic Equations
        45: [
            MathExamQuestion(id: "quad_exam_1", topicId: 45, prompt: "Solve: x² + 7x + 10 = 0", options: ["x = −2, x = −5", "x = 2, x = 5", "x = −2, x = 5", "x = 2, x = −5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_2", topicId: 45, prompt: "Use the formula to solve x² − 6x + 5 = 0.", options: ["x = 1, x = 5", "x = −1, x = −5", "x = 2, x = 3", "x = 1, x = −5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_3", topicId: 45, prompt: "For 3x² − 5x − 2 = 0, use the formula. What are the solutions?", options: ["x = 2, x = −1/3", "x = −2, x = 1/3", "x = 2, x = 1/3", "x = −2, x = −1/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_4", topicId: 45, prompt: "For x² + 4x + 4 = 0, how many solutions are there?", options: ["0", "1 (repeated)", "2", "Infinite", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_exam_5", topicId: 45, prompt: "For x² + x + 3 = 0, the discriminant is 1 − 12 = −11. This means:", options: ["Two real solutions", "One real solution", "No real solutions", "Infinite solutions", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "quad_exam_6", topicId: 45, prompt: "Solve 4x² = 16.", options: ["x = ±2", "x = ±4", "x = 2", "x = 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_7", topicId: 45, prompt: "The product of two consecutive integers is 72. What are they?", options: ["8 and 9", "7 and 10", "6 and 12", "9 and 8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_8", topicId: 45, prompt: "Solve 2x² + 3x − 9 = 0.", options: ["x = 3/2, x = −3", "x = −3/2, x = 3", "x = 3, x = −3/2", "x = 3/2, x = 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "quad_exam_9", topicId: 45, prompt: "Complete the square: x² + 6x − 7 = 0. Rewritten as (x + a)² = b:", options: ["(x + 3)² = 16", "(x + 6)² = 43", "(x + 3)² = 7", "(x + 3)² = 43", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "quad_exam_10", topicId: 45, prompt: "A ball is thrown up; height h = −5t² + 20t. When does it hit the ground (h = 0)?", options: ["t = 2", "t = 4", "t = 5", "t = 20", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 46 – Powers & Indices
        46: [
            MathExamQuestion(id: "pow_exam_1", topicId: 46, prompt: "Simplify: x⁵ × x³ ÷ x⁴", options: ["x²", "x⁴", "x¹²", "x⁶", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_exam_2", topicId: 46, prompt: "Evaluate: 64^(2/3)", options: ["4", "8", "16", "32", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_exam_3", topicId: 46, prompt: "Simplify: (3x²y)³", options: ["9x⁶y³", "27x⁶y³", "27x⁵y³", "27x⁶y", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_exam_4", topicId: 46, prompt: "What is 5⁻²?", options: ["−10", "−1/25", "1/25", "1/10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "pow_exam_5", topicId: 46, prompt: "Solve: 4^x = 64", options: ["x = 2", "x = 3", "x = 4", "x = 16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_exam_6", topicId: 46, prompt: "Simplify: (a^(1/3))⁶", options: ["a", "a²", "a³", "a^(1/2)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_exam_7", topicId: 46, prompt: "Evaluate: (1/2)^(−3)", options: ["−8", "1/8", "6", "8", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "pow_exam_8", topicId: 46, prompt: "Simplify: 2^8 ÷ 2^5", options: ["2³", "2⁴", "2¹³", "2⁴⁰", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "pow_exam_9", topicId: 46, prompt: "Solve for x: 9^x = 27", options: ["x = 1", "x = 3/2", "x = 2", "x = 3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "pow_exam_10", topicId: 46, prompt: "Simplify: (16x⁴)^(1/2)", options: ["4x²", "8x²", "4x", "16x²", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 47 – Standard Form
        47: [
            MathExamQuestion(id: "std_exam_1", topicId: 47, prompt: "Write 0.000475 in standard form.", options: ["4.75 × 10⁻⁴", "4.75 × 10⁻³", "47.5 × 10⁻⁵", "4.75 × 10⁴", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_exam_2", topicId: 47, prompt: "Calculate: (6 × 10⁵) × (3 × 10⁻²)", options: ["1.8 × 10⁴", "9 × 10³", "18 × 10³", "9 × 10⁷", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_exam_3", topicId: 47, prompt: "Convert 3.07 × 10⁶ to an ordinary number.", options: ["30,700", "307,000", "3,070,000", "30,700,000", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "std_exam_4", topicId: 47, prompt: "Calculate: (9 × 10⁸) ÷ (3 × 10⁵)", options: ["3 × 10²", "3 × 10³", "6 × 10³", "3 × 10⁴", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_exam_5", topicId: 47, prompt: "The sun is 1.5 × 10⁸ km from Earth. Light travels at 3 × 10⁵ km/s. How long (in seconds) does light take to reach Earth?", options: ["500 s", "5 × 10² s", "5000 s", "Both a and b", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "std_exam_6", topicId: 47, prompt: "Order from smallest to largest: 2 × 10³, 5 × 10², 4 × 10³", options: ["5×10², 2×10³, 4×10³", "2×10³, 4×10³, 5×10²", "4×10³, 2×10³, 5×10²", "5×10², 4×10³, 2×10³", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_exam_7", topicId: 47, prompt: "Add: (1.2 × 10⁴) + (8 × 10³)", options: ["2 × 10⁴", "1.28 × 10⁴", "2.0 × 10⁷", "9.2 × 10³", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_exam_8", topicId: 47, prompt: "Calculate (4 × 10³)³", options: ["64 × 10⁶", "6.4 × 10¹⁰", "4 × 10⁹", "12 × 10⁹", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "std_exam_9", topicId: 47, prompt: "A grain of sand has mass 6.7 × 10⁻⁵ g. What is the mass of 1000 grains?", options: ["6.7 × 10⁻² g", "6.7 × 10⁻³ g", "6.7 × 10⁻⁸ g", "6.7 × 10² g", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "std_exam_10", topicId: 47, prompt: "Which is larger: 3.2 × 10⁻⁴ or 4.1 × 10⁻⁵?", options: ["4.1 × 10⁻⁵", "3.2 × 10⁻⁴", "They are equal", "Cannot compare", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 48 – Surds
        48: [
            MathExamQuestion(id: "surd_exam_1", topicId: 48, prompt: "Simplify: √(108)", options: ["6√3", "4√3", "9√3", "3√12", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_2", topicId: 48, prompt: "Rationalise: 4/√3", options: ["4√3/3", "4/√3", "√3/4", "4√3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_3", topicId: 48, prompt: "Expand and simplify: (√5 + 2)²", options: ["9 + 4√5", "5 + 4√5", "7 + 4√5", "5 + 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_4", topicId: 48, prompt: "Simplify: 3√50 − 2√8", options: ["11√2", "7√2", "√42", "13√2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_5", topicId: 48, prompt: "Simplify: (√6 + √3)(√6 − √3)", options: ["3", "9", "√3", "6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_6", topicId: 48, prompt: "Rationalise: 1/(2 + √3)", options: ["2 − √3", "2 + √3", "1/(2 − √3)", "2 − 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_7", topicId: 48, prompt: "Simplify: √2 × √8 × √3", options: ["4√3", "2√6", "4√6", "8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "surd_exam_8", topicId: 48, prompt: "If √x = 2√5, what is x?", options: ["10", "20", "40", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "surd_exam_9", topicId: 48, prompt: "Simplify: (3 + √2)² − (3 − √2)²", options: ["4√2", "6√2", "12√2", "2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "surd_exam_10", topicId: 48, prompt: "In a right triangle with legs √3 and √7, the hypotenuse is:", options: ["√10", "√21", "√4", "√11", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 49 – Trigonometry Basics
        49: [
            MathExamQuestion(id: "trig_exam_1", topicId: 49, prompt: "In a right triangle, angle = 35°, hypotenuse = 12. Find the opposite side. (sin 35° ≈ 0.574)", options: ["5.74", "6.88", "7.21", "9.83", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_2", topicId: 49, prompt: "Find the angle if opposite = 7 and hypotenuse = 14.", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trig_exam_3", topicId: 49, prompt: "A 10 m ladder makes a 65° angle with the ground. How high up the wall? (sin 65° ≈ 0.906)", options: ["7.66 m", "8.45 m", "9.06 m", "10 m", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_exam_4", topicId: 49, prompt: "Find the adjacent side: angle 40°, hypotenuse 15. (cos 40° ≈ 0.766)", options: ["9.64 m", "11.49 m", "13.5 m", "9.0 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_5", topicId: 49, prompt: "sin²θ + cos²θ = ?", options: ["0", "0.5", "1", "2", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trig_exam_6", topicId: 49, prompt: "From 50 m away, the angle of elevation of a tower top is 32°. How tall? (tan 32° ≈ 0.625)", options: ["25.6 m", "31.25 m", "42.4 m", "50 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_7", topicId: 49, prompt: "In a 30-60-90 triangle with hypotenuse 20, the shorter leg (opposite 30°) is:", options: ["5", "10", "10√3", "20√3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_8", topicId: 49, prompt: "cos(60°) = ?", options: ["0", "0.5", "√3/2", "1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_9", topicId: 49, prompt: "A ramp is 6 m long at angle 25°. What horizontal distance does it cover? (cos 25° ≈ 0.906)", options: ["4.5 m", "5.44 m", "6.0 m", "2.54 m", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trig_exam_10", topicId: 49, prompt: "tan(θ) = opposite/adjacent. Find θ when opposite = 10 and adjacent = 10. θ = ?", options: ["30°", "45°", "60°", "90°", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 50 – Vectors
        50: [
            MathExamQuestion(id: "vec_exam_1", topicId: 50, prompt: "Find |v| where v = (−6, 8).", options: ["2", "10", "14", "100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_exam_2", topicId: 50, prompt: "If OA = (3, −1) and OB = (7, 5), find vector AB.", options: ["(4, 6)", "(10, 4)", "(4, −6)", "(−4, 6)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_3", topicId: 50, prompt: "Given a = 2i − j and b = i + 3j, find 2a − b.", options: ["3i − 5j", "5i − 5j", "3i + 5j", "4i − 2j", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_4", topicId: 50, prompt: "If M is the midpoint of PQ, OP = (2, 4), OQ = (8, 10), find OM.", options: ["(5, 7)", "(6, 7)", "(3, 3)", "(10, 14)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_5", topicId: 50, prompt: "ABCD is a parallelogram. AB = (3, 1) and AD = (1, 4). Find AC.", options: ["(4, 5)", "(2, 3)", "(3, 4)", "(4, 3)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_6", topicId: 50, prompt: "OA = a, OB = 3a. Are A, O, B collinear?", options: ["Yes, all lie on the same line through O", "No, they form a triangle", "Only if a = 0", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_7", topicId: 50, prompt: "Find unit vector in direction of (5, 12).", options: ["(5/13, 12/13)", "(5/12, 1)", "(1/5, 1/12)", "(5, 12)/13", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_8", topicId: 50, prompt: "A ship starts at O and moves with velocity (4, 3) m/s for 5 seconds. How far from O?", options: ["20 m", "25 m", "35 m", "7 m × 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "vec_exam_9", topicId: 50, prompt: "G divides PQ in ratio 1:2. OP = p, OQ = q. Find OG.", options: ["(2p + q)/3", "(p + 2q)/3", "(p + q)/2", "(p + q)/3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "vec_exam_10", topicId: 50, prompt: "Vectors a = (2, k) and b = (6, 9) are parallel. Find k.", options: ["2", "3", "4", "6", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 51 – Sequences & Series
        51: [
            MathExamQuestion(id: "seq_exam_1", topicId: 51, prompt: "Find the 15th term of arithmetic sequence: 3, 7, 11, ...", options: ["55", "57", "59", "61", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_exam_2", topicId: 51, prompt: "A geometric sequence has first term 2 and ratio 3. What is the 5th term?", options: ["54", "162", "486", "1458", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_exam_3", topicId: 51, prompt: "Sum of arithmetic series: first term 5, last term 85, 17 terms. S = ?", options: ["680", "765", "850", "935", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_exam_4", topicId: 51, prompt: "Nth term of a sequence is 4n − 1. Which term equals 79?", options: ["18", "19", "20", "21", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_exam_5", topicId: 51, prompt: "Geometric series: first term 80, ratio 0.5. What is sum to infinity?", options: ["80", "120", "160", "240", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "seq_exam_6", topicId: 51, prompt: "Find the nth term of: 5, 8, 13, 20, 29, ...", options: ["n² + 4", "n² + n + 3", "3n + 2", "2n² + 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "seq_exam_7", topicId: 51, prompt: "An arithmetic series has 20 terms, first term 1, common difference 3. Find the sum.", options: ["590", "610", "630", "650", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_exam_8", topicId: 51, prompt: "A geometric series has first term 6, ratio 2. Which term equals 384?", options: ["6th", "7th", "8th", "9th", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_exam_9", topicId: 51, prompt: "The 4th term is 22 and 7th term is 37 (arithmetic). Find common difference.", options: ["4", "5", "6", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "seq_exam_10", topicId: 51, prompt: "Sum of geometric series: a = 3, r = 2, n = 6.", options: ["87", "93", "189", "375", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 52 – Functions
        52: [
            MathExamQuestion(id: "func_exam_1", topicId: 52, prompt: "f(x) = 4x − 3. Find f(5).", options: ["15", "17", "19", "23", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_exam_2", topicId: 52, prompt: "Find the inverse of f(x) = 3x + 6.", options: ["f⁻¹(x) = (x − 6)/3", "f⁻¹(x) = (x + 6)/3", "f⁻¹(x) = 3(x + 6)", "f⁻¹(x) = x/3 + 6", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_exam_3", topicId: 52, prompt: "f(x) = x + 2, g(x) = 3x. Find fg(4).", options: ["14", "16", "18", "24", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_exam_4", topicId: 52, prompt: "Find gf(4) where f(x) = x + 2, g(x) = 3x.", options: ["14", "18", "20", "24", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_exam_5", topicId: 52, prompt: "What value is excluded from the domain of h(x) = √(x − 4)?", options: ["x < 4", "x = 4", "x > 4", "No exclusions", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_exam_6", topicId: 52, prompt: "f(x) = 2x² − 1. Find f(−3).", options: ["13", "15", "17", "19", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "func_exam_7", topicId: 52, prompt: "Find x if f(x) = 15, where f(x) = 4x − 1.", options: ["x = 3", "x = 4", "x = 5", "x = 6", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "func_exam_8", topicId: 52, prompt: "Which function is its own inverse (f = f⁻¹)?", options: ["f(x) = x + 1", "f(x) = x", "f(x) = x²", "f(x) = 1/x", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "func_exam_9", topicId: 52, prompt: "f(x) = 5 − 2x. Find the inverse f⁻¹(x).", options: ["(5 − x)/2", "(x − 5)/2", "(5 + x)/2", "5 − x/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "func_exam_10", topicId: 52, prompt: "f: x → x² + 1 and g: x → √x. Find gf(3).", options: ["√10", "3", "√7", "10", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 53 – Transformations of Graphs
        53: [
            MathExamQuestion(id: "trf_exam_1", topicId: 53, prompt: "y = f(x − 3) + 2 translates the graph:", options: ["Right 3, up 2", "Left 3, up 2", "Right 3, down 2", "Left 3, down 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_exam_2", topicId: 53, prompt: "What is the image of (3, −2) under y = −f(x)?", options: ["(3, 2)", "(−3, 2)", "(−3, −2)", "(3, −2)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_exam_3", topicId: 53, prompt: "y = f(x/3) stretches the graph:", options: ["Vertically ×3", "Horizontally ×3", "Vertically ×1/3", "Horizontally ×1/3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_exam_4", topicId: 53, prompt: "A curve y = x² is reflected in the y-axis. Its equation becomes:", options: ["y = −x²", "y = x² (unchanged)", "y = (−x)² = x²", "y = 1/x²", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_exam_5", topicId: 53, prompt: "Transformation: y = f(x) → y = f(x + 2) − 5. Describe it.", options: ["Left 2, down 5", "Right 2, down 5", "Left 2, up 5", "Right 2, up 5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_exam_6", topicId: 53, prompt: "y = 1/2 f(x) is a:", options: ["Vertical stretch ×2", "Vertical compression (×1/2)", "Horizontal stretch", "Translation", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_exam_7", topicId: 53, prompt: "A point (6, 4) on y = f(x) maps to (6, 4) after which transformation?", options: ["y = f(x) + 1", "y = 2f(x)", "y = f(x)", "y = f(x − 2)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "trf_exam_8", topicId: 53, prompt: "y = sinx is transformed to y = sin(2x). This:", options: ["Doubles the period", "Halves the period", "Doubles the amplitude", "Shifts right π/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "trf_exam_9", topicId: 53, prompt: "Describe: y = 3f(2x) in two transformations.", options: ["Horizontal compression ×1/2, vertical stretch ×3", "Horizontal stretch ×2, vertical stretch ×3", "Vertical compression, horizontal stretch", "Shift right 2, stretch 3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "trf_exam_10", topicId: 53, prompt: "If y = f(x) has max point (2, 5), what is the max point of y = f(x − 1) + 3?", options: ["(1, 8)", "(3, 8)", "(2, 8)", "(3, 5)", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 54 – Circle Theorems
        54: [
            MathExamQuestion(id: "cth_exam_1", topicId: 54, prompt: "Inscribed angle ACB = 35°. What is the central angle AOB?", options: ["35°", "55°", "70°", "140°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_2", topicId: 54, prompt: "In cyclic quadrilateral ABCD, angle B = 78°. What is angle D?", options: ["78°", "90°", "102°", "282°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_3", topicId: 54, prompt: "Tangent PT meets circle at T. OT is a radius. Angle OTP = ?", options: ["45°", "60°", "90°", "180°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_4", topicId: 54, prompt: "Two chords AB and CD intersect at P inside the circle. PA=3, PB=8, PC=4. Find PD.", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_5", topicId: 54, prompt: "Tangent-chord angle at point A = 48°. The inscribed angle in the alternate segment = ?", options: ["42°", "48°", "96°", "132°", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_exam_6", topicId: 54, prompt: "The angle in a semicircle is 90°. The triangle formed is always:", options: ["Equilateral", "Isosceles", "Right-angled", "Obtuse", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_7", topicId: 54, prompt: "Two equal chords are equidistant from:", options: ["Each other", "The tangent", "The centre", "The circumference", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_8", topicId: 54, prompt: "Angle AOB (central) = 100°. Reflex angle AOB = ?", options: ["100°", "200°", "260°", "280°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "cth_exam_9", topicId: 54, prompt: "External point P, tangent lengths PA = PB. Triangle PAB is:", options: ["Equilateral", "Isosceles with PA=PB", "Right-angled at A", "Scalene", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "cth_exam_10", topicId: 54, prompt: "A, B, C, D are points on a circle. Angle BAD + angle BCD = ?", options: ["90°", "180°", "270°", "360°", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 55 – Logarithms
        55: [
            MathExamQuestion(id: "log_exam_1", topicId: 55, prompt: "Evaluate: log₂(64)", options: ["4", "5", "6", "8", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_exam_2", topicId: 55, prompt: "Solve: log₃(x) = 4", options: ["x = 12", "x = 64", "x = 81", "x = 27", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "log_exam_3", topicId: 55, prompt: "Simplify: log(6) + log(5) − log(3)", options: ["log(8)", "log(10)", "log(90/3)", "log(2) + log(5)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_exam_4", topicId: 55, prompt: "Solve: log(x²) = 4 (base 10)", options: ["x = ±10", "x = ±100", "x = 10", "x = 100", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_exam_5", topicId: 55, prompt: "Solve: 5^x = 125", options: ["x = 2", "x = 3", "x = 4", "x = 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_exam_6", topicId: 55, prompt: "log₂(1/8) = ?", options: ["−3", "−1/3", "1/3", "3", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "log_exam_7", topicId: 55, prompt: "Solve: 2^(x+1) = 16. What is x?", options: ["2", "3", "4", "7", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_exam_8", topicId: 55, prompt: "If log(2) ≈ 0.301, find log(8).", options: ["0.601", "0.903", "0.904", "1.204", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "log_exam_9", topicId: 55, prompt: "Solve: log₅(x) + log₅(4) = log₅(20)", options: ["x = 5", "x = 16", "x = 80", "x = 4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "log_exam_10", topicId: 55, prompt: "Solve 3^x = 50 using logs (log 3 ≈ 0.477, log 50 ≈ 1.699). x ≈ ?", options: ["2.5", "3.0", "3.56", "4.0", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 56 – Binomial Theorem
        56: [
            MathExamQuestion(id: "binom_exam_1", topicId: 56, prompt: "Find the coefficient of x³ in the expansion of (1 + x)⁶.", options: ["10", "15", "20", "30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_exam_2", topicId: 56, prompt: "Evaluate C(9, 4).", options: ["84", "126", "210", "252", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_exam_3", topicId: 56, prompt: "Find the 4th term in the expansion of (2x − 1)⁵.", options: ["−80x²", "80x²", "−40x²", "40x²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "binom_exam_4", topicId: 56, prompt: "The coefficient of x⁴ in (1 + 2x)⁷ is C(7,4) × 2⁴ = ?", options: ["280", "560", "35", "140", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "binom_exam_5", topicId: 56, prompt: "In (1 + x)ⁿ, the sum of all coefficients equals:", options: ["n", "2n", "2ⁿ", "n!", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_exam_6", topicId: 56, prompt: "C(n,r) + C(n,r+1) = ?", options: ["C(n+1,r)", "C(n+1,r+1)", "C(n,r+1)", "2C(n,r)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_exam_7", topicId: 56, prompt: "Find the term independent of x in (x + 2/x)⁶.", options: ["60", "120", "160", "240", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_exam_8", topicId: 56, prompt: "Expand (1 − x)⁴. Which term has the largest coefficient magnitude?", options: ["First", "Second", "Third (6x²)", "Fourth", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "binom_exam_9", topicId: 56, prompt: "C(2n, n) where n = 3 equals:", options: ["15", "20", "30", "35", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "binom_exam_10", topicId: 56, prompt: "The general term (rth term) of (a + b)ⁿ is C(n, r−1) × aⁿ⁻ʳ⁺¹ × bʳ⁻¹. Find the 5th term of (x + 1)⁸.", options: ["56x⁴", "70x⁴", "56x³", "70x⁵", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 57 – Advanced Circle Theorems
        57: [
            MathExamQuestion(id: "advcir_exam_1", topicId: 57, prompt: "In a circle, angle ADB = 65° (inscribed). Find central angle AOB.", options: ["32.5°", "65°", "130°", "230°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_exam_2", topicId: 57, prompt: "In cyclic quad PQRS, ∠P = 82°. Find ∠R.", options: ["82°", "90°", "98°", "278°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_exam_3", topicId: 57, prompt: "Chord = 24 cm, perpendicular from centre = 5 cm. Radius = ?", options: ["10 cm", "12 cm", "13 cm", "14 cm", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_exam_4", topicId: 57, prompt: "Two tangents from external point P: PA = 15 cm. PB = ?", options: ["7.5 cm", "10 cm", "12 cm", "15 cm", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "advcir_exam_5", topicId: 57, prompt: "Tangent-chord angle = 72°. Alternate segment angle = ?", options: ["18°", "36°", "72°", "108°", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_exam_6", topicId: 57, prompt: "Secant: PA = 4, PB = 9. Tangent PT² = PA × PB. PT = ?", options: ["5", "6", "√36 = 6", "13", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_exam_7", topicId: 57, prompt: "Chords PQ and RS intersect at T: PT = 6, TQ = 8, RT = 4. TS = ?", options: ["6", "8", "12", "16", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "advcir_exam_8", topicId: 57, prompt: "∠ACB = 90° (angle in semicircle). If AC = 6, CB = 8, AB = ?", options: ["10", "12", "14", "√100 = 10", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "advcir_exam_9", topicId: 57, prompt: "Two circles intersect. The common chord is perpendicular to the line joining:", options: ["Tangent points", "The two centres", "Intersection points", "The radii", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "advcir_exam_10", topicId: 57, prompt: "Arc AB subtends ∠AOB = 150° at the centre. Inscribed ∠ACB in minor segment = ?", options: ["75°", "105°", "150°", "210°", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 58 – Exponential & Log Functions
        58: [
            MathExamQuestion(id: "explog_exam_1", topicId: 58, prompt: "Solve: e^(2x) = 10. x = ? (ln 10 ≈ 2.303)", options: ["x ≈ 0.576", "x ≈ 1.151", "x ≈ 2.303", "x ≈ 5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_2", topicId: 58, prompt: "Differentiate y = e^(x²). dy/dx = ?", options: ["e^(x²)", "2xe^(x²)", "x²e^(x²−1)", "2e^(x²)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_3", topicId: 58, prompt: "∫(1/x) dx from 1 to e = ?", options: ["0", "1", "e", "e − 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_4", topicId: 58, prompt: "ln(a) − ln(b) = ?", options: ["ln(a+b)", "ln(ab)", "ln(a/b)", "ln(a−b)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "explog_exam_5", topicId: 58, prompt: "A population grows: P = 1000e^(0.04t). Find t when P = 3000. (ln3 ≈ 1.099)", options: ["t ≈ 20", "t ≈ 25", "t ≈ 27.5", "t ≈ 30", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "explog_exam_6", topicId: 58, prompt: "Differentiate y = ln(3x² + 1). dy/dx = ?", options: ["1/(3x²+1)", "6x/(3x²+1)", "3x/(3x²+1)", "6x × ln(3x²+1)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_7", topicId: 58, prompt: "Solve: 4 × 3^x = 100. x = ? (log 3 ≈ 0.477, log 25 ≈ 1.398)", options: ["x ≈ 2.1", "x ≈ 2.9", "x ≈ 3.3", "x ≈ 4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_8", topicId: 58, prompt: "The inverse of y = eˣ is:", options: ["y = xᵉ", "y = ln(x)", "y = 1/eˣ", "y = e^(1/x)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_9", topicId: 58, prompt: "∫e^(−x) dx = ?", options: ["e^(−x) + C", "−e^(−x) + C", "e^(x) + C", "−1/e^x + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "explog_exam_10", topicId: 58, prompt: "log₂(x) = log(x)/log(2). log₂(50) ≈ ? (log 50 ≈ 1.699, log 2 ≈ 0.301)", options: ["4.5", "5.0", "5.64", "6.0", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 59 – Differentiation
        59: [
            MathExamQuestion(id: "diff_exam_1", topicId: 59, prompt: "Find dy/dx if y = 4x³ − 5x + 2.", options: ["12x² − 5", "4x² − 5", "12x³ − 5x", "4x³ − 5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_exam_2", topicId: 59, prompt: "Differentiate y = (x² + 1)⁵ using chain rule.", options: ["5(x²+1)⁴", "10x(x²+1)⁴", "5x(x²+1)⁴", "2x(x²+1)⁵", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_exam_3", topicId: 59, prompt: "Find the equation of the tangent to y = x² at x = 3.", options: ["y = 6x − 3", "y = 6x − 9", "y = 3x + 9", "y = 6x + 9", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_exam_4", topicId: 59, prompt: "y = sin(x)cos(x). dy/dx using product rule = ?", options: ["cos²x − sin²x", "cos(2x)", "Both a and b", "2sin(x)cos(x)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "diff_exam_5", topicId: 59, prompt: "Find the stationary point of y = x³ − 3x.", options: ["x = 0", "x = ±1", "x = ±3", "x = ±√3", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_exam_6", topicId: 59, prompt: "d²y/dx² of y = sin(x) = ?", options: ["cos(x)", "−cos(x)", "sin(x)", "−sin(x)", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "diff_exam_7", topicId: 59, prompt: "Differentiate y = x/(x+1) using quotient rule.", options: ["1/(x+1)²", "x/(x+1)²", "1/(x+1)", "(x+1)/x²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_exam_8", topicId: 59, prompt: "The rate of change of volume V = (4/3)πr³ with respect to r when r = 3 is:", options: ["12π", "36π", "108π", "4π", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diff_exam_9", topicId: 59, prompt: "Implicit differentiation: x² + y² = 25. Find dy/dx.", options: ["−x/y", "x/y", "y/x", "−y/x", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diff_exam_10", topicId: 59, prompt: "At a local minimum, f'(x) = 0 and f''(x) is:", options: ["Negative", "Zero", "Positive", "Undefined", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 60 – Integration
        60: [
            MathExamQuestion(id: "integ_exam_1", topicId: 60, prompt: "Evaluate ∫₀³ (x² + 2) dx.", options: ["9", "12", "15", "18", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "integ_exam_2", topicId: 60, prompt: "∫(4x³ − 3x² + 2) dx = ?", options: ["x⁴ − x³ + 2x + C", "12x² − 6x + C", "4x⁴ − 3x³ + 2x + C", "x⁴ + x³ + 2x + C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_exam_3", topicId: 60, prompt: "Area between y = x² and y = x (from 0 to 1) = ?", options: ["1/6", "1/4", "1/3", "1/2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_exam_4", topicId: 60, prompt: "∫ x sin(x) dx (by parts, u=x, dv=sin x) = ?", options: ["−x cos(x) + sin(x) + C", "x cos(x) + sin(x) + C", "x sin(x) + cos(x) + C", "−x sin(x) + cos(x) + C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_exam_5", topicId: 60, prompt: "Evaluate ∫₁ᵉ (1/x) dx.", options: ["0", "1", "e", "ln(e)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_exam_6", topicId: 60, prompt: "∫ cos²(x) dx using identity cos²x = (1 + cos2x)/2 gives:", options: ["sin²(x)/2 + C", "x/2 + sin(2x)/4 + C", "x + sin(2x) + C", "cos(x)sin(x) + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_exam_7", topicId: 60, prompt: "Substitution: ∫ 2x cos(x²) dx. Let u = x². Result = ?", options: ["sin(x²) + C", "cos(x²) + C", "2cos(x²) + C", "sin(x) + C", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "integ_exam_8", topicId: 60, prompt: "Volume of revolution: V = π∫ᵃᵇ y² dx. For y = x from 0 to 3, V = ?", options: ["3π", "9π", "27π/2 = 9π", "9π", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "integ_exam_9", topicId: 60, prompt: "∫ (3x + 1)⁻¹ dx = ?", options: ["ln(3x+1) + C", "(1/3)ln|3x+1| + C", "3 ln|3x+1| + C", "ln|3x| + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "integ_exam_10", topicId: 60, prompt: "∫₋₁¹ x³ dx = ? (odd function over symmetric interval)", options: ["0", "1/2", "1", "2", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        // MARK: Exam Topic 61 – Differential Equations
        61: [
            MathExamQuestion(id: "diffeq_exam_1", topicId: 61, prompt: "Solve dy/dx = 3x². y = ?", options: ["3x + C", "x³ + C", "3x³ + C", "x²/2 + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_exam_2", topicId: 61, prompt: "Solve dy/dx = 2y with y(0) = 3.", options: ["y = 3e^(2x)", "y = 3 + 2x", "y = 2e^(3x)", "y = 3 × 2ˣ", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diffeq_exam_3", topicId: 61, prompt: "Separable: dy/dx = xy. Solve.", options: ["y = Ce^x", "y = Ce^(x²/2)", "y = Cx", "y = Ce^(xy)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_exam_4", topicId: 61, prompt: "Newton's cooling: dT/dt = −k(T − 20). T(0) = 80. Particular solution:", options: ["T = 80e^(−kt)", "T = 20 + 60e^(−kt)", "T = 60e^(−kt) − 20", "T = 80 − 60e^(kt)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_exam_5", topicId: 61, prompt: "Second order: y'' + 4y' + 4y = 0. Characteristic equation?", options: ["m² + 4m + 4 = 0", "m² − 4m + 4 = 0", "m + 4 = 0", "m² + 4 = 0", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diffeq_exam_6", topicId: 61, prompt: "y'' + 4y' + 4y = 0 has repeated root m = −2. General solution:", options: ["y = (A + Bx)e^(−2x)", "y = Ae^(−2x) + Be^(2x)", "y = e^(−2x)(Acos2x + Bsin2x)", "y = Ae^(−2x)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diffeq_exam_7", topicId: 61, prompt: "Solve d²y/dx² = 12x − 2 with y(0) = 1, y'(0) = 0.", options: ["y = 2x³ − x² + 1", "y = 6x² − 2x + 1", "y = 2x³ − x² + C", "y = 12x² − 2", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "diffeq_exam_8", topicId: 61, prompt: "For y'' + ω²y = 0, the general solution is:", options: ["y = Ce^(ωx)", "y = A cos(ωx) + B sin(ωx)", "y = (A+Bx)e^(−ωx)", "y = Ae^(iωx)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_exam_9", topicId: 61, prompt: "Separable: (dy/dx) = x/y². Solve.", options: ["y³ = 3x² + C", "y³/3 = x²/2 + C", "y² = x² + C", "y = x³/3 + C", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "diffeq_exam_10", topicId: 61, prompt: "Euler's method step: yₙ₊₁ = yₙ + h × f(xₙ, yₙ). If y(0)=1, dy/dx=y, h=0.1. y(0.1) ≈ ?", options: ["1.0", "1.1", "1.2", "0.9", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 62 – Limits
        62: [
            MathExamQuestion(id: "lim_exam_1", topicId: 62, prompt: "lim(x→3) (x² − 9)/(x − 3) = ?", options: ["0", "3", "6", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_exam_2", topicId: 62, prompt: "lim(x→∞) (4x³ + 1)/(2x³ − 3) = ?", options: ["0", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_exam_3", topicId: 62, prompt: "lim(x→0) (sin 3x)/x = ?", options: ["0", "1", "3", "∞", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_exam_4", topicId: 62, prompt: "lim(x→2) (x² − 4)/(x² − 5x + 6) = ?", options: ["−4", "0", "4", "Undefined", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lim_exam_5", topicId: 62, prompt: "L'Hôpital: lim(x→0) (eˣ − 1 − x)/x² = ?", options: ["0", "1/2", "1", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_exam_6", topicId: 62, prompt: "lim(x→+∞) ln(x)/x = ?", options: ["0", "1", "∞", "e", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "lim_exam_7", topicId: 62, prompt: "Squeeze theorem: if g(x) ≤ f(x) ≤ h(x) and lim g = lim h = L, then lim f = ?", options: ["0", "L", "Undefined", "Between g and h", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "lim_exam_8", topicId: 62, prompt: "lim(x→0⁻) (1/x) = ?", options: ["+∞", "0", "−∞", "1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_exam_9", topicId: 62, prompt: "lim(x→1) (x³ − 1)/(x − 1) = ?", options: ["0", "1", "3", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "lim_exam_10", topicId: 62, prompt: "lim(x→∞) (1 + 1/x)ˣ = ?", options: ["1", "2", "e", "∞", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 63 – Series Convergence
        63: [
            MathExamQuestion(id: "serconv_exam_1", topicId: 63, prompt: "Sum of geometric series: a=4, r=1/3. S∞ = ?", options: ["4", "6", "8", "12", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_exam_2", topicId: 63, prompt: "Does Σ(1/n³) converge? (p-series, p = 3)", options: ["Yes", "No", "Only conditionally", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_exam_3", topicId: 63, prompt: "Ratio test for Σ(nˣ/n!): aₙ₊₁/aₙ = x/(n+1) → ? as n→∞", options: ["x", "0", "1", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_exam_4", topicId: 63, prompt: "Maclaurin for eˣ: coefficient of x⁴ = ?", options: ["1/6", "1/12", "1/24", "1/120", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "serconv_exam_5", topicId: 63, prompt: "Does Σ(−1)ⁿ/√n converge?", options: ["Yes, by alternating series test", "No, diverges", "Yes, absolutely", "Cannot determine", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "serconv_exam_6", topicId: 63, prompt: "For geometric series |r| < 1: S = a/(1−r). If a=10, r=−1/2. S = ?", options: ["5", "15/2", "20/3", "20", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "serconv_exam_7", topicId: 63, prompt: "The Maclaurin series for sin(x) begins: x − x³/6 + x⁵/120 − ... What is the coefficient of x⁵?", options: ["1/24", "1/120", "1/5", "5!", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_exam_8", topicId: 63, prompt: "By comparison test, Σ(1/(n²+n)) converges because 1/(n²+n) < ?", options: ["1/n", "1/n²", "1/n³", "1/n!", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_exam_9", topicId: 63, prompt: "Radius of convergence for Σ xⁿ/n = ln(1/(1−x)) is |x| < ?", options: ["0", "1", "2", "∞", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "serconv_exam_10", topicId: 63, prompt: "Integral test: Σ(1/nᵖ) converges iff ∫₁^∞ x^(−p) dx converges, which requires p > ?", options: ["0", "1", "2", "1/2", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 64 – Multivariable Calculus
        64: [
            MathExamQuestion(id: "multcalc_exam_1", topicId: 64, prompt: "Find ∂f/∂x for f(x,y) = x³y − y².", options: ["3x²y", "x³ − 2y", "3x²y + 2y", "y − 2y²", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "multcalc_exam_2", topicId: 64, prompt: "∂f/∂y for f(x,y) = x³y − y² = ?", options: ["3x²", "x³ − 2y", "y − 2y²", "3x²y", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_exam_3", topicId: 64, prompt: "Critical point of f(x,y) = x² + y² − 2x − 4y is at:", options: ["(1, 2)", "(2, 4)", "(−1, −2)", "(0, 0)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "multcalc_exam_4", topicId: 64, prompt: "∫₀¹∫₀² (x + y) dy dx = ?", options: ["2", "3", "4", "5", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_exam_5", topicId: 64, prompt: "∇f at (1, 1) for f = x² + xy. ∇f = (2x+y, x). At (1,1): ∇f = ?", options: ["(2, 1)", "(3, 1)", "(1, 3)", "(3, 3)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_exam_6", topicId: 64, prompt: "Hessian test: D = fxx fyy − fxy². If D > 0 and fxx < 0, the critical point is:", options: ["Saddle", "Local min", "Local max", "Neither", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "multcalc_exam_7", topicId: 64, prompt: "For z = f(x,y), x = sin t, y = cos t. dz/dt = (∂z/∂x)(cos t) + ?", options: ["(∂z/∂y)(sin t)", "(∂z/∂y)(−sin t)", "(∂z/∂y)(cos t)", "∂z/∂y", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_exam_8", topicId: 64, prompt: "∫∫_R x dA over R = [0,1]×[0,2] = ?", options: ["0.5", "1", "2", "4", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "multcalc_exam_9", topicId: 64, prompt: "Maximise f(x,y) = xy subject to x + y = 10 (Lagrange). Max f = ?", options: ["10", "20", "25", "50", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "multcalc_exam_10", topicId: 64, prompt: "fxy = ∂²f/∂y∂x = ∂²f/∂x∂y (when both mixed partials are continuous). This is:", options: ["Chain rule", "Clairaut's theorem", "Green's theorem", "Fubini's theorem", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 65 – Linear Algebra
        65: [
            MathExamQuestion(id: "linalg_exam_1", topicId: 65, prompt: "Find det([[3,1],[2,4]]).", options: ["10", "12", "14", "8", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_exam_2", topicId: 65, prompt: "Eigenvalues of [[2,0],[0,5]] are:", options: ["2 and 5", "0 and 7", "1 and 10", "2 and −5", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_exam_3", topicId: 65, prompt: "A = [[1,2],[3,4]]. A⁻¹ = (1/det(A)) × [[4,−2],[−3,1]]. det(A) = −2. A⁻¹[0][0] = ?", options: ["−2", "2", "4", "−4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_exam_4", topicId: 65, prompt: "The system Ax = 0 has non-trivial solutions when:", options: ["rank(A) = n", "det(A) = 0", "det(A) ≠ 0", "trace(A) = 0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_exam_5", topicId: 65, prompt: "Vectors (1,0,0), (0,1,0), (0,0,1) are:", options: ["Linearly dependent", "Orthonormal basis for ℝ³", "Eigenvectors only", "Collinear", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_exam_6", topicId: 65, prompt: "Rank-nullity theorem: rank(A) + nullity(A) = ?", options: ["det(A)", "n (number of columns)", "m (number of rows)", "trace(A)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_exam_7", topicId: 65, prompt: "For A = [[cos θ, −sin θ],[sin θ, cos θ]], det(A) = ?", options: ["0", "1", "cos²θ", "sin²θ", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "linalg_exam_8", topicId: 65, prompt: "u = (3, 4, 0), v = (0, 0, 5). u · v = ?", options: ["0", "5", "20", "60", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "linalg_exam_9", topicId: 65, prompt: "If λ is an eigenvalue of A, then det(A − λI) = ?", options: ["1", "λ", "0", "trace(A)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "linalg_exam_10", topicId: 65, prompt: "The column space of A is spanned by:", options: ["Rows of A", "Columns of A", "Eigenvectors of A", "Diagonal of A", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 66 – Abstract Algebra
        66: [
            MathExamQuestion(id: "absalg_exam_1", topicId: 66, prompt: "The set {0, 1, 2, 3, 4} under addition mod 5 forms a:", options: ["Ring but not group", "Group only", "Cyclic group of order 5", "Both b and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "absalg_exam_2", topicId: 66, prompt: "Lagrange: if |G| = 20 and H is a subgroup, |H| cannot be:", options: ["4", "5", "6", "10", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_exam_3", topicId: 66, prompt: "In Z, the additive inverse of 7 is:", options: ["1/7", "−7", "7", "0", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_exam_4", topicId: 66, prompt: "The order of element 3 in Z/9Z under addition:", options: ["1", "2", "3", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_exam_5", topicId: 66, prompt: "S₃ (symmetric group on 3 elements) is:", options: ["Abelian", "Non-abelian of order 6", "Cyclic", "Infinite", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_exam_6", topicId: 66, prompt: "A field differs from a ring in that it also requires:", options: ["Commutativity of +", "All nonzero elements are invertible", "Associativity of ×", "An additive identity", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_exam_7", topicId: 66, prompt: "Q (rationals) under multiplication is NOT a group because:", options: ["Not closed", "0 has no multiplicative inverse", "Not associative", "No identity", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_exam_8", topicId: 66, prompt: "First Isomorphism Theorem: G/ker(φ) ≅ ?", options: ["G", "ker(φ)", "Im(φ)", "G × H", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "absalg_exam_9", topicId: 66, prompt: "In Z/6Z, what is 4 × 4 (mod 6)?", options: ["2", "4", "10", "16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "absalg_exam_10", topicId: 66, prompt: "Every subgroup of a cyclic group is:", options: ["Normal", "Cyclic", "Abelian", "All of the above", "I don't know / Wasn't taught"], correctIndex: 3),
        ],

        // MARK: Exam Topic 67 – Real Analysis
        67: [
            MathExamQuestion(id: "realana_exam_1", topicId: 67, prompt: "Using ε-δ: lim(x→2) 3x = 6. Choose δ = ε/k. k = ?", options: ["1", "2", "3", "6", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "realana_exam_2", topicId: 67, prompt: "A sequence {aₙ} with aₙ = (−1)ⁿ:", options: ["Converges to 0", "Converges to 1", "Diverges (oscillates)", "Converges to −1", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "realana_exam_3", topicId: 67, prompt: "Bolzano-Weierstrass: {sin(n)} is bounded. Therefore:", options: ["It converges", "It has a convergent subsequence", "It diverges", "It's monotone", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_4", topicId: 67, prompt: "IVT applied to f(x) = x³ − 2 on [1,2]: f(1) = −1, f(2) = 6. Conclusion:", options: ["No root in (1,2)", "∃ root in (1,2)", "Root at x = 1.5", "f is not continuous", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_5", topicId: 67, prompt: "MVT: f(x) = x² on [1,3]. ∃c: f'(c) = [f(3)−f(1)]/(3−1) = ?", options: ["2", "4", "6", "8", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_6", topicId: 67, prompt: "sup{x : x² < 4} = ?", options: ["2", "4", "√4 = 2", "Both a and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "realana_exam_7", topicId: 67, prompt: "A function f: [a,b] → ℝ that is continuous on a compact interval is:", options: ["Differentiable", "Bounded and attains its bounds", "Monotone", "Integrable only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_8", topicId: 67, prompt: "lim(n→∞) (n² + 3n)/(2n² − 1) = ?", options: ["0", "1/2", "1", "3/2", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_9", topicId: 67, prompt: "Every Cauchy sequence in ℝ converges. This makes ℝ:", options: ["Compact", "Complete", "Countable", "Bounded", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "realana_exam_10", topicId: 67, prompt: "Rolle's Theorem requires f(a) = f(b) and f continuous on [a,b], differentiable on (a,b). Conclusion: ∃c with f'(c) = ?", options: ["f(a)", "f(b)", "0", "[f(b)−f(a)]/(b−a)", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 68 – Complex Analysis
        68: [
            MathExamQuestion(id: "compan_exam_1", topicId: 68, prompt: "|z| for z = 5 − 12i = ?", options: ["7", "13", "17", "25", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_2", topicId: 68, prompt: "arg(−1 − i) (principal argument, in radians) = ?", options: ["−3π/4", "3π/4", "−π/4", "5π/4", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_exam_3", topicId: 68, prompt: "(1 + i)⁸ = ? (use De Moivre: |1+i| = √2, arg = π/4)", options: ["8", "16", "8i", "−16", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_4", topicId: 68, prompt: "Divide (2 + 3i)/(1 − i). Multiply by conjugate (1+i)/(1+i). Result = ?", options: ["−1/2 + 5i/2", "5/2 + i/2", "2 + 3i", "(−1 + 5i)/2", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "compan_exam_5", topicId: 68, prompt: "e^(iπ/2) = ?", options: ["−1", "0 + i", "1", "−i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_6", topicId: 68, prompt: "Cube roots of 1: the three values of z with z³ = 1 are:", options: ["1, i, −i", "1, ω, ω² (ω = e^(2πi/3))", "1, −1, i", "1, −1, ±i", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_7", topicId: 68, prompt: "The modulus of z₁z₂ = ?", options: ["|z₁| + |z₂|", "|z₁| × |z₂|", "|z₁|² + |z₂|²", "|z₁ + z₂|", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_8", topicId: 68, prompt: "A function f(z) is analytic (holomorphic) if it satisfies the:", options: ["Fourier conditions", "Cauchy-Riemann equations", "L'Hôpital conditions", "Euler conditions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "compan_exam_9", topicId: 68, prompt: "Find (3 + 4i)⁻¹.", options: ["(3 − 4i)/25", "(3 + 4i)/25", "1/7", "(3 − 4i)/7", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "compan_exam_10", topicId: 68, prompt: "The set |z − 2| < 3 represents:", options: ["A line", "A circle centred at 2", "An open disc centred at 2, radius 3", "A half-plane", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        // MARK: Exam Topic 69 – Probability Theory
        69: [
            MathExamQuestion(id: "prob_exam_1_t69", topicId: 69, prompt: "P(X ≥ 2) for X ~ Bin(5, 0.4) = 1 − P(X=0) − P(X=1). P(X=0) = 0.6⁵ ≈ 0.0778, P(X=1) = 5×0.4×0.6⁴ ≈ 0.2592. P(X≥2) ≈ ?", options: ["0.337", "0.663", "0.778", "0.922", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_2_t69", topicId: 69, prompt: "E(X) for X ~ Poisson(λ = 3) = ?", options: ["1", "2", "3", "9", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_3_t69", topicId: 69, prompt: "X ~ N(10, 4). P(X < 10) = ?", options: ["0.025", "0.16", "0.5", "0.84", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_4_t69", topicId: 69, prompt: "Bayes: P(Disease|+) = P(+|Disease) × P(Disease) / P(+). If P(+|D)=0.99, P(D)=0.01, P(+)=0.0198. P(D|+) ≈ ?", options: ["0.01", "0.5", "0.99", "1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_5_t69", topicId: 69, prompt: "Var(3X + 2) = ?", options: ["3Var(X) + 2", "9Var(X) + 2", "9Var(X)", "3Var(X)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "prob_exam_6_t69", topicId: 69, prompt: "Covariance Cov(X,Y) = 0 implies:", options: ["X and Y are identical", "X and Y are independent (if normal)", "X and Y are uncorrelated", "Both b and c", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "prob_exam_7_t69", topicId: 69, prompt: "CLT: X̄ ~ N(μ, σ²/n). For n = 100, σ = 5, SE of X̄ = ?", options: ["0.05", "0.5", "5", "50", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_8_t69", topicId: 69, prompt: "For continuous uniform X ~ U(a,b): E(X) = ?", options: ["a + b", "(a+b)/2", "(b−a)/2", "ab", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_9_t69", topicId: 69, prompt: "Moment generating function: M_X(t) = E(e^(tX)). For X~N(0,1), M_X(t) = ?", options: ["e^t", "e^(t²/2)", "t²/2", "e^(−t²)", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "prob_exam_10_t69", topicId: 69, prompt: "P(A ∪ B) = 0.7 and P(A ∩ B) = 0.2. If P(A) = 0.5, find P(B).", options: ["0.2", "0.4", "0.6", "0.7", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Exam Topic 70 – Mathematical Proof
        70: [
            MathExamQuestion(id: "proof_exam_1", topicId: 70, prompt: "Prove by induction: Σk=1 to n of k = n(n+1)/2. The inductive hypothesis assumes this holds for n = ?", options: ["1", "k", "k+1", "All n", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_2", topicId: 70, prompt: "Contrapositive of 'If it is raining, the ground is wet': ", options: ["If the ground is wet, it is raining", "If it is not raining, the ground is not wet", "If the ground is not wet, it is not raining", "If not raining, ground is wet", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_exam_3", topicId: 70, prompt: "Prove √2 is irrational. Assume √2 = p/q in lowest terms. Then 2 = p²/q² → p² = 2q². This means p² is even, so p is even. Let p = 2m. Then q² = 2m², so q is also even. This contradicts:", options: ["√2 being positive", "p/q being in lowest terms", "2 being an integer", "q being positive", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_4", topicId: 70, prompt: "By strong induction, to prove P(n) for all n ≥ 1, the inductive step assumes P(1), ..., P(k) hold and proves:", options: ["P(1)", "P(k)", "P(k+1)", "P(2k)", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "proof_exam_5", topicId: 70, prompt: "Which is a valid counterexample to 'n² + n + 41 is always prime'?", options: ["n = 1", "n = 10", "n = 40", "n = 41 (gives 41² + 41 + 41 = 41 × 43)", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "proof_exam_6", topicId: 70, prompt: "Prove: if n is odd, n² is odd. Choose n = 2k + 1. n² = ?", options: ["4k² + 1", "4k² + 4k + 1 = 2(2k²+2k) + 1 (odd)", "4k + 1", "2k² + 1", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_7", topicId: 70, prompt: "De Morgan's law: ¬(A ∨ B) ≡ ?", options: ["¬A ∨ ¬B", "¬A ∧ ¬B", "A ∧ ¬B", "¬A ∨ B", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_8", topicId: 70, prompt: "Prove by contradiction: there are infinitely many primes. Assume finitely many p₁,...,pₙ. Consider N = p₁×...×pₙ + 1. Then N is divisible by some prime not in the list. This is a contradiction because:", options: ["N is too large", "We assumed the list was complete", "N is prime itself", "N + 1 is prime", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_9", topicId: 70, prompt: "To prove P ↔ Q, which two implications must be proved?", options: ["P → P and Q → Q", "P → Q and Q → P", "¬P → ¬Q only", "P and Q separately", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "proof_exam_10", topicId: 70, prompt: "Induction base case for Σk=1 to n of k² = n(n+1)(2n+1)/6. LHS at n=1: 1. RHS: ?", options: ["1/6", "1/2", "1", "6/6 = 1", "I don't know / Wasn't taught"], correctIndex: 3),
        ],
    ]
}
