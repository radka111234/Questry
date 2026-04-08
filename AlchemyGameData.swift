import Foundation

struct AlchemyElement: Equatable, Hashable {
    let id: String       // matches asset name without "element_" prefix
    let name: String
    var isDiscovered: Bool = false

    var assetName: String { "element_\(id)" }
}

struct AlchemyRecipe {
    let inputA: String
    let inputB: String
    let output: String
}

// MARK: - Game Data

enum AlchemyGameData {

    // All elements in the game
    static let allElements: [AlchemyElement] = [
        // Starters
        .init(id: "fire",         name: "Fire"),
        .init(id: "water",        name: "Water"),
        .init(id: "earth",        name: "Earth"),
        .init(id: "air",          name: "Air"),
        // Tier 1
        .init(id: "steam",        name: "Steam"),
        .init(id: "mud",          name: "Mud"),
        .init(id: "lava",         name: "Lava"),
        .init(id: "dust",         name: "Dust"),
        .init(id: "rain",         name: "Rain"),
        .init(id: "energy",       name: "Energy"),
        .init(id: "wind",         name: "Wind"),
        .init(id: "cloud",        name: "Cloud"),
        // Tier 2
        .init(id: "stone",        name: "Stone"),
        .init(id: "sand",         name: "Sand"),
        .init(id: "clay",         name: "Clay"),
        .init(id: "ice",          name: "Ice"),
        .init(id: "snow",         name: "Snow"),
        .init(id: "fog",          name: "Fog"),
        .init(id: "lightning",    name: "Lightning"),
        .init(id: "storm",        name: "Storm"),
        .init(id: "volcano",      name: "Volcano"),
        .init(id: "plant",        name: "Plant"),
        .init(id: "glass",        name: "Glass"),
        .init(id: "metal",        name: "Metal"),
        .init(id: "hydrogen",     name: "Hydrogen"),
        .init(id: "oxygen",       name: "Oxygen"),
        // Tier 3
        .init(id: "flower",       name: "Flower"),
        .init(id: "tree",         name: "Tree"),
        .init(id: "grass",        name: "Grass"),
        .init(id: "ocean",        name: "Ocean"),
        .init(id: "island",       name: "Island"),
        .init(id: "mountain",     name: "Mountain"),
        .init(id: "electricity",  name: "Electricity"),
        .init(id: "carbon",       name: "Carbon"),
        .init(id: "pressure",     name: "Pressure"),
        .init(id: "temperature",  name: "Temperature"),
        .init(id: "heat",         name: "Heat"),
        .init(id: "cold",         name: "Cold"),
        .init(id: "solid",        name: "Solid"),
        .init(id: "liquid",       name: "Liquid"),
        .init(id: "gas",          name: "Gas"),
        .init(id: "steel",        name: "Steel"),
        .init(id: "gold",         name: "Gold"),
        .init(id: "silver",       name: "Silver"),
        .init(id: "continent",    name: "Continent"),
        .init(id: "planet",       name: "Planet"),
        .init(id: "moon",         name: "Moon"),
        .init(id: "sun",          name: "Sun"),
        .init(id: "space",        name: "Space"),
        .init(id: "rainbow",      name: "Rainbow"),
        // Biology
        .init(id: "bacteria",     name: "Bacteria"),
        .init(id: "cell",         name: "Cell"),
        .init(id: "dna",          name: "DNA"),
        .init(id: "life",         name: "Life"),
        .init(id: "egg",          name: "Egg"),
        .init(id: "fish",         name: "Fish"),
        .init(id: "insect",       name: "Insect"),
        .init(id: "bird",         name: "Bird"),
        .init(id: "animal",       name: "Animal"),
        .init(id: "cow",          name: "Cow"),
        .init(id: "horse",        name: "Horse"),
        .init(id: "dog",          name: "Dog"),
        .init(id: "human",        name: "Human"),
        // Food
        .init(id: "meat",         name: "Meat"),
        .init(id: "milk",         name: "Milk"),
        .init(id: "bread",        name: "Bread"),
        .init(id: "food",         name: "Food"),
        // Technology
        .init(id: "wheel",        name: "Wheel"),
        .init(id: "tool",         name: "Tool"),
        .init(id: "engine",       name: "Engine"),
        .init(id: "vehicle",      name: "Vehicle"),
        .init(id: "machine",      name: "Machine"),
        .init(id: "house",        name: "House"),
        .init(id: "city",         name: "City"),
        .init(id: "robot",        name: "Robot"),
        .init(id: "ai",           name: "AI"),
        .init(id: "rocket",       name: "Rocket"),
        // Physics
        .init(id: "magnet",       name: "Magnet"),
        .init(id: "force",        name: "Force"),
        .init(id: "motion",       name: "Motion"),
        .init(id: "gravity",      name: "Gravity"),
        // Advanced
        .init(id: "energy_core",  name: "Energy Core"),
        .init(id: "universe",     name: "Universe"),
        .init(id: "blackhole",    name: "Black Hole"),
        .init(id: "time",         name: "Time"),
    ]

    static let starterIds: Set<String> = ["fire", "water", "earth", "air"]

    // Recipes — order of inputs doesn't matter (A+B == B+A)
    static let recipes: [AlchemyRecipe] = [
        // --- Basic ---
        .init(inputA: "fire",       inputB: "water",      output: "steam"),
        .init(inputA: "earth",      inputB: "water",      output: "mud"),
        .init(inputA: "fire",       inputB: "earth",      output: "lava"),
        .init(inputA: "earth",      inputB: "air",        output: "dust"),
        .init(inputA: "air",        inputB: "water",      output: "rain"),
        .init(inputA: "fire",       inputB: "air",        output: "energy"),
        .init(inputA: "air",        inputB: "air",        output: "wind"),
        .init(inputA: "rain",       inputB: "air",        output: "cloud"),
        // --- Tier 2 ---
        .init(inputA: "lava",       inputB: "water",      output: "stone"),
        .init(inputA: "stone",      inputB: "air",        output: "sand"),
        .init(inputA: "mud",        inputB: "fire",       output: "clay"),
        .init(inputA: "water",      inputB: "cold",       output: "ice"),
        .init(inputA: "ice",        inputB: "air",        output: "snow"),
        .init(inputA: "cloud",      inputB: "cold",       output: "fog"),
        .init(inputA: "storm",      inputB: "energy",     output: "lightning"),
        .init(inputA: "cloud",      inputB: "wind",       output: "storm"),
        .init(inputA: "lava",       inputB: "earth",      output: "volcano"),
        .init(inputA: "earth",      inputB: "rain",       output: "plant"),
        .init(inputA: "sand",       inputB: "fire",       output: "glass"),
        .init(inputA: "stone",      inputB: "fire",       output: "metal"),
        .init(inputA: "water",      inputB: "energy",     output: "hydrogen"),
        .init(inputA: "air",        inputB: "energy",     output: "oxygen"),
        // --- States ---
        .init(inputA: "fire",       inputB: "temperature", output: "heat"),
        .init(inputA: "ice",        inputB: "temperature", output: "cold"),
        .init(inputA: "stone",      inputB: "pressure",   output: "solid"),
        .init(inputA: "water",      inputB: "heat",       output: "liquid"),
        .init(inputA: "steam",      inputB: "air",        output: "gas"),
        .init(inputA: "fire",       inputB: "stone",      output: "pressure"),
        .init(inputA: "heat",       inputB: "cold",       output: "temperature"),
        // --- Nature ---
        .init(inputA: "plant",      inputB: "earth",      output: "grass"),
        .init(inputA: "plant",      inputB: "rain",       output: "flower"),
        .init(inputA: "plant",      inputB: "plant",      output: "tree"),
        .init(inputA: "water",      inputB: "water",      output: "ocean"),
        .init(inputA: "ocean",      inputB: "earth",      output: "island"),
        .init(inputA: "earth",      inputB: "stone",      output: "mountain"),
        .init(inputA: "island",     inputB: "island",     output: "continent"),
        .init(inputA: "rain",       inputB: "sun",        output: "rainbow"),
        // --- Metals ---
        .init(inputA: "metal",      inputB: "fire",       output: "steel"),
        .init(inputA: "metal",      inputB: "energy",     output: "electricity"),
        .init(inputA: "metal",      inputB: "stone",      output: "gold"),
        .init(inputA: "stone",      inputB: "water",      output: "silver"),
        .init(inputA: "metal",      inputB: "electricity", output: "magnet"),
        // --- Space ---
        .init(inputA: "energy",     inputB: "fire",       output: "sun"),
        .init(inputA: "earth",      inputB: "sun",        output: "planet"),
        .init(inputA: "planet",     inputB: "stone",      output: "moon"),
        .init(inputA: "planet",     inputB: "planet",     output: "space"),
        .init(inputA: "space",      inputB: "space",      output: "universe"),
        .init(inputA: "space",      inputB: "blackhole",  output: "time"),
        .init(inputA: "universe",   inputB: "energy",     output: "blackhole"),
        // --- Chemistry ---
        .init(inputA: "plant",      inputB: "fire",       output: "carbon"),
        .init(inputA: "carbon",     inputB: "oxygen",     output: "gas"),
        .init(inputA: "hydrogen",   inputB: "oxygen",     output: "water"),
        // --- Biology ---
        .init(inputA: "earth",      inputB: "energy",     output: "bacteria"),
        .init(inputA: "bacteria",   inputB: "water",      output: "cell"),
        .init(inputA: "cell",       inputB: "cell",       output: "dna"),
        .init(inputA: "dna",        inputB: "energy",     output: "life"),
        .init(inputA: "life",       inputB: "ocean",      output: "fish"),
        .init(inputA: "life",       inputB: "earth",      output: "animal"),
        .init(inputA: "life",       inputB: "fire",       output: "egg"),
        .init(inputA: "egg",        inputB: "air",        output: "bird"),
        .init(inputA: "animal",     inputB: "earth",      output: "insect"),
        .init(inputA: "animal",     inputB: "grass",      output: "cow"),
        .init(inputA: "animal",     inputB: "human",      output: "dog"),
        .init(inputA: "animal",     inputB: "energy",     output: "horse"),
        .init(inputA: "animal",     inputB: "time",       output: "human"),
        // --- Food ---
        .init(inputA: "cow",        inputB: "human",      output: "milk"),
        .init(inputA: "animal",     inputB: "fire",       output: "meat"),
        .init(inputA: "grass",      inputB: "stone",      output: "bread"),
        .init(inputA: "bread",      inputB: "meat",       output: "food"),
        // --- Technology ---
        .init(inputA: "stone",      inputB: "tool",       output: "wheel"),
        .init(inputA: "stone",      inputB: "human",      output: "tool"),
        .init(inputA: "wheel",      inputB: "metal",      output: "engine"),
        .init(inputA: "engine",     inputB: "vehicle",    output: "machine"),
        .init(inputA: "wheel",      inputB: "tool",       output: "vehicle"),
        .init(inputA: "human",      inputB: "earth",      output: "house"),
        .init(inputA: "house",      inputB: "house",      output: "city"),
        .init(inputA: "machine",    inputB: "electricity", output: "robot"),
        .init(inputA: "robot",      inputB: "energy_core", output: "ai"),
        .init(inputA: "machine",    inputB: "fire",       output: "rocket"),
        // --- Physics ---
        .init(inputA: "electricity", inputB: "stone",     output: "force"),
        .init(inputA: "force",      inputB: "motion",     output: "gravity"),
        .init(inputA: "vehicle",    inputB: "force",      output: "motion"),
        // --- Advanced ---
        .init(inputA: "energy",     inputB: "energy",     output: "energy_core"),
        .init(inputA: "rocket",     inputB: "space",      output: "universe"),
    ]

    // Look up recipe — returns output element id or nil
    static func combine(_ a: String, _ b: String) -> String? {
        for r in recipes {
            if (r.inputA == a && r.inputB == b) || (r.inputA == b && r.inputB == a) {
                return r.output
            }
        }
        return nil
    }
}
