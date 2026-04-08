import Foundation

// MARK: - Topic Definition

struct GeoTopicDefinition {
    let id: Int
    let nodeTitle: String
    let introTitle: String
    let introText: String
    let exampleText: String
    let iconSystemName: String
    let gradeLabel: String
}

// MARK: - GeographyGameData

enum GeographyGameData {

    static let questionsPerQuest = 5
    private static let examPassRatio = 0.70

    static func minimumPassScore(for totalQuestions: Int) -> Int {
        Int(ceil(Double(totalQuestions) * examPassRatio))
    }

    // MARK: - Topics

    static let topics: [GeoTopicDefinition] = [
        GeoTopicDefinition(
            id: 1, nodeTitle: "Where I Live",
            introTitle: "Where I Live Quest",
            introText: "Geography starts right at home! A neighborhood is the area around where you live. It has streets, buildings, parks, and people.",
            exampleText: "Example:\n\n🏠 Home → 🏘️ Neighborhood → 🏙️ City → 🗺️ Country",
            iconSystemName: "house.fill", gradeLabel: "Grade 1"
        ),
        GeoTopicDefinition(
            id: 2, nodeTitle: "Maps and Globes",
            introTitle: "Maps and Globes Quest",
            introText: "A map is a flat picture of a place from above. A globe is a round model of Earth. Maps use symbols and colors to show roads, rivers, and cities.",
            exampleText: "Example:\n\n🔵 = Water (ocean or lake)\n🟢 = Forest or park\n🔴 = City or town",
            iconSystemName: "map.fill", gradeLabel: "Grade 1"
        ),
        GeoTopicDefinition(
            id: 3, nodeTitle: "Continents & Oceans",
            introTitle: "Continents & Oceans Quest",
            introText: "Earth has 7 continents and 5 oceans. Continents are the huge land masses, and oceans are the vast bodies of salt water between them.",
            exampleText: "7 Continents:\nAfrica, Antarctica, Asia, Australia, Europe, North America, South America\n\n5 Oceans:\nArctic, Atlantic, Indian, Pacific, Southern",
            iconSystemName: "globe.americas.fill", gradeLabel: "Grade 2"
        ),
        GeoTopicDefinition(
            id: 4, nodeTitle: "Countries & Capitals",
            introTitle: "Countries & Capitals Quest",
            introText: "The world has about 195 countries. Each country usually has a capital city  -  the main city where the government is based.",
            exampleText: "Examples:\n🇫🇷 France → Paris\n🇯🇵 Japan → Tokyo\n🇧🇷 Brazil → Brasília\n🇦🇺 Australia → Canberra",
            iconSystemName: "building.columns.fill", gradeLabel: "Grade 2"
        ),
        GeoTopicDefinition(
            id: 5, nodeTitle: "Weather & Climate",
            introTitle: "Weather & Climate Quest",
            introText: "Weather is what the sky is like today  -  sunny, rainy, or windy. Climate is the usual weather in a place over many years.",
            exampleText: "Example:\n☀️ Desert climate: hot and dry\n❄️ Polar climate: very cold\n🌧️ Rainforest climate: warm and very wet",
            iconSystemName: "cloud.sun.fill", gradeLabel: "Grade 3"
        ),
        GeoTopicDefinition(
            id: 6, nodeTitle: "US States",
            introTitle: "US States Quest",
            introText: "The United States is made up of 50 states. Each state has its own capital city. The country's capital is Washington D.C.",
            exampleText: "Examples:\n🗽 New York → Albany\n⭐ Texas → Austin\n🌴 Florida → Tallahassee\n🎬 California → Sacramento",
            iconSystemName: "flag.fill", gradeLabel: "Grade 3"
        ),
        GeoTopicDefinition(
            id: 7, nodeTitle: "Mountain Ranges",
            introTitle: "Mountain Ranges Quest",
            introText: "Mountains are tall landforms with steep sides. A group of mountains is called a mountain range. The tallest peak on Earth is Mount Everest in the Himalayas.",
            exampleText: "Major Ranges:\n🏔️ Himalayas  -  Asia (tallest)\n🏔️ Andes  -  South America (longest)\n🏔️ Alps  -  Europe\n🏔️ Rockies  -  North America",
            iconSystemName: "mountain.2.fill", gradeLabel: "Grade 3"
        ),
        GeoTopicDefinition(
            id: 8, nodeTitle: "Rivers & Lakes",
            introTitle: "Rivers & Lakes Quest",
            introText: "Rivers are flowing bodies of fresh water. Lakes are bodies of water surrounded by land. Rivers and lakes are vital for drinking water, farming, and transport.",
            exampleText: "Longest Rivers:\n🌊 Nile  -  Africa\n🌊 Amazon  -  South America\n🌊 Yangtze  -  Asia\n\nLargest Lakes:\n💧 Caspian Sea, Lake Superior",
            iconSystemName: "drop.fill", gradeLabel: "Grade 4"
        ),
        GeoTopicDefinition(
            id: 9, nodeTitle: "Europe",
            introTitle: "Europe Quest",
            introText: "Europe is a continent in the Northern Hemisphere. It has about 44 countries. The largest country in Europe is Russia, and the most populated city is Moscow.",
            exampleText: "Key Countries & Capitals:\n🇩🇪 Germany → Berlin\n🇮🇹 Italy → Rome\n🇪🇸 Spain → Madrid\n🇬🇧 UK → London\n🇫🇷 France → Paris",
            iconSystemName: "globe.europe.africa.fill", gradeLabel: "Grade 4"
        ),
        GeoTopicDefinition(
            id: 10, nodeTitle: "Asia",
            introTitle: "Asia Quest",
            introText: "Asia is the largest and most populated continent. It contains 48 countries and is home to over 4 billion people. China and India are the world's most populous nations.",
            exampleText: "Key Countries & Capitals:\n🇨🇳 China → Beijing\n🇮🇳 India → New Delhi\n🇯🇵 Japan → Tokyo\n🇸🇦 Saudi Arabia → Riyadh",
            iconSystemName: "globe.asia.australia.fill", gradeLabel: "Grade 4"
        ),
        GeoTopicDefinition(
            id: 11, nodeTitle: "Africa",
            introTitle: "Africa Quest",
            introText: "Africa is the second-largest continent with 54 countries. It has the world's longest river (Nile), largest desert (Sahara), and is considered the birthplace of humanity.",
            exampleText: "Key Countries & Capitals:\n🇳🇬 Nigeria → Abuja\n🇿🇦 South Africa → Pretoria\n🇪🇬 Egypt → Cairo\n🇰🇪 Kenya → Nairobi",
            iconSystemName: "globe.europe.africa.fill", gradeLabel: "Grade 5"
        ),
        GeoTopicDefinition(
            id: 12, nodeTitle: "The Americas",
            introTitle: "The Americas Quest",
            introText: "The Americas include North America and South America. Together they stretch from the Arctic in the north to Cape Horn in the south.",
            exampleText: "Key Facts:\n🇺🇸 USA → Washington D.C.\n🇨🇦 Canada → Ottawa\n🇲🇽 Mexico → Mexico City\n🇧🇷 Brazil → Brasília\n🇦🇷 Argentina → Buenos Aires",
            iconSystemName: "globe.americas.fill", gradeLabel: "Grade 5"
        ),
        GeoTopicDefinition(
            id: 13, nodeTitle: "Latitude & Longitude",
            introTitle: "Latitude & Longitude Quest",
            introText: "Latitude and longitude are imaginary lines on a map. Latitude runs east–west (horizontal) and measures how far north or south you are. Longitude runs north–south (vertical).",
            exampleText: "Key Lines:\n🌐 Equator = 0° latitude\n🌐 Prime Meridian = 0° longitude\n🌐 Tropics of Cancer & Capricorn\n🌐 Arctic & Antarctic Circles",
            iconSystemName: "location.circle.fill", gradeLabel: "Grade 5"
        ),
        GeoTopicDefinition(
            id: 14, nodeTitle: "Ecosystems",
            introTitle: "Ecosystems Quest",
            introText: "An ecosystem is a community of living things in their environment. Earth has many biomes  -  large regions with similar climate, plants, and animals.",
            exampleText: "Major Biomes:\n🌴 Tropical Rainforest  -  warm, wet\n🏜️ Desert  -  hot/cold, very dry\n🌾 Grassland/Savanna\n🌲 Temperate Forest\n❄️ Tundra  -  frozen, treeless",
            iconSystemName: "leaf.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 15, nodeTitle: "Plate Tectonics",
            introTitle: "Plate Tectonics Quest",
            introText: "Earth's outer shell is broken into large pieces called tectonic plates. These plates move slowly, causing earthquakes, volcanoes, and the formation of mountains.",
            exampleText: "Key Facts:\n🌋 Plates collide → mountains or volcanoes\n🌋 Plates separate → ocean ridges\n🌋 Plates slide → earthquakes\n🌋 Ring of Fire = Pacific plate boundary",
            iconSystemName: "flame.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 16, nodeTitle: "Economic Geography",
            introTitle: "Economic Geography Quest",
            introText: "Economic geography looks at where resources are found and how people use them. Countries trade goods and services to meet their needs.",
            exampleText: "Examples:\n⛽ Saudi Arabia exports oil\n☕ Brazil exports coffee\n💎 South Africa exports diamonds\n🌾 Ukraine exports wheat",
            iconSystemName: "chart.bar.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 17, nodeTitle: "Population",
            introTitle: "Population Geography Quest",
            introText: "Population geography studies where people live and why. Some areas are densely populated (many people per km²) and others are sparsely populated.",
            exampleText: "Most Populous Countries:\n1. 🇨🇳 China  -  ~1.4 billion\n2. 🇮🇳 India  -  ~1.4 billion\n3. 🇺🇸 USA  -  ~335 million\n4. 🇮🇩 Indonesia\n5. 🇵🇰 Pakistan",
            iconSystemName: "person.3.fill", gradeLabel: "Grade 7"
        ),
        GeoTopicDefinition(
            id: 18, nodeTitle: "Climate Change",
            introTitle: "Climate Change Quest",
            introText: "Climate change refers to long-term shifts in global temperatures and weather patterns. Since the 1800s, human activities like burning fossil fuels have accelerated warming.",
            exampleText: "Key Effects:\n🌡️ Rising sea levels\n🌪️ More extreme weather\n🧊 Melting ice caps\n🐻‍❄️ Habitat loss\n🏜️ Expanding deserts",
            iconSystemName: "thermometer.sun.fill", gradeLabel: "Grade 7"
        ),
        GeoTopicDefinition(
            id: 19, nodeTitle: "Geopolitics",
            introTitle: "Geopolitics Quest",
            introText: "Geopolitics is about how geography influences political power and international relations. A country's location, resources, and neighbors shape its global influence.",
            exampleText: "Examples:\n🌊 Strait of Hormuz  -  vital oil shipping lane\n🇨🇭 Switzerland  -  landlocked, neutral\n🇷🇺 Russia  -  largest country, huge influence\n🌐 UN  -  193 member states",
            iconSystemName: "globe.desk.fill", gradeLabel: "Grade 8"
        ),
        GeoTopicDefinition(
            id: 20, nodeTitle: "World Geography",
            introTitle: "Advanced World Geography Quest",
            introText: "Advanced world geography brings together physical, human, and economic geography. You will apply your knowledge across continents, time zones, and global systems.",
            exampleText: "Key Concepts:\n🌐 Time zones (24 around Earth)\n📡 GMT / UTC reference time\n🗺️ Mercator vs. Peters projection\n⚖️ Developed vs. developing nations",
            iconSystemName: "globe.desk.fill", gradeLabel: "Grade 8"
        ),
        GeoTopicDefinition(
            id: 21, nodeTitle: "Natural Disasters",
            introTitle: "Natural Disasters Quest",
            introText: "Natural disasters are powerful events caused by Earth's natural processes. They include earthquakes, volcanic eruptions, tsunamis, hurricanes, tornadoes, and floods. Understanding them helps us prepare and stay safe.",
            exampleText: "Types of Natural Disasters:\n🌋 Volcano  -  molten rock erupts from Earth\n🌊 Tsunami  -  giant wave caused by undersea quake\n🌀 Hurricane  -  powerful tropical storm\n🌪️ Tornado  -  fast rotating column of air\n🌊 Flood  -  land submerged by water",
            iconSystemName: "bolt.fill", gradeLabel: "Grade 5–6"
        ),
        GeoTopicDefinition(
            id: 22, nodeTitle: "Deserts of the World",
            introTitle: "Deserts of the World Quest",
            introText: "Deserts are areas that receive very little precipitation  -  less than 250 mm per year. They can be hot and sandy or cold and icy. The world's largest desert is actually Antarctica!",
            exampleText: "Major Deserts:\n🏜️ Sahara  -  Africa (largest hot desert)\n🏜️ Gobi  -  Asia (cold desert)\n🏜️ Atacama  -  South America (driest)\n🏜️ Arabian  -  Middle East\n🏜️ Namib  -  Southern Africa",
            iconSystemName: "sun.max.fill", gradeLabel: "Grade 5"
        ),
        GeoTopicDefinition(
            id: 23, nodeTitle: "Middle East",
            introTitle: "Middle East Quest",
            introText: "The Middle East is a region in Western Asia and North Africa. It is home to some of the world's oldest civilisations and is rich in oil and natural gas. Islam is the dominant religion.",
            exampleText: "Key Countries & Capitals:\n🇸🇦 Saudi Arabia → Riyadh\n🇮🇷 Iran → Tehran\n🇮🇶 Iraq → Baghdad\n🇮🇱 Israel → Jerusalem\n🇹🇷 Turkey → Ankara\n🇦🇪 UAE → Abu Dhabi",
            iconSystemName: "building.columns.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 24, nodeTitle: "Southeast Asia",
            introTitle: "Southeast Asia Quest",
            introText: "Southeast Asia is a subregion of Asia with 11 countries. It includes mainland nations and thousands of islands. The region is known for its biodiversity, rice farming, and rapid economic growth.",
            exampleText: "Key Countries & Capitals:\n🇻🇳 Vietnam → Hanoi\n🇹🇭 Thailand → Bangkok\n🇮🇩 Indonesia → Jakarta\n🇵🇭 Philippines → Manila\n🇸🇬 Singapore → Singapore City\n🇰🇭 Cambodia → Phnom Penh",
            iconSystemName: "globe.asia.australia.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 25, nodeTitle: "Oceania & Pacific",
            introTitle: "Oceania & Pacific Quest",
            introText: "Oceania includes Australia, New Zealand, and thousands of Pacific islands. The Pacific Ocean is the world's largest ocean. Many Pacific nations are at risk from rising sea levels.",
            exampleText: "Key Nations:\n🇳🇿 New Zealand → Wellington\n🇵🇬 Papua New Guinea → Port Moresby\n🇫🇯 Fiji → Suva\n🇼🇸 Samoa → Apia\n🇻🇺 Vanuatu → Port Vila",
            iconSystemName: "water.waves", gradeLabel: "Grade 5"
        ),
        GeoTopicDefinition(
            id: 26, nodeTitle: "Urban Geography",
            introTitle: "Urban Geography Quest",
            introText: "Urban geography studies cities and how they grow. Today more than half the world's population lives in cities. Rapid urban growth creates both opportunities and challenges such as housing shortages and pollution.",
            exampleText: "Key Concepts:\n🏙️ Megacity  -  city with 10+ million people\n📈 Urbanisation  -  people moving to cities\n🏚️ Shanty towns  -  informal settlements\n⬆️ Push factors  -  reasons to leave rural areas\n⬇️ Pull factors  -  attractions of cities",
            iconSystemName: "building.2.fill", gradeLabel: "Grade 7"
        ),
        GeoTopicDefinition(
            id: 27, nodeTitle: "Agriculture & Food",
            introTitle: "Agriculture & Food Quest",
            introText: "Agriculture is the practice of growing crops and raising animals for food. There are two main types: subsistence farming (for personal use) and commercial farming (for sale). Food security means all people have access to enough nutritious food.",
            exampleText: "Key Concepts:\n🌾 Subsistence farming  -  grow food for yourself\n🚜 Commercial farming  -  large-scale for profit\n🌱 Green Revolution  -  new crop varieties, fertilisers\n🌍 Food security  -  reliable access to food\n🐄 Pastoral farming  -  rearing livestock",
            iconSystemName: "leaf.fill", gradeLabel: "Grade 6"
        ),
        GeoTopicDefinition(
            id: 28, nodeTitle: "Energy Geography",
            introTitle: "Energy Geography Quest",
            introText: "Energy geography looks at where energy comes from, how it is produced, and how it is distributed. Countries that rely heavily on imports for energy face energy security risks. Renewable sources are growing as the world moves away from fossil fuels.",
            exampleText: "Energy Types:\n⛽ Fossil fuels  -  coal, oil, natural gas\n☀️ Solar  -  from sunlight\n💨 Wind  -  from moving air\n💧 Hydro  -  from moving water\n🌋 Geothermal  -  from Earth's heat\n🏭 OPEC  -  oil-producing countries group",
            iconSystemName: "bolt.circle.fill", gradeLabel: "Grade 7"
        ),
        GeoTopicDefinition(
            id: 29, nodeTitle: "Trade Routes & Transport",
            introTitle: "Trade Routes & Transport Quest",
            introText: "Trade routes are the paths along which goods are moved between countries. Throughout history, routes like the Silk Road linked distant civilisations. Today, most world trade travels by sea through key shipping lanes, canals, and straits.",
            exampleText: "Key Routes & Features:\n🚢 Silk Road  -  ancient land route Europe↔Asia\n🚢 Suez Canal  -  shortcuts Europe↔Asia by sea\n🚢 Panama Canal  -  connects Atlantic↔Pacific\n🌊 Strait of Malacca  -  busiest sea lane\n✈️ Modern air freight routes",
            iconSystemName: "arrow.triangle.swap", gradeLabel: "Grade 7"
        ),
        GeoTopicDefinition(
            id: 30, nodeTitle: "Cultural Geography",
            introTitle: "Cultural Geography Quest",
            introText: "Cultural geography studies the impact of human culture on the landscape and how geography shapes cultures. It looks at languages, religions, traditions, and how globalisation is connecting the world while sometimes threatening local cultures.",
            exampleText: "Key Concepts:\n🗣️ Most spoken language  -  Mandarin Chinese\n☪️ Largest religion  -  Christianity (then Islam)\n🌐 Globalisation  -  world becoming more connected\n🎭 Cultural diffusion  -  spread of culture\n🏳️ Cultural regions  -  areas sharing similar traits",
            iconSystemName: "person.3.fill", gradeLabel: "Grade 8"
        ),

        GeoTopicDefinition(
        id: 31, nodeTitle: "Map Projections",
        introTitle: "Map Projections Quest",
        introText: "Earth is a sphere, but maps are flat  -  so every map distorts reality in some way. Different projections stretch or shrink areas, shapes, or distances. The Mercator projection makes Greenland look huge, while the Peters projection shows true land area.",
        exampleText: "Example:\n\n🌐 Globe = accurate shape\n🗺️ Mercator = shapes OK, sizes wrong\n📏 Peters = sizes OK, shapes stretched",
        iconSystemName: "globe",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 32, nodeTitle: "Thematic Maps",
        introTitle: "Thematic Maps Quest",
        introText: "Thematic maps show a specific topic across a region  -  like population density, rainfall, or natural resources. A choropleth map uses shading to show differences between areas. These maps help us spot patterns and compare places.",
        exampleText: "Example:\n\n🟥 Dark red = very high population\n🟧 Orange = medium population\n🟨 Yellow = low population",
        iconSystemName: "map",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 33, nodeTitle: "Scale & Distance",
        introTitle: "Scale & Distance Quest",
        introText: "A map scale tells you the relationship between distance on the map and real distance on Earth. If 1 cm = 100 km, you can measure the map and calculate actual distances. Larger scale maps show more detail; smaller scale maps show larger areas.",
        exampleText: "Example:\n\n📏 1 cm on map = 50 km in reality\n📍 City A to City B = 3 cm on map\n✅ Real distance = 3 × 50 = 150 km",
        iconSystemName: "ruler.fill",
        gradeLabel: "Grade 4"
    ),

    GeoTopicDefinition(
        id: 34, nodeTitle: "Indigenous Peoples",
        introTitle: "Indigenous Peoples Quest",
        introText: "Indigenous peoples are the original inhabitants of lands around the world, with unique languages, traditions, and deep connections to the land. Groups like the Maori of New Zealand, the Navajo of North America, and the Aboriginal Australians have rich cultures shaped over thousands of years.",
        exampleText: "Example:\n\n🪶 Inuit  -  Arctic regions of Canada & Greenland\n🌿 Maori  -  Aotearoa (New Zealand)\n🦘 Aboriginal Australians  -  Australia",
        iconSystemName: "person.3.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 35, nodeTitle: "Migration",
        introTitle: "Migration & Movement Quest",
        introText: "Migration is when people move from one place to another. People migrate for many reasons: seeking safety, better jobs, education, or because of climate. Refugees flee danger, while immigrants choose to move. Diaspora communities keep their culture alive in new places.",
        exampleText: "Example:\n\n✈️ Economic migration: moving for work\n🆘 Refugees: fleeing war or disaster\n🌍 Diaspora: communities living outside homeland",
        iconSystemName: "figure.walk",
        gradeLabel: "Grade 6"
    ),

    GeoTopicDefinition(
        id: 36, nodeTitle: "Urban Planning",
        introTitle: "Urban Planning Quest",
        introText: "Urban planning is how cities are designed and organised. Planners decide where homes, schools, parks, and roads go. Zoning separates residential, commercial, and industrial areas. Good planning includes public transport and green spaces to make cities liveable.",
        exampleText: "Example:\n\n🏠 Residential zone = homes & apartments\n🏪 Commercial zone = shops & offices\n🌳 Green space = parks & nature areas",
        iconSystemName: "building.2.fill",
        gradeLabel: "Grade 7"
    ),

    GeoTopicDefinition(
        id: 37, nodeTitle: "Water Resources",
        introTitle: "Water Resources Quest",
        introText: "Freshwater is essential for life, but only about 3% of Earth's water is fresh  -  and most of that is frozen. Aquifers are underground water stores that many communities rely on. Rivers like the Nile and Amazon are vital resources, and conflicts over water are growing as populations rise.",
        exampleText: "Example:\n\n💧 3% of Earth's water is fresh\n🏔️ 2% locked in glaciers & ice caps\n🚰 Only 1% available as liquid freshwater",
        iconSystemName: "drop.triangle.fill",
        gradeLabel: "Grade 6"
    ),

    GeoTopicDefinition(
        id: 38, nodeTitle: "Biodiversity",
        introTitle: "Biodiversity Hotspots Quest",
        introText: "Biodiversity hotspots are regions with an extraordinary number of species found nowhere else on Earth. The Amazon rainforest, Borneo, and Madagascar are famous examples. These places face serious threats from deforestation and climate change, making conservation urgent.",
        exampleText: "Example:\n\n🌿 Amazon = 10% of all species on Earth\n🦎 Madagascar = 90% of wildlife found nowhere else\n🦧 Borneo = orangutans, pygmy elephants, sun bears",
        iconSystemName: "leaf.fill",
        gradeLabel: "Grade 6"
    ),

    GeoTopicDefinition(
        id: 39, nodeTitle: "Land Use",
        introTitle: "Land Use & Land Cover Quest",
        introText: "Land use describes what human activities happen on an area of land  -  farming, cities, factories, or forests. Land cover is the physical surface  -  grass, concrete, water, snow. Understanding both helps geographers track environmental change and plan sustainably.",
        exampleText: "Example:\n\n🌾 Agricultural = farmland & pastures\n🏙️ Urban = cities & towns\n🌲 Forest = woodland & jungle\n🏭 Industrial = factories & warehouses",
        iconSystemName: "square.grid.3x3.fill",
        gradeLabel: "Grade 6"
    ),

        GeoTopicDefinition(
        id: 40,
        nodeTitle: "Env. Justice",
        introTitle: "Environmental Justice",
        introText: "Environmental justice explores who bears the costs of pollution, climate change, and environmental harm. Often, poorer communities and minority groups live closer to factories, landfills, and polluted areas. Fair distribution of natural resources and clean environments is a global challenge.",
        exampleText: "🏭 A neighbourhood next to a chemical plant may experience higher rates of illness. Environmental justice asks: is it fair that some people face more pollution than others just because of where they live or their income?",
        iconSystemName: "scalemass.fill",
        gradeLabel: "Grade 7"
    ),

    GeoTopicDefinition(
        id: 41,
        nodeTitle: "Political Borders",
        introTitle: "Political Boundaries",
        introText: "Political boundaries are the lines that separate countries, states, and territories. They can be created by treaties, wars, rivers, or mountain ranges. Some borders are disputed, meaning two or more countries claim the same land, which can lead to conflict.",
        exampleText: "🗺️ The border between India and Pakistan in Kashmir has been disputed for decades. Both countries claim the region, making it one of the most contested boundaries in the world.",
        iconSystemName: "shield.fill",
        gradeLabel: "Grade 7"
    ),

    GeoTopicDefinition(
        id: 42,
        nodeTitle: "Tourism Geo",
        introTitle: "Tourism Geography",
        introText: "Tourism geography studies how and why people travel, where they go, and the impact tourism has on places. While tourism brings money and jobs, overtourism can damage environments and local cultures. Ecotourism tries to make travel more sustainable and respectful.",
        exampleText: "🏝️ Venice, Italy attracts millions of tourists each year  -  but huge cruise ships and crowds are damaging the historic city. Overtourism is a real problem for many famous destinations around the world.",
        iconSystemName: "airplane",
        gradeLabel: "Grade 6"
    ),

    GeoTopicDefinition(
        id: 43,
        nodeTitle: "Supply Chains",
        introTitle: "Supply Chains",
        introText: "A supply chain is the journey a product takes from raw materials through manufacturing, transport, and retail until it reaches a consumer. Global supply chains connect countries around the world. A single product  -  like a smartphone  -  may involve materials and labour from dozens of countries.",
        exampleText: "📱 Your smartphone might contain cobalt mined in the Democratic Republic of Congo, assembled in China, designed in the USA, and sold in the UK. That is a global supply chain in action!",
        iconSystemName: "arrow.triangle.2.circlepath",
        gradeLabel: "Grade 7"
    ),

    GeoTopicDefinition(
        id: 44,
        nodeTitle: "Economic Systems",
        introTitle: "Economic Systems",
        introText: "An economic system describes how a country organises the production and distribution of goods and services. The main types are capitalism (private ownership), socialism (government ownership), and mixed economies (a combination of both). Most countries today have mixed economies.",
        exampleText: "💰 The United States is largely capitalist  -  businesses are privately owned. Sweden has a mixed economy with strong welfare services funded by taxes. Cuba is more socialist, with the government controlling major industries.",
        iconSystemName: "chart.bar.fill",
        gradeLabel: "Grade 7"
    ),

    GeoTopicDefinition(
        id: 45,
        nodeTitle: "Coords & GPS",
        introTitle: "Coordinates & GPS",
        introText: "Every location on Earth can be described using latitude and longitude  -  a grid system measured in degrees. GPS (Global Positioning System) uses satellites to pinpoint exact locations using these coordinates. Grid references on maps help us navigate and find places accurately.",
        exampleText: "📍 The Eiffel Tower in Paris sits at approximately 48.86°N, 2.29°E. Your phone's GPS uses signals from satellites to calculate your latitude and longitude and show you exactly where you are on a map.",
        iconSystemName: "location.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 46,
        nodeTitle: "Cultural Divrsty",
        introTitle: "Cultural Diversity",
        introText: "Cultural diversity refers to the variety of languages, religions, traditions, and customs found across and within countries. Culture shapes how people live, celebrate, communicate, and see the world. Respecting and understanding different cultures is important in our interconnected world.",
        exampleText: "🌍 India alone has over 20 officially recognised languages and hundreds of dialects. Festivals like Diwali, Eid, Holi, and Christmas are all celebrated there, reflecting India's incredible cultural diversity.",
        iconSystemName: "globe.americas.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 47,
        nodeTitle: "Human Rights",
        introTitle: "Human Rights & Geography",
        introText: "Human rights are the basic rights and freedoms that belong to every person, regardless of where they live. Geography plays a huge role  -  where you are born can determine your access to education, safety, healthcare, and freedom. Refugees and children in conflict zones often face the greatest challenges to their rights.",
        exampleText: "🤲 A child born in a war zone may have no access to school, clean water, or safety  -  rights guaranteed by the UN Convention on the Rights of the Child. Geography and politics directly affect whether people can enjoy their human rights.",
        iconSystemName: "hand.raised.fill",
        gradeLabel: "Grade 8"
    ),

    GeoTopicDefinition(
        id: 48,
        nodeTitle: "Deserts of the World",
        introTitle: "Deserts of the World Quest",
        introText: "A desert is any area that receives less than 250 mm of rain per year. Deserts can be scorching hot or bitterly cold  -  the world's largest desert is actually Antarctica! Hot deserts like the Sahara have extreme temperature swings, while cold deserts like the Gobi are icy in winter.",
        exampleText: "Major Deserts:\n🏜️ Sahara  -  Africa (largest hot desert)\n🏜️ Arabian  -  Middle East\n🏜️ Gobi  -  Asia (cold desert)\n🏜️ Atacama  -  South America (driest place)\n🏜️ Namib  -  southern Africa (coastal desert)",
        iconSystemName: "sun.max.fill",
        gradeLabel: "Grade 4"
    ),

    GeoTopicDefinition(
        id: 49,
        nodeTitle: "Rainforests",
        introTitle: "Rainforests & Biodiversity Quest",
        introText: "Tropical rainforests receive more than 2,000 mm of rain a year and are home to more than half of all plant and animal species on Earth. They are found near the equator in South America, Africa, and Southeast Asia. Rainforests are sometimes called the 'lungs of the Earth' because they absorb vast amounts of CO₂.",
        exampleText: "Key Rainforests:\n🌿 Amazon  -  South America (largest)\n🌿 Congo Basin  -  Central Africa\n🌿 Borneo & Sumatra  -  Southeast Asia\n\nWhy they matter:\n🐦 Incredible biodiversity\n🌬️ Regulate global climate\n💧 Produce rainfall through transpiration",
        iconSystemName: "leaf.fill",
        gradeLabel: "Grade 4"
    ),

    GeoTopicDefinition(
        id: 50,
        nodeTitle: "Islands & Peninsulas",
        introTitle: "Islands & Peninsulas Quest",
        introText: "An island is a piece of land completely surrounded by water. A peninsula is a piece of land almost entirely surrounded by water but still connected to the mainland. Islands can form from volcanic activity, coral growth, or changes in sea level.",
        exampleText: "Famous Islands:\n🏝️ Greenland  -  world's largest island\n🏝️ Great Britain  -  largest in Europe\n🏝️ Borneo  -  third largest globally\n\nFamous Peninsulas:\n🗺️ Iberian Peninsula  -  Spain & Portugal\n🗺️ Arabian Peninsula  -  Middle East\n🗺️ Scandinavian Peninsula  -  Norway & Sweden",
        iconSystemName: "water.waves",
        gradeLabel: "Grade 4"
    ),

    GeoTopicDefinition(
        id: 51,
        nodeTitle: "Earthquakes & Volcanoes",
        introTitle: "Earthquakes & Volcanoes Quest",
        introText: "Earthquakes happen when tectonic plates suddenly move, releasing energy as seismic waves. Volcanoes form where magma (molten rock) pushes through the Earth's crust. Both are common along plate boundaries, especially around the Pacific Ocean in the 'Ring of Fire'.",
        exampleText: "Key Facts:\n🌋 Volcano: opening in Earth's crust where lava erupts\n🌍 Earthquake: sudden shaking of the ground\n📏 Richter scale: measures earthquake strength\n🌊 Tsunami: giant wave caused by undersea quake\n🔥 Ring of Fire: zone of most earthquakes & volcanoes",
        iconSystemName: "flame.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 52,
        nodeTitle: "Climate Zones",
        introTitle: "Climate Zones Quest",
        introText: "The Earth is divided into climate zones based on temperature and rainfall patterns. The main zones are tropical, dry (arid), temperate, continental, and polar. Your distance from the equator (latitude), height above sea level, and distance from the ocean all affect your climate zone.",
        exampleText: "Main Climate Zones:\n🌞 Tropical  -  hot & wet year-round (near equator)\n🏜️ Dry/Arid  -  very little rainfall\n🌤️ Temperate  -  mild, four seasons\n❄️ Continental  -  cold winters, warm summers\n🧊 Polar  -  freezing cold all year",
        iconSystemName: "cloud.sun.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 53,
        nodeTitle: "Population & Cities",
        introTitle: "Population & Cities Quest",
        introText: "The world's population reached 8 billion people in 2022. People are not spread evenly  -  some areas are densely populated (many people per km²) while others are sparsely populated. Today, more than half of all people live in cities, and this number keeps growing.",
        exampleText: "Key Facts:\n👥 World population: ~8 billion\n🏙️ Most populous city: Tokyo (~37 million)\n🌍 Most populous country: India & China (~1.4 billion each)\n📈 Urbanisation: % of people living in cities is rising\n🏚️ Megacity: city with 10+ million people",
        iconSystemName: "person.3.fill",
        gradeLabel: "Grade 5"
    ),

    GeoTopicDefinition(
        id: 54,
        nodeTitle: "Natural Resources",
        introTitle: "Natural Resources Quest",
        introText: "Natural resources are materials found in nature that humans use. They include water, soil, forests, minerals, oil, and natural gas. Resources can be renewable (replaced naturally, like solar or wind energy) or non-renewable (used up faster than they form, like coal and oil).",
        exampleText: "Examples:\n🌊 Renewable: water, wind, solar, forests\n⛽ Non-renewable: oil, coal, natural gas, minerals\n\nKey Exporters:\n🇸🇦 Saudi Arabia  -  oil\n☕ Brazil  -  coffee\n💎 South Africa  -  diamonds\n🌾 Canada  -  wheat & timber",
        iconSystemName: "sparkles",
        gradeLabel: "Grade 5"
    ),
    ]

    // MARK: - Lookup Helpers

    static func topic(for id: Int) -> GeoTopicDefinition? {
        topics.first { $0.id == id }
    }

    static func topicTitle(for id: Int) -> String {
        topic(for: id)?.nodeTitle ?? "Topic \(id)"
    }

    static func hasQuestions(for id: Int) -> Bool {
        !(practiceQuestionsByTopic[id] ?? []).isEmpty
    }

    static func availableTopicIds() -> [Int] {
        practiceQuestionsByTopic.keys.sorted()
    }

    // MARK: - Practice Questions

    static func practiceQuestions(for topicId: Int, questNumber: Int) -> [MathExamQuestion] {
        let all = practiceQuestionsByTopic[topicId] ?? []
        guard !all.isEmpty else { return [] }
        let startIndex: Int
        switch questNumber {
        case 1:  startIndex = 0
        case 2:  startIndex = min(5,  all.count - 1)
        case 3:  startIndex = min(10, all.count - 1)
        case 4:  startIndex = min(15, all.count - 1)
        default: startIndex = 0
        }
        let endIndex = min(startIndex + questionsPerQuest, all.count)
        guard startIndex < endIndex else { return Array(all.prefix(questionsPerQuest)) }
        return Array(all[startIndex..<endIndex])
    }

    // MARK: - Exam Questions

    static func examQuestions(for topicId: Int) -> [MathExamQuestion] {
        examQuestionsByTopic[topicId] ?? []
    }

    // MARK: - Diagnostic Questions

    static let diagnosticQuestions: [DiagnosticQuestion] = [

        DiagnosticQuestion(
            id: "geo_diag_1", topicLabel: "Where I Live",
            prompt: "What do we call the area of streets and homes around where you live?",
            options: ["A continent", "A neighborhood", "An ocean", "A country", "I don't know"],
            correctIndex: 1,
            explanation: "The area around your home with nearby streets and buildings is called a neighborhood."
        ),
        DiagnosticQuestion(
            id: "geo_diag_2", topicLabel: "Maps",
            prompt: "What is a globe?",
            options: ["A flat map", "A round model of Earth", "A type of ocean", "A mountain", "I don't know"],
            correctIndex: 1,
            explanation: "A globe is a round (spherical) model of the Earth."
        ),
        DiagnosticQuestion(
            id: "geo_diag_3", topicLabel: "Continents",
            prompt: "How many continents does Earth have?",
            options: ["5", "6", "7", "8", "I don't know"],
            correctIndex: 2,
            explanation: "Earth has 7 continents: Africa, Antarctica, Asia, Australia, Europe, North America, and South America."
        ),
        DiagnosticQuestion(
            id: "geo_diag_4", topicLabel: "Capitals",
            prompt: "What is the capital city of France?",
            options: ["Lyon", "Marseille", "Paris", "Nice", "I don't know"],
            correctIndex: 2,
            explanation: "Paris is the capital and largest city of France."
        ),
        DiagnosticQuestion(
            id: "geo_diag_5", topicLabel: "Weather",
            prompt: "Which climate is described as 'very hot and very dry'?",
            options: ["Polar", "Tropical", "Desert", "Temperate", "I don't know"],
            correctIndex: 2,
            explanation: "Desert climates are characterized by very high temperatures and very little rainfall."
        ),
        DiagnosticQuestion(
            id: "geo_diag_6", topicLabel: "US States",
            prompt: "How many states are there in the United States of America?",
            options: ["48", "49", "50", "52", "I don't know"],
            correctIndex: 2,
            explanation: "The USA has 50 states."
        ),
        DiagnosticQuestion(
            id: "geo_diag_7", topicLabel: "Mountains",
            prompt: "Which is the tallest mountain in the world?",
            options: ["Mont Blanc", "Mount Kilimanjaro", "Mount Everest", "K2", "I don't know"],
            correctIndex: 2,
            explanation: "Mount Everest in the Himalayas is the tallest mountain on Earth at 8,849 m."
        ),
        DiagnosticQuestion(
            id: "geo_diag_8", topicLabel: "Rivers",
            prompt: "Which river is the longest in the world?",
            options: ["Amazon", "Mississippi", "Nile", "Yangtze", "I don't know"],
            correctIndex: 2,
            explanation: "The Nile River in Africa is generally recognized as the world's longest river."
        ),
        DiagnosticQuestion(
            id: "geo_diag_9", topicLabel: "Europe",
            prompt: "What is the capital of Germany?",
            options: ["Munich", "Hamburg", "Frankfurt", "Berlin", "I don't know"],
            correctIndex: 3,
            explanation: "Berlin is the capital and largest city of Germany."
        ),
        DiagnosticQuestion(
            id: "geo_diag_10", topicLabel: "Asia",
            prompt: "Which country is the most populous in the world?",
            options: ["USA", "China", "India", "Indonesia", "I don't know"],
            correctIndex: 1,
            explanation: "China has the world's largest population at approximately 1.4 billion people."
        ),
        DiagnosticQuestion(
            id: "geo_diag_11", topicLabel: "Latitude",
            prompt: "What is the name of the line at 0° latitude?",
            options: ["Prime Meridian", "Tropic of Cancer", "Equator", "Arctic Circle", "I don't know"],
            correctIndex: 2,
            explanation: "The Equator is the imaginary line at 0° latitude that divides Earth into the Northern and Southern Hemispheres."
        ),
        DiagnosticQuestion(
            id: "geo_diag_12", topicLabel: "Ecosystems",
            prompt: "Which biome receives the most rainfall each year?",
            options: ["Tundra", "Desert", "Tropical rainforest", "Grassland", "I don't know"],
            correctIndex: 2,
            explanation: "Tropical rainforests receive more than 2,000 mm of rain per year  -  the most of any biome."
        ),
        DiagnosticQuestion(
            id: "geo_diag_13", topicLabel: "Plate Tectonics",
            prompt: "What geological feature forms when two tectonic plates collide?",
            options: ["Oceans", "Mountains", "Plains", "Deserts", "I don't know"],
            correctIndex: 1,
            explanation: "When tectonic plates collide, the crust is pushed upward forming mountain ranges."
        ),
        DiagnosticQuestion(
            id: "geo_diag_14", topicLabel: "Geopolitics",
            prompt: "How many member states does the United Nations have?",
            options: ["150", "175", "193", "210", "I don't know"],
            correctIndex: 2,
            explanation: "The United Nations has 193 member states, making it the largest international organization."
        ),
    ]

    // MARK: - Practice Questions Bank

    private static let practiceQuestionsByTopic: [Int: [MathExamQuestion]] = [

        // Topic 1: Where I Live
        1: [
            MathExamQuestion(id: "geo_1_p1", topicId: 1, prompt: "What do we call the area around your home with nearby streets and buildings?", options: ["Continent", "Neighborhood", "Ocean", "Desert"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_p2", topicId: 1, prompt: "Which of these is the SMALLEST?", options: ["Country", "City", "Street", "Continent"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_p3", topicId: 1, prompt: "What is a community?", options: ["A type of weather", "A group of people living in the same area", "A tall mountain", "A large ocean"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_p4", topicId: 1, prompt: "Which of these might you find in a neighborhood?", options: ["A volcano", "A school", "An ocean", "A desert"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_p5", topicId: 1, prompt: "Which is the LARGEST area?", options: ["House", "Street", "Neighborhood", "Country"], correctIndex: 3),
            MathExamQuestion(id: "geo_1_p6", topicId: 1, prompt: "What do we call a large collection of towns and cities in one area?", options: ["Ocean", "Country", "Region", "Island"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_p7", topicId: 1, prompt: "Which of these is a human-made feature in a neighborhood?", options: ["River", "Hill", "Road", "Forest"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_p8", topicId: 1, prompt: "A map of your neighborhood would show...", options: ["Stars in the sky", "Nearby streets and buildings", "Underwater fish", "Weather in other countries"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_p9", topicId: 1, prompt: "What is an address?", options: ["A type of food", "The specific location of a building", "A large ocean", "A type of map"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_p10", topicId: 1, prompt: "Which of these is a natural feature you might see in a neighborhood?", options: ["Traffic light", "Park tree", "Apartment building", "Bus stop"], correctIndex: 1),
        ],

        // Topic 2: Maps and Globes
        2: [
            MathExamQuestion(id: "geo_2_p1", topicId: 2, prompt: "What shape is a globe?", options: ["Flat", "Square", "Round like a ball", "Triangle"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_p2", topicId: 2, prompt: "On most maps, what color is used for water?", options: ["Green", "Brown", "Yellow", "Blue"], correctIndex: 3),
            MathExamQuestion(id: "geo_2_p3", topicId: 2, prompt: "What is a compass rose on a map?", options: ["A flower drawing", "A symbol showing directions (N, S, E, W)", "The title of the map", "A legend"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_p4", topicId: 2, prompt: "What is a map legend (key) used for?", options: ["To show the date the map was made", "To explain the symbols and colors on a map", "To measure distances", "To show where north is"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_p5", topicId: 2, prompt: "Which direction is at the top of most maps?", options: ["South", "East", "West", "North"], correctIndex: 3),
            MathExamQuestion(id: "geo_2_p6", topicId: 2, prompt: "What does a map scale tell you?", options: ["The age of the map", "How colors are used", "The relationship between distances on the map and real distances", "Where the capital cities are"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_p7", topicId: 2, prompt: "A physical map shows...", options: ["Country borders only", "Natural features like mountains and rivers", "Bus and train routes", "Population data"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_p8", topicId: 2, prompt: "What is the main advantage of a globe over a flat map?", options: ["It is easier to carry", "It shows more detail", "It shows the Earth's true shape without distortion", "It is cheaper to make"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_p9", topicId: 2, prompt: "On a map, what do contour lines show?", options: ["Roads", "Rivers", "Height of the land", "Country borders"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_p10", topicId: 2, prompt: "Which type of map shows political boundaries like countries and states?", options: ["Physical map", "Climate map", "Political map", "Topographic map"], correctIndex: 2),
        ],

        // Topic 3: Continents & Oceans
        3: [
            MathExamQuestion(id: "geo_3_p1", topicId: 3, prompt: "How many continents are there on Earth?", options: ["5", "6", "7", "8"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_p2", topicId: 3, prompt: "Which is the largest continent?", options: ["Africa", "Europe", "Asia", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_p3", topicId: 3, prompt: "Which is the smallest continent?", options: ["Europe", "Australia", "Antarctica", "South America"], correctIndex: 1),
            MathExamQuestion(id: "geo_3_p4", topicId: 3, prompt: "How many oceans are there on Earth?", options: ["3", "4", "5", "6"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_p5", topicId: 3, prompt: "Which is the largest ocean?", options: ["Atlantic", "Indian", "Arctic", "Pacific"], correctIndex: 3),
            MathExamQuestion(id: "geo_3_p6", topicId: 3, prompt: "Which continent is almost entirely covered by ice?", options: ["Asia", "Australia", "Antarctica", "Europe"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_p7", topicId: 3, prompt: "Which ocean lies between North America and Europe?", options: ["Pacific", "Indian", "Atlantic", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_p8", topicId: 3, prompt: "Which continent is in the Southern Hemisphere and surrounded by ocean?", options: ["Europe", "Australia", "Asia", "North America"], correctIndex: 1),
            MathExamQuestion(id: "geo_3_p9", topicId: 3, prompt: "On which continent is Egypt located?", options: ["Asia", "Europe", "South America", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_3_p10", topicId: 3, prompt: "Which ocean is the smallest and coldest?", options: ["Southern", "Indian", "Arctic", "Atlantic"], correctIndex: 2),
        ],

        // Topic 4: Countries & Capitals
        4: [
            MathExamQuestion(id: "geo_4_p1", topicId: 4, prompt: "What is the capital of France?", options: ["Lyon", "Nice", "Paris", "Bordeaux"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p2", topicId: 4, prompt: "What is the capital of Japan?", options: ["Osaka", "Kyoto", "Tokyo", "Hiroshima"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p3", topicId: 4, prompt: "What is the capital of Australia?", options: ["Sydney", "Melbourne", "Brisbane", "Canberra"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_p4", topicId: 4, prompt: "What is the capital of Brazil?", options: ["São Paulo", "Rio de Janeiro", "Brasília", "Salvador"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p5", topicId: 4, prompt: "What is the capital of the United Kingdom?", options: ["Edinburgh", "Manchester", "London", "Birmingham"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p6", topicId: 4, prompt: "What is the capital of Canada?", options: ["Toronto", "Vancouver", "Montreal", "Ottawa"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_p7", topicId: 4, prompt: "What is the capital of China?", options: ["Shanghai", "Beijing", "Guangzhou", "Shenzhen"], correctIndex: 1),
            MathExamQuestion(id: "geo_4_p8", topicId: 4, prompt: "What is the capital of Germany?", options: ["Munich", "Hamburg", "Berlin", "Frankfurt"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p9", topicId: 4, prompt: "Approximately how many countries are there in the world?", options: ["95", "145", "195", "245"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_p10", topicId: 4, prompt: "What is the capital of India?", options: ["Mumbai", "Kolkata", "New Delhi", "Chennai"], correctIndex: 2),
        ],

        // Topic 5: Weather & Climate
        5: [
            MathExamQuestion(id: "geo_5_p1", topicId: 5, prompt: "What is the difference between weather and climate?", options: ["They are the same thing", "Weather is daily conditions; climate is long-term patterns", "Climate is what happens today; weather is long-term", "Weather only occurs at the equator"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_p2", topicId: 5, prompt: "Which climate zone is found near the equator and has rain year-round?", options: ["Polar", "Arid", "Tropical", "Temperate"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_p3", topicId: 5, prompt: "What causes the four seasons?", options: ["Earth's distance from the Sun", "Earth's tilt on its axis", "The Moon's gravity", "Ocean currents"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_p4", topicId: 5, prompt: "Which type of climate has very cold winters and mild summers?", options: ["Tropical", "Desert", "Continental", "Mediterranean"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_p5", topicId: 5, prompt: "What is a hurricane?", options: ["A cold weather front", "A violent tropical storm with strong winds", "A type of snowstorm", "A prolonged dry period"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_p6", topicId: 5, prompt: "Which tool measures temperature?", options: ["Barometer", "Anemometer", "Thermometer", "Rain gauge"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_p7", topicId: 5, prompt: "What is a drought?", options: ["A long period of heavy rain", "A long period with very little or no rain", "A very strong wind", "A sudden drop in temperature"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_p8", topicId: 5, prompt: "The Mediterranean climate is known for...", options: ["Very cold winters and icy summers", "Hot dry summers and mild wet winters", "Year-round heavy rainfall", "Permanent snow and ice"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_p9", topicId: 5, prompt: "What does an anemometer measure?", options: ["Rainfall", "Temperature", "Wind speed", "Air pressure"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_p10", topicId: 5, prompt: "Which of these is NOT a factor affecting climate?", options: ["Latitude", "Distance from the sea", "Language spoken in the country", "Altitude"], correctIndex: 2),
        ],

        // Topic 6: US States
        6: [
            MathExamQuestion(id: "geo_6_p1", topicId: 6, prompt: "How many states are in the USA?", options: ["48", "49", "50", "52"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p2", topicId: 6, prompt: "What is the capital of the United States?", options: ["New York City", "Los Angeles", "Washington D.C.", "Chicago"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p3", topicId: 6, prompt: "Which is the largest US state by area?", options: ["Texas", "California", "Alaska", "Montana"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p4", topicId: 6, prompt: "What is the capital of California?", options: ["Los Angeles", "San Francisco", "Sacramento", "San Diego"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p5", topicId: 6, prompt: "Which US state is made up of a group of islands in the Pacific Ocean?", options: ["Alaska", "Florida", "Hawaii", "Maine"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p6", topicId: 6, prompt: "Which river forms much of the border between the USA and Mexico?", options: ["Colorado River", "Mississippi River", "Rio Grande", "Snake River"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_p7", topicId: 6, prompt: "What is the capital of Texas?", options: ["Houston", "Dallas", "San Antonio", "Austin"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_p8", topicId: 6, prompt: "Which of the Great Lakes is entirely within the USA?", options: ["Lake Superior", "Lake Michigan", "Lake Erie", "Lake Ontario"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_p9", topicId: 6, prompt: "Which US state is known as the 'Sunshine State'?", options: ["California", "Florida", "Arizona", "Hawaii"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_p10", topicId: 6, prompt: "The Rocky Mountains run through which part of the USA?", options: ["East Coast", "Gulf Coast", "West and Central", "Great Plains only"], correctIndex: 2),
        ],

        // Topic 7: Mountain Ranges
        7: [
            MathExamQuestion(id: "geo_7_p1", topicId: 7, prompt: "What is the tallest mountain in the world?", options: ["K2", "Mont Blanc", "Mount Everest", "Aconcagua"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_p2", topicId: 7, prompt: "In which continent are the Andes Mountains?", options: ["Africa", "North America", "Asia", "South America"], correctIndex: 3),
            MathExamQuestion(id: "geo_7_p3", topicId: 7, prompt: "The Alps are in which continent?", options: ["Asia", "Africa", "Europe", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_p4", topicId: 7, prompt: "Which mountain range contains Mount Everest?", options: ["Alps", "Andes", "Himalayas", "Rockies"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_p5", topicId: 7, prompt: "What is the highest peak in Africa?", options: ["Mount Kenya", "Mount Kilimanjaro", "Ras Dashen", "Toubkal"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_p6", topicId: 7, prompt: "The Rocky Mountains run through which two countries?", options: ["Brazil and Argentina", "UK and France", "USA and Canada", "Russia and China"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_p7", topicId: 7, prompt: "What is the longest mountain range in the world?", options: ["Himalayas", "Rockies", "Andes", "Alps"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_p8", topicId: 7, prompt: "Which European mountain is the highest?", options: ["Mont Blanc", "Matterhorn", "Ben Nevis", "Eiger"], correctIndex: 0),
            MathExamQuestion(id: "geo_7_p9", topicId: 7, prompt: "Mountains form a natural barrier between which two countries along the Pyrenees?", options: ["UK and France", "France and Spain", "Italy and Austria", "Germany and Poland"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_p10", topicId: 7, prompt: "At what height is Mount Everest?", options: ["6,194 m", "7,590 m", "8,849 m", "9,200 m"], correctIndex: 2),
        ],

        // Topic 8: Rivers & Lakes
        8: [
            MathExamQuestion(id: "geo_8_p1", topicId: 8, prompt: "Which is the longest river in the world?", options: ["Amazon", "Yangtze", "Nile", "Mississippi"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p2", topicId: 8, prompt: "The Amazon River is located in which continent?", options: ["Africa", "Asia", "South America", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p3", topicId: 8, prompt: "Which is the largest freshwater lake in the world by surface area?", options: ["Caspian Sea", "Lake Victoria", "Lake Superior", "Lake Baikal"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p4", topicId: 8, prompt: "The Nile River flows into which sea?", options: ["Red Sea", "Black Sea", "Mediterranean Sea", "Arabian Sea"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p5", topicId: 8, prompt: "Where does a river begin?", options: ["At its mouth", "At its source", "In the ocean", "At a delta"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_p6", topicId: 8, prompt: "Lake Baikal in Russia is the world's deepest lake. Approximately how deep is it?", options: ["500 m", "1,000 m", "1,642 m", "2,500 m"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p7", topicId: 8, prompt: "Which river flows through Egypt?", options: ["Congo", "Niger", "Nile", "Zambezi"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p8", topicId: 8, prompt: "What is a delta?", options: ["The source of a river", "A type of waterfall", "A fan-shaped landform where a river meets the sea", "An underground river"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p9", topicId: 8, prompt: "The Yangtze River is the longest river in which country?", options: ["India", "Russia", "China", "Japan"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_p10", topicId: 8, prompt: "Which African lake is the largest by area?", options: ["Lake Malawi", "Lake Tanganyika", "Lake Victoria", "Lake Chad"], correctIndex: 2),
        ],

        // Topic 9: Europe
        9: [
            MathExamQuestion(id: "geo_9_p1", topicId: 9, prompt: "What is the capital of Germany?", options: ["Munich", "Hamburg", "Frankfurt", "Berlin"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_p2", topicId: 9, prompt: "What is the capital of Spain?", options: ["Barcelona", "Seville", "Valencia", "Madrid"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_p3", topicId: 9, prompt: "Which European country has the most land area?", options: ["France", "Ukraine", "Spain", "Russia"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_p4", topicId: 9, prompt: "What is the capital of Italy?", options: ["Milan", "Venice", "Rome", "Naples"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_p5", topicId: 9, prompt: "Which sea lies between Europe and Africa?", options: ["North Sea", "Baltic Sea", "Mediterranean Sea", "Black Sea"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_p6", topicId: 9, prompt: "What is the capital of Greece?", options: ["Thessaloniki", "Athens", "Crete", "Corfu"], correctIndex: 1),
            MathExamQuestion(id: "geo_9_p7", topicId: 9, prompt: "Which river is the longest in Europe?", options: ["Rhine", "Danube", "Volga", "Seine"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_p8", topicId: 9, prompt: "The Eiffel Tower is in which city?", options: ["Rome", "Madrid", "Berlin", "Paris"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_p9", topicId: 9, prompt: "Which country uses the Swiss franc as its currency?", options: ["Austria", "Switzerland", "Sweden", "Slovakia"], correctIndex: 1),
            MathExamQuestion(id: "geo_9_p10", topicId: 9, prompt: "What is the capital of the Netherlands?", options: ["Rotterdam", "The Hague", "Amsterdam", "Utrecht"], correctIndex: 2),
        ],

        // Topic 10: Asia
        10: [
            MathExamQuestion(id: "geo_10_p1", topicId: 10, prompt: "What is the capital of China?", options: ["Shanghai", "Hong Kong", "Beijing", "Guangzhou"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_p2", topicId: 10, prompt: "Which country has the largest population in the world?", options: ["USA", "India", "China", "Indonesia"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_p3", topicId: 10, prompt: "What is the capital of Japan?", options: ["Osaka", "Kyoto", "Hiroshima", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_10_p4", topicId: 10, prompt: "The Himalayas are located on the border of China and which other country?", options: ["Iran", "Nepal", "Vietnam", "Mongolia"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_p5", topicId: 10, prompt: "Which Asian country is made up of more than 7,000 islands?", options: ["Japan", "Indonesia", "Philippines", "Sri Lanka"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_p6", topicId: 10, prompt: "What is the capital of India?", options: ["Mumbai", "Kolkata", "New Delhi", "Bangalore"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_p7", topicId: 10, prompt: "The Gobi Desert is located in which two countries?", options: ["India and Pakistan", "China and Mongolia", "Russia and China", "Afghanistan and Iran"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_p8", topicId: 10, prompt: "Which country is known as the 'Land of the Rising Sun'?", options: ["China", "South Korea", "Thailand", "Japan"], correctIndex: 3),
            MathExamQuestion(id: "geo_10_p9", topicId: 10, prompt: "What is the capital of South Korea?", options: ["Busan", "Incheon", "Seoul", "Daegu"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_p10", topicId: 10, prompt: "The world's largest plateau is located in which country?", options: ["India", "China", "Russia", "Kazakhstan"], correctIndex: 1),
        ],

        // Topic 11: Africa
        11: [
            MathExamQuestion(id: "geo_11_p1", topicId: 11, prompt: "How many countries are there in Africa?", options: ["44", "49", "54", "60"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p2", topicId: 11, prompt: "Which is the largest desert in the world?", options: ["Gobi", "Kalahari", "Sahara", "Arabian"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p3", topicId: 11, prompt: "What is the capital of Egypt?", options: ["Alexandria", "Cairo", "Luxor", "Aswan"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_p4", topicId: 11, prompt: "Which is the most populous country in Africa?", options: ["Ethiopia", "Egypt", "South Africa", "Nigeria"], correctIndex: 3),
            MathExamQuestion(id: "geo_11_p5", topicId: 11, prompt: "What is the capital of South Africa?", options: ["Cape Town", "Johannesburg", "Pretoria", "Durban"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p6", topicId: 11, prompt: "The Congo River flows through which country?", options: ["Nigeria", "Kenya", "Democratic Republic of Congo", "Tanzania"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p7", topicId: 11, prompt: "Which African country contains the source of the Blue Nile?", options: ["Sudan", "Uganda", "Ethiopia", "Kenya"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p8", topicId: 11, prompt: "What is the capital of Kenya?", options: ["Mombasa", "Nairobi", "Kisumu", "Nakuru"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_p9", topicId: 11, prompt: "Which African country is an island nation off the east coast?", options: ["Senegal", "Cameroon", "Madagascar", "Ghana"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_p10", topicId: 11, prompt: "Which mountain in Africa is the tallest?", options: ["Mount Kenya", "Ras Dashen", "Mount Kilimanjaro", "Toubkal"], correctIndex: 2),
        ],

        // Topic 12: The Americas
        12: [
            MathExamQuestion(id: "geo_12_p1", topicId: 12, prompt: "What is the capital of the USA?", options: ["New York", "Los Angeles", "Washington D.C.", "Chicago"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p2", topicId: 12, prompt: "What is the capital of Canada?", options: ["Toronto", "Vancouver", "Ottawa", "Montreal"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p3", topicId: 12, prompt: "What is the capital of Brazil?", options: ["Rio de Janeiro", "São Paulo", "Brasília", "Manaus"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p4", topicId: 12, prompt: "The Amazon rainforest is primarily in which country?", options: ["Colombia", "Peru", "Brazil", "Venezuela"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p5", topicId: 12, prompt: "Which country is in Central America?", options: ["Colombia", "Venezuela", "Peru", "Guatemala"], correctIndex: 3),
            MathExamQuestion(id: "geo_12_p6", topicId: 12, prompt: "What is the capital of Argentina?", options: ["Montevideo", "Santiago", "Bogotá", "Buenos Aires"], correctIndex: 3),
            MathExamQuestion(id: "geo_12_p7", topicId: 12, prompt: "Which is the longest river in South America?", options: ["Orinoco", "Paraná", "Amazon", "Rio de la Plata"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p8", topicId: 12, prompt: "The Andes Mountains run along the western coast of which continent?", options: ["North America", "South America", "Africa", "Europe"], correctIndex: 1),
            MathExamQuestion(id: "geo_12_p9", topicId: 12, prompt: "Which of the following is a Caribbean island country?", options: ["Uruguay", "Ecuador", "Cuba", "Bolivia"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_p10", topicId: 12, prompt: "The Panama Canal connects which two oceans?", options: ["Atlantic and Indian", "Pacific and Atlantic", "Arctic and Pacific", "Indian and Pacific"], correctIndex: 1),
        ],

        // Topic 13: Latitude & Longitude
        13: [
            MathExamQuestion(id: "geo_13_p1", topicId: 13, prompt: "What is the name of the line at 0° latitude?", options: ["Prime Meridian", "Tropic of Cancer", "Equator", "International Date Line"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_p2", topicId: 13, prompt: "What is the name of the line at 0° longitude?", options: ["Equator", "Prime Meridian", "Tropic of Capricorn", "Arctic Circle"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_p3", topicId: 13, prompt: "Lines of latitude run in which direction?", options: ["North to South", "East to West (horizontal)", "Diagonally", "In circles around the poles"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_p4", topicId: 13, prompt: "The Tropic of Cancer is at approximately:", options: ["0°", "23.5° North", "66.5° North", "90° North"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_p5", topicId: 13, prompt: "What is the maximum latitude on Earth?", options: ["90°", "180°", "360°", "66.5°"], correctIndex: 0),
            MathExamQuestion(id: "geo_13_p6", topicId: 13, prompt: "Which line of longitude runs through Greenwich, England?", options: ["180°", "90° East", "Prime Meridian (0°)", "Tropic of Cancer"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_p7", topicId: 13, prompt: "The Arctic Circle is located at approximately:", options: ["23.5° N", "45° N", "66.5° N", "90° N"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_p8", topicId: 13, prompt: "A location described as 90°S is at which geographic point?", options: ["The North Pole", "The Equator", "The South Pole", "The Prime Meridian"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_p9", topicId: 13, prompt: "How many degrees of longitude are there in total around Earth?", options: ["180°", "270°", "360°", "90°"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_p10", topicId: 13, prompt: "If you travel north from the Equator, your latitude:", options: ["Decreases", "Stays the same", "Increases", "Becomes negative"], correctIndex: 2),
        ],

        // Topic 14: Ecosystems
        14: [
            MathExamQuestion(id: "geo_14_p1", topicId: 14, prompt: "Which biome receives the MOST annual rainfall?", options: ["Tundra", "Temperate forest", "Tropical rainforest", "Grassland"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_p2", topicId: 14, prompt: "What is a biome?", options: ["A single animal's habitat", "A large region with similar climate, plants, and animals", "An ocean ecosystem", "A type of map"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_p3", topicId: 14, prompt: "The tundra biome is characterized by:", options: ["Dense rainforest", "Frozen ground and few trees", "Very hot dry conditions", "Tall grasses and seasonal rain"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_p4", topicId: 14, prompt: "The Amazon rainforest is in which biome?", options: ["Temperate deciduous forest", "Boreal forest", "Tropical rainforest", "Savanna"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_p5", topicId: 14, prompt: "In which biome would you find cacti and camels?", options: ["Tundra", "Desert", "Tropical rainforest", "Temperate forest"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_p6", topicId: 14, prompt: "The African savanna is best described as:", options: ["Dense tropical forest", "Frozen treeless plain", "Grassland with scattered trees and wet/dry seasons", "Hot dry desert"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_p7", topicId: 14, prompt: "Permafrost is found in which biome?", options: ["Desert", "Tropical rainforest", "Temperate forest", "Tundra"], correctIndex: 3),
            MathExamQuestion(id: "geo_14_p8", topicId: 14, prompt: "Coral reefs are part of which type of ecosystem?", options: ["Freshwater", "Marine (ocean)", "Forest", "Grassland"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_p9", topicId: 14, prompt: "Boreal forests (taiga) are mainly found:", options: ["Near the equator", "In deserts", "In northern regions like Canada and Russia", "In Antarctica"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_p10", topicId: 14, prompt: "Which biome covers the most land area on Earth?", options: ["Tropical rainforest", "Desert", "Boreal forest (taiga)", "Grassland"], correctIndex: 2),
        ],

        // Topic 15: Plate Tectonics
        15: [
            MathExamQuestion(id: "geo_15_p1", topicId: 15, prompt: "What are tectonic plates?", options: ["Layers of Earth's atmosphere", "Large pieces of Earth's outer crust", "Types of rocks", "Ocean floor trenches"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_p2", topicId: 15, prompt: "What happens when two tectonic plates collide?", options: ["An ocean forms", "Mountains or volcanoes form", "The plates disappear", "Deserts expand"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_p3", topicId: 15, prompt: "The 'Ring of Fire' is a zone of many volcanoes and earthquakes around which ocean?", options: ["Atlantic", "Indian", "Arctic", "Pacific"], correctIndex: 3),
            MathExamQuestion(id: "geo_15_p4", topicId: 15, prompt: "What is a fault line?", options: ["A crack in Earth's crust where plates meet", "A type of mountain", "An underground river", "A weather pattern"], correctIndex: 0),
            MathExamQuestion(id: "geo_15_p5", topicId: 15, prompt: "What causes earthquakes?", options: ["Heavy rainfall", "Sudden movement of tectonic plates", "Volcanic eruptions only", "Changes in ocean temperature"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_p6", topicId: 15, prompt: "The Richter scale measures:", options: ["Wind speed", "Tsunami height", "Earthquake magnitude", "Volcanic eruption size"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_p7", topicId: 15, prompt: "What is the theory that explains how continents were once joined?", options: ["Evolution", "Pangaea Theory", "Continental Drift", "Plate Convergence"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_p8", topicId: 15, prompt: "The supercontinent that broke apart millions of years ago is called:", options: ["Atlantis", "Laurasia", "Pangaea", "Gondwana"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_p9", topicId: 15, prompt: "A tsunami is usually caused by:", options: ["High winds over the ocean", "Underwater earthquakes or volcanic eruptions", "Tidal changes", "Storms at sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_p10", topicId: 15, prompt: "Which layer of Earth do tectonic plates sit on?", options: ["Inner core", "Outer core", "Mantle", "Crust"], correctIndex: 2),
        ],

        // Topic 16: Economic Geography
        16: [
            MathExamQuestion(id: "geo_16_p1", topicId: 16, prompt: "Which country is the world's largest oil exporter?", options: ["Russia", "USA", "Saudi Arabia", "Iran"], correctIndex: 2),
            MathExamQuestion(id: "geo_16_p2", topicId: 16, prompt: "What is a natural resource?", options: ["Something made in a factory", "A raw material found in nature", "A type of currency", "An imported product"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p3", topicId: 16, prompt: "Brazil is the world's leading exporter of:", options: ["Oil", "Coffee", "Wheat", "Gold"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p4", topicId: 16, prompt: "What is GDP (Gross Domestic Product)?", options: ["Total population of a country", "Total value of goods and services produced by a country", "The size of a country's army", "The number of exports"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p5", topicId: 16, prompt: "Which of these is a renewable resource?", options: ["Coal", "Natural gas", "Oil", "Solar energy"], correctIndex: 3),
            MathExamQuestion(id: "geo_16_p6", topicId: 16, prompt: "What does 'import' mean?", options: ["Selling goods to another country", "Buying goods from another country", "Producing goods locally", "Transporting goods by ship"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p7", topicId: 16, prompt: "The Silk Road was an ancient trade route connecting:", options: ["Africa and America", "Europe and Asia", "North and South America", "Australia and Asia"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p8", topicId: 16, prompt: "Which country produces the most diamonds?", options: ["South Africa", "Australia", "Russia", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_16_p9", topicId: 16, prompt: "What is a Free Trade Agreement?", options: ["An agreement to ban all trade", "An agreement to reduce or eliminate trade barriers between countries", "A system of heavy taxation on imports", "An agreement to share military resources"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_p10", topicId: 16, prompt: "Which of these is considered a non-renewable resource?", options: ["Wind", "Solar", "Coal", "Hydropower"], correctIndex: 2),
        ],

        // Topic 17: Population
        17: [
            MathExamQuestion(id: "geo_17_p1", topicId: 17, prompt: "What is population density?", options: ["The total number of people in the world", "The number of people per unit area of land", "How quickly a population grows", "The age distribution of a population"], correctIndex: 1),
            MathExamQuestion(id: "geo_17_p2", topicId: 17, prompt: "Which continent has the highest total population?", options: ["Europe", "Africa", "North America", "Asia"], correctIndex: 3),
            MathExamQuestion(id: "geo_17_p3", topicId: 17, prompt: "What is urbanization?", options: ["The growth of rural areas", "The movement of people from rural areas to cities", "Reducing city populations", "Building farms in cities"], correctIndex: 1),
            MathExamQuestion(id: "geo_17_p4", topicId: 17, prompt: "Which city has the largest population in the world?", options: ["New York", "Shanghai", "Mumbai", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_17_p5", topicId: 17, prompt: "What is the birth rate?", options: ["Number of deaths per 1,000 people per year", "Number of births per 1,000 people per year", "Total population growth", "Immigration statistics"], correctIndex: 1),
            MathExamQuestion(id: "geo_17_p6", topicId: 17, prompt: "Areas that are SPARSELY populated include:", options: ["Major cities", "River deltas", "Deserts and polar regions", "Coastal plains"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_p7", topicId: 17, prompt: "What is a push factor for migration?", options: ["Job opportunities in a new place", "Good climate in a destination", "War or famine in the home country", "A new school opening nearby"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_p8", topicId: 17, prompt: "Approximately how many people live on Earth today?", options: ["5 billion", "6 billion", "8 billion", "10 billion"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_p9", topicId: 17, prompt: "Which region has the highest population growth rate?", options: ["Europe", "North America", "Africa", "East Asia"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_p10", topicId: 17, prompt: "What does 'demographic transition' describe?", options: ["People moving between countries", "A country shifting from high birth/death rates to low birth/death rates", "Rapid urban growth", "Climate-driven migration"], correctIndex: 1),
        ],

        // Topic 18: Climate Change
        18: [
            MathExamQuestion(id: "geo_18_p1", topicId: 18, prompt: "What gas is most associated with the greenhouse effect?", options: ["Oxygen", "Nitrogen", "Carbon dioxide (CO₂)", "Helium"], correctIndex: 2),
            MathExamQuestion(id: "geo_18_p2", topicId: 18, prompt: "What is the greenhouse effect?", options: ["Growing plants in glass buildings", "Heat being trapped in Earth's atmosphere by gases", "The cooling of Earth's surface", "Wind patterns around the planet"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p3", topicId: 18, prompt: "Rising sea levels are mainly caused by:", options: ["More rain falling into the sea", "Melting ice caps and glaciers", "Earthquakes on the ocean floor", "Increased shipping traffic"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p4", topicId: 18, prompt: "The Paris Agreement (2015) aims to:", options: ["Limit global warming to 1.5–2°C above pre-industrial levels", "Ban all fossil fuel use by 2030", "Stop all deforestation immediately", "Reduce ocean plastic by 50%"], correctIndex: 0),
            MathExamQuestion(id: "geo_18_p5", topicId: 18, prompt: "Which human activity is the leading cause of current climate change?", options: ["Farming", "Burning fossil fuels", "Tourism", "Mining gold"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p6", topicId: 18, prompt: "Deforestation contributes to climate change because:", options: ["Trees produce CO₂", "Fewer trees means less CO₂ is absorbed from the atmosphere", "Cutting trees cools the ground", "Forests block wind"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p7", topicId: 18, prompt: "Which low-lying nation is most threatened by rising sea levels?", options: ["Nepal", "Switzerland", "Maldives", "Bolivia"], correctIndex: 2),
            MathExamQuestion(id: "geo_18_p8", topicId: 18, prompt: "El Niño is a climate pattern affecting:", options: ["European winters", "Pacific Ocean temperatures and global weather", "African monsoons only", "Arctic ice formation"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p9", topicId: 18, prompt: "What is a carbon footprint?", options: ["Footprints left in coal mines", "The total greenhouse gases produced by an individual or activity", "The amount of land a country uses", "A type of fossil"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_p10", topicId: 18, prompt: "Which renewable energy source uses moving water to generate electricity?", options: ["Solar power", "Wind power", "Hydroelectric power", "Geothermal power"], correctIndex: 2),
        ],

        // Topic 19: Geopolitics
        19: [
            MathExamQuestion(id: "geo_19_p1", topicId: 19, prompt: "How many member states does the United Nations have?", options: ["150", "175", "193", "210"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_p2", topicId: 19, prompt: "What is a landlocked country?", options: ["A country with no mountains", "A country completely surrounded by land with no sea access", "A country with a very large coast", "An island nation"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_p3", topicId: 19, prompt: "The Strait of Hormuz is a critical shipping lane for which resource?", options: ["Gold", "Wheat", "Oil", "Diamonds"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_p4", topicId: 19, prompt: "Which international body deals with world trade rules?", options: ["NATO", "UN", "WTO", "WHO"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_p5", topicId: 19, prompt: "NATO is a:", options: ["Trade organization", "Environmental treaty", "Military alliance", "Economic union"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_p6", topicId: 19, prompt: "Which is the world's largest country by area?", options: ["Canada", "USA", "China", "Russia"], correctIndex: 3),
            MathExamQuestion(id: "geo_19_p7", topicId: 19, prompt: "What is a buffer state?", options: ["A country with a large army", "A small country lying between two larger, often rival, nations", "A country with no government", "A neutral trade zone"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_p8", topicId: 19, prompt: "The Suez Canal connects which two bodies of water?", options: ["Red Sea and Indian Ocean", "Mediterranean Sea and Red Sea", "Black Sea and Caspian Sea", "Atlantic and Pacific Oceans"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_p9", topicId: 19, prompt: "Which continent has no permanent human residents and is governed by international treaty?", options: ["Arctic", "Australia", "Antarctica", "Greenland"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_p10", topicId: 19, prompt: "What is soft power?", options: ["Military force used quietly", "Influencing other countries through culture, values, and diplomacy", "Economic sanctions", "Nuclear deterrence"], correctIndex: 1),
        ],

        // Topic 20: Advanced World Geography
        20: [
            MathExamQuestion(id: "geo_20_p1", topicId: 20, prompt: "How many time zones does Earth have?", options: ["12", "18", "24", "30"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_p2", topicId: 20, prompt: "What does GMT/UTC stand for?", options: ["Global Map Time / Universal Time Coordinates", "Greenwich Mean Time / Coordinated Universal Time", "General Meridian Time / United Time Clock", "Global Military Time / Universal Territory Code"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_p3", topicId: 20, prompt: "The Mercator map projection is criticized because it:", options: ["Is too small to read", "Shows no oceans", "Distorts the size of landmasses near the poles", "Cannot show country borders"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_p4", topicId: 20, prompt: "Which organization provides the HDI (Human Development Index)?", options: ["World Bank", "UNDP (UN Development Programme)", "WHO", "WTO"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_p5", topicId: 20, prompt: "What does 'BRICS' stand for?", options: ["Brazil, Russia, India, China, South Africa", "Belgium, Romania, Italy, Croatia, Spain", "Brazil, Romania, India, China, Sudan", "Britain, Russia, Indonesia, China, Singapore"], correctIndex: 0),
            MathExamQuestion(id: "geo_20_p6", topicId: 20, prompt: "The International Date Line is located approximately at:", options: ["0° longitude", "90° East", "180° longitude", "90° West"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_p7", topicId: 20, prompt: "Which body of water lies between Asia and North America?", options: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Bering Strait / Pacific"], correctIndex: 3),
            MathExamQuestion(id: "geo_20_p8", topicId: 20, prompt: "What is the Gini coefficient used to measure?", options: ["A country's military strength", "Income inequality within a country", "Carbon emissions per capita", "Agricultural output"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_p9", topicId: 20, prompt: "Which country has the most time zones?", options: ["Russia", "USA", "China", "France"], correctIndex: 3),
            MathExamQuestion(id: "geo_20_p10", topicId: 20, prompt: "The 'Global South' generally refers to:", options: ["Antarctica and southern oceans", "Countries in the Southern Hemisphere only", "Developing nations, mostly in Asia, Africa, and Latin America", "Countries below the Equator"], correctIndex: 2),
        ],

        // Topic 21: Natural Disasters
        21: [
            MathExamQuestion(id: "geo_21_p1", topicId: 21, prompt: "What is an earthquake?", options: ["A large ocean wave", "A sudden shaking of the ground caused by tectonic plate movement", "A rotating column of air", "A volcanic gas cloud"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_p2", topicId: 21, prompt: "A tsunami is most often caused by:", options: ["Heavy rainfall", "Strong winds at sea", "An underwater earthquake or volcanic eruption", "A tornado"], correctIndex: 2),
            MathExamQuestion(id: "geo_21_p3", topicId: 21, prompt: "Which instrument measures the strength of an earthquake?", options: ["Barometer", "Richter scale / seismograph", "Anemometer", "Thermometer"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_p4", topicId: 21, prompt: "Hurricanes form over:", options: ["Cold mountain regions", "Warm tropical ocean water", "Desert areas", "Polar ice caps"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_p5", topicId: 21, prompt: "What is lava?", options: ["Ash from a volcano", "Molten rock that has erupted onto Earth's surface", "A type of earthquake wave", "Underground water heated by rock"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_p6", topicId: 21, prompt: "Tornadoes are most common in which country?", options: ["Australia", "Japan", "USA", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_21_p7", topicId: 21, prompt: "Which natural disaster involves rivers or land being submerged under water?", options: ["Earthquake", "Tornado", "Drought", "Flood"], correctIndex: 3),
            MathExamQuestion(id: "geo_21_p8", topicId: 21, prompt: "The 'Ring of Fire' is a zone known for many:", options: ["Tornadoes and floods", "Earthquakes and volcanoes", "Droughts and heatwaves", "Blizzards and ice storms"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_p9", topicId: 21, prompt: "What does the Saffir-Simpson scale measure?", options: ["Earthquake magnitude", "Tsunami wave height", "Hurricane intensity", "Tornado wind speed"], correctIndex: 2),
            MathExamQuestion(id: "geo_21_p10", topicId: 21, prompt: "Which of these is a volcanic hazard that moves very fast and is extremely hot?", options: ["Flood surge", "Pyroclastic flow", "Storm surge", "Lahar"], correctIndex: 1),
        ],

        // Topic 22: Deserts of the World
        22: [
            MathExamQuestion(id: "geo_22_p1", topicId: 22, prompt: "How much annual rainfall does a desert typically receive?", options: ["Less than 25 mm", "Less than 250 mm", "Less than 500 mm", "Less than 1,000 mm"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_p2", topicId: 22, prompt: "Which is the largest hot desert in the world?", options: ["Arabian Desert", "Gobi Desert", "Sahara Desert", "Australian Desert"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_p3", topicId: 22, prompt: "The Gobi Desert is located in which two countries?", options: ["India and Pakistan", "China and Mongolia", "Russia and China", "Kazakhstan and Uzbekistan"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_p4", topicId: 22, prompt: "The Atacama Desert, one of the driest places on Earth, is in:", options: ["Africa", "Australia", "South America", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_p5", topicId: 22, prompt: "What is the world's largest desert overall (including cold deserts)?", options: ["Sahara", "Gobi", "Arabian", "Antarctica"], correctIndex: 3),
            MathExamQuestion(id: "geo_22_p6", topicId: 22, prompt: "The Namib Desert is located along the coast of which continent?", options: ["Asia", "South America", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_22_p7", topicId: 22, prompt: "Which plant is well adapted to survive in hot deserts?", options: ["Pine tree", "Oak tree", "Cactus", "Fern"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_p8", topicId: 22, prompt: "What is an oasis?", options: ["A desert storm", "A fertile area with water in a desert", "A sand dune", "A desert animal"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_p9", topicId: 22, prompt: "The Arabian Desert is mainly located in:", options: ["East Africa", "Central Asia", "The Middle East", "South Asia"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_p10", topicId: 22, prompt: "What is desertification?", options: ["The creation of new deserts by natural forces only", "The process by which fertile land becomes desert, often due to human activity", "A sand storm in a desert", "The study of desert animals"], correctIndex: 1),
        ],

        // Topic 23: Middle East
        23: [
            MathExamQuestion(id: "geo_23_p1", topicId: 23, prompt: "What is the capital of Saudi Arabia?", options: ["Mecca", "Jeddah", "Riyadh", "Medina"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_p2", topicId: 23, prompt: "Which is the dominant religion in the Middle East?", options: ["Christianity", "Buddhism", "Hinduism", "Islam"], correctIndex: 3),
            MathExamQuestion(id: "geo_23_p3", topicId: 23, prompt: "The Middle East is a major global supplier of which resource?", options: ["Diamonds", "Timber", "Oil and natural gas", "Wheat"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_p4", topicId: 23, prompt: "What is the capital of Iran?", options: ["Isfahan", "Shiraz", "Mashhad", "Tehran"], correctIndex: 3),
            MathExamQuestion(id: "geo_23_p5", topicId: 23, prompt: "The city of Jerusalem is considered holy by how many major religions?", options: ["One", "Two", "Three", "Four"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_p6", topicId: 23, prompt: "Which river flows through Iraq and is associated with ancient Mesopotamia?", options: ["Nile", "Euphrates", "Jordan", "Indus"], correctIndex: 1),
            MathExamQuestion(id: "geo_23_p7", topicId: 23, prompt: "What is the capital of Turkey?", options: ["Istanbul", "Izmir", "Ankara", "Bursa"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_p8", topicId: 23, prompt: "Which body of water separates the Arabian Peninsula from Africa?", options: ["Persian Gulf", "Red Sea", "Caspian Sea", "Mediterranean Sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_23_p9", topicId: 23, prompt: "The UAE (United Arab Emirates) capital is:", options: ["Dubai", "Sharjah", "Abu Dhabi", "Doha"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_p10", topicId: 23, prompt: "OPEC, the oil-producing nations organisation, was largely founded by Middle Eastern countries. What does OPEC stand for?", options: ["Organisation of Petroleum Exporting Countries", "Oil Producing and Exporting Consortium", "Organisation of Pacific Energy Countries", "Oil and Petroleum Export Commission"], correctIndex: 0),
        ],

        // Topic 24: Southeast Asia
        24: [
            MathExamQuestion(id: "geo_24_p1", topicId: 24, prompt: "What is the capital of Vietnam?", options: ["Ho Chi Minh City", "Da Nang", "Hanoi", "Hue"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p2", topicId: 24, prompt: "Which Southeast Asian country has the largest population?", options: ["Philippines", "Vietnam", "Thailand", "Indonesia"], correctIndex: 3),
            MathExamQuestion(id: "geo_24_p3", topicId: 24, prompt: "What is the capital of Thailand?", options: ["Chiang Mai", "Phuket", "Bangkok", "Pattaya"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p4", topicId: 24, prompt: "The island of Borneo is shared by which countries?", options: ["Thailand, Vietnam, Cambodia", "Malaysia, Brunei, Indonesia", "Philippines, Indonesia, Papua New Guinea", "Singapore, Malaysia, Thailand"], correctIndex: 1),
            MathExamQuestion(id: "geo_24_p5", topicId: 24, prompt: "What is the capital of the Philippines?", options: ["Cebu", "Davao", "Manila", "Quezon City"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p6", topicId: 24, prompt: "Singapore is known as a:", options: ["Large agricultural nation", "Landlocked mountain country", "Global financial centre and city-state", "Major oil exporter"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p7", topicId: 24, prompt: "The Mekong River flows through several Southeast Asian countries. Which of these does it NOT flow through?", options: ["Vietnam", "Cambodia", "Philippines", "Laos"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p8", topicId: 24, prompt: "What is the capital of Cambodia?", options: ["Siem Reap", "Phnom Penh", "Battambang", "Kampot"], correctIndex: 1),
            MathExamQuestion(id: "geo_24_p9", topicId: 24, prompt: "The ancient temple complex Angkor Wat is located in:", options: ["Thailand", "Vietnam", "Cambodia", "Myanmar"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_p10", topicId: 24, prompt: "What is the capital of Indonesia?", options: ["Bali", "Surabaya", "Bandung", "Jakarta"], correctIndex: 3),
        ],

        // Topic 25: Oceania & Pacific
        25: [
            MathExamQuestion(id: "geo_25_p1", topicId: 25, prompt: "What is the capital of New Zealand?", options: ["Auckland", "Christchurch", "Wellington", "Hamilton"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_p2", topicId: 25, prompt: "Papua New Guinea is located on the island of:", options: ["Borneo", "New Guinea", "Sumatra", "Java"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_p3", topicId: 25, prompt: "Which Pacific island nation's capital is Suva?", options: ["Samoa", "Tonga", "Fiji", "Vanuatu"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_p4", topicId: 25, prompt: "New Zealand's indigenous people are called:", options: ["Aborigines", "Maori", "Polynesian", "Melanesian"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_p5", topicId: 25, prompt: "Which ocean surrounds most Pacific island nations?", options: ["Atlantic", "Indian", "Pacific", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_p6", topicId: 25, prompt: "Which of these is a serious threat to Pacific island nations?", options: ["Overpopulation", "Rising sea levels due to climate change", "Extreme cold temperatures", "Lack of sunshine"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_p7", topicId: 25, prompt: "The capital of Samoa is:", options: ["Pago Pago", "Nuku'alofa", "Apia", "Honiara"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_p8", topicId: 25, prompt: "What is the capital of Papua New Guinea?", options: ["Lae", "Madang", "Port Moresby", "Wewak"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_p9", topicId: 25, prompt: "New Zealand consists of two main islands. What are they called?", options: ["East Island and West Island", "North Island and South Island", "Upper Island and Lower Island", "Greater and Lesser Islands"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_p10", topicId: 25, prompt: "Australia's Indigenous people are known as:", options: ["Maori", "Melanesian", "Polynesian", "Aboriginal Australians"], correctIndex: 3),
        ],

        // Topic 26: Urban Geography
        26: [
            MathExamQuestion(id: "geo_26_p1", topicId: 26, prompt: "What is a megacity?", options: ["Any city with a railway", "A city with a population of 10 million or more", "A city that covers a large geographic area", "A city with tall skyscrapers"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_p2", topicId: 26, prompt: "Urbanisation means:", options: ["The decline of city populations", "More people moving to live in cities", "Building new roads in rural areas", "Farming in urban areas"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_p3", topicId: 26, prompt: "Which of the following is a push factor that drives people to move to cities?", options: ["Better hospitals in the city", "Lack of jobs in rural areas", "Good entertainment in cities", "Better climate in cities"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_p4", topicId: 26, prompt: "What are shanty towns (also called slums or informal settlements)?", options: ["Planned housing estates built by the government", "Areas of poor-quality self-built housing often without clean water or sanitation", "Expensive high-rise apartment buildings", "Tourist resorts on city outskirts"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_p5", topicId: 26, prompt: "Which city is the most populous in the world?", options: ["New York", "Mumbai", "Shanghai", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_26_p6", topicId: 26, prompt: "A pull factor for moving to a city might be:", options: ["War in the home area", "Crop failure at home", "Better job opportunities in the city", "Flooding of rural land"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_p7", topicId: 26, prompt: "What is the CBD (Central Business District)?", options: ["A housing area on the city outskirts", "The industrial zone of a city", "The commercial and business heart of a city", "A suburban shopping area"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_p8", topicId: 26, prompt: "Which continent currently has the fastest rate of urbanisation?", options: ["Europe", "North America", "Africa", "Australia"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_p9", topicId: 26, prompt: "A conurbation is:", options: ["A type of shanty town", "A large built-up area formed when cities grow and merge together", "A planned garden city", "A historical city centre"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_p10", topicId: 26, prompt: "Gentrification in a city means:", options: ["Building factories in residential areas", "The decline of a city centre", "Wealthier people moving into and renovating a poorer urban area", "Moving residents out of a city"], correctIndex: 2),
        ],

        // Topic 27: Agriculture & Food
        27: [
            MathExamQuestion(id: "geo_27_p1", topicId: 27, prompt: "What is subsistence farming?", options: ["Large-scale farming for export", "Farming that produces just enough food for the farmer's family", "Farming using modern machinery", "Farming in greenhouses"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_p2", topicId: 27, prompt: "Which type of farming involves growing crops for sale on a large scale?", options: ["Subsistence farming", "Pastoral farming", "Commercial farming", "Organic farming"], correctIndex: 2),
            MathExamQuestion(id: "geo_27_p3", topicId: 27, prompt: "The Green Revolution of the 1960s–70s helped increase food production mainly through:", options: ["Reducing population growth", "New high-yield crop varieties and fertilisers", "Importing food from wealthy countries", "Converting deserts into farmland"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_p4", topicId: 27, prompt: "Food security means:", options: ["Having a locked food cupboard", "All people having reliable access to enough nutritious food", "Storing food in case of disaster", "Only wealthy countries having food"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_p5", topicId: 27, prompt: "Which of these is an example of pastoral farming?", options: ["Growing wheat", "Rearing sheep for wool and meat", "Growing rice in paddies", "Planting fruit trees"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_p6", topicId: 27, prompt: "Which continent faces the most severe food insecurity?", options: ["Europe", "North America", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_27_p7", topicId: 27, prompt: "What is irrigation?", options: ["Pest control on farms", "Artificial supply of water to crops", "A method of storing food", "Crop rotation technique"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_p8", topicId: 27, prompt: "Rice is a staple food crop mostly grown in which climate?", options: ["Desert", "Polar", "Tropical monsoon / humid", "Mediterranean"], correctIndex: 2),
            MathExamQuestion(id: "geo_27_p9", topicId: 27, prompt: "Which country is the world's largest producer of wheat?", options: ["USA", "Brazil", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_27_p10", topicId: 27, prompt: "Monoculture in farming means:", options: ["Growing many different crops on the same land", "Growing a single crop over a large area", "Mixing crops and livestock on the same farm", "Growing food without chemicals"], correctIndex: 1),
        ],

        // Topic 28: Energy Geography
        28: [
            MathExamQuestion(id: "geo_28_p1", topicId: 28, prompt: "Which of these is a fossil fuel?", options: ["Solar energy", "Wind energy", "Natural gas", "Hydroelectric power"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_p2", topicId: 28, prompt: "What does OPEC stand for?", options: ["Organisation of Petroleum Exporting Countries", "Oil Producing and Exporting Coalition", "Organisation of Pacific Energy Countries", "Oil and Power Economic Commission"], correctIndex: 0),
            MathExamQuestion(id: "geo_28_p3", topicId: 28, prompt: "Which energy source uses the heat from inside the Earth?", options: ["Solar", "Wind", "Geothermal", "Tidal"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_p4", topicId: 28, prompt: "Energy security means:", options: ["Locking power stations", "A country's ability to reliably access affordable energy", "Using only renewable energy", "Exporting surplus energy"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_p5", topicId: 28, prompt: "Which country produces the most solar energy in the world?", options: ["Germany", "USA", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_p6", topicId: 28, prompt: "Fossil fuels are non-renewable because:", options: ["They are too expensive to use again", "They take millions of years to form and are used faster than they can be replaced", "They are found in only one country", "They produce no energy"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_p7", topicId: 28, prompt: "Which of these is a renewable energy source?", options: ["Coal", "Oil", "Natural gas", "Wind power"], correctIndex: 3),
            MathExamQuestion(id: "geo_28_p8", topicId: 28, prompt: "The Middle East region is particularly important in global energy because:", options: ["It has the most wind farms", "It holds a large proportion of the world's oil reserves", "It generates the most solar energy", "It exports the most coal"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_p9", topicId: 28, prompt: "Hydroelectric power is generated by:", options: ["Burning water", "The movement of water through turbines", "Heating water with solar panels", "Wind pushing water"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_p10", topicId: 28, prompt: "Which greenhouse gas is most associated with burning fossil fuels?", options: ["Oxygen", "Nitrogen", "Carbon dioxide (CO₂)", "Hydrogen"], correctIndex: 2),
        ],

        // Topic 29: Trade Routes & Transport
        29: [
            MathExamQuestion(id: "geo_29_p1", topicId: 29, prompt: "The ancient Silk Road connected which two major regions?", options: ["Africa and America", "Europe and Asia", "North and South America", "Australia and Asia"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_p2", topicId: 29, prompt: "The Suez Canal connects the Mediterranean Sea with which body of water?", options: ["Black Sea", "Caspian Sea", "Red Sea", "Persian Gulf"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_p3", topicId: 29, prompt: "The Panama Canal was built to allow ships to pass between which two oceans?", options: ["Atlantic and Indian", "Pacific and Arctic", "Atlantic and Pacific", "Indian and Pacific"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_p4", topicId: 29, prompt: "The Strait of Malacca is one of the world's busiest shipping lanes. It lies between:", options: ["Europe and Africa", "Malaysia and Indonesia", "Japan and South Korea", "India and Sri Lanka"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_p5", topicId: 29, prompt: "What percentage of world trade travels by sea?", options: ["About 40%", "About 60%", "About 80%", "About 90%"], correctIndex: 3),
            MathExamQuestion(id: "geo_29_p6", topicId: 29, prompt: "Which organisation oversees rules for international trade today?", options: ["UN", "NATO", "WTO", "IMF"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_p7", topicId: 29, prompt: "The Strait of Hormuz is important because it controls access to oil from:", options: ["The North Sea", "The Persian Gulf", "The Gulf of Mexico", "The Caspian Sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_p8", topicId: 29, prompt: "What is a container ship used for?", options: ["Transporting passengers", "Carrying large standardised shipping containers of goods", "Drilling for oil at sea", "Laying undersea cables"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_p9", topicId: 29, prompt: "The new Silk Road (Belt and Road Initiative) is a modern trade project led by:", options: ["USA", "EU", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_p10", topicId: 29, prompt: "Air freight is preferred for goods that are:", options: ["Heavy and bulky", "Cheap and non-perishable", "High-value, time-sensitive, or perishable", "Only destined for nearby countries"], correctIndex: 2),
        ],

        // Topic 30: Cultural Geography
        30: [
            MathExamQuestion(id: "geo_30_p1", topicId: 30, prompt: "What is the most widely spoken native language in the world?", options: ["English", "Spanish", "Mandarin Chinese", "Hindi"], correctIndex: 2),
            MathExamQuestion(id: "geo_30_p2", topicId: 30, prompt: "What is the world's largest religion by number of followers?", options: ["Islam", "Christianity", "Hinduism", "Buddhism"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_p3", topicId: 30, prompt: "Globalisation refers to:", options: ["Countries becoming more isolated", "The increasing interconnection of the world's economies, cultures, and populations", "The spread of a single language globally", "Only the growth of international trade"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_p4", topicId: 30, prompt: "Cultural diffusion is:", options: ["The extinction of a culture", "The spread of cultural elements (music, food, language) from one place to another", "Government control of culture", "Building museums for old cultures"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_p5", topicId: 30, prompt: "Which of these is an example of cultural geography?", options: ["The height of Mount Everest", "Why Spanish is spoken across Latin America", "The depth of the Pacific Ocean", "The location of the equator"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_p6", topicId: 30, prompt: "The lingua franca most used in international business and diplomacy is:", options: ["French", "Spanish", "Arabic", "English"], correctIndex: 3),
            MathExamQuestion(id: "geo_30_p7", topicId: 30, prompt: "Which of these is a risk associated with globalisation for local cultures?", options: ["Improved communication", "Increased trade", "Loss of traditional languages and customs", "Access to better technology"], correctIndex: 2),
            MathExamQuestion(id: "geo_30_p8", topicId: 30, prompt: "A cultural region is an area where:", options: ["All people speak the same language", "People share similar cultural traits such as language, religion, or customs", "Government and culture are the same", "People have identical economic activities"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_p9", topicId: 30, prompt: "Which continent has the greatest linguistic diversity (most different languages)?", options: ["Asia", "Europe", "North America", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_30_p10", topicId: 30, prompt: "UNESCO works to protect 'World Heritage Sites'. What type of sites do these include?", options: ["Only ancient ruins", "Sites of outstanding natural or cultural value to humanity", "Only natural landscapes", "Military monuments only"], correctIndex: 1),
        ],

        31: [
        MathExamQuestion(id: "geo_31_p1", topicId: 31, prompt: "Why can't a flat map perfectly represent the Earth?", options: ["Earth is too large to draw", "Earth is a sphere and maps are flat, causing distortion", "Cartographers make mistakes", "Maps only show land, not water"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_p2", topicId: 31, prompt: "Which map projection is most commonly used for navigation?", options: ["Peters projection", "Robinson projection", "Mercator projection", "Winkel Tripel projection"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_p3", topicId: 31, prompt: "On a Mercator map, which landmass appears much larger than it really is?", options: ["Australia", "Brazil", "Greenland", "India"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_p4", topicId: 31, prompt: "What does the Peters projection try to show accurately?", options: ["Shape of countries", "True land area of countries", "Sea routes", "Mountain heights"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_p5", topicId: 31, prompt: "What is a map projection?", options: ["A method of printing maps in 3D", "A way to transfer Earth's curved surface onto a flat map", "A type of compass", "A scale used to measure distance"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_p6", topicId: 31, prompt: "Which of the following is NOT a type of map projection?", options: ["Mercator", "Peters", "Robinson", "Satellite"], correctIndex: 3),
        MathExamQuestion(id: "geo_31_p7", topicId: 31, prompt: "What feature is most accurately preserved in the Mercator projection?", options: ["Area", "Distance", "Shape and direction", "Population"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_p8", topicId: 31, prompt: "Which shape best represents the true form of Earth?", options: ["A flat rectangle", "A cylinder", "A sphere (oblate spheroid)", "A cube"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_p9", topicId: 31, prompt: "A map projection that shows correct area but distorts shape is called:", options: ["Conformal", "Equal-area", "Azimuthal", "Topographic"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_p10", topicId: 31, prompt: "Why might a teacher choose the Peters projection over the Mercator?", options: ["It is older and more traditional", "It shows country shapes more clearly", "It represents the relative size of countries more fairly", "It is easier to print"], correctIndex: 2),
    ],

    32: [
        MathExamQuestion(id: "geo_32_p1", topicId: 32, prompt: "What is a thematic map?", options: ["A map showing roads and cities", "A map focused on one specific topic or theme", "A map of the ocean floor", "A physical map showing mountains"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_p2", topicId: 32, prompt: "A choropleth map uses what to show differences between areas?", options: ["Symbols and icons", "Lines and arrows", "Shading or colour intensity", "Photographs"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_p3", topicId: 32, prompt: "Which of the following is an example of a thematic map?", options: ["A road atlas", "A population density map", "A globe", "A transit route diagram"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_p4", topicId: 32, prompt: "On a population density choropleth map, a darker shade usually means:", options: ["Fewer people per km²", "More people per km²", "Higher altitude", "Less rainfall"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_p5", topicId: 32, prompt: "A climate map would most likely show:", options: ["Where roads are located", "Where supermarkets are", "Different climate zones across a region", "The height of mountains"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_p6", topicId: 32, prompt: "What type of map would you use to find oil and gas deposits?", options: ["Political map", "Street map", "Natural resources map", "Relief map"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_p7", topicId: 32, prompt: "Which part of a thematic map tells you what the colours or symbols mean?", options: ["The title", "The scale", "The legend (key)", "The north arrow"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_p8", topicId: 32, prompt: "A dot distribution map uses dots where each dot represents:", options: ["A city name", "A fixed quantity of something (e.g. 1,000 people)", "One river", "One country"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_p9", topicId: 32, prompt: "Which type of map would best show areas most at risk from flooding?", options: ["Political map", "Hazard/risk thematic map", "Road map", "Star chart"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_p10", topicId: 32, prompt: "What is the main purpose of a thematic map?", options: ["To replace GPS navigation", "To show how one piece of geographic data is distributed", "To list country capitals", "To track weather in real time"], correctIndex: 1),
    ],

    33: [
        MathExamQuestion(id: "geo_33_p1", topicId: 33, prompt: "What does a map scale tell you?", options: ["The age of the map", "How to use a compass", "The relationship between map distance and real distance", "The names of cities"], correctIndex: 2),
        MathExamQuestion(id: "geo_33_p2", topicId: 33, prompt: "If the scale is 1 cm = 50 km and two cities are 4 cm apart on the map, how far are they in reality?", options: ["50 km", "100 km", "200 km", "400 km"], correctIndex: 2),
        MathExamQuestion(id: "geo_33_p3", topicId: 33, prompt: "Which map shows MORE detail of a small area?", options: ["Small-scale map", "Large-scale map", "Political map", "Climate map"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p4", topicId: 33, prompt: "A scale of 1:100,000 means that 1 cm on the map equals:", options: ["100 m in reality", "1 km in reality", "100 km in reality", "10 m in reality"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p5", topicId: 33, prompt: "Which tool would you use to measure a winding river accurately on a map?", options: ["A protractor", "A string or map measurer", "A thermometer", "A magnifying glass"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p6", topicId: 33, prompt: "What is a bar scale on a map?", options: ["A list of country names", "A visual line divided into units showing real-world distances", "A colour code for elevation", "A grid reference system"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p7", topicId: 33, prompt: "If 2 cm on a map represents 10 km, what is the scale?", options: ["1:5", "1:5,000", "1:500,000", "1:50,000"], correctIndex: 2),
        MathExamQuestion(id: "geo_33_p8", topicId: 33, prompt: "A small-scale map (e.g. a world map) is best for:", options: ["Finding a specific street", "Showing a whole continent or country", "Measuring exact building distances", "Planning a hiking trail"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p9", topicId: 33, prompt: "Why do maps need a scale?", options: ["To make them look professional", "So users can convert map distances to real distances", "To show north and south", "To identify country capitals"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_p10", topicId: 33, prompt: "The scale 1:25,000 is used on detailed hiking maps. What does this mean?", options: ["1 metre on the map = 25,000 metres in reality", "1 km on the map = 25 km in reality", "25,000 people live in the area", "The map is 25,000 years old"], correctIndex: 0),
    ],

    34: [
        MathExamQuestion(id: "geo_34_p1", topicId: 34, prompt: "Who are Indigenous peoples?", options: ["People who live in capital cities", "The original, native inhabitants of a land", "People who have recently immigrated", "Scientists who study geography"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_p2", topicId: 34, prompt: "The Maori are the Indigenous people of which country?", options: ["Australia", "Canada", "New Zealand", "South Africa"], correctIndex: 2),
        MathExamQuestion(id: "geo_34_p3", topicId: 34, prompt: "The Inuit people traditionally live in which region?", options: ["The Amazon rainforest", "The Sahara desert", "The Arctic regions of Canada and Greenland", "The Himalayan mountains"], correctIndex: 2),
        MathExamQuestion(id: "geo_34_p4", topicId: 34, prompt: "What does the term 'traditional lands' mean for Indigenous peoples?", options: ["Land they recently purchased", "Land their ancestors have lived on and cared for for thousands of years", "Farmland used for crops", "Urban areas in modern cities"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_p5", topicId: 34, prompt: "Which of the following is an Indigenous group of Australia?", options: ["Zulu", "Aboriginal Australians", "Navajo", "Cherokee"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_p6", topicId: 34, prompt: "The Navajo Nation is located within which country?", options: ["Mexico", "Brazil", "United States of America", "Canada"], correctIndex: 2),
        MathExamQuestion(id: "geo_34_p7", topicId: 34, prompt: "Why is it important to learn about Indigenous cultures?", options: ["They have no relevance today", "To understand diverse perspectives, histories, and knowledge systems", "Only historians need to know", "It is required for math class"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_p8", topicId: 34, prompt: "Many Indigenous groups have a deep connection to the land because:", options: ["They own all the world's farmland", "Their culture, identity, and survival have been tied to specific territories for generations", "They invented modern agriculture", "Governments gave them large land grants"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_p9", topicId: 34, prompt: "The San people are an Indigenous group from which region?", options: ["South and southern Africa", "South America", "Southeast Asia", "Northern Europe"], correctIndex: 0),
        MathExamQuestion(id: "geo_34_p10", topicId: 34, prompt: "Approximately how many Indigenous languages exist worldwide?", options: ["Around 50", "Around 200", "Over 4,000", "Around 1,000"], correctIndex: 2),
    ],

    35: [
        MathExamQuestion(id: "geo_35_p1", topicId: 35, prompt: "What is migration?", options: ["The movement of animals only", "When people move from one place to another", "Changing your name when you travel", "Studying other cultures"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p2", topicId: 35, prompt: "What is the difference between an emigrant and an immigrant?", options: ["There is no difference", "An emigrant leaves a country; an immigrant arrives in a new country", "An immigrant leaves; an emigrant arrives", "Emigrants move within a country"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p3", topicId: 35, prompt: "Which of the following is a PUSH factor for migration?", options: ["Better job opportunities abroad", "A pleasant climate in a new country", "War and conflict in the home country", "Free education in a new country"], correctIndex: 2),
        MathExamQuestion(id: "geo_35_p4", topicId: 35, prompt: "Which of the following is a PULL factor for migration?", options: ["Drought destroying crops at home", "Political persecution", "Flooding at home", "Higher wages in a new country"], correctIndex: 3),
        MathExamQuestion(id: "geo_35_p5", topicId: 35, prompt: "What is a refugee?", options: ["A person who travels for tourism", "A person who is forced to flee their country due to danger, war, or persecution", "A diplomat working abroad", "A seasonal farm worker"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p6", topicId: 35, prompt: "What does 'diaspora' mean?", options: ["A type of visa", "Communities of people living outside their ancestral homeland", "A migration route across a desert", "A border crossing checkpoint"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p7", topicId: 35, prompt: "Internal migration means:", options: ["Moving between two different countries", "Moving from one region to another within the same country", "Moving due to climate change only", "Moving with a work visa"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p8", topicId: 35, prompt: "Climate change is increasingly causing migration because:", options: ["People want warmer holidays", "Rising seas, droughts, and extreme weather make some areas uninhabitable", "Countries are becoming richer", "Governments are forcing people to move"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_p9", topicId: 35, prompt: "Rural-to-urban migration means people are moving:", options: ["From cities to the countryside", "From one city to another", "From villages and rural areas to cities", "From one continent to another"], correctIndex: 2),
        MathExamQuestion(id: "geo_35_p10", topicId: 35, prompt: "Which organisation provides protection and assistance to refugees worldwide?", options: ["NATO", "UNHCR (UN Refugee Agency)", "WHO", "UNESCO"], correctIndex: 1),
    ],

    36: [
        MathExamQuestion(id: "geo_36_p1", topicId: 36, prompt: "What is urban planning?", options: ["Building skyscrapers only", "Designing and organising how cities develop and function", "Mapping rural farmland", "Setting national tax policies"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p2", topicId: 36, prompt: "What is zoning in urban planning?", options: ["Dividing land into areas with specific permitted uses", "Painting roads different colours", "Setting speed limits in a city", "Building a city wall"], correctIndex: 0),
        MathExamQuestion(id: "geo_36_p3", topicId: 36, prompt: "Which type of zone would a factory most likely be placed in?", options: ["Residential zone", "Green space zone", "Industrial zone", "School zone"], correctIndex: 2),
        MathExamQuestion(id: "geo_36_p4", topicId: 36, prompt: "Why are parks and green spaces important in city planning?", options: ["They increase parking problems", "They provide recreation, mental wellbeing, and environmental benefits", "They are only for dogs", "They make cities harder to navigate"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p5", topicId: 36, prompt: "What is public transport and why is it important in cities?", options: ["Private cars for politicians", "Shared transport systems like buses and trains that reduce congestion and pollution", "Bicycle lanes only", "Highways connecting cities"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p6", topicId: 36, prompt: "Urban sprawl refers to:", options: ["A new type of skyscraper design", "The uncontrolled spread of a city into surrounding rural areas", "City parks expanding outward", "Underground tunnels for transport"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p7", topicId: 36, prompt: "Which is a sign of good urban infrastructure?", options: ["Frequent flooding due to poor drainage", "Reliable electricity, clean water, and functioning roads", "Overpopulated with no green spaces", "Only one road in and out of the city"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p8", topicId: 36, prompt: "A 'mixed-use' area in urban planning means:", options: ["Only residential buildings are allowed", "Residential, commercial, and sometimes industrial uses share the same area", "Factories and hospitals in the same block", "Only tourist attractions are present"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p9", topicId: 36, prompt: "Why is access to public transport important for equity in cities?", options: ["It is faster than walking everywhere", "It allows people without cars to access jobs, schools, and services", "It makes streets look cleaner", "Only wealthy people use public transport"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_p10", topicId: 36, prompt: "What does 'sustainable urban development' aim to do?", options: ["Build as many roads as possible", "Create cities that meet current needs without harming future generations", "Remove all parks to build housing", "Encourage more private car ownership"], correctIndex: 1),
    ],

    37: [
        MathExamQuestion(id: "geo_37_p1", topicId: 37, prompt: "What percentage of Earth's water is freshwater?", options: ["About 71%", "About 50%", "About 3%", "About 10%"], correctIndex: 2),
        MathExamQuestion(id: "geo_37_p2", topicId: 37, prompt: "What is an aquifer?", options: ["A type of ocean current", "An underground layer of rock that holds freshwater", "A river that flows underground", "A man-made water storage tank"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_p3", topicId: 37, prompt: "Most of Earth's freshwater is found:", options: ["In rivers and lakes", "In the atmosphere as clouds", "Frozen in glaciers and polar ice caps", "Underground in aquifers"], correctIndex: 2),
        MathExamQuestion(id: "geo_37_p4", topicId: 37, prompt: "Which river is the world's longest and a vital water resource for North Africa?", options: ["Amazon", "Congo", "Nile", "Mississippi"], correctIndex: 2),
        MathExamQuestion(id: "geo_37_p5", topicId: 37, prompt: "Water scarcity means:", options: ["Too much water causing floods", "Not having enough clean freshwater to meet needs", "Water being too expensive to bottle", "Oceans becoming saltier"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_p6", topicId: 37, prompt: "Why might countries share or conflict over a river?", options: ["Rivers are used for internet cables", "Countries upstream can dam or divert water, reducing flow to countries downstream", "All rivers are owned by the United Nations", "Rivers only flow through one country"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_p7", topicId: 37, prompt: "Which human activity uses the most freshwater globally?", options: ["Industry", "Drinking water", "Agriculture (farming)", "Swimming pools"], correctIndex: 2),
        MathExamQuestion(id: "geo_37_p8", topicId: 37, prompt: "What is desalination?", options: ["Adding salt to freshwater for taste", "Removing salt from seawater to make it drinkable", "A method of irrigation", "Filtering river water through sand"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_p9", topicId: 37, prompt: "Why is groundwater (from aquifers) being depleted in many regions?", options: ["It is being pumped out faster than it is naturally replenished", "Aquifers are shrinking due to earthquakes", "Governments are removing it to create underground cities", "Rainwater no longer reaches underground"], correctIndex: 0),
        MathExamQuestion(id: "geo_37_p10", topicId: 37, prompt: "The Amazon River is significant for water resources because:", options: ["It flows through the Sahara", "It carries about 20% of all river water that flows into the world's oceans", "It is the world's longest river", "It is the most dammed river in the world"], correctIndex: 1),
    ],

    38: [
        MathExamQuestion(id: "geo_38_p1", topicId: 38, prompt: "What is a biodiversity hotspot?", options: ["A place with very high temperatures", "A region with an exceptionally high number of species found nowhere else, under significant threat", "An area with many different types of rocks", "A country with many different languages"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p2", topicId: 38, prompt: "Which rainforest is considered the world's most biodiverse?", options: ["Congo Basin Rainforest", "Daintree Rainforest", "Amazon Rainforest", "Tongass National Forest"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_p3", topicId: 38, prompt: "Approximately what percentage of Madagascar's wildlife is found nowhere else on Earth?", options: ["10%", "50%", "90%", "30%"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_p4", topicId: 38, prompt: "Which animal is most associated with the Borneo rainforest?", options: ["Polar bear", "Orangutan", "Emperor penguin", "African elephant"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p5", topicId: 38, prompt: "What is the main threat to biodiversity hotspots?", options: ["Too much rainfall", "Deforestation, habitat loss, and climate change", "Too many tourists visiting safely", "Animals migrating out of the area"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p6", topicId: 38, prompt: "What does 'endemic species' mean?", options: ["A species that is dangerous to humans", "A species found only in one specific geographic location", "An extinct species", "A species that migrates every year"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p7", topicId: 38, prompt: "Why are coral reefs considered biodiversity hotspots?", options: ["They are very colourful", "They support around 25% of all marine species despite covering less than 1% of the ocean floor", "They are the deepest parts of the ocean", "They are found only in cold water"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p8", topicId: 38, prompt: "Conservation of biodiversity hotspots is important because:", options: ["It generates the most tourism money", "Once species are extinct, they cannot be recovered, and we lose ecological services and potential medicines", "Governments require it by law everywhere", "Only large animals matter for ecosystems"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_p9", topicId: 38, prompt: "Which region is home to lemurs, a group of primates found nowhere else?", options: ["Amazon Basin", "Borneo", "Madagascar", "Southeast Asia"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_p10", topicId: 38, prompt: "The Cape Floristic Region in South Africa is notable for:", options: ["Its very high mountains", "Its extraordinary plant biodiversity  -  one of the richest floras in the world", "Being completely covered in desert", "Having no endemic species"], correctIndex: 1),
    ],

    39: [
        MathExamQuestion(id: "geo_39_p1", topicId: 39, prompt: "What does 'land use' describe?", options: ["The age of the soil", "How humans use land  -  for farming, cities, industry, etc.", "How much land a country owns", "The height of the land above sea level"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p2", topicId: 39, prompt: "What does 'land cover' refer to?", options: ["The laws governing who owns land", "The physical surface of the land  -  grass, forest, water, concrete, etc.", "How land is divided between countries", "The price of land in different regions"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p3", topicId: 39, prompt: "Which of the following is an example of agricultural land use?", options: ["A shopping mall", "A wheat field", "A motorway", "An airport"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p4", topicId: 39, prompt: "Urban land use includes:", options: ["Dense forests and wetlands", "Homes, offices, shops, and roads in cities and towns", "Large areas of wheat and corn", "Mining operations only"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p5", topicId: 39, prompt: "Why is understanding land use important for geography?", options: ["It helps design better websites", "It helps track how humans are changing the environment and plan for the future", "It is only useful for real estate agents", "It determines school catchment areas"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p6", topicId: 39, prompt: "Deforestation changes land cover from:", options: ["Desert to ocean", "Forest to cleared land", "Ocean to land", "City to farmland"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p7", topicId: 39, prompt: "Which technology is commonly used to monitor land use changes from space?", options: ["Sonar imaging", "Satellite remote sensing", "Underwater cameras", "Weather balloons"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p8", topicId: 39, prompt: "Urbanisation causes which land cover change?", options: ["Forests replace deserts", "Natural land is converted to built-up areas", "Farmland becomes ocean", "Ice caps shrink"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p9", topicId: 39, prompt: "What is 'sustainable land use'?", options: ["Using land only for agriculture", "Using land in ways that meet current needs without degrading it for future generations", "Leaving all land completely untouched", "Selling land to the highest bidder"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_p10", topicId: 39, prompt: "Which land cover type acts as a 'carbon sink', absorbing CO2 from the atmosphere?", options: ["Concrete urban surfaces", "Desert sand", "Forests and vegetation", "Tarmac roads"], correctIndex: 2),
    ],

        40: [
        MathExamQuestion(id: "geo_40_p1",  topicId: 40, prompt: "What is environmental justice?", options: ["Equal distribution of environmental benefits and burdens", "Building more national parks", "Cleaning up oceans only", "Reducing carbon from cars"], correctIndex: 0),
        MathExamQuestion(id: "geo_40_p2",  topicId: 40, prompt: "Which group is most often affected by environmental racism?", options: ["Wealthy suburban communities", "Low-income and minority communities", "Rural farming communities", "Coastal fishing communities"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p3",  topicId: 40, prompt: "What is 'environmental racism'?", options: ["Banning non-native species", "Placing polluting industries near minority communities", "Unequal fishing rights", "Climate change affecting only one race"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p4",  topicId: 40, prompt: "Which of these is an example of unfair resource distribution?", options: ["A city recycling programme", "Wealthy areas having cleaner water than poor areas", "A new solar farm", "A nature reserve"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p5",  topicId: 40, prompt: "Environmental justice is linked to which wider issue?", options: ["Weather forecasting", "Social inequality", "Tectonic plate movement", "Tourism management"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p6",  topicId: 40, prompt: "A factory is built near a low-income neighbourhood. This is most closely related to:", options: ["Urban sprawl", "Environmental justice concerns", "Coastal erosion", "Deforestation"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p7",  topicId: 40, prompt: "Which organisation is most likely to campaign for environmental justice?", options: ["An oil company", "A civil rights non-profit", "A luxury hotel chain", "A satellite agency"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p8",  topicId: 40, prompt: "Fair distribution of clean air and water is a goal of:", options: ["Urban planning only", "Environmental justice", "Economic capitalism", "Tourism geography"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_p9",  topicId: 40, prompt: "Which is NOT an environmental justice issue?", options: ["Toxic waste near schools", "Lack of green space in poor areas", "Air pollution near highways in deprived neighbourhoods", "Building a ski resort in a wealthy area"], correctIndex: 3),
        MathExamQuestion(id: "geo_40_p10", topicId: 40, prompt: "Environmental justice argues that the burden of pollution should be:", options: ["Carried only by cities", "Shared fairly across all communities", "Borne by industrial workers", "Managed only by governments"], correctIndex: 1),
    ],

    41: [
        MathExamQuestion(id: "geo_41_p1",  topicId: 41, prompt: "What is a political boundary?", options: ["A type of landform", "A line separating countries or territories", "A river that feeds farmland", "A trade agreement between nations"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p2",  topicId: 41, prompt: "Which of these is a natural boundary between countries?", options: ["A treaty", "A railway line", "A mountain range", "A city wall"], correctIndex: 2),
        MathExamQuestion(id: "geo_41_p3",  topicId: 41, prompt: "A disputed territory is one where:", options: ["Only one country claims it", "Two or more countries claim the same land", "A river runs through it", "It has no human population"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p4",  topicId: 41, prompt: "The region of Kashmir is disputed between which two countries?", options: ["China and Japan", "India and Pakistan", "Russia and Ukraine", "Israel and Egypt"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p5",  topicId: 41, prompt: "What does sovereignty mean?", options: ["A country's military power", "A country's full authority over its own territory", "The right to trade freely", "Control over another country's resources"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p6",  topicId: 41, prompt: "Which event most commonly creates new political boundaries?", options: ["Earthquakes", "Trade deals or peace treaties", "Volcanic eruptions", "Population growth"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p7",  topicId: 41, prompt: "An example of a geometric (straight-line) border is:", options: ["The US-Canada border along latitude 49°N", "The Rhine River border in Europe", "The Himalayan border", "The English Channel"], correctIndex: 0),
        MathExamQuestion(id: "geo_41_p8",  topicId: 41, prompt: "When a country has full control over its own laws and territory, it is called:", options: ["A colony", "A sovereign state", "A disputed zone", "A protectorate"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p9",  topicId: 41, prompt: "Borders drawn by colonial powers in Africa often caused later conflict because:", options: ["They followed rivers too closely", "They ignored existing ethnic and tribal boundaries", "They were too short", "They were all in deserts"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_p10", topicId: 41, prompt: "Which of these best describes a 'buffer state'?", options: ["A country between two rival powers that reduces tension", "A country with no army", "A landlocked country", "A newly formed country"], correctIndex: 0),
    ],

    42: [
        MathExamQuestion(id: "geo_42_p1",  topicId: 42, prompt: "What does tourism geography study?", options: ["Only beach holidays", "Why and where people travel and the impact on places", "How to build airports", "The history of ancient trade routes"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p2",  topicId: 42, prompt: "What is ecotourism?", options: ["Tourism in cities only", "Travel focused on nature with minimal environmental impact", "Adventure sports holidays", "Luxury resort travel"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p3",  topicId: 42, prompt: "Overtourism means:", options: ["Not enough tourists visiting a place", "Too many tourists causing damage to a destination", "Tourism in developing countries only", "Tourism managed by the government"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p4",  topicId: 42, prompt: "Which city is famous for suffering from overtourism?", options: ["Nairobi", "Venice", "Ottawa", "Riyadh"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p5",  topicId: 42, prompt: "Tourism can benefit a country by:", options: ["Increasing pollution only", "Bringing in money and creating jobs", "Reducing population", "Decreasing cultural exchange"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p6",  topicId: 42, prompt: "Which of these is a negative effect of mass tourism?", options: ["More schools built", "Damage to coral reefs and natural habitats", "Cleaner beaches", "Increased local language learning"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p7",  topicId: 42, prompt: "The Galapagos Islands limit visitor numbers to protect their ecosystem. This is an example of:", options: ["Overtourism", "Sustainable tourism management", "Cultural tourism", "Domestic tourism"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p8",  topicId: 42, prompt: "Which continent attracts the most international tourists overall?", options: ["Africa", "Europe", "South America", "Australia"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p9",  topicId: 42, prompt: "Cultural tourism involves:", options: ["Only visiting beaches", "Travelling to experience art, history, and traditions", "Adventure sports", "Shopping trips abroad"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_p10", topicId: 42, prompt: "Why might local people dislike mass tourism in their area?", options: ["It always makes the area poorer", "Rising prices, congestion, and loss of local culture", "Fewer job opportunities", "It only benefits children"], correctIndex: 1),
    ],

    43: [
        MathExamQuestion(id: "geo_43_p1",  topicId: 43, prompt: "What is a supply chain?", options: ["A type of mountain range", "The journey of a product from raw materials to the consumer", "A shipping company", "A list of ingredients"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p2",  topicId: 43, prompt: "Which country assembles the majority of the world's smartphones?", options: ["USA", "Germany", "China", "India"], correctIndex: 2),
        MathExamQuestion(id: "geo_43_p3",  topicId: 43, prompt: "Cobalt, used in phone batteries, is mainly mined in:", options: ["Brazil", "Democratic Republic of Congo", "Australia", "Canada"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p4",  topicId: 43, prompt: "Why do companies use global supply chains?", options: ["To keep everything in one country", "To take advantage of cheaper labour and materials worldwide", "To avoid using technology", "To reduce the number of products made"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p5",  topicId: 43, prompt: "Which of these is the FIRST step in a typical supply chain?", options: ["Retail sale to the customer", "Manufacturing in a factory", "Extraction of raw materials", "Shipping to a warehouse"], correctIndex: 2),
        MathExamQuestion(id: "geo_43_p6",  topicId: 43, prompt: "A disruption to a supply chain (like a pandemic) can cause:", options: ["Cheaper products everywhere", "Shortages and delays of goods globally", "Faster delivery times", "More jobs in factories"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p7",  topicId: 43, prompt: "Container ships are important for global supply chains because:", options: ["They carry passengers", "They transport huge amounts of goods cheaply across oceans", "They are the fastest form of transport", "They carry only food products"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p8",  topicId: 43, prompt: "Which of these best describes 'outsourcing'?", options: ["Hiring workers locally only", "Moving part of a business process to another country", "Selling goods within one country", "Building a factory at home"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p9",  topicId: 43, prompt: "Fair trade products aim to:", options: ["Make supply chains longer", "Ensure producers in developing countries are paid fairly", "Reduce the number of products sold", "Only sell goods made in Europe"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_p10", topicId: 43, prompt: "Which type of transport is typically the slowest but cheapest for moving goods globally?", options: ["Aeroplanes", "Trucks", "Ships", "Trains"], correctIndex: 2),
    ],

    44: [
        MathExamQuestion(id: "geo_44_p1",  topicId: 44, prompt: "What is capitalism?", options: ["The government owns all businesses", "Businesses are privately owned and operate for profit", "All people are paid equally", "The state controls all farms"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p2",  topicId: 44, prompt: "Which country is the best example of a capitalist economy?", options: ["Cuba", "North Korea", "United States", "Vietnam"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_p3",  topicId: 44, prompt: "In a socialist economy:", options: ["Individuals own all businesses", "The government controls major industries and services", "There are no taxes", "Trade is banned"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p4",  topicId: 44, prompt: "A mixed economy combines:", options: ["Capitalism and communism only", "Private and government ownership of businesses", "Farming and industry only", "Local and international trade"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p5",  topicId: 44, prompt: "Which of these countries has a strongly mixed economy with high taxes and welfare services?", options: ["Afghanistan", "Sweden", "Somalia", "Haiti"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p6",  topicId: 44, prompt: "A command economy is one where:", options: ["Consumers decide what is produced", "The government decides what, how, and for whom to produce", "Companies compete freely", "Prices are set by the market"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p7",  topicId: 44, prompt: "Cuba's economy is best described as:", options: ["Capitalist", "Mixed", "Socialist/Communist", "Free market"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_p8",  topicId: 44, prompt: "GDP stands for:", options: ["Global Development Plan", "Gross Domestic Product", "Government Directed Production", "General Distribution Policy"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_p9",  topicId: 44, prompt: "Which economic system relies most on supply and demand?", options: ["Command economy", "Traditional economy", "Free market (capitalist) economy", "Subsistence economy"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_p10", topicId: 44, prompt: "A 'traditional economy' is based on:", options: ["Technology and factories", "Customs, habits, and bartering passed down through generations", "Government five-year plans", "Stock market trading"], correctIndex: 1),
    ],

    45: [
        MathExamQuestion(id: "geo_45_p1",  topicId: 45, prompt: "What is latitude?", options: ["Distance east or west of the Prime Meridian", "Distance north or south of the Equator", "The height above sea level", "The distance between two cities"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p2",  topicId: 45, prompt: "What is longitude?", options: ["Distance north or south of the Equator", "Distance east or west of the Prime Meridian", "The temperature of a location", "The depth of the ocean floor"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p3",  topicId: 45, prompt: "The Equator is at:", options: ["90° North", "0° latitude", "180° longitude", "45° South"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p4",  topicId: 45, prompt: "GPS stands for:", options: ["Ground Positioning Satellite", "Global Positioning System", "General Place Survey", "Geographic Point Sender"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p5",  topicId: 45, prompt: "How many degrees of longitude are there in total around the Earth?", options: ["180°", "270°", "360°", "90°"], correctIndex: 2),
        MathExamQuestion(id: "geo_45_p6",  topicId: 45, prompt: "The Prime Meridian passes through which city?", options: ["Paris", "New York", "Greenwich, London", "Cairo"], correctIndex: 2),
        MathExamQuestion(id: "geo_45_p7",  topicId: 45, prompt: "A grid reference on a map helps you:", options: ["Measure rainfall", "Find an exact location on the map", "Calculate population density", "Identify soil types"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p8",  topicId: 45, prompt: "GPS uses signals from what to find your location?", options: ["Radio towers", "Satellites in orbit", "Undersea cables", "Weather balloons"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_p9",  topicId: 45, prompt: "Which coordinate is written first in a set of coordinates?", options: ["Longitude", "Altitude", "Latitude", "Grid reference"], correctIndex: 2),
        MathExamQuestion(id: "geo_45_p10", topicId: 45, prompt: "A location at 0°N, 0°E is found in:", options: ["The Atlantic Ocean off the coast of Africa", "The Pacific Ocean near Hawaii", "The Mediterranean Sea", "The Indian Ocean"], correctIndex: 0),
    ],

    46: [
        MathExamQuestion(id: "geo_46_p1",  topicId: 46, prompt: "Cultural diversity refers to:", options: ["Everyone speaking the same language", "The variety of languages, religions, and customs in the world", "Only differences in food", "Countries having the same laws"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_p2",  topicId: 46, prompt: "How many officially recognised languages does India have?", options: ["5", "10", "Over 20", "Over 100"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_p3",  topicId: 46, prompt: "Which is the most widely spoken language in the world by total speakers?", options: ["Spanish", "English", "Mandarin Chinese", "Arabic"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_p4",  topicId: 46, prompt: "What is an indigenous culture?", options: ["A culture brought by colonisers", "The original culture of a people native to a region", "A modern urban culture", "A culture spread by the internet"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_p5",  topicId: 46, prompt: "Which religion has the most followers worldwide?", options: ["Islam", "Hinduism", "Buddhism", "Christianity"], correctIndex: 3),
        MathExamQuestion(id: "geo_46_p6",  topicId: 46, prompt: "Globalisation has led to:", options: ["All cultures becoming identical", "Some blending of cultures while some traditions are lost", "More isolated cultures worldwide", "The end of all local languages"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_p7",  topicId: 46, prompt: "Diwali is a festival celebrated mainly by followers of which religion?", options: ["Islam", "Christianity", "Hinduism and Sikhism", "Buddhism"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_p8",  topicId: 46, prompt: "Which continent has the greatest number of distinct languages?", options: ["Asia", "Europe", "Africa", "South America"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_p9",  topicId: 46, prompt: "What is cultural diffusion?", options: ["The disappearance of all cultures", "The spread of cultural elements from one society to another", "A government policy on culture", "Building cultural museums"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_p10", topicId: 46, prompt: "Why is preserving endangered languages important?", options: ["It is not important  -  fewer languages is simpler", "Languages carry unique knowledge, history, and identity", "Only old people care about languages", "It helps make trade easier"], correctIndex: 1),
    ],

        // Topic 48: Deserts of the World
        48: [
            MathExamQuestion(id: "geo_48_p1", topicId: 48, prompt: "How much annual rainfall does a desert typically receive?", options: ["Less than 250 mm", "Less than 500 mm", "Less than 1,000 mm", "Less than 2,000 mm"], correctIndex: 0),
            MathExamQuestion(id: "geo_48_p2", topicId: 48, prompt: "Which is the largest HOT desert in the world?", options: ["Arabian Desert", "Gobi Desert", "Sahara Desert", "Kalahari Desert"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p3", topicId: 48, prompt: "On which continent is the Sahara Desert located?", options: ["Asia", "South America", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_p4", topicId: 48, prompt: "The Gobi Desert is a cold desert located in:", options: ["Central Asia — China and Mongolia", "North Africa", "South America", "Central Australia"], correctIndex: 0),
            MathExamQuestion(id: "geo_48_p5", topicId: 48, prompt: "What is the overall largest desert on Earth (including cold deserts)?", options: ["Sahara", "Arabian", "Gobi", "Antarctica"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_p6", topicId: 48, prompt: "The Atacama Desert in South America is known for being:", options: ["The hottest desert", "The largest desert", "The driest place on Earth", "The highest desert"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p7", topicId: 48, prompt: "What is an oasis?", options: ["A type of sand dune", "A fertile area with water in a desert", "A desert animal", "A volcanic crater"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p8", topicId: 48, prompt: "Which plant is perfectly adapted to survive in a hot desert?", options: ["Oak tree", "Fern", "Cactus", "Bamboo"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p9", topicId: 48, prompt: "What is desertification?", options: ["Building cities in deserts", "The process by which fertile land turns into desert", "A type of desert storm", "The study of desert animals"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p10", topicId: 48, prompt: "The Namib Desert is found along the coast of which continent?", options: ["Asia", "South America", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_p11", topicId: 48, prompt: "Deserts can be hot OR cold. What do ALL deserts have in common?", options: ["Extremely high temperatures", "Very little precipitation", "Sandy terrain", "No animal life"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p12", topicId: 48, prompt: "In which region is the Arabian Desert located?", options: ["East Africa", "Southeast Asia", "The Middle East", "Central Asia"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p13", topicId: 48, prompt: "What are sand dunes?", options: ["Rocky cliffs in deserts", "Hills formed by wind-blown sand", "Underground water sources", "Dry river beds"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p14", topicId: 48, prompt: "Desert animals often come out at night to avoid extreme heat. This behaviour is called:", options: ["Hibernation", "Migration", "Nocturnal behaviour", "Aestivation"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p15", topicId: 48, prompt: "Why do coastal deserts like the Namib form near cold ocean currents?", options: ["Cold currents bring heavy rain", "Cold currents suppress rainfall by cooling and stabilising the air above them", "They are caused by desert winds from inland", "The ocean evaporates too quickly"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p16", topicId: 48, prompt: "Which of these countries is almost entirely covered by desert?", options: ["Brazil", "Australia", "France", "Japan"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p17", topicId: 48, prompt: "What does a camel store in its hump?", options: ["Water", "Salt", "Fat", "Air"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_p18", topicId: 48, prompt: "The Kalahari Desert is located in which part of Africa?", options: ["North Africa", "East Africa", "West Africa", "Southern Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_p19", topicId: 48, prompt: "A dry river bed that flows only after rare rainfall is called a:", options: ["Delta", "Wadi", "Lagoon", "Fjord"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_p20", topicId: 48, prompt: "Which human activity is the leading cause of desertification?", options: ["Tourism", "Overgrazing and deforestation", "Earthquake activity", "Building roads"], correctIndex: 1),
        ],

        // Topic 49: Rainforests & Biodiversity
        49: [
            MathExamQuestion(id: "geo_49_p1", topicId: 49, prompt: "Where are tropical rainforests mainly located?", options: ["Near the poles", "Near the equator", "In deserts", "On mountain tops"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p2", topicId: 49, prompt: "Which is the largest tropical rainforest in the world?", options: ["Congo Basin", "Daintree", "Amazon", "Borneo"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p3", topicId: 49, prompt: "Why are rainforests called the 'lungs of the Earth'?", options: ["They produce oxygen and absorb CO₂", "They look like lungs on a map", "They breathe water vapour", "They are found inside mountains"], correctIndex: 0),
            MathExamQuestion(id: "geo_49_p4", topicId: 49, prompt: "Tropical rainforests receive more than how much rainfall per year?", options: ["250 mm", "500 mm", "1,000 mm", "2,000 mm"], correctIndex: 3),
            MathExamQuestion(id: "geo_49_p5", topicId: 49, prompt: "On which continent is the Amazon Rainforest found?", options: ["Africa", "Asia", "South America", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p6", topicId: 49, prompt: "Approximately what fraction of all plant and animal species live in rainforests?", options: ["About one quarter", "About one third", "About half", "About three quarters"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p7", topicId: 49, prompt: "Deforestation of rainforests contributes to climate change because:", options: ["Trees produce CO₂", "Fewer trees means less CO₂ is absorbed", "Trees block solar energy", "Forest fires cool the atmosphere"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p8", topicId: 49, prompt: "The Congo Basin Rainforest is located in which continent?", options: ["Asia", "South America", "Africa", "Australia"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p9", topicId: 49, prompt: "What is the canopy layer of a rainforest?", options: ["The forest floor covered with dead leaves", "The dense upper layer of treetops that forms a roof", "Underground roots network", "The misty clouds above the forest"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p10", topicId: 49, prompt: "Which animal is closely associated with the Amazon Rainforest?", options: ["Polar bear", "Emperor penguin", "Jaguar", "Arctic fox"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p11", topicId: 49, prompt: "Biodiversity means:", options: ["The height of trees in a forest", "The variety of different species living in an area", "The amount of rainfall in a region", "The thickness of forest soil"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p12", topicId: 49, prompt: "The Borneo rainforest is found in which continent?", options: ["South America", "Africa", "Asia", "Australia"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p13", topicId: 49, prompt: "What is transpiration in a rainforest?", options: ["Flooding of the forest floor", "Water released by leaves into the atmosphere", "Underground water movement", "Animal movement through the forest"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p14", topicId: 49, prompt: "Rainforest medicines have provided cures and treatments for many diseases. Approximately what fraction of all medicines come from rainforest plants?", options: ["About 5%", "About 10%", "About 25%", "About 50%"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p15", topicId: 49, prompt: "Which of these is NOT a cause of rainforest destruction?", options: ["Cattle ranching", "Logging", "Renewable energy projects in temperate zones", "Palm oil farming"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p16", topicId: 49, prompt: "The rainforest floor layer receives very little sunlight because:", options: ["It is underground", "The canopy and understory block most sunlight from reaching it", "Clouds permanently cover it", "Animals eat all the plants there"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p17", topicId: 49, prompt: "Which country contains the largest share of the Amazon Rainforest?", options: ["Colombia", "Peru", "Brazil", "Venezuela"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_p18", topicId: 49, prompt: "Indigenous peoples of the rainforest are important because:", options: ["They cut the most trees", "They have deep knowledge of forest ecosystems and sustainable living", "They build the largest cities", "They do not affect the forest"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p19", topicId: 49, prompt: "What is slash-and-burn farming?", options: ["A type of fishing in rivers", "Cutting and burning forest to clear land for farming", "A method of planting trees", "Burning crop waste after harvest"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_p20", topicId: 49, prompt: "Sustainable forestry means:", options: ["Cutting all trees at once", "Managing forests so they can regrow and continue providing resources", "Banning all use of forest products", "Only using forests for tourism"], correctIndex: 1),
        ],

        // Topic 50: Islands & Peninsulas
        50: [
            MathExamQuestion(id: "geo_50_p1", topicId: 50, prompt: "What is an island?", options: ["Land completely surrounded by water", "Land with water on three sides", "A very large area of flat land", "A piece of land next to a river"], correctIndex: 0),
            MathExamQuestion(id: "geo_50_p2", topicId: 50, prompt: "What is a peninsula?", options: ["Land completely surrounded by water", "Land almost entirely surrounded by water but connected to the mainland", "An underwater mountain", "A large lake surrounded by land"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p3", topicId: 50, prompt: "Which is the world's largest island?", options: ["Australia", "Borneo", "Greenland", "Great Britain"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p4", topicId: 50, prompt: "Spain and Portugal are located on which peninsula?", options: ["Scandinavian Peninsula", "Arabian Peninsula", "Iberian Peninsula", "Italian Peninsula"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p5", topicId: 50, prompt: "Japan is an example of a country that is:", options: ["A landlocked country", "A peninsula", "An island nation (archipelago)", "Part of a large continent"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p6", topicId: 50, prompt: "Which peninsula contains Saudi Arabia, Yemen, and other Arab countries?", options: ["Scandinavian Peninsula", "Iberian Peninsula", "Indian subcontinent", "Arabian Peninsula"], correctIndex: 3),
            MathExamQuestion(id: "geo_50_p7", topicId: 50, prompt: "How do volcanic islands form?", options: ["They break off from a continent", "Underwater volcanoes build up until they reach the surface", "Earthquakes push land up from the sea", "Strong winds pile up sand"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p8", topicId: 50, prompt: "Norway and Sweden sit on which peninsula?", options: ["Iberian Peninsula", "Italian Peninsula", "Scandinavian Peninsula", "Balkan Peninsula"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p9", topicId: 50, prompt: "A group of islands close together is called:", options: ["A peninsula", "An archipelago", "A delta", "An isthmus"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p10", topicId: 50, prompt: "Which of these is an island nation in the Pacific Ocean?", options: ["Bolivia", "Zimbabwe", "Fiji", "Luxembourg"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p11", topicId: 50, prompt: "The Indian subcontinent (India, Pakistan, Bangladesh) juts into the ocean, making it a very large:", options: ["Island", "Archipelago", "Peninsula", "Plateau"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p12", topicId: 50, prompt: "Coral islands are formed from:", options: ["Sand blown together by wind", "Skeletons of tiny marine creatures building up over time", "Volcanic lava cooling underwater", "Glaciers depositing rock in the sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p13", topicId: 50, prompt: "Which is the largest island in the Mediterranean Sea?", options: ["Sardinia", "Corsica", "Sicily", "Cyprus"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p14", topicId: 50, prompt: "An isthmus is:", options: ["A wide strait of water", "A narrow strip of land connecting two larger land areas", "An island close to the coast", "A type of peninsula in cold regions"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p15", topicId: 50, prompt: "Why might island nations be especially vulnerable to climate change?", options: ["They have fewer people", "They are at risk from rising sea levels and more intense storms", "They lack natural resources", "They do not have governments"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p16", topicId: 50, prompt: "Great Britain is the largest island in which part of the world?", options: ["The Pacific", "The Caribbean", "Europe", "The Mediterranean"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p17", topicId: 50, prompt: "The Philippines is an archipelago of approximately how many islands?", options: ["Around 500", "Around 2,000", "Over 7,000", "Over 15,000"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p18", topicId: 50, prompt: "The Malay Peninsula is shared by Malaysia, Thailand, and which city-state?", options: ["Hong Kong", "Macau", "Singapore", "Brunei"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_p19", topicId: 50, prompt: "Which term describes a narrow waterway between two landmasses connecting two bodies of water?", options: ["Isthmus", "Strait", "Gulf", "Bay"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_p20", topicId: 50, prompt: "The Italian Peninsula is surrounded by which seas?", options: ["North Sea and Baltic Sea", "Mediterranean, Adriatic and Tyrrhenian Seas", "Black Sea and Caspian Sea", "Red Sea and Arabian Sea"], correctIndex: 1),
        ],

        // Topic 51: Earthquakes & Volcanoes
        51: [
            MathExamQuestion(id: "geo_51_p1", topicId: 51, prompt: "What causes an earthquake?", options: ["Heavy rainfall", "The sudden movement of tectonic plates", "Strong winds underground", "Volcanic gas pressure"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p2", topicId: 51, prompt: "What scale measures earthquake strength?", options: ["Beaufort scale", "Saffir-Simpson scale", "Richter scale", "Celsius scale"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p3", topicId: 51, prompt: "What is lava?", options: ["Underground water heated by rock", "Ash ejected from a volcano", "Molten rock that has reached Earth's surface", "A type of earthquake wave"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p4", topicId: 51, prompt: "The 'Ring of Fire' is located around which ocean?", options: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"], correctIndex: 3),
            MathExamQuestion(id: "geo_51_p5", topicId: 51, prompt: "A tsunami is usually caused by:", options: ["Strong surface winds", "A submarine earthquake or volcanic eruption", "Heavy rainfall at sea", "A tornado over the ocean"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p6", topicId: 51, prompt: "Where does magma come from?", options: ["Earth's atmosphere", "The outer crust of the Earth", "The mantle — molten rock beneath Earth's crust", "Underground rivers"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p7", topicId: 51, prompt: "What is the epicentre of an earthquake?", options: ["The underground point where the earthquake begins", "The point on the surface directly above where the earthquake starts", "The edge of the tectonic plate", "The seismograph recording station"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p8", topicId: 51, prompt: "Which country experiences the most earthquakes in the world?", options: ["USA", "Russia", "Japan", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p9", topicId: 51, prompt: "What is a dormant volcano?", options: ["A volcano that is currently erupting", "A volcano that has not erupted recently but could in the future", "A volcano that will never erupt again", "An underwater volcano"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p10", topicId: 51, prompt: "What type of plate boundary produces the most powerful earthquakes?", options: ["Divergent boundary", "Transform boundary", "Convergent boundary", "Hot spot"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p11", topicId: 51, prompt: "Which famous volcano destroyed the Roman city of Pompeii in 79 AD?", options: ["Etna", "Stromboli", "Vesuvius", "Krakatoa"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p12", topicId: 51, prompt: "An extinct volcano is one that:", options: ["Is currently erupting", "Is expected to erupt soon", "Has not erupted for thousands of years and is unlikely to erupt again", "Has only erupted once"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p13", topicId: 51, prompt: "What are seismic waves?", options: ["Sound waves in the ocean", "Energy waves produced by an earthquake that travel through the Earth", "Waves in the atmosphere from a volcanic blast", "Ocean waves caused by wind"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p14", topicId: 51, prompt: "Why do people sometimes live near active volcanoes?", options: ["Volcanic rock deflects earthquakes", "Volcanic ash makes soil very fertile for farming", "It is never dangerous near a volcano", "Governments force people to live there"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p15", topicId: 51, prompt: "Which instrument records earthquake waves?", options: ["Barometer", "Thermometer", "Seismograph", "Anemometer"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p16", topicId: 51, prompt: "What is pyroclastic flow?", options: ["A slow lava stream", "A fast-moving mixture of hot gas, ash, and rock fragments from a volcano", "Rainwater mixing with volcanic ash", "Underground magma movement"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p17", topicId: 51, prompt: "The 2010 Haiti earthquake was so deadly mainly because:", options: ["It measured 10 on the Richter scale", "Buildings were poorly constructed and could not withstand the shaking", "It occurred in the middle of the ocean", "No warning systems existed anywhere in the world"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p18", topicId: 51, prompt: "What are hot spots in the context of volcanoes?", options: ["Areas with many wildfires", "Especially warm ocean areas", "Plumes of hot magma rising through the mantle creating volcanoes away from plate boundaries", "Zones in the Ring of Fire"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_p19", topicId: 51, prompt: "Which country has the most volcanoes in the world?", options: ["USA", "Indonesia", "Italy", "Mexico"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_p20", topicId: 51, prompt: "A lahar is a dangerous volcanic hazard consisting of:", options: ["A river of lava", "A fast-moving mudflow of volcanic material mixed with water", "A cloud of poisonous gas", "Fragments of volcanic rock shooting into the sky"], correctIndex: 1),
        ],

        // Topic 52: Climate Zones
        52: [
            MathExamQuestion(id: "geo_52_p1", topicId: 52, prompt: "Which climate zone is found near the equator with high temperatures and rainfall year-round?", options: ["Polar", "Arid", "Tropical", "Temperate"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p2", topicId: 52, prompt: "What is climate?", options: ["What the weather is like today", "The average weather conditions in a place over many years", "A weather forecast for next week", "Temperature only, not rainfall"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p3", topicId: 52, prompt: "Which factor has the greatest influence on which climate zone a place is in?", options: ["Population size", "Latitude (distance from the equator)", "Number of rivers", "Size of the country"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p4", topicId: 52, prompt: "Polar climate zones are found:", options: ["Near the equator", "In desert regions", "Near the North and South Poles", "Along tropical coastlines"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p5", topicId: 52, prompt: "A Mediterranean climate is characterised by:", options: ["Year-round heavy rainfall", "Very cold winters and hot summers", "Hot dry summers and mild wet winters", "Permanent ice and snow"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p6", topicId: 52, prompt: "Continental climates typically have:", options: ["Mild temperatures all year", "Very cold winters and hot summers far from the ocean", "Year-round heavy rain", "Permanent tropical warmth"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p7", topicId: 52, prompt: "Which climate zone covers much of the UK and Western Europe?", options: ["Tropical", "Arid", "Mediterranean", "Temperate oceanic"], correctIndex: 3),
            MathExamQuestion(id: "geo_52_p8", topicId: 52, prompt: "Places at high altitude (mountains) tend to be:", options: ["Warmer than lower areas", "Colder than lower areas at the same latitude", "Always dry regardless of location", "Always wet regardless of location"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p9", topicId: 52, prompt: "The Koppen climate classification system divides the world into how many main groups?", options: ["3", "5", "7", "10"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p10", topicId: 52, prompt: "Why are coastal areas often milder in temperature than inland areas at the same latitude?", options: ["The sea is always warm", "The sea moderates temperatures — warming in winter and cooling in summer", "Coastal winds always bring rain", "Oceans block solar radiation"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p11", topicId: 52, prompt: "Semi-arid (steppe) climates receive:", options: ["More than 2,000 mm of rain per year", "Less than 250 mm of rain per year", "Between 250 and 500 mm of rain per year", "No rainfall at all"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p12", topicId: 52, prompt: "Which climate zone would you find in northern Canada and Russia?", options: ["Tropical", "Mediterranean", "Boreal / subarctic", "Arid"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p13", topicId: 52, prompt: "A monsoon climate is characterised by:", options: ["Constant temperature all year", "A very dry season and a very wet season", "Snowfall every month", "Warm temperatures with no rain"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p14", topicId: 52, prompt: "As latitude increases (moving away from the equator), temperatures generally:", options: ["Increase", "Remain the same", "Decrease", "Become more extreme in both directions equally"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p15", topicId: 52, prompt: "A place in a 'rain shadow' receives little rainfall because:", options: ["It is at the equator", "Mountains block moisture-laden winds, leaving the opposite side dry", "Cold ocean currents remove moisture from the air", "The land absorbs water before rain can fall"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p16", topicId: 52, prompt: "Which climate zone has permafrost (permanently frozen ground)?", options: ["Tropical", "Mediterranean", "Temperate", "Tundra / polar"], correctIndex: 3),
            MathExamQuestion(id: "geo_52_p17", topicId: 52, prompt: "India and Southeast Asia experience which type of climate that brings heavy seasonal rains?", options: ["Desert climate", "Polar climate", "Monsoon climate", "Mediterranean climate"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p18", topicId: 52, prompt: "The Tropic of Cancer and Tropic of Capricorn mark the boundaries of which climate zone?", options: ["Polar zone", "Temperate zone", "Tropical zone", "Continental zone"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_p19", topicId: 52, prompt: "Climate change is causing climate zones to:", options: ["Remain perfectly stable", "Shift — for example, deserts expanding and polar zones shrinking", "Only affect tropical areas", "Get wetter everywhere equally"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_p20", topicId: 52, prompt: "Which of these cities has a tropical climate?", options: ["London", "Moscow", "Singapore", "Chicago"], correctIndex: 2),
        ],

        // Topic 53: Population & Cities
        53: [
            MathExamQuestion(id: "geo_53_p1", topicId: 53, prompt: "Approximately how many people live on Earth today?", options: ["5 billion", "6 billion", "7 billion", "8 billion"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_p2", topicId: 53, prompt: "What is population density?", options: ["The total number of people in the world", "The number of people per square kilometre of land", "How fast the population is growing", "The age of the average person"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p3", topicId: 53, prompt: "Which continent has the highest total population?", options: ["Europe", "Africa", "North America", "Asia"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_p4", topicId: 53, prompt: "Which city has the largest urban population in the world?", options: ["New York", "Shanghai", "Mumbai", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_p5", topicId: 53, prompt: "A megacity is a city with a population of more than:", options: ["1 million", "5 million", "10 million", "50 million"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p6", topicId: 53, prompt: "Urbanisation means:", options: ["The decline of cities", "The growth of the proportion of people living in urban areas", "Building new farmland around cities", "Reducing city pollution"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p7", topicId: 53, prompt: "Which two countries have the largest populations?", options: ["USA and Russia", "China and India", "Brazil and Indonesia", "Nigeria and Bangladesh"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p8", topicId: 53, prompt: "Sparsely populated areas are most likely to be found in:", options: ["River deltas", "Fertile plains", "Deserts and polar regions", "Coastal lowlands"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p9", topicId: 53, prompt: "What is a push factor for people moving to a city?", options: ["Better hospitals in the city", "Lack of jobs in rural areas", "Good entertainment in cities", "Warmer climate in cities"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p10", topicId: 53, prompt: "What percentage of the world's population now lives in urban areas?", options: ["About 20%", "About 35%", "About 55%", "About 75%"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p11", topicId: 53, prompt: "Which of these factors makes an area DENSELY populated?", options: ["Very cold temperatures", "Mountainous terrain", "Fertile soil and flat land near water", "Very arid conditions"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p12", topicId: 53, prompt: "What is a shanty town?", options: ["A planned housing estate", "An area of poor-quality self-built housing without proper water or sanitation", "A luxury suburb", "A tourist resort"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p13", topicId: 53, prompt: "Birth rate is defined as:", options: ["The total population of a country", "The number of deaths per 1,000 people per year", "The number of births per 1,000 people per year", "The average age when people have children"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p14", topicId: 53, prompt: "Which continent currently has the fastest population growth rate?", options: ["Europe", "North America", "Asia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_p15", topicId: 53, prompt: "What is a conurbation?", options: ["A type of shanty town", "A large built-up area formed when cities grow and merge together", "A planned city built from scratch", "A historic city centre"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p16", topicId: 53, prompt: "Which region is home to the world's most densely populated areas?", options: ["Siberia and the Canadian Arctic", "The Sahara Desert", "South and East Asia", "The Amazon Basin"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_p17", topicId: 53, prompt: "What does 'natural increase' in population mean?", options: ["An increase in immigration", "When birth rate is higher than death rate", "When people move from rural to urban areas", "Population growth caused by better farming"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p18", topicId: 53, prompt: "An ageing population means:", options: ["Most citizens are young", "The average age of citizens is rising, with more older people than younger ones", "Population is shrinking rapidly", "More people are being born each year"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p19", topicId: 53, prompt: "Which of these is a pull factor attracting people to cities?", options: ["War in a city", "Better job opportunities in the city", "Overcrowding in the city", "Higher cost of living in the city"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_p20", topicId: 53, prompt: "In 2022 the world's population reached 8 billion. Which country became the most populous in 2023, surpassing China?", options: ["USA", "Indonesia", "India", "Nigeria"], correctIndex: 2),
        ],

        // Topic 54: Natural Resources
        54: [
            MathExamQuestion(id: "geo_54_p1", topicId: 54, prompt: "What is a natural resource?", options: ["Something made in a factory", "A material found in nature that humans use", "A type of currency", "An imported product"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p2", topicId: 54, prompt: "Which of these is a RENEWABLE resource?", options: ["Coal", "Natural gas", "Oil", "Solar energy"], correctIndex: 3),
            MathExamQuestion(id: "geo_54_p3", topicId: 54, prompt: "Which of these is a NON-RENEWABLE resource?", options: ["Wind energy", "Timber", "Coal", "Hydroelectric power"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p4", topicId: 54, prompt: "Which country is the world's largest exporter of oil?", options: ["Russia", "USA", "Saudi Arabia", "Iraq"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p5", topicId: 54, prompt: "Which country is the world's leading exporter of coffee?", options: ["Colombia", "Ethiopia", "Vietnam", "Brazil"], correctIndex: 3),
            MathExamQuestion(id: "geo_54_p6", topicId: 54, prompt: "Fossil fuels are non-renewable because:", options: ["They are found only in one country", "They take millions of years to form and are used faster than they regenerate", "They produce no useful energy", "They are too expensive to extract"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p7", topicId: 54, prompt: "Which natural resource does South Africa lead the world in exporting?", options: ["Coffee", "Oil", "Wheat", "Diamonds"], correctIndex: 3),
            MathExamQuestion(id: "geo_54_p8", topicId: 54, prompt: "Deforestation threatens which natural resource?", options: ["Coal reserves", "Oil deposits", "Forest and timber resources", "Underground water"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p9", topicId: 54, prompt: "What does 'import' mean in the context of resources?", options: ["Producing a resource yourself", "Buying a resource from another country", "Selling a resource to another country", "Discovering a new resource"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p10", topicId: 54, prompt: "Which of these is a natural resource essential for life?", options: ["Plastic", "Steel", "Freshwater", "Concrete"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p11", topicId: 54, prompt: "OPEC is an organisation of countries that coordinate the production of:", options: ["Agricultural produce", "Diamonds and precious metals", "Oil", "Timber"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p12", topicId: 54, prompt: "Which country is the world's largest producer of wheat?", options: ["USA", "China", "Russia", "India"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p13", topicId: 54, prompt: "What is a renewable resource?", options: ["A resource that never runs out under any circumstances", "A resource that is replenished naturally on a human timescale", "A resource only found in rainforests", "A resource produced in factories"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p14", topicId: 54, prompt: "Which mineral is essential for making steel?", options: ["Gold", "Iron ore", "Copper", "Bauxite"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p15", topicId: 54, prompt: "Resource conflicts occur when:", options: ["Countries have too many resources", "Countries compete over access to valuable resources like water or oil", "Resources become too cheap", "Countries refuse to trade"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p16", topicId: 54, prompt: "Canada is a major exporter of which two resources?", options: ["Coffee and diamonds", "Oil and timber", "Gold and copper only", "Wheat and solar energy"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p17", topicId: 54, prompt: "What is geothermal energy?", options: ["Energy from the sun", "Energy from moving water", "Energy from heat inside the Earth", "Energy from burning wood"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p18", topicId: 54, prompt: "Which country is by far the world's largest producer of rare earth minerals (used in electronics)?", options: ["USA", "Australia", "China", "Brazil"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_p19", topicId: 54, prompt: "Overfishing is a problem because:", options: ["Fish become too expensive to catch", "Fish populations are harvested faster than they can reproduce", "Fishing boats pollute the ocean", "Fish migrate to new areas"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_p20", topicId: 54, prompt: "Which African country is the world's largest producer of cocoa (used for chocolate)?", options: ["Nigeria", "Ghana", "Ivory Coast (Côte d'Ivoire)", "Cameroon"], correctIndex: 2),
        ],

    47: [
        MathExamQuestion(id: "geo_47_p1",  topicId: 47, prompt: "Human rights are rights that belong to:", options: ["Only citizens of wealthy countries", "Every person regardless of where they live", "Only adults over 18", "Only people born in democratic countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p2",  topicId: 47, prompt: "The UN Convention on the Rights of the Child protects:", options: ["Adults in conflict zones", "Children's rights to education, safety, and health worldwide", "Only children in Europe", "The rights of child workers"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p3",  topicId: 47, prompt: "A refugee is someone who:", options: ["Is on holiday abroad", "Has fled their home country due to war, persecution, or disaster", "Works for an international company", "Studies at a foreign university"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p4",  topicId: 47, prompt: "How does geography affect human rights?", options: ["It has no effect at all", "Where you are born can determine your access to education, safety, and freedom", "Only climate matters for rights", "Only wealthy countries have human rights"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p5",  topicId: 47, prompt: "Which UN agency focuses specifically on helping refugees?", options: ["WHO", "UNESCO", "UNHCR", "UNICEF"], correctIndex: 2),
        MathExamQuestion(id: "geo_47_p6",  topicId: 47, prompt: "Children in conflict zones often lose access to:", options: ["Television", "Education, healthcare, and safety", "Luxury goods", "Tourism opportunities"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p7",  topicId: 47, prompt: "The Universal Declaration of Human Rights was created in:", options: ["1918", "1945", "1948", "1965"], correctIndex: 2),
        MathExamQuestion(id: "geo_47_p8",  topicId: 47, prompt: "Which of these is a basic human right?", options: ["Owning a luxury car", "Access to clean water and food", "Having a social media account", "Travelling first class"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p9",  topicId: 47, prompt: "Stateless people are those who:", options: ["Live in cities", "Have no recognised nationality or citizenship", "Only speak one language", "Refuse to vote"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_p10", topicId: 47, prompt: "Non-governmental organisations (NGOs) like Amnesty International campaign for:", options: ["Corporate profits", "Government tax collection", "Human rights around the world", "Military expansion"], correctIndex: 2),
    ],
    ]

    // MARK: - Exam Questions Bank

    private static let examQuestionsByTopic: [Int: [MathExamQuestion]] = [

        1: [
            MathExamQuestion(id: "geo_1_e1", topicId: 1, prompt: "What is the area around your home with nearby streets called?", options: ["Continent", "Country", "Neighborhood", "Ocean"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_e2", topicId: 1, prompt: "Which of these is the LARGEST geographical unit?", options: ["Street", "City", "State", "Continent"], correctIndex: 3),
            MathExamQuestion(id: "geo_1_e3", topicId: 1, prompt: "A community is a group of people who:", options: ["Live on different planets", "Live and interact in the same area", "Never see each other", "Only exist in cities"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e4", topicId: 1, prompt: "Which of these is a natural feature in a neighborhood?", options: ["Post office", "Park tree", "Bus stop", "Sidewalk"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e5", topicId: 1, prompt: "What is an address used for?", options: ["To identify the exact location of a building", "To describe the weather", "To measure distance", "To name a country"], correctIndex: 0),
            MathExamQuestion(id: "geo_1_e6", topicId: 1, prompt: "Ordering from smallest to largest: neighborhood → city → __ → country?", options: ["Street", "House", "State/Region", "Continent"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_e7", topicId: 1, prompt: "Which of these would you find in a rural area but NOT a neighborhood?", options: ["School", "Farmland", "Supermarket", "Library"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e8", topicId: 1, prompt: "A human-made feature in a neighborhood is also called:", options: ["A natural feature", "Vegetation", "A built environment feature", "Wildlife"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_e9", topicId: 1, prompt: "Which best describes a suburb?", options: ["An area in the center of a city", "A residential area on the outskirts of a city", "A mountain village", "A coastal town"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e10", topicId: 1, prompt: "What do we call a group of houses or buildings in a rural area?", options: ["Metropolis", "Village", "Borough", "District"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e11", topicId: 1, prompt: "Which of the following BEST explains why some neighborhoods have more services (hospitals, parks, shops) than others?", options: ["Random chance", "Government decisions, investment levels, and historical development patterns", "Altitude above sea level", "Distance from the equator"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e12", topicId: 1, prompt: "A neighborhood's 'sense of place' refers to:", options: ["Its exact GPS coordinates", "The unique character and emotional attachment people feel to an area", "The number of streets it contains", "How close it is to the city center"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_e13", topicId: 1, prompt: "Urban renewal in a neighborhood is MOST likely to lead to:", options: ["Decreased property prices", "Reduced public transport", "Gentrification and displacement of long-term residents", "Fewer services and amenities"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_e14", topicId: 1, prompt: "Which settlement pattern places houses along a road or river with farmland behind, common in Quebec?", options: ["Nucleated", "Dispersed", "Linear", "Clustered"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_e15", topicId: 1, prompt: "The 'multiplier effect' in a community context means:", options: ["A new school is built twice", "One new business attracts more businesses and jobs, boosting the local economy", "Population doubles every decade", "Services are shared with neighboring towns"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_h1", topicId: 1, prompt: "A 'food desert' is a term used in urban geography to describe:", options: ["A hot, dry neighborhood with no parks", "An area where residents have poor access to affordable, nutritious food due to lack of nearby stores", "A community that wastes large amounts of food", "A rural area where only fast food restaurants operate", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_h2", topicId: 1, prompt: "In urban planning, 'zoning' refers to:", options: ["Measuring the exact size of city blocks", "Dividing land into areas where only certain types of buildings or activities are permitted", "Drawing neighborhood boundary lines for census purposes", "Assigning postal codes to streets", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_h3", topicId: 1, prompt: "The concept of 'urban heat island' describes how city centres are warmer than surrounding rural areas. The PRIMARY cause is:", options: ["More people generating body heat in cities", "Dark surfaces like asphalt absorbing heat, lack of vegetation, and waste heat from buildings and vehicles", "Cities being built closer to the equator", "Higher altitude of city buildings trapping warm air", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_1_h4", topicId: 1, prompt: "Which settlement hierarchy level comes DIRECTLY between a village and a city?", options: ["Hamlet", "Metropolis", "Town", "Conurbation", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_1_h5", topicId: 1, prompt: "Push factors in migration relate to a community by:", options: ["Attracting people to move into an area because of its good services", "Driving people AWAY from their current community due to hardship, conflict, or poor conditions", "Government policies that fix housing prices", "Natural features that make an area desirable to live in", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        2: [
            MathExamQuestion(id: "geo_2_e1", topicId: 2, prompt: "What shape is a globe?", options: ["Flat", "Cylindrical", "Spherical", "Cubic"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_e2", topicId: 2, prompt: "Which colour represents water on most maps?", options: ["Green", "Brown", "Blue", "Yellow"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_e3", topicId: 2, prompt: "A compass rose shows:", options: ["How far apart cities are", "Cardinal directions (N, S, E, W)", "The age of the map", "Population data"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e4", topicId: 2, prompt: "The map legend explains:", options: ["The title of the map", "Symbols and colors used on the map", "The date the map was made", "Who drew the map"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e5", topicId: 2, prompt: "What does a map scale allow you to do?", options: ["Find north", "Calculate real distances from the map", "Identify capital cities", "Measure rainfall"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e6", topicId: 2, prompt: "A globe is more accurate than a flat map because:", options: ["It is bigger", "It does not distort the Earth's shape", "It has more colors", "It shows more detail"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e7", topicId: 2, prompt: "A political map shows:", options: ["Rivers and mountains", "Country borders and capitals", "Climate zones", "Ocean depths"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e8", topicId: 2, prompt: "Contour lines on a map show:", options: ["River paths", "Road networks", "Changes in elevation/height", "Population density"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_e9", topicId: 2, prompt: "Which direction is typically at the top of a standard map?", options: ["South", "East", "West", "North"], correctIndex: 3),
            MathExamQuestion(id: "geo_2_e10", topicId: 2, prompt: "A thematic map focuses on:", options: ["Showing all geographic features", "One specific topic like climate or population", "Only physical features", "Only political boundaries"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e11", topicId: 2, prompt: "On a topographic map, closely spaced contour lines indicate:", options: ["A flat plain", "A gentle slope", "A steep slope or cliff", "A river valley"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_e12", topicId: 2, prompt: "A Robinson projection is preferred for world maps because:", options: ["It perfectly preserves area", "It perfectly preserves shape", "It minimises overall distortion of shape and area as a compromise", "It shows the poles without distortion"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_e13", topicId: 2, prompt: "A map's graticule refers to:", options: ["The decorative border around the map", "The network of latitude and longitude lines drawn on the map", "The legend symbols", "The map's title and date"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e14", topicId: 2, prompt: "When comparing two maps of the same area, one at 1:50,000 and one at 1:250,000, which shows MORE detail?", options: ["1:250,000 — larger numbers mean more detail", "1:50,000 — it is the larger scale map", "Both show identical detail", "Detail depends only on the map's colour scheme"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_e15", topicId: 2, prompt: "GIS differs from a traditional paper map because GIS:", options: ["Uses only satellite images", "Can layer multiple data sets and perform spatial analysis", "Cannot display political boundaries", "Only works for urban areas"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_h1", topicId: 2, prompt: "A Mercator projection greatly exaggerates the size of landmasses near the poles. Which of the following is MOST distorted in size on a Mercator map?", options: ["Brazil", "Australia", "Greenland", "India", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_h2", topicId: 2, prompt: "On a topographic map with a contour interval of 20 m, if you count 5 contour lines between two points, the difference in elevation is:", options: ["20 m", "60 m", "80 m", "100 m", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_2_h3", topicId: 2, prompt: "A choropleth map uses shading or colour intensity to represent:", options: ["Individual data points plotted at exact locations", "Flow of goods or people between regions", "Statistical data values across predefined areas", "The elevation of terrain", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_2_h4", topicId: 2, prompt: "If a map has a scale of 1:100,000, a distance of 4 cm on the map represents what real-world distance?", options: ["400 m", "4 km", "40 km", "400 km", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_2_h5", topicId: 2, prompt: "The Gall-Peters projection preserves the correct AREA of countries but distorts their shape. This makes it controversial because:", options: ["It makes polar regions appear smaller than they are", "It challenges the Eurocentric view by showing African and South American countries at their true relative sizes", "It is too difficult to print on flat paper", "It cannot show all 195 countries at once", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        3: [
            MathExamQuestion(id: "geo_3_e1", topicId: 3, prompt: "How many continents are there?", options: ["5", "6", "7", "8"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e2", topicId: 3, prompt: "Which is the largest continent?", options: ["Africa", "North America", "Asia", "Europe"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e3", topicId: 3, prompt: "How many oceans are there?", options: ["3", "4", "5", "6"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e4", topicId: 3, prompt: "Which is the largest ocean?", options: ["Atlantic", "Indian", "Pacific", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e5", topicId: 3, prompt: "Which continent has NO countries?", options: ["Australia", "Antarctica", "Greenland", "Arctic"], correctIndex: 1),
            MathExamQuestion(id: "geo_3_e6", topicId: 3, prompt: "Which ocean lies between America and Europe/Africa?", options: ["Pacific", "Indian", "Atlantic", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e7", topicId: 3, prompt: "Australia is both a country and a:", options: ["State", "Island", "Continent", "Region"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e8", topicId: 3, prompt: "Which continent is Brazil part of?", options: ["North America", "South America", "Africa", "Europe"], correctIndex: 1),
            MathExamQuestion(id: "geo_3_e9", topicId: 3, prompt: "The smallest ocean is:", options: ["Southern", "Atlantic", "Indian", "Arctic"], correctIndex: 3),
            MathExamQuestion(id: "geo_3_e10", topicId: 3, prompt: "Which continent contains the most countries?", options: ["Asia", "Europe", "Africa", "Americas"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e11", topicId: 3, prompt: "The Southern Ocean was officially recognised as Earth's fifth ocean by National Geographic in:", options: ["1969", "1987", "2021", "2000"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_e12", topicId: 3, prompt: "Which two continents share no land border with any other continent?", options: ["Australia and Antarctica", "Africa and Australia", "South America and Antarctica", "Europe and Australia"], correctIndex: 0),
            MathExamQuestion(id: "geo_3_e13", topicId: 3, prompt: "The Mariana Trench, the deepest point on Earth, is located in which ocean?", options: ["Atlantic", "Indian", "Arctic", "Pacific"], correctIndex: 3),
            MathExamQuestion(id: "geo_3_e14", topicId: 3, prompt: "Which continent straddles all four hemispheres (Northern, Southern, Eastern, Western)?", options: ["Asia", "Africa", "South America", "Europe"], correctIndex: 1),
            MathExamQuestion(id: "geo_3_e15", topicId: 3, prompt: "The Mid-Atlantic Ridge runs along the floor of which ocean and is where tectonic plates are separating?", options: ["Pacific Ocean", "Indian Ocean", "Atlantic Ocean", "Arctic Ocean"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_h1", topicId: 3, prompt: "Which continent has the highest average elevation above sea level?", options: ["Asia", "South America", "Africa", "Antarctica", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_3_h2", topicId: 3, prompt: "The Drake Passage — the world's roughest stretch of ocean — lies between South America and which continent?", options: ["Africa", "Australia", "Antarctica", "North America", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_h3", topicId: 3, prompt: "Which two continents are connected by the Isthmus of Panama?", options: ["Europe and Asia", "Africa and Asia", "North America and South America", "Australia and Asia", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_3_h4", topicId: 3, prompt: "Ranking the oceans from LARGEST to SMALLEST by area, the correct order is:", options: ["Pacific, Atlantic, Indian, Southern, Arctic", "Atlantic, Pacific, Indian, Southern, Arctic", "Pacific, Indian, Atlantic, Southern, Arctic", "Indian, Pacific, Atlantic, Arctic, Southern", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "geo_3_h5", topicId: 3, prompt: "The supercontinent Pangaea began breaking apart approximately how many million years ago?", options: ["10 million years ago", "65 million years ago", "175 million years ago", "500 million years ago", "I don't know / Wasn't taught"], correctIndex: 2),
        ],

        4: [
            MathExamQuestion(id: "geo_4_e1", topicId: 4, prompt: "Capital of France?", options: ["Lyon", "Marseille", "Nice", "Paris"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_e2", topicId: 4, prompt: "Capital of Japan?", options: ["Osaka", "Kyoto", "Tokyo", "Hiroshima"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e3", topicId: 4, prompt: "Capital of Australia?", options: ["Sydney", "Melbourne", "Canberra", "Brisbane"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e4", topicId: 4, prompt: "Capital of Germany?", options: ["Munich", "Hamburg", "Frankfurt", "Berlin"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_e5", topicId: 4, prompt: "Capital of Brazil?", options: ["Rio de Janeiro", "São Paulo", "Brasília", "Manaus"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e6", topicId: 4, prompt: "Capital of Canada?", options: ["Toronto", "Vancouver", "Ottawa", "Montreal"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e7", topicId: 4, prompt: "Capital of China?", options: ["Shanghai", "Beijing", "Shenzhen", "Chengdu"], correctIndex: 1),
            MathExamQuestion(id: "geo_4_e8", topicId: 4, prompt: "Capital of India?", options: ["Mumbai", "Kolkata", "New Delhi", "Bangalore"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e9", topicId: 4, prompt: "Capital of Russia?", options: ["St. Petersburg", "Vladivostok", "Novosibirsk", "Moscow"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_e10", topicId: 4, prompt: "Capital of Italy?", options: ["Milan", "Venice", "Naples", "Rome"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_e11", topicId: 4, prompt: "Which country has TWO capitals — Pretoria (executive) and Cape Town (legislative)?", options: ["Nigeria", "Kenya", "South Africa", "Egypt"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e12", topicId: 4, prompt: "Nur-Sultan (now Astana) is the capital of which Central Asian country?", options: ["Uzbekistan", "Kyrgyzstan", "Kazakhstan", "Turkmenistan"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_e13", topicId: 4, prompt: "Which country moved its capital from Lagos to Abuja in 1991 to achieve a more central location?", options: ["Ghana", "Nigeria", "Kenya", "Senegal"], correctIndex: 1),
            MathExamQuestion(id: "geo_4_e14", topicId: 4, prompt: "Naypyidaw, built from scratch in 2005, is the capital of which country?", options: ["Cambodia", "Laos", "Thailand", "Myanmar"], correctIndex: 3),
            MathExamQuestion(id: "geo_4_e15", topicId: 4, prompt: "Which is the world's highest-altitude national capital city, at over 3,600 m above sea level?", options: ["Kathmandu", "Addis Ababa", "La Paz", "Quito"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_h1", topicId: 4, prompt: "Which country has THREE official capitals — Pretoria (executive), Cape Town (legislative), and Bloemfontein (judicial)?", options: ["Nigeria", "Kenya", "South Africa", "Tanzania", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_h2", topicId: 4, prompt: "The capital of Sri Lanka used for legislative purposes is Sri Jayawardenepura Kotte, while which city serves as the commercial capital?", options: ["Kandy", "Colombo", "Galle", "Jaffna", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_4_h3", topicId: 4, prompt: "Bolivia has two capitals: Sucre (constitutional) and La Paz (seat of government). Sucre is also notable as:", options: ["The most populous city in Bolivia", "The location of Bolivia's highest peak", "The city where Bolivia declared independence and the Supreme Court sits", "The main port city of Bolivia", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_h4", topicId: 4, prompt: "Which European country's capital city shares its name with the country itself?", options: ["Germany", "France", "Luxembourg", "Austria", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_4_h5", topicId: 4, prompt: "Washington D.C. is not part of any US state. D.C. stands for:", options: ["District of Columbia", "Department of Congress", "Division of the Confederation", "Domain of the Constitution", "I don't know / Wasn't taught"], correctIndex: 0),
        ],

        5: [
            MathExamQuestion(id: "geo_5_e1", topicId: 5, prompt: "Which describes WEATHER best?", options: ["Long-term atmospheric patterns", "Day-to-day atmospheric conditions", "Ocean temperature", "Geological activity"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e2", topicId: 5, prompt: "What causes the seasons?", options: ["Distance from the Sun", "Earth's axial tilt", "Moon's gravity", "Sunspot activity"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e3", topicId: 5, prompt: "Which climate is hot and dry?", options: ["Tundra", "Tropical", "Desert", "Temperate"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_e4", topicId: 5, prompt: "A thermometer measures:", options: ["Wind speed", "Temperature", "Rainfall", "Air pressure"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e5", topicId: 5, prompt: "Tropical climates are located:", options: ["Near the poles", "Near the equator", "In the middle latitudes", "In mountain ranges"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e6", topicId: 5, prompt: "A drought is caused by:", options: ["Excessive rainfall", "Extended periods of low rainfall", "Extremely cold temperatures", "Frequent storms"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e7", topicId: 5, prompt: "Which instrument measures wind speed?", options: ["Thermometer", "Barometer", "Anemometer", "Rain gauge"], correctIndex: 2),
            MathExamQuestion(id: "geo_5_e8", topicId: 5, prompt: "The Mediterranean climate has:", options: ["Snow year-round", "Hot dry summers, mild wet winters", "Heavy rain every month", "Extreme cold winters"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e9", topicId: 5, prompt: "Which factor does NOT affect climate?", options: ["Latitude", "Altitude", "Distance from sea", "Country's language"], correctIndex: 3),
            MathExamQuestion(id: "geo_5_e10", topicId: 5, prompt: "A hurricane and a typhoon are the same type of storm. What are they?", options: ["Blizzards", "Tropical cyclones", "Tornadoes", "Dust storms"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e11", topicId: 5, prompt: "The Koppen climate classification system divides Earth's climates into groups primarily based on:", options: ["Altitude and latitude only", "Temperature and precipitation patterns", "Proximity to oceans only", "Vegetation and soil type only"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e12", topicId: 5, prompt: "The 'orographic effect' (relief rainfall) occurs when:", options: ["Cold air descends from polar regions", "Moist air is forced upward by mountains, cools, and releases rain on the windward side", "Warm ocean currents heat coastal air", "Hot desert air rises rapidly at midday"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e13", topicId: 5, prompt: "The North Atlantic Drift keeps western Europe warmer than expected for its latitude. It is an example of:", options: ["A trade wind system", "An ocean current influencing regional climate", "A jet stream pattern", "A monsoon circulation"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e14", topicId: 5, prompt: "In a continental climate (e.g. central Russia), summers are hot but winters are bitterly cold because:", options: ["The area is too far from the equator", "Land heats and cools far more rapidly than oceans, creating extreme seasonal temperature ranges", "Jet streams bypass the region entirely", "Permafrost prevents heat from escaping"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_e15", topicId: 5, prompt: "A microclimate is:", options: ["A global weather pattern", "The climate of a very small area that differs from the surrounding region", "A forecast for the next 24 hours", "A climate measured only at sea level"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_h1", topicId: 5, prompt: "El Niño is a climate phenomenon caused by:", options: ["Unusually cold water upwelling along the South American Pacific coast", "Warming of sea surface temperatures in the central and eastern tropical Pacific, disrupting global weather patterns", "A shift in the position of the jet stream over North America only", "Increased volcanic activity in the Pacific Ring of Fire", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_h2", topicId: 5, prompt: "The Inter-Tropical Convergence Zone (ITCZ) is a belt near the equator where trade winds meet. It is most associated with:", options: ["Persistent high pressure and dry conditions year-round", "Heavy rainfall, thunderstorms, and low pressure as warm air rises", "Cold polar air masses descending toward the tropics", "Seasonal snowfall in equatorial regions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_h3", topicId: 5, prompt: "A place at latitude 60°N will experience SHORTER days in winter compared to a place at 30°N because:", options: ["It is farther from the equator so it receives less solar radiation and the sun stays lower in the sky", "It is closer to the poles where the Earth rotates more slowly", "Cold air at high latitudes blocks sunlight for longer periods", "The magnetosphere is thinner at higher latitudes", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "geo_5_h4", topicId: 5, prompt: "The Sahara Desert lies at roughly 20-30°N latitude, a zone also called the 'subtropical high'. Why is this belt characteristically dry?", options: ["Trade winds carry all moisture away before it can fall as rain", "Descending dry air associated with Hadley Cell circulation suppresses rainfall", "The Mediterranean Sea provides only cold dry air to these latitudes", "Elevation across the Sahara is too high for clouds to form", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_5_h5", topicId: 5, prompt: "Global warming is projected to intensify the hydrological cycle. This means:", options: ["Less evaporation overall, leading to drier conditions everywhere", "Wet regions tend to get wetter and dry regions tend to get drier, with more intense storms", "Rainfall will become more evenly distributed across the globe", "Ocean currents will slow, reducing coastal rainfall worldwide", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        6: [
            MathExamQuestion(id: "geo_6_e1", topicId: 6, prompt: "How many US states are there?", options: ["48", "49", "50", "52"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e2", topicId: 6, prompt: "The US capital is:", options: ["New York", "Chicago", "Washington D.C.", "Los Angeles"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e3", topicId: 6, prompt: "The largest US state by area is:", options: ["Texas", "California", "Montana", "Alaska"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_e4", topicId: 6, prompt: "Capital of California:", options: ["Los Angeles", "San Francisco", "Sacramento", "San Diego"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e5", topicId: 6, prompt: "Which state is a group of Pacific islands?", options: ["Alaska", "Hawaii", "Florida", "Maine"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_e6", topicId: 6, prompt: "The Mississippi River flows into:", options: ["Atlantic Ocean", "Pacific Ocean", "Gulf of Mexico", "Great Lakes"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e7", topicId: 6, prompt: "Capital of Texas:", options: ["Houston", "Dallas", "San Antonio", "Austin"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_e8", topicId: 6, prompt: "Which mountain range runs along the US East Coast?", options: ["Rockies", "Sierra Nevada", "Appalachians", "Cascades"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e9", topicId: 6, prompt: "Florida is known as the 'Sunshine State'. What is its capital?", options: ["Miami", "Orlando", "Jacksonville", "Tallahassee"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_e10", topicId: 6, prompt: "The Grand Canyon is located in which state?", options: ["Colorado", "Utah", "Nevada", "Arizona"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_e11", topicId: 6, prompt: "Which US state was the last to be admitted to the Union (1959)?", options: ["Alaska", "Hawaii", "New Mexico", "Arizona"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_e12", topicId: 6, prompt: "The Great Lakes (Superior, Michigan, Huron, Erie, Ontario) are shared between the USA and which other country?", options: ["Mexico", "Cuba", "Canada", "Greenland"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_e13", topicId: 6, prompt: "The Dust Bowl of the 1930s primarily affected which region of the United States?", options: ["New England", "The Great Plains", "The Pacific Northwest", "The Deep South"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_e14", topicId: 6, prompt: "Which state contains Death Valley, the lowest point in North America at 86 metres below sea level?", options: ["Nevada", "Arizona", "New Mexico", "California"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_e15", topicId: 6, prompt: "The Mason-Dixon Line historically divided which two groups of states?", options: ["East Coast and Midwest states", "Northern (free) and Southern (slave) states before the Civil War", "Mountain states and Plains states", "Atlantic and Gulf Coast states"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_h1", topicId: 6, prompt: "Which US state shares a land border with only ONE other US state?", options: ["Alaska", "Hawaii", "Maine", "Florida", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_6_h2", topicId: 6, prompt: "Four US states meet at a single point called 'Four Corners'. Which set of states is correct?", options: ["Arizona, New Mexico, Utah, Nevada", "Colorado, New Mexico, Utah, Arizona", "Colorado, Kansas, Oklahoma, New Mexico", "Arizona, Colorado, Wyoming, Utah", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_h3", topicId: 6, prompt: "Which US state has the most coastline, including its convoluted shoreline of islands and inlets?", options: ["California", "Florida", "Texas", "Alaska", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_6_h4", topicId: 6, prompt: "The Continental Divide runs along the Rocky Mountains, determining which direction rivers flow. Rivers west of it drain into the Pacific; rivers east of it drain into:", options: ["The Arctic Ocean only", "The Atlantic Ocean or Gulf of Mexico", "The Gulf of California only", "The Great Lakes and St. Lawrence River only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_6_h5", topicId: 6, prompt: "Which two US states are NOT part of the contiguous (lower 48) United States?", options: ["Hawaii and Puerto Rico", "Alaska and Hawaii", "Alaska and Guam", "Hawaii and the US Virgin Islands", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        7: [
            MathExamQuestion(id: "geo_7_e1", topicId: 7, prompt: "World's tallest mountain?", options: ["K2", "Aconcagua", "Mount Everest", "Mont Blanc"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e2", topicId: 7, prompt: "The Andes are in:", options: ["Africa", "Europe", "South America", "Asia"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e3", topicId: 7, prompt: "The Alps are in:", options: ["North America", "Asia", "Africa", "Europe"], correctIndex: 3),
            MathExamQuestion(id: "geo_7_e4", topicId: 7, prompt: "Mount Everest is in the:", options: ["Alps", "Himalayas", "Andes", "Rockies"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e5", topicId: 7, prompt: "Africa's highest mountain:", options: ["Mount Kenya", "Kilimanjaro", "Ras Dashen", "Toubkal"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e6", topicId: 7, prompt: "The Rockies run through:", options: ["Brazil and Argentina", "USA and Canada", "UK and France", "Russia and China"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e7", topicId: 7, prompt: "The longest mountain range in the world:", options: ["Himalayas", "Rockies", "Andes", "Alps"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e8", topicId: 7, prompt: "Which country do the Pyrenees separate from Spain?", options: ["Portugal", "Germany", "Italy", "France"], correctIndex: 3),
            MathExamQuestion(id: "geo_7_e9", topicId: 7, prompt: "Mount Everest is on the border of Nepal and:", options: ["India", "Pakistan", "China", "Bhutan"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e10", topicId: 7, prompt: "Which mountain range separates Europe from Asia in Russia?", options: ["Alps", "Caucasus", "Urals", "Himalayas"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e11", topicId: 7, prompt: "K2, the world's second-highest mountain, is on the border of Pakistan and:", options: ["India", "China", "Afghanistan", "Nepal"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e12", topicId: 7, prompt: "The Himalayan mountain range was formed by the collision of the Indian Plate with which other tectonic plate?", options: ["African Plate", "Pacific Plate", "Eurasian Plate", "Arabian Plate"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_e13", topicId: 7, prompt: "The rain shadow effect on the leeward side of a mountain range results in:", options: ["Heavy rainfall and lush vegetation", "Drier conditions because the mountains block moist air", "Colder temperatures than the windward side", "More frequent earthquakes"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e14", topicId: 7, prompt: "The Appalachian Mountains are geologically much older than the Rockies. What evidence supports this?", options: ["The Appalachians are taller and more jagged", "The Appalachians are worn down and rounded by millions of years of erosion", "The Rockies contain older fossils", "The Appalachians were formed by volcanic activity"], correctIndex: 1),
            MathExamQuestion(id: "geo_7_e15", topicId: 7, prompt: "The Karakoram range contains several peaks above 8,000 m. It lies primarily in:", options: ["Nepal and India", "China and Mongolia", "Pakistan, India, and China", "Afghanistan and Tajikistan"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_h1", topicId: 7, prompt: "How many of the world's 14 'eight-thousanders' (peaks above 8,000 m) are located in the Himalaya-Karakoram region?", options: ["8", "10", "12", "14", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_7_h2", topicId: 7, prompt: "The Atacama Desert lies in the rain shadow of which mountain range?", options: ["The Rockies", "The Alps", "The Andes", "The Sierra Madre", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_h3", topicId: 7, prompt: "Fold mountains like the Himalayas and Andes form at convergent plate boundaries. What specifically happens at these boundaries?", options: ["Two oceanic plates pull apart, creating volcanic ridges", "Oceanic crust slides under continental crust, causing volcanoes only", "Two plates collide, and layers of rock are compressed and folded upward", "A continental plate fractures and one block rises relative to the other", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_7_h4", topicId: 7, prompt: "Mount Aconcagua in Argentina is the highest peak outside Asia. It is part of which range and rises to approximately:", options: ["The Andes, approximately 6,960 m", "The Rockies, approximately 6,200 m", "The Andes, approximately 5,500 m", "The Serra do Mar, approximately 6,400 m", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "geo_7_h5", topicId: 7, prompt: "The Tibetan Plateau was uplifted as a result of the same collision that created the Himalayas. Its elevation significantly affects Asian climate by:", options: ["Cooling the Indian Ocean, reducing monsoon intensity", "Acting as a thermal pump that intensifies the South Asian monsoon by heating the atmosphere above it", "Blocking Arctic air from entering South Asia in summer", "Creating persistent low pressure over China that drives Pacific trade winds", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        8: [
            MathExamQuestion(id: "geo_8_e1", topicId: 8, prompt: "Longest river in the world:", options: ["Amazon", "Mississippi", "Nile", "Yangtze"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e2", topicId: 8, prompt: "The Amazon flows through:", options: ["Africa", "Asia", "North America", "South America"], correctIndex: 3),
            MathExamQuestion(id: "geo_8_e3", topicId: 8, prompt: "Largest freshwater lake by area:", options: ["Lake Baikal", "Lake Victoria", "Lake Superior", "Caspian Sea"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e4", topicId: 8, prompt: "The Nile flows into:", options: ["Red Sea", "Black Sea", "Mediterranean Sea", "Indian Ocean"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e5", topicId: 8, prompt: "Where does a river begin?", options: ["Delta", "Mouth", "Estuary", "Source"], correctIndex: 3),
            MathExamQuestion(id: "geo_8_e6", topicId: 8, prompt: "Deepest lake in the world:", options: ["Lake Superior", "Caspian Sea", "Lake Baikal", "Lake Titicaca"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e7", topicId: 8, prompt: "Which river passes through Cairo, Egypt?", options: ["Congo", "Niger", "Nile", "Zambezi"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e8", topicId: 8, prompt: "A delta forms at a river's:", options: ["Source", "Tributary", "Mouth", "Waterfall"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e9", topicId: 8, prompt: "Longest river in Asia:", options: ["Ganges", "Yangtze", "Mekong", "Indus"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_e10", topicId: 8, prompt: "Which African lake is the largest?", options: ["Lake Tanganyika", "Lake Malawi", "Lake Chad", "Lake Victoria"], correctIndex: 3),
            MathExamQuestion(id: "geo_8_e11", topicId: 8, prompt: "The Congo River is the world's deepest river and the second-largest by discharge. It flows into:", options: ["The Indian Ocean", "The Atlantic Ocean", "The Mediterranean Sea", "The Gulf of Guinea"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_e12", topicId: 8, prompt: "Lake Baikal in Russia holds approximately what fraction of the world's unfrozen surface fresh water?", options: ["One tenth", "One fifth", "One quarter", "One third"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_e13", topicId: 8, prompt: "An alluvial fan forms when:", options: ["A river enters a lake and deposits sediment in a fan shape underwater", "A fast-flowing river emerges from mountains onto a flat plain, loses speed, and deposits sediment", "Two rivers merge and create a wide channel", "A river is dammed and sediment accumulates behind the barrier"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_e14", topicId: 8, prompt: "The 'White Nile' and 'Blue Nile' merge at which city to form the main Nile River?", options: ["Cairo", "Luxor", "Khartoum", "Aswan"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_e15", topicId: 8, prompt: "Which is the world's largest lake by surface area, though technically classified as a lake?", options: ["Lake Superior", "Lake Baikal", "Lake Victoria", "Caspian Sea"], correctIndex: 3),
            MathExamQuestion(id: "geo_8_h1", topicId: 8, prompt: "The Amazon River has the world's largest discharge (volume of water). It drains approximately what fraction of South America's total land area?", options: ["One tenth", "One quarter", "Two fifths", "More than half", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_h2", topicId: 8, prompt: "Oxbow lakes form when:", options: ["Glaciers melt and leave depressions in the ground", "A river meander is cut off from the main channel as the river straightens its course", "Tectonic activity creates a graben (sunken block) that fills with water", "Coastal erosion isolates a section of sea behind a sandbar", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_h3", topicId: 8, prompt: "Lake Titicaca, the world's highest navigable lake, is located on the border of Peru and:", options: ["Chile", "Ecuador", "Bolivia", "Argentina", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_8_h4", topicId: 8, prompt: "The Huang He (Yellow River) in China is called the 'cradle of Chinese civilization' but also 'China's Sorrow' because:", options: ["It frequently freezes solid, cutting off water supply", "It carries enormous quantities of yellow silt and has caused catastrophic floods throughout history", "It is too shallow for navigation and causes transport problems", "Its source dries up during droughts, depriving millions of water", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_8_h5", topicId: 8, prompt: "The Aral Sea, once the world's fourth-largest lake, has shrunk to roughly 10% of its original size. The PRIMARY cause was:", options: ["A prolonged regional drought lasting over 50 years", "Soviet-era irrigation projects that diverted the Amu Darya and Syr Darya rivers away from the sea", "Increased evaporation caused by rising global temperatures since 1960", "Seismic activity that opened underground drainage channels", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        9: [
            MathExamQuestion(id: "geo_9_e1", topicId: 9, prompt: "Capital of Germany?", options: ["Munich", "Hamburg", "Frankfurt", "Berlin"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_e2", topicId: 9, prompt: "Capital of Spain?", options: ["Barcelona", "Seville", "Valencia", "Madrid"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_e3", topicId: 9, prompt: "Capital of Italy?", options: ["Milan", "Venice", "Rome", "Naples"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e4", topicId: 9, prompt: "Capital of Greece?", options: ["Corfu", "Thessaloniki", "Athens", "Crete"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e5", topicId: 9, prompt: "Longest river in Europe?", options: ["Rhine", "Danube", "Seine", "Volga"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_e6", topicId: 9, prompt: "Which sea is between Europe and Africa?", options: ["North Sea", "Baltic Sea", "Mediterranean Sea", "Black Sea"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e7", topicId: 9, prompt: "The Alps are shared by France, Switzerland, and:", options: ["Spain", "Italy", "Poland", "UK"], correctIndex: 1),
            MathExamQuestion(id: "geo_9_e8", topicId: 9, prompt: "Capital of Poland?", options: ["Krakow", "Gdansk", "Warsaw", "Lodz"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e9", topicId: 9, prompt: "Which European country is entirely surrounded by Italy?", options: ["Monaco", "Vatican City", "Liechtenstein", "Andorra"], correctIndex: 1),
            MathExamQuestion(id: "geo_9_e10", topicId: 9, prompt: "Capital of Netherlands?", options: ["Rotterdam", "The Hague", "Utrecht", "Amsterdam"], correctIndex: 3),
            MathExamQuestion(id: "geo_9_e11", topicId: 9, prompt: "The Schengen Area allows passport-free travel among most EU countries. Which major EU member is NOT part of Schengen?", options: ["Germany", "France", "Ireland", "Spain"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e12", topicId: 9, prompt: "The Danube River flows through the most countries of any river in the world. How many countries does it pass through?", options: ["6", "8", "10", "14"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e13", topicId: 9, prompt: "Which European microstate is the world's only doubly landlocked country (surrounded by landlocked countries)?", options: ["Monaco", "San Marino", "Liechtenstein", "Vatican City"], correctIndex: 2),
            MathExamQuestion(id: "geo_9_e14", topicId: 9, prompt: "The Balkans region of southeastern Europe gets its name from:", options: ["The Balkan mountain range in Bulgaria", "A Latin term for 'eastern lands'", "A Greek word for 'crossroads'", "The Ottoman term for the region's governors"], correctIndex: 0),
            MathExamQuestion(id: "geo_9_e15", topicId: 9, prompt: "Which European country has the most UNESCO World Heritage Sites?", options: ["France", "Germany", "Greece", "Italy"], correctIndex: 3),
        ],

        10: [
            MathExamQuestion(id: "geo_10_e1", topicId: 10, prompt: "Capital of China?", options: ["Shanghai", "Guangzhou", "Beijing", "Shenzhen"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_e2", topicId: 10, prompt: "Capital of Japan?", options: ["Osaka", "Kyoto", "Hiroshima", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_10_e3", topicId: 10, prompt: "Capital of India?", options: ["Mumbai", "Kolkata", "New Delhi", "Chennai"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_e4", topicId: 10, prompt: "Capital of South Korea?", options: ["Busan", "Incheon", "Seoul", "Daegu"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_e5", topicId: 10, prompt: "Mount Everest is on the border of Nepal and:", options: ["India", "China", "Pakistan", "Bhutan"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e6", topicId: 10, prompt: "The Gobi Desert is in:", options: ["India and Pakistan", "China and Mongolia", "Russia and China", "Afghanistan and Iran"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e7", topicId: 10, prompt: "Japan is described as:", options: ["A landlocked country", "An archipelago (island group)", "A peninsula", "A large mainland country"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e8", topicId: 10, prompt: "Capital of Saudi Arabia?", options: ["Mecca", "Medina", "Jeddah", "Riyadh"], correctIndex: 3),
            MathExamQuestion(id: "geo_10_e9", topicId: 10, prompt: "The Yangtze River is in:", options: ["India", "Japan", "China", "Vietnam"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_e10", topicId: 10, prompt: "Which Asian country has the largest area?", options: ["India", "China", "Russia", "Kazakhstan"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e11", topicId: 10, prompt: "The Mekong River originates in Tibet and flows through six countries before emptying into:", options: ["The Bay of Bengal", "The South China Sea", "The Indian Ocean", "The East China Sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e12", topicId: 10, prompt: "Which country is home to the world's largest Muslim population, surpassing all Middle Eastern nations?", options: ["Pakistan", "Bangladesh", "India", "Indonesia"], correctIndex: 3),
            MathExamQuestion(id: "geo_10_e13", topicId: 10, prompt: "The 'Asian Tigers' refers to the four high-growth economies of:", options: ["China, India, Japan, and South Korea", "Hong Kong, Singapore, South Korea, and Taiwan", "Vietnam, Thailand, Malaysia, and Indonesia", "Japan, China, Taiwan, and Vietnam"], correctIndex: 1),
            MathExamQuestion(id: "geo_10_e14", topicId: 10, prompt: "The Tibetan Plateau is often called the 'Roof of the World.' Its average elevation is approximately:", options: ["1,000 m", "2,500 m", "4,500 m", "7,000 m"], correctIndex: 2),
            MathExamQuestion(id: "geo_10_e15", topicId: 10, prompt: "The Korean Peninsula is divided at approximately the 38th parallel. Which event led to this division?", options: ["World War I peace settlement", "The Korean War armistice (1953) after WWII-era division", "A UN agreement in 1945 before the Korean War", "A Chinese-Soviet agreement in 1950"], correctIndex: 2),
        ],

        11: [
            MathExamQuestion(id: "geo_11_e1", topicId: 11, prompt: "How many African countries?", options: ["44", "49", "54", "60"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e2", topicId: 11, prompt: "Largest desert in the world:", options: ["Kalahari", "Gobi", "Arabian", "Sahara"], correctIndex: 3),
            MathExamQuestion(id: "geo_11_e3", topicId: 11, prompt: "Capital of Egypt?", options: ["Alexandria", "Luxor", "Cairo", "Aswan"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e4", topicId: 11, prompt: "Most populous country in Africa?", options: ["Ethiopia", "Egypt", "Nigeria", "South Africa"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e5", topicId: 11, prompt: "Capital of Kenya?", options: ["Mombasa", "Nairobi", "Kisumu", "Nakuru"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_e6", topicId: 11, prompt: "Africa's highest mountain:", options: ["Mount Kenya", "Ras Dashen", "Kilimanjaro", "Toubkal"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e7", topicId: 11, prompt: "Which ocean borders Africa to the east?", options: ["Atlantic", "Pacific", "Indian", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e8", topicId: 11, prompt: "Capital of South Africa (administrative)?", options: ["Cape Town", "Johannesburg", "Pretoria", "Durban"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e9", topicId: 11, prompt: "The largest island in Africa:", options: ["Zanzibar", "Madagascar", "Comoros", "Mauritius"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_e10", topicId: 11, prompt: "The Congo River is in:", options: ["Nigeria", "DR Congo", "Kenya", "Tanzania"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_e11", topicId: 11, prompt: "The Great Rift Valley runs through eastern Africa and is geologically significant because:", options: ["It marks where Africa and Asia are colliding", "It is a divergent tectonic boundary where Africa is slowly splitting apart", "It was formed by the Sahara expanding southward", "It is a subduction zone where oceanic crust is descending"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_e12", topicId: 11, prompt: "Which country has the largest economy in Africa by GDP?", options: ["South Africa", "Egypt", "Nigeria", "Ethiopia"], correctIndex: 2),
            MathExamQuestion(id: "geo_11_e13", topicId: 11, prompt: "The Sahel is a semi-arid zone south of the Sahara that faces severe desertification. Which combination of factors MOST drives this?", options: ["Only drought and lack of rainfall", "Population pressure, overgrazing, deforestation, and climate variability", "Industrial pollution from North African cities", "Ocean current changes in the Atlantic only"], correctIndex: 1),
            MathExamQuestion(id: "geo_11_e14", topicId: 11, prompt: "Victoria Falls, one of the world's largest waterfalls, is on the border of Zimbabwe and:", options: ["Zambia", "Mozambique", "Tanzania", "Botswana"], correctIndex: 0),
            MathExamQuestion(id: "geo_11_e15", topicId: 11, prompt: "Which African country contains the most pyramids — more even than Egypt?", options: ["Libya", "Sudan", "Ethiopia", "Mali"], correctIndex: 1),
        ],

        12: [
            MathExamQuestion(id: "geo_12_e1", topicId: 12, prompt: "Capital of USA?", options: ["New York", "Chicago", "Washington D.C.", "Los Angeles"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e2", topicId: 12, prompt: "Capital of Canada?", options: ["Toronto", "Vancouver", "Ottawa", "Montreal"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e3", topicId: 12, prompt: "Capital of Brazil?", options: ["Rio de Janeiro", "São Paulo", "Brasília", "Manaus"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e4", topicId: 12, prompt: "Capital of Argentina?", options: ["Montevideo", "Santiago", "Bogotá", "Buenos Aires"], correctIndex: 3),
            MathExamQuestion(id: "geo_12_e5", topicId: 12, prompt: "Longest river in South America:", options: ["Orinoco", "Paraná", "Amazon", "Rio de la Plata"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e6", topicId: 12, prompt: "The Andes run along which coast of South America?", options: ["East", "North", "West", "South"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e7", topicId: 12, prompt: "The Panama Canal connects:", options: ["Atlantic and Indian Oceans", "Pacific and Atlantic Oceans", "Arctic and Pacific Oceans", "Indian and Pacific Oceans"], correctIndex: 1),
            MathExamQuestion(id: "geo_12_e8", topicId: 12, prompt: "Which Caribbean island is the largest?", options: ["Jamaica", "Puerto Rico", "Cuba", "Hispaniola"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e9", topicId: 12, prompt: "The Amazon rainforest is mainly in:", options: ["Colombia", "Peru", "Brazil", "Venezuela"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e10", topicId: 12, prompt: "Capital of Mexico?", options: ["Guadalajara", "Monterrey", "Mexico City", "Tijuana"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e11", topicId: 12, prompt: "Lake Titicaca, the world's highest navigable lake, lies on the border of Peru and:", options: ["Ecuador", "Chile", "Bolivia", "Argentina"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e12", topicId: 12, prompt: "Patagonia, a cold arid plateau, lies in the rain shadow of the Andes at the southern tip of:", options: ["Brazil", "Chile", "Argentina", "Uruguay"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e13", topicId: 12, prompt: "NAFTA (now USMCA) is a free trade agreement between the USA, Canada, and:", options: ["Brazil", "Cuba", "Colombia", "Mexico"], correctIndex: 3),
            MathExamQuestion(id: "geo_12_e14", topicId: 12, prompt: "The Amazon River basin covers roughly what share of South America's land area?", options: ["About 10%", "About 25%", "About 40%", "About 60%"], correctIndex: 2),
            MathExamQuestion(id: "geo_12_e15", topicId: 12, prompt: "The Atacama Desert in Chile is considered the driest non-polar desert because:", options: ["It sits in the rain shadow of the Andes and is cooled by the cold Humboldt Current", "It is close to the South Pole", "Trade winds carry dry air from the Atlantic", "Its high altitude prevents all precipitation"], correctIndex: 0),
        ],

        13: [
            MathExamQuestion(id: "geo_13_e1", topicId: 13, prompt: "The Equator is at:", options: ["90°N", "0° Latitude", "0° Longitude", "180°"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_e2", topicId: 13, prompt: "The Prime Meridian is at:", options: ["90°E", "0° Latitude", "180°", "0° Longitude"], correctIndex: 3),
            MathExamQuestion(id: "geo_13_e3", topicId: 13, prompt: "Latitude lines run:", options: ["North to South", "East to West", "Diagonally", "Around poles"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_e4", topicId: 13, prompt: "The Tropic of Cancer is at:", options: ["0°", "23.5°S", "23.5°N", "66.5°N"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e5", topicId: 13, prompt: "Total degrees of longitude around Earth:", options: ["90°", "180°", "270°", "360°"], correctIndex: 3),
            MathExamQuestion(id: "geo_13_e6", topicId: 13, prompt: "North Pole latitude:", options: ["90°S", "0°", "66.5°N", "90°N"], correctIndex: 3),
            MathExamQuestion(id: "geo_13_e7", topicId: 13, prompt: "The Arctic Circle is at approximately:", options: ["23.5°N", "45°N", "66.5°N", "90°N"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e8", topicId: 13, prompt: "What is 90°S?", options: ["North Pole", "Equator", "South Pole", "Prime Meridian"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e9", topicId: 13, prompt: "The Prime Meridian passes through which city in England?", options: ["London", "Greenwich", "Oxford", "Cambridge"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_e10", topicId: 13, prompt: "The Tropic of Capricorn is in the:", options: ["Northern Hemisphere", "Southern Hemisphere", "On the Equator", "Arctic region"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_e11", topicId: 13, prompt: "A place is located at 34°S, 151°E. In which country is it most likely situated?", options: ["South Africa", "New Zealand", "Australia", "Chile"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e12", topicId: 13, prompt: "When it is noon at 0° longitude, what time is it at 90°E?", options: ["6:00 AM", "6:00 PM", "3:00 PM", "9:00 PM"], correctIndex: 1),
            MathExamQuestion(id: "geo_13_e13", topicId: 13, prompt: "The Antarctic Circle is located at approximately:", options: ["23.5°S", "45°S", "66.5°S", "80°S"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e14", topicId: 13, prompt: "Between the Tropic of Cancer and Tropic of Capricorn, the Sun is directly overhead at least once a year. This zone is called the:", options: ["Temperate Zone", "Polar Zone", "Intertropical Zone (Tropics)", "Subarctic Zone"], correctIndex: 2),
            MathExamQuestion(id: "geo_13_e15", topicId: 13, prompt: "The Prime Meridian was established through Greenwich, England in 1884. Which city hosted the international conference that agreed on this?", options: ["London", "Paris", "Washington D.C.", "Berlin"], correctIndex: 2),
        ],

        14: [
            MathExamQuestion(id: "geo_14_e1", topicId: 14, prompt: "Which biome gets most rainfall?", options: ["Tundra", "Grassland", "Tropical rainforest", "Desert"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e2", topicId: 14, prompt: "Tundra is characterized by:", options: ["Dense trees", "Very hot days", "Frozen ground, few trees", "Tall grasses"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e3", topicId: 14, prompt: "Desert biome has:", options: ["Heavy rain", "Year-round snow", "Very little precipitation", "Dense forest"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e4", topicId: 14, prompt: "Savanna is found mainly in:", options: ["Asia", "Europe", "Africa", "Antarctica"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e5", topicId: 14, prompt: "Permafrost is associated with:", options: ["Desert", "Tropical rainforest", "Temperate forest", "Tundra"], correctIndex: 3),
            MathExamQuestion(id: "geo_14_e6", topicId: 14, prompt: "Boreal forest (taiga) is found mainly in:", options: ["Near equator", "In deserts", "Northern Canada and Russia", "In Antarctica"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e7", topicId: 14, prompt: "Coral reefs are part of which ecosystem?", options: ["Freshwater", "Marine", "Forest", "Grassland"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e8", topicId: 14, prompt: "The Amazon is an example of which biome?", options: ["Temperate forest", "Tropical rainforest", "Savanna", "Boreal forest"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e9", topicId: 14, prompt: "Which biome covers the most land area on Earth?", options: ["Tropical rainforest", "Desert", "Boreal forest", "Grassland"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e10", topicId: 14, prompt: "Mangrove forests are typically found:", options: ["In mountain regions", "In coastal tropical areas", "In polar regions", "In desert oases"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e11", topicId: 14, prompt: "The Wallace Line, separating Asian and Australasian fauna, runs between which two Indonesian islands?", options: ["Sumatra and Java", "Bali and Lombok", "Borneo and Sulawesi", "Java and Borneo"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e12", topicId: 14, prompt: "Biome boundaries are primarily determined by which two climatic factors?", options: ["Wind speed and humidity", "Temperature and precipitation", "Altitude and ocean proximity", "Soil type and sunlight hours"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e13", topicId: 14, prompt: "The productivity of an ecosystem is measured by its NPP (Net Primary Productivity). Which biome has the HIGHEST NPP per unit area?", options: ["Boreal forest", "Tropical grassland", "Tropical rainforest", "Temperate deciduous forest"], correctIndex: 2),
            MathExamQuestion(id: "geo_14_e14", topicId: 14, prompt: "An ecotone is:", options: ["A type of mountain ecosystem", "A transition zone between two adjacent biomes", "A rare plant species in the tundra", "A human-altered ecosystem"], correctIndex: 1),
            MathExamQuestion(id: "geo_14_e15", topicId: 14, prompt: "Which statement BEST explains why trophic cascades matter in ecosystems?", options: ["They describe how energy enters an ecosystem through photosynthesis", "The removal of a top predator can trigger chain reactions that drastically alter the entire ecosystem", "They measure rainfall distribution across biomes", "They track how nutrients recycle through soil"], correctIndex: 1),
        ],

        15: [
            MathExamQuestion(id: "geo_15_e1", topicId: 15, prompt: "Tectonic plates are:", options: ["Atmospheric layers", "Large pieces of Earth's crust", "Types of rock", "Ocean trenches"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_e2", topicId: 15, prompt: "When plates collide, they form:", options: ["Oceans", "Mountains or volcanoes", "Deserts", "Plains"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_e3", topicId: 15, prompt: "The Ring of Fire surrounds:", options: ["Atlantic", "Indian", "Pacific", "Arctic"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_e4", topicId: 15, prompt: "A fault line is:", options: ["A type of mountain", "A crack where plates meet", "An underground river", "A weather front"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_e5", topicId: 15, prompt: "Earthquakes are caused by:", options: ["Heavy rain", "Sudden plate movement", "Volcanic gas", "Ocean warming"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_e6", topicId: 15, prompt: "The Richter scale measures:", options: ["Wind speed", "Tsunami height", "Earthquake magnitude", "Volcano eruption"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_e7", topicId: 15, prompt: "The ancient supercontinent is called:", options: ["Atlantis", "Laurasia", "Pangaea", "Gondwana"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_e8", topicId: 15, prompt: "A tsunami is usually caused by:", options: ["High winds", "Underwater earthquakes", "Tidal changes", "Sea storms"], correctIndex: 1),
            MathExamQuestion(id: "geo_15_e9", topicId: 15, prompt: "When plates move apart, they create:", options: ["Mountains", "Volcanoes at the boundary", "Mid-ocean ridges", "Deserts"], correctIndex: 2),
            MathExamQuestion(id: "geo_15_e10", topicId: 15, prompt: "Continental drift was proposed by:", options: ["Isaac Newton", "Charles Darwin", "Alfred Wegener", "Albert Einstein"], correctIndex: 2),
        ],

        16: [
            MathExamQuestion(id: "geo_16_e1", topicId: 16, prompt: "World's largest oil exporter:", options: ["Russia", "USA", "Saudi Arabia", "Iran"], correctIndex: 2),
            MathExamQuestion(id: "geo_16_e2", topicId: 16, prompt: "A natural resource is:", options: ["A factory product", "A raw material found in nature", "A type of currency", "An imported good"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e3", topicId: 16, prompt: "Brazil leads the world in exporting:", options: ["Oil", "Coffee", "Wheat", "Gold"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e4", topicId: 16, prompt: "GDP measures:", options: ["Total population", "Value of goods/services produced", "Country's army size", "Number of exports"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e5", topicId: 16, prompt: "Which is a renewable resource?", options: ["Coal", "Natural gas", "Oil", "Solar energy"], correctIndex: 3),
            MathExamQuestion(id: "geo_16_e6", topicId: 16, prompt: "Importing means:", options: ["Selling to other countries", "Buying from other countries", "Producing locally", "Shipping by sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e7", topicId: 16, prompt: "The Silk Road connected:", options: ["Africa and America", "Europe and Asia", "N and S America", "Australia and Asia"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e8", topicId: 16, prompt: "Top producer of diamonds:", options: ["South Africa", "Australia", "Russia", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_16_e9", topicId: 16, prompt: "A Free Trade Agreement reduces:", options: ["All trade", "Trade barriers between countries", "Import taxes within one country", "Military costs"], correctIndex: 1),
            MathExamQuestion(id: "geo_16_e10", topicId: 16, prompt: "Coal is a non-renewable resource because:", options: ["It is hard to find", "It forms over millions of years and is used faster than replaced", "It is expensive", "It cannot be transported"], correctIndex: 1),
        ],

        17: [
            MathExamQuestion(id: "geo_17_e1", topicId: 17, prompt: "Population density is:", options: ["World total population", "People per unit area", "Rate of population growth", "Age distribution"], correctIndex: 1),
            MathExamQuestion(id: "geo_17_e2", topicId: 17, prompt: "Most populated continent:", options: ["Europe", "Africa", "North America", "Asia"], correctIndex: 3),
            MathExamQuestion(id: "geo_17_e3", topicId: 17, prompt: "Urbanization refers to:", options: ["Rural growth", "People moving to cities", "Reducing city sizes", "Farming in cities"], correctIndex: 1),
            MathExamQuestion(id: "geo_17_e4", topicId: 17, prompt: "World's most populous city:", options: ["New York", "Shanghai", "Mumbai", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_17_e5", topicId: 17, prompt: "Approximate world population today:", options: ["5 billion", "6 billion", "8 billion", "10 billion"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_e6", topicId: 17, prompt: "Sparsely populated areas include:", options: ["Coastal plains", "River deltas", "Deserts and polar regions", "Major cities"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_e7", topicId: 17, prompt: "A push factor for migration is:", options: ["Job opportunities elsewhere", "Good climate elsewhere", "War in the home country", "New school nearby"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_e8", topicId: 17, prompt: "World's most populous country:", options: ["USA", "Indonesia", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_e9", topicId: 17, prompt: "Highest population growth rate region:", options: ["Europe", "North America", "Africa", "East Asia"], correctIndex: 2),
            MathExamQuestion(id: "geo_17_e10", topicId: 17, prompt: "A pull factor for migration is:", options: ["War at home", "Lack of jobs", "Good job opportunities elsewhere", "Natural disaster"], correctIndex: 2),
        ],

        18: [
            MathExamQuestion(id: "geo_18_e1", topicId: 18, prompt: "Main greenhouse gas:", options: ["Oxygen", "Nitrogen", "Carbon dioxide", "Helium"], correctIndex: 2),
            MathExamQuestion(id: "geo_18_e2", topicId: 18, prompt: "Greenhouse effect means:", options: ["Growing plants in glass", "Heat trapped by atmospheric gases", "Cooling of Earth", "Wind patterns"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e3", topicId: 18, prompt: "Rising sea levels are caused by:", options: ["More rain", "Melting ice caps", "Earthquakes", "More ships"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e4", topicId: 18, prompt: "The Paris Agreement aims to limit warming to:", options: ["0.5°C", "1.5–2°C", "3°C", "5°C"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e5", topicId: 18, prompt: "Leading cause of current climate change:", options: ["Farming", "Burning fossil fuels", "Tourism", "Mining"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e6", topicId: 18, prompt: "Deforestation worsens climate change because:", options: ["Trees produce CO₂", "Fewer trees absorb less CO₂", "Cutting trees cools the ground", "Forests block wind"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e7", topicId: 18, prompt: "Nation most threatened by sea level rise:", options: ["Nepal", "Switzerland", "Maldives", "Bolivia"], correctIndex: 2),
            MathExamQuestion(id: "geo_18_e8", topicId: 18, prompt: "El Niño affects:", options: ["European winters", "Pacific Ocean temperatures and global weather", "African monsoons only", "Arctic ice only"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e9", topicId: 18, prompt: "Carbon footprint measures:", options: ["Coal mine footprints", "Total greenhouse gases from an activity", "Land used by a country", "Types of fossil fuels"], correctIndex: 1),
            MathExamQuestion(id: "geo_18_e10", topicId: 18, prompt: "Hydroelectric power uses:", options: ["Solar energy", "Wind", "Moving water", "Geothermal heat"], correctIndex: 2),
        ],

        19: [
            MathExamQuestion(id: "geo_19_e1", topicId: 19, prompt: "UN member states:", options: ["150", "175", "193", "210"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_e2", topicId: 19, prompt: "A landlocked country has:", options: ["No mountains", "No sea access", "Very long coastline", "Island territory"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_e3", topicId: 19, prompt: "Strait of Hormuz is critical for:", options: ["Gold trade", "Wheat exports", "Oil shipping", "Diamond trade"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_e4", topicId: 19, prompt: "WTO deals with:", options: ["Military alliances", "Environmental laws", "World trade rules", "Health regulations"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_e5", topicId: 19, prompt: "NATO is a:", options: ["Trade organization", "Environmental treaty", "Military alliance", "Economic union"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_e6", topicId: 19, prompt: "Largest country by area:", options: ["Canada", "USA", "China", "Russia"], correctIndex: 3),
            MathExamQuestion(id: "geo_19_e7", topicId: 19, prompt: "The Suez Canal connects:", options: ["Red Sea and Indian Ocean", "Mediterranean Sea and Red Sea", "Black Sea and Caspian", "Atlantic and Pacific"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_e8", topicId: 19, prompt: "Antarctica is governed by:", options: ["USA", "UN exclusively", "International Antarctic Treaty", "No governance exists"], correctIndex: 2),
            MathExamQuestion(id: "geo_19_e9", topicId: 19, prompt: "Soft power is:", options: ["Military force", "Influencing through culture and diplomacy", "Economic sanctions", "Nuclear weapons"], correctIndex: 1),
            MathExamQuestion(id: "geo_19_e10", topicId: 19, prompt: "A buffer state lies:", options: ["Between two larger rival nations", "On a coastline", "Near the equator", "In a mountain range"], correctIndex: 0),
        ],

        20: [
            MathExamQuestion(id: "geo_20_e1", topicId: 20, prompt: "Earth has how many time zones?", options: ["12", "18", "24", "30"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_e2", topicId: 20, prompt: "GMT stands for:", options: ["Global Map Time", "Greenwich Mean Time", "General Meridian Time", "Global Military Time"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_e3", topicId: 20, prompt: "The Mercator projection distorts:", options: ["Oceans", "Landmasses near the poles", "Country borders", "River lengths"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_e4", topicId: 20, prompt: "HDI is provided by:", options: ["World Bank", "UNDP", "WHO", "WTO"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_e5", topicId: 20, prompt: "BRICS stands for Brazil, Russia, India, China, and:", options: ["Spain", "Sweden", "South Africa", "Singapore"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_e6", topicId: 20, prompt: "The International Date Line is at approximately:", options: ["0° longitude", "90° East", "180° longitude", "90° West"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_e7", topicId: 20, prompt: "The Gini coefficient measures:", options: ["Military strength", "Income inequality", "Carbon emissions", "Agricultural output"], correctIndex: 1),
            MathExamQuestion(id: "geo_20_e8", topicId: 20, prompt: "Country with most time zones:", options: ["Russia", "USA", "China", "France"], correctIndex: 3),
            MathExamQuestion(id: "geo_20_e9", topicId: 20, prompt: "'Global South' refers to:", options: ["Antarctica", "Only Southern Hemisphere", "Developing nations mainly in Asia, Africa, Latin America", "Countries below equator"], correctIndex: 2),
            MathExamQuestion(id: "geo_20_e10", topicId: 20, prompt: "The Bering Strait separates:", options: ["Europe and Africa", "Asia and North America", "North and South America", "Australia and Asia"], correctIndex: 1),
        ],

        21: [
            MathExamQuestion(id: "geo_21_e1", topicId: 21, prompt: "An earthquake is caused by:", options: ["Heavy rainfall", "Tectonic plate movement", "Volcanic gas only", "Ocean warming"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e2", topicId: 21, prompt: "A tsunami is most commonly triggered by:", options: ["Strong wind", "Heavy rain", "Underwater earthquake", "A tornado"], correctIndex: 2),
            MathExamQuestion(id: "geo_21_e3", topicId: 21, prompt: "The Richter scale measures:", options: ["Wind speed", "Earthquake magnitude", "Tsunami height", "Flood depth"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e4", topicId: 21, prompt: "Hurricanes need which conditions to form?", options: ["Cold land surfaces", "Warm ocean water", "Dry desert air", "Mountain terrain"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e5", topicId: 21, prompt: "Lava is:", options: ["Ash ejected by a volcano", "Molten rock on Earth's surface from a volcano", "Underground hot water", "An earthquake shockwave"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e6", topicId: 21, prompt: "The Ring of Fire is associated with:", options: ["Tornadoes and floods", "Droughts and heatwaves", "Earthquakes and volcanoes", "Blizzards and ice storms"], correctIndex: 2),
            MathExamQuestion(id: "geo_21_e7", topicId: 21, prompt: "Tornadoes are most common in:", options: ["Australia", "Japan", "UK", "USA"], correctIndex: 3),
            MathExamQuestion(id: "geo_21_e8", topicId: 21, prompt: "A flood occurs when:", options: ["Volcanoes erupt", "Land is submerged under water", "Strong winds hit coastal areas", "Extreme cold freezes rivers"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e9", topicId: 21, prompt: "The Saffir-Simpson scale measures:", options: ["Earthquake strength", "Hurricane intensity", "Tsunami wave height", "Tornado wind speed"], correctIndex: 1),
            MathExamQuestion(id: "geo_21_e10", topicId: 21, prompt: "A pyroclastic flow is:", options: ["A large flood wave", "A fast-moving cloud of hot gas and volcanic matter", "A type of earthquake", "A slow-moving lava stream"], correctIndex: 1),
        ],

        22: [
            MathExamQuestion(id: "geo_22_e1", topicId: 22, prompt: "A desert receives less than how much rain per year?", options: ["25 mm", "250 mm", "500 mm", "1,000 mm"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_e2", topicId: 22, prompt: "Largest hot desert:", options: ["Gobi", "Arabian", "Sahara", "Australian"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_e3", topicId: 22, prompt: "The Gobi Desert is in:", options: ["India and Pakistan", "China and Mongolia", "Russia and China", "Central Asia only"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_e4", topicId: 22, prompt: "The Atacama Desert is in:", options: ["Africa", "Australia", "South America", "North America"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_e5", topicId: 22, prompt: "The world's largest desert overall is:", options: ["Sahara", "Gobi", "Arabian", "Antarctica"], correctIndex: 3),
            MathExamQuestion(id: "geo_22_e6", topicId: 22, prompt: "The Namib Desert is in:", options: ["Asia", "South America", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_22_e7", topicId: 22, prompt: "An oasis is:", options: ["A desert storm", "A fertile spot with water in a desert", "A type of sand dune", "A desert predator"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_e8", topicId: 22, prompt: "Desertification is:", options: ["Natural desert formation only", "Fertile land turning to desert, often due to human activity", "A sandstorm", "Studying desert animals"], correctIndex: 1),
            MathExamQuestion(id: "geo_22_e9", topicId: 22, prompt: "Which plant is well adapted to hot deserts?", options: ["Pine", "Oak", "Cactus", "Fern"], correctIndex: 2),
            MathExamQuestion(id: "geo_22_e10", topicId: 22, prompt: "The Arabian Desert lies mainly in:", options: ["East Africa", "The Middle East", "Central Asia", "South Asia"], correctIndex: 1),
        ],

        23: [
            MathExamQuestion(id: "geo_23_e1", topicId: 23, prompt: "Capital of Saudi Arabia:", options: ["Mecca", "Jeddah", "Riyadh", "Medina"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_e2", topicId: 23, prompt: "Dominant religion of the Middle East:", options: ["Christianity", "Buddhism", "Hinduism", "Islam"], correctIndex: 3),
            MathExamQuestion(id: "geo_23_e3", topicId: 23, prompt: "The Middle East's most important export resource:", options: ["Diamonds", "Timber", "Oil and gas", "Wheat"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_e4", topicId: 23, prompt: "Capital of Iran:", options: ["Isfahan", "Shiraz", "Mashhad", "Tehran"], correctIndex: 3),
            MathExamQuestion(id: "geo_23_e5", topicId: 23, prompt: "The Euphrates River flows through:", options: ["Iran and Egypt", "Iraq and Syria", "Turkey and Israel", "Jordan and Saudi Arabia"], correctIndex: 1),
            MathExamQuestion(id: "geo_23_e6", topicId: 23, prompt: "Capital of Turkey:", options: ["Istanbul", "Izmir", "Ankara", "Bursa"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_e7", topicId: 23, prompt: "The Red Sea separates:", options: ["Europe and Africa", "The Arabian Peninsula and Africa", "Asia and Australia", "Iran and Iraq"], correctIndex: 1),
            MathExamQuestion(id: "geo_23_e8", topicId: 23, prompt: "Capital of the UAE:", options: ["Dubai", "Sharjah", "Abu Dhabi", "Doha"], correctIndex: 2),
            MathExamQuestion(id: "geo_23_e9", topicId: 23, prompt: "OPEC stands for:", options: ["Organisation of Petroleum Exporting Countries", "Oil Producing and Exporting Consortium", "Organisation of Pacific Energy Countries", "Oil and Power Economic Commission"], correctIndex: 0),
            MathExamQuestion(id: "geo_23_e10", topicId: 23, prompt: "Jerusalem is considered holy by how many major religions?", options: ["One", "Two", "Three", "Four"], correctIndex: 2),
        ],

        24: [
            MathExamQuestion(id: "geo_24_e1", topicId: 24, prompt: "Capital of Vietnam:", options: ["Ho Chi Minh City", "Da Nang", "Hanoi", "Hue"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e2", topicId: 24, prompt: "Most populous Southeast Asian country:", options: ["Philippines", "Vietnam", "Thailand", "Indonesia"], correctIndex: 3),
            MathExamQuestion(id: "geo_24_e3", topicId: 24, prompt: "Capital of Thailand:", options: ["Chiang Mai", "Phuket", "Bangkok", "Pattaya"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e4", topicId: 24, prompt: "Capital of the Philippines:", options: ["Cebu", "Davao", "Manila", "Quezon City"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e5", topicId: 24, prompt: "Capital of Cambodia:", options: ["Siem Reap", "Phnom Penh", "Battambang", "Kampot"], correctIndex: 1),
            MathExamQuestion(id: "geo_24_e6", topicId: 24, prompt: "Capital of Indonesia:", options: ["Bali", "Surabaya", "Bandung", "Jakarta"], correctIndex: 3),
            MathExamQuestion(id: "geo_24_e7", topicId: 24, prompt: "Angkor Wat is in:", options: ["Thailand", "Vietnam", "Cambodia", "Myanmar"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e8", topicId: 24, prompt: "The island of Borneo is shared by Malaysia, Indonesia, and:", options: ["Thailand", "Philippines", "Brunei", "Vietnam"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e9", topicId: 24, prompt: "Singapore is best described as:", options: ["A large agricultural country", "A landlocked mountain country", "A global financial city-state", "A major oil exporter"], correctIndex: 2),
            MathExamQuestion(id: "geo_24_e10", topicId: 24, prompt: "The Mekong River does NOT flow through:", options: ["Vietnam", "Cambodia", "Philippines", "Laos"], correctIndex: 2),
        ],

        25: [
            MathExamQuestion(id: "geo_25_e1", topicId: 25, prompt: "Capital of New Zealand:", options: ["Auckland", "Christchurch", "Wellington", "Hamilton"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_e2", topicId: 25, prompt: "Papua New Guinea is on the island of:", options: ["Borneo", "New Guinea", "Sumatra", "Java"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_e3", topicId: 25, prompt: "Capital of Fiji:", options: ["Nadi", "Lautoka", "Suva", "Labasa"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_e4", topicId: 25, prompt: "New Zealand's indigenous people:", options: ["Aborigines", "Maori", "Polynesian", "Melanesian"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_e5", topicId: 25, prompt: "A major threat to low-lying Pacific island nations:", options: ["Extreme cold", "Overpopulation", "Rising sea levels", "Lack of sunshine"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_e6", topicId: 25, prompt: "Capital of Samoa:", options: ["Pago Pago", "Nuku'alofa", "Apia", "Honiara"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_e7", topicId: 25, prompt: "Capital of Papua New Guinea:", options: ["Lae", "Madang", "Port Moresby", "Wewak"], correctIndex: 2),
            MathExamQuestion(id: "geo_25_e8", topicId: 25, prompt: "New Zealand's two main islands are:", options: ["East and West", "North and South", "Upper and Lower", "Greater and Lesser"], correctIndex: 1),
            MathExamQuestion(id: "geo_25_e9", topicId: 25, prompt: "Australia's Indigenous people are known as:", options: ["Maori", "Melanesian", "Polynesian", "Aboriginal Australians"], correctIndex: 3),
            MathExamQuestion(id: "geo_25_e10", topicId: 25, prompt: "Which ocean surrounds Pacific island nations?", options: ["Atlantic", "Indian", "Pacific", "Arctic"], correctIndex: 2),
        ],

        26: [
            MathExamQuestion(id: "geo_26_e1", topicId: 26, prompt: "A megacity has a population of:", options: ["1 million+", "5 million+", "10 million+", "50 million+"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_e2", topicId: 26, prompt: "Urbanisation is:", options: ["City populations declining", "People moving to cities", "Building rural roads", "Urban farming"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_e3", topicId: 26, prompt: "A push factor for rural-urban migration:", options: ["Better hospitals in city", "Lack of jobs in rural area", "City entertainment", "City climate"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_e4", topicId: 26, prompt: "Shanty towns are:", options: ["Planned government housing", "Poor-quality informal settlements", "Expensive high-rise blocks", "Tourist resorts"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_e5", topicId: 26, prompt: "World's most populous city:", options: ["New York", "Mumbai", "Shanghai", "Tokyo"], correctIndex: 3),
            MathExamQuestion(id: "geo_26_e6", topicId: 26, prompt: "CBD stands for:", options: ["Central Building District", "Central Business District", "City Border Division", "Commercial Border Department"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_e7", topicId: 26, prompt: "Fastest urbanising continent:", options: ["Europe", "North America", "Africa", "Australia"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_e8", topicId: 26, prompt: "A conurbation is:", options: ["A type of slum", "Cities that grow and merge together", "A planned garden city", "A historical city centre"], correctIndex: 1),
            MathExamQuestion(id: "geo_26_e9", topicId: 26, prompt: "Gentrification means:", options: ["Factory building in housing areas", "City centre decline", "Wealthier people renovating a poorer urban area", "Moving people out of cities"], correctIndex: 2),
            MathExamQuestion(id: "geo_26_e10", topicId: 26, prompt: "A pull factor for moving to cities is:", options: ["War at home", "Crop failure", "Better job opportunities", "Flooding of farmland"], correctIndex: 2),
        ],

        27: [
            MathExamQuestion(id: "geo_27_e1", topicId: 27, prompt: "Subsistence farming produces:", options: ["Crops for large-scale export", "Just enough food for the farmer's family", "Fuel crops", "Cash crops only"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e2", topicId: 27, prompt: "Commercial farming is:", options: ["Small-scale family farming", "Large-scale farming for profit and sale", "Farming only with organic methods", "Greenhouse farming"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e3", topicId: 27, prompt: "The Green Revolution increased food production mainly through:", options: ["Reducing population", "New high-yield crops and fertilisers", "Importing food", "Converting deserts"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e4", topicId: 27, prompt: "Food security means:", options: ["Locking your food cupboard", "All people having reliable access to enough nutritious food", "Storing food in an emergency", "Only wealthy nations having food"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e5", topicId: 27, prompt: "Pastoral farming involves:", options: ["Growing wheat", "Rearing animals for meat, wool, or milk", "Growing rice in paddies", "Planting fruit trees"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e6", topicId: 27, prompt: "Irrigation is:", options: ["Pest control", "Artificially supplying water to crops", "A food storage method", "A crop rotation technique"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e7", topicId: 27, prompt: "Rice grows best in which climate?", options: ["Desert", "Polar", "Tropical monsoon / humid", "Mediterranean"], correctIndex: 2),
            MathExamQuestion(id: "geo_27_e8", topicId: 27, prompt: "World's largest wheat producer:", options: ["USA", "Brazil", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_27_e9", topicId: 27, prompt: "Monoculture means:", options: ["Growing many crops together", "Growing a single crop over a large area", "Mixing crops and livestock", "Chemical-free farming"], correctIndex: 1),
            MathExamQuestion(id: "geo_27_e10", topicId: 27, prompt: "Which continent faces the most severe food insecurity?", options: ["Europe", "North America", "Australia", "Africa"], correctIndex: 3),
        ],

        28: [
            MathExamQuestion(id: "geo_28_e1", topicId: 28, prompt: "Which is a fossil fuel?", options: ["Solar energy", "Wind energy", "Natural gas", "Hydroelectric power"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_e2", topicId: 28, prompt: "OPEC stands for:", options: ["Organisation of Petroleum Exporting Countries", "Oil Producing and Exporting Coalition", "Organisation of Pacific Energy Countries", "Oil and Power Economic Commission"], correctIndex: 0),
            MathExamQuestion(id: "geo_28_e3", topicId: 28, prompt: "Geothermal energy comes from:", options: ["Sunlight", "Wind", "Heat inside the Earth", "Moving water"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_e4", topicId: 28, prompt: "Energy security means:", options: ["Locking power stations", "Reliable access to affordable energy", "Using only renewables", "Exporting surplus energy"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_e5", topicId: 28, prompt: "Top solar energy producer:", options: ["Germany", "USA", "China", "India"], correctIndex: 2),
            MathExamQuestion(id: "geo_28_e6", topicId: 28, prompt: "Fossil fuels are non-renewable because:", options: ["Too expensive", "Take millions of years to form and are used faster", "Found in one country only", "Produce no energy"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_e7", topicId: 28, prompt: "Which is a renewable energy source?", options: ["Coal", "Oil", "Natural gas", "Wind power"], correctIndex: 3),
            MathExamQuestion(id: "geo_28_e8", topicId: 28, prompt: "The Middle East is energy-important because:", options: ["Most wind farms", "Holds vast oil reserves", "Most solar energy", "Exports most coal"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_e9", topicId: 28, prompt: "Hydroelectric power uses:", options: ["Burning water", "Water moving through turbines", "Solar heating water", "Wind pushing water"], correctIndex: 1),
            MathExamQuestion(id: "geo_28_e10", topicId: 28, prompt: "Main greenhouse gas from burning fossil fuels:", options: ["Oxygen", "Nitrogen", "Carbon dioxide (CO₂)", "Hydrogen"], correctIndex: 2),
        ],

        29: [
            MathExamQuestion(id: "geo_29_e1", topicId: 29, prompt: "The Silk Road connected:", options: ["Africa and America", "Europe and Asia", "North and South America", "Australia and Asia"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_e2", topicId: 29, prompt: "The Suez Canal connects the Mediterranean Sea with:", options: ["Black Sea", "Caspian Sea", "Red Sea", "Persian Gulf"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_e3", topicId: 29, prompt: "The Panama Canal connects:", options: ["Atlantic and Indian Oceans", "Pacific and Arctic Oceans", "Atlantic and Pacific Oceans", "Indian and Pacific Oceans"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_e4", topicId: 29, prompt: "The Strait of Malacca lies between:", options: ["Europe and Africa", "Malaysia and Indonesia", "Japan and South Korea", "India and Sri Lanka"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_e5", topicId: 29, prompt: "Approximately what share of world trade travels by sea?", options: ["About 40%", "About 60%", "About 80%", "About 90%"], correctIndex: 3),
            MathExamQuestion(id: "geo_29_e6", topicId: 29, prompt: "International trade rules are overseen by:", options: ["UN", "NATO", "WTO", "IMF"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_e7", topicId: 29, prompt: "The Strait of Hormuz controls access to oil from:", options: ["North Sea", "Persian Gulf", "Gulf of Mexico", "Caspian Sea"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_e8", topicId: 29, prompt: "Air freight is preferred for goods that are:", options: ["Heavy and bulky", "Cheap and non-perishable", "High-value or time-sensitive", "Destined for nearby countries only"], correctIndex: 2),
            MathExamQuestion(id: "geo_29_e9", topicId: 29, prompt: "China's modern Belt and Road Initiative is:", options: ["A high-speed rail network in China only", "A global infrastructure and trade route project", "A military alliance", "An environmental treaty"], correctIndex: 1),
            MathExamQuestion(id: "geo_29_e10", topicId: 29, prompt: "Container ships carry:", options: ["Passengers", "Standardised shipping containers of goods", "Oil in bulk", "Military equipment only"], correctIndex: 1),
        ],

        30: [
            MathExamQuestion(id: "geo_30_e1", topicId: 30, prompt: "Most widely spoken native language:", options: ["English", "Spanish", "Mandarin Chinese", "Hindi"], correctIndex: 2),
            MathExamQuestion(id: "geo_30_e2", topicId: 30, prompt: "World's largest religion by followers:", options: ["Islam", "Christianity", "Hinduism", "Buddhism"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_e3", topicId: 30, prompt: "Globalisation refers to:", options: ["Countries becoming isolated", "Increasing interconnection of world economies, cultures, populations", "Spread of one language only", "Only growth in trade"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_e4", topicId: 30, prompt: "Cultural diffusion is:", options: ["Extinction of a culture", "Spread of cultural elements from one place to another", "Government control of culture", "Building museums"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_e5", topicId: 30, prompt: "The main language of international business and diplomacy:", options: ["French", "Spanish", "Arabic", "English"], correctIndex: 3),
            MathExamQuestion(id: "geo_30_e6", topicId: 30, prompt: "A risk of globalisation for local cultures:", options: ["Better communication", "Increased trade", "Loss of traditional languages and customs", "Better technology access"], correctIndex: 2),
            MathExamQuestion(id: "geo_30_e7", topicId: 30, prompt: "A cultural region is an area where people:", options: ["All speak the same language", "Share similar cultural traits (language, religion, customs)", "Have identical governments", "Have the same economic activity"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_e8", topicId: 30, prompt: "Which continent has the greatest linguistic diversity?", options: ["Asia", "Europe", "North America", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "geo_30_e9", topicId: 30, prompt: "UNESCO World Heritage Sites are:", options: ["Only ancient ruins", "Sites of outstanding natural or cultural value to humanity", "Only natural landscapes", "Military monuments"], correctIndex: 1),
            MathExamQuestion(id: "geo_30_e10", topicId: 30, prompt: "Why might Spanish be spoken across Latin America?", options: ["Trade agreements", "Colonial history  -  Spanish colonisation", "A UN language policy", "Geographical proximity to Spain"], correctIndex: 1),
        ],

        31: [
        MathExamQuestion(id: "geo_31_e1", topicId: 31, prompt: "Which map projection was historically used by European sailors because it preserves compass directions as straight lines?", options: ["Peters", "Mercator", "Goode's Homolosine", "Azimuthal equidistant"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e2", topicId: 31, prompt: "A map that preserves the correct shape of small areas but distorts size is called:", options: ["Equal-area", "Conformal", "Equidistant", "Azimuthal"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e3", topicId: 31, prompt: "On a Mercator projection, Africa appears smaller than Greenland. In reality, Africa is approximately how many times larger?", options: ["2 times", "7 times", "14 times", "Equal in size"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_e4", topicId: 31, prompt: "Which projection is often preferred in classrooms to show a fairer representation of country sizes?", options: ["Mercator", "Peters (Gall-Peters)", "Stereographic", "Conic"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e5", topicId: 31, prompt: "Why is it impossible to create a map that is 100% accurate?", options: ["Mapmakers don't have enough funding", "You cannot unfold a sphere onto a flat surface without some distortion", "Computers are not powerful enough", "All countries keep changing shape"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e6", topicId: 31, prompt: "An azimuthal projection is centred on a single point. It is most often used to show:", options: ["The entire world at once", "One specific pole or region from above", "River systems", "Ocean shipping lanes only"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e7", topicId: 31, prompt: "The Robinson projection is known for:", options: ["Being perfectly equal-area", "Being perfectly conformal", "Being a compromise that reduces overall distortion", "Showing only the southern hemisphere"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_e8", topicId: 31, prompt: "Which of the following projections was developed as a political statement to show the true size of developing nations?", options: ["Mercator", "Winkel Tripel", "Peters (Gall-Peters)", "Lambert"], correctIndex: 2),
        MathExamQuestion(id: "geo_31_e9", topicId: 31, prompt: "The three main properties that map projections can preserve are shape, area, and:", options: ["Colour", "Distance", "Population", "Climate"], correctIndex: 1),
        MathExamQuestion(id: "geo_31_e10", topicId: 31, prompt: "A conic projection is made by:", options: ["Wrapping a cylinder around the globe", "Pressing the globe onto a flat circle", "Wrapping a cone around the globe and unrolling it", "Photographing the Earth from space"], correctIndex: 2),
    ],

    32: [
        MathExamQuestion(id: "geo_32_e1", topicId: 32, prompt: "A cartogram is a type of thematic map where:", options: ["Countries are drawn to show physical elevation", "Areas are resized according to a variable such as population or GDP", "Only oceans are coloured", "It uses 3D graphics to show terrain"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_e2", topicId: 32, prompt: "Which thematic map type uses symbols of different sizes to represent quantities at specific locations?", options: ["Choropleth", "Flow map", "Proportional symbol map", "Isoline map"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_e3", topicId: 32, prompt: "An isoline (isopleth) map connects points of equal value with lines. Which common map uses this technique?", options: ["Dot distribution map", "Topographic contour map", "Political map", "Choropleth map"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_e4", topicId: 32, prompt: "A flow map is best used to show:", options: ["Temperature zones", "Population density", "Migration patterns or trade routes", "Land elevation"], correctIndex: 2),
        MathExamQuestion(id: "geo_32_e5", topicId: 32, prompt: "One limitation of a choropleth map is that it:", options: ["Cannot use colour", "Assumes the entire region has the same value, hiding variation within zones", "Only works for population data", "Cannot include a legend"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_e6", topicId: 32, prompt: "A bivariate map shows:", options: ["Two variables at once using a combined colour scheme", "One variable across two countries", "Only two colours", "A comparison of two time periods on separate maps"], correctIndex: 0),
        MathExamQuestion(id: "geo_32_e7", topicId: 32, prompt: "Which thematic map would be most useful to show deforestation rates by country?", options: ["Flow map", "Choropleth map", "Cartogram", "Dot map"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_e8", topicId: 32, prompt: "In a choropleth map, data is usually classified into groups. Why is the choice of classification method important?", options: ["It changes the shape of the countries shown", "Different classifications can make the same data look very different, affecting interpretation", "It determines the projection used", "It controls how many countries appear"], correctIndex: 1),
        MathExamQuestion(id: "geo_32_e9", topicId: 32, prompt: "A resource map might use different symbols to represent coal, oil, and gold deposits. What type of thematic map is this?", options: ["Qualitative symbol map", "Choropleth map", "Isoline map", "Flow map"], correctIndex: 0),
        MathExamQuestion(id: "geo_32_e10", topicId: 32, prompt: "What is the purpose of a map legend (key)?", options: ["To show where north is", "To explain what the symbols, colours, or shading on the map mean", "To list the cartographer's name", "To show elevation levels only"], correctIndex: 1),
    ],

    33: [
        MathExamQuestion(id: "geo_33_e1", topicId: 33, prompt: "A map has a representative fraction of 1:50,000. If a road measures 6 cm on the map, how long is it in reality?", options: ["3 km", "30 km", "300 km", "0.3 km"], correctIndex: 0),
        MathExamQuestion(id: "geo_33_e2", topicId: 33, prompt: "Which type of scale is most useful when a map is photocopied at a different size?", options: ["Representative fraction (1:50,000)", "Verbal scale ('1 cm = 5 km')", "Graphic/bar scale", "Grid scale"], correctIndex: 2),
        MathExamQuestion(id: "geo_33_e3", topicId: 33, prompt: "On a 1:25,000 OS map, 4 cm represents how many kilometres on the ground?", options: ["0.25 km", "1 km", "4 km", "25 km"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_e4", topicId: 33, prompt: "Two cities are 450 km apart. On a map with scale 1:9,000,000, how far apart will they appear?", options: ["0.5 cm", "5 cm", "50 cm", "45 cm"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_e5", topicId: 33, prompt: "A large-scale map (e.g. 1:1,250) is most suitable for:", options: ["Showing an entire continent", "Planning a city block or architectural site", "A world atlas", "A school's geography textbook overview"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_e6", topicId: 33, prompt: "Why might a geographer choose a small-scale map over a large-scale map?", options: ["To see more fine detail about one town", "To see a broader area and compare regions across a country or continent", "To measure street widths", "To count individual buildings"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_e7", topicId: 33, prompt: "The verbal scale '1 cm represents 10 km' can be written as which representative fraction?", options: ["1:10", "1:1,000", "1:100,000", "1:1,000,000"], correctIndex: 3),
        MathExamQuestion(id: "geo_33_e8", topicId: 33, prompt: "When measuring a curved coastline on a map, which approach gives the most accurate result?", options: ["Drawing a straight line between endpoints", "Using a piece of string along the coastline, then measuring the string", "Estimating by eye", "Doubling the straight-line distance"], correctIndex: 1),
        MathExamQuestion(id: "geo_33_e9", topicId: 33, prompt: "A map covering a 100 km × 100 km area fits on a 20 cm × 20 cm sheet. What is its scale?", options: ["1:500", "1:5,000", "1:50,000", "1:500,000"], correctIndex: 3),
        MathExamQuestion(id: "geo_33_e10", topicId: 33, prompt: "Which of the following correctly describes a small-scale map?", options: ["Shows a small area in great detail", "Shows a large area with less detail", "Has a ratio of 1:1,000 or larger", "Is used exclusively for hiking"], correctIndex: 1),
    ],

    34: [
        MathExamQuestion(id: "geo_34_e1", topicId: 34, prompt: "The United Nations Declaration on the Rights of Indigenous Peoples (UNDRIP) was adopted in which year?", options: ["1948", "1989", "2007", "2015"], correctIndex: 2),
        MathExamQuestion(id: "geo_34_e2", topicId: 34, prompt: "The concept of 'terra nullius' was historically used to claim that Indigenous lands were:", options: ["Owned by the king", "Empty and belonging to no one, justifying colonisation", "Protected nature reserves", "Under United Nations control"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e3", topicId: 34, prompt: "The Sami people are the Indigenous inhabitants of which region?", options: ["Northern Scandinavia and the Kola Peninsula in Russia", "Central Africa", "The Amazon Basin", "The Tibetan Plateau"], correctIndex: 0),
        MathExamQuestion(id: "geo_34_e4", topicId: 34, prompt: "Which South American Indigenous group is known for living in the Amazon rainforest and facing threats from deforestation?", options: ["Inuit", "Yanomami", "Maori", "Zulu"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e5", topicId: 34, prompt: "Indigenous land rights are important geographically because:", options: ["They determine international borders", "They recognise longstanding relationships between people and specific territories, affecting resource management and conservation", "They only apply to Arctic regions", "They were abolished in the 20th century"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e6", topicId: 34, prompt: "Traditional ecological knowledge (TEK) held by Indigenous peoples is valued because:", options: ["It replaces scientific research entirely", "It contains centuries of observations about local ecosystems that can inform modern conservation", "It is only relevant for agriculture", "Governments are required to teach it in schools"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e7", topicId: 34, prompt: "The Mapuche people are Indigenous to which South American region?", options: ["Brazil and Venezuela", "Chile and Argentina", "Peru and Bolivia", "Colombia and Ecuador"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e8", topicId: 34, prompt: "How many Indigenous peoples are estimated to live worldwide today?", options: ["About 100,000", "About 1 million", "Around 476 million", "Around 50 million"], correctIndex: 2),
        MathExamQuestion(id: "geo_34_e9", topicId: 34, prompt: "The Dreamtime is a concept belonging to which Indigenous culture?", options: ["Maori of New Zealand", "Aboriginal Australians", "Inuit of Canada", "Navajo of the USA"], correctIndex: 1),
        MathExamQuestion(id: "geo_34_e10", topicId: 34, prompt: "Land dispossession refers to:", options: ["Buying land from Indigenous peoples at fair market prices", "The taking of Indigenous land, often forcibly, during colonisation", "Donating land to national parks", "A legal process to register land ownership"], correctIndex: 1),
    ],

    35: [
        MathExamQuestion(id: "geo_35_e1", topicId: 35, prompt: "Which global event in the mid-19th century caused the largest wave of Irish emigration?", options: ["The Industrial Revolution", "The Great Famine (1845–1852)", "World War I", "The Black Death"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e2", topicId: 35, prompt: "The Windrush generation refers to migrants from the Caribbean who moved to which country from 1948 onwards?", options: ["United States", "France", "United Kingdom", "Canada"], correctIndex: 2),
        MathExamQuestion(id: "geo_35_e3", topicId: 35, prompt: "Environmental migrants (climate refugees) move primarily because of:", options: ["Better cultural opportunities abroad", "Natural disasters, sea-level rise, and climate-related disasters making their home uninhabitable", "Government policies encouraging emigration", "Economic boom in other countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e4", topicId: 35, prompt: "The 1951 Refugee Convention defines a refugee as someone who:", options: ["Has left their country voluntarily for work", "Has a well-founded fear of persecution based on race, religion, nationality, political opinion, or social group", "Is travelling without a passport", "Lives in a different city than where they were born"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e5", topicId: 35, prompt: "Which region currently hosts the largest number of refugees globally (as of recent years)?", options: ["Western Europe", "North America", "Countries neighbouring conflict zones in the Middle East and Africa (e.g. Turkey, Colombia, Uganda)", "East Asia"], correctIndex: 2),
        MathExamQuestion(id: "geo_35_e6", topicId: 35, prompt: "Chain migration describes:", options: ["Forced deportation of migrants", "When earlier migrants encourage and assist family/community members to follow the same migration route", "Migration driven entirely by economic data", "A government-organised resettlement programme"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e7", topicId: 35, prompt: "The concept of 'brain drain' refers to:", options: ["Children moving away from home for school", "The emigration of highly educated or skilled people from a country, reducing its human capital", "Governments spending money on education abroad", "The loss of traditional knowledge in Indigenous communities"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e8", topicId: 35, prompt: "Remittances are:", options: ["Taxes paid by immigrants to their host country", "Money sent by migrants back to family in their home country, which can be a major source of income for developing nations", "Government grants for refugee housing", "Fees charged at border crossings"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e9", topicId: 35, prompt: "Internally Displaced Persons (IDPs) differ from refugees because:", options: ["IDPs moved to another country; refugees stayed home", "IDPs are still within their own country's borders, while refugees have crossed an international border", "IDPs receive more international protection", "There is no legal difference"], correctIndex: 1),
        MathExamQuestion(id: "geo_35_e10", topicId: 35, prompt: "Lee's Push-Pull Model of migration identifies factors that:", options: ["Explain why rivers flood", "Push people away from their origin and pull them towards a destination", "Describe seasonal animal migration patterns", "Predict economic growth in cities"], correctIndex: 1),
    ],

    36: [
        MathExamQuestion(id: "geo_36_e1", topicId: 36, prompt: "Which urban planning concept promotes walkable neighbourhoods with mixed uses and public transport at its core?", options: ["Urban sprawl", "Transit-Oriented Development (TOD)", "Gated community planning", "Industrial zoning"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e2", topicId: 36, prompt: "A 'green belt' around a city is designed to:", options: ["Create farming zones inside the city", "Prevent urban sprawl by restricting development in surrounding rural land", "Mark the city boundary on maps", "Provide industrial land for factories"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e3", topicId: 36, prompt: "The concept of a '15-minute city' means:", options: ["A city where all journeys by car take under 15 minutes", "A city designed so that residents can reach most daily needs within 15 minutes on foot or by bicycle", "A city built in 15 days using prefabricated buildings", "A city with only 15 main roads"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e4", topicId: 36, prompt: "Gentrification in urban areas refers to:", options: ["Building new government offices in city centres", "The process by which wealthier residents move into lower-income areas, raising property values and often displacing existing residents", "Restoring historic buildings for tourism", "Extending public parks in city centres"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e5", topicId: 36, prompt: "Which of the following is a key feature of Singapore's urban planning that makes it a global model?", options: ["It has banned all private cars", "High-rise public housing, extensive green spaces, and excellent public transport integrated into a compact city", "Its city layout has remained unchanged since 1965", "It relies entirely on private car ownership"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e6", topicId: 36, prompt: "An Environmental Impact Assessment (EIA) in urban planning is used to:", options: ["Calculate city tax revenues", "Evaluate how a proposed development might affect the natural and social environment before it is built", "Measure air quality after construction", "Determine school catchment areas"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e7", topicId: 36, prompt: "Urban heat islands occur because:", options: ["Cities are built on warmer geological rock", "Concrete, asphalt, and reduced vegetation absorb heat, making cities warmer than surrounding rural areas", "Cities produce more volcanic activity", "Rivers run hotter through cities"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e8", topicId: 36, prompt: "Which planning principle aims to reduce social inequality in cities?", options: ["Segregated zoning that separates income groups", "Inclusive planning that ensures affordable housing, accessible services, and participation for all residents", "Prioritising luxury developments in city centres", "Removing public transport to reduce congestion"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e9", topicId: 36, prompt: "Informal settlements (slums/favelas) develop in cities primarily because:", options: ["Governments build them as affordable housing", "Rapid urbanisation outpaces formal housing supply, forcing migrants to build on unplanned land", "They are required by law in some countries", "They are preferred by city planners for their flexibility"], correctIndex: 1),
        MathExamQuestion(id: "geo_36_e10", topicId: 36, prompt: "Smart city technology uses data and digital infrastructure to:", options: ["Replace all human workers in city services", "Improve efficiency, sustainability, and quality of life through real-time monitoring and management of urban systems", "Build cities entirely from recycled materials", "Connect only wealthy neighbourhoods to the internet"], correctIndex: 1),
    ],

    37: [
        MathExamQuestion(id: "geo_37_e1", topicId: 37, prompt: "The Ogallala Aquifer in the United States is being depleted rapidly. This is a concern because:", options: ["It is the world's deepest aquifer", "It recharges very slowly and supports much of the Great Plains' agriculture  -  over-extraction threatens long-term food and water security", "It is the only source of water for New York City", "It contains saltwater that is expensive to treat"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e2", topicId: 37, prompt: "The Nile Waters Agreement of 1959 allocated the Nile's water between Egypt and Sudan. Why has this caused tensions more recently?", options: ["Sudan withdrew from the agreement in 1980", "Ethiopia began constructing the Grand Ethiopian Renaissance Dam, which upstream nations feared would reduce their water allocation", "Egypt built a competing dam on the Mediterranean", "The Nile dried up due to climate change"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e3", topicId: 37, prompt: "Virtual water refers to:", options: ["Water that evaporates before it can be used", "The amount of water used to produce a product, embedded invisibly in traded goods", "Water stored in cloud computing data centres", "Seawater desalinated using solar energy"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e4", topicId: 37, prompt: "The Aral Sea disaster is an example of:", options: ["Flooding caused by excess rainfall", "Over-extraction of river water for irrigation causing a once-huge lake to shrink to a fraction of its original size", "Coastal erosion by rising sea levels", "Groundwater contamination from industry"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e5", topicId: 37, prompt: "Water stress is defined as when a country uses more than what percentage of its renewable freshwater resources annually?", options: ["10%", "20%", "40%", "60%"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e6", topicId: 37, prompt: "Which process naturally replenishes groundwater in aquifers?", options: ["Desalination", "Rainwater infiltrating through soil and rock (recharge)", "River dredging", "Cloud seeding"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e7", topicId: 37, prompt: "Eutrophication of rivers and lakes is caused by:", options: ["Too much sand entering water bodies", "Excessive nutrients (often from agricultural fertilisers) causing algal blooms that deplete oxygen", "Water becoming too cold in winter", "Deforestation causing more sunlight to reach the water"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e8", topicId: 37, prompt: "About what proportion of the world's population currently lacks access to safe drinking water?", options: ["Less than 1%", "About 2 billion people (roughly 1 in 4)", "About 5 billion people", "Under 100 million people"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e9", topicId: 37, prompt: "Transboundary water resources are:", options: ["Desalination plants shared between countries", "Rivers, lakes, or aquifers that cross or form borders between two or more countries", "Pipelines carrying oil across borders", "Water sold between countries via tankers"], correctIndex: 1),
        MathExamQuestion(id: "geo_37_e10", topicId: 37, prompt: "Which sector accounts for approximately 70% of global freshwater withdrawals?", options: ["Industry", "Domestic/household use", "Agriculture", "Energy production"], correctIndex: 2),
    ],

    38: [
        MathExamQuestion(id: "geo_38_e1", topicId: 38, prompt: "To qualify as a biodiversity hotspot (as defined by Conservation International), a region must have at least how many endemic plant species?", options: ["500", "1,000", "1,500", "5,000"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_e2", topicId: 38, prompt: "The Amazon rainforest spans across how many South American countries?", options: ["3", "5", "9", "12"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_e3", topicId: 38, prompt: "Which island group in the Pacific Ocean inspired Charles Darwin's theory of evolution due to its unique endemic species?", options: ["Hawaii", "Galapagos Islands", "Maldives", "Canary Islands"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e4", topicId: 38, prompt: "The Indo-Burma biodiversity hotspot includes which countries?", options: ["Mexico and Guatemala", "Myanmar, Thailand, Vietnam, Cambodia, Laos, and parts of China", "Kenya, Tanzania, and Uganda", "Brazil and Peru"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e5", topicId: 38, prompt: "Why are island ecosystems particularly vulnerable to species extinction?", options: ["Islands have too much rainfall", "Island species often evolve in isolation with no natural predators, making them highly susceptible to introduced species and habitat loss", "Islands are always too small for conservation", "Island governments rarely protect biodiversity"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e6", topicId: 38, prompt: "What is the current global rate of species extinction estimated to be compared to the natural background rate?", options: ["The same as natural rates", "About 10 times higher", "About 100–1,000 times higher", "About 2 times higher"], correctIndex: 2),
        MathExamQuestion(id: "geo_38_e7", topicId: 38, prompt: "Keystone species in a biodiversity hotspot are important because:", options: ["They are the largest animals in the ecosystem", "Their removal would cause a disproportionately large collapse of the ecosystem", "They produce the most oxygen", "They are the most colourful species"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e8", topicId: 38, prompt: "The Sundaland hotspot, which includes Borneo and Sumatra, is primarily threatened by:", options: ["Overfishing", "Palm oil plantation expansion and illegal logging", "Extreme volcanic activity", "Rising sea levels flooding the region"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e9", topicId: 38, prompt: "Bioprospecting refers to:", options: ["Tourism in national parks", "Searching for biological organisms in hotspots that may have commercial or medical value", "Counting species for scientific records", "Planting native trees in deforested areas"], correctIndex: 1),
        MathExamQuestion(id: "geo_38_e10", topicId: 38, prompt: "Conservation International has identified how many biodiversity hotspots worldwide?", options: ["10", "17", "36", "50"], correctIndex: 2),
    ],

    39: [
        MathExamQuestion(id: "geo_39_e1", topicId: 39, prompt: "Remote sensing satellites can detect changes in land cover by measuring:", options: ["Sound waves bouncing off the surface", "Reflected and emitted electromagnetic radiation from the Earth's surface", "Gravitational pull differences across landscapes", "Underground water movement"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e2", topicId: 39, prompt: "The NDVI (Normalised Difference Vegetation Index) is used to:", options: ["Measure ocean salinity", "Assess the health and density of vegetation cover from satellite data", "Map underground oil reserves", "Track urban population growth"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e3", topicId: 39, prompt: "Agricultural land use currently covers approximately what percentage of Earth's ice-free land surface?", options: ["10%", "20%", "50%", "70%"], correctIndex: 2),
        MathExamQuestion(id: "geo_39_e4", topicId: 39, prompt: "Urban impervious surfaces (concrete, tarmac) affect the water cycle by:", options: ["Increasing water infiltration into the ground", "Reducing infiltration, increasing surface runoff and flood risk", "Purifying rainwater before it enters rivers", "Slowing down the rate of evaporation to zero"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e5", topicId: 39, prompt: "Land use conflict occurs when:", options: ["Different groups have competing claims or needs for the same piece of land", "A country runs out of land to develop", "Environmental surveys disagree with each other", "Urban land is rezoned as industrial"], correctIndex: 0),
        MathExamQuestion(id: "geo_39_e6", topicId: 39, prompt: "The conversion of wetlands to farmland is problematic because wetlands:", options: ["Are too cold for farming", "Provide flood regulation, water purification, and critical wildlife habitat that is lost when drained", "Are too close to cities for agricultural use", "Contain too many insects for farming"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e7", topicId: 39, prompt: "CORINE Land Cover is a European programme that:", options: ["Controls how much land farmers can use", "Maps and monitors land cover and land use change across Europe using satellite imagery", "Regulates construction permits in cities", "Manages national park boundaries"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e8", topicId: 39, prompt: "Brownfield sites in urban geography refer to:", options: ["Parks and green spaces available for development", "Previously developed or industrial land that may be contaminated but is available for re-use", "Agricultural land on the edges of cities", "New residential estates built on greenfield land"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e9", topicId: 39, prompt: "The concept of 'land grabbing' refers to:", options: ["Governments expanding national parks", "Large-scale acquisition of land in developing countries by foreign investors, often displacing local communities", "Farmers illegally extending their fields", "Erosion causing riverbanks to collapse"], correctIndex: 1),
        MathExamQuestion(id: "geo_39_e10", topicId: 39, prompt: "Which global agreement includes commitments to sustainable land use to combat desertification?", options: ["The Paris Agreement only", "The United Nations Convention to Combat Desertification (UNCCD)", "The Kyoto Protocol", "The Geneva Convention"], correctIndex: 1),
    ],

        40: [
        MathExamQuestion(id: "geo_40_e1",  topicId: 40, prompt: "Environmental justice is BEST described as:", options: ["Protecting forests from logging", "Ensuring all communities share environmental benefits and burdens fairly", "Reducing carbon emissions in factories", "Recycling programmes in schools"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e2",  topicId: 40, prompt: "Studies show that hazardous waste sites are disproportionately located near:", options: ["Wealthy gated communities", "Low-income and minority neighbourhoods", "National parks", "University campuses"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e3",  topicId: 40, prompt: "Which term describes the unequal burden of pollution placed on minority communities?", options: ["Cultural imperialism", "Environmental racism", "Economic migration", "Urban sprawl"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e4",  topicId: 40, prompt: "Which of the following BEST illustrates an environmental justice issue?", options: ["A national park receiving government funding", "Factories consistently located in deprived areas causing health problems", "A wealthy city building a new recycling centre", "A country signing a climate agreement"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e5",  topicId: 40, prompt: "Low-income communities often lack access to green spaces. This relates to:", options: ["Urban heat islands only", "Environmental justice  -  fair access to clean, green environments", "Tourism geography", "Population migration"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e6",  topicId: 40, prompt: "Which international event most commonly addresses environmental justice on a global scale?", options: ["Olympic Games", "United Nations Climate Conferences (COP)", "World Trade Organisation meetings", "Eurovision Song Contest"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e7",  topicId: 40, prompt: "Which group coined the term 'environmental racism' in the 1980s?", options: ["European scientists", "Civil rights activists in the United States", "Asian governments", "Australian farmers"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e8",  topicId: 40, prompt: "Access to clean drinking water is considered:", options: ["A luxury only rich countries can afford", "A basic human right and an environmental justice issue", "Unrelated to geography", "Only a technical engineering problem"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e9",  topicId: 40, prompt: "Climate change is considered an environmental justice issue because:", options: ["It only affects people in hot countries", "Poorer nations contribute less but suffer more from its effects", "Only coastal cities are at risk", "Rich countries are most affected"], correctIndex: 1),
        MathExamQuestion(id: "geo_40_e10", topicId: 40, prompt: "Which action BEST promotes environmental justice?", options: ["Building more motorways through low-income areas", "Consulting communities before building polluting facilities near them", "Only cleaning up environments in wealthy cities", "Banning environmental protests"], correctIndex: 1),
    ],

    41: [
        MathExamQuestion(id: "geo_41_e1",  topicId: 41, prompt: "Which type of boundary follows a physical feature such as a river or mountain range?", options: ["Geometric boundary", "Superimposed boundary", "Physical/natural boundary", "Relic boundary"], correctIndex: 2),
        MathExamQuestion(id: "geo_41_e2",  topicId: 41, prompt: "A 'superimposed boundary' is one that:", options: ["Follows a natural feature", "Was drawn by an outside power ignoring existing cultures", "Was agreed by both countries", "Follows a river delta"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e3",  topicId: 41, prompt: "Which of these territories is currently disputed between multiple countries?", options: ["Scotland", "The Falkland Islands / Islas Malvinas", "New Zealand", "Iceland"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e4",  topicId: 41, prompt: "The South China Sea is disputed because it contains:", options: ["The world's largest rainforest", "Important shipping lanes and natural resources", "The deepest ocean trench", "Major volcanic islands"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e5",  topicId: 41, prompt: "A landlocked country is one that:", options: ["Has no mountains", "Has no coastline  -  surrounded entirely by land", "Is surrounded entirely by water", "Has only one border"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e6",  topicId: 41, prompt: "Which of these is NOT a way political boundaries are typically established?", options: ["Peace treaties", "Colonial decisions", "Tectonic plate movement", "Wars and conquest"], correctIndex: 2),
        MathExamQuestion(id: "geo_41_e7",  topicId: 41, prompt: "The Berlin Conference of 1884-85 is historically significant because:", options: ["It ended World War I", "European powers divided Africa into colonies without African input", "It created the United Nations", "It established the Prime Meridian"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e8",  topicId: 41, prompt: "Which of these is a relic boundary?", options: ["The US-Mexico border wall", "The former boundary between East and West Germany", "The border between France and Spain", "The India-China border"], correctIndex: 1),
        MathExamQuestion(id: "geo_41_e9",  topicId: 41, prompt: "Enclaves are areas of one country that are:", options: ["Completely surrounded by another country's territory", "Located on the coast", "Separated by a mountain range", "Governed by international law only"], correctIndex: 0),
        MathExamQuestion(id: "geo_41_e10", topicId: 41, prompt: "Which international body most commonly mediates border disputes?", options: ["FIFA", "The International Court of Justice / United Nations", "The World Bank", "NATO"], correctIndex: 1),
    ],

    42: [
        MathExamQuestion(id: "geo_42_e1",  topicId: 42, prompt: "Which of the following is a positive economic impact of tourism?", options: ["Increased house prices for locals", "Foreign exchange earnings and local employment", "Reduced biodiversity", "Higher crime rates"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e2",  topicId: 42, prompt: "Ecotourism aims to:", options: ["Attract as many tourists as possible", "Minimise environmental impact and support conservation", "Build large luxury resorts", "Only visit urban areas"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e3",  topicId: 42, prompt: "The 'tourist multiplier effect' means:", options: ["Tourism money is spent once and disappears", "Tourist spending generates additional income through local businesses", "Tourism causes prices to multiply rapidly", "Tourism only benefits large hotels"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e4",  topicId: 42, prompt: "Which term describes tourism that respects local culture and the natural environment?", options: ["Mass tourism", "Sustainable tourism", "Domestic tourism", "Adventure tourism"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e5",  topicId: 42, prompt: "Thailand's beautiful islands have suffered from:", options: ["Too little tourism interest", "Coral reef damage and pollution from mass tourism", "Deforestation only", "Lack of airline routes"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e6",  topicId: 42, prompt: "What is 'leakage' in tourism economics?", options: ["Water leaking in hotel pipes", "Tourist money leaving the local economy to foreign companies", "Environmental damage from tourists", "Illegal tourist activities"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e7",  topicId: 42, prompt: "Which country is the world's most visited tourist destination (by international arrivals)?", options: ["USA", "Spain", "France", "China"], correctIndex: 2),
        MathExamQuestion(id: "geo_42_e8",  topicId: 42, prompt: "Barcelona has introduced tourist taxes and visitor limits to combat:", options: ["Lack of tourist interest", "Overtourism and its effects on local residents", "Currency exchange problems", "Poor transport links"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e9",  topicId: 42, prompt: "Which type of tourism involves visiting places of historical or cultural significance?", options: ["Dark tourism", "Heritage tourism", "Adventure tourism", "Sports tourism"], correctIndex: 1),
        MathExamQuestion(id: "geo_42_e10", topicId: 42, prompt: "Why might developing countries rely heavily on tourism?", options: ["They have better technology than developed countries", "Tourism provides foreign currency and jobs when other industries are limited", "They are always warmer", "Tourism is always sustainable there"], correctIndex: 1),
    ],

    43: [
        MathExamQuestion(id: "geo_43_e1",  topicId: 43, prompt: "Which of the following BEST defines a global supply chain?", options: ["A supermarket delivery system within one city", "A network connecting raw material extraction, manufacturing, and retail across multiple countries", "A local farmers' market system", "A shipping company's delivery route"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e2",  topicId: 43, prompt: "Transnational corporations (TNCs) benefit from global supply chains mainly because:", options: ["It reduces the number of products they sell", "They can source cheaper labour and materials from different countries", "They only need to operate in one country", "They can avoid all taxes legally"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e3",  topicId: 43, prompt: "The Suez Canal is important for global supply chains because:", options: ["It produces oil for shipping", "It connects the Mediterranean Sea to the Red Sea, shortening shipping routes", "It is the longest river in the world", "It provides freshwater to desert countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e4",  topicId: 43, prompt: "'Just-in-time' manufacturing means:", options: ["Products are made months in advance and stored", "Materials are delivered exactly when needed to minimise storage costs", "Factories only work during the day", "Workers are paid just in time for rent"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e5",  topicId: 43, prompt: "Child labour in supply chains is:", options: ["Encouraged by Fair Trade organisations", "An ethical concern that brands are increasingly pressured to eliminate", "Only an issue in European factories", "Legal in all countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e6",  topicId: 43, prompt: "Which event in 2021 caused a major global supply chain disruption?", options: ["A volcanic eruption in Iceland", "A container ship blocking the Suez Canal (Ever Given)", "A tsunami in Japan", "An earthquake in Chile"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e7",  topicId: 43, prompt: "Reshoring refers to:", options: ["Moving factories further overseas", "Bringing manufacturing back to a company's home country", "Building new ports abroad", "Increasing import taxes"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e8",  topicId: 43, prompt: "What percentage of global trade is carried by sea?", options: ["Around 20%", "Around 50%", "Around 80%", "Around 95%"], correctIndex: 2),
        MathExamQuestion(id: "geo_43_e9",  topicId: 43, prompt: "Fair trade certification guarantees that:", options: ["Products are made only in wealthy countries", "Producers receive a fair price and safe working conditions", "Products are organic", "There is no shipping involved"], correctIndex: 1),
        MathExamQuestion(id: "geo_43_e10", topicId: 43, prompt: "Which industry has one of the most complex and ethically controversial global supply chains?", options: ["Book publishing", "Fast fashion clothing", "Local bakeries", "Public libraries"], correctIndex: 1),
    ],

    44: [
        MathExamQuestion(id: "geo_44_e1",  topicId: 44, prompt: "What distinguishes a mixed economy from a command economy?", options: ["A mixed economy has no private businesses", "A mixed economy combines private enterprise with government involvement", "A command economy allows free trade", "A mixed economy is only found in Asia"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e2",  topicId: 44, prompt: "Which economic indicator measures the total value of goods and services a country produces?", options: ["HDI", "GDP", "IMF", "GNI per capita"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e3",  topicId: 44, prompt: "The 'free market' economic model assumes that:", options: ["The government sets all prices", "Supply and demand determine prices and production", "Every worker earns the same wage", "Trade only happens within borders"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e4",  topicId: 44, prompt: "Which of these countries operates the closest to a command economy today?", options: ["Germany", "Brazil", "North Korea", "Japan"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_e5",  topicId: 44, prompt: "The Nordic Model (used in Scandinavia) is an example of:", options: ["Pure capitalism", "A command economy", "A mixed economy with strong welfare provisions", "A traditional barter economy"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_e6",  topicId: 44, prompt: "Economic inequality between countries is measured using:", options: ["Richter scale", "Gini coefficient and HDI", "Beaufort scale", "Latitude"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e7",  topicId: 44, prompt: "Which of these is a characteristic of a developing economy?", options: ["High GDP per capita", "Advanced technology industries dominate", "Large informal economy and reliance on agriculture", "Universal healthcare for all citizens"], correctIndex: 2),
        MathExamQuestion(id: "geo_44_e8",  topicId: 44, prompt: "The BRICS countries (Brazil, Russia, India, China, South Africa) are significant because:", options: ["They are the richest countries in the world", "They are major emerging economies reshaping global economic power", "They are all in Asia", "They are all democratic countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e9",  topicId: 44, prompt: "Subsistence farming is typical of:", options: ["Highly industrialised economies", "Traditional economies where people grow food to survive rather than sell", "Command economies only", "Capitalist economies"], correctIndex: 1),
        MathExamQuestion(id: "geo_44_e10", topicId: 44, prompt: "Which sector of the economy involves services like banking, education, and healthcare?", options: ["Primary sector", "Secondary sector", "Tertiary sector", "Quaternary sector"], correctIndex: 2),
    ],

    45: [
        MathExamQuestion(id: "geo_45_e1",  topicId: 45, prompt: "A location described as 90°S is:", options: ["The North Pole", "The South Pole", "The Equator", "The Prime Meridian"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e2",  topicId: 45, prompt: "Lines of latitude run:", options: ["Vertically from pole to pole", "Horizontally parallel to the Equator", "Diagonally across the globe", "Only in the northern hemisphere"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e3",  topicId: 45, prompt: "The International Date Line is located at approximately:", options: ["0° longitude", "90° West longitude", "180° longitude", "45° East longitude"], correctIndex: 2),
        MathExamQuestion(id: "geo_45_e4",  topicId: 45, prompt: "How many satellites does GPS typically need to accurately pinpoint a location?", options: ["1", "2", "At least 3-4", "At least 10"], correctIndex: 2),
        MathExamQuestion(id: "geo_45_e5",  topicId: 45, prompt: "What is an OS (Ordnance Survey) map grid reference used for?", options: ["Measuring rainfall", "Identifying precise locations on a UK topographic map", "Calculating time zones", "Measuring sea depth"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e6",  topicId: 45, prompt: "The Tropic of Cancer is at approximately:", options: ["0° latitude", "23.5° North latitude", "66.5° North latitude", "45° South latitude"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e7",  topicId: 45, prompt: "GIS (Geographic Information System) is used to:", options: ["Predict the weather only", "Collect, store, and analyse geographic data on maps", "Navigate ships by stars", "Calculate GDP of countries"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e8",  topicId: 45, prompt: "If you travel west across the International Date Line, you:", options: ["Lose a day", "Gain a day", "Lose an hour", "Gain an hour"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e9",  topicId: 45, prompt: "Remote sensing in geography involves:", options: ["Interviewing local people", "Collecting data about Earth's surface from satellites or aircraft", "Digging soil samples", "Measuring river flow"], correctIndex: 1),
        MathExamQuestion(id: "geo_45_e10", topicId: 45, prompt: "Which of the following uses GPS technology?", options: ["A paper road atlas", "A satellite navigation system in a car", "A traditional compass", "A printed weather map"], correctIndex: 1),
    ],

    46: [
        MathExamQuestion(id: "geo_46_e1",  topicId: 46, prompt: "Cultural diffusion is BEST described as:", options: ["The decline of minority cultures", "The spread of cultural ideas, customs, and practices between societies", "A government policy on multiculturalism", "The extinction of a language"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e2",  topicId: 46, prompt: "Lingua franca refers to:", options: ["A type of French bread", "A common language used between speakers of different native languages", "An extinct language", "A local dialect"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e3",  topicId: 46, prompt: "UNESCO recognises over 6,000 languages in the world. Approximately how many are considered endangered?", options: ["Around 100", "Around 500", "Around 2,500", "Around 5,000"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_e4",  topicId: 46, prompt: "Cultural imperialism refers to:", options: ["Sharing recipes between countries", "The dominance of one culture  -  often Western  -  over others globally", "Preserving traditional cultures", "Fair exchange of cultural ideas"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e5",  topicId: 46, prompt: "Which of the following is an example of cultural convergence?", options: ["A remote tribe with no outside contact", "McDonald's restaurants operating in nearly every country", "A country banning all foreign media", "A traditional music revival"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e6",  topicId: 46, prompt: "The spread of Islam along historical trade routes is an example of:", options: ["Cultural erosion", "Cultural diffusion through trade", "Environmental determinism", "Political imperialism"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e7",  topicId: 46, prompt: "Which region of the world has the highest linguistic diversity?", options: ["Western Europe", "North America", "Papua New Guinea and the Pacific", "The Middle East"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_e8",  topicId: 46, prompt: "Multiculturalism as a government policy aims to:", options: ["Assimilate all immigrants into one culture", "Promote and respect the coexistence of multiple cultures", "Reduce immigration", "Create a single national religion"], correctIndex: 1),
        MathExamQuestion(id: "geo_46_e9",  topicId: 46, prompt: "Which country has the largest Muslim population?", options: ["Saudi Arabia", "Iran", "Indonesia", "Pakistan"], correctIndex: 2),
        MathExamQuestion(id: "geo_46_e10", topicId: 46, prompt: "The concept of a 'cultural hearth' refers to:", options: ["A fireplace used in traditional ceremonies", "A region where a major civilisation or cultural tradition originated", "A centre for refugee resettlement", "A multicultural city district"], correctIndex: 1),
    ],

        // Topic 48: Deserts of the World — Exam
        48: [
            MathExamQuestion(id: "geo_48_e1", topicId: 48, prompt: "What is the defining feature of ALL deserts?", options: ["Sandy terrain", "Less than 250 mm of precipitation per year", "Very high temperatures", "No plant life at all", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e2", topicId: 48, prompt: "Which is the largest hot desert in the world?", options: ["Arabian Desert", "Gobi Desert", "Sahara Desert", "Kalahari Desert", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_e3", topicId: 48, prompt: "What is the overall largest desert on Earth, including cold deserts?", options: ["Sahara", "Gobi", "Arabian", "Antarctica", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_e4", topicId: 48, prompt: "The Atacama Desert is one of the driest places on Earth. On which continent is it found?", options: ["Africa", "Australia", "North America", "South America", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_e5", topicId: 48, prompt: "The Gobi Desert is located in which two countries?", options: ["India and Pakistan", "China and Mongolia", "Russia and China", "Kazakhstan and Uzbekistan", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e6", topicId: 48, prompt: "What is an oasis?", options: ["A sand dune formed by wind", "A fertile area in a desert with a water source", "A canyon carved by an ancient river", "A dry salt flat", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e7", topicId: 48, prompt: "What is desertification?", options: ["Building a city in a desert", "The process by which fertile land becomes desert", "A desert sandstorm", "Planting trees in desert areas", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e8", topicId: 48, prompt: "The Namib Desert lies along the coast of which continent?", options: ["Asia", "South America", "Australia", "Africa", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_e9", topicId: 48, prompt: "In a hot desert, temperatures can drop dramatically at night. Why?", options: ["Cloud cover traps heat during the day then releases it at night", "Desert sand reflects heat during the day and absorbs cold air at night", "There is little water vapour or cloud cover to trap heat, so it escapes rapidly", "The Earth rotates faster in deserts", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_48_e10", topicId: 48, prompt: "Which adaptation helps a cactus survive in a hot desert?", options: ["Wide flat leaves to absorb rain", "Thick waxy stem to store water and reduce evaporation", "Deep red colouring to reflect sunlight", "Annual migration to cooler regions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e11", topicId: 48, prompt: "A wadi is:", options: ["A desert oasis town", "A dry river channel that fills with water only after rainfall", "A type of tall sand dune", "An underground desert cave system", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e12", topicId: 48, prompt: "Which human activity is the greatest driver of desertification?", options: ["Tourism", "Overgrazing and deforestation of marginal land", "Earthquake activity", "Volcanic eruptions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e13", topicId: 48, prompt: "The Arabian Desert covers most of which peninsula?", options: ["Iberian Peninsula", "Indian subcontinent", "Scandinavian Peninsula", "Arabian Peninsula", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_48_e14", topicId: 48, prompt: "Coastal deserts like the Atacama and Namib form partly because of:", options: ["Tropical high-pressure systems only", "Cold ocean currents that cool and stabilise the air, preventing rain", "Mountain ranges entirely blocking ocean winds", "Their extreme southern location", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_48_e15", topicId: 48, prompt: "The Sahel is a semi-arid region on the southern edge of the Sahara. It is vulnerable to:", options: ["Excessive rainfall and flooding", "Desertification driven by drought and overuse of land", "Tropical cyclones", "Glacial retreat", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 49: Rainforests & Biodiversity — Exam
        49: [
            MathExamQuestion(id: "geo_49_e1", topicId: 49, prompt: "Where are most tropical rainforests located in relation to the equator?", options: ["More than 40° from the equator", "Between roughly 10°N and 10°S of the equator", "Only in the Southern Hemisphere", "Only in coastal regions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e2", topicId: 49, prompt: "Why are rainforests called the 'lungs of the Earth'?", options: ["They look like lungs on a world map", "They absorb large amounts of CO₂ and release oxygen through photosynthesis", "They produce the world's fresh water", "They generate rainfall for the entire planet", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e3", topicId: 49, prompt: "Which is the largest tropical rainforest in the world?", options: ["Congo Basin", "Daintree", "Amazon", "Southeast Asian rainforest", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_e4", topicId: 49, prompt: "Approximately what fraction of all known species on Earth live in tropical rainforests?", options: ["About 10%", "About 25%", "About 50%", "About 75%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_e5", topicId: 49, prompt: "What is the canopy layer of a rainforest?", options: ["The very top emergent layer above all others", "The dense upper layer formed by the tallest trees creating a near-continuous roof", "The dark humid floor of the forest", "The layer between the ground and the lowest branches", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e6", topicId: 49, prompt: "Deforestation of the Amazon contributes to climate change mainly because:", options: ["Trees produce harmful CO₂ when alive", "Burning and decay release stored carbon, and fewer trees are left to absorb CO₂", "The cleared land heats up and emits radiation", "Logging trucks release diesel exhaust", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e7", topicId: 49, prompt: "The Congo Basin Rainforest is the world's second largest. It is located in:", options: ["Southeast Asia", "South America", "Central Africa", "West Africa", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_e8", topicId: 49, prompt: "Transpiration in a rainforest means:", options: ["Animals producing heat", "Water released from leaves into the atmosphere, contributing to local rainfall", "Rivers flooding the forest floor", "Soil releasing stored moisture", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e9", topicId: 49, prompt: "Why is the rainforest floor very dark despite the intense sun above?", options: ["The soil is black and absorbs light", "The canopy and understory layers block about 98% of sunlight from reaching the floor", "Dense fog permanently covers the floor", "Large animals block the light", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e10", topicId: 49, prompt: "Which of the following is the MAIN commercial cause of Amazon deforestation?", options: ["Urban expansion of cities", "Gold mining only", "Cattle ranching and soy farming", "Tourism infrastructure", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_e11", topicId: 49, prompt: "Rainforest soil is often poor in nutrients because:", options: ["It receives too little rainfall to support nutrients", "Nutrients are quickly absorbed by plants and decomposed, leaving thin topsoil", "Cold temperatures prevent nutrient formation", "The soil is too deep for roots to reach", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e12", topicId: 49, prompt: "What is an endemic species?", options: ["A species that is very dangerous", "A species found only in one specific geographic area and nowhere else", "A species that migrates every year", "An extinct species", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e13", topicId: 49, prompt: "Approximately what percentage of all known medicines have origins in rainforest plants?", options: ["Around 5%", "Around 10%", "Around 25%", "Around 50%", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_49_e14", topicId: 49, prompt: "Sustainable forestry in rainforests aims to:", options: ["Cut all trees as quickly as possible for profit", "Harvest trees in a way that allows the forest to regrow and remain productive", "Leave forests entirely untouched with no human use", "Convert rainforest land into farmland gradually", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_49_e15", topicId: 49, prompt: "Why are indigenous people's land rights important for rainforest conservation?", options: ["Indigenous people sell the land more profitably", "Research shows that forests managed by indigenous communities have lower deforestation rates", "Governments prefer indigenous land owners", "Indigenous people do not use the forest", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 50: Islands & Peninsulas — Exam
        50: [
            MathExamQuestion(id: "geo_50_e1", topicId: 50, prompt: "What is the difference between an island and a peninsula?", options: ["An island is larger than a peninsula", "An island is completely surrounded by water; a peninsula is mostly surrounded but connected to land", "A peninsula is always in a warmer climate", "There is no geographical difference", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e2", topicId: 50, prompt: "Which is the world's largest island?", options: ["Australia", "Borneo", "Greenland", "New Guinea", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_e3", topicId: 50, prompt: "The Iberian Peninsula contains which two countries?", options: ["France and Italy", "Spain and Portugal", "Norway and Sweden", "Greece and Turkey", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e4", topicId: 50, prompt: "A group of islands close together is called:", options: ["A peninsula", "A delta", "An archipelago", "A strait", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_e5", topicId: 50, prompt: "How do volcanic islands form?", options: ["Large pieces of continent break off and drift", "Underwater volcanoes erupt and build up material until they emerge above sea level", "Sea levels fall exposing hills", "Coral alone forms large islands", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e6", topicId: 50, prompt: "Norway and Sweden are situated on which peninsula?", options: ["Iberian Peninsula", "Italian Peninsula", "Scandinavian Peninsula", "Balkan Peninsula", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_e7", topicId: 50, prompt: "Which of the following is an isthmus?", options: ["A narrow waterway between two landmasses", "A narrow strip of land connecting two larger landmasses", "A peninsula extending into the sea", "An island close to the mainland", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e8", topicId: 50, prompt: "Why are small island nations particularly threatened by climate change?", options: ["They have fewer people so less help is available", "Rising sea levels and more intense storms threaten their very existence", "They are always in the tropics", "Islands heat up faster than continents", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e9", topicId: 50, prompt: "The Philippines is described as an archipelago. What does this mean?", options: ["It is a very large single island", "It is a peninsula attached to mainland Asia", "It consists of a large group of islands", "It is an entirely landlocked territory", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_50_e10", topicId: 50, prompt: "What is a strait?", options: ["A narrow strip of land joining two larger landmasses", "A narrow body of water connecting two larger bodies of water", "A type of coral island", "A river mouth at the coast", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e11", topicId: 50, prompt: "The Arabian Peninsula is largely covered by:", options: ["Tropical rainforest", "Desert and semi-arid land", "Temperate grassland", "Boreal forest", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e12", topicId: 50, prompt: "Australia is sometimes called a continent rather than an island because:", options: ["It is too warm to be an island", "It is the smallest continent and sits on its own tectonic plate, larger than any island", "It has too many people to be an island", "Islands must be in a tropical climate", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e13", topicId: 50, prompt: "What is an atoll?", options: ["A volcanic mountain above sea level", "A ring-shaped coral island enclosing a lagoon", "An underwater mountain range", "A type of peninsula in tropical areas", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e14", topicId: 50, prompt: "The Korean Peninsula is bordered on the north by:", options: ["Japan", "Russia and China", "Mongolia", "The South China Sea", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_50_e15", topicId: 50, prompt: "Island biogeography suggests that larger islands tend to have:", options: ["Fewer species because of isolation", "More species because they offer more habitats", "The same number of species as smaller islands", "More species only if they are volcanic", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 51: Earthquakes & Volcanoes — Exam
        51: [
            MathExamQuestion(id: "geo_51_e1", topicId: 51, prompt: "What is the focus (hypocenter) of an earthquake?", options: ["The point on the surface directly above the earthquake's origin", "The underground point where the earthquake originates", "The seismograph recording station", "The edge of the tectonic plate", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e2", topicId: 51, prompt: "The Richter scale measures:", options: ["Wind speed during volcanic eruptions", "The height of tsunami waves", "The magnitude (energy released) of an earthquake", "The temperature of lava", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e3", topicId: 51, prompt: "The Ring of Fire is a zone of intense volcanic and earthquake activity around the:", options: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_51_e4", topicId: 51, prompt: "At which type of plate boundary do the most powerful earthquakes typically occur?", options: ["Divergent (plates moving apart)", "Transform (plates sliding past each other)", "Convergent (plates moving together)", "Hot spots", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e5", topicId: 51, prompt: "A tsunami is triggered by:", options: ["A severe tropical storm at sea", "An underwater earthquake or volcanic eruption displacing huge amounts of water", "High tides during a full moon", "Wind-driven waves during a hurricane", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e6", topicId: 51, prompt: "Which volcanic hazard is a fast-moving current of hot gas, ash, and rock?", options: ["Lahar", "Lava flow", "Pyroclastic flow", "Tephra fall", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e7", topicId: 51, prompt: "Why do some people choose to live near active volcanoes despite the danger?", options: ["Governments force them to live there", "Volcanic ash creates highly fertile soil ideal for farming", "Active volcanoes always give months of warning before erupting", "Lava flows move too slowly to be dangerous", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e8", topicId: 51, prompt: "What is the difference between magma and lava?", options: ["They are the same substance with different names", "Magma is molten rock underground; lava is magma that has reached the surface", "Lava is hotter than magma", "Magma is gas; lava is liquid rock", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e9", topicId: 51, prompt: "A lahar is:", options: ["A type of earthquake aftershock", "A fast-moving mudflow of volcanic ash mixed with water, often from melting snow", "Lava that has cooled and solidified", "A volcanic gas cloud", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e10", topicId: 51, prompt: "Why are LEDCs (less economically developed countries) often more affected by earthquakes than wealthier countries of similar magnitude?", options: ["Earthquakes are always stronger in LEDCs", "LEDCs have poorly constructed buildings, less early warning infrastructure, and weaker emergency services", "LEDCs are always located on plate boundaries", "Wealthier countries experience fewer earthquakes", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e11", topicId: 51, prompt: "The Vesuvius eruption of 79 AD is famous for:", options: ["Being the largest eruption ever recorded", "Destroying and preserving the Roman city of Pompeii under ash", "Triggering a major tsunami in the Mediterranean", "Creating a new island in the Bay of Naples", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_51_e12", topicId: 51, prompt: "A divergent plate boundary is where plates move apart. This most commonly forms:", options: ["Mountain ranges", "Deep ocean trenches", "Mid-ocean ridges and rift valleys", "Volcanoes above subduction zones", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e13", topicId: 51, prompt: "Which instrument records the seismic waves from an earthquake?", options: ["Barometer", "Anemometer", "Seismograph", "Thermometer", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e14", topicId: 51, prompt: "Hawaii's volcanoes are not on a plate boundary. They are caused by:", options: ["Two plates colliding", "Plates pulling apart rapidly", "A hot spot — a plume of exceptionally hot mantle material", "Ancient earthquake fault lines", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_51_e15", topicId: 51, prompt: "The 2004 Indian Ocean tsunami was primarily caused by:", options: ["A powerful hurricane off the coast of Indonesia", "A submarine earthquake near Sumatra registering about 9.1 magnitude", "Volcanic eruption of Krakatoa", "Rapid melting of Arctic ice", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 52: Climate Zones — Exam
        52: [
            MathExamQuestion(id: "geo_52_e1", topicId: 52, prompt: "What is the primary factor that determines a location's climate zone?", options: ["Population density", "Latitude (distance from the equator)", "Country size", "Distance from the nearest river", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e2", topicId: 52, prompt: "Which climate zone covers land near the equator with high temperatures and heavy rainfall year-round?", options: ["Polar", "Arid", "Tropical", "Mediterranean", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_e3", topicId: 52, prompt: "A Mediterranean climate is best described as:", options: ["Cold winters and very hot summers with rain throughout the year", "Hot dry summers and mild wet winters", "Year-round heavy rainfall and high temperatures", "Very cold with permanent ice cover", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e4", topicId: 52, prompt: "What is the 'rain shadow' effect?", options: ["An area of unusually high rainfall near the coast", "The dry area on the leeward side of a mountain range where little rain falls", "A zone where rainfall is blocked by desert sand", "An equatorial zone of permanent cloud cover", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e5", topicId: 52, prompt: "Continental climates experience extreme temperatures because:", options: ["They are always at high altitudes", "They are far from the moderating influence of the ocean", "They are close to the equator", "They receive very low solar radiation", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e6", topicId: 52, prompt: "As altitude increases, what generally happens to temperature?", options: ["It increases steadily", "It stays the same but rainfall increases", "It decreases (roughly 6.5°C per 1,000 m)", "It increases only in tropical zones", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_e7", topicId: 52, prompt: "Which climate zone has permafrost (permanently frozen ground)?", options: ["Tropical", "Mediterranean", "Temperate oceanic", "Tundra", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_52_e8", topicId: 52, prompt: "A monsoon climate features:", options: ["Constant temperature with no seasonal change", "A distinct dry season and an intense wet season", "Permanent cold temperatures", "Year-round dry conditions", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e9", topicId: 52, prompt: "Why are coastal locations usually milder in temperature than inland areas at the same latitude?", options: ["Coastal winds always bring tropical warmth", "The sea has a high heat capacity, warming land in winter and cooling it in summer", "Cities on coasts produce more heat", "Coastal areas receive more sunlight", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e10", topicId: 52, prompt: "Climate change is causing climate zones to:", options: ["Remain stable for centuries more", "Shift — deserts expanding, polar zones retreating, species moving to new areas", "Become more equal across the planet", "Only affect tropical zones", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e11", topicId: 52, prompt: "The Koppen climate classification system groups climates primarily based on:", options: ["Population and land use", "Temperature and precipitation patterns", "Distance from the equator only", "Soil type and vegetation", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e12", topicId: 52, prompt: "Which city is most likely to have a tundra climate?", options: ["Lagos", "Singapore", "Ushuaia (southernmost Argentina)", "London", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_52_e13", topicId: 52, prompt: "The boreal (taiga) forest climate is characterised by:", options: ["High rainfall and constant warmth", "Very short cool summers and long bitterly cold winters", "Dry summers and wet winters", "Permanent ice and no tree growth", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_52_e14", topicId: 52, prompt: "Which of these factors does NOT directly affect climate?", options: ["Latitude", "Altitude", "Distance from the sea", "A country's official language", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_52_e15", topicId: 52, prompt: "Semi-arid (steppe) climates typically receive between 250 mm and 500 mm of rain per year. Where are they commonly found?", options: ["Only in the tropics", "On the edges of deserts and in continental interiors", "Only in polar regions", "On small tropical islands", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 53: Population & Cities — Exam
        53: [
            MathExamQuestion(id: "geo_53_e1", topicId: 53, prompt: "What is population density?", options: ["The total number of people in a country", "The number of people per unit area of land", "The rate at which a population grows each year", "The age distribution of a population", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e2", topicId: 53, prompt: "Which continent currently has the highest total population?", options: ["Europe", "Africa", "North America", "Asia", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_e3", topicId: 53, prompt: "A megacity is defined as a city with a population of:", options: ["Over 1 million", "Over 5 million", "Over 10 million", "Over 50 million", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_e4", topicId: 53, prompt: "Urbanisation refers to:", options: ["The decline of city populations", "The increasing proportion of a country's population living in urban areas", "Building new roads between cities", "Industrial growth in rural areas", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e5", topicId: 53, prompt: "Which factors tend to make an area DENSELY populated?", options: ["Desert conditions and very cold climate", "Mountainous terrain with poor soil", "Flat, fertile land near water and in a temperate climate", "Remote location far from trade routes", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_e6", topicId: 53, prompt: "What is natural increase in population?", options: ["Population growth caused by immigration", "The difference between birth rate and death rate (births minus deaths)", "Growth caused by improved nutrition", "Migration from rural to urban areas", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e7", topicId: 53, prompt: "The demographic transition model describes:", options: ["The movement of people between continents", "How a country's birth and death rates change as it develops economically", "The growth of megacities over time", "Climate-driven population shifts", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e8", topicId: 53, prompt: "Which of these is a PUSH factor driving people away from rural areas?", options: ["Better hospitals in the city", "Higher wages in the city", "Lack of jobs and services in rural areas", "Entertainment and cultural attractions in cities", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_e9", topicId: 53, prompt: "An ageing population creates challenges for a country including:", options: ["Too many schools needed", "Higher demand for pensions and healthcare with fewer workers to fund them", "Overcrowded cities", "Too many young people competing for jobs", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e10", topicId: 53, prompt: "Which of the following best describes a shanty town (informal settlement)?", options: ["A planned affordable housing development", "A historic city neighbourhood", "An area of self-built housing without legal status, often lacking clean water and sanitation", "A modern suburban development on city outskirts", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_53_e11", topicId: 53, prompt: "Which continent has the world's fastest population growth rate?", options: ["Europe", "Asia", "North America", "Africa", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_53_e12", topicId: 53, prompt: "The world's population reached 8 billion in 2022. In what year did it reach 1 billion for the first time?", options: ["Around 1500", "Around 1804", "Around 1900", "Around 1950", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e13", topicId: 53, prompt: "A conurbation is formed when:", options: ["A city is divided into different districts", "Separate cities grow and merge into one continuous built-up area", "A city builds satellite towns in the countryside", "Rural villages all decline at the same time", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e14", topicId: 53, prompt: "Why are sparsely populated areas such as the Sahara or Siberia so thinly inhabited?", options: ["Governments ban settlement there", "Extreme climates make agriculture, transport, and daily life very difficult", "These areas are entirely protected as nature reserves", "There are no natural resources there", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_53_e15", topicId: 53, prompt: "The primate city model describes a country where:", options: ["Animals are more populous than humans", "One dominant city is disproportionately larger than all other cities in the country", "Cities are evenly distributed across the country", "Rural areas are more populated than urban areas", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // Topic 54: Natural Resources — Exam
        54: [
            MathExamQuestion(id: "geo_54_e1", topicId: 54, prompt: "What is the key difference between renewable and non-renewable resources?", options: ["Renewable resources are always expensive; non-renewable are cheap", "Renewable resources replenish naturally on a human timescale; non-renewable do not", "Non-renewable resources are always underground", "Renewable resources are only found in wealthy countries", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e2", topicId: 54, prompt: "Which of these is a non-renewable resource?", options: ["Wind energy", "Timber from managed forests", "Coal", "Solar power", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_e3", topicId: 54, prompt: "Why are fossil fuels considered non-renewable?", options: ["They are found only in a few countries", "They take millions of years to form and are extracted far faster than they regenerate", "They are too dangerous to use again once burned", "They are owned by OPEC countries exclusively", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e4", topicId: 54, prompt: "OPEC (Organisation of Petroleum Exporting Countries) coordinates the production of:", options: ["Agricultural products", "Diamonds and precious metals", "Coal", "Oil", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_54_e5", topicId: 54, prompt: "Which country is the world's largest oil exporter?", options: ["Russia", "Iraq", "Saudi Arabia", "USA", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_e6", topicId: 54, prompt: "Resource curse refers to the paradox where:", options: ["Countries with no resources develop faster", "Countries rich in natural resources often experience slower economic growth, corruption, and conflict", "Resources always bring prosperity and peace", "Renewable resources harm economies more than fossil fuels", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e7", topicId: 54, prompt: "Which country contains the world's largest known reserves of freshwater in its rivers and glaciers?", options: ["China", "Russia", "USA", "Brazil", "I don't know / Wasn't taught"], correctIndex: 3),
            MathExamQuestion(id: "geo_54_e8", topicId: 54, prompt: "Cobalt is a critical mineral for electric vehicle batteries. Which country produces the most of it?", options: ["Brazil", "Australia", "Democratic Republic of Congo", "China", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_e9", topicId: 54, prompt: "What is energy security?", options: ["Protecting power stations from attack", "A country's ability to reliably access sufficient, affordable energy", "Using only renewable energy sources", "Storing energy in large batteries", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e10", topicId: 54, prompt: "Overfishing threatens ocean fish stocks because:", options: ["Fish are attracted to warmer ocean temperatures", "Fish populations are harvested faster than they can reproduce, threatening collapse", "Fishing boats scare fish away permanently", "Climate change makes fish migrate to new areas", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e11", topicId: 54, prompt: "Which African country is the world's leading producer of cocoa?", options: ["Nigeria", "Ghana", "Ivory Coast (Côte d'Ivoire)", "Cameroon", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "geo_54_e12", topicId: 54, prompt: "Fair trade agreements for resources aim to:", options: ["Allow wealthy nations to buy resources at the lowest price", "Ensure producers in developing countries receive a fair price and safe working conditions", "Reduce the total amount of resources traded globally", "Protect developed country industries from competition", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e13", topicId: 54, prompt: "Which of the following best describes a 'strategic resource'?", options: ["Any resource that is renewable", "A resource so important to a nation's economy or security that its loss would cause serious harm", "A resource that is traded on global markets", "Any mineral found underground", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e14", topicId: 54, prompt: "China dominates the global supply of rare earth elements. These are important because:", options: ["They are used to build traditional houses", "They are essential for high-tech devices, electric vehicles, and renewable energy technology", "They replace oil as a fuel source", "They are the rarest gemstones in the world", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "geo_54_e15", topicId: 54, prompt: "Water stress occurs when:", options: ["Rainfall causes flooding", "Demand for freshwater exceeds the available supply", "Too much freshwater is released into the ocean", "Rivers flood in all seasons", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

    47: [
        MathExamQuestion(id: "geo_47_e1",  topicId: 47, prompt: "The Universal Declaration of Human Rights was adopted by the UN in:", options: ["1918", "1945", "1948", "1960"], correctIndex: 2),
        MathExamQuestion(id: "geo_47_e2",  topicId: 47, prompt: "Which article of the UN Convention on the Rights of the Child states children have the right to education?", options: ["Article 1", "Article 12", "Article 28", "Article 42"], correctIndex: 2),
        MathExamQuestion(id: "geo_47_e3",  topicId: 47, prompt: "A stateless person is someone who:", options: ["Lives in a rural area", "Has no recognised legal nationality", "Has two passports", "Was born at sea"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e4",  topicId: 47, prompt: "The 1951 Refugee Convention defines a refugee as someone who:", options: ["Moves for economic reasons only", "Faces persecution based on race, religion, nationality, or political opinion", "Is studying abroad", "Works for an international company"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e5",  topicId: 47, prompt: "Which country hosted the largest refugee population in the world (as of recent years)?", options: ["Germany", "USA", "Turkey", "Jordan"], correctIndex: 2),
        MathExamQuestion(id: "geo_47_e6",  topicId: 47, prompt: "Children's right to play and leisure is protected under:", options: ["The Geneva Convention", "UN Convention on the Rights of the Child, Article 31", "The Kyoto Protocol", "The Paris Agreement"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e7",  topicId: 47, prompt: "Which of the following violates children's human rights?", options: ["Attending free school", "Being recruited as a child soldier", "Receiving medical care", "Having a birth certificate"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e8",  topicId: 47, prompt: "The right to asylum means:", options: ["The right to own a house", "The right to seek protection in another country from persecution", "Freedom of speech", "The right to vote"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e9",  topicId: 47, prompt: "Geography affects human rights because:", options: ["Human rights are unrelated to location", "Access to justice, healthcare, and education varies greatly by location and government", "All countries have identical rights", "Climate is the only geographic factor"], correctIndex: 1),
        MathExamQuestion(id: "geo_47_e10", topicId: 47, prompt: "Which international body has the primary responsibility for protecting human rights globally?", options: ["NATO", "The World Bank", "The United Nations", "The International Monetary Fund"], correctIndex: 2),
    ],
    ]
}
