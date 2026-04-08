import Foundation

struct HisTopicDefinition {
    let id: Int
    let nodeTitle: String
    let introTitle: String
    let introText: String
    let exampleText: String
    let iconSystemName: String
    let gradeLabel: String
}

enum HistoryGameData {
    static let questionsPerQuest = 5

    static let topics: [HisTopicDefinition] = [
        HisTopicDefinition(
            id: 1,
            nodeTitle: "My Family & Community",
            introTitle: "My Family & Community",
            introText: "Families come in many shapes and sizes. Every family has different members who play important roles. Communities are groups of people who live and work together, helping each other stay safe and happy.",
            exampleText: "A police officer helps keep the community safe. A teacher helps children learn. Parents care for their children at home.",
            iconSystemName: "house.fill",
            gradeLabel: "Grade 1"
        ),
        HisTopicDefinition(
            id: 2,
            nodeTitle: "Holidays & Traditions",
            introTitle: "Holidays & Traditions",
            introText: "People around the world celebrate different holidays and traditions. These special events connect us to our culture, religion, and family history. Traditions are passed down from generation to generation.",
            exampleText: "Christmas is celebrated on December 25th. Diwali is the Hindu festival of lights. Chinese New Year is celebrated with parades and fireworks.",
            iconSystemName: "star.fill",
            gradeLabel: "Grade 1"
        ),
        HisTopicDefinition(
            id: 3,
            nodeTitle: "Famous People in History",
            introTitle: "Famous People in History",
            introText: "Throughout history, certain people have changed the world with their courage, discoveries, and ideas. Learning about these heroes helps us understand how the world became the way it is today.",
            exampleText: "Martin Luther King Jr. fought for equal rights for all people. Neil Armstrong was the first person to walk on the Moon in 1969.",
            iconSystemName: "person.fill",
            gradeLabel: "Grade 2"
        ),
        HisTopicDefinition(
            id: 4,
            nodeTitle: "Then & Now",
            introTitle: "Then & Now",
            introText: "Life has changed a great deal over the last 100 years. Transport, communication, and everyday activities look very different from how they did in the past. Understanding these changes helps us appreciate modern life.",
            exampleText: "100 years ago, people sent letters by post. Today, we can send messages instantly by phone or email. Cars and aeroplanes replaced horses and steam trains.",
            iconSystemName: "clock.arrow.circlepath",
            gradeLabel: "Grade 2"
        ),
        HisTopicDefinition(
            id: 5,
            nodeTitle: "Early Explorers",
            introTitle: "Early Explorers",
            introText: "During the Age of Exploration, brave sailors set out to discover new lands and trade routes. These explorers were motivated by wealth, adventure, and the desire to spread their religion and culture.",
            exampleText: "Christopher Columbus sailed west from Spain in 1492 and reached the Americas. Ferdinand Magellan led the first voyage around the entire world.",
            iconSystemName: "map.fill",
            gradeLabel: "Grade 3"
        ),
        HisTopicDefinition(
            id: 6,
            nodeTitle: "Ancient Egypt",
            introTitle: "Ancient Egypt",
            introText: "Ancient Egypt was one of the world's greatest civilisations, lasting over 3,000 years. The Egyptians built magnificent pyramids, developed one of the earliest writing systems, and were ruled by powerful pharaohs.",
            exampleText: "The Great Pyramid of Giza was built for Pharaoh Khufu around 2560 BC. Egyptians wrote using picture symbols called hieroglyphics.",
            iconSystemName: "triangle.fill",
            gradeLabel: "Grade 3"
        ),
        HisTopicDefinition(
            id: 7,
            nodeTitle: "Ancient Greece",
            introTitle: "Ancient Greece",
            introText: "Ancient Greece gave the world democracy, the Olympic Games, and great philosophy. Greek city-states like Athens and Sparta had very different ways of life, and Greek myths explained the world around them.",
            exampleText: "Athens was famous for democracy  -  citizens could vote on laws. Socrates, Plato, and Aristotle were great philosophers who asked deep questions about life and truth.",
            iconSystemName: "building.columns.fill",
            gradeLabel: "Grade 4"
        ),
        HisTopicDefinition(
            id: 8,
            nodeTitle: "Ancient Rome",
            introTitle: "Ancient Rome",
            introText: "Rome grew from a small city into one of the greatest empires in history. The Romans built roads, aqueducts, and cities across Europe. They had a powerful army and gave us many ideas about law and government.",
            exampleText: "Julius Caesar was a famous Roman general and leader. The Romans built long, straight roads to move their army quickly. Aqueducts carried fresh water into cities.",
            iconSystemName: "crown.fill",
            gradeLabel: "Grade 4"
        ),
        HisTopicDefinition(
            id: 9,
            nodeTitle: "The Vikings",
            introTitle: "The Vikings",
            introText: "The Vikings were Norse seafarers from Scandinavia who lived from around 800 to 1100 AD. They were skilled sailors and explorers who travelled vast distances, raiding, trading, and settling new lands.",
            exampleText: "Vikings built longships that could sail across oceans and up rivers. Leif Erikson reached North America around 1000 AD, nearly 500 years before Columbus.",
            iconSystemName: "shield.fill",
            gradeLabel: "Grade 4"
        ),
        HisTopicDefinition(
            id: 10,
            nodeTitle: "Medieval Castles & Knights",
            introTitle: "Medieval Castles & Knights",
            introText: "During the Middle Ages, castles were the homes of lords and kings and served as centres of military power. Knights were armoured warriors who trained from childhood to fight on horseback. They followed a code of behaviour called chivalry, which required them to be brave, loyal, and courteous.",
            exampleText: "A knight wore heavy metal armour and rode a powerful warhorse into battle. Castles had thick stone walls, towers, and moats filled with water to keep enemies out.",
            iconSystemName: "shield.fill",
            gradeLabel: "Grade 4"
        ),
        HisTopicDefinition(
            id: 11,
            nodeTitle: "The Renaissance",
            introTitle: "The Renaissance",
            introText: "The Renaissance (14th–17th century) was a great rebirth of art, science, and culture that began in Italy. Thinkers called humanists focused on people and their potential, leading to extraordinary advances in art and science.",
            exampleText: "Leonardo da Vinci painted the Mona Lisa and designed flying machines. Michelangelo painted the Sistine Chapel ceiling. Shakespeare wrote famous plays like Romeo and Juliet.",
            iconSystemName: "paintbrush.fill",
            gradeLabel: "Grade 5"
        ),
        HisTopicDefinition(
            id: 12,
            nodeTitle: "Age of Exploration",
            introTitle: "Age of Exploration",
            introText: "From the 1400s to 1600s, European nations sent explorers across the globe seeking new trade routes, wealth, and land. Brave sailors crossed unknown oceans and discovered continents previously unknown to Europeans, changing the world forever.",
            exampleText: "Christopher Columbus sailed west from Spain in 1492 and reached the Americas. Ferdinand Magellan's crew completed the first voyage around the entire world. Vasco da Gama found a sea route to India.",
            iconSystemName: "ferry.fill",
            gradeLabel: "Grade 5"
        ),
        HisTopicDefinition(
            id: 13,
            nodeTitle: "The Industrial Revolution",
            introTitle: "The Industrial Revolution",
            introText: "The Industrial Revolution (1760–1840) began in Britain and changed the world. Machines powered by steam replaced hand tools. Factories grew up in cities, and millions of people moved from the countryside to find work. Railways transformed how people and goods moved across the country.",
            exampleText: "James Watt improved the steam engine in 1769, making factories far more powerful. The world's first passenger railway opened in 1825 between Stockton and Darlington. Cities like Manchester and Birmingham grew rapidly.",
            iconSystemName: "gear",
            gradeLabel: "Grade 5"
        ),
        HisTopicDefinition(
            id: 14,
            nodeTitle: "World War I",
            introTitle: "World War I",
            introText: "World War I (1914–1918) was triggered by the assassination of Archduke Franz Ferdinand of Austria in Sarajevo. The Allied Powers (Britain, France, Russia, USA) fought the Central Powers (Germany, Austria-Hungary, Ottoman Empire). Trench warfare dominated the Western Front, and new weapons including poison gas and tanks were used.",
            exampleText: "Soldiers on the Western Front lived in muddy trenches for months at a time. The Battle of the Somme in 1916 had over one million casualties. The war ended with the Treaty of Versailles in 1919.",
            iconSystemName: "map.fill",
            gradeLabel: "Grade 5"
        ),
        HisTopicDefinition(
            id: 15,
            nodeTitle: "World War II",
            introTitle: "World War II",
            introText: "World War II (1939–1945) was the deadliest conflict in human history. The Axis powers (Germany, Italy, Japan) fought the Allied powers (Britain, France, USSR, USA). Key events include the Japanese attack on Pearl Harbor (1941), the D-Day landings (1944), and Allied victory in 1945.",
            exampleText: "D-Day on June 6, 1944 saw Allied troops land on the beaches of Normandy, France. The Holocaust saw six million Jewish people murdered by the Nazis. The war ended when Japan surrendered after atomic bombs were dropped on Hiroshima and Nagasaki.",
            iconSystemName: "globe.europe.africa.fill",
            gradeLabel: "Grade 5"
        ),
        HisTopicDefinition(
            id: 16, nodeTitle: "Industrial Revolution",
            introTitle: "Industrial Revolution Quest",
            introText: "The Industrial Revolution (1760–1840) began in Britain and changed the world. Machines powered by steam replaced hand tools. Factories grew up in cities, and millions of people moved from the countryside to find work. James Watt improved the steam engine, making it far more powerful. Railways transformed how people and goods moved across the country.",
            exampleText: "Key Facts:\n⚙️ Steam engine  -  James Watt, 1769\n🏭 Factories replaced cottage industries\n🚂 First passenger railway  -  1825, Stockton to Darlington\n👧 Child labour was common in mines & mills\n🏙️ Urbanisation  -  cities like Manchester & Birmingham grew rapidly",
            iconSystemName: "gear", gradeLabel: "Grade 6"
        ),

        HisTopicDefinition(
            id: 17, nodeTitle: "Age of Empires",
            introTitle: "Age of Empires Quest",
            introText: "Between the 1600s and 1900s, European nations built vast empires across the globe. Britain, France, the Netherlands, Belgium, and others colonised lands in Africa, Asia, and the Americas. Colonisers claimed resources, set up trade routes, and controlled local populations. The British Empire became so large that people said \"the sun never sets\" on it.",
            exampleText: "Key Facts:\n🇬🇧 British Empire  -  largest in history\n🇫🇷 French Empire  -  West Africa, South-East Asia\n🇳🇱 Dutch  -  Indonesia, South Africa\n🇧🇪 Belgium  -  Congo (brutal rule)\n🌍 Scramble for Africa  -  1880s, European powers divided Africa",
            iconSystemName: "globe.americas.fill", gradeLabel: "Grade 6"
        ),

        HisTopicDefinition(
            id: 18, nodeTitle: "Slavery & Abolition",
            introTitle: "Slavery & Abolition Quest",
            introText: "The transatlantic slave trade forcibly transported millions of Africans to the Americas between the 1500s and 1800s. Enslaved people were forced to work on plantations. Abolitionists campaigned to end slavery. Key figures include Harriet Tubman, Frederick Douglass, and William Wilberforce. The 13th Amendment to the US Constitution abolished slavery in 1865.",
            exampleText: "Key Facts:\n⛓️ Transatlantic slave trade  -  12+ million Africans transported\n✊ Harriet Tubman  -  escaped slavery, freed many others\n📝 Frederick Douglass  -  abolitionist writer and speaker\n🏛️ William Wilberforce  -  British MP who fought to end slave trade\n📜 13th Amendment 1865  -  slavery abolished in the USA",
            iconSystemName: "person.fill.checkmark", gradeLabel: "Grade 6"
        ),

        HisTopicDefinition(
            id: 19, nodeTitle: "The American Civil War",
            introTitle: "American Civil War Quest",
            introText: "The American Civil War (1861–1865) was fought between the Union (Northern states) and the Confederacy (Southern states). Key causes included slavery and states' rights. President Abraham Lincoln led the Union. The Gettysburg Address (1863) is one of history's most famous speeches. Lincoln's Emancipation Proclamation declared enslaved people in Confederate states to be free.",
            exampleText: "Key Facts:\n🛡️ 1861–1865  -  deadliest war in US history\n🇺🇸 Union (North) vs. Confederacy (South)\n📜 Emancipation Proclamation  -  1863\n🎤 Gettysburg Address  -  November 1863\n🕊️ Union victory ended slavery in the USA\n🏥 Clara Barton  -  nurse, founded American Red Cross",
            iconSystemName: "shield.lefthalf.filled", gradeLabel: "Grade 6"
        ),

        HisTopicDefinition(
            id: 20, nodeTitle: "World War I",
            introTitle: "World War I Quest",
            introText: "World War I (1914–1918) was triggered by the assassination of Archduke Franz Ferdinand of Austria in Sarajevo. The Allied Powers (Britain, France, Russia, USA) fought the Central Powers (Germany, Austria-Hungary, Ottoman Empire). Trench warfare dominated the Western Front. New weapons including poison gas, tanks, and aeroplanes were used. The war ended with the Treaty of Versailles in 1919.",
            exampleText: "Key Facts:\n💥 Assassination of Franz Ferdinand  -  June 28, 1914\n🌍 Allied Powers vs. Central Powers\n⚔️ Trench warfare  -  Western Front\n🎖️ Battle of the Somme  -  1916, over 1 million casualties\n📜 Treaty of Versailles  -  1919, blamed Germany\n🇺🇸 USA entered the war in 1917",
            iconSystemName: "map.fill", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 21, nodeTitle: "The Russian Revolution",
            introTitle: "Russian Revolution Quest",
            introText: "In 1917, Russia experienced two revolutions. Tsar Nicholas II was overthrown in February after years of poverty and military failure. In October, Lenin and the Bolsheviks seized power. They established the Soviet Union (USSR) based on communist principles. This created a long-lasting rivalry between capitalism (the West) and communism (the USSR).",
            exampleText: "Key Facts:\n👑 Tsar Nicholas II  -  overthrown February 1917\n🔴 Lenin and the Bolsheviks  -  October Revolution 1917\n☭ USSR (Soviet Union)  -  formed 1922\n🏭 Communism  -  state owns all property & industry\n⚔️ Russian Civil War (1917–1922) followed the revolution\n🌟 Leon Trotsky  -  key Bolshevik leader",
            iconSystemName: "star.circle.fill", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 22, nodeTitle: "The Great Depression",
            introTitle: "The Great Depression Quest",
            introText: "The Great Depression began with the Wall Street Crash in October 1929. Stock prices collapsed, banks failed, and millions lost their jobs. In the USA, the Dust Bowl worsened the crisis for farmers. President Franklin D. Roosevelt introduced the New Deal  -  a series of programmes to provide relief and recovery. The Depression affected countries around the world.",
            exampleText: "Key Facts:\n📉 Wall Street Crash  -  October 1929\n💸 Unemployment reached 25% in the USA\n🌾 Dust Bowl  -  drought destroyed farmland in the 1930s\n🏛️ FDR's New Deal  -  relief, recovery, reform\n🌍 Global impact  -  trade collapsed worldwide\n🔧 New Deal created jobs building roads, dams, and buildings",
            iconSystemName: "chart.line.downtrend.xyaxis", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 23, nodeTitle: "World War II",
            introTitle: "World War II Quest",
            introText: "World War II (1939–1945) was the deadliest conflict in human history. The Axis powers (Germany, Italy, Japan) fought the Allied powers (Britain, France, USSR, USA). Key events include the Japanese attack on Pearl Harbor (1941), D-Day landings (1944), and the use of atomic bombs on Hiroshima and Nagasaki (1945). The war ended with Allied victory and the founding of the United Nations.",
            exampleText: "Key Facts:\n💣 1939–1945  -  70–85 million people died\n🌍 Axis (Germany, Italy, Japan) vs. Allies\n🚢 Pearl Harbor  -  December 7, 1941\n🏖️ D-Day  -  June 6, 1944 (Normandy landings)\n☢️ Atomic bombs  -  Hiroshima & Nagasaki, August 1945\n🌐 United Nations founded  -  1945",
            iconSystemName: "globe.europe.africa.fill", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 24, nodeTitle: "The Holocaust",
            introTitle: "The Holocaust Quest",
            introText: "The Holocaust was the systematic persecution and murder of six million Jewish people by the Nazi regime during World War II. Other groups, including Roma people, people with disabilities, and political opponents, were also targeted. The Nuremberg trials held Nazi leaders accountable after the war. The Holocaust is remembered so that such atrocities are never repeated.",
            exampleText: "Key Facts:\n📚 Holocaust  -  from Greek, meaning 'whole burnt'\n6 million Jewish people murdered by the Nazi regime\n🏕️ Concentration camps  -  places of forced labour and murder\n⚖️ Nuremberg Trials (1945–46)  -  Nazi leaders tried for war crimes\n🕯️ Yad Vashem  -  Israel's Holocaust memorial\n✏️ Anne Frank  -  kept a diary in hiding; died in Bergen-Belsen",
            iconSystemName: "book.closed.fill", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 25, nodeTitle: "The Cold War",
            introTitle: "The Cold War Quest",
            introText: "The Cold War (1947–1991) was a period of political and military tension between the USA and the USSR. Although the two superpowers never fought each other directly, they competed through proxy wars, the nuclear arms race, the Space Race, and ideological rivalry. Key events include the Berlin Wall (built 1961), the Cuban Missile Crisis (1962), and the fall of the USSR in 1991.",
            exampleText: "Key Facts:\n🌡️ 1947–1991  -  USA vs. USSR rivalry\n☢️ Nuclear arms race  -  both sides built thousands of weapons\n🧱 Berlin Wall  -  built 1961, fell 1989\n🚀 Space Race  -  Sputnik (1957), Moon landing (1969)\n🇨🇺 Cuban Missile Crisis  -  1962, closest to nuclear war\n🏳️ USSR collapsed  -  1991, Cold War ends",
            iconSystemName: "thermometer.snowflake", gradeLabel: "Grade 7"
        ),

        HisTopicDefinition(
            id: 26, nodeTitle: "Decolonisation",
            introTitle: "Decolonisation Quest",
            introText: "Decolonisation refers to the process by which colonised countries gained independence from European empires. This happened mainly between the 1940s and 1970s. India gained independence in 1947, led partly by Mahatma Gandhi's non-violent resistance movement. Across Africa, dozens of nations became independent in the 1950s and 1960s. By the 1970s, most European colonial empires had ended.",
            exampleText: "Key Facts:\n🕊️ India independence  -  1947 (Mahatma Gandhi)\n🇮🇳 Partition of India  -  India and Pakistan created\n🌍 Year of Africa  -  1960, 17 African nations gained independence\n🇬🇭 Ghana  -  first sub-Saharan African country to gain independence (1957)\n🇿🇦 Nelson Mandela  -  fought apartheid in South Africa\n🏳️ End of empires  -  most colonies independent by 1970s",
            iconSystemName: "flag.2.crossed.fill", gradeLabel: "Grade 8"
        ),

        HisTopicDefinition(
            id: 27, nodeTitle: "Civil Rights Movement",
            introTitle: "Civil Rights Movement Quest",
            introText: "The Civil Rights Movement in the USA (1950s–60s) was a campaign for equal rights for African Americans. Leaders like Martin Luther King Jr. used non-violent protest. Rosa Parks refused to give up her bus seat in 1955. The March on Washington in 1963 saw King deliver his famous 'I Have a Dream' speech. The Civil Rights Act (1964) and Voting Rights Act (1965) were landmark victories.",
            exampleText: "Key Facts:\n✊ Martin Luther King Jr.  -  led non-violent protests\n🚌 Rosa Parks  -  refused to give up bus seat (1955)\n🏛️ March on Washington  -  August 28, 1963\n🎤 'I Have a Dream' speech  -  MLK, 1963\n📜 Civil Rights Act 1964  -  banned racial discrimination\n🗳️ Voting Rights Act 1965  -  protected voting rights",
            iconSystemName: "hand.raised.fill", gradeLabel: "Grade 8"
        ),

        HisTopicDefinition(
            id: 28, nodeTitle: "The Space Race",
            introTitle: "The Space Race Quest",
            introText: "The Space Race (1957–1969) was a competition between the USA and USSR to achieve superiority in space exploration. The USSR launched Sputnik, the first satellite, in 1957. Yuri Gagarin became the first human in space in 1961. NASA's Apollo 11 mission landed astronauts Neil Armstrong and Buzz Aldrin on the Moon on July 20, 1969. Armstrong's words upon landing are among the most famous in history.",
            exampleText: "Key Facts:\n🛰️ Sputnik  -  first satellite, USSR, 1957\n👨‍🚀 Yuri Gagarin  -  first human in space, April 12, 1961\n🌕 Apollo 11  -  Moon landing, July 20, 1969\n👟 Neil Armstrong  -  first person on the Moon\n🚀 NASA  -  US space agency, founded 1958\n🌟 'One small step for man…'  -  Armstrong's famous words",
            iconSystemName: "sparkles", gradeLabel: "Grade 8"
        ),

        HisTopicDefinition(
            id: 29, nodeTitle: "The Modern World",
            introTitle: "The Modern World Quest",
            introText: "The modern era saw rapid change. The Berlin Wall fell in 1989, signalling the end of the Cold War. The September 11, 2001 attacks in the USA led to major changes in global security and foreign policy. The rise of the internet connected billions of people. Globalisation brought countries closer economically, while climate change emerged as one of the greatest challenges facing humanity.",
            exampleText: "Key Facts:\n🧱 Berlin Wall falls  -  November 9, 1989\n🌐 World Wide Web  -  invented by Tim Berners-Lee, 1991\n💥 9/11 attacks  -  September 11, 2001\n📱 Smartphone era  -  iPhone launched 2007\n🌍 Globalisation  -  worldwide trade and communication\n🌡️ Climate change  -  major global challenge",
            iconSystemName: "network", gradeLabel: "Grade 8"
        ),

        HisTopicDefinition(
            id: 30, nodeTitle: "Revolutions & Change",
            introTitle: "Revolutions & Change Quest",
            introText: "A revolution is a dramatic and wide-reaching change in society, government, or technology. Political revolutions like the French and American revolutions changed how nations were governed. The Industrial Revolution transformed economies. The Digital Revolution of the late 20th century changed how we communicate and access information. Revolutions have causes, effects, and lasting legacies.",
            exampleText: "Key Revolutions:\n🏛️ American Revolution (1776)  -  independence from Britain\n⚔️ French Revolution (1789)  -  liberty, equality, fraternity\n⚙️ Industrial Revolution (1760s)  -  factories, steam power\n🖥️ Digital Revolution (1980s–)  -  computers, internet\n🔄 Causes: inequality, new ideas, technology\n📖 Legacy: revolutions reshape laws, society, and daily life",
            iconSystemName: "arrow.clockwise.circle.fill", gradeLabel: "Grade 8"
        ),

        HisTopicDefinition(
        id: 31,
        nodeTitle: "Mesopotamia",
        introTitle: "Mesopotamia",
        introText: "Mesopotamia, meaning 'land between the rivers', was one of the earliest civilisations on Earth, located between the Tigris and Euphrates rivers in modern-day Iraq. The Sumerians invented cuneiform writing  -  one of the world's first writing systems. The Babylonian king Hammurabi created one of the earliest written law codes, showing that rules were important even in ancient times.",
        exampleText: "📜 Hammurabi's Code had 282 laws carved into a stone pillar. 🌾 Farmers in Mesopotamia used irrigation channels from the rivers to grow food. 🏛️ The Sumerians built great temple-towers called ziggurats.",
        iconSystemName: "building.columns.fill",
        gradeLabel: "Grade 4"
    ),

    HisTopicDefinition(
        id: 32,
        nodeTitle: "Ancient India",
        introTitle: "Ancient India",
        introText: "One of the world's earliest urban civilisations grew along the Indus River around 2500 BC, with well-planned cities like Mohenjo-daro and Harappa. Later, the Maurya Empire united much of India, and Emperor Ashoka famously converted to Buddhism and spread its peaceful teachings across Asia. India is also the birthplace of Hinduism, one of the world's oldest religions.",
        exampleText: "🏙️ Indus Valley cities had straight streets and advanced drainage systems. ☸️ Emperor Ashoka sent Buddhist missionaries as far as Sri Lanka and Central Asia. 🕉️ Hinduism gave the world the concepts of karma, dharma, and reincarnation.",
        iconSystemName: "triangle.fill",
        gradeLabel: "Grade 4"
    ),

    HisTopicDefinition(
        id: 33,
        nodeTitle: "Ancient Persia",
        introTitle: "Ancient Persia",
        introText: "The Achaemenid Empire of Persia was one of the largest empires the ancient world had ever seen, stretching from Egypt to India. Cyrus the Great founded it around 550 BC and was known for respecting the cultures and religions of conquered peoples. Darius I expanded the empire further and clashed with the Greek city-states in a series of famous wars.",
        exampleText: "🗺️ The Persian Empire connected peoples from Africa to Central Asia under one rule. 🏹 The Battle of Marathon in 490 BC saw the Greeks defeat a much larger Persian army. 🛣️ Darius built the Royal Road  -  a highway spanning over 2,700 km for swift communication.",
        iconSystemName: "flame.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 34,
        nodeTitle: "Feudalism",
        introTitle: "Feudalism",
        introText: "Feudalism was the social and political system that organised medieval Europe, roughly from the 9th to the 15th centuries. At the top was the king, who granted land to lords in exchange for military loyalty; lords in turn had knights who protected the land, while serfs at the bottom farmed the fields and owed labour to their lord. This pyramid of duties and obligations kept medieval society running.",
        exampleText: "👑 A king would grant a lord a manor in exchange for soldiers when needed. ⚔️ Knights trained from childhood to fight on horseback for their lord. 🌾 Serfs could not leave the manor without the lord's permission and paid rent through labour.",
        iconSystemName: "crown.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 35,
        nodeTitle: "Medieval Church",
        introTitle: "The Medieval Church",
        introText: "During the Middle Ages, the Catholic Church was the most powerful institution in Europe, influencing everything from politics to daily life. The Pope in Rome held enormous authority, sometimes even over kings and emperors. Monasteries preserved ancient knowledge, cared for the sick, and ran schools, while grand cathedrals were built as symbols of faith and community pride.",
        exampleText: "⛪ Notre Dame Cathedral in Paris took nearly 200 years to build. 📖 Monks hand-copied books in monasteries, preserving ancient texts through the Dark Ages. ✝️ The Pope could excommunicate rulers  -  banning them from the Church  -  as a powerful political weapon.",
        iconSystemName: "building.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 36,
        nodeTitle: "Medieval Life",
        introTitle: "Medieval Life & Culture",
        introText: "Life in medieval Europe revolved around the seasons, the Church, and the local community. Most people were peasants who farmed the land, while skilled craftspeople formed guilds to protect their trades. The Black Death of 1347-1351 was a devastating plague that killed roughly a third of Europe's population, shaking the feudal order and changing society forever.",
        exampleText: "🏰 A medieval castle was both a home for the lord and a fortress for defence. 🔨 Guilds set standards for quality  -  a blacksmith's apprentice could work for years before becoming a master. 💀 The Black Death killed around 25 million people in Europe in just four years.",
        iconSystemName: "shield.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 37,
        nodeTitle: "The Crusades",
        introTitle: "The Crusades",
        introText: "The Crusades were a series of religious military campaigns launched by Christian Europe between 1095 and 1291, primarily to capture Jerusalem and the Holy Land from Muslim rule. Though largely unsuccessful in their military goals, the Crusades had profound consequences: they opened up trade routes, brought new ideas and technologies to Europe, and left a complex legacy of conflict and cultural exchange between East and West.",
        exampleText: "⚔️ Pope Urban II called the First Crusade in 1095, inspiring thousands to march to the Holy Land. 🕌 Crusaders encountered advanced Islamic science, medicine, and mathematics, which they brought back to Europe. 🏰 The Crusaders built mighty castles like Krak des Chevaliers to defend captured territory.",
        iconSystemName: "cross.fill",
        gradeLabel: "Grade 6"
    ),

    HisTopicDefinition(
        id: 38,
        nodeTitle: "Byzantine Empire",
        introTitle: "Byzantine Empire",
        introText: "The Byzantine Empire was the continuation of the Eastern Roman Empire after the fall of Rome in 476 AD, lasting over a thousand years until 1453. Emperor Justinian I codified Roman law into the Corpus Juris Civilis and built the stunning Hagia Sophia in Constantinople. The Byzantines preserved Greco-Roman culture and Orthodox Christianity, passing them on to later European and Slavic civilisations.",
        exampleText: "🕌 The Hagia Sophia was the largest cathedral in the world for nearly 1,000 years. 📜 Justinian's law code became the foundation of legal systems across Europe. 🏛️ When Constantinople fell to the Ottomans in 1453, many scholars fled to Italy  -  helping spark the Renaissance.",
        iconSystemName: "star.fill",
        gradeLabel: "Grade 6"
    ),

        HisTopicDefinition(
        id: 39,
        nodeTitle: "The Silk Road",
        introTitle: "The Silk Road",
        introText: "The Silk Road was a vast network of ancient trade routes connecting China and East Asia to Central Asia, the Middle East, and Europe. Merchants carried goods, ideas, religions, and diseases across thousands of miles of desert, mountains, and steppes. The explorer Marco Polo famously travelled the Silk Road in the 13th century, bringing knowledge of the East back to Europe.",
        exampleText: "🐪 Imagine a camel caravan crossing the desert, loaded with Chinese silk, Indian spices, and Roman glass  -  all being traded between merchants from dozens of different cultures!",
        iconSystemName: "road.lanes",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 40,
        nodeTitle: "Constitutional Gov",
        introTitle: "Constitutional Government",
        introText: "Constitutional government means that rulers must follow a set of laws or rules rather than having absolute power. The Magna Carta of 1215 was an early landmark that limited the English king's power and protected certain rights. Over centuries, democracies developed constitutions that guaranteed freedoms and set up elected governments to represent the people.",
        exampleText: "📜 Think of a constitution like the rules of a game  -  even the most powerful player (the king or president) must follow them, and everyone has rights that can't be taken away!",
        iconSystemName: "scroll.fill",
        gradeLabel: "Grade 6"
    ),

    HisTopicDefinition(
        id: 41,
        nodeTitle: "Women in History",
        introTitle: "Women in History",
        introText: "Throughout history, remarkable women have led armies, ruled empires, and fought for equal rights. Cleopatra ruled Egypt brilliantly, Joan of Arc led France to victory in battle, and Elizabeth I guided England through a golden age. The suffrage movement in the 19th and 20th centuries won women the right to vote, transforming societies around the world.",
        exampleText: "👑 Imagine being told you can't vote, own property, or go to school  -  then picture the brave women who stood up and changed those rules forever, one courageous step at a time!",
        iconSystemName: "person.fill",
        gradeLabel: "Grade 6"
    ),

    HisTopicDefinition(
        id: 42,
        nodeTitle: "African Kingdoms",
        introTitle: "Ancient African Kingdoms",
        introText: "Africa was home to some of history's greatest civilisations, including the empires of Mali, Songhai, and the city-state of Great Zimbabwe. The Mali Empire's ruler Mansa Musa was considered one of the wealthiest people who ever lived, and he controlled the trans-Saharan gold and salt trade. These kingdoms built grand cities, developed writing and scholarship, and traded across vast distances.",
        exampleText: "🏆 Picture Mansa Musa's legendary pilgrimage to Mecca  -  he brought so much gold that he caused inflation in Egypt just by spending it along the way!",
        iconSystemName: "sun.max.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 43,
        nodeTitle: "Ancient Americas",
        introTitle: "Ancient Americas",
        introText: "Long before Europeans arrived, the Americas were home to powerful civilisations including the Aztec, Maya, and Inca. The Maya built towering pyramids and developed one of the world's most accurate calendars, while the Inca created a vast empire across the Andes mountains. Spanish conquistadors in the 16th century overthrew these civilisations through military conquest and the spread of disease.",
        exampleText: "🔭 Did you know the Maya predicted solar eclipses with remarkable accuracy  -  all without telescopes or modern computers? Their calendar calculations were extraordinarily precise!",
        iconSystemName: "mountain.2.fill",
        gradeLabel: "Grade 5"
    ),

    HisTopicDefinition(
        id: 44,
        nodeTitle: "Mongol Empire",
        introTitle: "The Mongol Empire",
        introText: "Under Genghis Khan in the early 13th century, the Mongols built the largest contiguous land empire in history, stretching from the Pacific Ocean to Eastern Europe. The Pax Mongolica (Mongol Peace) that followed allowed safe trade and cultural exchange across Eurasia along the Silk Road. Though their conquests were often brutal, the Mongols connected East and West in ways that shaped the modern world.",
        exampleText: "🐴 The Mongol army was like the most powerful machine of its time  -  disciplined horse archers who could ride hundreds of miles and communicate across their vast empire using relay stations!",
        iconSystemName: "shield.fill",
        gradeLabel: "Grade 6"
    ),

    HisTopicDefinition(
        id: 45,
        nodeTitle: "Ottoman Empire",
        introTitle: "The Ottoman Empire",
        introText: "The Ottoman Empire rose in Anatolia (modern-day Turkey) and became one of the most powerful states in the world, lasting over 600 years from 1299 to 1922. Sultan Suleiman the Magnificent expanded the empire to its greatest extent, controlling territories across three continents. The fall of Constantinople to the Ottomans in 1453 marked the end of the Byzantine Empire and a turning point in world history.",
        exampleText: "🕌 Imagine an empire so large and diverse it included people who spoke Turkish, Arabic, Greek, Armenian, and dozens of other languages  -  all governed by one sultan from his palace in Istanbul!",
        iconSystemName: "building.2.fill",
        gradeLabel: "Grade 7"
    ),

    HisTopicDefinition(
        id: 46,
        nodeTitle: "Post-Cold War",
        introTitle: "Post-Cold War World",
        introText: "When the Soviet Union collapsed in 1991, the Cold War ended and the world changed dramatically. Globalisation connected economies, cultures, and technology across borders at an unprecedented pace. The September 11, 2001 terrorist attacks triggered the War on Terror, reshaping international politics, while China's rapid rise as an economic and military power created a new multipolar world.",
        exampleText: "🌐 Think about how your smartphone connects you instantly to someone on the other side of the planet  -  that's globalisation in action, one of the defining features of the post-Cold War world!",
        iconSystemName: "globe",
        gradeLabel: "Grade 8"
    ),
    HisTopicDefinition(
        id: 47,
        nodeTitle: "Big Bang & Earth",
        introTitle: "The Big Bang & Formation of Earth",
        introText: "About 13.8 billion years ago, all matter and energy exploded outward from a single point — the Big Bang. Over billions of years, gravity pulled gas and dust together to form stars and galaxies. Our Solar System formed 4.6 billion years ago, and Earth cooled to form oceans and an atmosphere capable of supporting life.",
        exampleText: "🌌 The universe is still expanding today! Scientists know this because distant galaxies are moving away from us — discovered by Edwin Hubble in 1929.",
        iconSystemName: "sparkles",
        gradeLabel: "Grade 3"
    ),
    HisTopicDefinition(
        id: 48,
        nodeTitle: "Dinosaurs",
        introTitle: "Dinosaurs & Prehistoric Life",
        introText: "Life on Earth began about 3.5 billion years ago as simple single-celled organisms. Over hundreds of millions of years, life grew more complex. The Mesozoic Era (252–66 million years ago) was the Age of Dinosaurs — gigantic reptiles that ruled the land, sea, and sky. A mass extinction event 66 million years ago (likely a meteor impact) wiped out the non-bird dinosaurs.",
        exampleText: "🦕 The T. rex had teeth the size of bananas and could bite with a force of 57,000 Newtons — strong enough to crush bone! Birds are actually living descendants of theropod dinosaurs.",
        iconSystemName: "fossil.shell.fill",
        gradeLabel: "Grade 3"
    ),
    HisTopicDefinition(
        id: 49,
        nodeTitle: "Early Humans",
        introTitle: "Early Humans & Human Evolution",
        introText: "Modern humans (Homo sapiens) evolved in Africa about 300,000 years ago. Before us, other human species like Homo erectus and Neanderthals roamed the Earth. Early humans were hunter-gatherers who used fire, made tools from stone and bone, and communicated with language. Around 70,000 years ago, humans began migrating out of Africa to populate the rest of the world.",
        exampleText: "🏕️ Neanderthals and Homo sapiens actually lived at the same time and even had children together — about 1–4% of non-African people's DNA today comes from Neanderthals!",
        iconSystemName: "figure.walk",
        gradeLabel: "Grade 4"
    ),
    HisTopicDefinition(
        id: 50,
        nodeTitle: "The Stone Age",
        introTitle: "The Stone Age",
        introText: "The Stone Age lasted from about 3.3 million years ago until around 3,000 BC. Early humans made weapons and tools from flint and stone. In the Palaeolithic period, people were nomadic hunter-gatherers. The Neolithic Revolution (around 10,000 BC) brought farming — people began growing crops and keeping animals, settling in permanent villages for the first time.",
        exampleText: "🪨 Stonehenge in England was built during the late Stone Age, around 3,000–1,500 BC. These enormous stones were moved from over 150 miles away — an extraordinary feat without modern machinery!",
        iconSystemName: "mountain.2.fill",
        gradeLabel: "Grade 4"
    ),
    HisTopicDefinition(
        id: 51,
        nodeTitle: "Bronze & Iron Age",
        introTitle: "The Bronze Age & Iron Age",
        introText: "The Bronze Age (c.3,000–1,200 BC) began when people discovered that mixing copper and tin created bronze — a stronger metal for tools and weapons. This led to the rise of the first cities and writing systems. The Iron Age (c.1,200–550 BC) followed as iron smelting spread, making stronger tools available to more people. These advances transformed farming, warfare, and trade.",
        exampleText: "⚔️ Iron weapons were a game-changer! Iron is harder and more widely available than bronze, so iron swords and ploughs gave an advantage to cultures who mastered the skill of smelting it first.",
        iconSystemName: "hammer.fill",
        gradeLabel: "Grade 4"
    ),
    ]

    // MARK: - Practice Questions

    private static let practiceQuestionsByTopic: [Int: [MathExamQuestion]] = [

        // MARK: Topic 1  -  My Family & Community
        1: [
            MathExamQuestion(
                id: "his_1_p1",
                topicId: 1,
                prompt: "Which community helper keeps people safe from crime?",
                options: ["Dentist", "Police officer", "Chef", "Librarian"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p2",
                topicId: 1,
                prompt: "What is the main job of a teacher?",
                options: ["To cook meals", "To fix cars", "To help children learn", "To deliver letters"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_1_p3",
                topicId: 1,
                prompt: "Who is a member of your family?",
                options: ["Your neighbour's dog", "Your grandmother", "Your school principal", "Your postman"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p4",
                topicId: 1,
                prompt: "Which of these is a community helper who puts out fires?",
                options: ["Firefighter", "Pilot", "Farmer", "Mechanic"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_1_p5",
                topicId: 1,
                prompt: "Why do communities have rules?",
                options: ["To make life boring", "To keep people safe and happy", "So only adults can have fun", "To stop children going to school"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p6",
                topicId: 1,
                prompt: "A doctor's job is to…",
                options: ["Deliver your post", "Help sick people get better", "Drive the school bus", "Sell food at the market"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p7",
                topicId: 1,
                prompt: "Which word describes a group of people who live and work in the same area?",
                options: ["Planet", "Community", "Galaxy", "Ocean"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p8",
                topicId: 1,
                prompt: "What is one responsibility children have at home?",
                options: ["Going on holiday every week", "Tidying their room", "Driving a car", "Running a shop"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p9",
                topicId: 1,
                prompt: "Which community helper works in a library?",
                options: ["Nurse", "Librarian", "Plumber", "Astronaut"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_p10",
                topicId: 1,
                prompt: "What does a parent do for their family?",
                options: ["Only earns money", "Cares for and protects their children", "Lives alone", "Works as a police officer only"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 2  -  Holidays & Traditions
        2: [
            MathExamQuestion(
                id: "his_2_p1",
                topicId: 2,
                prompt: "Which holiday celebrates the birth of Jesus Christ?",
                options: ["Diwali", "Eid al-Fitr", "Christmas", "Hanukkah"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_p2",
                topicId: 2,
                prompt: "Diwali is known as the festival of…",
                options: ["Water", "Lights", "Harvest", "Music"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_p3",
                topicId: 2,
                prompt: "Which religion celebrates Eid al-Fitr?",
                options: ["Christianity", "Hinduism", "Islam", "Judaism"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_p4",
                topicId: 2,
                prompt: "Chinese New Year is celebrated with…",
                options: ["Christmas trees", "Fireworks and parades", "Easter eggs", "Pumpkin carving"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_p5",
                topicId: 2,
                prompt: "Hanukkah is a Jewish festival that involves lighting a special candleholder called a…",
                options: ["Menorah", "Diya", "Lantern", "Bonfire"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_2_p6",
                topicId: 2,
                prompt: "Why are traditions important?",
                options: ["They make food tastier", "They connect us to our culture and family history", "They replace school lessons", "They are only for adults"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_p7",
                topicId: 2,
                prompt: "Christmas is celebrated on which date?",
                options: ["January 1st", "October 31st", "December 25th", "March 17th"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_p8",
                topicId: 2,
                prompt: "Which holiday involves dressing in costumes and collecting sweets?",
                options: ["Diwali", "Halloween", "Eid", "Hanukkah"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_p9",
                topicId: 2,
                prompt: "What animal is associated with Chinese New Year celebrations?",
                options: ["Eagle", "Dragon", "Elephant", "Tiger"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_p10",
                topicId: 2,
                prompt: "Traditions are usually passed down from…",
                options: ["Strangers on the internet", "Teachers at school only", "Generation to generation in families", "Television programmes"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 3  -  Famous People in History
        3: [
            MathExamQuestion(
                id: "his_3_p1",
                topicId: 3,
                prompt: "Martin Luther King Jr. is famous for fighting for…",
                options: ["Space exploration", "Equal rights for all people", "Inventing the telephone", "Building the pyramids"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p2",
                topicId: 3,
                prompt: "Rosa Parks is famous for refusing to give up her seat on a…",
                options: ["Train", "Bus", "Plane", "Bicycle"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p3",
                topicId: 3,
                prompt: "Amelia Earhart was the first woman to fly solo across which ocean?",
                options: ["Pacific Ocean", "Indian Ocean", "Atlantic Ocean", "Arctic Ocean"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_p4",
                topicId: 3,
                prompt: "Neil Armstrong was the first person to…",
                options: ["Climb Mount Everest", "Walk on the Moon", "Sail around the world", "Discover electricity"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p5",
                topicId: 3,
                prompt: "Marie Curie was a famous…",
                options: ["Painter", "Queen", "Scientist", "Explorer"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_p6",
                topicId: 3,
                prompt: "Nelson Mandela became the president of which country?",
                options: ["Nigeria", "Kenya", "South Africa", "Egypt"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_p7",
                topicId: 3,
                prompt: "In what year did Neil Armstrong walk on the Moon?",
                options: ["1955", "1969", "1975", "1983"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p8",
                topicId: 3,
                prompt: "Martin Luther King Jr.'s famous speech begins with 'I have a…'",
                options: ["Plan", "Dream", "Message", "Hope"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p9",
                topicId: 3,
                prompt: "Marie Curie won two Nobel Prizes in which subjects?",
                options: ["Maths and Literature", "Physics and Chemistry", "Biology and Medicine", "History and Geography"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_p10",
                topicId: 3,
                prompt: "Nelson Mandela spent 27 years in prison for fighting against…",
                options: ["Taxation", "Colonialism", "Apartheid", "War"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 4  -  Then & Now
        4: [
            MathExamQuestion(
                id: "his_4_p1",
                topicId: 4,
                prompt: "100 years ago, how did most people send messages to each other?",
                options: ["Email", "Text message", "Letters by post", "Video call"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_p2",
                topicId: 4,
                prompt: "Which form of transport replaced horses for most people over the last century?",
                options: ["Bicycles", "Cars", "Submarines", "Hot air balloons"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p3",
                topicId: 4,
                prompt: "What did people use before electric refrigerators to keep food cold?",
                options: ["Plastic bags", "Ice houses and cool cellars", "Microwave ovens", "Solar panels"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p4",
                topicId: 4,
                prompt: "How has communication changed over the last 100 years?",
                options: ["It has stayed exactly the same", "It has become much slower", "It has become much faster with phones and internet", "People no longer communicate"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_p5",
                topicId: 4,
                prompt: "100 years ago, children going to school would most likely travel by…",
                options: ["Helicopter", "Walking or horse-drawn cart", "Underground train", "Electric scooter"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p6",
                topicId: 4,
                prompt: "Which invention allowed people to fly long distances quickly?",
                options: ["The steam engine", "The aeroplane", "The telescope", "The printing press"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p7",
                topicId: 4,
                prompt: "Before televisions existed, how did families entertain themselves at home?",
                options: ["Watching YouTube", "Playing board games and reading books", "Using computers", "Streaming films"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p8",
                topicId: 4,
                prompt: "Which of these is a modern way of shopping?",
                options: ["Bartering at a market", "Online shopping", "Trading crops for goods", "Writing a letter to a shop"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p9",
                topicId: 4,
                prompt: "100 years ago, most homes were lit by…",
                options: ["LED lights", "Gas lamps and candles", "Solar power", "Neon signs"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_p10",
                topicId: 4,
                prompt: "Which medical advance has helped people live much longer lives?",
                options: ["Better television", "Vaccines and modern medicine", "Faster cars", "Bigger houses"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 5  -  Early Explorers
        5: [
            MathExamQuestion(
                id: "his_5_p1",
                topicId: 5,
                prompt: "In what year did Christopher Columbus sail to the Americas?",
                options: ["1066", "1492", "1588", "1776"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_p2",
                topicId: 5,
                prompt: "Which explorer led the first expedition to sail all the way around the world?",
                options: ["Christopher Columbus", "Vasco da Gama", "Ferdinand Magellan", "Leif Erikson"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_p3",
                topicId: 5,
                prompt: "Vasco da Gama found a sea route from Europe to which continent?",
                options: ["South America", "Australia", "Asia (India)", "North America"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_p4",
                topicId: 5,
                prompt: "Christopher Columbus sailed for which country?",
                options: ["Portugal", "France", "England", "Spain"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_5_p5",
                topicId: 5,
                prompt: "Zheng He was a famous explorer from which country?",
                options: ["Japan", "China", "India", "Persia"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_p6",
                topicId: 5,
                prompt: "What was one main reason European explorers went on voyages?",
                options: ["To find new video games", "To find new trade routes and wealth", "To study mathematics", "To build schools"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_p7",
                topicId: 5,
                prompt: "What is the period of European exploration in the 1400s and 1500s called?",
                options: ["The Dark Ages", "The Age of Exploration", "The Renaissance", "The Industrial Revolution"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_p8",
                topicId: 5,
                prompt: "Columbus thought he had reached Asia, but he had actually landed in the…",
                options: ["Pacific Islands", "Caribbean Islands", "Canary Islands", "British Isles"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_p9",
                topicId: 5,
                prompt: "Magellan's voyage proved that the Earth is…",
                options: ["Flat", "Triangular", "Round/spherical", "Made of ice"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_p10",
                topicId: 5,
                prompt: "What type of ship did explorers mainly use during the Age of Exploration?",
                options: ["Submarines", "Motor boats", "Sailing ships", "Steamships"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 6  -  Ancient Egypt
        6: [
            MathExamQuestion(
                id: "his_6_p1",
                topicId: 6,
                prompt: "What are the rulers of Ancient Egypt called?",
                options: ["Emperors", "Pharaohs", "Kings", "Sultans"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_p2",
                topicId: 6,
                prompt: "Which river was essential to life in Ancient Egypt?",
                options: ["The Amazon", "The Thames", "The Nile", "The Ganges"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_p3",
                topicId: 6,
                prompt: "What are Egyptian picture symbols used for writing called?",
                options: ["Hieroglyphics", "Cuneiform", "Latin", "Runes"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_6_p4",
                topicId: 6,
                prompt: "The Great Pyramid of Giza was built for which pharaoh?",
                options: ["Tutankhamun", "Ramesses II", "Cleopatra", "Khufu"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_6_p5",
                topicId: 6,
                prompt: "What is mummification?",
                options: ["A type of Egyptian dance", "Preserving a dead body so it lasts forever", "Building a pyramid", "Painting on cave walls"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_p6",
                topicId: 6,
                prompt: "Tutankhamun became pharaoh at approximately what age?",
                options: ["9", "25", "40", "60"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_6_p7",
                topicId: 6,
                prompt: "Cleopatra was a famous ruler of Ancient Egypt. She was the last of which dynasty?",
                options: ["Ramessid", "Ptolemaic", "Nubian", "Theban"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_p8",
                topicId: 6,
                prompt: "Why was the River Nile so important to the Egyptians?",
                options: ["It provided gold", "It flooded each year and left rich soil for farming", "It was used for swimming competitions", "It connected Egypt to China"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_p9",
                topicId: 6,
                prompt: "What shape are the famous Egyptian tombs?",
                options: ["Circle", "Cylinder", "Pyramid", "Cube"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_p10",
                topicId: 6,
                prompt: "In which modern-day country can you find the pyramids of Giza?",
                options: ["Iraq", "Egypt", "Sudan", "Libya"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 7  -  Ancient Greece
        7: [
            MathExamQuestion(
                id: "his_7_p1",
                topicId: 7,
                prompt: "What type of government did Ancient Athens invent?",
                options: ["Monarchy", "Dictatorship", "Democracy", "Communism"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_p2",
                topicId: 7,
                prompt: "Which ancient Greek city-state was famous for its powerful warrior soldiers?",
                options: ["Athens", "Corinth", "Sparta", "Olympia"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_p3",
                topicId: 7,
                prompt: "The first Olympic Games were held in honour of which Greek god?",
                options: ["Poseidon", "Apollo", "Hermes", "Zeus"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_7_p4",
                topicId: 7,
                prompt: "Which philosopher taught by asking questions to make people think deeply?",
                options: ["Plato", "Aristotle", "Socrates", "Homer"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_p5",
                topicId: 7,
                prompt: "What were ancient Greek stories about gods and heroes called?",
                options: ["Fables", "Myths", "Legends", "Epics"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_7_p6",
                topicId: 7,
                prompt: "Aristotle was a student of which famous philosopher?",
                options: ["Socrates", "Plato", "Homer", "Herodotus"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_7_p7",
                topicId: 7,
                prompt: "What were the independent city-states of Ancient Greece called?",
                options: ["Colonies", "Provinces", "Poleis", "Empires"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_p8",
                topicId: 7,
                prompt: "The Greek god of the sea was called…",
                options: ["Zeus", "Ares", "Hermes", "Poseidon"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_7_p9",
                topicId: 7,
                prompt: "Where were the ancient Olympic Games held?",
                options: ["Athens", "Sparta", "Olympia", "Corinth"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_p10",
                topicId: 7,
                prompt: "Who wrote the famous Greek epic poems the Iliad and the Odyssey?",
                options: ["Socrates", "Plato", "Homer", "Aristotle"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 8  -  Ancient Rome
        8: [
            MathExamQuestion(
                id: "his_8_p1",
                topicId: 8,
                prompt: "What was the name of the governing body that ruled Rome before it became an empire?",
                options: ["The Senate / Roman Republic", "The Forum", "The Legion", "The Colosseum"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_8_p2",
                topicId: 8,
                prompt: "Julius Caesar was famously assassinated on the Ides of March in which year?",
                options: ["100 BC", "44 BC", "27 BC", "14 AD"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_p3",
                topicId: 8,
                prompt: "What were Roman aqueducts used for?",
                options: ["Fighting battles", "Carrying fresh water into cities", "Storing grain", "Training soldiers"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_p4",
                topicId: 8,
                prompt: "Who became the first Roman Emperor?",
                options: ["Julius Caesar", "Augustus", "Nero", "Claudius"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_p5",
                topicId: 8,
                prompt: "Why did the Romans build straight roads across their empire?",
                options: ["Because they were easier to build", "To move armies and trade goods quickly", "To mark the borders of land", "For chariot racing"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_p6",
                topicId: 8,
                prompt: "What famous arena in Rome was used for gladiator fights?",
                options: ["The Pantheon", "The Forum", "The Colosseum", "The Circus Maximus"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_8_p7",
                topicId: 8,
                prompt: "Rome is the capital city of which modern country?",
                options: ["Spain", "Greece", "France", "Italy"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_8_p8",
                topicId: 8,
                prompt: "What was a gladiator?",
                options: ["A Roman senator", "A trained fighter who fought in arenas", "A priest in the Roman temple", "A Roman engineer"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_p9",
                topicId: 8,
                prompt: "The fall of the Western Roman Empire is traditionally dated to which year?",
                options: ["44 BC", "27 BC", "476 AD", "1066 AD"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_8_p10",
                topicId: 8,
                prompt: "What language did the Romans speak?",
                options: ["Greek", "Latin", "Italian", "French"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 9  -  The Vikings
        9: [
            MathExamQuestion(
                id: "his_9_p1",
                topicId: 9,
                prompt: "Where did the Vikings originally come from?",
                options: ["Russia", "Scandinavia (Norway, Sweden, Denmark)", "Germany", "Scotland"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p2",
                topicId: 9,
                prompt: "What were Viking ships called?",
                options: ["Galleons", "Longships", "Triremes", "Junks"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p3",
                topicId: 9,
                prompt: "Which Viking explorer is believed to have reached North America around 1000 AD?",
                options: ["Erik the Red", "Ragnar Lothbrok", "Leif Erikson", "Harald Hardrada"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_p4",
                topicId: 9,
                prompt: "What period is known as the Viking Age?",
                options: ["500–700 AD", "800–1100 AD", "1200–1400 AD", "1400–1600 AD"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p5",
                topicId: 9,
                prompt: "What was one activity Vikings did besides raiding?",
                options: ["Building pyramids", "Farming and trading", "Sailing to the Moon", "Mining coal"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p6",
                topicId: 9,
                prompt: "What is the name of the settlement Vikings established in Canada?",
                options: ["Greenland", "L'Anse aux Meadows (Newfoundland)", "Normandy", "Iceland"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p7",
                topicId: 9,
                prompt: "Which Viking explorer discovered and settled Greenland?",
                options: ["Leif Erikson", "Harald Bluetooth", "Erik the Red", "Ragnar Lothbrok"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_p8",
                topicId: 9,
                prompt: "What writing system did the Vikings use?",
                options: ["Hieroglyphics", "Latin letters", "Runes", "Cuneiform"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_p9",
                topicId: 9,
                prompt: "Which day of the week is named after the Viking god Odin?",
                options: ["Tuesday", "Wednesday", "Thursday", "Friday"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_p10",
                topicId: 9,
                prompt: "What was the Vikings' chief god called?",
                options: ["Thor", "Odin", "Loki", "Freya"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 10  -  Medieval Castles & Knights
        10: [
            MathExamQuestion(
                id: "his_10_p1",
                topicId: 10,
                prompt: "What was the main purpose of a castle in the Middle Ages?",
                options: ["A place to hold markets", "A military fortress and home for a lord or king", "A place of worship", "A school for children"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p2",
                topicId: 10,
                prompt: "What is the code of behaviour that knights were expected to follow called?",
                options: ["The feudal code", "Chivalry", "The Magna Carta", "Canon law"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p3",
                topicId: 10,
                prompt: "What was the deep ditch filled with water around a castle called?",
                options: ["A battlement", "A drawbridge", "A moat", "A portcullis"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_p4",
                topicId: 10,
                prompt: "What was a young boy training to become a knight first called?",
                options: ["A squire", "A page", "A serf", "A yeoman"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p5",
                topicId: 10,
                prompt: "What protective clothing did a knight wear in battle?",
                options: ["Leather boots and a helmet only", "Heavy metal armour", "Thick woollen robes", "A shield but no body armour"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p6",
                topicId: 10,
                prompt: "What was a tournament in medieval times?",
                options: ["A religious ceremony", "A sporting contest where knights practised fighting skills", "A royal feast", "A trade fair"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p7",
                topicId: 10,
                prompt: "The tall central tower of a castle, the strongest point of defence, was called the…",
                options: ["Dungeon", "Barbican", "Keep", "Gatehouse"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_p8",
                topicId: 10,
                prompt: "A knight's main weapon for fighting on horseback was a…",
                options: ["Crossbow", "Catapult", "Lance", "Axe"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_p9",
                topicId: 10,
                prompt: "What was the moving wooden bridge that could be raised to stop enemies entering a castle called?",
                options: ["A portcullis", "A drawbridge", "A sally port", "A battlement"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_p10",
                topicId: 10,
                prompt: "Which of these was a quality expected of a chivalrous knight?",
                options: ["Cruelty to the weak", "Cowardice in battle", "Bravery and loyalty", "Greed for land"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 11  -  The Renaissance
        11: [
            MathExamQuestion(
                id: "his_11_p1",
                topicId: 11,
                prompt: "Where did the Renaissance begin?",
                options: ["France", "England", "Italy", "Germany"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p2",
                topicId: 11,
                prompt: "What does the word 'Renaissance' mean?",
                options: ["Revolution", "Rebirth", "Reform", "Religion"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_p3",
                topicId: 11,
                prompt: "Leonardo da Vinci painted which world-famous portrait?",
                options: ["The Birth of Venus", "The Last Supper only", "The Mona Lisa", "The Sistine Chapel ceiling"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p4",
                topicId: 11,
                prompt: "Michelangelo is famous for painting the ceiling of which building in Rome?",
                options: ["St Peter's Basilica", "The Colosseum", "The Sistine Chapel", "The Pantheon"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p5",
                topicId: 11,
                prompt: "Which famous playwright wrote Romeo and Juliet during the Renaissance?",
                options: ["Dante Alighieri", "Geoffrey Chaucer", "William Shakespeare", "Leonardo da Vinci"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p6",
                topicId: 11,
                prompt: "What were thinkers called who focused on human potential and achievements during the Renaissance?",
                options: ["Scientists", "Humanists", "Philosophers", "Theologians"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_p7",
                topicId: 11,
                prompt: "Galileo Galilei was a Renaissance scientist who supported the idea that the Earth…",
                options: ["Is flat", "Is the centre of the universe", "Orbits the Sun", "Was created 6000 years ago"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p8",
                topicId: 11,
                prompt: "The printing press helped the Renaissance spread by…",
                options: ["Making paintings cheaper", "Allowing books to be printed quickly and widely shared", "Building more schools", "Connecting countries by road"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_p9",
                topicId: 11,
                prompt: "Roughly when did the Renaissance take place?",
                options: ["500–900 AD", "1000–1200 AD", "14th–17th century", "18th–19th century"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_p10",
                topicId: 11,
                prompt: "Leonardo da Vinci was known as a scientist and inventor as well as a…",
                options: ["Military general", "Painter", "King", "Monk"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 12  -  Age of Exploration
        12: [
            MathExamQuestion(
                id: "his_12_p1",
                topicId: 12,
                prompt: "Christopher Columbus sailed west from Spain in 1492 and reached which continent?",
                options: ["Asia", "Africa", "The Americas", "Australia"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_p2",
                topicId: 12,
                prompt: "Which two countries led the Age of Exploration in the 1400s and 1500s?",
                options: ["England and France", "Spain and Portugal", "Italy and Greece", "Germany and Holland"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_p3",
                topicId: 12,
                prompt: "What instrument helped sailors navigate by finding direction at sea?",
                options: ["A telescope", "A compass", "A barometer", "An astrolabe only"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_p4",
                topicId: 12,
                prompt: "Ferdinand Magellan's crew completed the first voyage to do what?",
                options: ["Reach North America", "Sail around the entire world", "Cross the Pacific Ocean only", "Discover Australia"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_p5",
                topicId: 12,
                prompt: "What did European explorers bring to indigenous peoples that caused mass deaths?",
                options: ["New foods", "Guns and bombs", "Diseases like smallpox", "Bad weather"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_p6",
                topicId: 12,
                prompt: "What valuable goods did European explorers seek in Asia?",
                options: ["Coal and iron", "Spices, silk, and gold", "Timber and fish", "Cotton and wool"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_p7",
                topicId: 12,
                prompt: "What were the Spanish conquerors who defeated Native American empires called?",
                options: ["Conquistadors", "Crusaders", "Colonists", "Merchants"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_12_p8",
                topicId: 12,
                prompt: "What is a colony?",
                options: ["A type of ship", "A territory controlled by a foreign power", "A trade agreement", "A form of government"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_p9",
                topicId: 12,
                prompt: "Vasco da Gama was the first European to find a sea route to which country?",
                options: ["China", "Japan", "India", "Brazil"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_p10",
                topicId: 12,
                prompt: "The Americas are named after which explorer?",
                options: ["Christopher Columbus", "Amerigo Vespucci", "Ferdinand Magellan", "John Cabot"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 13  -  The Industrial Revolution
        13: [
            MathExamQuestion(
                id: "his_13_p1",
                topicId: 13,
                prompt: "In which country did the Industrial Revolution begin?",
                options: ["France", "Germany", "Britain", "USA"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_p2",
                topicId: 13,
                prompt: "Who improved the steam engine and made it far more efficient?",
                options: ["Isaac Newton", "James Watt", "George Stephenson", "Richard Arkwright"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_p3",
                topicId: 13,
                prompt: "Approximately when did the Industrial Revolution begin?",
                options: ["1600", "1760", "1850", "1900"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_p4",
                topicId: 13,
                prompt: "What was a major result of the Industrial Revolution for many people?",
                options: ["Most people stayed on farms", "Many people moved to cities to work in factories", "Trade with other countries stopped", "Fewer goods were produced"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_p5",
                topicId: 13,
                prompt: "Which new form of transport was developed during the Industrial Revolution?",
                options: ["Canals only", "Horse-drawn coaches only", "Railways", "Aeroplanes"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_p6",
                topicId: 13,
                prompt: "What does 'urbanisation' mean?",
                options: ["People moving from cities to the countryside", "People moving from the countryside to cities", "Building more farms", "Closing down factories"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_p7",
                topicId: 13,
                prompt: "Child labour during the Industrial Revolution meant that children…",
                options: ["Attended school full time", "Worked in mines and factories for low wages", "Played in parks all day", "Were not allowed to work at all"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_p8",
                topicId: 13,
                prompt: "The world's first passenger railway in 1825 ran between Stockton and…",
                options: ["London", "Manchester", "Darlington", "Birmingham"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_p9",
                topicId: 13,
                prompt: "Before the Industrial Revolution, most goods in Britain were made…",
                options: ["In large factories", "By machines powered by electricity", "By hand in people's homes", "By robots"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_p10",
                topicId: 13,
                prompt: "What powered many of the machines in early factories?",
                options: ["Wind turbines", "Solar panels", "Steam engines", "Nuclear power"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 14  -  World War I
        14: [
            MathExamQuestion(
                id: "his_14_p1",
                topicId: 14,
                prompt: "World War I began in which year?",
                options: ["1905", "1910", "1914", "1918"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_p2",
                topicId: 14,
                prompt: "What event triggered the start of World War I?",
                options: ["The sinking of the Titanic", "The assassination of Archduke Franz Ferdinand", "Germany invading France", "The Russian Revolution"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_p3",
                topicId: 14,
                prompt: "What were the long ditches soldiers lived and fought in on the Western Front called?",
                options: ["Foxholes", "Bunkers", "Trenches", "Barricades"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_p4",
                topicId: 14,
                prompt: "Which countries made up the Allied Powers in World War I?",
                options: ["Germany, Austria-Hungary, and Ottoman Empire", "Britain, France, Russia, and USA", "Italy, Japan, and Spain", "USA, Canada, and Australia only"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_p5",
                topicId: 14,
                prompt: "World War I ended with which treaty in 1919?",
                options: ["Treaty of Paris", "Treaty of Utrecht", "Treaty of Versailles", "Treaty of Vienna"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_p6",
                topicId: 14,
                prompt: "Which new weapon was used for the first time in large numbers during World War I?",
                options: ["Submarines and tanks", "Aircraft carriers", "Nuclear bombs", "Rockets"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_14_p7",
                topicId: 14,
                prompt: "In which year did the USA join World War I?",
                options: ["1914", "1915", "1916", "1917"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_14_p8",
                topicId: 14,
                prompt: "The Battle of the Somme in 1916 was notable for…",
                options: ["Being a quick Allied victory", "Over one million casualties on both sides", "The first use of aeroplanes", "Taking place at sea"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_p9",
                topicId: 14,
                prompt: "Which countries made up the Central Powers in World War I?",
                options: ["Britain, France, and Russia", "USA, Canada, and Australia", "Germany, Austria-Hungary, and the Ottoman Empire", "Spain, Portugal, and Italy"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_p10",
                topicId: 14,
                prompt: "World War I ended on the 11th hour of the 11th day of the 11th month of which year?",
                options: ["1916", "1917", "1918", "1919"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 15  -  World War II
        15: [
            MathExamQuestion(
                id: "his_15_p1",
                topicId: 15,
                prompt: "World War II began in which year?",
                options: ["1935", "1937", "1939", "1941"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p2",
                topicId: 15,
                prompt: "Which countries made up the Axis Powers in World War II?",
                options: ["Britain, France, and USA", "Germany, Italy, and Japan", "USSR, China, and Poland", "Spain, Portugal, and Turkey"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_p3",
                topicId: 15,
                prompt: "The Japanese attack on Pearl Harbor happened in which year?",
                options: ["1939", "1940", "1941", "1942"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p4",
                topicId: 15,
                prompt: "D-Day on June 6, 1944 was the Allied landing on the beaches of which country?",
                options: ["Germany", "Belgium", "France (Normandy)", "Italy"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p5",
                topicId: 15,
                prompt: "The Holocaust was the systematic murder of which group of people by the Nazi regime?",
                options: ["Soviet soldiers", "British prisoners of war", "Six million Jewish people", "French resistance fighters"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p6",
                topicId: 15,
                prompt: "Who was the leader of Nazi Germany during World War II?",
                options: ["Joseph Stalin", "Benito Mussolini", "Adolf Hitler", "Francisco Franco"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p7",
                topicId: 15,
                prompt: "Which organisation was founded in 1945 to help prevent future wars?",
                options: ["NATO", "The United Nations", "The League of Nations", "The European Union"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_p8",
                topicId: 15,
                prompt: "Atomic bombs were dropped on which two Japanese cities in 1945?",
                options: ["Tokyo and Osaka", "Hiroshima and Nagasaki", "Kyoto and Yokohama", "Nagasaki and Kobe"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_p9",
                topicId: 15,
                prompt: "World War II ended in which year?",
                options: ["1943", "1944", "1945", "1946"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_p10",
                topicId: 15,
                prompt: "Which Allied leader led Britain through most of World War II?",
                options: ["Neville Chamberlain", "Winston Churchill", "Clement Attlee", "Anthony Eden"],
                correctIndex: 1
            ),
        ],
        // Topic 16: Industrial Revolution
        16: [
            MathExamQuestion(id: "his_16_p1", topicId: 16, prompt: "In which country did the Industrial Revolution begin?", options: ["France", "Germany", "Britain", "USA"], correctIndex: 2),
            MathExamQuestion(id: "his_16_p2", topicId: 16, prompt: "Who improved the steam engine and made it far more efficient?", options: ["Isaac Newton", "James Watt", "George Stephenson", "Richard Arkwright"], correctIndex: 1),
            MathExamQuestion(id: "his_16_p3", topicId: 16, prompt: "Approximately when did the Industrial Revolution begin?", options: ["1600", "1760", "1850", "1900"], correctIndex: 1),
            MathExamQuestion(id: "his_16_p4", topicId: 16, prompt: "What was a major consequence of the Industrial Revolution for people?", options: ["Most people stayed on farms", "Many people moved to cities to work in factories", "Trade with other countries stopped", "Fewer goods were produced"], correctIndex: 1),
            MathExamQuestion(id: "his_16_p5", topicId: 16, prompt: "Which of the following was a new form of transport developed during the Industrial Revolution?", options: ["Canals only", "Horse-drawn coaches only", "Railways", "Aeroplanes"], correctIndex: 2),
            MathExamQuestion(id: "his_16_p6", topicId: 16, prompt: "What does 'urbanisation' mean?", options: ["People moving from cities to the countryside", "People moving from the countryside to cities", "Building more farms", "Closing down factories"], correctIndex: 1),
            MathExamQuestion(id: "his_16_p7", topicId: 16, prompt: "Child labour during the Industrial Revolution meant that children...", options: ["Attended school full time", "Worked in mines and factories for low wages", "Played in parks all day", "Were not allowed to work at all"], correctIndex: 1),
            MathExamQuestion(id: "his_16_p8", topicId: 16, prompt: "The world's first passenger railway ran between which two places in 1825?", options: ["London and Birmingham", "Liverpool and Manchester", "Stockton and Darlington", "Edinburgh and Glasgow"], correctIndex: 2),
            MathExamQuestion(id: "his_16_p9", topicId: 16, prompt: "Before the Industrial Revolution, most goods in Britain were made...", options: ["In large factories", "By machines powered by electricity", "By hand in people's homes (cottage industries)", "By robots"], correctIndex: 2),
            MathExamQuestion(id: "his_16_p10", topicId: 16, prompt: "What powered many of the machines in early factories?", options: ["Wind turbines", "Solar panels", "Steam engines", "Nuclear power"], correctIndex: 2),
        ],

        // Topic 17: Age of Empires
        17: [
            MathExamQuestion(id: "his_17_p1", topicId: 17, prompt: "Which European empire was described as so large that 'the sun never sets' on it?", options: ["French Empire", "Spanish Empire", "British Empire", "Dutch Empire"], correctIndex: 2),
            MathExamQuestion(id: "his_17_p2", topicId: 17, prompt: "What does 'colonialism' mean?", options: ["Building space colonies", "When one country controls and rules another territory", "Trading equally between nations", "Forming a democracy"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p3", topicId: 17, prompt: "The 'Scramble for Africa' in the 1880s refers to...", options: ["African nations racing to industrialise", "European powers competing to colonise Africa", "African traders competing for European markets", "A series of wars between African kingdoms"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p4", topicId: 17, prompt: "Which European country colonised most of Southeast Asia, including Vietnam?", options: ["Britain", "Spain", "France", "Portugal"], correctIndex: 2),
            MathExamQuestion(id: "his_17_p5", topicId: 17, prompt: "Belgium's colonial rule in the Congo was known for being...", options: ["Peaceful and beneficial to local people", "Extremely brutal and exploitative", "A fair trade partnership", "Focused on education only"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p6", topicId: 17, prompt: "Which of the following best describes an empire?", options: ["A single city-state", "A group of territories controlled by one ruler or nation", "A trade agreement between countries", "A type of government in one country"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p7", topicId: 17, prompt: "What did European colonisers typically take from their colonies?", options: ["Technology and weapons only", "Natural resources, land, and labour", "Nothing  -  they only traded fairly", "Democratic ideas"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p8", topicId: 17, prompt: "Which country colonised India, ruling it until 1947?", options: ["France", "Netherlands", "Britain", "Portugal"], correctIndex: 2),
            MathExamQuestion(id: "his_17_p9", topicId: 17, prompt: "What was the Dutch East India Company known for?", options: ["Building railways in Europe", "Trading and controlling territories in Asia", "Exploring the Americas", "Farming in Africa"], correctIndex: 1),
            MathExamQuestion(id: "his_17_p10", topicId: 17, prompt: "By the early 1900s, most of Africa had been colonised by...", options: ["Asian empires", "American nations", "European powers", "African kingdoms themselves"], correctIndex: 2),
        ],

        // Topic 18: Slavery & Abolition
        18: [
            MathExamQuestion(id: "his_18_p1", topicId: 18, prompt: "The transatlantic slave trade mainly transported enslaved people from...", options: ["Asia to Europe", "Africa to the Americas", "Europe to Africa", "The Americas to Asia"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p2", topicId: 18, prompt: "Harriet Tubman is famous for...", options: ["Writing the US Constitution", "Escaping slavery and helping others to freedom via the Underground Railroad", "Leading the Union Army", "Passing the 13th Amendment"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p3", topicId: 18, prompt: "Frederick Douglass was an important abolitionist who...", options: ["Fought for the Confederacy", "Wrote and spoke powerfully against slavery after escaping it", "Owned a plantation", "Passed the Emancipation Proclamation"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p4", topicId: 18, prompt: "William Wilberforce was a British politician who campaigned to...", options: ["Expand the slave trade", "End the slave trade", "Colonise Africa", "Build the railways"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p5", topicId: 18, prompt: "The 13th Amendment to the US Constitution (1865) did what?", options: ["Gave women the right to vote", "Abolished slavery in the United States", "Created the Republican Party", "Ended the Civil War"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p6", topicId: 18, prompt: "On which plantations did most enslaved people in the Americas work?", options: ["Wheat and potato fields in the North", "Sugar, cotton, and tobacco plantations in the South", "Rice paddies in Asia", "Tea gardens in India"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p7", topicId: 18, prompt: "What was the 'Underground Railroad'?", options: ["A subway system in New York", "A network of secret routes and safe houses helping enslaved people escape to freedom", "A railway built by enslaved workers", "A system of transporting goods underground"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p8", topicId: 18, prompt: "Approximately how many Africans were transported across the Atlantic in the slave trade?", options: ["Fewer than 1 million", "About 5 million", "Over 12 million", "About 50 million"], correctIndex: 2),
            MathExamQuestion(id: "his_18_p9", topicId: 18, prompt: "Britain abolished the slave trade in...", options: ["1776", "1807", "1865", "1900"], correctIndex: 1),
            MathExamQuestion(id: "his_18_p10", topicId: 18, prompt: "What does 'abolitionist' mean?", options: ["A person who supports slavery", "A person who campaigns to end slavery", "A plantation owner", "A slave trader"], correctIndex: 1),
        ],

        // Topic 19: The American Civil War
        19: [
            MathExamQuestion(id: "his_19_p1", topicId: 19, prompt: "When was the American Civil War fought?", options: ["1776–1783", "1812–1815", "1861–1865", "1914–1918"], correctIndex: 2),
            MathExamQuestion(id: "his_19_p2", topicId: 19, prompt: "Which two sides fought in the American Civil War?", options: ["USA and Britain", "The Union and the Confederacy", "The North and Mexico", "The East and the West"], correctIndex: 1),
            MathExamQuestion(id: "his_19_p3", topicId: 19, prompt: "Who was the US President during the Civil War?", options: ["George Washington", "Ulysses S. Grant", "Abraham Lincoln", "Thomas Jefferson"], correctIndex: 2),
            MathExamQuestion(id: "his_19_p4", topicId: 19, prompt: "The Emancipation Proclamation (1863) declared that...", options: ["The war was over", "Enslaved people in Confederate states were free", "Women had the right to vote", "New states could not join the Union"], correctIndex: 1),
            MathExamQuestion(id: "his_19_p5", topicId: 19, prompt: "The Gettysburg Address was a famous speech delivered by Lincoln at...", options: ["The White House", "A dedication of a soldiers' cemetery in Pennsylvania", "The US Capitol building", "Ford's Theatre"], correctIndex: 1),
            MathExamQuestion(id: "his_19_p6", topicId: 19, prompt: "What was a major cause of the American Civil War?", options: ["A dispute over the railway routes", "Arguments about slavery and states' rights", "A war with Britain", "A disagreement about the national currency"], correctIndex: 1),
            MathExamQuestion(id: "his_19_p7", topicId: 19, prompt: "Which states made up the Confederacy?", options: ["Northern states that wanted to keep slavery", "Western frontier states", "Southern states that seceded from the Union", "All 50 states of America"], correctIndex: 2),
            MathExamQuestion(id: "his_19_p8", topicId: 19, prompt: "Who won the American Civil War?", options: ["The Confederacy", "Great Britain", "The Union", "Mexico"], correctIndex: 2),
            MathExamQuestion(id: "his_19_p9", topicId: 19, prompt: "General Robert E. Lee commanded which army?", options: ["The Union Army of the Potomac", "The British Army", "The Confederate Army of Northern Virginia", "The Mexican Army"], correctIndex: 2),
            MathExamQuestion(id: "his_19_p10", topicId: 19, prompt: "Abraham Lincoln was assassinated in...", options: ["1863", "1865", "1867", "1870"], correctIndex: 1),
        ],

        // Topic 20: World War I
        20: [
            MathExamQuestion(id: "his_20_p1", topicId: 20, prompt: "What event triggered the start of World War I?", options: ["The sinking of the Titanic", "The assassination of Archduke Franz Ferdinand", "The invasion of Poland", "The Wall Street Crash"], correctIndex: 1),
            MathExamQuestion(id: "his_20_p2", topicId: 20, prompt: "In which city was Archduke Franz Ferdinand assassinated?", options: ["Vienna", "Berlin", "Sarajevo", "Paris"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p3", topicId: 20, prompt: "Which of the following countries was part of the Allied Powers in World War I?", options: ["Germany", "Austria-Hungary", "Ottoman Empire", "France"], correctIndex: 3),
            MathExamQuestion(id: "his_20_p4", topicId: 20, prompt: "What was 'trench warfare'?", options: ["Fighting from ships at sea", "Soldiers fighting from deep ditches dug in the ground", "Cavalry charges across open fields", "Air bombing campaigns"], correctIndex: 1),
            MathExamQuestion(id: "his_20_p5", topicId: 20, prompt: "Which treaty ended World War I in 1919?", options: ["Treaty of Paris", "Treaty of Utrecht", "Treaty of Versailles", "Treaty of Westphalia"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p6", topicId: 20, prompt: "When did the USA enter World War I?", options: ["1914", "1915", "1917", "1918"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p7", topicId: 20, prompt: "Which new weapon was used for the first time in large numbers during World War I?", options: ["Nuclear bombs", "Rifles", "Poison gas", "Cannons"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p8", topicId: 20, prompt: "World War I lasted from 1914 to...", options: ["1916", "1917", "1918", "1920"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p9", topicId: 20, prompt: "Which empire ruled the Ottoman territories during World War I?", options: ["British Empire", "Russian Empire", "Ottoman Empire", "Austro-Hungarian Empire"], correctIndex: 2),
            MathExamQuestion(id: "his_20_p10", topicId: 20, prompt: "What was the name of the long line of trenches on the Western Front?", options: ["The Eastern Line", "The Maginot Line", "The Western Front", "The Hindenburg Line"], correctIndex: 2),
        ],

        // Topic 21: The Russian Revolution
        21: [
            MathExamQuestion(id: "his_21_p1", topicId: 21, prompt: "Who was the last Tsar (emperor) of Russia?", options: ["Alexander III", "Nicholas II", "Ivan the Terrible", "Peter the Great"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p2", topicId: 21, prompt: "Which political group led by Lenin seized power in October 1917?", options: ["The Mensheviks", "The Tsarists", "The Bolsheviks", "The Democrats"], correctIndex: 2),
            MathExamQuestion(id: "his_21_p3", topicId: 21, prompt: "What economic and political system did the Bolsheviks introduce in Russia?", options: ["Capitalism", "Democracy", "Communism", "Monarchy"], correctIndex: 2),
            MathExamQuestion(id: "his_21_p4", topicId: 21, prompt: "The Soviet Union (USSR) was officially formed in...", options: ["1917", "1920", "1922", "1930"], correctIndex: 2),
            MathExamQuestion(id: "his_21_p5", topicId: 21, prompt: "Why were many Russians unhappy with Tsar Nicholas II?", options: ["He was too young to rule", "Widespread poverty, inequality, and military failures in WWI", "He banned all religion", "He refused to build railways"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p6", topicId: 21, prompt: "Under communism, who was supposed to own factories and farms?", options: ["Private individuals", "The state (government), on behalf of all workers", "Foreign investors", "The royal family"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p7", topicId: 21, prompt: "What happened to Tsar Nicholas II and his family?", options: ["They escaped to Britain", "They were arrested and later executed in 1918", "They ruled Russia in exile", "They were exiled to Siberia and lived peacefully"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p8", topicId: 21, prompt: "Leon Trotsky was...", options: ["The last Tsar of Russia", "A key Bolshevik leader who helped lead the revolution", "A German military general", "The first President of the USA"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p9", topicId: 21, prompt: "The February Revolution of 1917 resulted in...", options: ["Lenin taking power", "Tsar Nicholas II being overthrown", "Russia winning World War I", "The formation of the USSR"], correctIndex: 1),
            MathExamQuestion(id: "his_21_p10", topicId: 21, prompt: "After Lenin died in 1924, who eventually took control of the Soviet Union?", options: ["Leon Trotsky", "Karl Marx", "Joseph Stalin", "Vladimir Putin"], correctIndex: 2),
        ],

        // Topic 22: The Great Depression
        22: [
            MathExamQuestion(id: "his_22_p1", topicId: 22, prompt: "What event in 1929 triggered the Great Depression?", options: ["World War I ending", "The Wall Street Crash", "A severe drought across the USA", "The fall of the British Empire"], correctIndex: 1),
            MathExamQuestion(id: "his_22_p2", topicId: 22, prompt: "The Wall Street Crash happened in which city?", options: ["London", "Chicago", "New York", "Washington D.C."], correctIndex: 2),
            MathExamQuestion(id: "his_22_p3", topicId: 22, prompt: "During the Great Depression, approximately what percentage of Americans were unemployed at its worst?", options: ["5%", "10%", "25%", "50%"], correctIndex: 2),
            MathExamQuestion(id: "his_22_p4", topicId: 22, prompt: "What was the 'Dust Bowl'?", options: ["A boxing arena in New York", "A drought that destroyed farmland in the Great Plains in the 1930s", "A financial term for losing money on the stock market", "A soup kitchen during the Depression"], correctIndex: 1),
            MathExamQuestion(id: "his_22_p5", topicId: 22, prompt: "Which US President introduced the New Deal to help Americans during the Depression?", options: ["Herbert Hoover", "Woodrow Wilson", "Franklin D. Roosevelt", "Harry Truman"], correctIndex: 2),
            MathExamQuestion(id: "his_22_p6", topicId: 22, prompt: "The New Deal was a set of programmes designed to provide...", options: ["Military support to Europe", "Relief, recovery, and reform for Americans", "Tax cuts for businesses only", "A new system of banking regulations only"], correctIndex: 1),
            MathExamQuestion(id: "his_22_p7", topicId: 22, prompt: "The Great Depression affected...", options: ["Only the United States", "Only Europe", "Countries around the world", "Only developing countries"], correctIndex: 2),
            MathExamQuestion(id: "his_22_p8", topicId: 22, prompt: "What happened to many banks during the Great Depression?", options: ["They made record profits", "They failed and closed, causing people to lose their savings", "They were taken over by the government and ran smoothly", "They moved their money overseas"], correctIndex: 1),
            MathExamQuestion(id: "his_22_p9", topicId: 22, prompt: "Which of the following was a direct cause of the Wall Street Crash?", options: ["A hurricane hitting New York", "Stock prices falling dramatically after unsustainable rises", "A war breaking out in Europe", "The US government spending too much on the military"], correctIndex: 1),
            MathExamQuestion(id: "his_22_p10", topicId: 22, prompt: "Soup kitchens during the Great Depression were set up to...", options: ["Teach people to cook", "Provide free food to hungry, unemployed people", "Train chefs for restaurants", "Sell food at reduced prices to make a profit"], correctIndex: 1),
        ],

        // Topic 23: World War II
        23: [
            MathExamQuestion(id: "his_23_p1", topicId: 23, prompt: "When did World War II begin?", options: ["1935", "1937", "1939", "1941"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p2", topicId: 23, prompt: "Which countries formed the main Axis powers in World War II?", options: ["USA, Britain, France", "Germany, Italy, Japan", "USSR, China, USA", "Poland, France, Belgium"], correctIndex: 1),
            MathExamQuestion(id: "his_23_p3", topicId: 23, prompt: "The attack on Pearl Harbor in December 1941 caused which country to enter World War II?", options: ["Britain", "The USSR", "The USA", "France"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p4", topicId: 23, prompt: "D-Day (June 6, 1944) was the Allied invasion of...", options: ["Italy", "Germany", "Normandy, France", "North Africa"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p5", topicId: 23, prompt: "On which Japanese cities were atomic bombs dropped in 1945?", options: ["Tokyo and Osaka", "Hiroshima and Nagasaki", "Kyoto and Hiroshima", "Nagasaki and Tokyo"], correctIndex: 1),
            MathExamQuestion(id: "his_23_p6", topicId: 23, prompt: "Who was the leader of Nazi Germany during World War II?", options: ["Benito Mussolini", "Joseph Stalin", "Adolf Hitler", "Emperor Hirohito"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p7", topicId: 23, prompt: "The United Nations was founded in which year?", options: ["1939", "1943", "1945", "1948"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p8", topicId: 23, prompt: "World War II ended in Europe (V-E Day) in...", options: ["April 1944", "May 1945", "August 1945", "September 1945"], correctIndex: 1),
            MathExamQuestion(id: "his_23_p9", topicId: 23, prompt: "Approximately how many people died in World War II?", options: ["5–10 million", "20–30 million", "70–85 million", "Over 100 million"], correctIndex: 2),
            MathExamQuestion(id: "his_23_p10", topicId: 23, prompt: "The Battle of Britain (1940) was mainly fought using...", options: ["Tanks and infantry", "Naval warships", "Aeroplanes in the air", "Submarines underwater"], correctIndex: 2),
        ],

        // Topic 24: The Holocaust
        24: [
            MathExamQuestion(id: "his_24_p1", topicId: 24, prompt: "How many Jewish people were murdered during the Holocaust?", options: ["Around 600,000", "Around 2 million", "Around 6 million", "Around 10 million"], correctIndex: 2),
            MathExamQuestion(id: "his_24_p2", topicId: 24, prompt: "Which regime was responsible for the Holocaust?", options: ["The Italian Fascist government", "The Soviet communist government", "The Nazi regime in Germany", "The Japanese Imperial government"], correctIndex: 2),
            MathExamQuestion(id: "his_24_p3", topicId: 24, prompt: "Anne Frank was a Jewish girl who hid from the Nazis and is remembered for...", options: ["Escaping to America safely", "Leading a resistance group", "Writing a diary that documented her experience in hiding", "Testifying at the Nuremberg Trials"], correctIndex: 2),
            MathExamQuestion(id: "his_24_p4", topicId: 24, prompt: "The Nuremberg Trials (1945–46) were held to...", options: ["Decide the borders of post-war Europe", "Put Nazi leaders on trial for war crimes and crimes against humanity", "Decide reparations Germany would pay", "Elect a new German government"], correctIndex: 1),
            MathExamQuestion(id: "his_24_p5", topicId: 24, prompt: "Yad Vashem is...", options: ["A Nazi concentration camp in Poland", "Israel's national Holocaust memorial and museum", "The building where the Nuremberg Trials were held", "A Jewish resistance movement"], correctIndex: 1),
            MathExamQuestion(id: "his_24_p6", topicId: 24, prompt: "In addition to Jewish people, which other groups were persecuted by the Nazi regime?", options: ["Christians and Muslims only", "Roma people, people with disabilities, and political opponents", "All non-European people", "Only people from Eastern Europe"], correctIndex: 1),
            MathExamQuestion(id: "his_24_p7", topicId: 24, prompt: "What does the word 'Holocaust' mean in Greek?", options: ["Great suffering", "Whole burnt", "Mass destruction", "Dark times"], correctIndex: 1),
            MathExamQuestion(id: "his_24_p8", topicId: 24, prompt: "Why do historians say it is important to remember the Holocaust?", options: ["To glorify the power of the Nazi state", "So we can understand what the Nazis achieved", "To ensure such atrocities are recognised and never repeated", "Because it was the only genocide in history"], correctIndex: 2),
            MathExamQuestion(id: "his_24_p9", topicId: 24, prompt: "Which European country was the site of the largest concentration camp, Auschwitz-Birkenau?", options: ["Germany", "France", "Poland", "Austria"], correctIndex: 2),
            MathExamQuestion(id: "his_24_p10", topicId: 24, prompt: "International Holocaust Remembrance Day is observed on...", options: ["January 27", "May 8", "November 9", "April 19"], correctIndex: 0),
        ],

        // Topic 25: The Cold War
        25: [
            MathExamQuestion(id: "his_25_p1", topicId: 25, prompt: "Which two superpowers were the main rivals in the Cold War?", options: ["USA and China", "USA and USSR", "Britain and France", "Germany and Russia"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p2", topicId: 25, prompt: "Why was it called the 'Cold War'?", options: ["It was fought in Arctic regions", "The two sides never directly fought each other in open combat", "It started in winter", "It was about control of cold-weather resources"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p3", topicId: 25, prompt: "The Berlin Wall was built in...", options: ["1955", "1957", "1961", "1969"], correctIndex: 2),
            MathExamQuestion(id: "his_25_p4", topicId: 25, prompt: "The Cuban Missile Crisis of 1962 was dangerous because...", options: ["Cuba invaded the USA", "The USSR placed nuclear missiles in Cuba, close to the USA", "The USA bombed Havana", "Cuba joined NATO"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p5", topicId: 25, prompt: "Sputnik, launched in 1957, was...", options: ["The first intercontinental ballistic missile", "The first artificial satellite, launched by the USSR", "A US spy plane", "A nuclear bomb test"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p6", topicId: 25, prompt: "When did the Berlin Wall fall?", options: ["1985", "1987", "1989", "1991"], correctIndex: 2),
            MathExamQuestion(id: "his_25_p7", topicId: 25, prompt: "The Cold War officially ended with...", options: ["The Moon landing", "The fall of the Berlin Wall", "The collapse of the Soviet Union in 1991", "The signing of the Versailles Treaty"], correctIndex: 2),
            MathExamQuestion(id: "his_25_p8", topicId: 25, prompt: "NATO was a military alliance formed by...", options: ["Communist countries led by the USSR", "Western countries led by the USA", "Asian nations", "All United Nations members"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p9", topicId: 25, prompt: "The 'arms race' during the Cold War was a competition between the USA and USSR to...", options: ["Build the most ships", "Produce the most military weapons, especially nuclear missiles", "Develop the best tanks", "Have the largest conventional armies"], correctIndex: 1),
            MathExamQuestion(id: "his_25_p10", topicId: 25, prompt: "The Space Race was ultimately won by the USA when...", options: ["They launched Sputnik in 1957", "Yuri Gagarin orbited Earth in 1961", "Apollo 11 landed astronauts on the Moon in 1969", "The Space Shuttle flew in 1981"], correctIndex: 2),
        ],

        // Topic 26: Decolonisation
        26: [
            MathExamQuestion(id: "his_26_p1", topicId: 26, prompt: "India gained independence from Britain in which year?", options: ["1939", "1945", "1947", "1952"], correctIndex: 2),
            MathExamQuestion(id: "his_26_p2", topicId: 26, prompt: "Which leader is most associated with India's independence movement through non-violent resistance?", options: ["Jawaharlal Nehru", "Mahatma Gandhi", "Subhas Chandra Bose", "Muhammad Ali Jinnah"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p3", topicId: 26, prompt: "Decolonisation mainly refers to...", options: ["European countries gaining more colonies", "Colonised countries gaining independence from European empires", "The building of new European empires", "Trade agreements between colonies"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p4", topicId: 26, prompt: "The 'Year of Africa' (1960) is significant because...", options: ["Africa won a major war", "17 African nations gained independence in that year", "The African Union was formed", "South Africa held its first free elections"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p5", topicId: 26, prompt: "Ghana was notable in the decolonisation process because it was...", options: ["The last African country to gain independence", "The first sub-Saharan African country to gain independence (1957)", "A French colony that became independent", "The largest African nation by area"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p6", topicId: 26, prompt: "The partition of India in 1947 created which two new nations?", options: ["India and Sri Lanka", "India and Bangladesh", "India and Pakistan", "India and Afghanistan"], correctIndex: 2),
            MathExamQuestion(id: "his_26_p7", topicId: 26, prompt: "Nelson Mandela fought against which system of racial segregation in South Africa?", options: ["Colonialism", "Apartheid", "Slavery", "Segregation in the USA"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p8", topicId: 26, prompt: "After World War II, why did decolonisation accelerate?", options: ["European countries wanted more colonies", "European powers were weakened and colonial peoples demanded independence", "The USA forced all empires to give up colonies", "The United Nations banned all empires immediately"], correctIndex: 1),
            MathExamQuestion(id: "his_26_p9", topicId: 26, prompt: "Which African leader led Kenya's independence movement?", options: ["Kwame Nkrumah", "Julius Nyerere", "Jomo Kenyatta", "Patrice Lumumba"], correctIndex: 2),
            MathExamQuestion(id: "his_26_p10", topicId: 26, prompt: "Most European colonial empires had ended by the...", options: ["1940s", "1950s", "1970s", "1990s"], correctIndex: 2),
        ],

        // Topic 27: Civil Rights Movement
        27: [
            MathExamQuestion(id: "his_27_p1", topicId: 27, prompt: "The Civil Rights Movement in the USA was primarily a campaign for equal rights for...", options: ["Women", "Native Americans", "African Americans", "Immigrants from Europe"], correctIndex: 2),
            MathExamQuestion(id: "his_27_p2", topicId: 27, prompt: "Rosa Parks became famous in 1955 when she...", options: ["Led a march in Washington D.C.", "Refused to give up her bus seat to a white passenger", "Delivered the 'I Have a Dream' speech", "Was the first Black woman elected to Congress"], correctIndex: 1),
            MathExamQuestion(id: "his_27_p3", topicId: 27, prompt: "Martin Luther King Jr. delivered his famous 'I Have a Dream' speech at...", options: ["The Lincoln Memorial, Washington D.C.", "The White House", "The US Capitol", "Atlanta, Georgia"], correctIndex: 0),
            MathExamQuestion(id: "his_27_p4", topicId: 27, prompt: "The Civil Rights Act of 1964 did what?", options: ["Gave women the right to vote", "Abolished slavery", "Banned racial discrimination in public places and employment", "Created the NAACP"], correctIndex: 2),
            MathExamQuestion(id: "his_27_p5", topicId: 27, prompt: "The Voting Rights Act of 1965 was important because it...", options: ["Gave 18-year-olds the right to vote", "Protected the voting rights of African Americans", "Allowed non-citizens to vote", "Extended the presidential term"], correctIndex: 1),
            MathExamQuestion(id: "his_27_p6", topicId: 27, prompt: "Martin Luther King Jr. believed in which method of achieving change?", options: ["Armed revolution", "Violent protest", "Non-violent civil disobedience", "Political assassination"], correctIndex: 2),
            MathExamQuestion(id: "his_27_p7", topicId: 27, prompt: "The March on Washington took place in which year?", options: ["1955", "1960", "1963", "1968"], correctIndex: 2),
            MathExamQuestion(id: "his_27_p8", topicId: 27, prompt: "Segregation laws in the American South were also known as...", options: ["Reconstruction laws", "Jim Crow laws", "Civil rights codes", "Black codes of 1865"], correctIndex: 1),
            MathExamQuestion(id: "his_27_p9", topicId: 27, prompt: "Martin Luther King Jr. was assassinated in...", options: ["1963", "1965", "1968", "1972"], correctIndex: 2),
            MathExamQuestion(id: "his_27_p10", topicId: 27, prompt: "The NAACP (founded 1909) stands for...", options: ["National Association for the Advancement of Coloured People", "National Alliance Against Colonial Powers", "North American Association for Civil Protests", "National Agency for African-American Citizens' Policy"], correctIndex: 0),
        ],

        // Topic 28: The Space Race
        28: [
            MathExamQuestion(id: "his_28_p1", topicId: 28, prompt: "Which country launched Sputnik, the first artificial satellite, in 1957?", options: ["USA", "USSR", "China", "Germany"], correctIndex: 1),
            MathExamQuestion(id: "his_28_p2", topicId: 28, prompt: "Yuri Gagarin became the first human in space in...", options: ["1957", "1959", "1961", "1963"], correctIndex: 2),
            MathExamQuestion(id: "his_28_p3", topicId: 28, prompt: "The Apollo 11 mission landed astronauts on the Moon on...", options: ["July 20, 1969", "October 4, 1957", "April 12, 1961", "February 20, 1962"], correctIndex: 0),
            MathExamQuestion(id: "his_28_p4", topicId: 28, prompt: "Who was the first person to walk on the Moon?", options: ["Buzz Aldrin", "Neil Armstrong", "Yuri Gagarin", "John Glenn"], correctIndex: 1),
            MathExamQuestion(id: "his_28_p5", topicId: 28, prompt: "NASA stands for...", options: ["National Aero and Space Administration", "National Aeronautics and Space Administration", "North American Space Agency", "National Aviation and Science Academy"], correctIndex: 1),
            MathExamQuestion(id: "his_28_p6", topicId: 28, prompt: "What did Neil Armstrong say when he stepped onto the Moon?", options: ["'The Eagle has landed'", "'One small step for man, one giant leap for mankind'", "'We came in peace for all mankind'", "'To infinity and beyond'"], correctIndex: 1),
            MathExamQuestion(id: "his_28_p7", topicId: 28, prompt: "The Space Race was a competition between the USA and USSR primarily driven by...", options: ["Scientific curiosity alone", "Cold War rivalry and national prestige", "A joint UN agreement to explore space", "A business competition between private companies"], correctIndex: 1),
            MathExamQuestion(id: "his_28_p8", topicId: 28, prompt: "Laika, a dog launched by the USSR in 1957 on Sputnik 2, was significant because she was...", options: ["The first animal in orbit around Earth", "The first animal on the Moon", "The first animal launched into space (but not orbit)", "A US space agency test animal"], correctIndex: 0),
            MathExamQuestion(id: "his_28_p9", topicId: 28, prompt: "NASA was founded in which year?", options: ["1955", "1957", "1958", "1961"], correctIndex: 2),
            MathExamQuestion(id: "his_28_p10", topicId: 28, prompt: "Valentina Tereshkova, who flew in 1963, was notable as...", options: ["The first woman on the Moon", "The first woman in space", "The first American woman in space", "The first woman to design a spacecraft"], correctIndex: 1),
        ],

        // Topic 29: The Modern World
        29: [
            MathExamQuestion(id: "his_29_p1", topicId: 29, prompt: "The Berlin Wall fell in...", options: ["1985", "1987", "1989", "1991"], correctIndex: 2),
            MathExamQuestion(id: "his_29_p2", topicId: 29, prompt: "Who invented the World Wide Web in 1991?", options: ["Bill Gates", "Steve Jobs", "Tim Berners-Lee", "Mark Zuckerberg"], correctIndex: 2),
            MathExamQuestion(id: "his_29_p3", topicId: 29, prompt: "The September 11, 2001 attacks took place in...", options: ["Washington D.C. only", "New York City and other US locations", "London", "Madrid"], correctIndex: 1),
            MathExamQuestion(id: "his_29_p4", topicId: 29, prompt: "The end of the Cold War is associated with which key event?", options: ["The Moon landing", "The fall of the Berlin Wall and collapse of the USSR", "The death of Stalin", "The Cuban Missile Crisis"], correctIndex: 1),
            MathExamQuestion(id: "his_29_p5", topicId: 29, prompt: "Globalisation means...", options: ["All countries becoming one single nation", "Increased interconnection of countries through trade, communication, and culture", "Only rich countries trading with each other", "Space exploration connecting Earth to other planets"], correctIndex: 1),
            MathExamQuestion(id: "his_29_p6", topicId: 29, prompt: "The iPhone, which transformed mobile communication, was first launched in...", options: ["2001", "2005", "2007", "2010"], correctIndex: 2),
            MathExamQuestion(id: "his_29_p7", topicId: 29, prompt: "Climate change is caused mainly by...", options: ["Natural volcanic activity alone", "Human activities burning fossil fuels, releasing greenhouse gases", "The Sun getting hotter", "Changes in Earth's orbit only"], correctIndex: 1),
            MathExamQuestion(id: "his_29_p8", topicId: 29, prompt: "The 9/11 attacks led the USA to...", options: ["Withdraw from all international alliances", "Launch a 'War on Terror' and military actions in Afghanistan", "Impose economic sanctions on Europe", "Build the Berlin Wall"], correctIndex: 1),
            MathExamQuestion(id: "his_29_p9", topicId: 29, prompt: "The Soviet Union officially dissolved in...", options: ["1989", "1990", "1991", "1993"], correctIndex: 2),
            MathExamQuestion(id: "his_29_p10", topicId: 29, prompt: "Social media platforms began to emerge in the...", options: ["1980s", "1990s", "2000s", "2010s"], correctIndex: 2),
        ],

        // Topic 30: Revolutions & Change
        30: [
            MathExamQuestion(id: "his_30_p1", topicId: 30, prompt: "The American Revolution (1776) was a revolution against rule by...", options: ["France", "Spain", "Britain", "The Netherlands"], correctIndex: 2),
            MathExamQuestion(id: "his_30_p2", topicId: 30, prompt: "The French Revolution (1789) was driven by demands for liberty, equality, and...", options: ["Monarchy", "Fraternity (brotherhood)", "Empire", "Colonialism"], correctIndex: 1),
            MathExamQuestion(id: "his_30_p3", topicId: 30, prompt: "The Industrial Revolution is an example of what type of revolution?", options: ["Political revolution", "Technological and economic revolution", "Cultural revolution", "Military revolution"], correctIndex: 1),
            MathExamQuestion(id: "his_30_p4", topicId: 30, prompt: "The Digital Revolution refers to the shift to...", options: ["Steam-powered machinery", "Electricity-powered factories", "Digital computers and internet technology", "Nuclear-powered energy"], correctIndex: 2),
            MathExamQuestion(id: "his_30_p5", topicId: 30, prompt: "What is a common cause of political revolutions throughout history?", options: ["People being perfectly happy with their government", "Too many rights and too much wealth for ordinary people", "Inequality, poverty, and people demanding more rights", "Strong and fair leadership"], correctIndex: 2),
            MathExamQuestion(id: "his_30_p6", topicId: 30, prompt: "The slogan of the French Revolution was...", options: ["Life, Liberty and the pursuit of Happiness", "Liberté, Égalité, Fraternité", "Peace, Land, Bread", "Workers of the world, unite"], correctIndex: 1),
            MathExamQuestion(id: "his_30_p7", topicId: 30, prompt: "The US Declaration of Independence (1776) stated that all men are...", options: ["Subject to the will of the king", "Created equal and endowed with certain rights", "Required to serve in the military", "Forbidden to own land without royal permission"], correctIndex: 1),
            MathExamQuestion(id: "his_30_p8", topicId: 30, prompt: "Which revolution began in France in 1789 and led to the execution of King Louis XVI?", options: ["The American Revolution", "The Industrial Revolution", "The French Revolution", "The Glorious Revolution"], correctIndex: 2),
            MathExamQuestion(id: "his_30_p9", topicId: 30, prompt: "The lasting legacy of the American Revolution includes...", options: ["A return to monarchy", "The creation of the world's oldest surviving constitutional democracy", "The expansion of the British Empire", "The abolition of slavery immediately"], correctIndex: 1),
            MathExamQuestion(id: "his_30_p10", topicId: 30, prompt: "Which of the following best describes the impact of the Digital Revolution?", options: ["It made communication slower and more expensive", "It transformed how people work, communicate, and access information globally", "It only affected wealthy countries", "It reduced the number of jobs in the world significantly"], correctIndex: 1),
        ],

        31: [
        MathExamQuestion(id: "his_31_p1",  topicId: 31, prompt: "Between which two rivers was Mesopotamia located?",                                   options: ["Nile and Congo", "Tigris and Euphrates", "Indus and Ganges", "Amazon and Orinoco"],                                        correctIndex: 1),
        MathExamQuestion(id: "his_31_p2",  topicId: 31, prompt: "Which ancient people invented cuneiform writing?",                                     options: ["Babylonians", "Egyptians", "Sumerians", "Persians"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_31_p3",  topicId: 31, prompt: "What was Hammurabi's Code?",                                                           options: ["A type of cuneiform alphabet", "A Babylonian war strategy", "One of the world's earliest written law codes", "A trade agreement between city-states"], correctIndex: 2),
        MathExamQuestion(id: "his_31_p4",  topicId: 31, prompt: "What are ziggurats?",                                                                  options: ["Mesopotamian boats", "Underground tombs", "Temple-towers built by the Sumerians", "City walls"],                         correctIndex: 2),
        MathExamQuestion(id: "his_31_p5",  topicId: 31, prompt: "Which empire was ruled by Hammurabi?",                                                 options: ["Assyrian", "Babylonian", "Sumerian", "Akkadian"],                                                                         correctIndex: 1),
        MathExamQuestion(id: "his_31_p6",  topicId: 31, prompt: "What does 'Mesopotamia' mean?",                                                        options: ["Land of the pharaohs", "Land between the rivers", "Great river valley", "Home of the gods"],                            correctIndex: 1),
        MathExamQuestion(id: "his_31_p7",  topicId: 31, prompt: "How did Mesopotamian farmers water their crops?",                                      options: ["Rainwater collection", "Carrying water by hand", "Irrigation channels from rivers", "Underground wells only"],          correctIndex: 2),
        MathExamQuestion(id: "his_31_p8",  topicId: 31, prompt: "In which modern-day country was ancient Mesopotamia mainly located?",                  options: ["Egypt", "Iran", "Iraq", "Turkey"],                                                                                        correctIndex: 2),
        MathExamQuestion(id: "his_31_p9",  topicId: 31, prompt: "How many laws did Hammurabi's Code contain?",                                          options: ["82", "182", "282", "382"],                                                                                                correctIndex: 2),
        MathExamQuestion(id: "his_31_p10", topicId: 31, prompt: "Which civilisation in Mesopotamia is generally considered the world's first?",         options: ["Babylonian", "Sumerian", "Assyrian", "Akkadian"],                                                                         correctIndex: 1),
    ],

    32: [
        MathExamQuestion(id: "his_32_p1",  topicId: 32, prompt: "Along which river did the Indus Valley Civilisation develop?",                         options: ["Ganges", "Brahmaputra", "Indus", "Yamuna"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_32_p2",  topicId: 32, prompt: "Which ancient Indian emperor converted to Buddhism?",                                  options: ["Chandragupta", "Ashoka", "Bindusara", "Akbar"],                                                                           correctIndex: 1),
        MathExamQuestion(id: "his_32_p3",  topicId: 32, prompt: "Which empire united much of ancient India under one rule?",                            options: ["Gupta Empire", "Maurya Empire", "Mughal Empire", "Kushan Empire"],                                                        correctIndex: 1),
        MathExamQuestion(id: "his_32_p4",  topicId: 32, prompt: "Which religion originated in ancient India and is one of the world's oldest?",        options: ["Buddhism", "Islam", "Hinduism", "Jainism"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_32_p5",  topicId: 32, prompt: "What were the well-planned cities of the Indus Valley known for?",                    options: ["Massive pyramids", "Advanced drainage and straight streets", "Underground cities", "Wooden buildings"],                  correctIndex: 1),
        MathExamQuestion(id: "his_32_p6",  topicId: 32, prompt: "Approximately when did the Indus Valley Civilisation begin?",                         options: ["5000 BC", "2500 BC", "1000 BC", "500 BC"],                                                                               correctIndex: 1),
        MathExamQuestion(id: "his_32_p7",  topicId: 32, prompt: "Which concept from Hinduism refers to the idea that actions have consequences?",      options: ["Dharma", "Nirvana", "Karma", "Moksha"],                                                                                   correctIndex: 2),
        MathExamQuestion(id: "his_32_p8",  topicId: 32, prompt: "Which two major cities were part of the Indus Valley Civilisation?",                  options: ["Delhi and Mumbai", "Mohenjo-daro and Harappa", "Varanasi and Agra", "Patna and Taxila"],                                correctIndex: 1),
        MathExamQuestion(id: "his_32_p9",  topicId: 32, prompt: "Where did Emperor Ashoka send Buddhist missionaries?",                                 options: ["Only within India", "Sri Lanka and Central Asia", "Greece and Rome", "China and Japan only"],                           correctIndex: 1),
        MathExamQuestion(id: "his_32_p10", topicId: 32, prompt: "Which religion did Ashoka follow before converting to Buddhism?",                      options: ["Jainism", "Islam", "Hinduism", "Zoroastrianism"],                                                                         correctIndex: 2),
    ],

    33: [
        MathExamQuestion(id: "his_33_p1",  topicId: 33, prompt: "Which emperor founded the Achaemenid Persian Empire around 550 BC?",                  options: ["Darius I", "Xerxes", "Cyrus the Great", "Cambyses"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_33_p2",  topicId: 33, prompt: "How far did the Persian Empire stretch at its height?",                               options: ["From Greece to India", "From Egypt to India", "From Rome to China", "From Mesopotamia to Africa"],                       correctIndex: 1),
        MathExamQuestion(id: "his_33_p3",  topicId: 33, prompt: "Which Persian king fought the Greeks in a major war?",                                options: ["Cyrus the Great", "Cambyses II", "Darius I", "Artaxerxes"],                                                               correctIndex: 2),
        MathExamQuestion(id: "his_33_p4",  topicId: 33, prompt: "What was the Battle of Marathon (490 BC)?",                                           options: ["A Persian victory over Egypt", "A Greek victory over Persia", "A Spartan rebellion", "A sea battle near Athens"],       correctIndex: 1),
        MathExamQuestion(id: "his_33_p5",  topicId: 33, prompt: "What did Cyrus the Great do differently from most conquerors of his time?",           options: ["He enslaved all conquered peoples", "He respected the cultures and religions of conquered peoples", "He destroyed all foreign cities", "He forced everyone to speak Persian"], correctIndex: 1),
        MathExamQuestion(id: "his_33_p6",  topicId: 33, prompt: "What was the Royal Road built by Darius used for?",                                   options: ["Military parades", "Swift communication across the empire", "Trading only with Greece", "Transporting slaves"],          correctIndex: 1),
        MathExamQuestion(id: "his_33_p7",  topicId: 33, prompt: "Approximately how long was the Royal Road?",                                          options: ["500 km", "1,200 km", "2,700 km", "5,000 km"],                                                                            correctIndex: 2),
        MathExamQuestion(id: "his_33_p8",  topicId: 33, prompt: "Which empire did the Persians clash with in the Persian Wars?",                       options: ["Roman Empire", "Greek city-states", "Babylonian Empire", "Egyptian Empire"],                                             correctIndex: 1),
        MathExamQuestion(id: "his_33_p9",  topicId: 33, prompt: "What is the name of the famous Persian Empire founded by Cyrus the Great?",           options: ["Sassanid Empire", "Parthian Empire", "Achaemenid Empire", "Safavid Empire"],                                            correctIndex: 2),
        MathExamQuestion(id: "his_33_p10", topicId: 33, prompt: "In which modern country was the heart of the ancient Persian Empire?",                options: ["Iraq", "Turkey", "Iran", "Syria"],                                                                                        correctIndex: 2),
    ],

    34: [
        MathExamQuestion(id: "his_34_p1",  topicId: 34, prompt: "Who was at the TOP of the feudal pyramid?",                                           options: ["Knights", "Lords", "The King", "The Pope"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_34_p2",  topicId: 34, prompt: "What did serfs owe their lord in the feudal system?",                                 options: ["Gold coins", "Military service", "Labour on the land", "Religious prayers"],                                             correctIndex: 2),
        MathExamQuestion(id: "his_34_p3",  topicId: 34, prompt: "What did a lord give knights in exchange for military service?",                      options: ["Money and jewels", "Land and protection", "Food and clothing", "Weapons and armour only"],                              correctIndex: 1),
        MathExamQuestion(id: "his_34_p4",  topicId: 34, prompt: "What was a manor?",                                                                   options: ["A type of castle tower", "A lord's estate including a village and farmland", "A medieval market town", "A type of weapon"], correctIndex: 1),
        MathExamQuestion(id: "his_34_p5",  topicId: 34, prompt: "Who were the knights loyal to in the feudal system?",                                 options: ["The Church", "Their lord", "The king directly", "Other knights"],                                                         correctIndex: 1),
        MathExamQuestion(id: "his_34_p6",  topicId: 34, prompt: "Could serfs leave the manor without permission?",                                     options: ["Yes, whenever they wanted", "Yes, but only to trade", "No, they needed the lord's permission", "Yes, during harvest time"], correctIndex: 2),
        MathExamQuestion(id: "his_34_p7",  topicId: 34, prompt: "Roughly during which centuries did feudalism dominate medieval Europe?",               options: ["3rd–6th centuries", "9th–15th centuries", "15th–18th centuries", "1st–3rd centuries"],                                    correctIndex: 1),
        MathExamQuestion(id: "his_34_p8",  topicId: 34, prompt: "What did a king grant lords in exchange for military loyalty?",                       options: ["Gold and silver", "Land", "Church titles", "Merchant ships"],                                                             correctIndex: 1),
        MathExamQuestion(id: "his_34_p9",  topicId: 34, prompt: "Who were at the BOTTOM of the feudal pyramid?",                                      options: ["Knights", "Lords", "Serfs", "Bishops"],                                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_34_p10", topicId: 34, prompt: "What type of soldier fought on horseback for their lord?",                            options: ["Archers", "Foot soldiers", "Knights", "Mercenaries"],                                                                    correctIndex: 2),
    ],

    35: [
        MathExamQuestion(id: "his_35_p1",  topicId: 35, prompt: "Who was the leader of the Catholic Church during the Middle Ages?",                   options: ["The King of France", "The Holy Roman Emperor", "The Pope", "The Archbishop of Canterbury"],                               correctIndex: 2),
        MathExamQuestion(id: "his_35_p2",  topicId: 35, prompt: "Where was the Pope based during the Middle Ages?",                                    options: ["Paris", "Jerusalem", "Constantinople", "Rome"],                                                                           correctIndex: 3),
        MathExamQuestion(id: "his_35_p3",  topicId: 35, prompt: "What did monks do in monasteries to preserve knowledge?",                             options: ["Built roads", "Hand-copied books and texts", "Trained soldiers", "Collected taxes"],                                     correctIndex: 1),
        MathExamQuestion(id: "his_35_p4",  topicId: 35, prompt: "What is excommunication?",                                                            options: ["A type of church tax", "Being banned from the Church by the Pope", "A church building ceremony", "A pilgrimage to Rome"], correctIndex: 1),
        MathExamQuestion(id: "his_35_p5",  topicId: 35, prompt: "What were large grand church buildings built as symbols of faith called?",            options: ["Monasteries", "Basilicas", "Cathedrals", "Chapels"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_35_p6",  topicId: 35, prompt: "Approximately how long did it take to build Notre Dame Cathedral in Paris?",          options: ["10 years", "50 years", "Nearly 200 years", "Over 500 years"],                                                             correctIndex: 2),
        MathExamQuestion(id: "his_35_p7",  topicId: 35, prompt: "What services did monasteries provide to communities?",                               options: ["Military training only", "Caring for the sick and running schools", "Collecting taxes for the king", "Building castles"],  correctIndex: 1),
        MathExamQuestion(id: "his_35_p8",  topicId: 35, prompt: "What events did the Catholic Church help launch from the late 11th century?",         options: ["The Viking raids", "The Crusades", "The Hundred Years War", "The Black Death campaigns"],                               correctIndex: 1),
        MathExamQuestion(id: "his_35_p9",  topicId: 35, prompt: "The Catholic Church influenced which aspect of medieval life?",                       options: ["Only religion", "Only politics", "Both politics and daily life", "Only education"],                                       correctIndex: 2),
        MathExamQuestion(id: "his_35_p10", topicId: 35, prompt: "What did medieval cathedrals symbolise for the communities that built them?",         options: ["Military power", "Royal authority", "Faith and community pride", "Trade wealth"],                                        correctIndex: 2),
    ],

    36: [
        MathExamQuestion(id: "his_36_p1",  topicId: 36, prompt: "What was the Black Death?",                                                           options: ["A medieval war", "A devastating plague that killed millions", "A famine across Europe", "A volcanic eruption"],           correctIndex: 1),
        MathExamQuestion(id: "his_36_p2",  topicId: 36, prompt: "Approximately what fraction of Europe's population died during the Black Death?",     options: ["One tenth", "One quarter", "One third", "One half"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_36_p3",  topicId: 36, prompt: "What were guilds in medieval society?",                                               options: ["Groups of soldiers", "Associations of skilled craftspeople protecting their trades", "Church organisations", "Noble families"], correctIndex: 1),
        MathExamQuestion(id: "his_36_p4",  topicId: 36, prompt: "Approximately when did the Black Death strike Europe?",                               options: ["1000–1010", "1200–1210", "1347–1351", "1400–1410"],                                                                       correctIndex: 2),
        MathExamQuestion(id: "his_36_p5",  topicId: 36, prompt: "What was a castle primarily used for?",                                               options: ["A market and trade centre", "A home and fortress for the lord", "A monastery", "A school"],                             correctIndex: 1),
        MathExamQuestion(id: "his_36_p6",  topicId: 36, prompt: "Who formed the largest group of people in medieval society?",                         options: ["Knights", "Lords", "Peasants", "Monks"],                                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_36_p7",  topicId: 36, prompt: "What did a guild apprentice have to do before becoming a master craftsman?",          options: ["Pay a large sum of gold", "Train for years under a master", "Win a tournament", "Get permission from the king"],        correctIndex: 1),
        MathExamQuestion(id: "his_36_p8",  topicId: 36, prompt: "How many people approximately did the Black Death kill across Europe?",               options: ["5 million", "10 million", "25 million", "50 million"],                                                                    correctIndex: 2),
        MathExamQuestion(id: "his_36_p9",  topicId: 36, prompt: "What did the Black Death do to the feudal order?",                                    options: ["Strengthened it", "Had no effect", "Shook and helped change medieval society", "Made lords more powerful"],             correctIndex: 2),
        MathExamQuestion(id: "his_36_p10", topicId: 36, prompt: "Medieval peasant life revolved mainly around which activities?",                      options: ["Trade and travel", "Farming and the Church calendar", "Mining and building", "Warfare and hunting"],                    correctIndex: 1),
    ],

    37: [
        MathExamQuestion(id: "his_37_p1",  topicId: 37, prompt: "Who called for the First Crusade in 1095?",                                           options: ["King Richard I", "Pope Urban II", "Emperor Frederick I", "Saladin"],                                                      correctIndex: 1),
        MathExamQuestion(id: "his_37_p2",  topicId: 37, prompt: "What was the main stated goal of the Crusades?",                                      options: ["To conquer Rome", "To capture Jerusalem and the Holy Land", "To defeat the Mongols", "To trade with China"],             correctIndex: 1),
        MathExamQuestion(id: "his_37_p3",  topicId: 37, prompt: "Between which years did the Crusades take place?",                                    options: ["800–1000", "1095–1291", "1300–1450", "1200–1400"],                                                                        correctIndex: 1),
        MathExamQuestion(id: "his_37_p4",  topicId: 37, prompt: "Which religion controlled Jerusalem before the Crusades?",                            options: ["Christianity", "Judaism", "Islam", "Zoroastrianism"],                                                                     correctIndex: 2),
        MathExamQuestion(id: "his_37_p5",  topicId: 37, prompt: "What did Europeans bring back from the Crusades?",                                    options: ["Nothing of value", "New ideas, technologies, and trade goods from the East", "Prisoners of war only", "New farming methods from Africa"], correctIndex: 1),
        MathExamQuestion(id: "his_37_p6",  topicId: 37, prompt: "What was Krak des Chevaliers?",                                                       options: ["A Crusader castle in the Holy Land", "A famous mosque in Jerusalem", "A trade ship", "A Byzantine palace"],             correctIndex: 0),
        MathExamQuestion(id: "his_37_p7",  topicId: 37, prompt: "What long-term effect did the Crusades have on European knowledge?",                  options: ["Europeans learned nothing new", "They gained access to advanced Islamic science and medicine", "They spread their knowledge eastward only", "They lost contact with the East"], correctIndex: 1),
        MathExamQuestion(id: "his_37_p8",  topicId: 37, prompt: "Were the Crusades largely successful in their military goals?",                       options: ["Yes, they permanently held Jerusalem", "No, they were largely unsuccessful militarily", "Yes, they conquered the whole Middle East", "Yes, Islam was defeated"], correctIndex: 1),
        MathExamQuestion(id: "his_37_p9",  topicId: 37, prompt: "The Crusades can best be described as which type of wars?",                           options: ["Trade wars", "Religious military campaigns", "Territorial disputes between European kingdoms", "Viking-led invasions"],  correctIndex: 1),
        MathExamQuestion(id: "his_37_p10", topicId: 37, prompt: "What effect did the Crusades have on trade between East and West?",                   options: ["They stopped all trade", "They opened up trade routes and cultural exchange", "They had no effect on trade", "They only helped the East trade"],  correctIndex: 1),
    ],

    38: [
        MathExamQuestion(id: "his_38_p1",  topicId: 38, prompt: "What was the Byzantine Empire a continuation of?",                                    options: ["The Greek city-states", "The Eastern Roman Empire", "The Ottoman Empire", "The Holy Roman Empire"],                        correctIndex: 1),
        MathExamQuestion(id: "his_38_p2",  topicId: 38, prompt: "When did the Byzantine Empire fall?",                                                  options: ["476 AD", "1054 AD", "1204 AD", "1453 AD"],                                                                               correctIndex: 3),
        MathExamQuestion(id: "his_38_p3",  topicId: 38, prompt: "Which emperor codified Roman law into the Corpus Juris Civilis?",                     options: ["Constantine", "Theodosius", "Justinian I", "Basil II"],                                                                   correctIndex: 2),
        MathExamQuestion(id: "his_38_p4",  topicId: 38, prompt: "What famous building did Emperor Justinian build in Constantinople?",                 options: ["The Colosseum", "The Parthenon", "The Hagia Sophia", "The Pantheon"],                                                     correctIndex: 2),
        MathExamQuestion(id: "his_38_p5",  topicId: 38, prompt: "Which branch of Christianity did the Byzantine Empire preserve and spread?",          options: ["Catholicism", "Protestantism", "Orthodox Christianity", "Coptic Christianity"],                                          correctIndex: 2),
        MathExamQuestion(id: "his_38_p6",  topicId: 38, prompt: "Who conquered Constantinople in 1453, ending the Byzantine Empire?",                  options: ["The Mongols", "The Crusaders", "The Ottoman Turks", "The Persians"],                                                      correctIndex: 2),
        MathExamQuestion(id: "his_38_p7",  topicId: 38, prompt: "How long was the Hagia Sophia the largest cathedral in the world?",                   options: ["About 100 years", "About 500 years", "Nearly 1,000 years", "Over 1,500 years"],                                          correctIndex: 2),
        MathExamQuestion(id: "his_38_p8",  topicId: 38, prompt: "What did Byzantine scholars fleeing to Italy after 1453 help spark?",                 options: ["The French Revolution", "The Industrial Revolution", "The Renaissance", "The Reformation"],                              correctIndex: 2),
        MathExamQuestion(id: "his_38_p9",  topicId: 38, prompt: "What was the capital of the Byzantine Empire?",                                       options: ["Rome", "Athens", "Alexandria", "Constantinople"],                                                                         correctIndex: 3),
        MathExamQuestion(id: "his_38_p10", topicId: 38, prompt: "Justinian's law code became the foundation of legal systems in which region?",        options: ["Asia", "Africa", "Europe", "The Americas"],                                                                               correctIndex: 2),
    ],

        39: [
        MathExamQuestion(id: "his_39_p1",  topicId: 39, prompt: "What was the Silk Road primarily used for?",                                              options: ["Military conquest", "Trade and cultural exchange", "Religious pilgrimage only", "Scientific exploration"],    correctIndex: 1),
        MathExamQuestion(id: "his_39_p2",  topicId: 39, prompt: "Which famous explorer wrote about his travels along the Silk Road?",                      options: ["Christopher Columbus", "Vasco da Gama", "Marco Polo", "Ferdinand Magellan"],                                   correctIndex: 2),
        MathExamQuestion(id: "his_39_p3",  topicId: 39, prompt: "Which civilisation was the eastern starting point of the Silk Road?",                     options: ["India", "China", "Persia", "Greece"],                                                                           correctIndex: 1),
        MathExamQuestion(id: "his_39_p4",  topicId: 39, prompt: "What valuable fabric gave the Silk Road its name?",                                       options: ["Cotton", "Wool", "Silk", "Linen"],                                                                              correctIndex: 2),
        MathExamQuestion(id: "his_39_p5",  topicId: 39, prompt: "Besides goods, what else spread along the Silk Road?",                                    options: ["Only money", "Ideas, religions, and diseases", "Nothing  -  it was only for merchants", "Languages alone"],      correctIndex: 1),
        MathExamQuestion(id: "his_39_p6",  topicId: 39, prompt: "Which animal was most commonly used to carry goods across the Silk Road deserts?",        options: ["Horse", "Elephant", "Camel", "Ox"],                                                                             correctIndex: 2),
        MathExamQuestion(id: "his_39_p7",  topicId: 39, prompt: "The Silk Road connected Asia to which other part of the world?",                          options: ["Australia", "The Americas", "Europe and the Middle East", "Sub-Saharan Africa"],                              correctIndex: 2),
        MathExamQuestion(id: "his_39_p8",  topicId: 39, prompt: "Marco Polo travelled the Silk Road during which century?",                                options: ["10th century", "11th century", "12th century", "13th century"],                                               correctIndex: 3),
        MathExamQuestion(id: "his_39_p9",  topicId: 39, prompt: "Which religion spread westward along the Silk Road from India?",                          options: ["Christianity", "Buddhism", "Judaism", "Shinto"],                                                                correctIndex: 1),
        MathExamQuestion(id: "his_39_p10", topicId: 39, prompt: "The Silk Road was not just one road but a network of…",                                   options: ["Rivers", "Sea lanes", "Routes across land and sea", "Tunnels"],                                                 correctIndex: 2),
    ],

    40: [
        MathExamQuestion(id: "his_40_p1",  topicId: 40, prompt: "The Magna Carta was signed in which year?",                                              options: ["1066", "1215", "1492", "1776"],                                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_40_p2",  topicId: 40, prompt: "The Magna Carta limited the power of which ruler?",                                       options: ["The French King", "The Holy Roman Emperor", "The English King", "The Pope"],                                   correctIndex: 2),
        MathExamQuestion(id: "his_40_p3",  topicId: 40, prompt: "What does a constitution do?",                                                            options: ["Gives a ruler unlimited power", "Sets out the rules and rights that govern a country", "Only controls the army", "Decides tax rates"], correctIndex: 1),
        MathExamQuestion(id: "his_40_p4",  topicId: 40, prompt: "Which ancient city is often called the birthplace of democracy?",                         options: ["Rome", "Athens", "Sparta", "Alexandria"],                                                                       correctIndex: 1),
        MathExamQuestion(id: "his_40_p5",  topicId: 40, prompt: "In a constitutional government, who must also follow the law?",                           options: ["Only citizens", "Only judges", "Everyone including the ruler", "Only soldiers"],                               correctIndex: 2),
        MathExamQuestion(id: "his_40_p6",  topicId: 40, prompt: "Which country adopted the first written national constitution in 1788?",                  options: ["France", "United Kingdom", "United States", "Canada"],                                                          correctIndex: 2),
        MathExamQuestion(id: "his_40_p7",  topicId: 40, prompt: "What is the term for a system where citizens elect representatives to govern?",           options: ["Monarchy", "Dictatorship", "Theocracy", "Representative democracy"],                                           correctIndex: 3),
        MathExamQuestion(id: "his_40_p8",  topicId: 40, prompt: "The Magna Carta is written in which language?",                                           options: ["English", "French", "Latin", "Greek"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_40_p9",  topicId: 40, prompt: "Which document declared that 'all men are created equal' in 1776?",                       options: ["The Magna Carta", "The US Constitution", "The Declaration of Independence", "The Bill of Rights"],            correctIndex: 2),
        MathExamQuestion(id: "his_40_p10", topicId: 40, prompt: "What is the name for a government where one person holds all power with no legal limits?", options: ["Democracy", "Republic", "Autocracy", "Federation"],                                                            correctIndex: 2),
    ],

    41: [
        MathExamQuestion(id: "his_41_p1",  topicId: 41, prompt: "Which ancient queen ruled Egypt and was known for her intelligence and political skill?",  options: ["Nefertiti", "Cleopatra", "Hatshepsut", "Boudicca"],                                                             correctIndex: 1),
        MathExamQuestion(id: "his_41_p2",  topicId: 41, prompt: "Joan of Arc led the army of which country?",                                              options: ["England", "Spain", "France", "Italy"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_41_p3",  topicId: 41, prompt: "Queen Elizabeth I reigned over which country?",                                           options: ["Scotland", "France", "Spain", "England"],                                                                       correctIndex: 3),
        MathExamQuestion(id: "his_41_p4",  topicId: 41, prompt: "The suffrage movement fought for women's right to…",                                      options: ["Own property only", "Vote", "Travel freely", "Attend university only"],                                         correctIndex: 1),
        MathExamQuestion(id: "his_41_p5",  topicId: 41, prompt: "Women in New Zealand gained the right to vote in which year?",                            options: ["1848", "1893", "1920", "1945"],                                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_41_p6",  topicId: 41, prompt: "What term describes women who campaigned for the right to vote?",                         options: ["Abolitionists", "Suffragettes", "Reformers", "Loyalists"],                                                      correctIndex: 1),
        MathExamQuestion(id: "his_41_p7",  topicId: 41, prompt: "Which female pharaoh of ancient Egypt ruled as king and wore a false beard?",             options: ["Cleopatra", "Nefertiti", "Hatshepsut", "Ankhesenamun"],                                                         correctIndex: 2),
        MathExamQuestion(id: "his_41_p8",  topicId: 41, prompt: "Joan of Arc was inspired by what to lead the French army?",                               options: ["A dream about Napoleon", "Religious visions and voices", "A royal decree", "Her father's instructions"],       correctIndex: 1),
        MathExamQuestion(id: "his_41_p9",  topicId: 41, prompt: "In which century did women gain the right to vote in most Western countries?",            options: ["18th century", "19th century", "20th century", "21st century"],                                               correctIndex: 2),
        MathExamQuestion(id: "his_41_p10", topicId: 41, prompt: "Which queen led a revolt against Roman rule in Britain around 60 AD?",                    options: ["Cleopatra", "Joan of Arc", "Boudicca", "Mary Queen of Scots"],                                                  correctIndex: 2),
    ],

    42: [
        MathExamQuestion(id: "his_42_p1",  topicId: 42, prompt: "Which West African empire was famous for its control of the gold and salt trade?",         options: ["Songhai", "Mali", "Axum", "Kush"],                                                                              correctIndex: 1),
        MathExamQuestion(id: "his_42_p2",  topicId: 42, prompt: "Mansa Musa was the ruler of which empire?",                                               options: ["Songhai", "Egypt", "Mali", "Great Zimbabwe"],                                                                   correctIndex: 2),
        MathExamQuestion(id: "his_42_p3",  topicId: 42, prompt: "Great Zimbabwe was located in which part of Africa?",                                     options: ["West Africa", "North Africa", "East Africa", "Southern Africa"],                                               correctIndex: 3),
        MathExamQuestion(id: "his_42_p4",  topicId: 42, prompt: "What did Mansa Musa cause in Egypt during his pilgrimage to Mecca?",                      options: ["A war", "Inflation due to his enormous wealth", "A famine", "A revolution"],                                   correctIndex: 1),
        MathExamQuestion(id: "his_42_p5",  topicId: 42, prompt: "The Songhai Empire's great centre of learning was in which city?",                        options: ["Cairo", "Timbuktu", "Carthage", "Nairobi"],                                                                     correctIndex: 1),
        MathExamQuestion(id: "his_42_p6",  topicId: 42, prompt: "Great Zimbabwe is famous for its impressive…",                                            options: ["Pyramids", "Stone walls and enclosures", "Underground temples", "Painted caves"],                               correctIndex: 1),
        MathExamQuestion(id: "his_42_p7",  topicId: 42, prompt: "The trans-Saharan trade routes mainly crossed which geographical feature?",               options: ["The Amazon Rainforest", "The Sahara Desert", "The Nile River", "The Atlas Mountains"],                         correctIndex: 1),
        MathExamQuestion(id: "his_42_p8",  topicId: 42, prompt: "Which ancient African kingdom controlled trade along the Red Sea coast?",                  options: ["Mali", "Songhai", "Axum", "Kush"],                                                                              correctIndex: 2),
        MathExamQuestion(id: "his_42_p9",  topicId: 42, prompt: "What precious metal was most associated with the Mali Empire's wealth?",                   options: ["Silver", "Copper", "Gold", "Iron"],                                                                             correctIndex: 2),
        MathExamQuestion(id: "his_42_p10", topicId: 42, prompt: "Which essential mineral was traded northward across the Sahara to West Africa?",           options: ["Iron", "Salt", "Coal", "Tin"],                                                                                  correctIndex: 1),
    ],

    43: [
        MathExamQuestion(id: "his_43_p1",  topicId: 43, prompt: "Which ancient American civilisation built the city of Tenochtitlan?",                     options: ["Maya", "Inca", "Aztec", "Olmec"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_43_p2",  topicId: 43, prompt: "The Maya civilisation was mainly located in which region?",                               options: ["The Andes Mountains", "Mesoamerica (Central America and Mexico)", "The Amazon Basin", "The Caribbean Islands"], correctIndex: 1),
        MathExamQuestion(id: "his_43_p3",  topicId: 43, prompt: "Which ancient American civilisation built an empire along the Andes Mountains?",          options: ["Aztec", "Maya", "Olmec", "Inca"],                                                                               correctIndex: 3),
        MathExamQuestion(id: "his_43_p4",  topicId: 43, prompt: "The Maya are famous for developing what type of system?",                                  options: ["An early democracy", "A highly accurate calendar", "A steam engine", "A postal service"],                      correctIndex: 1),
        MathExamQuestion(id: "his_43_p5",  topicId: 43, prompt: "Which Spanish explorer conquered the Aztec Empire?",                                       options: ["Francisco Pizarro", "Hernán Cortés", "Vasco de Balboa", "Juan Ponce de León"],                                 correctIndex: 1),
        MathExamQuestion(id: "his_43_p6",  topicId: 43, prompt: "What large structures did both the Maya and Aztec build for religious purposes?",          options: ["Cathedrals", "Pyramids", "Colosseum-style arenas", "Obelisks"],                                                  correctIndex: 1),
        MathExamQuestion(id: "his_43_p7",  topicId: 43, prompt: "The Inca Empire's capital city was called…",                                              options: ["Tenochtitlan", "Chichen Itza", "Cuzco", "Machu Picchu"],                                                       correctIndex: 2),
        MathExamQuestion(id: "his_43_p8",  topicId: 43, prompt: "Which Spanish conquistador conquered the Inca Empire?",                                    options: ["Hernán Cortés", "Francisco Pizarro", "Vasco da Gama", "Ferdinand Magellan"],                                   correctIndex: 1),
        MathExamQuestion(id: "his_43_p9",  topicId: 43, prompt: "What was one major reason why the Spanish conquered the Americas so quickly?",             options: ["Superior numbers of soldiers", "Advanced aircraft", "European diseases that devastated native populations", "Better knowledge of the land"], correctIndex: 2),
        MathExamQuestion(id: "his_43_p10", topicId: 43, prompt: "Which of these is a famous Inca mountain citadel?",                                       options: ["Chichen Itza", "Teotihuacan", "Machu Picchu", "Monte Albán"],                                                   correctIndex: 2),
    ],

    44: [
        MathExamQuestion(id: "his_44_p1",  topicId: 44, prompt: "Who founded the Mongol Empire?",                                                          options: ["Kublai Khan", "Genghis Khan", "Tamerlane", "Attila the Hun"],                                                   correctIndex: 1),
        MathExamQuestion(id: "his_44_p2",  topicId: 44, prompt: "The Mongol Empire was the largest what in history?",                                      options: ["Naval empire", "Contiguous land empire", "Island empire", "Underground empire"],                               correctIndex: 1),
        MathExamQuestion(id: "his_44_p3",  topicId: 44, prompt: "What does 'Pax Mongolica' mean?",                                                         options: ["Mongol War", "Mongol Conquest", "Mongol Peace", "Mongol Law"],                                                  correctIndex: 2),
        MathExamQuestion(id: "his_44_p4",  topicId: 44, prompt: "The Mongol Empire stretched from the Pacific Ocean to…",                                  options: ["West Africa", "Eastern Europe", "South America", "Australia"],                                                  correctIndex: 1),
        MathExamQuestion(id: "his_44_p5",  topicId: 44, prompt: "The Mongols were known for their exceptional skill in which type of warfare?",            options: ["Naval battles", "Siege warfare only", "Horse archery", "Infantry combat"],                                      correctIndex: 2),
        MathExamQuestion(id: "his_44_p6",  topicId: 44, prompt: "Which grandson of Genghis Khan ruled China and founded the Yuan Dynasty?",                options: ["Ögedei Khan", "Möngke Khan", "Kublai Khan", "Batu Khan"],                                                       correctIndex: 2),
        MathExamQuestion(id: "his_44_p7",  topicId: 44, prompt: "The Pax Mongolica allowed safe passage along which major trade route?",                   options: ["The Spice Route", "The Silk Road", "The Atlantic Route", "The Amber Road"],                                    correctIndex: 1),
        MathExamQuestion(id: "his_44_p8",  topicId: 44, prompt: "Genghis Khan's original name before he became great ruler was…",                          options: ["Temüjin", "Ögedei", "Batu", "Chagatai"],                                                                        correctIndex: 0),
        MathExamQuestion(id: "his_44_p9",  topicId: 44, prompt: "In which century did Genghis Khan begin uniting the Mongol tribes?",                      options: ["10th century", "11th century", "12th century", "13th century"],                                               correctIndex: 3),
        MathExamQuestion(id: "his_44_p10", topicId: 44, prompt: "What communications system helped the Mongols control their vast empire?",                options: ["Carrier pigeons only", "Horse relay messenger stations (Yam)", "Telegraph lines", "Written edicts alone"],     correctIndex: 1),
    ],

    45: [
        MathExamQuestion(id: "his_45_p1",  topicId: 45, prompt: "In which year did the Ottoman Empire fall of Constantinople?",                            options: ["1389", "1453", "1517", "1683"],                                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_45_p2",  topicId: 45, prompt: "Constantinople falling to the Ottomans marked the end of which empire?",                 options: ["The Roman Empire", "The Byzantine Empire", "The Persian Empire", "The Arab Caliphate"],                       correctIndex: 1),
        MathExamQuestion(id: "his_45_p3",  topicId: 45, prompt: "Which Ottoman sultan is known as 'the Magnificent'?",                                    options: ["Selim I", "Mehmed II", "Suleiman I", "Murad II"],                                                               correctIndex: 2),
        MathExamQuestion(id: "his_45_p4",  topicId: 45, prompt: "The Ottoman Empire was founded in approximately which year?",                             options: ["1099", "1199", "1299", "1399"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_45_p5",  topicId: 45, prompt: "The Ottoman capital Constantinople was later renamed to what?",                           options: ["Ankara", "Bursa", "Istanbul", "Izmir"],                                                                         correctIndex: 2),
        MathExamQuestion(id: "his_45_p6",  topicId: 45, prompt: "The Ottoman Empire spanned how many continents at its greatest extent?",                  options: ["One", "Two", "Three", "Four"],                                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_45_p7",  topicId: 45, prompt: "The Ottoman Empire officially ended in which year?",                                      options: ["1918", "1920", "1922", "1924"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_45_p8",  topicId: 45, prompt: "The Ottoman Empire's population included people of many different…",                      options: ["Only one religion", "Ethnicities, languages, and religions", "Only Turkish speakers", "Only Muslims"],        correctIndex: 1),
        MathExamQuestion(id: "his_45_p9",  topicId: 45, prompt: "Which Anatolian region did the Ottoman Empire first emerge from?",                        options: ["Persia (Iran)", "Arabia (Saudi Arabia)", "Anatolia (modern Turkey)", "Egypt"],                                 correctIndex: 2),
        MathExamQuestion(id: "his_45_p10", topicId: 45, prompt: "The famous Hagia Sophia was converted from a church to a mosque after the fall of which city?", options: ["Jerusalem", "Rome", "Alexandria", "Constantinople"],                                               correctIndex: 3),
    ],

    46: [
        MathExamQuestion(id: "his_46_p1",  topicId: 46, prompt: "In which year did the Soviet Union collapse, ending the Cold War?",                       options: ["1985", "1989", "1991", "1995"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_46_p2",  topicId: 46, prompt: "The September 11 attacks took place in which year?",                                      options: ["1999", "2000", "2001", "2003"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_46_p3",  topicId: 46, prompt: "Which term describes the increasing global connection of economies, cultures and peoples?", options: ["Nationalism", "Isolationism", "Globalisation", "Colonialism"],                                              correctIndex: 2),
        MathExamQuestion(id: "his_46_p4",  topicId: 46, prompt: "The September 11 attacks led to a US-led military campaign known as the…",                options: ["Cold War", "Gulf War", "War on Terror", "Space Race"],                                                          correctIndex: 2),
        MathExamQuestion(id: "his_46_p5",  topicId: 46, prompt: "Which country's rapid economic growth has made it a major world power since the 1990s?",  options: ["Brazil", "India", "Russia", "China"],                                                                          correctIndex: 3),
        MathExamQuestion(id: "his_46_p6",  topicId: 46, prompt: "The fall of the Berlin Wall in 1989 symbolised the end of division in which country?",   options: ["Soviet Union", "Germany", "Poland", "Czechoslovakia"],                                                          correctIndex: 1),
        MathExamQuestion(id: "his_46_p7",  topicId: 46, prompt: "The internet became publicly available and transformed society mainly from which decade?", options: ["1970s", "1980s", "1990s", "2000s"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_46_p8",  topicId: 46, prompt: "The terrorist attacks of 11 September 2001 targeted buildings in which country?",         options: ["United Kingdom", "France", "Afghanistan", "United States"],                                                    correctIndex: 3),
        MathExamQuestion(id: "his_46_p9",  topicId: 46, prompt: "The term 'post-Cold War world' refers to the period after which event?",                  options: ["World War II ended", "The Vietnam War ended", "The USSR collapsed", "The Korean War ended"],                  correctIndex: 2),
        MathExamQuestion(id: "his_46_p10", topicId: 46, prompt: "Which international body was strengthened after the Cold War to resolve global conflicts?", options: ["NATO", "The League of Nations", "The United Nations", "The European Union"],                              correctIndex: 2),
    ],

        // MARK: Topic 47 — Big Bang & Early Earth
        47: [
            MathExamQuestion(id: "his_47_p1", topicId: 47, prompt: "Approximately how old is the universe?", options: ["4.6 billion years", "13.8 billion years", "1 million years", "500 million years"], correctIndex: 1),
            MathExamQuestion(id: "his_47_p2", topicId: 47, prompt: "What event created the universe?", options: ["A massive earthquake", "The Big Bang", "A giant volcano", "A collision of planets"], correctIndex: 1),
            MathExamQuestion(id: "his_47_p3", topicId: 47, prompt: "How old is planet Earth?", options: ["13.8 billion years", "1 billion years", "4.6 billion years", "200 million years"], correctIndex: 2),
            MathExamQuestion(id: "his_47_p4", topicId: 47, prompt: "What pulled gas and dust together to form stars and planets?", options: ["Wind", "Gravity", "Electricity", "Water"], correctIndex: 1),
            MathExamQuestion(id: "his_47_p5", topicId: 47, prompt: "Who discovered that distant galaxies are moving away from us?", options: ["Isaac Newton", "Albert Einstein", "Edwin Hubble", "Galileo Galilei"], correctIndex: 2),
            MathExamQuestion(id: "his_47_p6", topicId: 47, prompt: "What formed first on early Earth that allowed life to develop?", options: ["Deserts", "Ice caps", "Oceans and atmosphere", "Mountains"], correctIndex: 2),
            MathExamQuestion(id: "his_47_p7", topicId: 47, prompt: "The universe is still doing what today?", options: ["Shrinking", "Staying the same size", "Expanding", "Cooling down completely"], correctIndex: 2),
            MathExamQuestion(id: "his_47_p8", topicId: 47, prompt: "What is our solar system part of?", options: ["The Milky Way galaxy", "The Andromeda galaxy", "A black hole", "A nebula only"], correctIndex: 0),
            MathExamQuestion(id: "his_47_p9", topicId: 47, prompt: "Which of these formed AFTER the Big Bang?", options: ["Time and space themselves", "Stars and galaxies", "Atoms of hydrogen", "All of the above"], correctIndex: 3),
            MathExamQuestion(id: "his_47_p10", topicId: 47, prompt: "What is the name of our home galaxy?", options: ["Andromeda", "The Milky Way", "Triangulum", "Sombrero"], correctIndex: 1),
        ],

        // MARK: Topic 48 — Dinosaurs & Prehistoric Life
        48: [
            MathExamQuestion(id: "his_48_p1", topicId: 48, prompt: "Approximately when did the first life appear on Earth?", options: ["66 million years ago", "252 million years ago", "3.5 billion years ago", "500 years ago"], correctIndex: 2),
            MathExamQuestion(id: "his_48_p2", topicId: 48, prompt: "What is the 'Age of Dinosaurs' also known as?", options: ["Palaeozoic Era", "Mesozoic Era", "Cenozoic Era", "Ice Age"], correctIndex: 1),
            MathExamQuestion(id: "his_48_p3", topicId: 48, prompt: "What most likely caused the extinction of non-bird dinosaurs?", options: ["A massive volcano alone", "A meteor/asteroid impact", "Too much rain", "Humans hunting them"], correctIndex: 1),
            MathExamQuestion(id: "his_48_p4", topicId: 48, prompt: "When did the Mesozoic Era end?", options: ["252 million years ago", "3.5 billion years ago", "66 million years ago", "10,000 years ago"], correctIndex: 2),
            MathExamQuestion(id: "his_48_p5", topicId: 48, prompt: "Which animals are living descendants of dinosaurs?", options: ["Crocodiles", "Birds", "Lizards", "Sharks"], correctIndex: 1),
            MathExamQuestion(id: "his_48_p6", topicId: 48, prompt: "What type of organism was the very first life on Earth?", options: ["Fish", "Insects", "Single-celled organisms", "Plants"], correctIndex: 2),
            MathExamQuestion(id: "his_48_p7", topicId: 48, prompt: "What were T. rex teeth compared to in size?", options: ["Pencils", "Bananas", "Books", "Coins"], correctIndex: 1),
            MathExamQuestion(id: "his_48_p8", topicId: 48, prompt: "Which period came BEFORE the Mesozoic Era?", options: ["Cenozoic Era", "Jurassic Period", "Palaeozoic Era", "Ice Age"], correctIndex: 2),
            MathExamQuestion(id: "his_48_p9", topicId: 48, prompt: "What does 'fossil' mean?", options: ["A living animal", "The preserved remains of ancient life", "A type of rock", "An extinct plant"], correctIndex: 1),
            MathExamQuestion(id: "his_48_p10", topicId: 48, prompt: "Which of these was NOT a dinosaur?", options: ["Triceratops", "Velociraptor", "Woolly Mammoth", "Brachiosaurus"], correctIndex: 2),
        ],

        // MARK: Topic 49 — Early Humans
        49: [
            MathExamQuestion(id: "his_49_p1", topicId: 49, prompt: "Where did Homo sapiens first evolve?", options: ["Asia", "Europe", "Africa", "Australia"], correctIndex: 2),
            MathExamQuestion(id: "his_49_p2", topicId: 49, prompt: "Approximately when did modern humans (Homo sapiens) appear?", options: ["300,000 years ago", "3 million years ago", "66 million years ago", "10,000 years ago"], correctIndex: 0),
            MathExamQuestion(id: "his_49_p3", topicId: 49, prompt: "What does 'hunter-gatherer' mean?", options: ["Someone who farms crops", "Someone who hunts animals and gathers wild plants for food", "A person who builds houses", "A warrior who fights in battles"], correctIndex: 1),
            MathExamQuestion(id: "his_49_p4", topicId: 49, prompt: "Which other human species lived at the same time as early Homo sapiens?", options: ["Homo roboticus", "Neanderthals", "Homo giganticus", "Dinosaur people"], correctIndex: 1),
            MathExamQuestion(id: "his_49_p5", topicId: 49, prompt: "Approximately when did humans start migrating out of Africa?", options: ["10,000 years ago", "1 million years ago", "70,000 years ago", "200 years ago"], correctIndex: 2),
            MathExamQuestion(id: "his_49_p6", topicId: 49, prompt: "What important discovery helped early humans survive cold climates and cook food?", options: ["Writing", "Fire", "The wheel", "Metal tools"], correctIndex: 1),
            MathExamQuestion(id: "his_49_p7", topicId: 49, prompt: "Some modern humans carry Neanderthal DNA. What percentage is typical?", options: ["20–30%", "50%", "1–4%", "0% — none at all"], correctIndex: 2),
            MathExamQuestion(id: "his_49_p8", topicId: 49, prompt: "Early humans made tools mainly from which material?", options: ["Iron", "Plastic", "Stone and bone", "Glass"], correctIndex: 2),
            MathExamQuestion(id: "his_49_p9", topicId: 49, prompt: "Cave paintings by early humans showed mainly what?", options: ["Maps of the world", "Animals, hunting scenes, and symbols", "Mathematical equations", "Writing in letters"], correctIndex: 1),
            MathExamQuestion(id: "his_49_p10", topicId: 49, prompt: "The study of human fossils and ancient remains is called…", options: ["Biology", "Archaeology/Palaeoanthropology", "Chemistry", "Geography"], correctIndex: 1),
        ],

        // MARK: Topic 50 — The Stone Age
        50: [
            MathExamQuestion(id: "his_50_p1", topicId: 50, prompt: "What material did Stone Age people mainly use to make tools?", options: ["Iron", "Bronze", "Flint/stone", "Wood only"], correctIndex: 2),
            MathExamQuestion(id: "his_50_p2", topicId: 50, prompt: "The Stone Age ended approximately when?", options: ["1,000 AD", "3,000 BC", "1,000,000 BC", "100 years ago"], correctIndex: 1),
            MathExamQuestion(id: "his_50_p3", topicId: 50, prompt: "What is the Neolithic Revolution?", options: ["The invention of the wheel", "When people began farming and settling in villages", "The discovery of fire", "The first war in history"], correctIndex: 1),
            MathExamQuestion(id: "his_50_p4", topicId: 50, prompt: "During the Palaeolithic period, people were mainly…", options: ["Farmers who stayed in one place", "Nomadic hunter-gatherers", "City dwellers", "Sailors"], correctIndex: 1),
            MathExamQuestion(id: "his_50_p5", topicId: 50, prompt: "Stonehenge was built during which period?", options: ["The Iron Age", "The Bronze Age", "The late Stone Age", "Roman times"], correctIndex: 2),
            MathExamQuestion(id: "his_50_p6", topicId: 50, prompt: "What major change did farming bring to human life?", options: ["People became nomadic", "People settled in permanent villages", "People moved underwater", "People stopped using fire"], correctIndex: 1),
            MathExamQuestion(id: "his_50_p7", topicId: 50, prompt: "Approximately when did the Neolithic (farming) Revolution begin?", options: ["10,000 BC", "3,000 AD", "1 million BC", "100 BC"], correctIndex: 0),
            MathExamQuestion(id: "his_50_p8", topicId: 50, prompt: "The Stone Age is divided into which two main periods?", options: ["Early and Late", "Palaeolithic and Neolithic", "Bronze and Iron", "Ancient and Modern"], correctIndex: 1),
            MathExamQuestion(id: "his_50_p9", topicId: 50, prompt: "Which of these was a key Stone Age skill?", options: ["Making pottery from clay", "Using computers", "Building steam engines", "Smelting iron"], correctIndex: 0),
            MathExamQuestion(id: "his_50_p10", topicId: 50, prompt: "The first Stone Age people to farm were mainly located in which region?", options: ["Northern Europe", "The Fertile Crescent (Middle East)", "South America", "Australia"], correctIndex: 1),
        ],

        // MARK: Topic 51 — Bronze Age & Iron Age
        51: [
            MathExamQuestion(id: "his_51_p1", topicId: 51, prompt: "What two metals are mixed to make bronze?", options: ["Iron and gold", "Copper and tin", "Silver and lead", "Iron and copper"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p2", topicId: 51, prompt: "Approximately when did the Bronze Age begin?", options: ["100 AD", "3,000 BC", "10,000 BC", "1,500 AD"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p3", topicId: 51, prompt: "What was a major achievement of the Bronze Age?", options: ["Invention of the aeroplane", "Rise of first cities and writing systems", "Discovery of electricity", "Building of Stonehenge"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p4", topicId: 51, prompt: "The Iron Age followed the Bronze Age because iron was…", options: ["More colourful", "Rarer and more precious", "Harder and more widely available", "Lighter than bronze"], correctIndex: 2),
            MathExamQuestion(id: "his_51_p5", topicId: 51, prompt: "Approximately when did the Bronze Age end?", options: ["66 million years ago", "1,200 BC", "3,000 AD", "500 AD"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p6", topicId: 51, prompt: "What is smelting?", options: ["A type of ancient food", "Melting ore to extract metal", "A form of ancient writing", "A farming technique"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p7", topicId: 51, prompt: "Iron tools and weapons gave an advantage because they were…", options: ["Cheaper and easier to melt", "Harder and more widely available than bronze", "More decorative than gold", "Lighter than stone"], correctIndex: 1),
            MathExamQuestion(id: "his_51_p8", topicId: 51, prompt: "Which of these was created during the Bronze Age?", options: ["Steam engines", "The internet", "Early writing systems like cuneiform", "Gunpowder"], correctIndex: 2),
            MathExamQuestion(id: "his_51_p9", topicId: 51, prompt: "The Iron Age began around approximately…", options: ["1,200 BC", "10,000 BC", "500 AD", "3,000 BC"], correctIndex: 0),
            MathExamQuestion(id: "his_51_p10", topicId: 51, prompt: "Iron ploughs in the Iron Age transformed farming by…", options: ["Making it unnecessary", "Allowing harder soil to be broken up and farmed", "Replacing all animals", "Creating irrigation canals"], correctIndex: 1),
        ],
    ]

    // MARK: - Exam Questions

    private static let examQuestionsByTopic: [Int: [MathExamQuestion]] = [

        // MARK: Topic 1  -  My Family & Community (Exam)
        1: [
            MathExamQuestion(
                id: "his_1_e1",
                topicId: 1,
                prompt: "Which of these people is a community helper who delivers letters and parcels?",
                options: ["A vet", "A postman", "A chef", "A dentist"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e2",
                topicId: 1,
                prompt: "What is the role of a nurse in the community?",
                options: ["To fix broken pipes", "To look after sick or injured people", "To teach children", "To drive buses"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e3",
                topicId: 1,
                prompt: "Which of these is an example of a family rule?",
                options: ["Eat as much sugar as you like", "Do your homework before watching TV", "Stay up as late as you want", "Never go to school"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e4",
                topicId: 1,
                prompt: "What does a firefighter do?",
                options: ["Cuts hair", "Puts out fires and rescues people", "Teaches at school", "Delivers food"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e5",
                topicId: 1,
                prompt: "A person who helps sick animals is called a…",
                options: ["Doctor", "Vet", "Nurse", "Farmer"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e6",
                topicId: 1,
                prompt: "Which of these best describes a 'community'?",
                options: ["A group of animals in a forest", "People living and working together in the same area", "A classroom of children", "A single family"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e7",
                topicId: 1,
                prompt: "Why is it important to follow rules in a community?",
                options: ["So that everyone is unhappy", "Rules have no purpose", "To keep everyone safe and treat people fairly", "To make the community smaller"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_1_e8",
                topicId: 1,
                prompt: "What is one responsibility a child has at school?",
                options: ["Driving a school bus", "Listening to the teacher and completing work", "Running the school office", "Writing the school rules"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e9",
                topicId: 1,
                prompt: "Which community helper uses a stethoscope?",
                options: ["Plumber", "Electrician", "Doctor", "Police officer"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_1_e10",
                topicId: 1,
                prompt: "A grandparent is part of which group?",
                options: ["The community only", "Extended family", "Neighbours", "Teachers"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e11",
                topicId: 1,
                prompt: "Which of the following best explains WHY communities have different helpers with different jobs?",
                options: ["Because people dislike doing the same work", "Because specialisation allows each job to be done by someone trained and skilled in it", "Because the government assigns all jobs randomly", "Because there are too many people and not enough work"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e12",
                topicId: 1,
                prompt: "If a community had NO rules or laws, what would MOST LIKELY happen?",
                options: ["People would be happier and freer", "Society would function more efficiently", "Disputes and conflicts would increase and safety would decrease", "Everyone would cooperate naturally without rules"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_1_e13",
                topicId: 1,
                prompt: "How does a nuclear family DIFFER from an extended family?",
                options: ["A nuclear family includes grandparents, aunts, and uncles; an extended family does not", "A nuclear family includes only parents and their children; an extended family includes more distant relatives", "A nuclear family is always larger than an extended family", "There is no difference between the two types"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e14",
                topicId: 1,
                prompt: "A child notices that their city has fire stations, police stations, hospitals, and schools. What does this BEST show about the community?",
                options: ["The community wastes money on unnecessary buildings", "Communities are organised to meet the safety, health, and education needs of all residents", "Only governments decide what buildings a community needs", "These buildings are only for adults"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_1_e15",
                topicId: 1,
                prompt: "Both families and communities have rules. How are family rules and community laws SIMILAR?",
                options: ["They are both written in official legal documents", "They are both designed to protect members and ensure fair treatment", "They are both enforced by police officers", "They are both created by children and adults together"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_1_h1", topicId: 1, prompt: "A sociologist studying communities might argue that the division of labour — different people doing different jobs — benefits society MOST by:", options: ["Ensuring no single person has too much power", "Allowing specialisation so each service is performed by someone trained for it, increasing efficiency and quality for all", "Making it easier for governments to collect taxes", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_1_h2", topicId: 1, prompt: "A child in a rural community relies on different helpers than a child in a city. What does this BEST illustrate about community helpers?", options: ["Rural communities are less advanced", "The types of helpers in a community reflect the specific needs and resources of that environment", "Cities always have more helpers than villages", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_1_h3", topicId: 1, prompt: "Families are considered the PRIMARY social unit in most cultures. Which argument BEST supports why families are called the 'building block' of society?", options: ["Families are all the same size across cultures", "Families are where individuals first learn values, rules, language, and social behaviour — the foundations needed to participate in a wider community", "All governments are modelled directly on family structures", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_1_h4", topicId: 1, prompt: "In some communities, the same person fulfils multiple roles (e.g., a parent who is also a teacher and a volunteer). What does this suggest about communities?", options: ["Overlapping roles indicate a community is disorganised", "Individuals can contribute to community life in multiple ways simultaneously, and roles are not always exclusive", "Communities function best when each person has only one role", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_1_h5", topicId: 1, prompt: "Historians and social scientists distinguish between 'formal' rules (laws) and 'informal' rules (social norms). Which example represents an INFORMAL community rule?", options: ["A law requiring drivers to stop at red lights", "A custom of greeting neighbours politely when passing them on the street", "A regulation requiring buildings to meet safety standards", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 2  -  Holidays & Traditions (Exam)
        2: [
            MathExamQuestion(
                id: "his_2_e1",
                topicId: 2,
                prompt: "Eid al-Adha is a Muslim festival that celebrates…",
                options: ["The end of Ramadan fasting", "The Hajj pilgrimage and Ibrahim's willingness to sacrifice his son", "The new year", "The birth of Muhammad"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e2",
                topicId: 2,
                prompt: "Which country is the origin of the Diwali festival?",
                options: ["China", "Egypt", "India", "Japan"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_e3",
                topicId: 2,
                prompt: "Hanukkah lasts for how many nights?",
                options: ["Three", "Five", "Seven", "Eight"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_2_e4",
                topicId: 2,
                prompt: "Which holiday involves carving pumpkins into jack-o'-lanterns?",
                options: ["Christmas", "Diwali", "Halloween", "Chinese New Year"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_e5",
                topicId: 2,
                prompt: "Easter is a Christian holiday that celebrates…",
                options: ["The birth of Jesus", "The resurrection of Jesus", "The Last Supper", "The baptism of Jesus"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e6",
                topicId: 2,
                prompt: "Chinese New Year is based on which type of calendar?",
                options: ["Solar calendar", "Gregorian calendar", "Lunar calendar", "Julian calendar"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_2_e7",
                topicId: 2,
                prompt: "Which of these is a tradition associated with Christmas in many countries?",
                options: ["Lighting a menorah", "Giving gifts and decorating a tree", "Setting off fireworks only", "Fasting for a month"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e8",
                topicId: 2,
                prompt: "Thanksgiving is a holiday celebrated mainly in which country?",
                options: ["Australia", "Canada and the United States", "United Kingdom", "Brazil"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e9",
                topicId: 2,
                prompt: "The Festival of Lights celebrated by Hindus, Sikhs, and Jains is called…",
                options: ["Hanukkah", "Diwali", "Eid", "Vesak"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e10",
                topicId: 2,
                prompt: "What does the word 'tradition' mean?",
                options: ["A new invention", "A custom or belief passed down through generations", "A type of food", "A school subject"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e11",
                topicId: 2,
                prompt: "Both Diwali and Hanukkah involve lighting lights. What do these two festivals have in COMMON despite coming from different religions?",
                options: ["They are both celebrated on exactly the same date", "Both symbolise the triumph of light over darkness or good over evil", "They are both harvest festivals", "They both last for exactly eight days"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e12",
                topicId: 2,
                prompt: "Why might a tradition change or adapt as families move to a new country?",
                options: ["Traditions never change under any circumstances", "New environments, cultures, and available resources may influence how a tradition is practised", "Governments force immigrants to abandon all traditions", "Children always reject the traditions of their parents"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e13",
                topicId: 2,
                prompt: "Ramadan is the ninth month of the Islamic lunar calendar, during which Muslims fast from dawn to sunset. What is the name of the celebratory feast that marks its END?",
                options: ["Eid al-Adha", "Eid al-Fitr", "Mawlid", "Muharram"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e14",
                topicId: 2,
                prompt: "A historian studying traditions would most likely use which type of PRIMARY SOURCE?",
                options: ["A modern textbook describing holidays", "A diary entry written by someone celebrating a festival 200 years ago", "A map of the world", "A school curriculum guide"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_2_e15",
                topicId: 2,
                prompt: "How does celebrating shared traditions HELP a community or nation?",
                options: ["It reduces the economy", "It builds a sense of shared identity and strengthens social bonds", "It forces everyone to practise the same religion", "It has no significant social effect"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_2_h1", topicId: 2, prompt: "Some historians argue that national holidays, like Bastille Day in France or Independence Day in the USA, serve a political function beyond celebration. What is this function?", options: ["They generate tourism revenue only", "They reinforce national identity and a shared narrative about a country's founding values and history", "They are designed to give workers a day off", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_2_h2", topicId: 2, prompt: "Both Diwali (Hindu) and Hanukkah (Jewish) involve lighting lights over multiple days. A critic argues this similarity proves they share a common origin. Why is this argument WEAK?", options: ["Neither festival involves light", "Superficial similarities in ritual practice do not establish a shared origin — the theological meanings, historical contexts, and religious narratives of the two festivals are entirely different", "The festivals are celebrated on the same date every year", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_2_h3", topicId: 2, prompt: "An anthropologist studying traditions would note that many harvest festivals (e.g., Thanksgiving, Sukkot, Pongal) exist across cultures. What does this MOST LIKELY indicate?", options: ["All these cultures had the same ancient origin", "Agrarian societies around the world independently developed rituals to give thanks for harvests because food security was universally crucial to survival", "These festivals were invented in the 20th century", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_2_h4", topicId: 2, prompt: "When a tradition is 'commercialised' (e.g., companies selling Christmas decorations), some argue it loses its original meaning. Which position represents the STRONGEST counter-argument?", options: ["Commercialisation always destroys traditions entirely", "Commercialisation can coexist with genuine religious or cultural observance; many people maintain deep personal meaning in celebrations regardless of commercial activity", "Traditions that are commercialised should be banned", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_2_h5", topicId: 2, prompt: "The Chinese Lunar New Year date changes each year on the Gregorian calendar but falls on the same date in the lunar calendar. What does this demonstrate about how different cultures MEASURE time?", options: ["The lunar calendar is inaccurate", "Different civilisations developed different calendar systems based on observations of the moon, sun, or stars, reflecting different cultural and agricultural priorities", "The Gregorian calendar was invented by the Chinese", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 3  -  Famous People in History (Exam)
        3: [
            MathExamQuestion(
                id: "his_3_e1",
                topicId: 3,
                prompt: "In what city did Rosa Parks refuse to give up her bus seat in 1955?",
                options: ["Atlanta", "Birmingham", "Montgomery", "Memphis"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_e2",
                topicId: 3,
                prompt: "Martin Luther King Jr. delivered his 'I Have a Dream' speech in which city?",
                options: ["New York", "Washington D.C.", "Chicago", "Atlanta"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e3",
                topicId: 3,
                prompt: "Which spacecraft carried Neil Armstrong to the Moon?",
                options: ["Apollo 11", "Gemini 6", "Sputnik 1", "Discovery"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_3_e4",
                topicId: 3,
                prompt: "What was Amelia Earhart attempting to do when she disappeared in 1937?",
                options: ["Cross the Atlantic Ocean", "Fly around the world", "Set a speed record over Europe", "Fly to the North Pole"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e5",
                topicId: 3,
                prompt: "Marie Curie was the first woman to win a Nobel Prize. In which year did she win her first?",
                options: ["1888", "1903", "1911", "1920"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e6",
                topicId: 3,
                prompt: "Nelson Mandela was president of South Africa from 1994 until…",
                options: ["1996", "1998", "1999", "2000"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_e7",
                topicId: 3,
                prompt: "What did Neil Armstrong say as he stepped onto the Moon?",
                options: ["To infinity and beyond!", "One small step for man, one giant leap for mankind", "We came in peace for all mankind", "Houston, we have a problem"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e8",
                topicId: 3,
                prompt: "Rosa Parks' act of protest helped start which important movement?",
                options: ["The Women's Suffrage Movement", "The Civil Rights Movement", "The Environmental Movement", "The Labour Movement"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e9",
                topicId: 3,
                prompt: "In what country was Marie Curie born?",
                options: ["France", "Germany", "Poland", "Russia"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_3_e10",
                topicId: 3,
                prompt: "Martin Luther King Jr. was awarded the Nobel Peace Prize in which year?",
                options: ["1957", "1960", "1963", "1964"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_3_e11",
                topicId: 3,
                prompt: "Rosa Parks and Martin Luther King Jr. both fought for civil rights, but how did their METHODS primarily differ?",
                options: ["Parks used violence while King used peaceful protest", "Parks acted through a single act of civil disobedience while King organised large-scale non-violent campaigns and speeches", "King worked alone while Parks led a mass movement", "They used identical methods with no real difference"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e12",
                topicId: 3,
                prompt: "Marie Curie won the Nobel Prize in Physics in 1903 AND the Nobel Prize in Chemistry in 1911. What makes this achievement historically significant?",
                options: ["She was the first person of any gender to win two Nobel Prizes in two different scientific disciplines", "She was the first scientist to discover radioactivity before anyone else worked in the field", "She was the only scientist ever to win a Nobel Prize in the 20th century", "She was the first woman to attend university in Europe"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_3_e13",
                topicId: 3,
                prompt: "Neil Armstrong walked on the Moon in 1969 during the Cold War. How did this achievement AFFECT the geopolitical rivalry between the USA and USSR?",
                options: ["It had no political significance, only scientific value", "It was seen as a decisive US victory in the Space Race, boosting American prestige and morale globally", "It caused the USSR to immediately end the Cold War", "It led the USSR to accelerate its own Moon programme successfully"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e14",
                topicId: 3,
                prompt: "A historian CRITIQUING historical accounts of Nelson Mandela might argue that early biographies written during apartheid were biased because they were:",
                options: ["Written by journalists who interviewed him personally", "Written by South African government sources that portrayed him as a terrorist rather than a freedom fighter", "Written by academics in neutral countries with no political agenda", "Written by Mandela himself and therefore too modest"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_3_e15",
                topicId: 3,
                prompt: "Comparing Martin Luther King Jr. (USA) and Mahatma Gandhi (India), what is the MOST significant similarity in their historical approaches?",
                options: ["Both led armies to fight colonial powers", "Both used non-violent civil disobedience to challenge unjust laws and achieved major political change", "Both were lawyers who argued their cases in court only", "Both were assassinated before achieving any of their goals"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_3_h1", topicId: 3, prompt: "Historians distinguish between 'great man theory' (history is shaped by exceptional individuals) and structural explanations (history is shaped by social forces). Which statement BEST critiques the great man theory using civil rights history?", options: ["Rosa Parks and Martin Luther King Jr. acted entirely alone with no broader social movement behind them", "The Civil Rights Movement succeeded because of millions of ordinary participants, legal changes, and economic pressures — not solely because of individual leaders", "Great leaders are always more important than social forces in every historical event", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_3_h2", topicId: 3, prompt: "Marie Curie conducted her research in an era when women were largely excluded from scientific institutions. How does understanding this context CHANGE the significance of her achievements?", options: ["It makes her work less impressive because she had help from her husband Pierre", "It makes her achievements even more remarkable because she overcame structural barriers (sexism, limited access to laboratories and funding) that would have stopped most people", "Context is irrelevant — only the scientific results matter", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_3_h3", topicId: 3, prompt: "Nelson Mandela spent 27 years in prison before becoming president. A historian might argue this period was historically significant NOT just as suffering, but because:", options: ["Prison proved he had committed crimes against the state", "His imprisonment became a global symbol of the injustice of apartheid, galvanising international opposition and economic pressure on the South African government", "Mandela changed his political views entirely while in prison", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_3_h4", topicId: 3, prompt: "Neil Armstrong's Moon landing is described as a triumph of human achievement. A critical historian might ALSO note which less-celebrated aspect of the Apollo programme?", options: ["The Moon landing was faked in a studio", "The Apollo programme consumed enormous public resources and its primary motivation was Cold War competition rather than pure scientific exploration", "No new scientific knowledge was gained from the Moon landing", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_3_h5", topicId: 3, prompt: "When evaluating a biography of a famous historical figure, a historian should MOST importantly consider:", options: ["Whether the biography was published by a well-known company", "The author's perspective, the sources used, the date of publication, and whether alternative viewpoints are presented or ignored", "How long the biography is and how many photographs it contains", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 4  -  Then & Now (Exam)
        4: [
            MathExamQuestion(
                id: "his_4_e1",
                topicId: 4,
                prompt: "The first telephone was invented by Alexander Graham Bell in approximately which year?",
                options: ["1845", "1876", "1901", "1920"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e2",
                topicId: 4,
                prompt: "Which invention in the early 1900s changed everyday travel for millions of people?",
                options: ["The steam train", "The mass-produced car (Model T Ford)", "The aeroplane", "The bicycle"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e3",
                topicId: 4,
                prompt: "When were the first commercial television broadcasts available to the public?",
                options: ["1900s", "1920s–1930s", "1950s–1960s", "1980s"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e4",
                topicId: 4,
                prompt: "What was the primary source of power for factories and trains in the 1800s?",
                options: ["Electricity", "Wind power", "Steam power", "Nuclear energy"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_e5",
                topicId: 4,
                prompt: "Which invention allowed people worldwide to share information almost instantly from the 1990s onwards?",
                options: ["The printing press", "The telegraph", "The internet", "The telephone"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_e6",
                topicId: 4,
                prompt: "In the early 20th century, what was the most common fuel used for heating homes?",
                options: ["Electricity", "Solar power", "Coal and wood", "Natural gas"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_e7",
                topicId: 4,
                prompt: "Which of these modern inventions has made it possible to speak face-to-face with someone on another continent?",
                options: ["The radio", "Video calling", "The fax machine", "The telegram"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e8",
                topicId: 4,
                prompt: "Before supermarkets, where did most people buy their everyday food?",
                options: ["Online", "From local markets and small shops", "From large department stores", "From factories"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e9",
                topicId: 4,
                prompt: "Which invention by Gutenberg in 1440 changed how information was shared across Europe?",
                options: ["The compass", "The telescope", "The printing press", "The steam engine"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_4_e10",
                topicId: 4,
                prompt: "What major change in medicine during the 20th century saved millions of lives from infectious diseases?",
                options: ["Better surgery only", "Vaccines and antibiotics", "Exercise programmes", "Vitamins"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e11",
                topicId: 4,
                prompt: "A historian comparing life in 1900 with life in 2000 would MOST likely conclude that the biggest cause of changed daily life was:",
                options: ["Changes in fashion and clothing styles", "Technological innovation across transport, communication, and medicine", "A change in people's attitudes to hard work", "The growth of farming communities"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e12",
                topicId: 4,
                prompt: "The invention of the telegraph in the 1830s–40s and the invention of the internet in the 1990s are historically SIMILAR because both:",
                options: ["Used exactly the same underlying technology", "Revolutionised long-distance communication by dramatically reducing the time needed to send messages", "Were invented by the same scientists", "Were initially only used by military organisations"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e13",
                topicId: 4,
                prompt: "Which CAUSE-AND-EFFECT relationship correctly describes the impact of the car on 20th-century society?",
                options: ["More cars caused fewer cities to be built", "Mass car ownership led to the growth of suburbs, the decline of railways, and the rise of road-building programmes", "Cars replaced aeroplanes as the main form of international travel", "Car production reduced industrial employment"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e14",
                topicId: 4,
                prompt: "According to historians of technology, what was the MOST significant effect of Gutenberg's printing press (1440s) on European society in the following century?",
                options: ["It allowed governments to control information more easily", "It spread literacy and new ideas rapidly, contributing to the Reformation and the Renaissance", "It was used primarily to print money and aid trade", "It replaced scribes instantly, ending all manuscript production within ten years"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_4_e15",
                topicId: 4,
                prompt: "If you were examining a PRIMARY SOURCE from 1920 describing 'modern' transport, which vehicle would MOST LIKELY be discussed as new and revolutionary at that time?",
                options: ["The bicycle, which had just been invented", "The motor car and early commercial aviation", "The high-speed electric train", "The smartphone-enabled autonomous vehicle"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_4_h1", topicId: 4, prompt: "Historians studying the pace of technological change note that innovations often follow an S-curve: slow adoption, then rapid spread, then plateau. Which 20th-century technology BEST fits this pattern?", options: ["The stone tool, which was used for millions of years without change", "Television — invented in the 1920s, slowly adopted, then rapidly widespread by the 1960s–70s, and now plateauing as streaming replaces it", "The handwritten letter, which became universal immediately after writing was invented", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_4_h2", topicId: 4, prompt: "A historian comparing PRIMARY sources from 1900 and 2000 about daily life would need to account for which key interpretive challenge?", options: ["Sources from 1900 are always more reliable because they are older", "Both sources reflect the perspectives, assumptions, and limitations of their respective times — a 1900 writer could not anticipate the future, and a 2000 writer may romanticise the past", "Sources from 2000 are always biased because they are too recent", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_4_h3", topicId: 4, prompt: "Some historians argue that the Industrial Revolution was the SINGLE most transformative period in human history since the Neolithic Revolution. Which argument BEST supports this claim?", options: ["It introduced the concept of government for the first time", "It fundamentally restructured how humans produced goods, organised society, used energy, and related to nature — changes that compound to this day", "It was the first time humans used metal tools", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_4_h4", topicId: 4, prompt: "When comparing life 'then' and 'now', a careful historian must avoid 'presentism' — judging the past by present-day standards. Which of the following is an example of presentism?", options: ["Noting that travel was slower in 1900 because cars didn't exist yet", "Criticising medieval people for not knowing about germ theory when this scientific knowledge did not exist until the 19th century", "Recognising that attitudes toward women's rights changed over the 20th century", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_4_h5", topicId: 4, prompt: "The digital revolution of the late 20th century is sometimes compared to the printing press revolution of the 15th century. Which SPECIFIC parallel do historians draw between the two?", options: ["Both inventions were created by the same country", "Both dramatically reduced the cost and increased the speed of spreading information to mass audiences, challenging existing power structures in the process", "Both were primarily used by governments to control populations", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 5  -  Early Explorers (Exam)
        5: [
            MathExamQuestion(
                id: "his_5_e1",
                topicId: 5,
                prompt: "Columbus's first voyage in 1492 was funded by which monarchs?",
                options: ["King John II of Portugal", "Queen Elizabeth I of England", "King Ferdinand and Queen Isabella of Spain", "King Charles VIII of France"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e2",
                topicId: 5,
                prompt: "How many ships did Columbus sail with on his first voyage?",
                options: ["Two", "Three", "Four", "Five"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e3",
                topicId: 5,
                prompt: "Ferdinand Magellan died during his circumnavigation voyage. Where did he die?",
                options: ["South America", "The Philippines", "India", "Africa"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e4",
                topicId: 5,
                prompt: "Which explorer is credited with the first European sea voyage from Europe around Africa to India?",
                options: ["Columbus", "Magellan", "Vasco da Gama", "Cabral"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e5",
                topicId: 5,
                prompt: "Zheng He commanded enormous Chinese treasure fleets during which dynasty?",
                options: ["Tang Dynasty", "Song Dynasty", "Ming Dynasty", "Qing Dynasty"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e6",
                topicId: 5,
                prompt: "What was the name of Columbus's flagship on his 1492 voyage?",
                options: ["Pinta", "Niña", "Santa María", "Victoria"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e7",
                topicId: 5,
                prompt: "Which ocean did Columbus cross to reach the Americas?",
                options: ["Pacific Ocean", "Indian Ocean", "Atlantic Ocean", "Arctic Ocean"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e8",
                topicId: 5,
                prompt: "Vasco da Gama's sea route to India helped Portugal gain control of the profitable…",
                options: ["Silk road", "Spice trade", "Fur trade", "Gold trade"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e9",
                topicId: 5,
                prompt: "Which explorer gave his name to the continent of America?",
                options: ["Columbus", "Amerigo Vespucci", "Magellan", "Cabot"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e10",
                topicId: 5,
                prompt: "Leif Erikson's settlement in North America was called…",
                options: ["Vinland", "Greenland", "Iceland", "Newfoundland"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_5_e11",
                topicId: 5,
                prompt: "Historians debate whether Columbus 'discovered' America. Which argument BEST challenges this claim?",
                options: ["Columbus published a detailed map of the Americas before his voyage", "Indigenous peoples had lived in the Americas for thousands of years before Columbus arrived, and Leif Erikson had reached it around 1000 AD", "The Spanish crown had already sent secret expeditions before 1492", "Columbus never actually landed in the Americas — he only reached the Atlantic islands"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e12",
                topicId: 5,
                prompt: "Vasco da Gama's sea route around Africa to India (1498) had which MAJOR CONSEQUENCE for world trade?",
                options: ["It ended all Silk Road trade immediately", "It allowed Portugal to bypass the Ottoman-controlled overland spice trade routes and dominate the spice trade directly", "It caused Spain to abandon its exploration of the Americas", "It led directly to the colonisation of Australia"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e13",
                topicId: 5,
                prompt: "Columbus sailed west expecting to reach Asia. His MISTAKE about the size of the Earth compared to the actual distance was significant because:",
                options: ["He knew about the Americas but chose not to tell the Spanish monarchs", "His underestimate of the Earth's circumference led him to believe Asia was reachable — without the Americas being in the way, his expedition would have failed from lack of supplies", "All European geographers of the time agreed with Columbus's calculations", "The mistake had no practical effect on the voyage's outcome"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_5_e14",
                topicId: 5,
                prompt: "Comparing Zheng He's Chinese voyages (1405–1433) with European exploration of the same era, what is the MOST striking difference in their LONG-TERM IMPACT?",
                options: ["Chinese voyages were shorter in distance than European ones", "Chinese voyages led to permanent overseas empires while European ones did not", "European voyages led to colonisation and global empires while China's voyages ended without establishing colonies or lasting trade dominance", "There is no significant difference in long-term impact"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_5_e15",
                topicId: 5,
                prompt: "Which PRIMARY SOURCE would be MOST useful to a historian studying the impact of European exploration on indigenous peoples of the Americas?",
                options: ["A navigation chart used by Columbus in 1492", "A letter written by a Spanish conquistador describing a battle with indigenous forces", "An account written by a Native American leader describing the arrival of Europeans and its effects on their community", "A biography of Ferdinand Magellan written in the 20th century"],
                correctIndex: 2
            ),
            MathExamQuestion(id: "his_5_h1", topicId: 5, prompt: "The Columbian Exchange refers to the transfer of plants, animals, diseases, and ideas between the Americas and the Old World after 1492. Which consequence had the MOST devastating impact on indigenous American populations?", options: ["The introduction of horses to the Americas", "The introduction of European diseases (especially smallpox) to which indigenous peoples had no immunity, causing catastrophic population collapse", "The export of American gold to Europe", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_5_h2", topicId: 5, prompt: "Portugal dominated early ocean exploration in the 15th century. A historian would cite which STRUCTURAL REASON for Portugal's early lead?", options: ["Portugal had the largest population in Europe", "Portugal's geographic position on the Atlantic coast, royal investment in navigation technology, and the establishment of the School of Navigation at Sagres created systematic expertise", "Portugal had a larger navy than all other European nations combined", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_5_h3", topicId: 5, prompt: "Historians debate whether the Age of Exploration should be called the 'Age of Conquest'. Which argument BEST supports using 'conquest' rather than 'exploration'?", options: ["All explorers were peaceful traders who never used violence", "European expeditions frequently led to the violent subjugation of indigenous peoples, destruction of civilisations, and forced labour — the experience for those already living in these lands was conquest, not discovery", "The word 'conquest' only applies to military battles between European powers", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_5_h4", topicId: 5, prompt: "Magellan's circumnavigation (1519–1522) was completed by only 18 survivors of the original 270 crew. What does this casualty rate MOST POWERFULLY illustrate about the Age of Exploration?", options: ["Magellan was a careless leader who deserved to fail", "The extraordinary physical danger, disease, starvation, and violence inherent in long-distance ocean voyages of that era", "The voyages were poorly planned and could easily have been made safer", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_5_h5", topicId: 5, prompt: "China's Ming dynasty sent Zheng He's massive treasure fleets across Asia and East Africa between 1405 and 1433, then abruptly halted all oceanic voyages. A historian studying this decision would MOST likely examine which type of source?", options: ["Archaeological sites in East Africa where Zheng He landed", "Imperial court records, edicts, and political debates within the Ming dynasty about the cost and purpose of the voyages", "Maps drawn by European explorers of the same era", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 6  -  Ancient Egypt (Exam)
        6: [
            MathExamQuestion(
                id: "his_6_e1",
                topicId: 6,
                prompt: "The Rosetta Stone helped historians decode which ancient writing system?",
                options: ["Cuneiform", "Hieroglyphics", "Sanskrit", "Linear B"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e2",
                topicId: 6,
                prompt: "The Great Pyramid of Giza was built around which date?",
                options: ["100 AD", "500 BC", "2560 BC", "5000 BC"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_e3",
                topicId: 6,
                prompt: "Which Ancient Egyptian god was associated with the Sun?",
                options: ["Osiris", "Ra (Re)", "Anubis", "Thoth"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e4",
                topicId: 6,
                prompt: "What was the ancient Egyptian writing material made from river plants called?",
                options: ["Parchment", "Papyrus", "Vellum", "Clay tablets"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e5",
                topicId: 6,
                prompt: "Tutankhamun's tomb was discovered in the Valley of the Kings in which year?",
                options: ["1895", "1912", "1922", "1935"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_e6",
                topicId: 6,
                prompt: "Which organ was kept inside a canopic jar during mummification?",
                options: ["Heart", "Brain", "Liver", "Lungs only"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_e7",
                topicId: 6,
                prompt: "Which famous half-lion, half-human statue guards the Giza plateau?",
                options: ["The Colossus of Rhodes", "The Great Sphinx", "The Statue of Ramesses", "The Osiris statue"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e8",
                topicId: 6,
                prompt: "Cleopatra was the last ruler of Egypt before it was conquered by…",
                options: ["Greece", "Persia", "Rome", "Assyria"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_e9",
                topicId: 6,
                prompt: "The annual flooding of the Nile was important because…",
                options: ["It destroyed enemy armies", "It deposited rich silt that made farmland fertile", "It provided drinking water only", "It created natural borders"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e10",
                topicId: 6,
                prompt: "Ancient Egypt was divided into two regions: Upper Egypt and Lower Egypt. 'Lower Egypt' referred to the region…",
                options: ["At the southern end of the Nile", "In the desert", "In the north near the Nile Delta", "Underground"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_6_e11",
                topicId: 6,
                prompt: "The Nile floods, pyramid construction, and mummification all demonstrate that ancient Egyptian civilisation depended heavily on:",
                options: ["Constant warfare with neighbouring states", "Centralised organisation, specialised labour, and advanced knowledge of engineering and nature", "Democratic decision-making by all citizens", "Trade with Greece and Rome as the primary source of wealth"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e12",
                topicId: 6,
                prompt: "Egyptologists debate why the Old Kingdom (the pyramid-building age) collapsed around 2150 BC. Which factor do MOST historians consider a CONTRIBUTING CAUSE?",
                options: ["Invasion by the Roman Empire", "A prolonged drought reducing the Nile flood and causing famine, combined with political decentralisation", "The construction of the pyramids bankrupted the state", "A sudden volcanic eruption destroyed the Nile Delta"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e13",
                topicId: 6,
                prompt: "The Rosetta Stone was written in three scripts: hieroglyphics, Demotic, and Greek. Why was the GREEK text the KEY to deciphering hieroglyphics?",
                options: ["Greek was easier to carve on stone than the other scripts", "Greek was already understood by scholars, allowing them to cross-reference and decode the unknown hieroglyphic script", "Greek was the most widely spoken language in ancient Egypt", "The Greek text was the oldest of the three versions on the stone"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e14",
                topicId: 6,
                prompt: "Comparing ancient Egypt with ancient Mesopotamia, both civilisations developed along major rivers. What was the MAIN DIFFERENCE in how each civilisation related to its river?",
                options: ["Mesopotamia had no rivers of significance", "The Nile flooded predictably every year, allowing reliable agriculture, while Mesopotamian rivers (Tigris and Euphrates) flooded unpredictably, requiring more complex irrigation management", "Egypt never used irrigation because the Nile did all the work automatically", "Mesopotamians worshipped their rivers as gods while Egyptians did not"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_6_e15",
                topicId: 6,
                prompt: "A historian evaluating Howard Carter's 1922 discovery of Tutankhamun's tomb might note that early accounts were influenced by the media sensation of the time. This is an example of which historical skill?",
                options: ["Chronological sequencing of events", "Source analysis — recognising that accounts of historical events can be shaped by the context and biases of their time", "Using artefacts to confirm written records", "Identifying cause and effect in ancient history"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_6_h1", topicId: 6, prompt: "Egyptologists have identified over 130 ancient Egyptian pyramids. The fact that pyramid construction evolved from mastabas to step pyramids to true pyramids over centuries suggests:", options: ["Ancient Egyptians randomly experimented with architecture", "Pyramid design reflects cumulative technological and architectural learning across generations — each pharaoh built on knowledge developed by predecessors", "Each pyramid was designed independently with no reference to previous ones", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_6_h2", topicId: 6, prompt: "Ancient Egypt's economy was NOT based on currency. Goods and services were exchanged through a system called:", options: ["Feudalism", "Mercantilism", "Barter and redistribution managed by the state through granaries and scribal records", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "his_6_h3", topicId: 6, prompt: "Pharaoh Akhenaten (c. 1353–1336 BC) controversially replaced Egypt's polytheistic religion with worship of a single sun deity (Aten). His successor Tutankhamun reversed this. What does this episode MOST POWERFULLY demonstrate about ancient Egyptian society?", options: ["Ancient Egyptians had no strong religious beliefs", "Religion and political power were deeply intertwined — a pharaoh could reshape state religion, but entrenched priestly interests and tradition could reverse such changes after his death", "Ancient Egypt was always monotheistic", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_6_h4", topicId: 6, prompt: "Ancient Egypt lasted over 3,000 years — far longer than most empires in history. A historian would cite which COMBINATION of factors as explaining this extraordinary longevity?", options: ["Constant military conquest of all neighbours prevented any external threat", "Geographic isolation (deserts to east and west, sea to north, cataracts to south), agricultural abundance from the Nile, and a centralised state created conditions for remarkable stability", "Egypt never experienced any internal conflicts or political crises in 3,000 years", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_6_h5", topicId: 6, prompt: "Some Egyptologists argue that the labour force that built the Great Pyramid was composed of paid skilled workers, not slaves. Which type of evidence has MOST supported this revisionist view?", options: ["Written confessions from workers describing slavery", "Archaeological discoveries of workers' villages with medical care, organised food supplies, and tombs with respectful burials — indicating a valued, organised workforce", "Greek historical accounts confirming the workers were slaves", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 7  -  Ancient Greece (Exam)
        7: [
            MathExamQuestion(
                id: "his_7_e1",
                topicId: 7,
                prompt: "In ancient Athenian democracy, who was allowed to vote?",
                options: ["All citizens including women and slaves", "Only male citizens (not women or slaves)", "Only wealthy landowners", "All residents of Athens"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_7_e2",
                topicId: 7,
                prompt: "In which year were the first ancient Olympic Games traditionally said to have been held?",
                options: ["1200 BC", "776 BC", "500 BC", "100 BC"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_7_e3",
                topicId: 7,
                prompt: "Spartan boys were taken from their families at age 7 and trained as…",
                options: ["Priests", "Farmers", "Soldiers", "Philosophers"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e4",
                topicId: 7,
                prompt: "Alexander the Great was a student of which philosopher?",
                options: ["Socrates", "Plato", "Aristotle", "Pythagoras"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e5",
                topicId: 7,
                prompt: "The Parthenon in Athens was a temple dedicated to which goddess?",
                options: ["Hera", "Aphrodite", "Artemis", "Athena"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_7_e6",
                topicId: 7,
                prompt: "The Persian Wars were fought between Ancient Greece and which empire?",
                options: ["Roman Empire", "Egyptian Empire", "Persian Empire", "Macedonian Empire"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e7",
                topicId: 7,
                prompt: "Which battle saw 300 Spartans famously hold off a massive Persian army?",
                options: ["Battle of Marathon", "Battle of Salamis", "Battle of Thermopylae", "Battle of Plataea"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e8",
                topicId: 7,
                prompt: "What was the Acropolis in Athens?",
                options: ["A marketplace", "A harbour", "A fortified hilltop with temples", "A military barracks"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e9",
                topicId: 7,
                prompt: "Which Greek thinker is known as the father of western philosophy?",
                options: ["Plato", "Aristotle", "Socrates", "Pythagoras"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_7_e10",
                topicId: 7,
                prompt: "Ancient Greek theatre had two main genres: tragedy and…",
                options: ["Opera", "Comedy", "Musical", "Dance"],
                correctIndex: 1
            ),
            MathExamQuestion(id: "his_7_h1", topicId: 7, prompt: "Athens and Sparta are often contrasted as opposites. A historian would note, however, that both city-states shared one crucial SIMILARITY that often goes unacknowledged. What was it?", options: ["Both had democratic governments", "Both relied on enslaved populations (helots in Sparta, chattel slaves in Athens) to sustain their economies and free citizens for civic or military life", "Both were dominated by women in political life", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_7_h2", topicId: 7, prompt: "Socrates was tried and executed by Athens for 'corrupting the youth' and 'impiety'. Historians see this as an example of which political phenomenon?", options: ["Democracy working perfectly to protect free speech", "The tension between intellectual freedom and the limits a democratic majority will tolerate — democratic societies can suppress dissent when majorities feel threatened", "Socrates having committed actual crimes against the Athenian state", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_7_h3", topicId: 7, prompt: "Alexander the Great's conquests spread Greek culture (Hellenism) across Persia, Egypt, and into India. A historian evaluating his legacy must balance which two perspectives?", options: ["He was either a military genius or a complete failure — there is no middle ground", "His conquests brought Greek art, philosophy, and architecture to vast new territories (cultural achievement), but also involved enormous bloodshed, forced displacement, and the destruction of existing cultures (conquest and oppression)", "He was universally celebrated by all the peoples he conquered", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_7_h4", topicId: 7, prompt: "Greek philosophers like Aristotle believed in using REASON and OBSERVATION to understand the world. How does this distinguish ancient Greek intellectual tradition from earlier Mesopotamian and Egyptian approaches?", options: ["Earlier cultures were completely irrational and had no knowledge of the world", "While earlier cultures explained natural phenomena primarily through myth and divine will, Greek thinkers increasingly sought natural, logical explanations — laying foundations for the scientific method", "Aristotle rejected all previous knowledge from other civilisations", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_7_h5", topicId: 7, prompt: "The ancient Olympic Games were held every four years and required all Greek city-states (even those at war) to observe a sacred truce. What does this institution reveal about ancient Greek culture?", options: ["All Greek city-states were politically unified under one government", "Despite political fragmentation, the Greeks shared a common cultural and religious identity that transcended individual city-state rivalries — sport served as a unifying cultural institution", "The Olympics were purely a military training exercise with no religious significance", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 8  -  Ancient Rome (Exam)
        8: [
            MathExamQuestion(
                id: "his_8_e1",
                topicId: 8,
                prompt: "The Roman Republic was founded in approximately which year?",
                options: ["753 BC", "509 BC", "264 BC", "44 BC"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e2",
                topicId: 8,
                prompt: "Julius Caesar was betrayed and stabbed by members of the Senate. What was this day called?",
                options: ["The Ides of April", "The Ides of March", "The Ides of January", "The Ides of October"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e3",
                topicId: 8,
                prompt: "Augustus Caesar was the first Roman Emperor. What was the period of Roman peace and prosperity under him called?",
                options: ["Pax Romana", "Pax Britannica", "Pax Mongolica", "Pax Americana"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_8_e4",
                topicId: 8,
                prompt: "The famous Punic Wars were fought between Rome and which city?",
                options: ["Athens", "Carthage", "Alexandria", "Sparta"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e5",
                topicId: 8,
                prompt: "Which Roman general was famous for crossing the Alps with war elephants?",
                options: ["Julius Caesar", "Mark Antony", "Hannibal Barca", "Scipio Africanus"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_8_e6",
                topicId: 8,
                prompt: "What was the Roman Senate?",
                options: ["The Roman army headquarters", "A governing council of senior citizens who advised rulers", "The main marketplace in Rome", "A prison for enemies of the state"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e7",
                topicId: 8,
                prompt: "What was the main Roman unit of the army called?",
                options: ["A brigade", "A battalion", "A legion", "A regiment"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_8_e8",
                topicId: 8,
                prompt: "Roman Emperor Constantine was important because he…",
                options: ["Conquered Britain", "Made Christianity the official religion of the Empire", "Built the Colosseum", "Defeated Hannibal"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e9",
                topicId: 8,
                prompt: "What major volcanic disaster destroyed the Roman city of Pompeii in 79 AD?",
                options: ["Mount Etna eruption", "Mount Vesuvius eruption", "Mount Olympus eruption", "An earthquake"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_8_e10",
                topicId: 8,
                prompt: "Which emperor ordered the building of Hadrian's Wall across northern Britain?",
                options: ["Augustus", "Nero", "Hadrian", "Trajan"],
                correctIndex: 2
            ),
            MathExamQuestion(id: "his_8_h1", topicId: 8, prompt: "Rome transitioned from a Republic to an Empire under Augustus Caesar. A historian studying this shift would note that the MAIN STRUCTURAL CAUSE was:", options: ["Augustus simply declared himself emperor and no one objected", "The Republic's institutions — designed for a city-state — could not manage the corruption, civil wars, and military demands of governing a vast empire, making one-man rule increasingly practical and acceptable", "The Roman Senate voted unanimously to abolish the Republic", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_8_h2", topicId: 8, prompt: "Rome's legal system — especially the concept of 'innocent until proven guilty' and codified law — influenced modern Western legal systems. A historian would call this type of long-term influence:", options: ["An anachronism", "A historical legacy or cultural transmission across civilisations", "A coincidence with no causal connection", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_8_h3", topicId: 8, prompt: "The Roman Empire's western half collapsed in 476 AD while the eastern half (Byzantine Empire) survived until 1453 AD. A historian comparing the two halves would identify which key difference as a factor in this?", options: ["The east was physically larger than the west", "The eastern half controlled wealthier, more urbanised provinces with better-established administrative and economic systems, while the west faced greater external pressures and internal fragmentation", "The west converted to Christianity while the east did not", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_8_h4", topicId: 8, prompt: "Roman roads were built straight because engineers used a device called a groma to maintain straight lines. Beyond military use, historians identify which ECONOMIC benefit of Rome's straight road network?", options: ["Straight roads prevented armies from getting lost", "A network of reliable, all-weather roads across the empire dramatically reduced trade costs and travel times, facilitating commerce and economic integration across vast territories", "Roads were designed to impress visitors with Roman engineering power", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "his_8_h5", topicId: 8, prompt: "The eruption of Vesuvius in 79 AD preserved Pompeii under volcanic ash, making it one of the best-preserved Roman sites. Why do historians consider Pompeii especially valuable as a historical source?", options: ["Pompeii contains the most famous Roman temples", "Because it was frozen at a single moment in time, Pompeii preserves the full texture of everyday Roman life — housing, food, art, tools, and social structures — that formal historical texts rarely describe in detail", "Pompeii is the only Roman city that has ever been excavated", "I don't know / Wasn't taught"], correctIndex: 1),
        ],

        // MARK: Topic 9  -  The Vikings (Exam)
        9: [
            MathExamQuestion(
                id: "his_9_e1",
                topicId: 9,
                prompt: "The Viking raid on the monastery of Lindisfarne in 793 AD is often said to mark the start of the Viking Age. Where is Lindisfarne?",
                options: ["Scotland", "Ireland", "Northern England", "France"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_e2",
                topicId: 9,
                prompt: "What was the name of the great hall in Viking Norse mythology where fallen warriors went after death?",
                options: ["Asgard", "Midgard", "Valhalla", "Helheim"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_e3",
                topicId: 9,
                prompt: "The Viking settlement in northern France is now known as…",
                options: ["Brittany", "Normandy", "Alsace", "Burgundy"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_e4",
                topicId: 9,
                prompt: "Which Viking explorer is credited with discovering and settling Iceland?",
                options: ["Erik the Red", "Leif Erikson", "Ingólfr Arnarson", "Harald Fairhair"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_e5",
                topicId: 9,
                prompt: "What was a Jarl in Viking society?",
                options: ["A type of Viking ship", "A free warrior or peasant", "A powerful chieftain or earl", "A Viking craftsman"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_9_e6",
                topicId: 9,
                prompt: "Thursday is named after which Viking god?",
                options: ["Odin", "Loki", "Freya", "Thor"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_9_e7",
                topicId: 9,
                prompt: "The Viking king who conquered England in 1013 was…",
                options: ["Harald Hardrada", "Sweyn Forkbeard", "Cnut the Great", "Eric Bloodaxe"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_e8",
                topicId: 9,
                prompt: "Viking longships were special because they could…",
                options: ["Carry thousands of soldiers", "Travel on both open seas and shallow rivers", "Move without wind or oars", "Stay at sea for years without resupply"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_e9",
                topicId: 9,
                prompt: "What were Viking storytelling poems and sagas about?",
                options: ["Farming techniques", "Gods, heroes, battles, and epic voyages", "Trade and commerce", "Scientific discoveries"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_9_e10",
                topicId: 9,
                prompt: "The Norman conquest of England in 1066 was led by a descendant of Vikings called…",
                options: ["Harald Hardrada", "King Harold", "William the Conqueror", "Sweyn Forkbeard"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 10  -  Native Americans (Exam)
        10: [
            MathExamQuestion(
                id: "his_10_e1",
                topicId: 10,
                prompt: "The Cherokee syllabary (writing system) was created by which individual?",
                options: ["Sitting Bull", "Geronimo", "Sequoyah", "Cochise"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_e2",
                topicId: 10,
                prompt: "The Battle of Little Bighorn (1876) was a famous victory for the Sioux against which general's forces?",
                options: ["General Sherman", "General Grant", "General Custer", "General Lee"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_e3",
                topicId: 10,
                prompt: "The forced relocation of the Cherokee Nation in the 1830s is known as…",
                options: ["The Long Walk", "The Trail of Tears", "The Great Migration", "The Removal Act"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_e4",
                topicId: 10,
                prompt: "The Navajo Code Talkers transmitted secret messages in which war?",
                options: ["World War I", "World War II", "The Korean War", "The Vietnam War"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_e5",
                topicId: 10,
                prompt: "The Iroquois Confederacy is believed by some historians to have influenced the writing of the United States…",
                options: ["Declaration of Independence", "Bill of Rights", "Constitution", "All of the above have been claimed"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_10_e6",
                topicId: 10,
                prompt: "The Apache leader who famously resisted US government forces was called…",
                options: ["Sitting Bull", "Crazy Horse", "Geronimo", "Cochise"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_e7",
                topicId: 10,
                prompt: "What was the primary building material used by the Pueblo people of the south-west?",
                options: ["Wood", "Animal hides", "Adobe (mud brick)", "Stone and ice"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_e8",
                topicId: 10,
                prompt: "What were the large communal homes used by the Iroquois nations called?",
                options: ["Tepees", "Wigwams", "Longhouses", "Adobe houses"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_10_e9",
                topicId: 10,
                prompt: "Which disease brought by Europeans killed the largest number of Native Americans?",
                options: ["Malaria", "Smallpox", "Cholera", "Typhoid"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_10_e10",
                topicId: 10,
                prompt: "The Dawes Act of 1887 affected Native Americans by…",
                options: ["Giving them full citizenship immediately", "Breaking up tribal lands into individual allotments, reducing communal territory", "Protecting their reservations from settlers", "Allowing them to vote in elections"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 11  -  The Middle Ages (Exam)
        11: [
            MathExamQuestion(
                id: "his_11_e1",
                topicId: 11,
                prompt: "The Magna Carta was signed in which year by King John of England?",
                options: ["1066", "1215", "1348", "1415"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_e2",
                topicId: 11,
                prompt: "The Black Death was caused by which bacterium, spread by rat fleas?",
                options: ["Salmonella", "Cholera", "Yersinia pestis", "Staphylococcus"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_e3",
                topicId: 11,
                prompt: "The Battle of Hastings in 1066 resulted in which change?",
                options: ["The end of the feudal system", "The Norman conquest of England", "England joining France", "The start of the Crusades"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_e4",
                topicId: 11,
                prompt: "The First Crusade was launched by Pope Urban II in which year?",
                options: ["1054", "1095", "1147", "1189"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_e5",
                topicId: 11,
                prompt: "What was a serf in medieval society?",
                options: ["A free merchant who traded goods", "A peasant who was bound to the lord's land and could not leave freely", "A type of knight", "A senior church official"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_e6",
                topicId: 11,
                prompt: "The Hundred Years' War (1337–1453) was fought mainly between England and…",
                options: ["Spain", "Germany", "France", "Italy"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_e7",
                topicId: 11,
                prompt: "Joan of Arc was a French heroine of the Hundred Years' War. She claimed to be guided by…",
                options: ["The king of France", "Her father's advice", "Visions from saints and God", "Ancient Roman texts"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_e8",
                topicId: 11,
                prompt: "What was the name of the code of conduct that guided a knight's behaviour?",
                options: ["The feudal code", "Chivalry", "The Magna Carta", "Canon law"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_11_e9",
                topicId: 11,
                prompt: "Which organisation controlled learning and literacy in medieval Europe, preserving ancient texts?",
                options: ["The guilds", "The Roman Senate", "The Catholic Church and its monasteries", "The feudal lords"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_11_e10",
                topicId: 11,
                prompt: "What were craft workers (blacksmiths, bakers, weavers) organised into in medieval towns?",
                options: ["Feudal estates", "Trade guilds", "Crusading orders", "Monastic orders"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 12  -  The Age of Exploration (Exam)
        12: [
            MathExamQuestion(
                id: "his_12_e1",
                topicId: 12,
                prompt: "The Treaty of Tordesillas (1494) divided newly discovered lands between which two nations?",
                options: ["England and France", "Spain and Portugal", "Spain and the Netherlands", "Portugal and France"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_e2",
                topicId: 12,
                prompt: "The transatlantic slave trade forcibly transported enslaved Africans mainly to where?",
                options: ["Europe", "Asia", "The Americas", "Australia"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_e3",
                topicId: 12,
                prompt: "Hernán Cortés conquered the Aztec Empire, whose capital was called…",
                options: ["Cuzco", "Tenochtitlan", "Machu Picchu", "Chichén Itzá"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_e4",
                topicId: 12,
                prompt: "Francisco Pizarro conquered the Inca Empire. The Inca Empire was in modern-day…",
                options: ["Mexico", "Brazil", "Peru and surrounding Andean countries", "Argentina"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_e5",
                topicId: 12,
                prompt: "The encomienda system in Spanish colonies allowed conquistadors to…",
                options: ["Trade freely with indigenous people", "Use indigenous people as forced labour", "Share land equally with settlers", "Build schools for indigenous children"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_e6",
                topicId: 12,
                prompt: "John Cabot explored the coast of which region for England in 1497?",
                options: ["South America", "India", "North America (Newfoundland)", "West Africa"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_e7",
                topicId: 12,
                prompt: "The Columbian Exchange refers to…",
                options: ["A banking system Columbus set up", "The trade of goods, people, animals, and diseases between the Old and New Worlds after 1492", "A treaty between Spain and Portugal", "Columbus's financial backers in Spain"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_12_e8",
                topicId: 12,
                prompt: "What crop, originally from the Americas, became a staple food in Europe and Ireland after the Age of Exploration?",
                options: ["Rice", "Wheat", "The potato", "Barley"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_e9",
                topicId: 12,
                prompt: "Which Portuguese explorer was the first European to round the southern tip of Africa (Cape of Good Hope)?",
                options: ["Vasco da Gama", "Pedro Cabral", "Bartolomeu Dias", "Ferdinand Magellan"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_12_e10",
                topicId: 12,
                prompt: "The Dutch East India Company (VOC) was founded in 1602 to control trade with…",
                options: ["The Americas", "West Africa", "Asia", "The Middle East"],
                correctIndex: 2
            ),
        ],

        // MARK: Topic 13  -  The Renaissance (Exam)
        13: [
            MathExamQuestion(
                id: "his_13_e1",
                topicId: 13,
                prompt: "The Medici family in Florence were important Renaissance patrons. What is a 'patron' in this context?",
                options: ["A type of painter", "A person who financially supports artists and thinkers", "A religious leader", "A military commander"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_e2",
                topicId: 13,
                prompt: "Which Renaissance scientist proposed that the Earth orbits the Sun (heliocentric theory)?",
                options: ["Leonardo da Vinci", "Galileo Galilei", "Nicolaus Copernicus", "Isaac Newton"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_e3",
                topicId: 13,
                prompt: "The Protestant Reformation, begun by Martin Luther in 1517, challenged the authority of…",
                options: ["The Holy Roman Emperor", "The Catholic Church", "Renaissance artists", "The city of Florence"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_e4",
                topicId: 13,
                prompt: "Raphael was a Renaissance painter best known for his paintings of the Virgin Mary and which famous Vatican fresco?",
                options: ["The Last Judgement", "The Sistine Chapel ceiling", "The School of Athens", "The Birth of Venus"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_e5",
                topicId: 13,
                prompt: "Niccolò Machiavelli wrote 'The Prince', which was a guide to…",
                options: ["Renaissance art", "Political power and how rulers should govern", "Astronomy and science", "Religious worship"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_e6",
                topicId: 13,
                prompt: "Which Renaissance artist sculpted the famous statue of David in Florence?",
                options: ["Leonardo da Vinci", "Raphael", "Donatello", "Michelangelo"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_13_e7",
                topicId: 13,
                prompt: "Gutenberg's printing press (c. 1440) helped the Renaissance spread by making…",
                options: ["Art more colourful", "Books widely available and affordable for the first time", "Trade routes safer", "Religion less powerful immediately"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_e8",
                topicId: 13,
                prompt: "The Northern Renaissance saw Renaissance ideas spread to countries north of Italy including…",
                options: ["Japan and China", "England, Germany and the Netherlands", "Egypt and Persia", "Spain and Portugal only"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_13_e9",
                topicId: 13,
                prompt: "Erasmus of Rotterdam was a leading Northern Renaissance scholar known for…",
                options: ["Painting the Mona Lisa", "Building St Peter's Basilica", "Humanist scholarship and criticism of Church corruption", "Discovering the New World"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_13_e10",
                topicId: 13,
                prompt: "What artistic technique, perfected during the Renaissance, creates the illusion of depth on a flat surface?",
                options: ["Fresco", "Linear perspective", "Chiaroscuro", "Tempera painting"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 14  -  The American Revolution (Exam)
        14: [
            MathExamQuestion(
                id: "his_14_e1",
                topicId: 14,
                prompt: "The Boston Massacre of 1770 occurred when British soldiers fired on colonists, killing how many people?",
                options: ["Two", "Five", "Ten", "Twenty"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_e2",
                topicId: 14,
                prompt: "Which pamphlet by Thomas Paine (1776) argued powerfully for American independence?",
                options: ["The Federalist Papers", "Common Sense", "Rights of Man", "Poor Richard's Almanac"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_e3",
                topicId: 14,
                prompt: "George Washington's famous crossing of the Delaware River on Christmas night 1776 led to a surprise victory at…",
                options: ["Bunker Hill", "Yorktown", "Trenton", "Saratoga"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_e4",
                topicId: 14,
                prompt: "Which battle in 1777 is considered the turning point of the Revolutionary War, convincing France to support America?",
                options: ["Battle of Bunker Hill", "Battle of Trenton", "Battle of Saratoga", "Battle of Yorktown"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_e5",
                topicId: 14,
                prompt: "The final major British defeat of the Revolutionary War was at which battle in 1781?",
                options: ["Saratoga", "Trenton", "Lexington", "Yorktown"],
                correctIndex: 3
            ),
            MathExamQuestion(
                id: "his_14_e6",
                topicId: 14,
                prompt: "What was the name of the British tax on paper products that enraged the colonists in 1765?",
                options: ["The Tea Act", "The Townsend Acts", "The Stamp Act", "The Quartering Act"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_e7",
                topicId: 14,
                prompt: "The first shots of the American Revolution were fired at Lexington and Concord in which year?",
                options: ["1770", "1773", "1775", "1776"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_e8",
                topicId: 14,
                prompt: "Which country allied with the Americans and provided crucial military support against the British?",
                options: ["Spain", "France", "The Netherlands", "Prussia"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_14_e9",
                topicId: 14,
                prompt: "The United States Constitution was adopted in which year?",
                options: ["1776", "1783", "1787", "1791"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_14_e10",
                topicId: 14,
                prompt: "Who was the British King during the American Revolution?",
                options: ["King George II", "King George III", "King William III", "King James II"],
                correctIndex: 1
            ),
        ],

        // MARK: Topic 15  -  The French Revolution (Exam)
        15: [
            MathExamQuestion(
                id: "his_15_e1",
                topicId: 15,
                prompt: "The Three Estates of French society before the Revolution ranked in which order?",
                options: ["Clergy, Nobility, Commoners", "Nobility, Clergy, Commoners", "Commoners, Clergy, Nobility", "King, Nobles, Clergy"],
                correctIndex: 0
            ),
            MathExamQuestion(
                id: "his_15_e2",
                topicId: 15,
                prompt: "King Louis XVI and his wife Marie Antoinette were executed by guillotine in which year?",
                options: ["1789", "1791", "1793", "1799"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_e3",
                topicId: 15,
                prompt: "The radical phase of the Revolution known for mass executions was called the…",
                options: ["Directory", "Reign of Terror", "National Assembly", "Thermidorian Reaction"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_e4",
                topicId: 15,
                prompt: "Who led the Reign of Terror before being executed himself in 1794?",
                options: ["Napoleon Bonaparte", "Jean-Paul Marat", "Maximilien Robespierre", "Georges Danton"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_e5",
                topicId: 15,
                prompt: "Napoleon Bonaparte crowned himself Emperor of France in which year?",
                options: ["1799", "1802", "1804", "1812"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_e6",
                topicId: 15,
                prompt: "The Enlightenment philosopher whose ideas most influenced the French Revolution was…",
                options: ["John Locke", "Jean-Jacques Rousseau", "Voltaire", "Montesquieu"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_e7",
                topicId: 15,
                prompt: "France's national motto 'Liberté, Égalité, Fraternité' dates from the Revolution. What does 'Fraternité' mean?",
                options: ["Freedom", "Equality", "Brotherhood", "Justice"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_e8",
                topicId: 15,
                prompt: "The National Assembly replaced the Estates-General and represented which change?",
                options: ["The church gaining more power", "The commoners claiming the right to govern France", "The nobles taking control from the king", "A return to absolute monarchy"],
                correctIndex: 1
            ),
            MathExamQuestion(
                id: "his_15_e9",
                topicId: 15,
                prompt: "Napoleon's final defeat came at which battle in 1815?",
                options: ["Battle of Trafalgar", "Battle of Austerlitz", "Battle of Waterloo", "Battle of Leipzig"],
                correctIndex: 2
            ),
            MathExamQuestion(
                id: "his_15_e10",
                topicId: 15,
                prompt: "The French Revolution's ideas of liberty and equality spread across Europe and inspired revolutions in other countries. This period is sometimes called the…",
                options: ["Age of Reason", "Age of Revolution", "Age of Exploration", "Age of Enlightenment"],
                correctIndex: 1
            ),
        ],
        // Topic 16: Industrial Revolution
        16: [
            MathExamQuestion(id: "his_16_e1", topicId: 16, prompt: "The Industrial Revolution primarily began in which decade?", options: ["1720s", "1760s", "1800s", "1840s"], correctIndex: 1),
            MathExamQuestion(id: "his_16_e2", topicId: 16, prompt: "James Watt's most significant contribution to the Industrial Revolution was...", options: ["Inventing the locomotive", "Improving the steam engine to make it more efficient", "Developing the cotton gin", "Building the first iron bridge"], correctIndex: 1),
            MathExamQuestion(id: "his_16_e3", topicId: 16, prompt: "Which invention by Richard Arkwright helped mechanise the textile industry?", options: ["The spinning jenny", "The steam hammer", "The water frame (spinning frame)", "The power loom only"], correctIndex: 2),
            MathExamQuestion(id: "his_16_e4", topicId: 16, prompt: "Factory Acts passed in Britain during the Industrial Revolution were intended to...", options: ["Increase factory output", "Protect workers, especially children, from dangerous conditions", "Give factory owners more power", "Prevent workers from forming unions"], correctIndex: 1),
            MathExamQuestion(id: "his_16_e5", topicId: 16, prompt: "The first passenger steam railway opened in 1825 and was engineered by...", options: ["James Watt", "Isambard Kingdom Brunel", "George Stephenson", "Robert Trevithick"], correctIndex: 2),
            MathExamQuestion(id: "his_16_e6", topicId: 16, prompt: "The rapid growth of cities during the Industrial Revolution was known as...", options: ["Colonisation", "Urbanisation", "Industrialisation only", "Gentrification"], correctIndex: 1),
            MathExamQuestion(id: "his_16_e7", topicId: 16, prompt: "Which raw material was essential for powering steam engines in factories and on railways?", options: ["Iron ore", "Cotton", "Coal", "Limestone"], correctIndex: 2),
            MathExamQuestion(id: "his_16_e8", topicId: 16, prompt: "Before factories, most cloth in Britain was made using the...", options: ["Factory system in large buildings", "Cottage industry system in people's homes", "Government-run weaving centres", "Steam-powered looms in mills only"], correctIndex: 1),
            MathExamQuestion(id: "his_16_e9", topicId: 16, prompt: "The Industrial Revolution spread from Britain to which region next?", options: ["Africa", "Asia", "Western Europe and North America", "South America"], correctIndex: 2),
            MathExamQuestion(id: "his_16_e10", topicId: 16, prompt: "A major social problem created by rapid industrialisation was...", options: ["Too many people staying in the countryside", "Overcrowded, unsanitary urban slums with poor living conditions", "A decline in trade between nations", "People working fewer hours than before"], correctIndex: 1),
        ],

        // Topic 17: Age of Empires
        17: [
            MathExamQuestion(id: "his_17_e1", topicId: 17, prompt: "At its height, the British Empire covered approximately what fraction of the Earth's land surface?", options: ["One tenth", "One quarter", "One half", "Three quarters"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e2", topicId: 17, prompt: "The Berlin Conference of 1884–85 is associated with...", options: ["The end of World War I", "European powers dividing Africa between themselves", "The founding of the United Nations", "The abolition of slavery"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e3", topicId: 17, prompt: "Which empire controlled Indonesia (the Dutch East Indies) for several centuries?", options: ["British Empire", "French Empire", "Dutch Empire", "Portuguese Empire"], correctIndex: 2),
            MathExamQuestion(id: "his_17_e4", topicId: 17, prompt: "The phrase 'the sun never sets on the British Empire' means...", options: ["Britain was always sunny", "The British Empire was so large it spanned all time zones", "British people disliked the night", "The British Empire never experienced economic downturns"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e5", topicId: 17, prompt: "Which Belgian king's brutal rule over the Congo Free State is considered one of history's most exploitative colonial regimes?", options: ["King Albert I", "King Leopold II", "King Baudouin", "King Leopold I"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e6", topicId: 17, prompt: "French Indochina included parts of which modern-day countries?", options: ["Nigeria, Ghana, and Senegal", "Vietnam, Cambodia, and Laos", "India, Pakistan, and Bangladesh", "Morocco, Algeria, and Tunisia"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e7", topicId: 17, prompt: "The East India Company was a trading company that eventually helped Britain control...", options: ["West Africa", "Australia", "India", "Canada"], correctIndex: 2),
            MathExamQuestion(id: "his_17_e8", topicId: 17, prompt: "Which country was colonised by Spain and Portugal and remained their colonies for the longest time in the Americas?", options: ["North America", "Central and South America", "The Caribbean only", "Africa"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e9", topicId: 17, prompt: "A key argument used by colonisers to justify their empires was...", options: ["That they were stealing resources for personal gain", "That they were 'civilising' and 'modernising' colonised peoples", "That colonised peoples had asked them to come", "That their religions required them to colonise"], correctIndex: 1),
            MathExamQuestion(id: "his_17_e10", topicId: 17, prompt: "The Sepoy Mutiny (1857) was a major uprising against British rule in...", options: ["South Africa", "Australia", "India", "Canada"], correctIndex: 2),
        ],

        // Topic 18: Slavery & Abolition
        18: [
            MathExamQuestion(id: "his_18_e1", topicId: 18, prompt: "The triangular trade route involved ships moving between...", options: ["Europe, Africa, and the Americas", "Asia, Africa, and Europe", "North America, South America, and Europe", "Britain, India, and China"], correctIndex: 0),
            MathExamQuestion(id: "his_18_e2", topicId: 18, prompt: "Britain passed the Slavery Abolition Act in which year, ending slavery in most of the British Empire?", options: ["1807", "1833", "1865", "1888"], correctIndex: 1),
            MathExamQuestion(id: "his_18_e3", topicId: 18, prompt: "The Middle Passage referred to...", options: ["A route through the Caribbean islands", "The sea voyage carrying enslaved Africans across the Atlantic to the Americas", "A land route through West Africa", "The journey of goods from America back to Europe"], correctIndex: 1),
            MathExamQuestion(id: "his_18_e4", topicId: 18, prompt: "Frederick Douglass was significant because he...", options: ["Led the Union Army in the Civil War", "Passed the 13th Amendment", "Escaped slavery and became a leading abolitionist writer and speaker", "Founded the NAACP"], correctIndex: 2),
            MathExamQuestion(id: "his_18_e5", topicId: 18, prompt: "William Wilberforce's campaign finally led to Britain banning the slave trade in...", options: ["1776", "1807", "1833", "1865"], correctIndex: 1),
            MathExamQuestion(id: "his_18_e6", topicId: 18, prompt: "The Haitian Revolution (1791–1804) was significant because Haiti became...", options: ["A French colony that welcomed slavery", "The first nation founded by formerly enslaved people after a successful revolt", "A Spanish territory", "A British protectorate"], correctIndex: 1),
            MathExamQuestion(id: "his_18_e7", topicId: 18, prompt: "Harriet Tubman made approximately how many missions to free enslaved people via the Underground Railroad?", options: ["About 2", "About 5", "About 13", "About 30"], correctIndex: 2),
            MathExamQuestion(id: "his_18_e8", topicId: 18, prompt: "Brazil was the last country in the Americas to abolish slavery, doing so in...", options: ["1833", "1865", "1875", "1888"], correctIndex: 3),
            MathExamQuestion(id: "his_18_e9", topicId: 18, prompt: "Enslaved people on plantations primarily grew which crops in the American South?", options: ["Wheat and corn", "Cotton, tobacco, and sugar", "Rice and spices", "Coffee and cocoa"], correctIndex: 1),
            MathExamQuestion(id: "his_18_e10", topicId: 18, prompt: "The Dred Scott decision (1857) in the USA was controversial because the Supreme Court ruled that...", options: ["Slavery should be abolished immediately", "All enslaved people deserved citizenship", "Enslaved people were property and had no legal rights as citizens", "States could not decide their own slavery laws"], correctIndex: 2),
        ],

        // Topic 19: The American Civil War
        19: [
            MathExamQuestion(id: "his_19_e1", topicId: 19, prompt: "The first shots of the American Civil War were fired at...", options: ["Gettysburg", "Bull Run", "Fort Sumter", "Antietam"], correctIndex: 2),
            MathExamQuestion(id: "his_19_e2", topicId: 19, prompt: "The Confederacy was led by President...", options: ["Ulysses S. Grant", "Robert E. Lee", "Jefferson Davis", "Stonewall Jackson"], correctIndex: 2),
            MathExamQuestion(id: "his_19_e3", topicId: 19, prompt: "Which battle in 1863 is considered the turning point of the Civil War in favour of the Union?", options: ["Battle of Antietam", "Battle of Gettysburg", "Battle of Bull Run", "Battle of Vicksburg"], correctIndex: 1),
            MathExamQuestion(id: "his_19_e4", topicId: 19, prompt: "The Emancipation Proclamation applied to enslaved people in...", options: ["All states in the USA", "Only the Union states", "The Confederate states in rebellion", "Only Washington D.C."], correctIndex: 2),
            MathExamQuestion(id: "his_19_e5", topicId: 19, prompt: "General Ulysses S. Grant commanded...", options: ["The Confederate Army of Northern Virginia", "The Union armies in the Western Theatre and later all Union forces", "The Confederate forces at Gettysburg", "The British observers during the war"], correctIndex: 1),
            MathExamQuestion(id: "his_19_e6", topicId: 19, prompt: "The Gettysburg Address began with the famous words...", options: ["'We hold these truths to be self-evident'", "'Four score and seven years ago'", "'Ask not what your country can do for you'", "'I have a dream'"], correctIndex: 1),
            MathExamQuestion(id: "his_19_e7", topicId: 19, prompt: "The 54th Massachusetts Infantry was notable for being...", options: ["The first unit to fight at Gettysburg", "One of the first African American regiments in the Union Army", "Lincoln's personal bodyguard unit", "The regiment that captured Jefferson Davis"], correctIndex: 1),
            MathExamQuestion(id: "his_19_e8", topicId: 19, prompt: "The Confederate Army surrendered at Appomattox Court House in...", options: ["January 1865", "April 1865", "June 1865", "December 1865"], correctIndex: 1),
            MathExamQuestion(id: "his_19_e9", topicId: 19, prompt: "Lincoln was assassinated at Ford's Theatre by...", options: ["John Wilkes Booth", "Jefferson Davis", "Robert E. Lee", "Charles Guiteau"], correctIndex: 0),
            MathExamQuestion(id: "his_19_e10", topicId: 19, prompt: "The period of Reconstruction after the Civil War aimed to...", options: ["Punish all Southern citizens equally", "Rebuild the South and integrate formerly enslaved people into society", "Return all land to Confederate soldiers", "Extend the war into Mexico"], correctIndex: 1),
        ],

        // Topic 20: World War I
        20: [
            MathExamQuestion(id: "his_20_e1", topicId: 20, prompt: "Franz Ferdinand was the heir to which empire's throne when he was assassinated?", options: ["German Empire", "Ottoman Empire", "Austro-Hungarian Empire", "Russian Empire"], correctIndex: 2),
            MathExamQuestion(id: "his_20_e2", topicId: 20, prompt: "The alliance system that pulled nations into WWI meant that when one country declared war...", options: ["All countries could choose freely whether to join", "Its allies were obligated to support it, spreading the conflict", "The League of Nations would stop the war", "Only neighbouring countries were involved"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e3", topicId: 20, prompt: "The Battle of the Somme (1916) was notable for...", options: ["Being the first use of tanks in war", "Over 1 million casualties on both sides in one of history's bloodiest battles", "The first use of poison gas", "Germany's final defeat in the war"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e4", topicId: 20, prompt: "Which German military strategy, involving invading Belgium, helped bring Britain into the war?", options: ["The Schlieffen Plan", "Operation Sea Lion", "The Zimmermann Telegram plan", "The Blitzkrieg"], correctIndex: 0),
            MathExamQuestion(id: "his_20_e5", topicId: 20, prompt: "The Zimmermann Telegram (1917) was a secret German message proposing a military alliance with...", options: ["Austria-Hungary", "Mexico", "Japan", "The Ottoman Empire"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e6", topicId: 20, prompt: "The Treaty of Versailles assigned full blame for World War I to...", options: ["Austria-Hungary", "The Ottoman Empire", "Germany", "All Central Powers equally"], correctIndex: 2),
            MathExamQuestion(id: "his_20_e7", topicId: 20, prompt: "No Man's Land in World War I referred to...", options: ["Neutral countries like Switzerland", "The disputed territory between opposing trenches", "The area behind the front lines", "Enemy-occupied territories"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e8", topicId: 20, prompt: "The Ottoman Empire's defeat in WWI led to...", options: ["The creation of a stronger Ottoman state", "The dissolution of the Empire and the creation of modern Turkey and other states", "The expansion of Ottoman territory", "The Ottoman Empire joining the Allied Powers"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e9", topicId: 20, prompt: "Wilfred Owen and Siegfried Sassoon were notable as...", options: ["Military generals who won key battles", "Poets who wrote about the horrors of trench warfare", "Politicians who opposed the war", "Inventors of new military technology"], correctIndex: 1),
            MathExamQuestion(id: "his_20_e10", topicId: 20, prompt: "The League of Nations, proposed by US President Woodrow Wilson after WWI, was primarily designed to...", options: ["Punish Germany severely", "Prevent future wars through international cooperation", "Divide Germany among the Allies", "Create a world government"], correctIndex: 1),
        ],

        // Topic 21: The Russian Revolution
        21: [
            MathExamQuestion(id: "his_21_e1", topicId: 21, prompt: "Russia's poor performance in WWI contributed to the revolution because...", options: ["It made Russia too powerful", "Massive casualties, food shortages, and military failure created popular discontent", "The army refused to fight and took over the government", "Russia had already left the war before 1917"], correctIndex: 1),
            MathExamQuestion(id: "his_21_e2", topicId: 21, prompt: "The Bolsheviks followed the political ideology of...", options: ["Tsarist autocracy", "Liberal democracy", "Marxist communism", "Fascism"], correctIndex: 2),
            MathExamQuestion(id: "his_21_e3", topicId: 21, prompt: "Lenin's slogan 'Peace, Land, Bread' promised the Russian people...", options: ["Victory in WWI, farmland redistribution, and food", "An end to the war, land for peasants, and food for workers", "A new constitution, land reform, and trade with Europe", "Peace with Germany, colonies in Asia, and grain exports"], correctIndex: 1),
            MathExamQuestion(id: "his_21_e4", topicId: 21, prompt: "The Treaty of Brest-Litovsk (1918) was signed by the Bolsheviks to...", options: ["Join the Allied Powers in WWI", "Take Russia out of WWI by surrendering large territories to Germany", "Establish the Soviet Union", "Form an alliance with France"], correctIndex: 1),
            MathExamQuestion(id: "his_21_e5", topicId: 21, prompt: "Rasputin was controversial in Russia because he was...", options: ["A Bolshevik spy in the Tsar's court", "A mystic who had significant influence over Tsarina Alexandra", "A general who refused to fight in WWI", "The leader of the provisional government"], correctIndex: 1),
            MathExamQuestion(id: "his_21_e6", topicId: 21, prompt: "After the revolution, the Russian Civil War was fought between...", options: ["The Bolsheviks (Reds) and anti-Bolshevik forces (Whites)", "Russia and Germany", "The Tsar's forces and the Bolsheviks only", "Russia and Britain"], correctIndex: 0),
            MathExamQuestion(id: "his_21_e7", topicId: 21, prompt: "Joseph Stalin rose to power after Lenin's death partly by...", options: ["Being elected democratically", "Being appointed by Lenin himself", "Outmanoeuvring rivals like Trotsky through political control", "Leading a second revolution"], correctIndex: 2),
            MathExamQuestion(id: "his_21_e8", topicId: 21, prompt: "Karl Marx, whose ideas inspired the Russian Revolution, wrote...", options: ["The Wealth of Nations", "The Communist Manifesto", "Das Kapital and The Communist Manifesto", "The Social Contract"], correctIndex: 2),
            MathExamQuestion(id: "his_21_e9", topicId: 21, prompt: "The Cheka, established by the Bolsheviks, was...", options: ["A workers' union", "The secret police used to suppress opposition", "A communist newspaper", "A military division"], correctIndex: 1),
            MathExamQuestion(id: "his_21_e10", topicId: 21, prompt: "The October Revolution of 1917 was a...", options: ["Popular democratic election", "Military coup by the Bolsheviks seizing key government buildings", "Peasant uprising across rural Russia", "Naval mutiny that spread to the cities"], correctIndex: 1),
        ],

        // Topic 22: The Great Depression
        22: [
            MathExamQuestion(id: "his_22_e1", topicId: 22, prompt: "The Wall Street Crash of October 1929 was caused mainly by...", options: ["A natural disaster wiping out the US economy", "Overspeculation  -  stock prices had been inflated far beyond real value", "A war breaking out in Europe", "The US government raising taxes too high"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e2", topicId: 22, prompt: "The Smoot-Hawley Tariff Act (1930) worsened the Depression by...", options: ["Lowering trade barriers worldwide", "Raising US import taxes, causing other countries to retaliate and trade to collapse", "Bailing out all US banks", "Providing relief money to unemployed Americans"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e3", topicId: 22, prompt: "Hoovervilles during the Great Depression were...", options: ["New towns built by the government to house workers", "Shanty towns (makeshift camps) built by homeless people, named mockingly after President Hoover", "Government soup kitchens", "Small farms given to unemployed families"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e4", topicId: 22, prompt: "FDR's New Deal included which of the following programmes?", options: ["The Civilian Conservation Corps (CCC) providing jobs for young men", "Tripling military spending", "Removing all bank regulations", "Closing all schools to save money"], correctIndex: 0),
            MathExamQuestion(id: "his_22_e5", topicId: 22, prompt: "The Dust Bowl was caused by...", options: ["A nuclear accident in the Midwest", "A combination of severe drought and poor farming practices stripping the land of topsoil", "Flooding from the Mississippi River", "Industrial pollution ruining farmland"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e6", topicId: 22, prompt: "John Steinbeck's novel 'The Grapes of Wrath' depicted...", options: ["Life for soldiers in World War I", "Families migrating from the Dust Bowl to California during the Depression", "The Wall Street Crash from a banker's perspective", "Life under communism in the USSR"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e7", topicId: 22, prompt: "The Great Depression contributed to the rise of extreme political movements in Europe, particularly...", options: ["Liberal democracy", "Fascism in Germany and Italy", "Communism spreading to France", "The British Empire expanding"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e8", topicId: 22, prompt: "What finally ended the Great Depression in the USA?", options: ["The New Deal alone solved all problems by 1935", "World War II, as massive government spending on the war effort stimulated the economy", "A recovery in stock market prices in 1930", "A series of good harvests in 1932"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e9", topicId: 22, prompt: "The Great Depression affected world trade because...", options: ["Countries traded more to help each other", "Countries raised tariffs and reduced imports, causing global trade to shrink dramatically", "The USA lent money to all affected nations", "Oil prices fell, helping most economies"], correctIndex: 1),
            MathExamQuestion(id: "his_22_e10", topicId: 22, prompt: "Which US President was blamed for the Depression partly due to his reluctance to provide direct government relief?", options: ["Franklin D. Roosevelt", "Woodrow Wilson", "Herbert Hoover", "Calvin Coolidge"], correctIndex: 2),
        ],

        // Topic 23: World War II
        23: [
            MathExamQuestion(id: "his_23_e1", topicId: 23, prompt: "Germany's invasion of which country in September 1939 triggered Britain and France to declare war?", options: ["Austria", "Czechoslovakia", "Poland", "France"], correctIndex: 2),
            MathExamQuestion(id: "his_23_e2", topicId: 23, prompt: "The Blitzkrieg tactic used by Germany involved...", options: ["Slow, methodical trench warfare", "Fast, combined attacks using tanks, aircraft, and infantry to overwhelm the enemy", "Naval blockades to starve enemies", "Prolonged bombing of cities only"], correctIndex: 1),
            MathExamQuestion(id: "his_23_e3", topicId: 23, prompt: "The Battle of Britain (1940) was a victory for...", options: ["Germany, which succeeded in invading Britain", "Japan, which bombed British bases", "Britain, which successfully defended its airspace against the German Luftwaffe", "The USA, which intervened to stop the German bombing"], correctIndex: 2),
            MathExamQuestion(id: "his_23_e4", topicId: 23, prompt: "Operation Overlord (D-Day) on June 6, 1944 was the Allied invasion of...", options: ["Sicily, Italy", "Normandy, France", "The Netherlands", "Norway"], correctIndex: 1),
            MathExamQuestion(id: "his_23_e5", topicId: 23, prompt: "The Manhattan Project was the secret Allied programme to...", options: ["Build the world's first jet aircraft", "Develop the first atomic bomb", "Crack the German Enigma code", "Develop radar technology"], correctIndex: 1),
            MathExamQuestion(id: "his_23_e6", topicId: 23, prompt: "The Lend-Lease Act (1941) allowed the USA to supply Britain and other Allies with...", options: ["Soldiers and troops before entering the war", "Military equipment and supplies in exchange for bases and future repayment", "Full military alliance before Pearl Harbor", "Nuclear technology"], correctIndex: 1),
            MathExamQuestion(id: "his_23_e7", topicId: 23, prompt: "V-J Day (Victory over Japan Day) in August 1945 marked...", options: ["The Allied landings in Normandy", "Germany's surrender", "Japan's surrender and the end of WWII", "The atomic bomb being tested"], correctIndex: 2),
            MathExamQuestion(id: "his_23_e8", topicId: 23, prompt: "Winston Churchill served as which country's Prime Minister during WWII?", options: ["USA", "Australia", "Canada", "Great Britain"], correctIndex: 3),
            MathExamQuestion(id: "his_23_e9", topicId: 23, prompt: "The Enigma machine was a German device used for...", options: ["Navigation at sea", "Encrypting secret military communications", "Calculating artillery range", "Tracking enemy aircraft"], correctIndex: 1),
            MathExamQuestion(id: "his_23_e10", topicId: 23, prompt: "The Yalta Conference (1945) was a meeting between...", options: ["Hitler, Mussolini, and Hirohito", "Churchill, Roosevelt, and Stalin to plan post-war Europe", "Allied military commanders planning D-Day", "The founding members of the United Nations"], correctIndex: 1),
        ],

        // Topic 24: The Holocaust
        24: [
            MathExamQuestion(id: "his_24_e1", topicId: 24, prompt: "The Nuremberg Laws (1935) in Nazi Germany...", options: ["Gave Jewish people equal rights as German citizens", "Stripped Jewish people of German citizenship and introduced severe legal discrimination", "Were laws governing the Nuremberg Trials", "Were wartime laws about military service"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e2", topicId: 24, prompt: "Kristallnacht ('Night of Broken Glass', 1938) was...", options: ["The day Germany surrendered in WWI", "A Nazi-organised violent pogrom against Jewish businesses and synagogues", "The opening ceremony of the 1936 Berlin Olympics", "The date the Nuremberg Laws were passed"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e3", topicId: 24, prompt: "The Wannsee Conference (1942) was a meeting at which Nazi officials...", options: ["Planned the D-Day defences", "Coordinated and formalised plans for the systematic murder of all European Jews", "Discussed peace negotiations with the Allies", "Planned the invasion of the Soviet Union"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e4", topicId: 24, prompt: "Auschwitz-Birkenau was the largest Nazi concentration and extermination camp, located in...", options: ["Germany", "Austria", "Poland", "Hungary"], correctIndex: 2),
            MathExamQuestion(id: "his_24_e5", topicId: 24, prompt: "Oskar Schindler is remembered for...", options: ["Leading the Nuremberg Trials", "Saving over 1,000 Jewish workers by employing them in his factory", "Liberating the Auschwitz camp", "Writing the first report on the Holocaust for the Allies"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e6", topicId: 24, prompt: "The Einsatzgruppen were...", options: ["German army units fighting on the Eastern Front", "Nazi mobile killing squads that murdered Jewish people and others in occupied territories", "Concentration camp guards", "Units responsible for deporting Jewish people to camps"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e7", topicId: 24, prompt: "International Holocaust Remembrance Day marks January 27 because it was the date...", options: ["The Nuremberg Laws were passed in 1935", "Auschwitz-Birkenau was liberated by Soviet forces in 1945", "The Nuremberg Trials began in 1945", "Anne Frank's diary was first published"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e8", topicId: 24, prompt: "Elie Wiesel's memoir 'Night' describes his experience...", options: ["As a child in Germany before the war", "Surviving the concentration camps at Auschwitz and Buchenwald", "As a resistance fighter in France", "As a journalist reporting on the Nuremberg Trials"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e9", topicId: 24, prompt: "The term 'genocide' means...", options: ["War between nations", "The systematic killing of a large group of people, especially of a particular ethnic or national group", "Crimes committed during wartime", "Mass displacement of people from their homes"], correctIndex: 1),
            MathExamQuestion(id: "his_24_e10", topicId: 24, prompt: "The Nuremberg Trials were significant in international law because they...", options: ["Only punished German soldiers, not political leaders", "Established that individuals could be held criminally responsible for crimes against humanity", "Found all defendants not guilty", "Were held entirely in secret"], correctIndex: 1),
        ],

        // Topic 25: The Cold War
        25: [
            MathExamQuestion(id: "his_25_e1", topicId: 25, prompt: "The Truman Doctrine (1947) committed the USA to...", options: ["Isolationism and staying out of world affairs", "Containment  -  supporting nations threatened by communist expansion", "Forming a military alliance with the USSR", "Sharing nuclear technology with allies"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e2", topicId: 25, prompt: "The Marshall Plan was a US programme to...", options: ["Fund the US military build-up against the USSR", "Provide economic aid to rebuild Western European nations after WWII", "Create NATO", "Develop nuclear weapons"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e3", topicId: 25, prompt: "The Warsaw Pact was a military alliance formed by...", options: ["Western European nations and the USA", "The Soviet Union and its Eastern European satellite states", "All United Nations members", "China and the USSR together against the West"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e4", topicId: 25, prompt: "The Korean War (1950–53) was an example of a Cold War 'proxy war' because...", options: ["Both the USA and USSR fought each other directly there", "The USA supported South Korea while China (allied to the USSR) supported North Korea", "The UN declared Korea a neutral zone", "Only the USSR was involved militarily"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e5", topicId: 25, prompt: "The Cuban Missile Crisis was resolved when...", options: ["The USA invaded Cuba", "The USSR agreed to remove missiles from Cuba in exchange for a US pledge not to invade Cuba", "Cuba joined NATO", "The missiles were never really there"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e6", topicId: 25, prompt: "McCarthyism in 1950s America referred to...", options: ["A popular TV programme about Cold War spies", "A campaign of accusations of communist subversion, often with little evidence", "A US foreign policy strategy", "Senator McCarthy's programme to modernise the US military"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e7", topicId: 25, prompt: "The policy of 'Mutually Assured Destruction' (MAD) meant that...", options: ["Both sides knew a nuclear war would destroy both nations, so neither dared start one", "The USA was certain it could win a nuclear war", "The USSR had more nuclear weapons than the USA", "Only conventional wars could be fought between superpowers"], correctIndex: 0),
            MathExamQuestion(id: "his_25_e8", topicId: 25, prompt: "Mikhail Gorbachev's policies of 'glasnost' and 'perestroika' in the 1980s were significant because...", options: ["They increased Soviet military power", "They introduced greater openness and economic reform, contributing to the USSR's collapse", "They began the nuclear arms race", "They led to the Soviet invasion of Afghanistan"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e9", topicId: 25, prompt: "The Vietnam War was a Cold War conflict in which...", options: ["The USA successfully contained communist North Vietnam", "Communist North Vietnam ultimately unified the country after the USA withdrew", "The USSR directly fought the USA in Vietnam", "China was defeated by US forces"], correctIndex: 1),
            MathExamQuestion(id: "his_25_e10", topicId: 25, prompt: "The INF Treaty (1987), signed by Reagan and Gorbachev, aimed to...", options: ["End the Space Race", "Eliminate an entire class of nuclear missiles, reducing Cold War tensions", "Form a new military alliance", "Reunify Germany"], correctIndex: 1),
        ],

        // Topic 26: Decolonisation
        26: [
            MathExamQuestion(id: "his_26_e1", topicId: 26, prompt: "Gandhi's strategy of non-violent resistance (Satyagraha) included...", options: ["Armed guerrilla warfare", "Boycotts, peaceful marches, and civil disobedience such as the Salt March", "Military campaigns against British troops", "Assassinations of colonial officials"], correctIndex: 1),
            MathExamQuestion(id: "his_26_e2", topicId: 26, prompt: "The partition of India in 1947 led to...", options: ["A peaceful transition with no displacement", "Mass migration and violent communal conflict between Hindus, Muslims, and Sikhs", "India becoming a republic immediately", "Bangladesh being created at the same time"], correctIndex: 1),
            MathExamQuestion(id: "his_26_e3", topicId: 26, prompt: "Kwame Nkrumah led which African country to independence in 1957?", options: ["Nigeria", "Kenya", "Ghana (then Gold Coast)", "Senegal"], correctIndex: 2),
            MathExamQuestion(id: "his_26_e4", topicId: 26, prompt: "Apartheid in South Africa was a system of...", options: ["Racial equality enforced by law", "State-enforced racial segregation and discrimination against Black South Africans", "Economic land reform", "Democratic elections open to all races"], correctIndex: 1),
            MathExamQuestion(id: "his_26_e5", topicId: 26, prompt: "Nelson Mandela was imprisoned for 27 years and was released in...", options: ["1976", "1980", "1985", "1990"], correctIndex: 3),
            MathExamQuestion(id: "his_26_e6", topicId: 26, prompt: "The Algerian War of Independence (1954–1962) was fought against...", options: ["Britain", "Belgium", "France", "Spain"], correctIndex: 2),
            MathExamQuestion(id: "his_26_e7", topicId: 26, prompt: "Ho Chi Minh led the independence movement of which country?", options: ["India", "Vietnam", "Indonesia", "Philippines"], correctIndex: 1),
            MathExamQuestion(id: "his_26_e8", topicId: 26, prompt: "The United Nations played a role in decolonisation by...", options: ["Supporting colonial powers in keeping their empires", "Providing a forum for newly independent nations and promoting self-determination", "Refusing to admit newly independent African states", "Sending troops to enforce colonial rule"], correctIndex: 1),
            MathExamQuestion(id: "his_26_e9", topicId: 26, prompt: "Zimbabwe (formerly Rhodesia) gained majority Black African rule and was renamed Zimbabwe in...", options: ["1965", "1970", "1980", "1994"], correctIndex: 2),
            MathExamQuestion(id: "his_26_e10", topicId: 26, prompt: "Indonesia gained independence from which colonial power in 1945?", options: ["Britain", "France", "The Netherlands", "Portugal"], correctIndex: 2),
        ],

        // Topic 27: Civil Rights Movement
        27: [
            MathExamQuestion(id: "his_27_e1", topicId: 27, prompt: "The Brown v. Board of Education Supreme Court decision (1954) ruled that...", options: ["Racial segregation in public schools was constitutional", "Racial segregation in public schools was unconstitutional", "African Americans had the right to vote", "The Civil Rights Act was already law"], correctIndex: 1),
            MathExamQuestion(id: "his_27_e2", topicId: 27, prompt: "The Montgomery Bus Boycott (1955–56) lasted for how long?", options: ["Two weeks", "Three months", "About 381 days", "Two years"], correctIndex: 2),
            MathExamQuestion(id: "his_27_e3", topicId: 27, prompt: "Sit-in protests (such as the Greensboro sit-in, 1960) targeted...", options: ["Segregated public transport", "Segregated lunch counters at Woolworth's and other stores", "Segregated schools", "Segregated churches"], correctIndex: 1),
            MathExamQuestion(id: "his_27_e4", topicId: 27, prompt: "The Freedom Riders (1961) challenged segregation on...", options: ["Segregated trains only", "Interstate buses and bus terminals in the South", "Domestic flights", "Schools in Alabama"], correctIndex: 1),
            MathExamQuestion(id: "his_27_e5", topicId: 27, prompt: "Martin Luther King Jr. was awarded the Nobel Peace Prize in...", options: ["1960", "1963", "1964", "1968"], correctIndex: 2),
            MathExamQuestion(id: "his_27_e6", topicId: 27, prompt: "The 24th Amendment (1964) abolished...", options: ["Slavery", "Racial segregation in schools", "Poll taxes that prevented poor Black Americans from voting", "Literacy tests for voters"], correctIndex: 2),
            MathExamQuestion(id: "his_27_e7", topicId: 27, prompt: "Malcolm X differed from Martin Luther King Jr. in that he initially...", options: ["Supported non-violent protest only", "Advocated Black self-defence and separatism rather than integration", "Worked closely with the Democratic Party", "Opposed all forms of civil rights action"], correctIndex: 1),
            MathExamQuestion(id: "his_27_e8", topicId: 27, prompt: "The Selma to Montgomery marches (1965) were held to demand...", options: ["An end to school segregation", "The right of Black Americans in Alabama to vote", "Equal pay for Black workers", "Desegregation of the US military"], correctIndex: 1),
            MathExamQuestion(id: "his_27_e9", topicId: 27, prompt: "President Lyndon B. Johnson signed both the Civil Rights Act 1964 and the Voting Rights Act 1965 following...", options: ["The assassination of Malcolm X", "Pressure from Congress only", "Sustained civil rights campaigning, marches, and public demonstrations", "A Supreme Court order to do so"], correctIndex: 2),
            MathExamQuestion(id: "his_27_e10", topicId: 27, prompt: "The Black Power movement of the late 1960s emphasised...", options: ["Non-violent integration into white society", "Black cultural pride, self-determination, and political power", "Working only within existing political parties", "Cooperation with the Ku Klux Klan for dialogue"], correctIndex: 1),
        ],

        // Topic 28: The Space Race
        28: [
            MathExamQuestion(id: "his_28_e1", topicId: 28, prompt: "Sputnik's launch in 1957 caused alarm in the USA because...", options: ["It showed the USSR could reach US territory with rocket technology", "It carried a nuclear weapon", "It allowed the USSR to spy on US military bases from space", "It was a public relations failure for the USA"], correctIndex: 0),
            MathExamQuestion(id: "his_28_e2", topicId: 28, prompt: "Alan Shepard was significant in the Space Race as...", options: ["The first American to orbit Earth", "The first American in space (suborbital flight, May 1961)", "The first American on the Moon", "The director of NASA who led the Apollo programme"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e3", topicId: 28, prompt: "John Glenn's 1962 spaceflight was historically important because he was...", options: ["The first American in space", "The first American to orbit Earth", "The first person to walk in space", "The youngest astronaut in NASA history"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e4", topicId: 28, prompt: "The Apollo 1 disaster (1967) killed three astronauts in...", options: ["A launch explosion", "A re-entry failure", "A fire during a launch rehearsal on the pad", "A mission failure on the way to the Moon"], correctIndex: 2),
            MathExamQuestion(id: "his_28_e5", topicId: 28, prompt: "The Lunar Module that landed on the Moon during Apollo 11 was named...", options: ["Columbia", "Eagle", "Discovery", "Challenger"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e6", topicId: 28, prompt: "Buzz Aldrin's role on Apollo 11 was...", options: ["Mission commander and first to step on the Moon", "Pilot of the Command Module who stayed in lunar orbit", "The second person to walk on the Moon with Armstrong", "Mission controller at Houston"], correctIndex: 2),
            MathExamQuestion(id: "his_28_e7", topicId: 28, prompt: "The Space Race had a significant impact on education in the USA because...", options: ["Schools stopped teaching science to focus on military training", "The Soviet Sputnik launch prompted massive US investment in science and maths education", "Universities closed their engineering programmes", "The US government banned space-related studies in schools"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e8", topicId: 28, prompt: "Apollo 13 (1970) is remembered because...", options: ["It successfully landed on the Moon for the third time", "An oxygen tank exploded, forcing the crew to abort the Moon landing and return safely", "It carried the first geologist to the Moon", "It was the last Apollo mission"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e9", topicId: 28, prompt: "After the Moon landing, the next major phase of US-Soviet space cooperation began with...", options: ["The International Space Station in 1998", "The Apollo-Soyuz mission in 1975, the first joint US-Soviet spaceflight", "The Space Shuttle programme in 1981", "The Mir space station in 1986"], correctIndex: 1),
            MathExamQuestion(id: "his_28_e10", topicId: 28, prompt: "Katherine Johnson's contribution to NASA was...", options: ["She was the first woman astronaut selected by NASA", "She performed critical mathematical calculations for early space missions including Apollo 11", "She designed the Saturn V rocket engine", "She was the first Black woman to walk in space"], correctIndex: 1),
        ],

        // Topic 29: The Modern World
        29: [
            MathExamQuestion(id: "his_29_e1", topicId: 29, prompt: "The fall of the Berlin Wall in 1989 was significant because it...", options: ["Reunified Germany immediately on the same day", "Symbolised the collapse of communist rule in Eastern Europe", "Was ordered by Soviet President Gorbachev", "Led to the immediate founding of the EU"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e2", topicId: 29, prompt: "German reunification officially took place in...", options: ["November 1989", "January 1990", "October 1990", "December 1991"], correctIndex: 2),
            MathExamQuestion(id: "his_29_e3", topicId: 29, prompt: "The 9/11 attacks were carried out by members of which group?", options: ["The Taliban government of Afghanistan", "Al-Qaeda", "ISIS (Islamic State)", "Hezbollah"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e4", topicId: 29, prompt: "The Arab Spring (2010–2012) was a wave of pro-democracy protests and uprisings across...", options: ["Sub-Saharan Africa", "The Middle East and North Africa", "South-East Asia", "Eastern Europe"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e5", topicId: 29, prompt: "The Paris Agreement (2015) was an international treaty on...", options: ["Nuclear disarmament", "International trade tariffs", "Reducing greenhouse gas emissions to combat climate change", "Refugee rights"], correctIndex: 2),
            MathExamQuestion(id: "his_29_e6", topicId: 29, prompt: "The European Union (EU) is primarily...", options: ["A military alliance", "A political and economic union of European countries with a single market", "A United Nations body for European affairs", "A trade agreement between EU and the USA"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e7", topicId: 29, prompt: "Brexit refers to...", options: ["Britain's decision to leave the United Nations", "The United Kingdom voting to leave the European Union in 2016", "Britain joining the Euro currency", "The break-up of the United Kingdom"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e8", topicId: 29, prompt: "The COVID-19 pandemic began in...", options: ["2018", "2019", "2020", "2021"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e9", topicId: 29, prompt: "Malala Yousafzai became an international symbol for...", options: ["Climate change activism", "Girls' right to education, after surviving a Taliban assassination attempt", "Refugee rights in Europe", "Democracy movements in the Middle East"], correctIndex: 1),
            MathExamQuestion(id: "his_29_e10", topicId: 29, prompt: "The rise of social media in the 2000s–2010s changed politics primarily by...", options: ["Removing the influence of ordinary people from politics", "Enabling rapid spread of information, protest organisation, and political campaigning online", "Making traditional media more trusted", "Reducing the influence of the internet on elections"], correctIndex: 1),
        ],

        // Topic 30: Revolutions & Change
        30: [
            MathExamQuestion(id: "his_30_e1", topicId: 30, prompt: "The American Revolution produced which founding document in 1776?", options: ["The Magna Carta", "The Declaration of Independence", "The US Constitution", "The Bill of Rights"], correctIndex: 1),
            MathExamQuestion(id: "his_30_e2", topicId: 30, prompt: "The French Revolution's execution of King Louis XVI symbolised...", options: ["The restoration of royal power", "The rejection of absolute monarchy and the rise of popular sovereignty", "A return to feudalism", "France becoming a military dictatorship"], correctIndex: 1),
            MathExamQuestion(id: "his_30_e3", topicId: 30, prompt: "Napoleon Bonaparte rose to power as a result of...", options: ["The French Revolution creating political instability that allowed a strong military leader to take control", "Being elected democratically by the French people", "Being appointed by the restored monarchy", "Leading the storming of the Bastille"], correctIndex: 0),
            MathExamQuestion(id: "his_30_e4", topicId: 30, prompt: "Which revolution is considered to have most directly influenced the French Revolution?", options: ["The Russian Revolution", "The Industrial Revolution", "The American Revolution", "The English Civil War"], correctIndex: 2),
            MathExamQuestion(id: "his_30_e5", topicId: 30, prompt: "The Glorious Revolution of 1688 in Britain was significant because it...", options: ["Abolished the monarchy entirely", "Established that Parliament was supreme over the monarch and introduced constitutional monarchy", "Started the Industrial Revolution", "Led to British colonisation of America"], correctIndex: 1),
            MathExamQuestion(id: "his_30_e6", topicId: 30, prompt: "The storming of the Bastille on 14 July 1789 was important because the Bastille represented...", options: ["The French royal treasury", "Royal tyranny  -  it was a prison used to hold political prisoners", "The headquarters of the French army", "A major food warehouse during the famine"], correctIndex: 1),
            MathExamQuestion(id: "his_30_e7", topicId: 30, prompt: "The Luddites during the Industrial Revolution were...", options: ["Factory owners who supported mechanisation", "Workers who destroyed machinery because they feared losing their jobs to machines", "Government officials who promoted industrialisation", "Trade union leaders who negotiated better wages"], correctIndex: 1),
            MathExamQuestion(id: "his_30_e8", topicId: 30, prompt: "A key feature shared by most successful revolutions throughout history is...", options: ["They all began with military coups", "They all succeeded without any violence", "Widespread popular discontent combined with weak or illegitimate existing governments", "They all resulted in democracy"], correctIndex: 2),
            MathExamQuestion(id: "his_30_e9", topicId: 30, prompt: "The Digital Revolution began approximately in...", options: ["The 1950s with early mainframe computers", "The 1960s with the moon landing", "The 1980s with the widespread adoption of personal computers", "The 2000s with the invention of the internet"], correctIndex: 2),
            MathExamQuestion(id: "his_30_e10", topicId: 30, prompt: "Historians study revolutions by examining their causes, events, and...", options: ["Only the leaders involved", "Short-term consequences only", "Long-term legacies  -  how they reshaped society, laws, and the world", "Military tactics used during fighting"], correctIndex: 2),
        ],

        31: [
        MathExamQuestion(id: "his_31_e1",  topicId: 31, prompt: "Which civilisation built the first known cities in Mesopotamia?",                     options: ["Babylonians", "Assyrians", "Sumerians", "Akkadians"],                                                                     correctIndex: 2),
        MathExamQuestion(id: "his_31_e2",  topicId: 31, prompt: "What material were the laws of Hammurabi's Code carved on?",                          options: ["A gold tablet", "A stone pillar", "Clay tablets", "A wooden board"],                                                     correctIndex: 1),
        MathExamQuestion(id: "his_31_e3",  topicId: 31, prompt: "What was cuneiform?",                                                                  options: ["A type of Mesopotamian boat", "An early system of writing using wedge-shaped marks", "A Babylonian god", "A farming tool"], correctIndex: 1),
        MathExamQuestion(id: "his_31_e4",  topicId: 31, prompt: "Which two rivers gave Mesopotamia its name and fertile land?",                        options: ["Nile and Niger", "Tigris and Euphrates", "Indus and Ganges", "Danube and Rhine"],                                         correctIndex: 1),
        MathExamQuestion(id: "his_31_e5",  topicId: 31, prompt: "What technique did Mesopotamian farmers use to manage water for their crops?",        options: ["Terracing", "Irrigation channels", "Cloud seeding", "Damming rivers completely"],                                        correctIndex: 1),
        MathExamQuestion(id: "his_31_e6",  topicId: 31, prompt: "What is the significance of Hammurabi's Code in world history?",                      options: ["It was the first democracy", "It was one of the earliest written law codes", "It was the first trade agreement", "It was the first written language"], correctIndex: 1),
        MathExamQuestion(id: "his_31_e7",  topicId: 31, prompt: "What were ziggurats primarily used for?",                                             options: ["As royal palaces", "As religious temples", "As market places", "As fortresses"],                                          correctIndex: 1),
        MathExamQuestion(id: "his_31_e8",  topicId: 31, prompt: "Mesopotamia is often called 'the cradle of civilisation' because:",                   options: ["It had the best farmland in the world", "It was home to some of the world's first cities and writing", "It was the largest empire ever", "It invented iron tools first"], correctIndex: 1),
        MathExamQuestion(id: "his_31_e9",  topicId: 31, prompt: "Which Mesopotamian empire was Hammurabi king of?",                                    options: ["Sumerian", "Assyrian", "Babylonian", "Hittite"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_31_e10", topicId: 31, prompt: "What region of the world does modern-day Iraq roughly correspond to in ancient times?", options: ["Ancient Egypt", "Ancient Mesopotamia", "Ancient Persia", "Ancient Greece"],                                          correctIndex: 1),
    ],

    32: [
        MathExamQuestion(id: "his_32_e1",  topicId: 32, prompt: "What made Indus Valley cities remarkable for their time?",                            options: ["Their enormous pyramids", "Their advanced urban planning and drainage", "Their massive armies", "Their writing on stone tablets"], correctIndex: 1),
        MathExamQuestion(id: "his_32_e2",  topicId: 32, prompt: "Which empire did Ashoka rule before embracing Buddhism?",                             options: ["Gupta Empire", "Kushan Empire", "Maurya Empire", "Mughal Empire"],                                                         correctIndex: 2),
        MathExamQuestion(id: "his_32_e3",  topicId: 32, prompt: "What is 'dharma' in Hinduism?",                                                       options: ["A type of meditation", "One's moral duty or righteous path", "A sacred river", "A form of yoga"],                        correctIndex: 1),
        MathExamQuestion(id: "his_32_e4",  topicId: 32, prompt: "How did Ashoka spread Buddhism after his conversion?",                               options: ["By waging wars", "By destroying Hindu temples", "By sending missionaries across Asia", "By banning all other religions"],  correctIndex: 2),
        MathExamQuestion(id: "his_32_e5",  topicId: 32, prompt: "Which city was a major site of the Indus Valley Civilisation?",                      options: ["Delhi", "Patna", "Mohenjo-daro", "Agra"],                                                                                correctIndex: 2),
        MathExamQuestion(id: "his_32_e6",  topicId: 32, prompt: "What event led Ashoka to convert to Buddhism?",                                      options: ["A drought", "The horrors of the Kalinga War", "A message from the Buddha", "Advice from his mother"],                    correctIndex: 1),
        MathExamQuestion(id: "his_32_e7",  topicId: 32, prompt: "What does 'karma' mean in Hinduism and Buddhism?",                                    options: ["A type of prayer", "The cycle of rebirth", "The idea that actions have consequences", "A holy scripture"],               correctIndex: 2),
        MathExamQuestion(id: "his_32_e8",  topicId: 32, prompt: "Which religion began in India and later spread widely across Asia?",                  options: ["Islam", "Christianity", "Buddhism", "Judaism"],                                                                           correctIndex: 2),
        MathExamQuestion(id: "his_32_e9",  topicId: 32, prompt: "Around what year did Harappa and Mohenjo-daro flourish?",                            options: ["5000 BC", "3500 BC", "2500 BC", "1000 BC"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_32_e10", topicId: 32, prompt: "Which empire was the first to unify most of the Indian subcontinent?",                options: ["Gupta Empire", "Mughal Empire", "Maurya Empire", "Maratha Empire"],                                                       correctIndex: 2),
    ],

    33: [
        MathExamQuestion(id: "his_33_e1",  topicId: 33, prompt: "What did Cyrus the Great do that was unusual for ancient conquerors?",                options: ["He enslaved all captured peoples", "He destroyed conquered cities", "He respected the religions of conquered peoples", "He forced everyone to adopt Persian customs"], correctIndex: 2),
        MathExamQuestion(id: "his_33_e2",  topicId: 33, prompt: "Which battle in 490 BC saw the Greeks defeat the Persians?",                          options: ["Battle of Thermopylae", "Battle of Salamis", "Battle of Marathon", "Battle of Plataea"],                                  correctIndex: 2),
        MathExamQuestion(id: "his_33_e3",  topicId: 33, prompt: "Which Persian king expanded the empire and built the Royal Road?",                   options: ["Cyrus the Great", "Xerxes", "Darius I", "Artaxerxes"],                                                                    correctIndex: 2),
        MathExamQuestion(id: "his_33_e4",  topicId: 33, prompt: "What was the primary purpose of the Persian Royal Road?",                            options: ["Military conquests", "Swift communication across the empire", "Trade with China", "Royal processions only"],              correctIndex: 1),
        MathExamQuestion(id: "his_33_e5",  topicId: 33, prompt: "The Achaemenid Empire at its height stretched from which regions?",                   options: ["Greece to India", "Egypt to India", "Rome to China", "Arabia to Europe"],                                                 correctIndex: 1),
        MathExamQuestion(id: "his_33_e6",  topicId: 33, prompt: "Which group successfully resisted Persian conquest in the Persian Wars?",             options: ["The Romans", "The Babylonians", "The Greek city-states", "The Egyptians"],                                               correctIndex: 2),
        MathExamQuestion(id: "his_33_e7",  topicId: 33, prompt: "Around what year did Cyrus the Great found the Persian Empire?",                     options: ["750 BC", "650 BC", "550 BC", "450 BC"],                                                                                   correctIndex: 2),
        MathExamQuestion(id: "his_33_e8",  topicId: 33, prompt: "Which Persian king invaded Greece with a vast army in 480 BC?",                       options: ["Cyrus the Great", "Darius I", "Xerxes", "Cambyses"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_33_e9",  topicId: 33, prompt: "The Achaemenid Empire was eventually conquered by which leader?",                     options: ["Julius Caesar", "Genghis Khan", "Alexander the Great", "Attila the Hun"],                                                 correctIndex: 2),
        MathExamQuestion(id: "his_33_e10", topicId: 33, prompt: "What connected far-flung parts of the Persian Empire for trade and communication?",  options: ["A navy", "The Royal Road", "A series of canals", "Carrier pigeons"],                                                     correctIndex: 1),
    ],

    34: [
        MathExamQuestion(id: "his_34_e1",  topicId: 34, prompt: "What term describes the exchange of land for military service in medieval Europe?",   options: ["Democracy", "Feudalism", "Mercantilism", "Republicanism"],                                                                correctIndex: 1),
        MathExamQuestion(id: "his_34_e2",  topicId: 34, prompt: "Which group of people were at the very top of the feudal pyramid?",                   options: ["Bishops", "Lords", "Knights", "Kings"],                                                                                   correctIndex: 3),
        MathExamQuestion(id: "his_34_e3",  topicId: 34, prompt: "What obligation did serfs owe their lord as part of the feudal system?",              options: ["Military service", "Payment of gold", "Labour on the lord's land", "Building cathedrals"],                             correctIndex: 2),
        MathExamQuestion(id: "his_34_e4",  topicId: 34, prompt: "A lord's estate including farmland and a village was called a:",                      options: ["Fief", "Manor", "Guild", "Parish"],                                                                                       correctIndex: 1),
        MathExamQuestion(id: "his_34_e5",  topicId: 34, prompt: "Which social class trained on horseback to fight for their lord?",                    options: ["Serfs", "Merchants", "Knights", "Bishops"],                                                                               correctIndex: 2),
        MathExamQuestion(id: "his_34_e6",  topicId: 34, prompt: "What happened if a serf left the manor without permission?",                          options: ["Nothing, they were free", "They were punished by the lord", "The king would pardon them", "The Church would help them"],  correctIndex: 1),
        MathExamQuestion(id: "his_34_e7",  topicId: 34, prompt: "What did lords receive from the king in the feudal bargain?",                        options: ["Money", "Church titles", "Land", "Merchant licences"],                                                                    correctIndex: 2),
        MathExamQuestion(id: "his_34_e8",  topicId: 34, prompt: "Which centuries roughly marked the peak of feudalism in medieval Europe?",            options: ["1st–4th centuries", "5th–8th centuries", "9th–15th centuries", "16th–18th centuries"],                                  correctIndex: 2),
        MathExamQuestion(id: "his_34_e9",  topicId: 34, prompt: "How is the feudal system best described?",                                            options: ["A democratic system of government", "A pyramid of duties and land obligations", "A trade network between cities", "A religious law system"], correctIndex: 1),
        MathExamQuestion(id: "his_34_e10", topicId: 34, prompt: "In the feudal system, what did a vassal promise to provide to their lord?",           options: ["Crops and animals", "Military loyalty and service", "Gold from mines", "Church tithes"],                                correctIndex: 1),
    ],

    35: [
        MathExamQuestion(id: "his_35_e1",  topicId: 35, prompt: "What gave the Pope great political power during the Middle Ages?",                    options: ["Control of armies", "Control of all land in Europe", "The ability to excommunicate rulers", "Ownership of all trade routes"], correctIndex: 2),
        MathExamQuestion(id: "his_35_e2",  topicId: 35, prompt: "Where was the Pope based during the medieval period?",                               options: ["Jerusalem", "Paris", "Rome", "Constantinople"],                                                                           correctIndex: 2),
        MathExamQuestion(id: "his_35_e3",  topicId: 35, prompt: "What significant role did monks play in preserving knowledge?",                       options: ["They built libraries only", "They hand-copied ancient books and texts", "They printed books using presses", "They memorised and recited texts aloud"], correctIndex: 1),
        MathExamQuestion(id: "his_35_e4",  topicId: 35, prompt: "What does it mean to be excommunicated?",                                            options: ["To be sent on a Crusade", "To be fined by the king", "To be banned from the Church", "To be exiled from Europe"],        correctIndex: 2),
        MathExamQuestion(id: "his_35_e5",  topicId: 35, prompt: "Which type of building was a large church that served as a symbol of Christian faith?", options: ["Monastery", "Abbey", "Cathedral", "Chapel"],                                                                        correctIndex: 2),
        MathExamQuestion(id: "his_35_e6",  topicId: 35, prompt: "The Catholic Church in the Middle Ages influenced which areas of life?",              options: ["Religion only", "Politics and daily life", "Trade and economics only", "Education only"],                              correctIndex: 1),
        MathExamQuestion(id: "his_35_e7",  topicId: 35, prompt: "Which Pope launched the First Crusade in 1095?",                                     options: ["Pope Gregory VII", "Pope Urban II", "Pope Innocent III", "Pope Clement V"],                                              correctIndex: 1),
        MathExamQuestion(id: "his_35_e8",  topicId: 35, prompt: "What functions did monasteries serve in medieval communities?",                       options: ["Military bases", "Centres of learning, healthcare, and faith", "Royal palaces", "Trading posts"],                        correctIndex: 1),
        MathExamQuestion(id: "his_35_e9",  topicId: 35, prompt: "Notre Dame Cathedral in Paris is an example of which architectural style?",           options: ["Roman", "Baroque", "Gothic", "Byzantine"],                                                                                correctIndex: 2),
        MathExamQuestion(id: "his_35_e10", topicId: 35, prompt: "How did the medieval Catholic Church compare in power to European kings?",            options: ["It had no political power at all", "It was equal to kings", "It was sometimes more powerful than kings", "It always followed royal commands"], correctIndex: 2),
    ],

    36: [
        MathExamQuestion(id: "his_36_e1",  topicId: 36, prompt: "What caused the Black Death?",                                                        options: ["A drought", "A form of plague, mainly bubonic plague", "A volcanic winter", "A war famine"],                              correctIndex: 1),
        MathExamQuestion(id: "his_36_e2",  topicId: 36, prompt: "Approximately how many Europeans died during the Black Death?",                       options: ["1 million", "10 million", "25 million", "75 million"],                                                                    correctIndex: 2),
        MathExamQuestion(id: "his_36_e3",  topicId: 36, prompt: "What was the main purpose of a medieval guild?",                                      options: ["To raise armies for the king", "To regulate trades and protect craftspeople's standards", "To collect taxes for the Church", "To organise pilgrimages"], correctIndex: 1),
        MathExamQuestion(id: "his_36_e4",  topicId: 36, prompt: "What long-term social change did the Black Death help bring about?",                  options: ["Strengthened feudalism", "Led to fewer rights for peasants", "Began to weaken the feudal order", "Ended Christianity in Europe"], correctIndex: 2),
        MathExamQuestion(id: "his_36_e5",  topicId: 36, prompt: "Which of the following best describes a medieval castle?",                            options: ["A religious centre", "A lord's home and defensive fortress", "A market and trade centre", "A monastery"],                 correctIndex: 1),
        MathExamQuestion(id: "his_36_e6",  topicId: 36, prompt: "Peasant life in the Middle Ages was largely organised around:",                       options: ["Long-distance trade", "Farming and the seasons", "Military campaigns", "Church scholarship"],                            correctIndex: 1),
        MathExamQuestion(id: "his_36_e7",  topicId: 36, prompt: "During which years did the Black Death devastate Europe?",                            options: ["1200–1204", "1300–1304", "1347–1351", "1400–1404"],                                                                       correctIndex: 2),
        MathExamQuestion(id: "his_36_e8",  topicId: 36, prompt: "What stages did a craftsman go through in a guild?",                                  options: ["Student, teacher, professor", "Apprentice, journeyman, master", "Serf, freeman, lord", "Novice, monk, abbot"],          correctIndex: 1),
        MathExamQuestion(id: "his_36_e9",  topicId: 36, prompt: "Which disease caused the Black Death?",                                              options: ["Smallpox", "Cholera", "Bubonic plague", "Typhus"],                                                                        correctIndex: 2),
        MathExamQuestion(id: "his_36_e10", topicId: 36, prompt: "How did the Black Death spread so rapidly across Europe?",                            options: ["Through polluted rivers only", "By trade routes, fleas on rats, and close contact", "By air alone", "Through contaminated grain stores only"], correctIndex: 1),
    ],

    37: [
        MathExamQuestion(id: "his_37_e1",  topicId: 37, prompt: "Which Pope launched the First Crusade in 1095?",                                     options: ["Pope Gregory VII", "Pope Urban II", "Pope Innocent III", "Pope Boniface VIII"],                                           correctIndex: 1),
        MathExamQuestion(id: "his_37_e2",  topicId: 37, prompt: "What was the stated religious goal of the Crusades?",                                 options: ["To spread Islam", "To defeat the Byzantine Empire", "To capture Jerusalem from Muslim rule", "To convert the Mongols"],  correctIndex: 2),
        MathExamQuestion(id: "his_37_e3",  topicId: 37, prompt: "During which century did the First Crusade take place?",                             options: ["9th century", "10th century", "11th century", "12th century"],                                                             correctIndex: 2),
        MathExamQuestion(id: "his_37_e4",  topicId: 37, prompt: "What knowledge did Europeans gain from the Islamic world through the Crusades?",      options: ["Nothing  -  the transfer went the other way", "Advanced science, medicine, and mathematics", "New farming techniques from deserts", "The compass and paper only"], correctIndex: 1),
        MathExamQuestion(id: "his_37_e5",  topicId: 37, prompt: "What was Krak des Chevaliers?",                                                       options: ["A sacred mosque in Jerusalem", "An Ottoman palace", "A famous Crusader castle", "A Crusader cathedral"],                 correctIndex: 2),
        MathExamQuestion(id: "his_37_e6",  topicId: 37, prompt: "Overall, were the Crusades a military success for the Crusaders?",                    options: ["Yes, they permanently controlled the Holy Land", "No, they largely failed to hold Jerusalem long-term", "Yes, they defeated all Muslim armies", "No outcome  -  the wars were always a draw"], correctIndex: 1),
        MathExamQuestion(id: "his_37_e7",  topicId: 37, prompt: "How did the Crusades affect trade between Europe and the East?",                      options: ["They destroyed all trade routes", "They opened and stimulated trade routes", "They had no effect on trade", "They shifted trade entirely to Africa"], correctIndex: 1),
        MathExamQuestion(id: "his_37_e8",  topicId: 37, prompt: "Which year did the Crusades effectively end?",                                        options: ["1095", "1187", "1291", "1350"],                                                                                           correctIndex: 2),
        MathExamQuestion(id: "his_37_e9",  topicId: 37, prompt: "What motivated ordinary people to join the Crusades?",                               options: ["Wealth only", "Religious devotion, promise of forgiveness, and adventure", "Orders from their kings only", "Fear of punishment"],  correctIndex: 1),
        MathExamQuestion(id: "his_37_e10", topicId: 37, prompt: "Which famous Muslim leader recaptured Jerusalem from the Crusaders in 1187?",         options: ["Suleiman the Magnificent", "Saladin", "Mehmed II", "Al-Mansur"],                                                         correctIndex: 1),
    ],

    38: [
        MathExamQuestion(id: "his_38_e1",  topicId: 38, prompt: "When did the Western Roman Empire fall, leading to the Byzantine Empire continuing alone?", options: ["376 AD", "410 AD", "476 AD", "527 AD"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_38_e2",  topicId: 38, prompt: "What was the capital city of the Byzantine Empire?",                                  options: ["Rome", "Athens", "Alexandria", "Constantinople"],                                                                         correctIndex: 3),
        MathExamQuestion(id: "his_38_e3",  topicId: 38, prompt: "Which emperor created the Corpus Juris Civilis (body of Roman law)?",                 options: ["Constantine", "Theodosius I", "Justinian I", "Heraclius"],                                                                correctIndex: 2),
        MathExamQuestion(id: "his_38_e4",  topicId: 38, prompt: "What did Justinian's law code influence?",                                            options: ["The Islamic Sharia law", "Legal systems across Europe", "The laws of the Mongol Empire", "Only Byzantine law"],          correctIndex: 1),
        MathExamQuestion(id: "his_38_e5",  topicId: 38, prompt: "The Hagia Sophia was originally built as what type of building?",                     options: ["A royal palace", "A mosque", "A Christian cathedral", "A market hall"],                                                  correctIndex: 2),
        MathExamQuestion(id: "his_38_e6",  topicId: 38, prompt: "Which empire conquered Constantinople in 1453?",                                      options: ["The Mongol Empire", "The Crusaders", "The Ottoman Empire", "The Sassanid Persian Empire"],                               correctIndex: 2),
        MathExamQuestion(id: "his_38_e7",  topicId: 38, prompt: "What form of Christianity did the Byzantine Empire uphold and spread?",               options: ["Roman Catholicism", "Protestantism", "Eastern Orthodox Christianity", "Coptic Christianity"],                            correctIndex: 2),
        MathExamQuestion(id: "his_38_e8",  topicId: 38, prompt: "What cultural legacy did the Byzantines pass on to Slavic peoples?",                  options: ["Islam and Arabic script", "Orthodox Christianity and the Cyrillic alphabet", "Catholicism and Latin", "Feudalism and chivalry"], correctIndex: 1),
        MathExamQuestion(id: "his_38_e9",  topicId: 38, prompt: "For roughly how long did the Byzantine Empire endure?",                               options: ["About 200 years", "About 500 years", "About 750 years", "Over 1,000 years"],                                               correctIndex: 3),
        MathExamQuestion(id: "his_38_e10", topicId: 38, prompt: "What happened to many Byzantine scholars after the fall of Constantinople in 1453?",  options: ["They converted to Islam", "They fled to Italy and helped spark the Renaissance", "They moved to Russia", "They were all enslaved by the Ottomans"], correctIndex: 1),
    ],

        39: [
        MathExamQuestion(id: "his_39_e1",  topicId: 39, prompt: "Which of the following goods was NOT commonly traded on the Silk Road?",                  options: ["Silk", "Spices", "Potatoes", "Glass"],                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_39_e2",  topicId: 39, prompt: "Marco Polo served at the court of which Mongol ruler?",                                   options: ["Genghis Khan", "Timur", "Kublai Khan", "Batu Khan"],                                                            correctIndex: 2),
        MathExamQuestion(id: "his_39_e3",  topicId: 39, prompt: "The city of Samarkand was an important hub on the Silk Road located in modern-day…",     options: ["Iran", "Uzbekistan", "Turkey", "Pakistan"],                                                                     correctIndex: 1),
        MathExamQuestion(id: "his_39_e4",  topicId: 39, prompt: "The Black Death (bubonic plague) is thought to have spread to Europe partly via…",        options: ["Sea trade from Australia", "The Silk Road", "Viking ships", "The Sahara Desert"],                              correctIndex: 1),
        MathExamQuestion(id: "his_39_e5",  topicId: 39, prompt: "Which religion was carried along the Silk Road from the Middle East westward into Persia?", options: ["Hinduism", "Buddhism", "Islam", "Christianity"],                                                             correctIndex: 2),
        MathExamQuestion(id: "his_39_e6",  topicId: 39, prompt: "The Silk Road's sea routes were mainly used by merchants from which civilisation?",       options: ["Roman", "Arab and Indian", "Chinese and Japanese", "Viking"],                                                  correctIndex: 1),
        MathExamQuestion(id: "his_39_e7",  topicId: 39, prompt: "Which of the following best describes the Silk Road?",                                    options: ["A single road paved with stones", "A network of overland and sea trade routes", "A river system", "A modern highway"],         correctIndex: 1),
        MathExamQuestion(id: "his_39_e8",  topicId: 39, prompt: "Paper money originated in China and spread to other parts of the world via the…",        options: ["Atlantic Ocean", "Silk Road", "Mediterranean Sea", "Amazon River"],                                            correctIndex: 1),
        MathExamQuestion(id: "his_39_e9",  topicId: 39, prompt: "The city of Chang'an (modern Xi'an) was the eastern terminus of the Silk Road in which country?", options: ["Japan", "Korea", "India", "China"],                                                             correctIndex: 3),
        MathExamQuestion(id: "his_39_e10", topicId: 39, prompt: "Which technological invention from China spread westward along the Silk Road?",           options: ["The printing press", "Gunpowder", "The steam engine", "The telescope"],                                        correctIndex: 1),
    ],

    40: [
        MathExamQuestion(id: "his_40_e1",  topicId: 40, prompt: "The Magna Carta was signed by which English king?",                                       options: ["King Richard I", "King John", "King Henry VIII", "King Edward I"],                                              correctIndex: 1),
        MathExamQuestion(id: "his_40_e2",  topicId: 40, prompt: "Which ancient Greek philosopher wrote extensively about different forms of government?",   options: ["Socrates", "Plato", "Aristotle", "Herodotus"],                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_40_e3",  topicId: 40, prompt: "The English Bill of Rights was passed in which year?",                                    options: ["1215", "1628", "1689", "1776"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_40_e4",  topicId: 40, prompt: "In ancient Athens, who was allowed to participate in democracy?",                         options: ["All residents", "All men and women", "Free male citizens only", "Only the wealthy"],                            correctIndex: 2),
        MathExamQuestion(id: "his_40_e5",  topicId: 40, prompt: "What French document, inspired by Enlightenment ideas, declared the rights of citizens in 1789?", options: ["The Magna Carta", "The Code Napoleon", "Declaration of the Rights of Man and Citizen", "The French Constitution"], correctIndex: 2),
        MathExamQuestion(id: "his_40_e6",  topicId: 40, prompt: "The separation of powers in a constitutional government divides authority among how many branches?", options: ["Two", "Three", "Four", "Five"],                                                              correctIndex: 1),
        MathExamQuestion(id: "his_40_e7",  topicId: 40, prompt: "Which philosopher wrote 'The Social Contract', influencing constitutional ideas?",        options: ["John Locke", "Voltaire", "Jean-Jacques Rousseau", "Thomas Hobbes"],                                            correctIndex: 2),
        MathExamQuestion(id: "his_40_e8",  topicId: 40, prompt: "The Roman Republic had two annually elected leaders called…",                             options: ["Emperors", "Senators", "Consuls", "Tribunes"],                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_40_e9",  topicId: 40, prompt: "What is the term for the first ten amendments to the US Constitution?",                   options: ["The Articles of Confederation", "The Bill of Rights", "The Declaration of Independence", "The Federalist Papers"], correctIndex: 1),
        MathExamQuestion(id: "his_40_e10", topicId: 40, prompt: "Which of these is a key principle of constitutional government?",                         options: ["The ruler decides all laws alone", "No one is above the law", "Courts have no power", "Citizens have no rights"], correctIndex: 1),
    ],

    41: [
        MathExamQuestion(id: "his_41_e1",  topicId: 41, prompt: "In which country did the women's suffrage movement first achieve national voting rights?", options: ["USA", "UK", "New Zealand", "Australia"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_41_e2",  topicId: 41, prompt: "Which English suffragette was killed when she ran onto the Derby racecourse in 1913?",    options: ["Emmeline Pankhurst", "Emily Wilding Davison", "Millicent Fawcett", "Christabel Pankhurst"],                   correctIndex: 1),
        MathExamQuestion(id: "his_41_e3",  topicId: 41, prompt: "Cleopatra was the last ruler of which ancient dynasty?",                                  options: ["Ptolemaic Dynasty", "Ramessid Dynasty", "Seleucid Dynasty", "Nubian Dynasty"],                                correctIndex: 0),
        MathExamQuestion(id: "his_41_e4",  topicId: 41, prompt: "Joan of Arc was eventually captured and executed by burning at the stake in which city?", options: ["Paris", "Orléans", "Rouen", "Calais"],                                                                        correctIndex: 2),
        MathExamQuestion(id: "his_41_e5",  topicId: 41, prompt: "Who was the first woman to win a Nobel Prize (in 1903)?",                                 options: ["Florence Nightingale", "Marie Curie", "Emmeline Pankhurst", "Rosa Parks"],                                    correctIndex: 1),
        MathExamQuestion(id: "his_41_e6",  topicId: 41, prompt: "Women in the United States gained the constitutional right to vote in which year?",       options: ["1913", "1920", "1928", "1945"],                                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_41_e7",  topicId: 41, prompt: "Which ancient kingdom was ruled by Queen Hatshepsut for around 20 years?",                options: ["Babylon", "Persia", "Egypt", "Carthage"],                                                                       correctIndex: 2),
        MathExamQuestion(id: "his_41_e8",  topicId: 41, prompt: "Elizabeth I of England is associated with which artistic and cultural period?",           options: ["The Dark Ages", "The Elizabethan Renaissance", "The Romantic Period", "The Industrial Revolution"],          correctIndex: 1),
        MathExamQuestion(id: "his_41_e9",  topicId: 41, prompt: "The suffragist movement in the UK was led by which organisation's founder?",              options: ["Emmeline Pankhurst (WSPU)", "Queen Victoria", "Florence Nightingale", "Mary Wollstonecraft"],                correctIndex: 0),
        MathExamQuestion(id: "his_41_e10", topicId: 41, prompt: "Which Rosa Parks protest in 1955 sparked the US Civil Rights Movement's momentum?",       options: ["She marched on Washington", "She refused to give up her seat on a bus", "She led a strike", "She ran for Congress"], correctIndex: 1),
    ],

    42: [
        MathExamQuestion(id: "his_42_e1",  topicId: 42, prompt: "The university city of Timbuktu was a centre of learning in which empire?",               options: ["Mali", "Songhai", "Kush", "Axum"],                                                                              correctIndex: 1),
        MathExamQuestion(id: "his_42_e2",  topicId: 42, prompt: "The Kingdom of Kush was located along which major African river?",                        options: ["Congo River", "Zambezi River", "Nile River", "Niger River"],                                                   correctIndex: 2),
        MathExamQuestion(id: "his_42_e3",  topicId: 42, prompt: "Mansa Musa's famous pilgrimage to Mecca took place in approximately which year?",         options: ["1224", "1280", "1324", "1380"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_42_e4",  topicId: 42, prompt: "What architectural structures, similar to Egyptian ones, were built in the Kingdom of Kush?", options: ["Coliseums", "Ziggurats", "Pyramids", "Pagodas"],                                                        correctIndex: 2),
        MathExamQuestion(id: "his_42_e5",  topicId: 42, prompt: "The Swahili Coast cities on East Africa's coast became wealthy through trade with which regions?", options: ["Only with West Africa", "The Americas", "Arabia, India, and China", "Only with Europe"],         correctIndex: 2),
        MathExamQuestion(id: "his_42_e6",  topicId: 42, prompt: "Great Zimbabwe is estimated to have been built between which centuries?",                  options: ["5th–7th century", "8th–10th century", "11th–15th century", "16th–18th century"],                              correctIndex: 2),
        MathExamQuestion(id: "his_42_e7",  topicId: 42, prompt: "The Mali Empire's founding is traditionally credited to which ruler?",                    options: ["Mansa Musa", "Sundiata Keita", "Askia Muhammad", "Sunni Ali"],                                                  correctIndex: 1),
        MathExamQuestion(id: "his_42_e8",  topicId: 42, prompt: "Askia Muhammad was a ruler of which African empire?",                                     options: ["Mali", "Kush", "Songhai", "Great Zimbabwe"],                                                                    correctIndex: 2),
        MathExamQuestion(id: "his_42_e9",  topicId: 42, prompt: "Which trade commodity was so valuable in the Saharan trade that it was sometimes worth its weight in gold?", options: ["Iron", "Salt", "Copper", "Ivory"],                                               correctIndex: 1),
        MathExamQuestion(id: "his_42_e10", topicId: 42, prompt: "The Axum Kingdom, which traded along the Red Sea, is in the region of modern-day…",       options: ["Nigeria", "Mali", "Ethiopia and Eritrea", "Zimbabwe"],                                                         correctIndex: 2),
    ],

    43: [
        MathExamQuestion(id: "his_43_e1",  topicId: 43, prompt: "The Aztec city of Tenochtitlan was built on…",                                            options: ["A mountain top", "A swampy lake island", "A coastal plain", "A desert oasis"],                                correctIndex: 1),
        MathExamQuestion(id: "his_43_e2",  topicId: 43, prompt: "The Maya writing system used symbols called…",                                            options: ["Cuneiform", "Hieroglyphs", "Glyphs", "Runes"],                                                                  correctIndex: 2),
        MathExamQuestion(id: "his_43_e3",  topicId: 43, prompt: "The Inca road network stretched approximately how many kilometres?",                      options: ["1,000 km", "5,000 km", "40,000 km", "100,000 km"],                                                              correctIndex: 2),
        MathExamQuestion(id: "his_43_e4",  topicId: 43, prompt: "Which crop, first cultivated by ancient Americans, became a global food staple?",         options: ["Rice", "Wheat", "Corn (maize)", "Barley"],                                                                      correctIndex: 2),
        MathExamQuestion(id: "his_43_e5",  topicId: 43, prompt: "The Aztec sun stone (calendar stone) was dedicated to which deity?",                      options: ["Quetzalcoatl", "Huitzilopochtli", "Tonatiuh (the sun god)", "Tlaloc"],                                         correctIndex: 2),
        MathExamQuestion(id: "his_43_e6",  topicId: 43, prompt: "The Spanish conquest of the Aztec Empire was completed in which year?",                   options: ["1492", "1521", "1533", "1598"],                                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_43_e7",  topicId: 43, prompt: "The Maya civilisation experienced a mysterious collapse around which century?",            options: ["5th century AD", "7th century AD", "9th century AD", "12th century AD"],                                      correctIndex: 2),
        MathExamQuestion(id: "his_43_e8",  topicId: 43, prompt: "The Inca used a system of knotted cords called 'quipu' for what purpose?",                options: ["Musical instruments", "Recording numerical data", "Fishing", "Communication by smell"],                      correctIndex: 1),
        MathExamQuestion(id: "his_43_e9",  topicId: 43, prompt: "Which of these was the Aztec capital, now underlying modern Mexico City?",                options: ["Chichen Itza", "Machu Picchu", "Cuzco", "Tenochtitlan"],                                                       correctIndex: 3),
        MathExamQuestion(id: "his_43_e10", topicId: 43, prompt: "The Inca empire called itself 'Tawantinsuyu', meaning…",                                  options: ["Land of the Sun", "Four Quarters (of the world)", "Empire of the Mountain", "Kingdom of Gold"],               correctIndex: 1),
    ],

    44: [
        MathExamQuestion(id: "his_44_e1",  topicId: 44, prompt: "Genghis Khan united the Mongol tribes by approximately which year?",                      options: ["1162", "1189", "1206", "1227"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_44_e2",  topicId: 44, prompt: "The Mongols destroyed which great Islamic cultural capital in 1258?",                     options: ["Cairo", "Baghdad", "Damascus", "Mecca"],                                                                        correctIndex: 1),
        MathExamQuestion(id: "his_44_e3",  topicId: 44, prompt: "Kublai Khan's Yuan Dynasty ruled which country?",                                         options: ["Persia", "Russia", "China", "Korea"],                                                                           correctIndex: 2),
        MathExamQuestion(id: "his_44_e4",  topicId: 44, prompt: "The Mongols twice attempted to invade Japan but were repelled by what?",                  options: ["A powerful Japanese army", "Storms called 'kamikaze' (divine winds)", "The Great Wall", "A naval blockade"],  correctIndex: 1),
        MathExamQuestion(id: "his_44_e5",  topicId: 44, prompt: "Which Mongol leader ruled the Golden Horde, controlling much of Russia?",                 options: ["Kublai Khan", "Ögedei Khan", "Batu Khan", "Hulagu Khan"],                                                       correctIndex: 2),
        MathExamQuestion(id: "his_44_e6",  topicId: 44, prompt: "The Mongol Empire was eventually divided into smaller states called…",                    options: ["Provinces", "Khanates", "Sultanates", "Satrapies"],                                                             correctIndex: 1),
        MathExamQuestion(id: "his_44_e7",  topicId: 44, prompt: "Genghis Khan died in which year?",                                                        options: ["1206", "1215", "1227", "1241"],                                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_44_e8",  topicId: 44, prompt: "The Mongol 'yurt' was a portable dwelling that reflected which aspect of their culture?", options: ["Their love of architecture", "Their nomadic lifestyle", "Their religious practices", "Their farming traditions"], correctIndex: 1),
        MathExamQuestion(id: "his_44_e9",  topicId: 44, prompt: "The Mongol success in conquering vast territories was largely due to their mastery of…", options: ["Siege weapons and cavalry tactics", "Naval warfare", "Gunpowder artillery alone", "Infantry shields"],      correctIndex: 0),
        MathExamQuestion(id: "his_44_e10", topicId: 44, prompt: "What did the Mongols use as their primary weapon from horseback?",                        options: ["Spear", "Sword", "Composite bow", "Javelin"],                                                                   correctIndex: 2),
    ],

    45: [
        MathExamQuestion(id: "his_45_e1",  topicId: 45, prompt: "Which Ottoman sultan conquered Constantinople in 1453?",                                  options: ["Suleiman I", "Selim I", "Mehmed II", "Murad II"],                                                               correctIndex: 2),
        MathExamQuestion(id: "his_45_e2",  topicId: 45, prompt: "The Ottoman legal system was reformed under Suleiman, earning him the title 'Kanuni', meaning…", options: ["The Conqueror", "The Lawgiver", "The Just", "The Great"],                                       correctIndex: 1),
        MathExamQuestion(id: "his_45_e3",  topicId: 45, prompt: "Which famous architectural wonder was built in Istanbul under Suleiman's reign?",         options: ["The Blue Mosque", "Hagia Sophia", "Topkapi Palace", "The Süleymaniye Mosque"],                                correctIndex: 3),
        MathExamQuestion(id: "his_45_e4",  topicId: 45, prompt: "The Ottoman janissaries were…",                                                           options: ["Arab cavalry fighters", "Elite infantry soldiers", "Naval admirals", "Tax collectors"],                      correctIndex: 1),
        MathExamQuestion(id: "his_45_e5",  topicId: 45, prompt: "Which battle in 1571 saw the Ottoman navy defeated by a Christian alliance?",             options: ["Battle of Vienna", "Battle of Lepanto", "Battle of Mohács", "Battle of Kosovo"],                              correctIndex: 1),
        MathExamQuestion(id: "his_45_e6",  topicId: 45, prompt: "The millet system in the Ottoman Empire allowed non-Muslim groups to…",                   options: ["Convert to Islam immediately", "Govern their own community affairs", "Leave the empire freely", "Own land outside their region"], correctIndex: 1),
        MathExamQuestion(id: "his_45_e7",  topicId: 45, prompt: "The Ottoman Empire sided with which powers in World War I?",                              options: ["Britain, France, and Russia", "The Central Powers (Germany and Austria-Hungary)", "The USA and Japan", "Italy and Greece"], correctIndex: 1),
        MathExamQuestion(id: "his_45_e8",  topicId: 45, prompt: "Who founded the modern Republic of Turkey from the ruins of the Ottoman Empire?",        options: ["Enver Pasha", "Abdul Hamid II", "Mustafa Kemal Atatürk", "Mehmed VI"],                                         correctIndex: 2),
        MathExamQuestion(id: "his_45_e9",  topicId: 45, prompt: "The Ottoman siege of Vienna in 1683 failed, marking the beginning of…",                  options: ["Ottoman expansion into Western Europe", "The decline of Ottoman power in Europe", "The fall of the Byzantine Empire", "The start of the Crusades"], correctIndex: 1),
        MathExamQuestion(id: "his_45_e10", topicId: 45, prompt: "The Ottoman Empire controlled the eastern Mediterranean trade routes, which impacted European powers by…", options: ["Making trade cheaper", "Motivating them to find alternative sea routes to Asia", "Stopping all trade with Asia", "Uniting Europe against the Mongols"], correctIndex: 1),
    ],

    46: [
        MathExamQuestion(id: "his_46_e1",  topicId: 46, prompt: "Which Soviet leader introduced 'glasnost' and 'perestroika', leading to the USSR's dissolution?", options: ["Leonid Brezhnev", "Nikita Khrushchev", "Mikhail Gorbachev", "Boris Yeltsin"],                   correctIndex: 2),
        MathExamQuestion(id: "his_46_e2",  topicId: 46, prompt: "The September 11 attacks were carried out by which extremist group?",                     options: ["The Taliban", "Al-Qaeda", "ISIS", "Hezbollah"],                                                                 correctIndex: 1),
        MathExamQuestion(id: "his_46_e3",  topicId: 46, prompt: "Which country did the US-led coalition invade in 2001 in response to harbouring Al-Qaeda?", options: ["Iraq", "Iran", "Afghanistan", "Pakistan"],                                                                 correctIndex: 2),
        MathExamQuestion(id: "his_46_e4",  topicId: 46, prompt: "China's rapid economic growth since the 1980s was partly due to which policy shift?",    options: ["Complete isolation from world trade", "Communist collective farming", "Market-oriented economic reforms", "Military conquest of neighbours"], correctIndex: 2),
        MathExamQuestion(id: "his_46_e5",  topicId: 46, prompt: "The World Trade Organization (WTO) was established in 1995 to promote…",                 options: ["Military alliances", "International free trade", "Nuclear disarmament", "Global healthcare"],                 correctIndex: 1),
        MathExamQuestion(id: "his_46_e6",  topicId: 46, prompt: "The European Union expanded significantly in 2004 by admitting how many new members?",   options: ["3", "5", "10", "15"],                                                                                          correctIndex: 2),
        MathExamQuestion(id: "his_46_e7",  topicId: 46, prompt: "The UK's vote to leave the European Union in 2016 is known as…",                         options: ["Frexit", "Brexit", "Grexit", "Urexit"],                                                                         correctIndex: 1),
        MathExamQuestion(id: "his_46_e8",  topicId: 46, prompt: "The global financial crisis of 2007–2008 began with a collapse in which country's housing market?", options: ["Japan", "Germany", "China", "United States"],                                              correctIndex: 3),
        MathExamQuestion(id: "his_46_e9",  topicId: 46, prompt: "Which conflict, beginning in 2011, became a major humanitarian crisis affecting millions of refugees?", options: ["The Iraq War", "The Syrian Civil War", "The Libyan uprising", "The Yemen crisis"],       correctIndex: 1),
        MathExamQuestion(id: "his_46_e10", topicId: 46, prompt: "The concept of a 'unipolar world' after 1991 referred to which country's dominant global power?", options: ["Russia", "China", "The United States", "The European Union"],                              correctIndex: 2),
    ],

        // MARK: Topic 47 Exam — Big Bang & Early Earth
        47: [
            MathExamQuestion(id: "his_47_e1", topicId: 47, prompt: "How old is the universe according to current scientific understanding?", options: ["4.6 billion years", "13.8 billion years", "1 trillion years", "500 million years"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e2", topicId: 47, prompt: "What force caused gas clouds to collapse and form stars?", options: ["Magnetism", "Friction", "Gravity", "Electricity"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e3", topicId: 47, prompt: "How old is the Earth?", options: ["13.8 billion years", "4.6 billion years", "1 billion years", "500 million years"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e4", topicId: 47, prompt: "Which scientist proved galaxies are moving away from us?", options: ["Albert Einstein", "Isaac Newton", "Edwin Hubble", "Charles Darwin"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e5", topicId: 47, prompt: "What does the Big Bang theory describe?", options: ["The first nuclear weapon", "The origin and expansion of the universe", "The formation of the Moon", "The extinction of dinosaurs"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e6", topicId: 47, prompt: "What formed on early Earth that made life possible?", options: ["Deserts and sand dunes", "Oceans and a protective atmosphere", "Large forests immediately", "Polar ice caps first"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e7", topicId: 47, prompt: "Our Solar System formed approximately how long ago?", options: ["13.8 billion years", "1 billion years", "4.6 billion years", "200 million years"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e8", topicId: 47, prompt: "The Cosmic Microwave Background (CMB) is evidence for…", options: ["Black holes", "The Big Bang", "The end of the universe", "Dark matter only"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e9", topicId: 47, prompt: "What were the first atoms created after the Big Bang?", options: ["Iron and carbon", "Hydrogen and helium", "Oxygen and nitrogen", "Gold and silver"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e10", topicId: 47, prompt: "Hubble's observation that galaxies are receding means the universe is…", options: ["Contracting", "Static", "Expanding", "Rotating"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e11", topicId: 47, prompt: "What is a nebula?", options: ["A type of planet", "A cloud of gas and dust in space from which stars form", "A kind of galaxy", "A moon of Jupiter"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e12", topicId: 47, prompt: "Why did early Earth's surface cool down over time?", options: ["It moved farther from the Sun", "Volcanoes stopped erupting", "Heat radiated into space as Earth lost energy", "The Moon blocked sunlight"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e13", topicId: 47, prompt: "The first stars that formed in the universe were mainly made of…", options: ["Iron and nickel", "Carbon and oxygen", "Hydrogen and helium", "Uranium and plutonium"], correctIndex: 2),
            MathExamQuestion(id: "his_47_e14", topicId: 47, prompt: "Approximately how long after the Big Bang did the first stars form?", options: ["Immediately", "A few hundred million years", "4.6 billion years", "13 billion years"], correctIndex: 1),
            MathExamQuestion(id: "his_47_e15", topicId: 47, prompt: "The concept that the universe had a beginning is called…", options: ["The Steady State Theory", "The Big Bang Theory", "The Expanding Universe", "Relativity"], correctIndex: 1),
        ],

        // MARK: Topic 48 Exam — Dinosaurs & Prehistoric Life
        48: [
            MathExamQuestion(id: "his_48_e1", topicId: 48, prompt: "The Mesozoic Era is divided into three periods. Which is NOT one of them?", options: ["Triassic", "Jurassic", "Permian", "Cretaceous"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e2", topicId: 48, prompt: "Which mass extinction event ended the non-bird dinosaurs?", options: ["The Great Oxygenation Event", "The Permian-Triassic extinction", "The Cretaceous-Palaeogene extinction (66 mya)", "The Late Devonian extinction"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e3", topicId: 48, prompt: "Which group of animals descended directly from theropod dinosaurs?", options: ["Crocodilians", "Lizards", "Birds", "Mammals"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e4", topicId: 48, prompt: "What was the Chicxulub impactor?", options: ["A type of dinosaur", "The asteroid/meteor that struck Earth ~66 mya", "A prehistoric ocean", "An ancient volcano"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e5", topicId: 48, prompt: "Approximately how long did the Mesozoic Era last?", options: ["66 million years", "186 million years", "500 million years", "3.5 billion years"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e6", topicId: 48, prompt: "The first life on Earth appeared in…", options: ["Ice", "The oceans", "In the sky", "Underground caves"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e7", topicId: 48, prompt: "Dinosaurs first appeared in which geological period?", options: ["Cretaceous", "Jurassic", "Triassic", "Permian"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e8", topicId: 48, prompt: "Which of these was a flying reptile that lived alongside dinosaurs?", options: ["Pterodactyl/Pterosaur", "Eagle", "Bat", "Dragonfly"], correctIndex: 0),
            MathExamQuestion(id: "his_48_e9", topicId: 48, prompt: "The Great Oxygenation Event (2.4 billion years ago) was caused by…", options: ["Volcanic eruptions", "Photosynthetic cyanobacteria releasing oxygen", "Meteor impacts", "Cooling of the oceans"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e10", topicId: 48, prompt: "What type of dinosaur was the Brachiosaurus?", options: ["A carnivore (meat-eater)", "A herbivore (plant-eater)", "An omnivore", "An insectivore"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e11", topicId: 48, prompt: "Approximately when did multicellular life first appear on Earth?", options: ["600 million years ago", "66 million years ago", "4.6 billion years ago", "3,000 years ago"], correctIndex: 0),
            MathExamQuestion(id: "his_48_e12", topicId: 48, prompt: "Which era came AFTER the Mesozoic Era?", options: ["Palaeozoic Era", "Cenozoic Era", "Proterozoic Era", "Hadean Era"], correctIndex: 1),
            MathExamQuestion(id: "his_48_e13", topicId: 48, prompt: "Amber sometimes contains preserved ancient DNA from which organisms?", options: ["Large dinosaurs", "Fish", "Insects and plant material", "Early humans"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e14", topicId: 48, prompt: "The Palaeozoic Era saw the first appearance of what kind of life on land?", options: ["Dinosaurs", "Mammals", "Amphibians and plants", "Humans"], correctIndex: 2),
            MathExamQuestion(id: "his_48_e15", topicId: 48, prompt: "T. rex lived in which geological period?", options: ["Triassic", "Jurassic", "Cretaceous", "Permian"], correctIndex: 2),
        ],

        // MARK: Topic 49 Exam — Early Humans
        49: [
            MathExamQuestion(id: "his_49_e1", topicId: 49, prompt: "The scientific name for modern humans is…", options: ["Homo erectus", "Homo sapiens", "Homo habilis", "Homo neanderthalensis"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e2", topicId: 49, prompt: "Which continent is considered the birthplace of Homo sapiens?", options: ["Asia", "Europe", "Australia", "Africa"], correctIndex: 3),
            MathExamQuestion(id: "his_49_e3", topicId: 49, prompt: "Approximately what percentage of non-African people's DNA comes from Neanderthals?", options: ["20–30%", "Less than 1%", "1–4%", "50%"], correctIndex: 2),
            MathExamQuestion(id: "his_49_e4", topicId: 49, prompt: "What enabled early humans to survive in colder climates and cook food?", options: ["Clothing made of nylon", "Fire", "Iron tools", "Farming"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e5", topicId: 49, prompt: "'Out of Africa' theory states that Homo sapiens originated in Africa and then…", options: ["Stayed in Africa permanently", "Migrated to populate the rest of the world", "Evolved separately on every continent", "Were brought to other continents by aliens"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e6", topicId: 49, prompt: "The Lascaux cave paintings in France (c.17,000 years old) were made by…", options: ["Neanderthals", "Homo erectus", "Homo sapiens (Cro-Magnon people)", "Ancient Romans"], correctIndex: 2),
            MathExamQuestion(id: "his_49_e7", topicId: 49, prompt: "Homo habilis is notable for being one of the first hominins to…", options: ["Use fire", "Speak a language", "Use stone tools", "Build houses"], correctIndex: 2),
            MathExamQuestion(id: "his_49_e8", topicId: 49, prompt: "Which factor most enabled early humans to spread across the globe?", options: ["They could fly", "Adaptability — using tools, clothing and fire", "Farming before migration", "They lived in the sea"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e9", topicId: 49, prompt: "Neanderthals went extinct approximately…", options: ["10,000 years ago", "40,000 years ago", "200,000 years ago", "1 million years ago"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e10", topicId: 49, prompt: "The study of ancient human fossils and remains is part of…", options: ["Astronomy", "Palaeoanthropology", "Geology", "Economics"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e11", topicId: 49, prompt: "Homo erectus is significant because it was the first hominin to…", options: ["Write language", "Leave Africa and spread to Asia and Europe", "Build permanent cities", "Invent farming"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e12", topicId: 49, prompt: "What was the primary diet of Palaeolithic hunter-gatherers?", options: ["Only farmed grain", "Wild animals, fish, fruits, nuts and roots", "Only meat from livestock", "Domesticated vegetables"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e13", topicId: 49, prompt: "The term 'Anthropocene' refers to…", options: ["The era of dinosaurs", "The current epoch, defined by significant human impact on Earth", "The Stone Age", "The Big Bang"], correctIndex: 1),
            MathExamQuestion(id: "his_49_e14", topicId: 49, prompt: "Mitochondrial DNA studies show that all modern humans share a common female ancestor nicknamed…", options: ["Eve", "Lucy", "Cleopatra", "Nefertiti"], correctIndex: 0),
            MathExamQuestion(id: "his_49_e15", topicId: 49, prompt: "Lucy (Australopithecus afarensis) was significant because she showed early hominins were…", options: ["Using complex tools", "Walking upright (bipedal)", "Living in groups of thousands", "Making art"], correctIndex: 1),
        ],

        // MARK: Topic 50 Exam — The Stone Age
        50: [
            MathExamQuestion(id: "his_50_e1", topicId: 50, prompt: "What mineral was most commonly used for Stone Age tools?", options: ["Quartz", "Obsidian", "Flint", "Marble"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e2", topicId: 50, prompt: "Approximately when did the Stone Age begin?", options: ["10,000 years ago", "3.3 million years ago", "500,000 years ago", "1 billion years ago"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e3", topicId: 50, prompt: "The Neolithic Revolution was significant because it introduced…", options: ["Metal tools", "Writing systems", "Agriculture and permanent settlements", "The use of fire"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e4", topicId: 50, prompt: "Stonehenge is located in which modern-day country?", options: ["France", "Ireland", "England", "Scotland"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e5", topicId: 50, prompt: "The first farming communities appeared in which region around 10,000 BC?", options: ["Northern Europe", "South America", "The Fertile Crescent (Mesopotamia)", "East Asia only"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e6", topicId: 50, prompt: "Palaeolithic literally means…", options: ["New Stone", "Old Stone", "Iron Age", "Bronze Period"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e7", topicId: 50, prompt: "Which of these was a key development of the Neolithic period?", options: ["Invention of writing", "Smelting of metals", "Pottery and weaving", "The printing press"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e8", topicId: 50, prompt: "Before farming, Stone Age people were nomadic. This means they…", options: ["Built stone houses", "Moved from place to place following food sources", "Traded goods across seas", "Worshipped the sun"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e9", topicId: 50, prompt: "The domestication of animals such as dogs, goats and cattle began in which period?", options: ["Palaeolithic", "Mesolithic", "Neolithic", "Bronze Age"], correctIndex: 2),
            MathExamQuestion(id: "his_50_e10", topicId: 50, prompt: "Megalithic structures (like Stonehenge) were likely built for which purpose?", options: ["Trade warehouses", "Astronomical observation and ritual ceremonies", "Military fortresses", "Schools"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e11", topicId: 50, prompt: "The Mesolithic period bridged the gap between…", options: ["Bronze and Iron Age", "Palaeolithic and Neolithic", "Stone Age and Roman times", "Ice Age and Industrial Revolution"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e12", topicId: 50, prompt: "What evidence do archaeologists use to study Stone Age people?", options: ["Written records", "Stone tools, cave art, bones and pottery", "Newspaper articles", "Photographs"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e13", topicId: 50, prompt: "What role did the bow and arrow play for Stone Age people?", options: ["Religious ceremony", "A more efficient way to hunt at distance", "Decoration only", "Building shelters"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e14", topicId: 50, prompt: "Why did early farming allow populations to grow?", options: ["People worked less", "Reliable food supply supported more people in one place", "Farming required fewer people", "Animals were no longer needed"], correctIndex: 1),
            MathExamQuestion(id: "his_50_e15", topicId: 50, prompt: "What happened to many large animals (megafauna) like woolly mammoths during the late Stone Age?", options: ["They evolved into modern elephants only", "They went extinct, partly due to human hunting and climate change", "They migrated to Africa", "They grew smaller over time"], correctIndex: 1),
        ],

        // MARK: Topic 51 Exam — Bronze Age & Iron Age
        51: [
            MathExamQuestion(id: "his_51_e1", topicId: 51, prompt: "Bronze is an alloy. An alloy is…", options: ["A pure metal", "A mixture of two or more metals", "A type of stone", "A precious gem"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e2", topicId: 51, prompt: "The invention of bronze was important because it created tools that were…", options: ["Lighter than stone", "Stronger and sharper than stone tools", "Cheaper than iron", "Available everywhere"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e3", topicId: 51, prompt: "The first writing system (cuneiform) was invented during the…", options: ["Stone Age", "Bronze Age", "Iron Age", "Medieval period"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e4", topicId: 51, prompt: "Why was iron superior to bronze for tools and weapons?", options: ["Iron is rarer and therefore more valuable", "Iron is harder and the ore was more widely available", "Iron is lighter in weight", "Iron is easier to melt"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e5", topicId: 51, prompt: "The 'Bronze Age Collapse' (c.1,200 BC) was characterised by…", options: ["The invention of bronze", "Widespread collapse of Bronze Age civilisations across the Eastern Mediterranean", "The rise of the Roman Empire", "The discovery of iron"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e6", topicId: 51, prompt: "Which ancient civilisations flourished during the Bronze Age?", options: ["The Greeks and Romans only", "Egypt, Mesopotamia, the Indus Valley and China", "The Vikings and Celts", "Medieval Europeans"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e7", topicId: 51, prompt: "Iron smelting requires very high temperatures. This meant…", options: ["Only desert regions could smelt iron", "Advanced furnace technology (bloomeries) was needed", "Iron was available everywhere instantly", "Only coastal people could make iron"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e8", topicId: 51, prompt: "How did the Iron Age transform agriculture?", options: ["People stopped farming", "Iron ploughs could break harder soil, increasing crop yields", "Farmers used iron to irrigate fields", "Animals were replaced by iron machines"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e9", topicId: 51, prompt: "Which culture is particularly associated with the Iron Age in Europe?", options: ["The Romans", "The Celts", "The Egyptians", "The Greeks"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e10", topicId: 51, prompt: "The Bronze Age saw the first rise of…", options: ["Stone tools", "Written laws and organised cities (city-states)", "Democratic government", "Gunpowder weapons"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e11", topicId: 51, prompt: "The Code of Hammurabi (c.1,754 BC) was an early example of…", options: ["A Bronze Age trade agreement", "Written law governing society", "A religious text", "A farming calendar"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e12", topicId: 51, prompt: "What was a 'hill fort', common in the Iron Age?", options: ["A mountain used for worship", "A fortified settlement on high ground for defence", "A palace for kings", "An underground mine"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e13", topicId: 51, prompt: "The Iron Age in Britain ended with…", options: ["The Norman Conquest", "The Roman invasion (43 AD)", "The Viking raids", "The Black Death"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e14", topicId: 51, prompt: "Bronze Age trade routes stretched across continents, exchanging…", options: ["Only food", "Tin, copper, gold and luxury goods", "Only slaves", "Only weapons"], correctIndex: 1),
            MathExamQuestion(id: "his_51_e15", topicId: 51, prompt: "The wheel was invented during which age?", options: ["Stone Age", "Bronze Age", "Iron Age", "Medieval period"], correctIndex: 1),
        ],
    ]
    // MARK: - Helpers

    static func topic(for id: Int) -> HisTopicDefinition? {
        topics.first { $0.id == id }
    }

    static func topicTitle(for id: Int) -> String {
        topic(for: id)?.introTitle ?? "Topic \(id)"
    }

    static func hasContent(for topicId: Int) -> Bool {
        topics.contains { $0.id == topicId }
    }

    static func hasQuestions(for topicId: Int) -> Bool {
        practiceQuestionsByTopic[topicId] != nil
    }

    static var availableTopicIds: [Int] {
        topics.map(\.id)
    }

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
        let endIndex = min(startIndex + 5, all.count)
        guard startIndex < endIndex else { return Array(all.prefix(5)) }
        return Array(all[startIndex..<endIndex])
    }

    static func examQuestions(for topicId: Int) -> [MathExamQuestion] {
        examQuestionsByTopic[topicId] ?? []
    }

    static func minimumPassScore(for topicId: Int) -> Int {
        return 4
    }
}