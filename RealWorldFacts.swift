import Foundation

/// A dictionary of real-world fun facts keyed by the puzzle prompt text.
/// These are shown as a "💡 Did you know?" toast when the player gets a correct match.
enum RealWorldFacts {

    // MARK: - Geography

    static let geography: [String: String] = [
        // Capitals
        "France":       "France is the most visited country in the world — over 90 million tourists go there every year!",
        "Japan":        "Japan has more than 6,800 islands, but most people live on just 4 of them!",
        "Brazil":       "Brazil is so big it covers nearly half of South America!",
        "Australia":    "Australia is both a country AND a continent — the only place on Earth that is both!",
        "Canada":       "Canada has the longest coastline of any country in the world — 202,080 km!",
        "Germany":      "Germany invented the car — Karl Benz built the first one in 1885!",
        "Egypt":        "Egypt is home to the Great Pyramid, one of the 7 Wonders of the Ancient World!",
        "China":        "China has the most people of any country — over 1.4 billion!",
        "India":        "India has more than 1,600 languages spoken across the country!",
        "Russia":       "Russia is the largest country by area — it covers 11 time zones!",
        "USA":          "The USA has the world's largest economy and over 330 million people!",
        "Argentina":    "Argentina is where the tango dance was invented!",
        "Mexico":       "Mexico City is one of the largest cities in the world with over 21 million people!",
        "Italy":        "Italy is shaped like a boot — you can see it on a map!",
        "Spain":        "Spain is famous for flamenco dancing and invented the guitar!",
        "UK":           "The UK invented football (soccer) — the first rules were written in 1863!",
        "South Africa": "South Africa has 11 official languages — more than almost any other country!",
        "Kenya":        "Kenya is home to the Great Rift Valley, one of the most dramatic landscapes on Earth!",
        "Nigeria":      "Nigeria has Africa's largest economy and over 200 million people!",
        "Thailand":     "Thailand is known as the Land of Smiles and never been colonised!",

        // Continents
        "Africa":       "Africa is the second largest continent and has 54 countries — more than any other continent!",
        "Asia":         "Asia is home to more than 4.5 billion people — that's over half the world's population!",
        "Europe":       "Europe is the smallest continent but has the most countries!",
        "North America":"North America has the Grand Canyon, one of the most breathtaking natural wonders on Earth!",
        "South America":"South America has the Amazon rainforest, which produces 20% of the world's oxygen!",
        "Oceania":      "Oceania includes Australia, New Zealand, and over 25,000 Pacific islands!",

        // Rivers
        "Nile":         "The Nile is the longest river in the world at 6,650 km — longer than the distance from London to New York!",
        "Amazon":       "The Amazon River discharges more water than any other river — it's responsible for 20% of all fresh water flowing into the world's oceans!",
        "Yangtze":      "The Yangtze is Asia's longest river and flows through the famous Three Gorges Dam!",
        "Mississippi":  "You could fill the Mississippi River with 50 trillion gallons of water every year!",
        "Congo":        "The Congo River is the deepest river in the world, reaching depths of over 220 metres!",
        "Ganges":       "The Ganges is considered sacred by over 1 billion Hindus and is central to Indian culture!",
        "Rhine":        "The Rhine has been a major trade route in Europe for over 2,000 years!",
        "Danube":       "The Danube flows through 10 countries — more than any other river in the world!",
    ]

    // MARK: - History

    static let history: [String: String] = [
        // Events & Dates
        "Moon Landing":               "Only 12 people have ever walked on the Moon — all of them American astronauts between 1969 and 1972!",
        "World War II ends":          "World War II involved over 30 countries and was the deadliest conflict in human history.",
        "French Revolution":          "The French Revolution gave the world the motto 'Liberty, Equality, Fraternity' — ideas that shaped modern democracy!",
        "Columbus reaches America":   "Columbus actually landed in the Bahamas, not mainland America — he never knew he'd found a new continent!",
        "First iPhone released":      "The first iPhone had no App Store — apps were added a year later in 2008!",
        "Berlin Wall falls":          "The Berlin Wall fell in 1989, reuniting families that had been separated for 28 years!",
        "First Olympic Games":        "The ancient Olympics had no medals — winners received a simple olive wreath!",
        "End of apartheid":           "Nelson Mandela spent 27 years in prison before becoming South Africa's first Black president in 1994!",

        // People & Events
        "Isaac Newton":               "Newton discovered gravity when an apple fell near him — but it didn't actually hit him on the head!",
        "Marie Curie":                "Marie Curie was the first person to win two Nobel Prizes — in Physics and in Chemistry!",
        "Albert Einstein":            "Einstein failed his university entrance exam the first time he took it!",
        "Leonardo da Vinci":          "Da Vinci wrote in mirror writing — you had to hold his notebooks up to a mirror to read them!",
        "Cleopatra":                  "Cleopatra lived closer in time to the Moon Landing than to the construction of the Great Pyramid!",
        "Napoleon Bonaparte":         "Despite the myth, Napoleon was actually average height for his time — about 5 feet 7 inches!",
        "Shakespeare":                "Shakespeare invented over 1,700 words we still use today, including 'bedroom', 'lonely', and 'generous'!",
        "Nelson Mandela":             "Mandela became president at age 75 — the oldest first-time president of South Africa!",

        // Inventions
        "Telephone":                  "Alexander Graham Bell's first words on the telephone were: 'Mr. Watson, come here — I want to see you!'",
        "Light Bulb":                 "Thomas Edison didn't invent the light bulb alone — he improved an existing design after over 1,000 experiments!",
        "Printing Press":             "The printing press made books affordable for ordinary people for the first time in history!",
        "Steam Engine":               "The steam engine powered the Industrial Revolution and changed how people lived and worked forever!",
        "Aeroplane":                  "The Wright Brothers' first flight lasted just 12 seconds and covered less than the wingspan of a Boeing 747!",
        "World Wide Web":             "Tim Berners-Lee invented the web in 1989 and gave it to the world for free — he never patented it!",
        "Penicillin":                 "Alexander Fleming discovered penicillin by accident when mould contaminated one of his experiments!",
        "Compass":                    "The compass was invented in China over 2,000 years ago and revolutionised navigation forever!",
    ]

    // MARK: - English

    static let english: [String: String] = [
        // Word meanings
        "Enormous":      "'Enormous' comes from the Latin 'enormis' meaning 'out of the normal' — used for things that are way bigger than usual!",
        "Ancient":       "The word 'ancient' is over 600 years old itself — it comes from Old French 'ancien'!",
        "Transparent":   "Glass windows are transparent — but polar bear fur is actually transparent too, just looks white!",
        "Ferocious":     "The word 'ferocious' shares its root with 'fierce' — both come from Latin 'ferus', meaning wild animal!",
        "Miniature":     "'Miniature' originally described tiny illustrations in manuscripts — not small things in general!",
        "Melancholy":    "Ancient Greeks thought sadness came from 'black bile' — 'melas' (black) + 'kholé' (bile) = melancholy!",
        "Eccentric":     "'Eccentric' means off-centre — like a circle whose centre is in the wrong place!",

        // Synonyms
        "Happy":         "There are over 50 words in English for 'happy' — including elated, jubilant, and blissful!",
        "Big":           "English borrowed 'enormous', 'gigantic', 'colossal', and 'vast' from Latin, Greek, and French to describe BIG things!",
        "Angry":         "The word 'anger' came to English from Old Norse — the Vikings were pretty angry people!",
        "Fast":          "The fastest word-speaker in English can say 11 syllables per second — that's really fast!",
        "Smart":         "'Clever' originally meant skilled with one's hands, not intelligence — language changes over time!",

        // Antonyms
        "Hot":           "The Sahara desert can be both the hottest AND coldest place on Earth — summer scorches at 50°C, winter nights can freeze!",
        "Light":         "A neutron star is so heavy that a teaspoon of it would weigh about a billion tonnes!",
        "Wide":          "The narrowest street in the world is in Germany — less than 31 cm at its tightest point!",
        "Loud":          "A blue whale's call is so loud it can be heard 800 km away — louder than a jet engine!",
        "Strong":        "The strongest animal relative to its size is the dung beetle — it can pull 1,141 times its own body weight!",
    ]

    // MARK: - Lookup

    /// Returns a fun fact for the given prompt, searching all subjects.
    static func fact(for prompt: String) -> String? {
        return geography[prompt] ?? history[prompt] ?? english[prompt]
    }

    /// Returns a fun fact for the given prompt in a specific subject.
    static func fact(for prompt: String, subject: String) -> String? {
        switch subject {
        case "geography": return geography[prompt]
        case "history":   return history[prompt]
        case "english":   return english[prompt]
        default:          return fact(for: prompt)
        }
    }
}
