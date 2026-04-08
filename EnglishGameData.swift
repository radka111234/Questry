import Foundation

// MARK: - Topic Definition
struct EngTopicDefinition {
    let id: Int
    let nodeTitle: String
    let introTitle: String
    let introText: String
    let exampleText: String
    let iconSystemName: String
    let gradeLabel: String
}

// MARK: - EnglishGameData (Topics 1-35)
enum EnglishGameData {

    static let questionsPerQuest = 5

    // MARK: - Topics

    static let topics: [EngTopicDefinition] = [

        EngTopicDefinition(
            id: 1, nodeTitle: "The Alphabet",
            introTitle: "The Alphabet & Letter Sounds Quest",
            introText: "The English alphabet has 26 letters. Each letter makes one or more sounds. Knowing letter sounds helps you read and spell words.",
            exampleText: "Example:\n\n🐱 'C' says /k/  -  Cat\n🐶 'D' says /d/  -  Dog\n🐸 'F' says /f/  -  Frog",
            iconSystemName: "abc", gradeLabel: "Grade 1"
        ),
        EngTopicDefinition(
            id: 2, nodeTitle: "Short Vowels",
            introTitle: "Short Vowels & CVC Words Quest",
            introText: "Vowels are the letters A, E, I, O, and U. Short vowels make quick, clipped sounds. CVC words follow a consonant-vowel-consonant pattern like 'cat' or 'bug'.",
            exampleText: "Example:\n\n🐱 cat  (a = short a)\n🐔 hen  (e = short e)\n🐖 pig  (i = short i)\n🐕 dog  (o = short o)\n🐛 bug  (u = short u)",
            iconSystemName: "textformat.abc", gradeLabel: "Grade 1"
        ),
        EngTopicDefinition(
            id: 3, nodeTitle: "Sight Words",
            introTitle: "Sight Words Quest",
            introText: "Sight words are common words you should recognise instantly without sounding them out. Learning these words makes reading much faster and easier.",
            exampleText: "Example sight words:\n\n👀 the  •  is  •  are  •  was\nwere  •  said  •  have  •  they",
            iconSystemName: "eye.fill", gradeLabel: "Grade 1"
        ),
        EngTopicDefinition(
            id: 4, nodeTitle: "Simple Sentences",
            introTitle: "Simple Sentences Quest",
            introText: "A sentence is a group of words that expresses a complete thought. Every sentence needs a subject (who or what) and a predicate (what they do). Sentences start with a capital letter and end with a punctuation mark.",
            exampleText: "Example:\n\n✅ The dog runs fast.\n✅ I like apples. 🍎\n❌ runs fast. (missing subject)\n❌ the dog (no verb or ending)",
            iconSystemName: "text.bubble.fill", gradeLabel: "Grade 1"
        ),
        EngTopicDefinition(
            id: 5, nodeTitle: "Rhyming",
            introTitle: "Rhyming & Word Families Quest",
            introText: "Rhyming words share the same ending sound. Word families are groups of words that share a common pattern or ending. Recognising patterns helps you read new words quickly.",
            exampleText: "Example:\n\n🎵 -at family: cat, bat, hat, mat, rat\n🎵 -og family: dog, log, fog, hog\n🎵 -ing family: ring, sing, king, wing",
            iconSystemName: "music.note", gradeLabel: "Grade 1"
        ),
        EngTopicDefinition(
            id: 6, nodeTitle: "Long Vowels",
            introTitle: "Long Vowels & Silent E Quest",
            introText: "Long vowels say their own name. When a silent 'e' is added to the end of a word, it makes the vowel before it say its long sound. This is called the magic 'e' rule.",
            exampleText: "Example:\n\n✨ cap → cape\n✨ kit → kite 🪁\n✨ hop → hope\n✨ cub → cube",
            iconSystemName: "e.square.fill", gradeLabel: "Grade 2"
        ),
        EngTopicDefinition(
            id: 7, nodeTitle: "Blends & Digraphs",
            introTitle: "Consonant Blends & Digraphs Quest",
            introText: "A consonant blend is two or more consonants together where you hear each sound. A digraph is two letters that make one new sound together. Both are very common in English.",
            exampleText: "Example:\n\n🔤 Blends: sl-ide, br-ick, st-op, fr-og 🐸\n🔤 Digraphs: sh-ell 🐚, ch-air, th-ink, wh-ale 🐋",
            iconSystemName: "character.textbox", gradeLabel: "Grade 2"
        ),
        EngTopicDefinition(
            id: 8, nodeTitle: "Nouns & Verbs",
            introTitle: "Nouns & Verbs Quest",
            introText: "A noun is a person, place, thing, or idea. A verb is an action or state of being. Nouns and verbs are the two most important parts of any sentence.",
            exampleText: "Example:\n\n🏷️ Nouns: dog 🐶, park 🌳, happiness, teacher\n⚡ Verbs: run, jump, is, think, sleep 😴",
            iconSystemName: "tag.fill", gradeLabel: "Grade 2"
        ),
        EngTopicDefinition(
            id: 9, nodeTitle: "Adj & Adverbs",
            introTitle: "Adjectives & Adverbs Quest",
            introText: "Adjectives describe nouns and tell us more about people, places, and things. Adverbs describe verbs, adjectives, or other adverbs and often tell us how, when, or where something happens.",
            exampleText: "Example:\n\n🎨 Adjective: The big, red apple. 🍎\n🏃 Adverb: She ran quickly.\n💡 Adjective + Adverb: The very tall tree grew slowly.",
            iconSystemName: "paintbrush.fill", gradeLabel: "Grade 3"
        ),
        EngTopicDefinition(
            id: 10, nodeTitle: "Punctuation",
            introTitle: "Punctuation Quest",
            introText: "Punctuation marks are symbols that help organise writing and show the reader how to read it. They show where sentences end, where to pause, and what kind of sentence it is.",
            exampleText: "Example:\n\n❓ Question: Are you ready?\n❗ Exclamation: Watch out!\n🔵 Comma: I have a cat, a dog, and a fish. 🐟\n🔴 Period: The sky is blue.",
            iconSystemName: "exclamationmark.circle.fill", gradeLabel: "Grade 3"
        ),
        EngTopicDefinition(
            id: 11, nodeTitle: "Compound Words",
            introTitle: "Compound Words & Contractions Quest",
            introText: "A compound word is formed by joining two smaller words to make a new word with a new meaning. A contraction combines two words into one shorter word using an apostrophe to replace missing letters.",
            exampleText: "Example:\n\n🔗 Compound: sun + flower = sunflower 🌻\n🔗 Compound: rain + bow = rainbow 🌈\n✂️ Contraction: do not → don't\n✂️ Contraction: I am → I'm",
            iconSystemName: "link", gradeLabel: "Grade 3"
        ),
        EngTopicDefinition(
            id: 12, nodeTitle: "Prefixes & Suffixes",
            introTitle: "Prefixes & Suffixes Quest",
            introText: "A prefix is a group of letters added to the beginning of a word to change its meaning. A suffix is added to the end of a word. Understanding them helps you decode and build new vocabulary.",
            exampleText: "Example:\n\n➕ Prefix: un- means 'not' → unhappy 😔\n➕ Prefix: re- means 'again' → redo\n➕ Suffix: -ful means 'full of' → helpful\n➕ Suffix: -less means 'without' → fearless",
            iconSystemName: "plus.square.fill", gradeLabel: "Grade 3"
        ),
        EngTopicDefinition(
            id: 13, nodeTitle: "Synonyms & Antonyms",
            introTitle: "Synonyms & Antonyms Quest",
            introText: "Synonyms are words that have the same or similar meaning. Antonyms are words that have opposite meanings. Using a variety of synonyms makes your writing more interesting.",
            exampleText: "Example:\n\n🔄 Synonyms: happy = glad = joyful 😊\n↔️ Antonyms: hot ↔ cold 🔥❄️\n↔️ Antonyms: fast ↔ slow 🐢🐇",
            iconSystemName: "arrow.left.arrow.right", gradeLabel: "Grade 3"
        ),
        EngTopicDefinition(
            id: 14, nodeTitle: "Comprehension",
            introTitle: "Reading Comprehension Quest",
            introText: "Reading comprehension means understanding what you read. Good readers think about the main idea, supporting details, and the author's purpose. They also make inferences  -  smart guesses  -  about what the text means.",
            exampleText: "Example:\n\n📖 Main idea: what the whole passage is about\n📌 Details: facts that support the main idea\n💭 Inference: 'It must be raining because everyone has umbrellas' ☂️",
            iconSystemName: "book.fill", gradeLabel: "Grade 4"
        ),
        EngTopicDefinition(
            id: 15, nodeTitle: "Story Elements",
            introTitle: "Story Elements Quest",
            introText: "Every story has key elements: characters, setting, plot, conflict, and resolution. Understanding these elements helps you analyse and enjoy stories at a deeper level.",
            exampleText: "Example:\n\n🎭 Characters: who the story is about\n🌍 Setting: where and when it happens\n📈 Plot: the events that occur\n⚔️ Conflict: the main problem\n✅ Resolution: how it is solved",
            iconSystemName: "theatermasks.fill", gradeLabel: "Grade 4"
        ),
        EngTopicDefinition(
            id: 16, nodeTitle: "Types of Sentences",
            introTitle: "Types of Sentences Quest",
            introText: "There are four types of sentences: declarative (states a fact), interrogative (asks a question), imperative (gives a command), and exclamatory (shows strong feeling). Each type ends with different punctuation.",
            exampleText: "Example:\n\n📢 Declarative: The sun is bright. ☀️\n❓ Interrogative: Is it raining?\n📌 Imperative: Please close the door.\n❗ Exclamatory: What an amazing goal!",
            iconSystemName: "questionmark.circle.fill", gradeLabel: "Grade 4"
        ),
        EngTopicDefinition(
            id: 17, nodeTitle: "Homophones",
            introTitle: "Homophones & Confused Words Quest",
            introText: "Homophones are words that sound the same but have different spellings and meanings. Confused words are pairs that are often mixed up because they look or sound alike. Using the right word is essential for clear writing.",
            exampleText: "Example:\n\n🔀 there / their / they're\n🔀 to / too / two ✌️\n🔀 its / it's\n🔀 your / you're",
            iconSystemName: "arrow.triangle.2.circlepath", gradeLabel: "Grade 4"
        ),
        EngTopicDefinition(
            id: 18, nodeTitle: "Parts of Speech",
            introTitle: "Parts of Speech Quest",
            introText: "Parts of speech describe the role each word plays in a sentence. The eight main parts of speech are: noun, pronoun, verb, adjective, adverb, preposition, conjunction, and interjection.",
            exampleText: "Example:\n\n🏷️ Noun: dog  ⚡ Verb: runs\n🔗 Conjunction: and  📍 Preposition: under\n🙋 Pronoun: she  🎨 Adjective: fluffy\n💥 Interjection: Wow!  📈 Adverb: quickly",
            iconSystemName: "square.grid.2x2.fill", gradeLabel: "Grade 5"
        ),

        // MARK: - Topics 19-35 (from Part 2)

        EngTopicDefinition(
            id: 19,
            nodeTitle: "Subject & Pred",
            introTitle: "Subject & Predicate",
            introText: "Every sentence has two main parts: the subject (who or what the sentence is about) and the predicate (what the subject does or is). Identifying these parts helps you write clear, complete sentences.",
            exampleText: "📝 'The fierce dragon 🐉 breathed fire.'  -  Subject: 'The fierce dragon' | Predicate: 'breathed fire'",
            iconSystemName: "scissors",
            gradeLabel: "Grade 5"
        ),
        EngTopicDefinition(
            id: 20,
            nodeTitle: "Figurative Lang",
            introTitle: "Figurative Language",
            introText: "Figurative language uses words in creative ways that go beyond their literal meaning. Common types include similes, metaphors, personification, and hyperbole. These devices make writing more vivid and expressive.",
            exampleText: "✨ Simile: 'Her smile was like sunshine ☀️.' | Metaphor: 'He is a shining star 🌟.' | Hyperbole: 'I've told you a million times!'",
            iconSystemName: "sparkles",
            gradeLabel: "Grade 5"
        ),
        EngTopicDefinition(
            id: 21,
            nodeTitle: "Vocab in Context",
            introTitle: "Vocabulary in Context",
            introText: "When you encounter an unfamiliar word, you can use context clues  -  the surrounding words and sentences  -  to figure out its meaning. Look for definitions, examples, synonyms, or antonyms nearby.",
            exampleText: "🔍 'The arid, or extremely dry, desert stretched for miles.'  -  The phrase 'extremely dry' is a context clue defining 'arid' 🌵.",
            iconSystemName: "magnifyingglass",
            gradeLabel: "Grade 5"
        ),
        EngTopicDefinition(
            id: 22,
            nodeTitle: "Main Idea",
            introTitle: "Main Idea & Details",
            introText: "The main idea is the most important point an author makes about a topic. Supporting details are facts, examples, or reasons that explain or prove the main idea. Finding the main idea helps you understand what you read.",
            exampleText: "📋 Main idea: 'Bees are vital to our ecosystem 🐝.' Supporting details: bees pollinate crops, help plants reproduce, and produce honey.",
            iconSystemName: "list.bullet",
            gradeLabel: "Grade 6"
        ),
        EngTopicDefinition(
            id: 23,
            nodeTitle: "Point of View",
            introTitle: "Point of View",
            introText: "Point of view refers to the perspective from which a story is told. First person uses 'I/we,' second person uses 'you,' and third person uses 'he/she/they.' The narrator's viewpoint shapes what we know and feel.",
            exampleText: "👁️ First person: 'I walked through the dark forest 🌲.' | Third-person limited: 'She felt afraid as she entered the forest.' | Third-person omniscient: knows all characters' thoughts.",
            iconSystemName: "person.fill.viewfinder",
            gradeLabel: "Grade 6"
        ),
        EngTopicDefinition(
            id: 24,
            nodeTitle: "Text Structures",
            introTitle: "Text Structures",
            introText: "Authors organize nonfiction text using specific structures: cause and effect, compare and contrast, problem and solution, sequence, and description. Recognizing these patterns helps you understand and summarize what you read.",
            exampleText: "📰 Signal words help identify structure 🔑: 'because/therefore' = cause-effect | 'however/similarly' = compare-contrast | 'first/next/finally' = sequence.",
            iconSystemName: "rectangle.grid.1x2.fill",
            gradeLabel: "Grade 6"
        ),
        EngTopicDefinition(
            id: 25,
            nodeTitle: "Narrative Write",
            introTitle: "Narrative Writing",
            introText: "Narrative writing tells a story with a clear beginning, middle, and end. Effective narratives include well-developed characters, a conflict or problem, vivid descriptive details, and dialogue. The plot builds toward a climax before resolving.",
            exampleText: "✏️ Story structure 📖: Exposition (introduce characters/setting) → Rising Action (build conflict) → Climax (turning point) → Falling Action → Resolution.",
            iconSystemName: "pencil.and.outline",
            gradeLabel: "Grade 6"
        ),
        EngTopicDefinition(
            id: 26,
            nodeTitle: "Poetry",
            introTitle: "Poetry",
            introText: "Poetry uses rhythm, rhyme, and carefully chosen words to express ideas and emotions. Key elements include stanzas, meter, rhyme scheme, and poetic devices like alliteration, assonance, and imagery.",
            exampleText: "🎵 Rhyme scheme example  -  ABAB: 'Roses are red (A) / Violets are blue (B) / Sugar is sweet (A) / And so are you (B)' 🌹.",
            iconSystemName: "music.quarternote.3",
            gradeLabel: "Grade 6"
        ),
        EngTopicDefinition(
            id: 27,
            nodeTitle: "Complex Sents",
            introTitle: "Complex Sentences & Clauses",
            introText: "A complex sentence contains one independent clause and at least one dependent clause joined by a subordinating conjunction (because, although, when, while, if). Understanding clauses helps you write more sophisticated sentences.",
            exampleText: "📝 'Although it was raining ☔, we continued the hike.'  -  Dependent clause: 'Although it was raining' | Independent clause: 'we continued the hike.'",
            iconSystemName: "text.append",
            gradeLabel: "Grade 7"
        ),
        EngTopicDefinition(
            id: 28,
            nodeTitle: "Active & Passive",
            introTitle: "Active & Passive Voice",
            introText: "In active voice, the subject performs the action. In passive voice, the subject receives the action. Active voice is usually clearer and more direct, while passive voice is used when the doer is unknown or less important.",
            exampleText: "🔄 Active: 'The chef 👨‍🍳 cooked the meal.' | Passive: 'The meal was cooked by the chef.'  -  Notice how the subject changes position!",
            iconSystemName: "arrow.2.squarepath",
            gradeLabel: "Grade 7"
        ),
        EngTopicDefinition(
            id: 29,
            nodeTitle: "Persuasive Write",
            introTitle: "Persuasive Writing & Rhetoric",
            introText: "Persuasive writing aims to convince the reader to agree with a position. Writers use rhetorical appeals: ethos (credibility), pathos (emotion), and logos (logic/evidence). Recognizing these helps you evaluate arguments critically.",
            exampleText: "📣 Ethos: 'As a doctor, I recommend...' 👨‍⚕️ | Pathos: 'Think of the suffering children...' 😢 | Logos: 'Studies show that 80% of people...' 📊",
            iconSystemName: "megaphone.fill",
            gradeLabel: "Grade 7"
        ),
        EngTopicDefinition(
            id: 30,
            nodeTitle: "Literary Devices",
            introTitle: "Literary Devices",
            introText: "Literary devices are techniques authors use to convey meaning and create effects. Key devices include foreshadowing (hinting at future events), irony (contrast between expectation and reality), and symbolism (objects representing abstract ideas).",
            exampleText: "🎭 Foreshadowing: 'Dark clouds gathered as she left home ⛈️.' | Irony: A fire station burns down 🔥 | Symbolism: A dove 🕊️ represents peace.",
            iconSystemName: "theatermasks",
            gradeLabel: "Grade 7"
        ),
        EngTopicDefinition(
            id: 31,
            nodeTitle: "Author's Purpose",
            introTitle: "Author's Purpose & Bias",
            introText: "An author's purpose is their reason for writing: to inform, persuade, entertain, or describe. Bias occurs when an author presents only one side or uses loaded language. Recognizing purpose and bias makes you a stronger critical reader.",
            exampleText: "🧠 PIE framework: Persuade 📣, Inform 📰, Entertain 🎪. Ask: Does the author use emotional language? Are opposing views ignored? What sources are cited? 🔎",
            iconSystemName: "brain.head.profile",
            gradeLabel: "Grade 7"
        ),
        EngTopicDefinition(
            id: 32,
            nodeTitle: "Research & Cite",
            introTitle: "Research & Citation",
            introText: "Good research involves finding reliable sources, taking notes, and properly crediting those sources. Citations prevent plagiarism and allow readers to verify information. Common formats include MLA and APA style.",
            exampleText: "📄 MLA citation example: Smith, Jane. 'Ocean Pollution.' *National Geographic*, 2023. 🌊  -  Always include author, title, source, and date!",
            iconSystemName: "doc.text.magnifyingglass",
            gradeLabel: "Grade 8"
        ),
        EngTopicDefinition(
            id: 33,
            nodeTitle: "Shakespeare",
            introTitle: "Shakespeare & Classic Lit",
            introText: "Shakespeare's plays explore timeless themes like love, ambition, jealousy, and fate. His works introduced hundreds of words and phrases still used today. Key plays include Romeo & Juliet, Macbeth, and A Midsummer Night's Dream.",
            exampleText: "👑 Famous quotes: 'To be or not to be' (Hamlet) | 'What's in a name? That which we call a rose by any other name would smell as sweet' 🌹 (Romeo & Juliet).",
            iconSystemName: "crown.fill",
            gradeLabel: "Grade 8"
        ),
        EngTopicDefinition(
            id: 34,
            nodeTitle: "Etymology",
            introTitle: "Etymology & Word Roots",
            introText: "Etymology is the study of word origins. Many English words come from Latin and Greek roots. Knowing these roots helps you understand unfamiliar vocabulary and build a stronger word bank.",
            exampleText: "🌳 Root 'bio' (life) → biology, biography, biome 🧬 | Root 'geo' (earth) → geography, geology, geometry 🌍 | Root '-ology' (study of) → any field of study!",
            iconSystemName: "tree.fill",
            gradeLabel: "Grade 8"
        ),
        EngTopicDefinition(
            id: 35,
            nodeTitle: "Adv Grammar",
            introTitle: "Advanced Grammar & Punctuation",
            introText: "Advanced grammar covers proper use of semicolons, colons, dashes, and commas in complex situations. It also includes understanding parallel structure, misplaced modifiers, and subject-verb agreement in complex sentences.",
            exampleText: "✅ Semicolon: 'I love reading; my sister prefers movies.' 📚 | Colon: 'She needed three things: courage, patience, and skill.' | Em dash  -  used for emphasis or interruption!",
            iconSystemName: "checkmark.seal.fill",
            gradeLabel: "Grade 8"
        ),

        EngTopicDefinition(
        id: 36, nodeTitle: "Info Writing",
        introTitle: "Informative/Explanatory Writing Quest",
        introText: "Informative writing shares facts, explains how things work, or teaches readers something new. Good informative writing has a clear topic, supporting details, and a conclusion. You can write how-to guides, all-about books, or research reports!",
        exampleText: "Example:\n\n📖 Topic sentence: 'Penguins are amazing birds.'\n🐧 Detail: 'They cannot fly, but they are excellent swimmers.'\n✅ Conclusion: 'Penguins are truly unique creatures.'",
        iconSystemName: "doc.text.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 37, nodeTitle: "Opinion Writing",
        introTitle: "Opinion Writing Quest",
        introText: "Opinion writing means sharing what you think or believe and backing it up with reasons. A strong opinion piece states your view clearly, gives at least two reasons, and ends with a convincing conclusion. Remember  -  an opinion is what you think, not a fact!",
        exampleText: "Example:\n\n💬 Opinion: 'School should have longer lunch breaks.'\n1️⃣ Reason 1: 'Kids need time to eat and relax.'\n2️⃣ Reason 2: 'More time outside helps us focus in class.'\n✅ Conclusion: 'Longer breaks make school better for everyone!'",
        iconSystemName: "hand.thumbsup.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 38, nodeTitle: "Dialogue",
        introTitle: "Dialogue & Quotation Marks Quest",
        introText: "Dialogue is the words characters say out loud in a story. We use quotation marks to show exactly what someone said. Every time a new person speaks, you start a new paragraph. Punctuation goes inside the closing quotation mark.",
        exampleText: "Example:\n\n📝 \"I love dragons,\" said Mia.\n🐉 \"Me too!\" shouted Jake.\n✅ Notice: comma inside quotes, new line for new speaker.",
        iconSystemName: "quote.bubble.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 39, nodeTitle: "Possessives",
        introTitle: "Possessives & Plurals Quest",
        introText: "Possessive nouns show ownership  -  add 's to a singular noun (the dog's bone) or just an apostrophe after a plural noun ending in -s (the dogs' bones). Irregular plurals don't follow the usual rules: child → children, mouse → mice, foot → feet.",
        exampleText: "Example:\n\n🐾 The cat's toy (one cat owns it)\n🐾 The cats' bowl (many cats share it)\n👣 One foot → two feet (irregular!)\n🖊️ One child → many children (irregular!)",
        iconSystemName: "textformat", gradeLabel: "Grade 2"
    ),

    EngTopicDefinition(
        id: 40, nodeTitle: "Capitalisation",
        introTitle: "Capitalisation Rules Quest",
        introText: "Capital letters are used at the start of every sentence, for proper nouns (names of specific people, places, and things), titles of books and films, days of the week, and months. Common nouns like 'dog' or 'city' do NOT get capitals.",
        exampleText: "Example:\n\n✅ My friend Emma lives in London.\n✅ We visited the British Museum on Monday.\n❌ I have a Dog. (wrong  -  'dog' is common)\n📚 We read 'Charlotte's Web' in class.",
        iconSystemName: "textformat.size", gradeLabel: "Grade 2"
    ),

    EngTopicDefinition(
        id: 41, nodeTitle: "Sentence Variety",
        introTitle: "Sentence Variety Quest",
        introText: "Using different types of sentences makes your writing more interesting. A simple sentence has one independent clause. A compound sentence joins two ideas with 'and', 'but', or 'so'. A complex sentence uses a joining word like 'because', 'when', or 'although' to connect ideas.",
        exampleText: "Example:\n\n📝 Simple: 'The storm came.'\n🔗 Compound: 'The storm came, and we ran inside.'\n🌀 Complex: 'Although it was sunny, a storm came quickly.'\n✨ Mixing sentence types keeps readers engaged!",
        iconSystemName: "text.alignleft", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 42, nodeTitle: "Inferencing",
        introTitle: "Inferencing Quest",
        introText: "Inferencing means reading between the lines  -  using clues in the text plus what you already know to figure out something the author does not say directly. Good readers make inferences all the time to understand characters, settings, and plot. Ask yourself: What clues do I see? What do I already know?",
        exampleText: "Example:\n\n📖 Text: 'Jake grabbed his umbrella and frowned at the grey sky.'\n🔍 Clue: umbrella + grey sky\n💡 Inference: It is probably about to rain, and Jake is not happy about it.\n✅ The author never said it would rain  -  we inferred it!",
        iconSystemName: "lightbulb.fill", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 43, nodeTitle: "Summarising",
        introTitle: "Summarisation & Paraphrasing Quest",
        introText: "A summary retells the most important ideas from a text in your own words, leaving out minor details. Paraphrasing means rewriting a specific sentence or passage in your own words without copying. Both skills show you truly understand what you have read.",
        exampleText: "Example:\n\n📄 Original: 'The Amazon rainforest covers over 5.5 million square kilometres and is home to millions of animal and plant species.'\n✏️ Paraphrase: 'The Amazon is a huge forest that contains an enormous variety of wildlife.'\n📋 Summary tip: Who? What? Why it matters  -  keep it short!",
        iconSystemName: "list.bullet.rectangle", gradeLabel: "Grade 5"
    ),

    EngTopicDefinition(
        id: 44, nodeTitle: "Media Literacy",
        introTitle: "Media Literacy Quest",
        introText: "Media literacy means understanding and thinking critically about messages in TV, ads, social media, and news. You learn to tell facts from opinions, spot persuasive techniques, and check whether information is trustworthy. Always ask: Who made this? Why? Is it fact or opinion?",
        exampleText: "Example:\n\n📺 Ad: 'Nine out of ten kids love Choco Pops!'\n🔍 Question: Who asked those kids? Is this a fact or a sales trick?\n📰 Headline: 'Scientists discover water on Mars.' (fact  -  can be checked)\n💬 Headline: 'Mars missions are a waste of money.' (opinion  -  someone's view)\n✅ Thinking critically about media keeps you informed!",
        iconSystemName: "tv.fill", gradeLabel: "Grade 6"
    ),

        EngTopicDefinition(
        id: 45, nodeTitle: "Editing",
        introTitle: "Editing & Revision Quest",
        introText: "Good writers revise and edit their work. Proofreading means checking for spelling, punctuation, and grammar errors. Peer review means getting helpful feedback from a classmate.",
        exampleText: "Example:\n\n✏️ Draft: 'the dog runned fast'\n🔍 Proofread: Check spelling and grammar\n✅ Revised: 'The dog ran fast'",
        iconSystemName: "pencil.tip", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 46, nodeTitle: "Tech Writing",
        introTitle: "Technical Writing Quest",
        introText: "Technical writing gives clear instructions or explains how things work. Procedural texts use numbered steps. Technical documents are precise and easy to follow.",
        exampleText: "Example:\n\n🔧 How to make a sandwich:\n1️⃣ Get two slices of bread\n2️⃣ Spread peanut butter on one slice\n3️⃣ Press the slices together",
        iconSystemName: "wrench.and.screwdriver.fill", gradeLabel: "Grade 6"
    ),

    EngTopicDefinition(
        id: 47, nodeTitle: "Presenting",
        introTitle: "Presentation Skills Quest",
        introText: "Presenting means speaking to an audience clearly and confidently. Visual aids like posters or slides help your listeners understand. Using a strong, steady voice makes your message easy to follow.",
        exampleText: "Example:\n\n🎤 Speak clearly and slowly\n👁️ Make eye contact with your audience\n📊 Use a poster or slide to show key points",
        iconSystemName: "mic.fill", gradeLabel: "Grade 5"
    ),

    EngTopicDefinition(
        id: 48, nodeTitle: "Debate",
        introTitle: "Debate & Argumentation Quest",
        introText: "In a debate, speakers argue for or against a topic using evidence and reasoning. A good debater listens to the other side and responds with a counterargument. Strong arguments are logical and supported by facts.",
        exampleText: "Example:\n\n💬 Claim: 'School should start later'\n📋 Evidence: 'Studies show teens need more sleep'\n🔄 Counterargument: 'But buses run early...'",
        iconSystemName: "bubble.left.and.bubble.right.fill", gradeLabel: "Grade 7"
    ),

    EngTopicDefinition(
        id: 49, nodeTitle: "Listening",
        introTitle: "Listening Comprehension Quest",
        introText: "Active listening means paying close attention when someone speaks. Good listeners focus, avoid distractions, and remember key details. Following multi-step directions requires you to listen carefully to each step.",
        exampleText: "Example:\n\n👂 Listen carefully to all steps\n🧠 Remember: First wash hands, then dry them, then put on gloves\n✅ Follow steps in the correct order",
        iconSystemName: "ear.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 50, nodeTitle: "Cause & Effect",
        introTitle: "Cause & Effect in Reading Quest",
        introText: "A cause is why something happens. An effect is what happens as a result. Understanding cause and effect helps you make sense of stories and informational texts.",
        exampleText: "Example:\n\n🌧️ Cause: It rained all day\n💧 Effect: The playground was muddy\n🔑 Clue words: 'because', 'so', 'as a result'",
        iconSystemName: "arrow.right.circle.fill", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 51, nodeTitle: "Compare Texts",
        introTitle: "Compare & Contrast in Texts Quest",
        introText: "When you compare two texts, you find what is alike. When you contrast them, you find what is different. Using a Venn diagram can help organize your ideas.",
        exampleText: "Example:\n\n📖 Book A: Set in a city, has one main character\n📗 Book B: Set in a forest, has one main character\n🔵 Both: One main character\n🔴 Different: Setting",
        iconSystemName: "arrow.left.arrow.right", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 52, nodeTitle: "Journal Writing",
        introTitle: "Journal & Diary Writing Quest",
        introText: "A journal or diary is a personal record of your thoughts and feelings. Diary entries start with the date and use first-person voice (I, me, my). They are a great way to reflect on your day.",
        exampleText: "Example:\n\n📅 Dear Diary, March 22, 2026\n😊 Today I felt really happy because...\n✏️ I, me, my  -  first person words",
        iconSystemName: "book.closed.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 53, nodeTitle: "Lit Genres",
        introTitle: "Genres of Literature Quest",
        introText: "A genre is a type or category of literature. Mystery, science fiction, fantasy, historical fiction, and realistic fiction are all popular genres. Knowing the genre helps you understand what to expect from a story.",
        exampleText: "Example:\n\n🔍 Mystery: A detective solves a crime\n🚀 Sci-Fi: Space travel in the future\n🐉 Fantasy: Magic and dragons\n📜 Historical Fiction: Set in the past",
        iconSystemName: "books.vertical.fill", gradeLabel: "Grade 5"
    ),

    EngTopicDefinition(
        id: 54, nodeTitle: "Nouns & Pronouns",
        introTitle: "Nouns and Pronouns Quest",
        introText: "A noun names a person, place, thing, or idea. Nouns can be common (dog, city) or proper (Luna, London). A pronoun replaces a noun so you don't have to repeat it. Pronouns include I, you, he, she, it, we, and they.",
        exampleText: "Example:\n\n🏷️ Common noun: teacher, school, happiness\n🏷️ Proper noun: Mrs. Smith, Paris 🗼\n🙋 Pronoun: 'Emma loves art. She paints every day.'\n✅ 'She' replaces 'Emma' — no repetition!",
        iconSystemName: "person.text.rectangle.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 55, nodeTitle: "Verbs & Tenses",
        introTitle: "Verbs and Tenses Quest",
        introText: "A verb tells you what someone or something does, is, or has. Tense tells you WHEN the action happens. Past tense describes something that already happened, present tense describes what is happening now, and future tense describes what will happen.",
        exampleText: "Example:\n\n⏪ Past: 'She walked to school yesterday.'\n▶️ Present: 'She walks to school every day.'\n⏩ Future: 'She will walk to school tomorrow.'\n💡 The verb changes to show time!",
        iconSystemName: "clock.arrow.2.circlepath", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 56, nodeTitle: "Adj & Adverbs",
        introTitle: "Adjectives and Adverbs Quest",
        introText: "Adjectives describe nouns and make your writing more vivid. They tell us size, colour, number, shape, and feeling. Adverbs describe verbs, adjectives, or other adverbs. They often end in -ly and tell how, when, where, or how much.",
        exampleText: "Example:\n\n🎨 Adjective: 'The tiny, golden star shone brightly.'\n🏃 Adverb: 'She spoke very quietly.'\n💡 'tiny' and 'golden' describe the star (noun)\n💡 'very' describes 'quietly' (adverb describing adverb)",
        iconSystemName: "paintpalette.fill", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 57, nodeTitle: "Punctuation",
        introTitle: "Punctuation Quest",
        introText: "Punctuation marks guide the reader through your writing. A full stop ends a statement. A question mark ends a question. An exclamation mark shows strong feeling. Commas separate items in a list or clauses in a sentence. Apostrophes show ownership or mark contractions.",
        exampleText: "Example:\n\n📍 Full stop: 'The sun sets in the west.'\n❓ Question mark: 'Where are you going?'\n❗ Exclamation: 'Watch out!'\n🔵 Comma in list: 'I bought apples, bananas, and grapes.'\n✂️ Apostrophe: 'Jake's bag' / 'can't'",
        iconSystemName: "textformat.alt", gradeLabel: "Grade 3"
    ),

    EngTopicDefinition(
        id: 58, nodeTitle: "Reading Compr.",
        introTitle: "Reading Comprehension Quest",
        introText: "Reading comprehension means truly understanding what you read. Strong readers find the main idea, identify supporting details, make inferences from clues, and understand the author's purpose. They also ask questions before, during, and after reading.",
        exampleText: "Example:\n\n📖 Main idea: what the whole text is about\n📌 Detail: a fact that supports the main idea\n💭 Inference: 'She grabbed her umbrella — it must be raining' ☔\n🎯 Author's purpose: to inform, persuade, or entertain",
        iconSystemName: "text.magnifyingglass", gradeLabel: "Grade 4"
    ),

    EngTopicDefinition(
        id: 59, nodeTitle: "Writing Sentences",
        introTitle: "Writing Sentences Quest",
        introText: "A well-written sentence expresses a complete thought clearly. Every sentence needs a subject and a predicate. Good writers vary their sentence lengths, avoid run-ons and fragments, use precise word choices, and check that their sentences make sense.",
        exampleText: "Example:\n\n✅ Complete: 'The curious fox crept through the forest.'\n❌ Fragment: 'Through the forest.' (no subject or verb)\n❌ Run-on: 'I was tired I went to bed I slept all night.'\n✨ Tip: Read your sentence aloud — does it sound right?",
        iconSystemName: "pencil.line", gradeLabel: "Grade 4"
    ),
    ]

    // MARK: - Helper

    static func topic(for id: Int) -> EngTopicDefinition? {
        topics.first { $0.id == id }
    }

    static func topicTitle(for id: Int) -> String {
        topic(for: id)?.nodeTitle ?? "Topic \(id)"
    }

    static func hasQuestions(for id: Int) -> Bool {
        !(practiceQuestionsByTopic[id] ?? []).isEmpty
    }

    static func minimumPassScore(for questionCount: Int) -> Int {
        Int(ceil(Double(questionCount) * 0.7))
    }

    static func hasContent(for id: Int) -> Bool {
        !(practiceQuestionsByTopic[id] ?? []).isEmpty
    }

    static func availableTopicIds() -> [Int] {
        practiceQuestionsByTopic.keys.sorted()
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
        let endIndex = min(startIndex + questionsPerQuest, all.count)
        guard startIndex < endIndex else { return Array(all.prefix(questionsPerQuest)) }
        return Array(all[startIndex..<endIndex])
    }

    static func examQuestions(for topicId: Int) -> [MathExamQuestion] {
        examQuestionsByTopic[topicId] ?? []
    }

    // MARK: - Practice Questions (Topics 1-18)

    private static let practiceQuestionsByTopic: [Int: [MathExamQuestion]] = [

        // Topic 1: The Alphabet & Letter Sounds
        1: [
            MathExamQuestion(id: "eng_1_p1", topicId: 1, prompt: "How many letters are in the English alphabet?", options: ["24", "25", "26", "27"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p2", topicId: 1, prompt: "Which of these is a vowel?", options: ["B", "C", "E", "G"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p3", topicId: 1, prompt: "What sound does the letter 'S' make?", options: ["/b/", "/s/", "/t/", "/m/"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_p4", topicId: 1, prompt: "Which letter comes after 'M' in the alphabet?", options: ["L", "K", "N", "O"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p5", topicId: 1, prompt: "How many vowels are in the English alphabet?", options: ["3", "4", "5", "6"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p6", topicId: 1, prompt: "Which of these words starts with the letter 'D'?", options: ["Apple", "Cat", "Dog", "Elephant"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p7", topicId: 1, prompt: "What sound does the letter 'P' make in 'pig'?", options: ["/b/", "/f/", "/p/", "/d/"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p8", topicId: 1, prompt: "Which letter comes before 'Z' in the alphabet?", options: ["X", "Y", "W", "V"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_p9", topicId: 1, prompt: "Which of these is NOT a vowel?", options: ["A", "E", "F", "O"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_p10", topicId: 1, prompt: "What letter does 'ball' start with?", options: ["D", "P", "B", "G"], correctIndex: 2)
        ],

        // Topic 2: Short Vowels & CVC Words
        2: [
            MathExamQuestion(id: "eng_2_p1", topicId: 2, prompt: "Which word has the short 'a' sound?", options: ["cake", "cat", "came", "cape"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_p2", topicId: 2, prompt: "Which word is a CVC word?", options: ["street", "plate", "dog", "train"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_p3", topicId: 2, prompt: "What vowel sound do you hear in 'pig'?", options: ["Short a", "Short e", "Short i", "Short o"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_p4", topicId: 2, prompt: "Which word has the short 'u' sound?", options: ["mule", "muse", "mud", "mute"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_p5", topicId: 2, prompt: "Which of these is a CVC word?", options: ["ship", "hen", "train", "shop"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_p6", topicId: 2, prompt: "What vowel sound do you hear in 'hop'?", options: ["Short a", "Short e", "Short i", "Short o"], correctIndex: 3),
            MathExamQuestion(id: "eng_2_p7", topicId: 2, prompt: "Which word has the short 'e' sound?", options: ["bee", "bed", "bead", "beet"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_p8", topicId: 2, prompt: "What is the middle vowel in the word 'sun'?", options: ["a", "e", "i", "u"], correctIndex: 3),
            MathExamQuestion(id: "eng_2_p9", topicId: 2, prompt: "Which word fits the CVC pattern?", options: ["blue", "bat", "shoe", "tree"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_p10", topicId: 2, prompt: "Which word has the short 'o' sound?", options: ["boat", "bone", "box", "bowl"], correctIndex: 2)
        ],

        // Topic 3: Sight Words
        3: [
            MathExamQuestion(id: "eng_3_p1", topicId: 3, prompt: "Which of these is a common sight word?", options: ["xylophone", "the", "umbrella", "pyramid"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_p2", topicId: 3, prompt: "Choose the correct sight word to complete: '___ dog is big.'", options: ["A", "The", "An", "In"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_p3", topicId: 3, prompt: "Which sentence uses the sight word 'said' correctly?", options: ["She said hello.", "Said is a dog.", "The said ran.", "Hello said."], correctIndex: 0),
            MathExamQuestion(id: "eng_3_p4", topicId: 3, prompt: "Which of these is a sight word?", options: ["elephant", "are", "bicycle", "umbrella"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_p5", topicId: 3, prompt: "Complete: 'We ___ going to school.'", options: ["is", "am", "are", "was"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_p6", topicId: 3, prompt: "Which sight word means more than one person?", options: ["I", "me", "they", "it"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_p7", topicId: 3, prompt: "Which of these is NOT a sight word?", options: ["was", "have", "said", "elephant"], correctIndex: 3),
            MathExamQuestion(id: "eng_3_p8", topicId: 3, prompt: "Choose the correct sight word: 'I ___ a dog.'", options: ["have", "has", "is", "are"], correctIndex: 0),
            MathExamQuestion(id: "eng_3_p9", topicId: 3, prompt: "Which sight word shows where something is?", options: ["they", "said", "here", "have"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_p10", topicId: 3, prompt: "Complete: '___ you like apples?'", options: ["Do", "Does", "Did", "Is"], correctIndex: 0)
        ],

        // Topic 4: Simple Sentences
        4: [
            MathExamQuestion(id: "eng_4_p1", topicId: 4, prompt: "Which of these is a complete sentence?", options: ["The big dog.", "Runs fast.", "The dog runs.", "Very quickly."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p2", topicId: 4, prompt: "What does every sentence need?", options: ["A noun only", "A subject and a predicate", "An adjective", "Three words"], correctIndex: 1),
            MathExamQuestion(id: "eng_4_p3", topicId: 4, prompt: "Which sentence starts correctly?", options: ["the cat sat.", "The cat sat.", "the Cat sat.", "THE cat sat."], correctIndex: 1),
            MathExamQuestion(id: "eng_4_p4", topicId: 4, prompt: "What punctuation ends a statement sentence?", options: ["?", "!", ".", ","], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p5", topicId: 4, prompt: "Which of these is NOT a sentence?", options: ["She sings.", "Birds fly south.", "Jumping high.", "We ate lunch."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p6", topicId: 4, prompt: "In the sentence 'Tom eats apples', what is the subject?", options: ["eats", "apples", "Tom", "the"], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p7", topicId: 4, prompt: "Which is a complete sentence?", options: ["Blue sky.", "A very big.", "The fish swims.", "Over the hill."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p8", topicId: 4, prompt: "In 'The girl reads books', what is the verb?", options: ["girl", "The", "books", "reads"], correctIndex: 3),
            MathExamQuestion(id: "eng_4_p9", topicId: 4, prompt: "Which sentence is written correctly?", options: ["i like cake.", "I Like Cake.", "I like cake.", "i Like cake."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_p10", topicId: 4, prompt: "A sentence that asks a question ends with...", options: ["A period", "A comma", "A question mark", "An exclamation mark"], correctIndex: 2)
        ],

        // Topic 5: Rhyming & Word Families
        5: [
            MathExamQuestion(id: "eng_5_p1", topicId: 5, prompt: "Which word rhymes with 'cat'?", options: ["dog", "cup", "bat", "sit"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_p2", topicId: 5, prompt: "Which word belongs to the '-og' word family?", options: ["log", "lip", "lap", "let"], correctIndex: 0),
            MathExamQuestion(id: "eng_5_p3", topicId: 5, prompt: "Which pair of words rhymes?", options: ["cat / dog", "sun / fun", "big / run", "top / cup"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_p4", topicId: 5, prompt: "Which word rhymes with 'ring'?", options: ["rang", "rung", "sing", "song"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_p5", topicId: 5, prompt: "What do the words 'cake', 'lake', and 'make' have in common?", options: ["They all start the same", "They all rhyme", "They are all verbs", "They have short vowels"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_p6", topicId: 5, prompt: "Which word does NOT belong in the '-at' family?", options: ["hat", "mat", "sat", "set"], correctIndex: 3),
            MathExamQuestion(id: "eng_5_p7", topicId: 5, prompt: "Which word rhymes with 'night'?", options: ["note", "knit", "light", "nip"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_p8", topicId: 5, prompt: "Which pair rhymes?", options: ["book / back", "hop / top", "run / pin", "sit / set"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_p9", topicId: 5, prompt: "Which word is in the '-ake' word family?", options: ["kin", "bake", "back", "kick"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_p10", topicId: 5, prompt: "Which word rhymes with 'bug'?", options: ["bag", "big", "jug", "bog"], correctIndex: 2)
        ],

        // Topic 6: Long Vowels & Silent E
        6: [
            MathExamQuestion(id: "eng_6_p1", topicId: 6, prompt: "What happens to the vowel when you add a silent 'e' to 'cap'?", options: ["It stays short", "It becomes long", "It disappears", "It doubles"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_p2", topicId: 6, prompt: "Which word has a long vowel sound?", options: ["sit", "sit", "site", "bit"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_p3", topicId: 6, prompt: "Add silent 'e' to 'hop'. What word do you get?", options: ["hopp", "hops", "hope", "hoppe"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_p4", topicId: 6, prompt: "Which word has a long 'a' sound?", options: ["mad", "man", "map", "make"], correctIndex: 3),
            MathExamQuestion(id: "eng_6_p5", topicId: 6, prompt: "Which of these is a 'silent e' word?", options: ["hat", "hit", "hot", "hide"], correctIndex: 3),
            MathExamQuestion(id: "eng_6_p6", topicId: 6, prompt: "What is the long vowel sound in 'cube'?", options: ["Long a", "Long e", "Long i", "Long u"], correctIndex: 3),
            MathExamQuestion(id: "eng_6_p7", topicId: 6, prompt: "Which word has a long 'e' sound?", options: ["pet", "ten", "eve", "bed"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_p8", topicId: 6, prompt: "Which pair shows the silent 'e' change?", options: ["cat / car", "pin / pine", "dog / dot", "run / rug"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_p9", topicId: 6, prompt: "What vowel sound is in 'kite'?", options: ["Short i", "Long i", "Short e", "Long e"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_p10", topicId: 6, prompt: "Which word does NOT follow the silent 'e' rule?", options: ["cake", "bike", "rope", "bath"], correctIndex: 3)
        ],

        // Topic 7: Consonant Blends & Digraphs
        7: [
            MathExamQuestion(id: "eng_7_p1", topicId: 7, prompt: "Which word begins with a consonant blend?", options: ["chair", "shop", "frog", "think"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_p2", topicId: 7, prompt: "What is the digraph in the word 'shell'?", options: ["se", "sh", "sl", "he"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_p3", topicId: 7, prompt: "Which word starts with the 'ch' digraph?", options: ["clock", "chair", "cream", "cloud"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_p4", topicId: 7, prompt: "In a consonant blend, you can hear...", options: ["Only one sound", "Both sounds", "A silent letter", "A vowel sound"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_p5", topicId: 7, prompt: "Which word contains the 'th' digraph?", options: ["tree", "there", "train", "tray"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_p6", topicId: 7, prompt: "Which of these words starts with a blend?", options: ["wheel", "phone", "stop", "then"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_p7", topicId: 7, prompt: "What blend do you hear at the start of 'brick'?", options: ["bl-", "br-", "cr-", "tr-"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_p8", topicId: 7, prompt: "A digraph is two letters that make...", options: ["Two sounds", "No sound", "One new sound", "A long vowel"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_p9", topicId: 7, prompt: "Which word has the 'wh' digraph?", options: ["with", "witch", "whale", "walk"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_p10", topicId: 7, prompt: "Which word ends with the '-ng' digraph?", options: ["rent", "ring", "rink", "rick"], correctIndex: 1)
        ],

        // Topic 8: Nouns & Verbs
        8: [
            MathExamQuestion(id: "eng_8_p1", topicId: 8, prompt: "Which of these is a noun?", options: ["run", "happy", "elephant", "quickly"], correctIndex: 2),
            MathExamQuestion(id: "eng_8_p2", topicId: 8, prompt: "Which of these is a verb?", options: ["house", "jump", "blue", "teacher"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p3", topicId: 8, prompt: "In the sentence 'The bird sings', what is the noun?", options: ["The", "bird", "sings", "all"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p4", topicId: 8, prompt: "Which word is an action verb?", options: ["tall", "sleep", "purple", "desk"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p5", topicId: 8, prompt: "A noun can be a...", options: ["Colour or action", "Person, place, or thing", "Description word", "Joining word"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p6", topicId: 8, prompt: "Which sentence has both a noun and a verb?", options: ["Very fast.", "Blue and tall.", "The dog barks.", "Quickly now."], correctIndex: 2),
            MathExamQuestion(id: "eng_8_p7", topicId: 8, prompt: "Which of these is a place noun?", options: ["smile", "library", "laugh", "green"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p8", topicId: 8, prompt: "Which word is a verb in 'She reads every day'?", options: ["She", "reads", "every", "day"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_p9", topicId: 8, prompt: "Which of these is an idea noun?", options: ["run", "table", "freedom", "eat"], correctIndex: 2),
            MathExamQuestion(id: "eng_8_p10", topicId: 8, prompt: "Which word is a verb?", options: ["park", "cloud", "think", "pencil"], correctIndex: 2)
        ],

        // Topic 9: Adjectives & Adverbs
        9: [
            MathExamQuestion(id: "eng_9_p1", topicId: 9, prompt: "Which word is an adjective in 'the tiny ant'?", options: ["the", "tiny", "ant", "none"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_p2", topicId: 9, prompt: "Which word is an adverb?", options: ["slowly", "chair", "purple", "rock"], correctIndex: 0),
            MathExamQuestion(id: "eng_9_p3", topicId: 9, prompt: "Adjectives describe...", options: ["Verbs", "Nouns", "Other adverbs only", "Conjunctions"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_p4", topicId: 9, prompt: "Which word is an adverb in 'He ran quickly'?", options: ["He", "ran", "quickly", "none"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_p5", topicId: 9, prompt: "Which sentence has an adjective?", options: ["She runs.", "The tall girl runs.", "They swim.", "We eat."], correctIndex: 1),
            MathExamQuestion(id: "eng_9_p6", topicId: 9, prompt: "Which of these is an adjective?", options: ["jump", "beautiful", "sing", "slowly"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_p7", topicId: 9, prompt: "Adverbs often end in which suffix?", options: ["-ful", "-less", "-ly", "-tion"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_p8", topicId: 9, prompt: "In 'The very loud music played', which word is an adverb?", options: ["The", "very", "loud", "music"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_p9", topicId: 9, prompt: "Which word describes how someone does something?", options: ["An adjective", "A noun", "An adverb", "A conjunction"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_p10", topicId: 9, prompt: "Which sentence uses an adjective AND an adverb?", options: ["Run fast.", "The big dog barked loudly.", "She smiled.", "They eat."], correctIndex: 1)
        ],

        // Topic 10: Punctuation
        10: [
            MathExamQuestion(id: "eng_10_p1", topicId: 10, prompt: "Which punctuation mark ends a question?", options: [".", "!", "?", ","], correctIndex: 2),
            MathExamQuestion(id: "eng_10_p2", topicId: 10, prompt: "Which punctuation mark ends an exclamatory sentence?", options: [".", "!", "?", ";"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_p3", topicId: 10, prompt: "What does a comma do in a list?", options: ["Ends the sentence", "Separates items", "Shows surprise", "Asks a question"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_p4", topicId: 10, prompt: "Which sentence is punctuated correctly?", options: ["Can you help me", "Can you help me.", "Can you help me?", "Can you help me!"], correctIndex: 2),
            MathExamQuestion(id: "eng_10_p5", topicId: 10, prompt: "Where does a capital letter go in a sentence?", options: ["Anywhere you like", "Only on nouns", "At the beginning", "At the end"], correctIndex: 2),
            MathExamQuestion(id: "eng_10_p6", topicId: 10, prompt: "Which is the correct use of an apostrophe?", options: ["apple's are tasty", "the dog's bone", "two apple's", "many dog's"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_p7", topicId: 10, prompt: "Which sentence uses a comma correctly?", options: ["I, like cats", "I like cats, dogs and fish.", "I like, cats dogs and fish.", "I like cats dogs, and fish"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_p8", topicId: 10, prompt: "What punctuation ends a command like 'Sit down'?", options: ["?", "!", ".", "All of the above"], correctIndex: 2),
            MathExamQuestion(id: "eng_10_p9", topicId: 10, prompt: "Which sentence is correctly capitalised?", options: ["she went to london.", "She went to London.", "she went to London.", "She went to london."], correctIndex: 1),
            MathExamQuestion(id: "eng_10_p10", topicId: 10, prompt: "What does an exclamation mark show?", options: ["A question", "A pause", "Strong feeling or surprise", "The end of a list"], correctIndex: 2)
        ],

        // Topic 11: Compound Words & Contractions
        11: [
            MathExamQuestion(id: "eng_11_p1", topicId: 11, prompt: "Which of these is a compound word?", options: ["running", "beautiful", "sunflower", "quickly"], correctIndex: 2),
            MathExamQuestion(id: "eng_11_p2", topicId: 11, prompt: "What is the contraction for 'do not'?", options: ["dont", "don't", "do'nt", "dn't"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_p3", topicId: 11, prompt: "Which two words make the compound word 'bedroom'?", options: ["bed + room", "be + droom", "bedr + oom", "b + edroom"], correctIndex: 0),
            MathExamQuestion(id: "eng_11_p4", topicId: 11, prompt: "What is 'I am' as a contraction?", options: ["Im", "I'm", "Iam", "I'am"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_p5", topicId: 11, prompt: "Which of these is a compound word?", options: ["jumped", "rainbow", "playing", "unhappy"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_p6", topicId: 11, prompt: "What does the apostrophe in a contraction replace?", options: ["A space", "One or more missing letters", "A capital letter", "A punctuation mark"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_p7", topicId: 11, prompt: "Which is the contraction for 'they are'?", options: ["their", "there", "they're", "theyre"], correctIndex: 2),
            MathExamQuestion(id: "eng_11_p8", topicId: 11, prompt: "Which compound word means a place where books are kept?", options: ["bookshelf", "notebook", "textbook", "bookmark"], correctIndex: 0),
            MathExamQuestion(id: "eng_11_p9", topicId: 11, prompt: "What is the contraction for 'will not'?", options: ["willn't", "wo'nt", "won't", "wil'nt"], correctIndex: 2),
            MathExamQuestion(id: "eng_11_p10", topicId: 11, prompt: "Which word is NOT a compound word?", options: ["football", "cupcake", "butterfly", "quickly"], correctIndex: 3)
        ],

        // Topic 12: Prefixes & Suffixes
        12: [
            MathExamQuestion(id: "eng_12_p1", topicId: 12, prompt: "What does the prefix 'un-' mean?", options: ["Again", "Not", "Before", "After"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p2", topicId: 12, prompt: "Which word has a prefix?", options: ["jumping", "retell", "played", "singer"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p3", topicId: 12, prompt: "What does the suffix '-ful' mean?", options: ["Without", "Full of", "Again", "Not"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p4", topicId: 12, prompt: "Which word uses the prefix 're-' meaning 'again'?", options: ["relate", "respect", "rebuild", "reach"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_p5", topicId: 12, prompt: "What is the suffix in the word 'fearless'?", options: ["-fear", "-less", "-ful", "-ness"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p6", topicId: 12, prompt: "What does 'unhappy' mean?", options: ["Very happy", "Not happy", "Happy again", "Most happy"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p7", topicId: 12, prompt: "Which suffix means 'without'?", options: ["-ful", "-ly", "-less", "-er"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_p8", topicId: 12, prompt: "What prefix means 'before'?", options: ["un-", "re-", "pre-", "mis-"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_p9", topicId: 12, prompt: "What does the suffix '-ness' do to an adjective?", options: ["Makes it a verb", "Makes it a noun", "Makes it plural", "Makes it negative"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_p10", topicId: 12, prompt: "Which word contains a suffix?", options: ["pre-heat", "teacher", "undo", "rebuild"], correctIndex: 1)
        ],

        // Topic 13: Synonyms & Antonyms
        13: [
            MathExamQuestion(id: "eng_13_p1", topicId: 13, prompt: "Which word is a synonym for 'happy'?", options: ["sad", "angry", "glad", "tired"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_p2", topicId: 13, prompt: "What is the antonym of 'hot'?", options: ["warm", "cold", "cool", "frozen"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_p3", topicId: 13, prompt: "Synonyms are words that...", options: ["Sound the same but mean different things", "Mean the opposite", "Have similar meanings", "Rhyme"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_p4", topicId: 13, prompt: "Which pair are antonyms?", options: ["big / large", "fast / quick", "tall / short", "sad / unhappy"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_p5", topicId: 13, prompt: "Which word is a synonym for 'begin'?", options: ["end", "stop", "start", "finish"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_p6", topicId: 13, prompt: "What is the antonym of 'light'?", options: ["bright", "dark", "glow", "shine"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_p7", topicId: 13, prompt: "Which pair are synonyms?", options: ["night / day", "fast / rapid", "hot / cold", "big / tiny"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_p8", topicId: 13, prompt: "Antonyms are words that...", options: ["Mean the same thing", "Sound the same", "Have opposite meanings", "Rhyme with each other"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_p9", topicId: 13, prompt: "Which word is a synonym for 'angry'?", options: ["calm", "furious", "happy", "sleepy"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_p10", topicId: 13, prompt: "Which word is an antonym for 'ancient'?", options: ["old", "historic", "modern", "classic"], correctIndex: 2)
        ],

        // Topic 14: Reading Comprehension
        14: [
            MathExamQuestion(id: "eng_14_p1", topicId: 14, prompt: "What is the 'main idea' of a passage?", options: ["A small detail", "What the passage is mostly about", "The last sentence", "A character's name"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p2", topicId: 14, prompt: "What is an inference?", options: ["A direct quote", "A title", "A smart guess based on clues", "A summary"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_p3", topicId: 14, prompt: "Supporting details in a passage...", options: ["Are the most important idea", "Give facts that support the main idea", "Are always in the first sentence", "Are fictional"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p4", topicId: 14, prompt: "If a passage describes 'the smell of pine trees and the crunch of leaves', where is the character probably?", options: ["At the beach", "In a forest", "In a city", "In a kitchen"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p5", topicId: 14, prompt: "What is the author's purpose when they write to explain how to do something?", options: ["To persuade", "To entertain", "To inform", "To confuse"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_p6", topicId: 14, prompt: "A good reader uses context clues to...", options: ["Skip difficult words", "Figure out the meaning of unknown words", "Read faster", "Count paragraphs"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p7", topicId: 14, prompt: "What does it mean to summarise a passage?", options: ["Copy it word for word", "State the main points briefly", "Find every detail", "Read it aloud"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p8", topicId: 14, prompt: "When an author writes to convince you of something, the purpose is to...", options: ["Inform", "Entertain", "Persuade", "Describe"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_p9", topicId: 14, prompt: "What is a 'text feature' that helps a reader?", options: ["A random word", "Headings and bold text", "The author's name", "A blank page"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_p10", topicId: 14, prompt: "To find the main idea, you should ask...", options: ["Who wrote this?", "How many pages is it?", "What is this mostly about?", "Where was it published?"], correctIndex: 2)
        ],

        // Topic 15: Story Elements
        15: [
            MathExamQuestion(id: "eng_15_p1", topicId: 15, prompt: "What is the 'setting' of a story?", options: ["The main character", "The problem in the story", "When and where the story takes place", "How the story ends"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_p2", topicId: 15, prompt: "What is the 'conflict' in a story?", options: ["The happy ending", "The main problem or challenge", "The setting", "The title"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_p3", topicId: 15, prompt: "The 'resolution' of a story is...", options: ["The beginning", "The main character", "The problem getting worse", "How the conflict is solved"], correctIndex: 3),
            MathExamQuestion(id: "eng_15_p4", topicId: 15, prompt: "Which of these is a story element?", options: ["Font size", "Characters", "Page number", "Chapter title only"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_p5", topicId: 15, prompt: "The 'protagonist' in a story is...", options: ["The villain", "The narrator", "The main character", "The setting"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_p6", topicId: 15, prompt: "In a story, the 'plot' is...", options: ["Where the story happens", "The sequence of events", "The main character's name", "The theme"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_p7", topicId: 15, prompt: "The 'theme' of a story is...", options: ["The title", "The setting", "The main message or lesson", "The first paragraph"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_p8", topicId: 15, prompt: "Which story element tells you about the world inside the story?", options: ["Theme", "Plot", "Setting", "Resolution"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_p9", topicId: 15, prompt: "In 'Goldilocks and the Three Bears', what is the conflict?", options: ["Goldilocks has no food at home", "Goldilocks enters the bears' house uninvited", "The bears go for a walk", "There are three bears"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_p10", topicId: 15, prompt: "The 'antagonist' in a story is...", options: ["The main character", "The character who creates conflict", "The narrator", "The setting"], correctIndex: 1)
        ],

        // Topic 16: Types of Sentences
        16: [
            MathExamQuestion(id: "eng_16_p1", topicId: 16, prompt: "Which type of sentence makes a statement?", options: ["Interrogative", "Exclamatory", "Declarative", "Imperative"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p2", topicId: 16, prompt: "Which sentence is interrogative?", options: ["Stop running!", "Please sit down.", "The sky is blue.", "Where are you going?"], correctIndex: 3),
            MathExamQuestion(id: "eng_16_p3", topicId: 16, prompt: "Which sentence is imperative?", options: ["I love pizza.", "What time is it?", "Close the door, please.", "That is amazing!"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p4", topicId: 16, prompt: "Which sentence is exclamatory?", options: ["She walked to school.", "What is your name?", "Come here.", "What a beautiful sunset!"], correctIndex: 3),
            MathExamQuestion(id: "eng_16_p5", topicId: 16, prompt: "A declarative sentence ends with...", options: ["!", "?", ".", ";"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p6", topicId: 16, prompt: "An interrogative sentence always...", options: ["Gives a command", "Asks a question", "Shows surprise", "States a fact"], correctIndex: 1),
            MathExamQuestion(id: "eng_16_p7", topicId: 16, prompt: "Which sentence type gives a command or request?", options: ["Declarative", "Interrogative", "Imperative", "Exclamatory"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p8", topicId: 16, prompt: "Which sentence is declarative?", options: ["Sit down!", "Do you like cats?", "Dogs are loyal animals.", "Feed the dog!"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p9", topicId: 16, prompt: "How many main types of sentences are there?", options: ["2", "3", "4", "5"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_p10", topicId: 16, prompt: "Which punctuation can end an exclamatory sentence?", options: [".", "?", ",", "!"], correctIndex: 3)
        ],

        // Topic 17: Homophones & Confused Words
        17: [
            MathExamQuestion(id: "eng_17_p1", topicId: 17, prompt: "Which is the correct use of 'there'?", options: ["Their going home.", "The book is over there.", "They're is my friend.", "There coat is red."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p2", topicId: 17, prompt: "Which sentence uses 'their' correctly?", options: ["Their going to the park.", "Put it over their.", "The children forgot their bags.", "Their is a cat outside."], correctIndex: 2),
            MathExamQuestion(id: "eng_17_p3", topicId: 17, prompt: "Homophones are words that...", options: ["Mean the same thing", "Sound the same but have different meanings", "Are spelled the same", "Are opposites"], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p4", topicId: 17, prompt: "Which is the correct use of 'to'?", options: ["I want too go.", "She went to school.", "We have two go now.", "He is to happy."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p5", topicId: 17, prompt: "Choose the correct word: 'The dog hurt ___ paw.'", options: ["its", "it's", "its'", "its's"], correctIndex: 0),
            MathExamQuestion(id: "eng_17_p6", topicId: 17, prompt: "Which sentence uses 'too' correctly?", options: ["I went too school.", "She is too tired to run.", "Too is a place.", "Too give me the book."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p7", topicId: 17, prompt: "Which pair are homophones?", options: ["there / three", "write / right", "where / were", "hear / here are"], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p8", topicId: 17, prompt: "Choose the correct word: '___ coming to the party.'", options: ["Their", "There", "They're", "Theyre"], correctIndex: 2),
            MathExamQuestion(id: "eng_17_p9", topicId: 17, prompt: "Which sentence uses 'your' correctly?", options: ["Your going to love it.", "Is that your bag?", "Your welcome.", "Your a great friend."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_p10", topicId: 17, prompt: "Choose: 'I have ___ sisters.'", options: ["to", "too", "two", "tow"], correctIndex: 2)
        ],

        // Topic 18: Parts of Speech
        18: [
            MathExamQuestion(id: "eng_18_p1", topicId: 18, prompt: "How many main parts of speech are there in English?", options: ["5", "6", "7", "8"], correctIndex: 3),
            MathExamQuestion(id: "eng_18_p2", topicId: 18, prompt: "Which part of speech replaces a noun?", options: ["Adjective", "Adverb", "Pronoun", "Conjunction"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_p3", topicId: 18, prompt: "What part of speech is 'and' in 'cats and dogs'?", options: ["Noun", "Verb", "Preposition", "Conjunction"], correctIndex: 3),
            MathExamQuestion(id: "eng_18_p4", topicId: 18, prompt: "Which word is a preposition?", options: ["run", "blue", "under", "slowly"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_p5", topicId: 18, prompt: "What part of speech is 'Wow!' in a sentence?", options: ["Noun", "Verb", "Adverb", "Interjection"], correctIndex: 3),
            MathExamQuestion(id: "eng_18_p6", topicId: 18, prompt: "In 'She quickly read the book', 'quickly' is a/an...", options: ["Adjective", "Noun", "Adverb", "Preposition"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_p7", topicId: 18, prompt: "Which word is a conjunction?", options: ["cat", "run", "but", "green"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_p8", topicId: 18, prompt: "Which part of speech shows a relationship between a noun and another word?", options: ["Conjunction", "Preposition", "Pronoun", "Interjection"], correctIndex: 1),
            MathExamQuestion(id: "eng_18_p9", topicId: 18, prompt: "In 'The fluffy cat slept', which word is an adjective?", options: ["The", "fluffy", "cat", "slept"], correctIndex: 1),
            MathExamQuestion(id: "eng_18_p10", topicId: 18, prompt: "Which part of speech names a person, place, or thing?", options: ["Verb", "Noun", "Pronoun", "Adjective"], correctIndex: 1)
        ],

        // MARK: - Practice Questions Topics 19-35 (from Part 2)

        19: [
            MathExamQuestion(id: "eng_19_p1", topicId: 19, prompt: "Which part of the sentence is the simple subject?\n'The tall oak tree stood in the yard.'", options: ["stood", "tree", "yard", "tall"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_p2", topicId: 19, prompt: "Which part is the complete predicate?\n'The happy puppy chased its tail all afternoon.'", options: ["The happy puppy", "chased its tail all afternoon", "all afternoon", "its tail"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_p3", topicId: 19, prompt: "What is the simple predicate (verb) in this sentence?\n'The students quickly finished their homework.'", options: ["students", "quickly", "finished", "homework"], correctIndex: 2),
            MathExamQuestion(id: "eng_19_p4", topicId: 19, prompt: "Identify the complete subject:\n'Several large grey elephants splashed in the river.'", options: ["Several large grey elephants", "splashed in the river", "in the river", "grey elephants"], correctIndex: 0),
            MathExamQuestion(id: "eng_19_p5", topicId: 19, prompt: "Which sentence has the subject AFTER the predicate (inverted order)?", options: ["The dog ran fast.", "There was a storm last night.", "Maria loves to paint.", "Books are on the shelf."], correctIndex: 1),
            MathExamQuestion(id: "eng_19_p6", topicId: 19, prompt: "What is the compound subject in this sentence?\n'Jake and Emma both won first place.'", options: ["Jake", "Emma", "Jake and Emma", "won first place"], correctIndex: 2),
            MathExamQuestion(id: "eng_19_p7", topicId: 19, prompt: "Which sentence has a compound predicate?", options: ["The cat sat on the mat.", "Tom and Jerry ran away.", "She sang and danced at the recital.", "The loud alarm woke everyone."], correctIndex: 2),
            MathExamQuestion(id: "eng_19_p8", topicId: 19, prompt: "In an imperative sentence like 'Close the door,' what is the subject?", options: ["door", "Close", "you (implied)", "the"], correctIndex: 2),
            MathExamQuestion(id: "eng_19_p9", topicId: 19, prompt: "What kind of subject does this sentence have?\n'Swimming is my favorite exercise.'", options: ["Noun subject", "Pronoun subject", "Gerund phrase subject", "Infinitive subject"], correctIndex: 2),
            MathExamQuestion(id: "eng_19_p10", topicId: 19, prompt: "Which sentence is missing a predicate (and is therefore a fragment)?", options: ["The dog barked loudly.", "Running through the park.", "She forgot her keys.", "We went to the movies."], correctIndex: 1)
        ],

        20: [
            MathExamQuestion(id: "eng_20_p1", topicId: 20, prompt: "Which sentence contains a SIMILE?", options: ["The moon is a silver coin.", "Her voice was thunder.", "He ran like the wind.", "The stars danced above."], correctIndex: 2),
            MathExamQuestion(id: "eng_20_p2", topicId: 20, prompt: "Which sentence contains a METAPHOR?", options: ["She smiled like a sunrise.", "The classroom was a zoo.", "The leaves fell gently.", "He shouted as loud as thunder."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_p3", topicId: 20, prompt: "What figurative language is used in: 'The wind whispered through the trees'?", options: ["Simile", "Hyperbole", "Personification", "Alliteration"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_p4", topicId: 20, prompt: "Which example uses HYPERBOLE?", options: ["The sky is very blue today.", "I've told you a thousand times!", "She sang sweetly.", "The river flowed slowly."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_p5", topicId: 20, prompt: "What device uses the same consonant sound at the start of nearby words?\n'Peter Piper picked a peck of pickled peppers.'", options: ["Onomatopoeia", "Assonance", "Alliteration", "Rhyme"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_p6", topicId: 20, prompt: "Which sentence uses ONOMATOPOEIA?", options: ["The river flowed swiftly.", "The bees buzzed lazily.", "Stars shone brightly.", "She danced gracefully."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_p7", topicId: 20, prompt: "Identify the figurative language: 'Life is a rollercoaster.'", options: ["Simile", "Metaphor", "Personification", "Hyperbole"], correctIndex: 1),
            MathExamQuestion(id: "eng_20_p8", topicId: 20, prompt: "Which type of figurative language is: 'The stars winked at us from the night sky.'?", options: ["Simile", "Alliteration", "Personification", "Hyperbole"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_p9", topicId: 20, prompt: "What makes 'as cold as ice' a simile rather than a metaphor?", options: ["It describes temperature.", "It uses 'as' to compare.", "It is about ice.", "It is a common phrase."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_p10", topicId: 20, prompt: "In 'The fog crept silently through the city streets,' what literary device is used?", options: ["Hyperbole", "Simile", "Alliteration", "Personification"], correctIndex: 3)
        ],

        21: [
            MathExamQuestion(id: "eng_21_p1", topicId: 21, prompt: "Read: 'The benevolent king was known for his kindness and generous gifts to the poor.' What does 'benevolent' most likely mean?", options: ["cruel", "wealthy", "kind and giving", "powerful"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_p2", topicId: 21, prompt: "Read: 'She was so famished after the race that she ate two sandwiches.' What does 'famished' mean?", options: ["tired", "very hungry", "excited", "thirsty"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_p3", topicId: 21, prompt: "Which type of context clue is used here?\n'The magnanimous, or very generous, donor gave millions to charity.'", options: ["Antonym clue", "Example clue", "Definition clue", "Inference clue"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_p4", topicId: 21, prompt: "Read: 'Unlike his timid brother, Marcus was audacious  -  he fearlessly jumped from the highest cliff.' What does 'audacious' mean?", options: ["quiet", "scared", "bold and daring", "clumsy"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_p5", topicId: 21, prompt: "What context clue strategy involves looking for the OPPOSITE meaning of an unknown word?", options: ["Synonym clue", "Antonym clue", "Example clue", "Definition clue"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_p6", topicId: 21, prompt: "Read: 'The amiable teacher  -  who was always smiling and willing to help  -  was loved by all students.' What does 'amiable' most likely mean?", options: ["strict", "friendly and pleasant", "intelligent", "boring"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_p7", topicId: 21, prompt: "Read: 'After the grueling marathon, the runners were exhausted.' What type of clue helps you understand 'grueling'?", options: ["A definition clue after a comma", "An inference clue from the runners being exhausted", "A synonym listed nearby", "An antonym clue"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_p8", topicId: 21, prompt: "Which sentence contains a SYNONYM context clue for the word 'luminous'?", options: ["The luminous night was unusual.", "The luminous, or glowing, orb lit the cave.", "The luminous star fell from the sky.", "Luminous things are hard to find."], correctIndex: 1),
            MathExamQuestion(id: "eng_21_p9", topicId: 21, prompt: "Read: 'He was known for his brevity; his speeches, unlike others that went on for hours, lasted only two minutes.' What does 'brevity' mean?", options: ["humor", "loudness", "shortness", "confusion"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_p10", topicId: 21, prompt: "What is the BEST strategy when you encounter an unfamiliar word in a reading passage?", options: ["Skip the word and move on.", "Look only at the sentence the word is in.", "Use surrounding sentences and the overall context to infer meaning.", "Guess randomly based on the word's first letter."], correctIndex: 2)
        ],

        22: [
            MathExamQuestion(id: "eng_22_p1", topicId: 22, prompt: "What is the MAIN IDEA of a paragraph that describes bees pollinating flowers, producing honey, and supporting ecosystems?", options: ["Bees make honey.", "Bees are important to nature.", "Flowers need bees.", "Honey is nutritious."], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p2", topicId: 22, prompt: "Where is the main idea MOST OFTEN found in a paragraph?", options: ["In the middle of the paragraph", "In the first or last sentence", "In every sentence equally", "Only in the title"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p3", topicId: 22, prompt: "Which sentence is a SUPPORTING DETAIL rather than a main idea?", options: ["Exercise benefits your health in many ways.", "Running for 30 minutes burns about 300 calories.", "Sleep is essential for good health.", "A balanced diet improves energy levels."], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p4", topicId: 22, prompt: "What is the difference between a TOPIC and a MAIN IDEA?", options: ["They are exactly the same thing.", "The topic is a word or phrase; the main idea is a complete statement about the topic.", "The main idea is shorter than the topic.", "The topic is always in the title."], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p5", topicId: 22, prompt: "An IMPLIED main idea means:", options: ["The main idea is stated in the first sentence.", "The main idea is stated in the last sentence.", "The main idea is not directly stated; the reader must infer it.", "The main idea has supporting details."], correctIndex: 2),
            MathExamQuestion(id: "eng_22_p6", topicId: 22, prompt: "Read: 'Wolves hunt in packs. They communicate through howls. They protect their territory fiercely.' What is the implied main idea?", options: ["Wolves are dangerous animals.", "Wolves are social animals with organized behaviors.", "Wolves howl at the moon.", "Wolves protect their territory."], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p7", topicId: 22, prompt: "Which detail best SUPPORTS the main idea 'Regular exercise improves mental health'?", options: ["Exercise equipment can be expensive.", "Studies show exercise reduces symptoms of anxiety and depression.", "Many people prefer outdoor activities.", "Swimming is a popular form of exercise."], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p8", topicId: 22, prompt: "What is a 'summary' in relation to main idea?", options: ["A copy of the entire text", "A list of all the details", "A brief restatement of the main idea and key supporting details", "The author's opinion about the text"], correctIndex: 2),
            MathExamQuestion(id: "eng_22_p9", topicId: 22, prompt: "A detail that is interesting but does NOT support the main idea is called:", options: ["A topic sentence", "An irrelevant detail", "A thesis statement", "A transitional sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_p10", topicId: 22, prompt: "In informational text, the main idea of the ENTIRE article is also called:", options: ["The topic sentence", "The summary", "The central idea or thesis", "The conclusion"], correctIndex: 2)
        ],

        23: [
            MathExamQuestion(id: "eng_23_p1", topicId: 23, prompt: "Which point of view uses the pronouns 'I,' 'me,' and 'we'?", options: ["Second person", "Third-person limited", "First person", "Third-person omniscient"], correctIndex: 2),
            MathExamQuestion(id: "eng_23_p2", topicId: 23, prompt: "In second-person point of view, which pronoun is used?", options: ["He", "I", "You", "They"], correctIndex: 2),
            MathExamQuestion(id: "eng_23_p3", topicId: 23, prompt: "What is THIRD-PERSON LIMITED point of view?", options: ["The narrator knows everything about all characters.", "The narrator is a character using 'I.'", "The narrator focuses on one character's thoughts and feelings.", "The narrator uses 'you' to address the reader."], correctIndex: 2),
            MathExamQuestion(id: "eng_23_p4", topicId: 23, prompt: "An OMNISCIENT narrator is one who:", options: ["Only knows their own feelings", "Knows the thoughts and feelings of all characters", "Tells the story using 'you'", "Is unreliable and untrustworthy"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_p5", topicId: 23, prompt: "Read: 'Maria thought the plan was brilliant, but she didn't know that James had other ideas.' What point of view is this?", options: ["First person", "Second person", "Third-person limited (Maria's perspective)", "Third-person omniscient"], correctIndex: 3),
            MathExamQuestion(id: "eng_23_p6", topicId: 23, prompt: "How does changing point of view affect a story?", options: ["It changes the setting of the story.", "It changes what information the reader has access to.", "It changes the genre of the story.", "It changes the theme of the story."], correctIndex: 1),
            MathExamQuestion(id: "eng_23_p7", topicId: 23, prompt: "Which sentence is written in FIRST PERSON?", options: ["She walked to the store alone.", "You should always be kind.", "I felt nervous as I stepped on stage.", "They ran as fast as they could."], correctIndex: 2),
            MathExamQuestion(id: "eng_23_p8", topicId: 23, prompt: "An UNRELIABLE NARRATOR is one who:", options: ["Knows the thoughts of all characters", "May not be telling the full truth or may misunderstand events", "Only uses second-person pronouns", "Always tells the story in chronological order"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_p9", topicId: 23, prompt: "In a story written from a VILLAIN'S first-person perspective, how might the reading experience change?", options: ["The story would have no conflict.", "Readers might sympathize with or understand the villain's motives.", "The story would be written in past tense.", "The other characters would disappear."], correctIndex: 1),
            MathExamQuestion(id: "eng_23_p10", topicId: 23, prompt: "Which type of narrator can MOST FULLY describe all characters' inner lives?", options: ["First-person narrator", "Second-person narrator", "Third-person limited narrator", "Third-person omniscient narrator"], correctIndex: 3)
        ],

        24: [
            MathExamQuestion(id: "eng_24_p1", topicId: 24, prompt: "Which signal words indicate a CAUSE AND EFFECT text structure?", options: ["First, next, finally", "However, on the other hand", "Because, therefore, as a result", "For example, such as"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_p2", topicId: 24, prompt: "Which text structure uses words like 'similarly,' 'in contrast,' and 'on the other hand'?", options: ["Sequence", "Cause and effect", "Compare and contrast", "Problem and solution"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_p3", topicId: 24, prompt: "A recipe that lists steps in order uses which text structure?", options: ["Description", "Compare and contrast", "Problem and solution", "Sequence/chronological order"], correctIndex: 3),
            MathExamQuestion(id: "eng_24_p4", topicId: 24, prompt: "An article that explains pollution and then discusses ways to clean up the environment uses which structure?", options: ["Compare and contrast", "Problem and solution", "Sequence", "Description"], correctIndex: 1),
            MathExamQuestion(id: "eng_24_p5", topicId: 24, prompt: "Which text structure describes what something looks, feels, tastes, or sounds like?", options: ["Sequence", "Compare and contrast", "Description", "Problem and solution"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_p6", topicId: 24, prompt: "Why is recognizing text structure important for readers?", options: ["It helps them read faster.", "It helps them understand how information is organized and find key ideas.", "It tells them whether the author is reliable.", "It shows them the author's opinion."], correctIndex: 1),
            MathExamQuestion(id: "eng_24_p7", topicId: 24, prompt: "Which signal word fits a SEQUENCE text structure?", options: ["Although", "However", "Subsequently", "Similarly"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_p8", topicId: 24, prompt: "A passage that discusses ways sharks and dolphins are alike and different uses which structure?", options: ["Cause and effect", "Compare and contrast", "Problem and solution", "Sequence"], correctIndex: 1),
            MathExamQuestion(id: "eng_24_p9", topicId: 24, prompt: "Read: 'Heavy rainfall caused flooding, which led to road closures and power outages.' What text structure is this?", options: ["Description", "Sequence", "Cause and effect", "Compare and contrast"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_p10", topicId: 24, prompt: "Which text structure would BEST organize an article about the history of the internet from its invention to today?", options: ["Compare and contrast", "Description", "Problem and solution", "Chronological sequence"], correctIndex: 3)
        ],

        25: [
            MathExamQuestion(id: "eng_25_p1", topicId: 25, prompt: "What is the CLIMAX of a narrative?", options: ["The introduction of characters and setting", "The resolution of the conflict", "The most exciting or tense moment of the story", "The events after the main conflict is resolved"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_p2", topicId: 25, prompt: "What is the purpose of the EXPOSITION in a story?", options: ["To resolve the conflict", "To introduce characters, setting, and background information", "To build tension toward the climax", "To provide the lesson or theme"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_p3", topicId: 25, prompt: "What is RISING ACTION in a story?", options: ["Events that happen after the climax", "The very first event in the story", "The series of events that build tension and lead to the climax", "The final resolution of the conflict"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_p4", topicId: 25, prompt: "Which element gives a narrative story its energy and drive?", options: ["Setting", "Conflict", "Dialogue tags", "Font size"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_p5", topicId: 25, prompt: "What type of conflict is shown in: 'Maya struggled to overcome her fear of failure before the big competition'?", options: ["Character vs. character", "Character vs. nature", "Character vs. society", "Character vs. self"], correctIndex: 3),
            MathExamQuestion(id: "eng_25_p6", topicId: 25, prompt: "What is the main purpose of DIALOGUE in a narrative?", options: ["To slow down the story's pacing", "To reveal character and advance the plot", "To describe the setting in detail", "To summarize what happened previously"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_p7", topicId: 25, prompt: "What is the RESOLUTION of a story?", options: ["The most exciting moment", "The part where the conflict is introduced", "How the conflict is solved or ended", "Background information about characters"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_p8", topicId: 25, prompt: "Which technique makes a narrative more VIVID and engaging for readers?", options: ["Using only simple, short sentences", "Including sensory details and descriptive language", "Avoiding all dialogue", "Stating the theme directly in the first sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_p9", topicId: 25, prompt: "What is the term for a STORY WITHIN A STORY or a scene from the past inserted into the narrative?", options: ["Foreshadowing", "Flashback", "Flash-forward", "Frame narrative"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_p10", topicId: 25, prompt: "In a personal narrative, which point of view is MOST COMMONLY used?", options: ["Second person (you)", "Third-person omniscient", "First person (I)", "Third-person limited"], correctIndex: 2)
        ],

        26: [
            MathExamQuestion(id: "eng_26_p1", topicId: 26, prompt: "What is a STANZA in a poem?", options: ["A single word that rhymes", "A group of lines forming a unit, like a paragraph in prose", "The poem's main message", "The rhythm pattern of a poem"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p2", topicId: 26, prompt: "What term describes the pattern of stressed and unstressed syllables in a poem?", options: ["Rhyme scheme", "Meter", "Stanza", "Imagery"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p3", topicId: 26, prompt: "In the rhyme scheme AABB, which lines rhyme?", options: ["Lines 1 and 3; lines 2 and 4", "Lines 1 and 2; lines 3 and 4", "All four lines rhyme together", "No lines rhyme"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p4", topicId: 26, prompt: "What type of poem has NO rhyme scheme and NO regular meter?", options: ["Sonnet", "Haiku", "Free verse", "Limerick"], correctIndex: 2),
            MathExamQuestion(id: "eng_26_p5", topicId: 26, prompt: "A HAIKU is a three-line poem with a syllable pattern of:", options: ["8-8-8", "5-7-5", "7-5-7", "4-8-4"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p6", topicId: 26, prompt: "What is IMAGERY in poetry?", options: ["Words that rhyme", "Language that appeals to the senses to create mental pictures", "The repetition of initial consonant sounds", "The poem's narrative structure"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p7", topicId: 26, prompt: "What is ALLITERATION in poetry?", options: ["Repetition of vowel sounds within words", "Words that imitate sounds", "Repetition of the same initial consonant sound in nearby words", "Comparison using 'like' or 'as'"], correctIndex: 2),
            MathExamQuestion(id: "eng_26_p8", topicId: 26, prompt: "What is ASSONANCE?", options: ["Repetition of consonant sounds at the start of words", "Repetition of vowel sounds within words", "A comparison using 'like' or 'as'", "The ending sound pattern of a poem"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_p9", topicId: 26, prompt: "A SONNET traditionally has how many lines?", options: ["8 lines", "10 lines", "14 lines", "16 lines"], correctIndex: 2),
            MathExamQuestion(id: "eng_26_p10", topicId: 26, prompt: "What does the TONE of a poem refer to?", options: ["The rhyme pattern", "The number of stanzas", "The author's attitude or feeling toward the subject", "The poem's main character"], correctIndex: 2)
        ],

        27: [
            MathExamQuestion(id: "eng_27_p1", topicId: 27, prompt: "What is an INDEPENDENT CLAUSE?", options: ["A clause that cannot stand alone as a sentence", "A clause that expresses a complete thought and can stand alone", "A clause beginning with 'because' or 'although'", "A phrase without a verb"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_p2", topicId: 27, prompt: "What is a DEPENDENT CLAUSE?", options: ["A clause that can stand alone as a complete sentence", "A clause that has no subject", "A clause that cannot stand alone; it depends on an independent clause", "A clause with two verbs"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_p3", topicId: 27, prompt: "Which word is a SUBORDINATING CONJUNCTION?", options: ["and", "but", "although", "or"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_p4", topicId: 27, prompt: "Identify the DEPENDENT CLAUSE in: 'Because she studied hard, she passed the exam.'", options: ["she passed the exam", "Because she studied hard", "she studied hard", "passed the exam"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_p5", topicId: 27, prompt: "What type of sentence has TWO or more independent clauses joined by a coordinating conjunction?", options: ["Simple sentence", "Complex sentence", "Compound sentence", "Compound-complex sentence"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_p6", topicId: 27, prompt: "A COMPOUND-COMPLEX sentence contains:", options: ["One independent clause and one dependent clause", "Two independent clauses only", "Two or more independent clauses and at least one dependent clause", "Only dependent clauses"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_p7", topicId: 27, prompt: "Which is a correctly punctuated COMPLEX sentence?", options: ["Although it rained. We had fun.", "Although it rained, we had fun.", "We had fun, although, it rained.", "It rained although we, had fun."], correctIndex: 1),
            MathExamQuestion(id: "eng_27_p8", topicId: 27, prompt: "What is a RELATIVE CLAUSE?", options: ["A clause that compares two things", "A dependent clause introduced by a relative pronoun (who, which, that)", "An independent clause with two verbs", "A phrase describing location"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_p9", topicId: 27, prompt: "In 'The book that I borrowed was amazing,' what is the relative clause?", options: ["The book", "was amazing", "that I borrowed", "The book that"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_p10", topicId: 27, prompt: "Which sentence is COMPLEX (not compound)?", options: ["I like cats and dogs.", "She sings and he dances.", "When the sun sets, the sky turns red.", "I went to school, but I forgot my bag."], correctIndex: 2)
        ],

        28: [
            MathExamQuestion(id: "eng_28_p1", topicId: 28, prompt: "In ACTIVE voice, the subject:", options: ["Receives the action of the verb", "Performs the action of the verb", "Is not mentioned in the sentence", "Is always plural"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p2", topicId: 28, prompt: "Which sentence is in PASSIVE voice?", options: ["The teacher graded the papers.", "The dog ate my homework.", "The windows were cleaned by the custodian.", "She completed the project."], correctIndex: 2),
            MathExamQuestion(id: "eng_28_p3", topicId: 28, prompt: "How is passive voice usually formed?", options: ["Subject + verb + object", "A form of 'to be' + past participle", "Subject + helping verb + infinitive", "Adjective + noun + verb"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p4", topicId: 28, prompt: "Convert to ACTIVE voice: 'The cake was baked by Grandma.'", options: ["Grandma was baking the cake.", "Grandma baked the cake.", "The cake baked by Grandma.", "Baked was the cake by Grandma."], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p5", topicId: 28, prompt: "When is PASSIVE voice most appropriate to use?", options: ["When you want to write the shortest possible sentence", "When the doer of the action is unknown or less important than the receiver", "When writing a personal narrative", "When starting every sentence in an essay"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p6", topicId: 28, prompt: "Which sentence is in ACTIVE voice?", options: ["Mistakes were made.", "The new law was passed by Congress.", "The students completed the experiment.", "The trophy was awarded to the team."], correctIndex: 2),
            MathExamQuestion(id: "eng_28_p7", topicId: 28, prompt: "Convert to PASSIVE voice: 'Scientists discovered a new planet.'", options: ["Scientists were discovering a planet.", "A new planet was discovered by scientists.", "Discovered was a new planet.", "A new planet discovered scientists."], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p8", topicId: 28, prompt: "Why is ACTIVE voice generally preferred in most writing?", options: ["It uses more words.", "It is clearer, more direct, and shows who is responsible for the action.", "It always uses shorter sentences.", "It avoids using verbs."], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p9", topicId: 28, prompt: "Identify the voice: 'The championship trophy was won by our team.'", options: ["Active voice", "Passive voice", "Both active and passive", "Neither active nor passive"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_p10", topicId: 28, prompt: "Which sentence uses the passive voice in a way that omits the agent (doer) entirely?", options: ["Maria wrote the report.", "The report was written by Maria.", "The report was written.", "Writing the report took an hour."], correctIndex: 2)
        ],

        29: [
            MathExamQuestion(id: "eng_29_p1", topicId: 29, prompt: "What is ETHOS as a rhetorical appeal?", options: ["Appealing to the audience's emotions", "Appealing to logic and evidence", "Establishing the speaker's credibility and trustworthiness", "Using exaggeration to make a point"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_p2", topicId: 29, prompt: "What is PATHOS as a rhetorical appeal?", options: ["Appealing to emotion", "Appealing to logic", "Appealing to authority", "Appealing to tradition"], correctIndex: 0),
            MathExamQuestion(id: "eng_29_p3", topicId: 29, prompt: "What is LOGOS as a rhetorical appeal?", options: ["Emotional appeal", "Appeal to authority", "Appeal to logic, facts, and evidence", "Appeal to popularity"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_p4", topicId: 29, prompt: "Which statement is an example of PATHOS?", options: ["Studies show exercise reduces disease risk by 40%.", "As a 20-year teacher, I know what students need.", "Think of the children who go to bed hungry every night.", "There are three logical reasons to support this policy."], correctIndex: 2),
            MathExamQuestion(id: "eng_29_p5", topicId: 29, prompt: "What is the CLAIM in a persuasive text?", options: ["A fact that everyone agrees with", "The evidence that supports the argument", "The main argument or position the author wants you to accept", "A counterargument the author disagrees with"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_p6", topicId: 29, prompt: "What is EVIDENCE in a persuasive argument?", options: ["The emotional language used", "Facts, statistics, expert opinions, or examples that support the claim", "The author's personal preferences", "The conclusion of the essay"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_p7", topicId: 29, prompt: "What is a COUNTERARGUMENT, and why do strong persuasive writers include one?", options: ["It is the main claim; writers include it to be clear.", "It is an opposing view; writers address it to show they understand all perspectives and strengthen their argument.", "It is irrelevant information; writers include it to seem thorough.", "It is additional evidence; writers include it to add length."], correctIndex: 1),
            MathExamQuestion(id: "eng_29_p8", topicId: 29, prompt: "Which rhetorical device repeats a word or phrase at the beginning of successive clauses? (e.g., 'We shall fight on the beaches, we shall fight on the landing grounds...')", options: ["Alliteration", "Anaphora", "Antithesis", "Assonance"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_p9", topicId: 29, prompt: "What is a LOGICAL FALLACY?", options: ["A piece of very strong evidence", "A flaw in reasoning that weakens an argument", "A type of emotional appeal", "The conclusion of an argument"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_p10", topicId: 29, prompt: "Which is an example of the 'bandwagon' logical fallacy?", options: ["You should vote for this law because it will save lives.", "Don't trust her argument  -  she's not a scientist.", "Everyone is buying this product, so you should too!", "The data shows a clear correlation between X and Y."], correctIndex: 2)
        ],

        30: [
            MathExamQuestion(id: "eng_30_p1", topicId: 30, prompt: "What is FORESHADOWING in literature?", options: ["A description of the past", "A hint or clue about what will happen later in the story", "The main theme of a story", "A character's internal monologue"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_p2", topicId: 30, prompt: "Which is an example of DRAMATIC IRONY?", options: ["A character says something they don't mean.", "The audience knows something the character doesn't.", "Two characters have different opinions.", "The ending is unexpected."], correctIndex: 1),
            MathExamQuestion(id: "eng_30_p3", topicId: 30, prompt: "What is SITUATIONAL IRONY?", options: ["When a character says the opposite of what they mean", "When the audience knows more than the character", "When the opposite of what is expected actually happens", "When two characters misunderstand each other"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_p4", topicId: 30, prompt: "What is VERBAL IRONY?", options: ["Saying one thing while meaning the opposite (like sarcasm)", "When events turn out opposite to expectations", "When the reader knows more than the character", "Comparing two unlike things"], correctIndex: 0),
            MathExamQuestion(id: "eng_30_p5", topicId: 30, prompt: "What is SYMBOLISM in literature?", options: ["When a character represents a real historical figure", "When an object, person, or place represents a larger abstract idea", "When the narrator describes the setting in detail", "When a story has a surprise ending"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_p6", topicId: 30, prompt: "What literary device gives human qualities to non-human things?", options: ["Simile", "Metaphor", "Personification", "Allusion"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_p7", topicId: 30, prompt: "What is an ALLUSION in literature?", options: ["A comparison using 'like' or 'as'", "An indirect reference to another work, person, event, or place", "An extreme exaggeration", "A repeated word or phrase"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_p8", topicId: 30, prompt: "What is JUXTAPOSITION?", options: ["Placing two contrasting ideas, characters, or settings side by side to highlight differences", "Repeating a phrase at the end of sentences", "Creating a scene that foreshadows future events", "Giving objects human characteristics"], correctIndex: 0),
            MathExamQuestion(id: "eng_30_p9", topicId: 30, prompt: "What is FLASHBACK as a literary device?", options: ["A hint about future events", "A scene that interrupts the present to show past events", "An exaggerated description", "A comparison between two ideas"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_p10", topicId: 30, prompt: "Read: 'The black storm clouds gathered as she made her decision.' What literary device is most likely being used?", options: ["Allusion", "Flashback", "Foreshadowing", "Verbal irony"], correctIndex: 2)
        ],

        31: [
            MathExamQuestion(id: "eng_31_p1", topicId: 31, prompt: "What are the three main purposes an author can have when writing?", options: ["To frighten, to confuse, to explain", "To inform, to persuade, to entertain", "To describe, to argue, to memorize", "To summarize, to predict, to create"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p2", topicId: 31, prompt: "What is AUTHOR'S BIAS?", options: ["The author's main argument", "A one-sided presentation that favors a particular viewpoint", "The author's writing style", "Facts the author includes"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p3", topicId: 31, prompt: "Which is a sign that a text may be BIASED?", options: ["It includes multiple perspectives.", "It uses only loaded or emotional language and ignores opposing views.", "It cites multiple credible sources.", "It presents data from peer-reviewed studies."], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p4", topicId: 31, prompt: "If an author writes to INFORM, the text will most likely:", options: ["Try to change the reader's opinion", "Present facts and explanations without pushing a point of view", "Tell a fictional story", "Express strong personal feelings"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p5", topicId: 31, prompt: "An author writes: 'The dangerous, reckless policy must be stopped before it destroys our community.' What is the author's purpose?", options: ["To inform", "To entertain", "To persuade", "To describe"], correctIndex: 2),
            MathExamQuestion(id: "eng_31_p6", topicId: 31, prompt: "What is a PRIMARY source?", options: ["The most important textbook on a subject", "A firsthand account or original document from the time period being studied", "A book about a historical event written 50 years later", "An encyclopedia entry"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p7", topicId: 31, prompt: "What is a SECONDARY source?", options: ["A document from the time being studied", "An analysis or interpretation of primary sources written after the fact", "An eyewitness account", "A government official document"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p8", topicId: 31, prompt: "Which question helps identify AUTHOR'S PURPOSE?", options: ["How many paragraphs does the text have?", "What does the author want me to think, feel, or do after reading this?", "Is the text fiction or nonfiction?", "How long did it take to write this text?"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_p9", topicId: 31, prompt: "What does it mean to read a text CRITICALLY?", options: ["Reading very slowly", "Accepting everything the author says as true", "Questioning the author's claims, evaluating evidence, and considering bias", "Reading only the first and last paragraphs"], correctIndex: 2),
            MathExamQuestion(id: "eng_31_p10", topicId: 31, prompt: "An article about a new diet supplement is written by the company that sells it. What concern does this raise?", options: ["The article will have too many facts.", "The article may be biased because the author has a financial interest in promoting the product.", "The article must be accurate because it's from the company.", "The article is automatically unreliable because it's about health."], correctIndex: 1)
        ],

        32: [
            MathExamQuestion(id: "eng_32_p1", topicId: 32, prompt: "What is PLAGIARISM?", options: ["Quoting an author with proper citation", "Using someone else's words or ideas without giving them credit", "Writing a summary of a source", "Paraphrasing an idea in your own words with a citation"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p2", topicId: 32, prompt: "Which type of source is MOST reliable for a research paper?", options: ["A personal blog post", "A social media post", "A peer-reviewed academic journal article", "An anonymous website"], correctIndex: 2),
            MathExamQuestion(id: "eng_32_p3", topicId: 32, prompt: "In MLA format, what does a WORKS CITED page include?", options: ["A summary of every source used", "A list of all sources cited in the paper with full citation information", "The author's notes and comments", "Background information about the topic"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p4", topicId: 32, prompt: "What is PARAPHRASING?", options: ["Copying a passage word for word", "Restating someone's idea in your own words while still citing the source", "Using quotation marks around borrowed text", "Summarizing an entire book in one sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p5", topicId: 32, prompt: "When do you use QUOTATION MARKS in research writing?", options: ["When you paraphrase an idea", "When you use an author's exact words", "When you disagree with a source", "When the source is unreliable"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p6", topicId: 32, prompt: "What does the acronym URL stand for in the context of internet sources?", options: ["Universal Research Link", "Uniform Resource Locator", "United Reference Library", "Unique Resource List"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p7", topicId: 32, prompt: "Which domain extension generally indicates a more reliable source?", options: [".com", ".biz", ".edu or .gov", ".net"], correctIndex: 2),
            MathExamQuestion(id: "eng_32_p8", topicId: 32, prompt: "What is an IN-TEXT CITATION?", options: ["A full bibliography entry at the end of the paper", "A brief reference within the text that credits a source, such as (Smith, 2021)", "A footnote at the bottom of the page", "A quote taken from a source"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p9", topicId: 32, prompt: "What is the CRAAP test used to evaluate?", options: ["Grammar and punctuation in writing", "The quality and reliability of a source (Currency, Relevance, Authority, Accuracy, Purpose)", "How well a research paper is organized", "Whether a text is fiction or nonfiction"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_p10", topicId: 32, prompt: "Why must you cite your sources in a research paper?", options: ["To make the paper look longer", "To credit original authors, avoid plagiarism, and allow readers to verify information", "Because all teachers require it regardless of reasons", "To show you read many books"], correctIndex: 1)
        ],

        33: [
            MathExamQuestion(id: "eng_33_p1", topicId: 33, prompt: "In 'Romeo and Juliet,' what is the central conflict?", options: ["A war between two kingdoms", "The forbidden love between two children of feuding families", "A prince who wants revenge", "A woman who falls in love with a ghost"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p2", topicId: 33, prompt: "In 'Macbeth,' what is Macbeth's fatal flaw?", options: ["His cowardice", "His unchecked ambition and willingness to murder for power", "His inability to make decisions", "His excessive generosity"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p3", topicId: 33, prompt: "What are the THREE witches in 'Macbeth' known as?", options: ["The Sisters of Fate", "The Weird Sisters", "The Night Prophets", "The Dark Trio"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p4", topicId: 33, prompt: "In 'A Midsummer Night's Dream,' what is Puck's role?", options: ["The king of the fairies", "A mischievous fairy who causes confusion with a love potion", "A young nobleman in love with Helena", "The villain who causes the main conflict"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p5", topicId: 33, prompt: "What famous phrase from 'Romeo and Juliet' asks why names create such division?", options: ["'To be or not to be'", "'All the world's a stage'", "'What's in a name? That which we call a rose by any other name would smell as sweet'", "'Fair is foul and foul is fair'"], correctIndex: 2),
            MathExamQuestion(id: "eng_33_p6", topicId: 33, prompt: "What literary device is used when Macbeth says 'Fair is foul, and foul is fair'?", options: ["Simile", "Alliteration", "Paradox/Antithesis", "Onomatopoeia"], correctIndex: 2),
            MathExamQuestion(id: "eng_33_p7", topicId: 33, prompt: "'Romeo and Juliet' is classified as what type of play?", options: ["Comedy", "History", "Tragedy", "Romance"], correctIndex: 2),
            MathExamQuestion(id: "eng_33_p8", topicId: 33, prompt: "In Shakespearean language, what does 'thee' mean?", options: ["I", "You", "He/She", "We"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p9", topicId: 33, prompt: "What is a SOLILOQUY in Shakespeare's plays?", options: ["A conversation between two characters", "A speech by a character alone on stage, revealing their inner thoughts", "A song performed by the chorus", "A letter read aloud to another character"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_p10", topicId: 33, prompt: "Shakespeare is believed to have invented over 1,700 English words. Which of these is a word he coined?", options: ["table", "bedroom", "house", "walk"], correctIndex: 1)
        ],

        34: [
            MathExamQuestion(id: "eng_34_p1", topicId: 34, prompt: "What does the Latin root 'bene' mean?", options: ["bad or evil", "good or well", "small or little", "strong or powerful"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p2", topicId: 34, prompt: "What does the Greek root 'bio' mean?", options: ["earth", "water", "life", "sun"], correctIndex: 2),
            MathExamQuestion(id: "eng_34_p3", topicId: 34, prompt: "The suffix '-ology' means:", options: ["one who studies", "the study of", "without", "full of"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p4", topicId: 34, prompt: "What does the Greek root 'geo' mean?", options: ["sky or air", "earth or ground", "water or sea", "fire or heat"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p5", topicId: 34, prompt: "What does the prefix 'micro' mean?", options: ["large or great", "small or tiny", "before or in front of", "under or below"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p6", topicId: 34, prompt: "The root 'graph' or 'graphy' means:", options: ["to speak", "to write or draw", "to hear", "to see"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p7", topicId: 34, prompt: "What does the Latin prefix 'mal' mean?", options: ["good", "bad or evil", "many", "again"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_p8", topicId: 34, prompt: "What does the root 'port' mean?", options: ["to carry", "to see", "to speak", "to break"], correctIndex: 0),
            MathExamQuestion(id: "eng_34_p9", topicId: 34, prompt: "The prefix 'tele' means:", options: ["under", "over", "far or distant", "around"], correctIndex: 2),
            MathExamQuestion(id: "eng_34_p10", topicId: 34, prompt: "If 'phobia' means fear, what does 'claustrophobia' most likely mean?", options: ["Fear of heights", "Fear of water", "Fear of enclosed spaces", "Fear of open spaces"], correctIndex: 2)
        ],

        35: [
            MathExamQuestion(id: "eng_35_p1", topicId: 35, prompt: "When should you use a SEMICOLON?", options: ["Before a list introduced by a complete sentence", "To join two closely related independent clauses", "After an introductory phrase", "Before a subordinating conjunction"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_p2", topicId: 35, prompt: "Which sentence uses a COLON correctly?", options: ["She brought: her backpack, lunch, and water.", "She needed three things: courage, wisdom, and kindness.", "She needed: to go to the store.", "The colon: is used after any list."], correctIndex: 1),
            MathExamQuestion(id: "eng_35_p3", topicId: 35, prompt: "What is PARALLEL STRUCTURE in writing?", options: ["Using the same grammatical form for items in a list or paired ideas", "Repeating the same word multiple times", "Using short and long sentences alternately", "Writing in first and third person"], correctIndex: 0),
            MathExamQuestion(id: "eng_35_p4", topicId: 35, prompt: "Which sentence has a MISPLACED MODIFIER?", options: ["Running quickly, the athlete won the race.", "The student who studied hard passed the test.", "She almost drove her kids to school every day.", "The loud dog woke the neighbors."], correctIndex: 2),
            MathExamQuestion(id: "eng_35_p5", topicId: 35, prompt: "When is an APOSTROPHE used for possession?", options: ["With plural nouns only", "To show that one noun owns or is associated with another", "To form all plural nouns", "Before the letter 's' in all verbs"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_p6", topicId: 35, prompt: "Which sentence demonstrates correct SUBJECT-VERB AGREEMENT?", options: ["The team are playing tomorrow.", "Neither the students nor the teacher are ready.", "Everyone in the classes need a permission slip.", "The group of students is working on the project."], correctIndex: 3),
            MathExamQuestion(id: "eng_35_p7", topicId: 35, prompt: "What is the purpose of an EM DASH ( - ) in writing?", options: ["To connect two independent clauses with no other punctuation", "To show a range of numbers", "To add emphasis, mark an interruption, or set off an appositive", "To end a sentence"], correctIndex: 2),
            MathExamQuestion(id: "eng_35_p8", topicId: 35, prompt: "Which is a DANGLING MODIFIER?", options: ["Running to catch the bus, Maria tripped.", "Exhausted from the hike, the tent was set up quickly.", "Carefully written, the essay impressed the teacher.", "Nervously, the speaker approached the podium."], correctIndex: 1),
            MathExamQuestion(id: "eng_35_p9", topicId: 35, prompt: "What is the rule for using COMMAS with a series (Oxford comma)?", options: ["Use commas only between the first two items", "Use a comma before the final 'and' in a list of three or more items", "Never use a comma before 'and'", "Use semicolons between all items in a list"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_p10", topicId: 35, prompt: "Which sentence correctly uses a HYPHEN?", options: ["She is twenty-five years old.", "She is twenty five years old.", "She is twenty - five years old.", "She is 25-years-old."], correctIndex: 0)
        ],

        36: [
        MathExamQuestion(id: "eng_36_p1", topicId: 36, prompt: "What is the main purpose of informative/explanatory writing?", options: ["To entertain with a made-up story", "To share facts and explain a topic clearly", "To convince the reader to agree with you", "To describe your personal feelings"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_p2", topicId: 36, prompt: "Which sentence would work best as a topic sentence for an informative paragraph about butterflies?", options: ["I think butterflies are the prettiest insects.", "Butterflies are colourful insects known for their beautiful wings and fascinating life cycle.", "My favourite butterfly is the Monarch.", "Butterflies make me feel happy."], correctIndex: 1),
        MathExamQuestion(id: "eng_36_p3", topicId: 36, prompt: "In a how-to text, which section comes first?", options: ["A list of materials or ingredients needed", "The conclusion", "A step-by-step guide", "A diagram"], correctIndex: 0),
        MathExamQuestion(id: "eng_36_p4", topicId: 36, prompt: "Which of these is NOT a feature of good informative writing?", options: ["Clear topic sentence", "Supporting facts and details", "Made-up events to entertain", "A concluding statement"], correctIndex: 2),
        MathExamQuestion(id: "eng_36_p5", topicId: 36, prompt: "Sam is writing an all-about report on volcanoes. Which detail best supports the topic?", options: ["I visited Hawaii once.", "Volcanoes form when magma pushes through cracks in Earth's crust.", "Mountains are very tall.", "I think volcanoes are dangerous."], correctIndex: 1),
        MathExamQuestion(id: "eng_36_p6", topicId: 36, prompt: "What does a conclusion in informative writing usually do?", options: ["Introduce a brand new topic", "Repeat the topic sentence word for word", "Sum up the main ideas and wrap up the writing", "List more facts the writer forgot"], correctIndex: 2),
        MathExamQuestion(id: "eng_36_p7", topicId: 36, prompt: "Which linking word is most useful for explaining cause and effect in informative writing?", options: ["However", "Because", "Although", "Nevertheless"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_p8", topicId: 36, prompt: "In a how-to text, which word signals the order of steps?", options: ["But", "Although", "First, Next, Finally", "Therefore"], correctIndex: 2),
        MathExamQuestion(id: "eng_36_p9", topicId: 36, prompt: "Which text feature can help readers find information quickly in an informative report?", options: ["Rhyme scheme", "Headings and subheadings", "Dialogue bubbles", "Metaphors"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_p10", topicId: 36, prompt: "Leila writes: 'Dolphins communicate using clicks and whistles.' What role does this sentence play?", options: ["Opinion statement", "Concluding sentence", "Supporting detail with a fact", "Topic sentence"], correctIndex: 2),
    ],

    37: [
        MathExamQuestion(id: "eng_37_p1", topicId: 37, prompt: "What is an opinion?", options: ["A statement that can be proven true or false", "What someone thinks or believes about a topic", "A fact found in an encyclopaedia", "A description of an event that happened"], correctIndex: 1),
        MathExamQuestion(id: "eng_37_p2", topicId: 37, prompt: "Which sentence is an opinion?", options: ["The Earth orbits the Sun.", "Dogs have four legs.", "Dogs make the best pets.", "A labrador is a breed of dog."], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p3", topicId: 37, prompt: "Which sentence is a fact?", options: ["Chocolate ice cream is the tastiest flavour.", "Summer is the best season.", "The Amazon River is in South America.", "Maths is harder than English."], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p4", topicId: 37, prompt: "In opinion writing, what do reasons do?", options: ["Distract the reader", "Support and explain your opinion", "Contradict your main point", "Replace the conclusion"], correctIndex: 1),
        MathExamQuestion(id: "eng_37_p5", topicId: 37, prompt: "Tom writes: 'I believe homework should be banned because students need time to rest after school.' What is Tom's opinion?", options: ["Students go to school.", "Homework should be banned.", "Rest is important for health.", "Schools set too much work."], correctIndex: 1),
        MathExamQuestion(id: "eng_37_p6", topicId: 37, prompt: "Which sentence starter is most suitable for stating an opinion?", options: ["According to scientists...", "In the year 1842...", "I believe that...", "The data shows that..."], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p7", topicId: 37, prompt: "Which of these is the strongest reason to support the opinion 'We should recycle more'?", options: ["Recycling is a word with many letters.", "My teacher told me to write about recycling.", "Recycling reduces waste in landfills and helps protect the environment.", "Some people like the colour green."], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p8", topicId: 37, prompt: "What is the purpose of a concluding sentence in opinion writing?", options: ["To introduce a new opinion", "To list more facts", "To restate your opinion and summarise your reasons", "To ask the reader a question"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p9", topicId: 37, prompt: "Ava writes: 'In conclusion, all schools should have a garden because it teaches responsibility and improves mental health.' What is this sentence?", options: ["A topic sentence", "A supporting detail", "A concluding statement", "A counter-argument"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_p10", topicId: 37, prompt: "Why is it important to give reasons in opinion writing?", options: ["To make the piece longer", "To prove you have good handwriting", "To help the reader understand and be persuaded by your view", "To show you can use big words"], correctIndex: 2),
    ],

    38: [
        MathExamQuestion(id: "eng_38_p1", topicId: 38, prompt: "Which sentence uses quotation marks correctly?", options: ["\"Come here, said Mia.\"", "\"Come here,\" said Mia.", "Come here, said \"Mia.\"", "Come here said, \"Mia.\""], correctIndex: 1),
        MathExamQuestion(id: "eng_38_p2", topicId: 38, prompt: "Where does the comma go in: She whispered ___ The forest is magical___?", options: ["After 'magical'", "Inside the closing quotation mark: 'magical,'", "Before 'She'", "There is no comma needed"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_p3", topicId: 38, prompt: "When a new character speaks in a story, where should you start their dialogue?", options: ["Continue on the same line", "On a new line/new paragraph", "In brackets", "At the end of the paragraph"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_p4", topicId: 38, prompt: "Which sentence punctuates a question in dialogue correctly?", options: ["\"Where are you going?\" asked Leo.", "\"Where are you going,\" asked Leo.", "\"Where are you going\" asked Leo?", "\"Where are you going.\" asked Leo."], correctIndex: 0),
        MathExamQuestion(id: "eng_38_p5", topicId: 38, prompt: "What are quotation marks used for?", options: ["To show a word is important", "To show the exact words someone spoke", "To mark the title of a book", "To separate items in a list"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_p6", topicId: 38, prompt: "Which correctly punctuates an exclamation in dialogue?", options: ["\"Watch out!\" she screamed.", "\"Watch out,\" she screamed!", "\"Watch out\" she screamed!", "Watch out! she screamed."], correctIndex: 0),
        MathExamQuestion(id: "eng_38_p7", topicId: 38, prompt: "In the sentence: Jake said, \"I will be there soon.\"  -  what is 'Jake said' called?", options: ["The dialogue", "The dialogue tag (reporting clause)", "The quotation", "The punctuation mark"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_p8", topicId: 38, prompt: "Which dialogue tag is punctuated correctly when it comes AFTER the speech?", options: ["\"Let's go,\" she suggested.", "\"Let's go.\" she suggested.", "\"Let's go\" she, suggested.", "\"Let's go\" she suggested."], correctIndex: 0),
        MathExamQuestion(id: "eng_38_p9", topicId: 38, prompt: "How many sets of quotation marks are needed for one character speaking one sentence?", options: ["One set (opening and closing)", "Two sets", "Three sets", "No quotation marks needed"], correctIndex: 0),
        MathExamQuestion(id: "eng_38_p10", topicId: 38, prompt: "Which sentence uses dialogue tags and punctuation correctly?", options: ["\"I love reading,\" said Maya.", "\"I love reading\" said, Maya.", "said Maya, \"I love reading\".", "I love reading said Maya."], correctIndex: 0),
    ],

    39: [
        MathExamQuestion(id: "eng_39_p1", topicId: 39, prompt: "Which sentence uses a possessive noun correctly?", options: ["The dogs bone is red.", "The dog's bone is red.", "The dogs' bone is red.", "The dog bone's is red."], correctIndex: 1),
        MathExamQuestion(id: "eng_39_p2", topicId: 39, prompt: "If TWO sisters share a bedroom, how do you write the possessive?", options: ["The sister's room", "The sisters's room", "The sisters' room", "The sisters room"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_p3", topicId: 39, prompt: "What is the plural of 'child'?", options: ["Childs", "Childes", "Children", "Childrens"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_p4", topicId: 39, prompt: "What is the plural of 'mouse'?", options: ["Mouses", "Mice", "Mices", "Mouse"], correctIndex: 1),
        MathExamQuestion(id: "eng_39_p5", topicId: 39, prompt: "Which word is a singular possessive noun?", options: ["Dogs", "Children", "Cat's", "Boxes"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_p6", topicId: 39, prompt: "What is the plural of 'tooth'?", options: ["Tooths", "Teeths", "Toothes", "Teeth"], correctIndex: 3),
        MathExamQuestion(id: "eng_39_p7", topicId: 39, prompt: "Which sentence means that ONE teacher owns a desk?", options: ["The teachers desk", "The teachers' desk", "The teacher's desk", "The teacher desk's"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_p8", topicId: 39, prompt: "What does the apostrophe show in 'the boy's hat'?", options: ["That 'boy' is plural", "That the hat belongs to the boy", "That a letter is missing", "That 'hat' is plural"], correctIndex: 1),
        MathExamQuestion(id: "eng_39_p9", topicId: 39, prompt: "Which is an irregular plural?", options: ["Cats", "Buses", "Feet", "Dogs"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_p10", topicId: 39, prompt: "What is the plural of 'person'?", options: ["Persons", "Peoples", "People", "Persones"], correctIndex: 2),
    ],

    40: [
        MathExamQuestion(id: "eng_40_p1", topicId: 40, prompt: "Which word should be capitalised in this sentence? 'My friend lives in paris.'", options: ["friend", "lives", "paris", "my"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_p2", topicId: 40, prompt: "Which of these always starts with a capital letter?", options: ["Common nouns like 'river'", "Adjectives like 'big'", "Proper nouns like a person's name", "Verbs like 'run'"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_p3", topicId: 40, prompt: "Which sentence is correctly capitalised?", options: ["We visited the eiffel Tower in france.", "We visited the Eiffel Tower in France.", "we visited the Eiffel tower in France.", "We visited the Eiffel tower in france."], correctIndex: 1),
        MathExamQuestion(id: "eng_40_p4", topicId: 40, prompt: "Which word does NOT need a capital letter?", options: ["Monday", "Emma", "Mountain (when used as a common noun)", "London"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_p5", topicId: 40, prompt: "Which sentence uses capitals correctly for days of the week?", options: ["We have PE on wednesday.", "We have PE on Wednesday.", "we have PE on Wednesday.", "We have pe on Wednesday."], correctIndex: 1),
        MathExamQuestion(id: "eng_40_p6", topicId: 40, prompt: "In a book title like 'The Lion, the Witch and the Wardrobe', small words like 'the' inside the title:", options: ["Are always capitalised", "Are never capitalised unless they start the title", "Are always lowercase", "Are removed from the title"], correctIndex: 1),
        MathExamQuestion(id: "eng_40_p7", topicId: 40, prompt: "Which word in this sentence needs a capital? 'Every december, we visit grandma.'", options: ["visit", "every", "december", "grandma"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_p8", topicId: 40, prompt: "Why does 'Amazon River' use capitals on both words?", options: ["Because all nouns are capitalised", "Because it is a specific named place (proper noun)", "Because it is the start of a sentence", "Because rivers are important"], correctIndex: 1),
        MathExamQuestion(id: "eng_40_p9", topicId: 40, prompt: "Which sentence is correctly capitalised throughout?", options: ["my dog Rex loves sundays.", "My dog Rex loves Sundays.", "My Dog Rex loves Sundays.", "my Dog Rex loves sundays."], correctIndex: 1),
        MathExamQuestion(id: "eng_40_p10", topicId: 40, prompt: "Should the word 'school' be capitalised in the sentence: 'I go to school every day'?", options: ["Yes, always", "No, it is a common noun here", "Yes, because it is important", "Only at the start of a sentence"], correctIndex: 1),
    ],

    41: [
        MathExamQuestion(id: "eng_41_p1", topicId: 41, prompt: "Which sentence is a simple sentence?", options: ["I went to the park, and I played football.", "Although it was raining, we stayed outside.", "The dog barked.", "She loves reading, but she also enjoys sport."], correctIndex: 2),
        MathExamQuestion(id: "eng_41_p2", topicId: 41, prompt: "Which word is most commonly used to join two independent clauses in a compound sentence?", options: ["Because", "Although", "And / But / So", "When"], correctIndex: 2),
        MathExamQuestion(id: "eng_41_p3", topicId: 41, prompt: "Which sentence is a complex sentence?", options: ["Tom runs fast.", "Tom runs fast and he wins races.", "Tom wins races, but he trains hard.", "Tom wins races because he trains every day."], correctIndex: 3),
        MathExamQuestion(id: "eng_41_p4", topicId: 41, prompt: "Why is it important to use sentence variety in your writing?", options: ["To use more paper", "To make writing more interesting and show language skill", "To avoid using full stops", "To confuse the reader"], correctIndex: 1),
        MathExamQuestion(id: "eng_41_p5", topicId: 41, prompt: "Which of these is a subordinating conjunction used to form complex sentences?", options: ["And", "But", "So", "Although"], correctIndex: 3),
        MathExamQuestion(id: "eng_41_p6", topicId: 41, prompt: "Identify the sentence type: 'We were cold, so we lit a fire.'", options: ["Simple", "Complex", "Compound", "Fragment"], correctIndex: 2),
        MathExamQuestion(id: "eng_41_p7", topicId: 41, prompt: "Which revision makes this simple sentence compound? 'She was tired.'", options: ["She was very tired.", "Although she was tired.", "She was tired, but she kept working.", "Being tired."], correctIndex: 2),
        MathExamQuestion(id: "eng_41_p8", topicId: 41, prompt: "What is a sentence fragment?", options: ["A sentence with two clauses", "An incomplete sentence that is missing a subject or verb", "A sentence with a subordinating conjunction", "A very long sentence"], correctIndex: 1),
        MathExamQuestion(id: "eng_41_p9", topicId: 41, prompt: "Which sentence is complex?", options: ["Birds sing and flowers bloom.", "Birds sing.", "Birds sing even when the weather is cold.", "Birds sing, but cats sleep."], correctIndex: 2),
        MathExamQuestion(id: "eng_41_p10", topicId: 41, prompt: "A piece of writing uses only short simple sentences. What is the best way to improve it?", options: ["Add more adjectives", "Remove some sentences", "Combine some sentences to create compound and complex sentences", "Change all verbs to past tense"], correctIndex: 2),
    ],

    42: [
        MathExamQuestion(id: "eng_42_p1", topicId: 42, prompt: "What does it mean to 'infer' something from a text?", options: ["Copy exactly what the author wrote", "Use clues and background knowledge to work out something not directly stated", "Summarise the story in one sentence", "Find the main idea stated in the text"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p2", topicId: 42, prompt: "Read: 'Lily pulled her coat tight and shivered.' What can you infer?", options: ["Lily is at the beach.", "Lily is feeling cold.", "Lily is angry.", "Lily is sleeping."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p3", topicId: 42, prompt: "Read: 'Marcus slammed his book shut and stomped out of the room.' What can you infer about Marcus?", options: ["He is excited about the book.", "He is tired and wants to sleep.", "He is upset or frustrated.", "He finished the book happily."], correctIndex: 2),
        MathExamQuestion(id: "eng_42_p4", topicId: 42, prompt: "What two things do readers combine when making an inference?", options: ["Vocabulary and punctuation", "Clues in the text and their own background knowledge", "The title and the pictures only", "The author's name and the setting"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p5", topicId: 42, prompt: "Read: 'Sofia stared at the blank page, chewed her pencil, and sighed.' What is she most likely doing?", options: ["Drawing a picture", "Trying to write something difficult", "Reading a book", "Eating lunch"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p6", topicId: 42, prompt: "Which question helps you make an inference while reading?", options: ["How many paragraphs are there?", "What clues does the author give me? What do I already know?", "Who wrote this book?", "What font is used?"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p7", topicId: 42, prompt: "Read: 'The shelves were empty, and the last customer had just left.' Where does this scene most likely take place?", options: ["A library", "A playground", "A shop or store", "A hospital"], correctIndex: 2),
        MathExamQuestion(id: "eng_42_p8", topicId: 42, prompt: "What is a 'text clue' when making an inference?", options: ["A word the author highlights in bold", "Details in the text  -  words, actions, descriptions  -  that hint at meaning", "The chapter number", "The table of contents"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_p9", topicId: 42, prompt: "Read: 'The teacher smiled and said, Excellent work today, class.' What can you infer about the lesson?", options: ["The lesson was very difficult.", "The students behaved badly.", "The students did well in the lesson.", "The teacher was angry."], correctIndex: 2),
        MathExamQuestion(id: "eng_42_p10", topicId: 42, prompt: "An inference is always:", options: ["Stated directly in the text", "A guess with no evidence", "Based on evidence from the text plus reasoning", "Found in the book's glossary"], correctIndex: 2),
    ],

    43: [
        MathExamQuestion(id: "eng_43_p1", topicId: 43, prompt: "What is a summary?", options: ["A word-for-word copy of the text", "A retelling of the most important ideas in your own words", "A list of all the vocabulary in the text", "A personal opinion about the text"], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p2", topicId: 43, prompt: "What is the difference between summarising and paraphrasing?", options: ["They are exactly the same thing", "Summarising covers the whole text; paraphrasing rewrites a specific part", "Paraphrasing is longer than the original", "Summarising uses the author's exact words"], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p3", topicId: 43, prompt: "Which is the best summary of 'Goldilocks and the Three Bears'?", options: ["Once upon a time, there was a girl named Goldilocks who had golden hair...", "A girl enters a bears' house, tries their things, and falls asleep. The bears return and she runs away.", "Goldilocks sat in Baby Bear's chair and it was just right.", "There were three bears: a Papa Bear, a Mama Bear, and a Baby Bear."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p4", topicId: 43, prompt: "When paraphrasing, you should:", options: ["Copy the sentences and change one or two words", "Use quotation marks around everything you write", "Rewrite the idea completely in your own words and sentence structure", "Only change the last sentence"], correctIndex: 2),
        MathExamQuestion(id: "eng_43_p5", topicId: 43, prompt: "What should a good summary NOT include?", options: ["The main topic", "The most important details", "Minor details and examples that support the main point", "The conclusion of the text"], correctIndex: 2),
        MathExamQuestion(id: "eng_43_p6", topicId: 43, prompt: "Original: 'Bees pollinate flowers, which allows plants to reproduce and produce fruit.' Which is the best paraphrase?", options: ["Bees pollinate flowers, which allows plants to reproduce and produce fruit.", "Bees help flowers make fruit by carrying pollen between plants.", "Bees are insects that live in hives.", "Plants need sunlight to grow."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p7", topicId: 43, prompt: "Why is summarising a useful reading skill?", options: ["It helps you memorise every detail in the text", "It forces you to identify what is most important and understand the text deeply", "It makes the text longer", "It replaces the need to read the whole text"], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p8", topicId: 43, prompt: "A student copies two sentences from the text and calls it a summary. What is wrong?", options: ["Nothing  -  copying IS summarising", "A summary must be in your own words and focus on key ideas only", "The summary is too short", "The student should have copied more sentences"], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p9", topicId: 43, prompt: "Which three questions help you write a strong summary?", options: ["Who wrote it? When? Where was it published?", "Who/What? What happened or what is it about? Why does it matter?", "What font? How many pages? What is the title?", "Is it fiction? Is it long? Is it interesting?"], correctIndex: 1),
        MathExamQuestion(id: "eng_43_p10", topicId: 43, prompt: "A paraphrase of 'The sky is very blue today' could be:", options: ["The sky is very blue today.", "The sky appears a deep shade of blue right now.", "Blue.", "It is blue and the sky is blue."], correctIndex: 1),
    ],

    44: [
        MathExamQuestion(id: "eng_44_p1", topicId: 44, prompt: "What is media literacy?", options: ["The ability to read novels quickly", "The ability to critically understand and evaluate messages from media sources", "Knowing how to use a computer", "Memorising television schedules"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p2", topicId: 44, prompt: "Which of these is an example of media?", options: ["A rock", "A television advertisement", "A maths textbook", "A fence"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p3", topicId: 44, prompt: "Which statement is a FACT?", options: ["Football is the most exciting sport.", "The Eiffel Tower is located in Paris, France.", "Paris is the most beautiful city in the world.", "French food is the best in the world."], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p4", topicId: 44, prompt: "Which statement is an OPINION?", options: ["Water boils at 100°C at sea level.", "The Amazon is the longest river in the world.", "Electric cars are better than petrol cars.", "Humans have 206 bones."], correctIndex: 2),
        MathExamQuestion(id: "eng_44_p5", topicId: 44, prompt: "An advert says '8 out of 10 cats prefer Meow Meals!' What should a media-literate person ask?", options: ["Nothing  -  statistics are always true.", "How was this research done and who paid for it?", "What flavour is Meow Meals?", "How many cats exist in the world?"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p6", topicId: 44, prompt: "What does it mean to 'evaluate the reliability' of a news source?", options: ["Deciding if the news is entertaining", "Checking whether the source is trustworthy, accurate, and unbiased", "Counting how many articles the source has written", "Judging whether the website looks attractive"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p7", topicId: 44, prompt: "A headline reads: 'Scientists prove video games cause poor grades.' A media-literate reader would:", options: ["Immediately believe it and share it", "Look for the original study and check other sources before accepting it", "Ignore it completely", "Trust it because it mentions scientists"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p8", topicId: 44, prompt: "What is a common persuasive technique used in advertising?", options: ["Presenting balanced evidence", "Using exciting language and celebrity endorsements to make products seem appealing", "Listing the product's weaknesses honestly", "Using plain text with no images"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_p9", topicId: 44, prompt: "Which is the BEST strategy for checking whether online news is trustworthy?", options: ["Share it straight away if it seems interesting", "Read only one source you already like", "Check multiple reliable sources and look for evidence", "Only read news with colourful headlines"], correctIndex: 2),
        MathExamQuestion(id: "eng_44_p10", topicId: 44, prompt: "Why is it important to tell facts apart from opinions in the media?", options: ["So you can avoid reading opinions", "To make sure you only trust your own views", "So you can make informed decisions based on what is true rather than someone's belief", "Because facts are always more interesting"], correctIndex: 2),
    ],

        45: [
        MathExamQuestion(id: "eng_45_p1", topicId: 45, prompt: "What does proofreading mean?", options: ["Writing a first draft", "Checking for errors in spelling, grammar, and punctuation", "Sharing your story with friends", "Choosing a topic to write about"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_p2", topicId: 45, prompt: "Which sentence has a spelling error?", options: ["The cat ran outside.", "She recieved a letter.", "He went to the store.", "We played in the park."], correctIndex: 1),
        MathExamQuestion(id: "eng_45_p3", topicId: 45, prompt: "What is peer review?", options: ["Reading a book alone", "A teacher grading your work", "Getting feedback on your writing from a classmate", "Writing a second draft by yourself"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_p4", topicId: 45, prompt: "Which is NOT a step in editing?", options: ["Check for spelling mistakes", "Fix punctuation errors", "Choose a new topic", "Correct grammar"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_p5", topicId: 45, prompt: "Which sentence is correctly punctuated?", options: ["Do you want to play", "Do you want to play?", "Do you want to play!", "do you want to play."], correctIndex: 1),
        MathExamQuestion(id: "eng_45_p6", topicId: 45, prompt: "What is the purpose of revision?", options: ["To write the first ideas down quickly", "To improve and refine a piece of writing", "To copy another person's work", "To choose a writing topic"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_p7", topicId: 45, prompt: "Which word is misspelled?", options: ["friend", "becaus", "place", "write"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_p8", topicId: 45, prompt: "When should you proofread your work?", options: ["Before you start writing", "While thinking of ideas", "After writing a draft", "Before choosing a topic"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_p9", topicId: 45, prompt: "A classmate says your paragraph is confusing. What is the best response?", options: ["Ignore the feedback", "Argue that you are right", "Revise the paragraph to make it clearer", "Delete the whole paragraph"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_p10", topicId: 45, prompt: "Which tool helps you check spelling?", options: ["A ruler", "A dictionary", "A calculator", "A compass"], correctIndex: 1),
    ],

    46: [
        MathExamQuestion(id: "eng_46_p1", topicId: 46, prompt: "What is the main purpose of technical writing?", options: ["To entertain readers with a story", "To give clear instructions or explain how something works", "To express personal feelings", "To write a poem"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p2", topicId: 46, prompt: "Which is an example of a procedural text?", options: ["A fairy tale", "A recipe with numbered steps", "A poem about the ocean", "A short story"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p3", topicId: 46, prompt: "Why are numbered steps important in instructions?", options: ["They make the text look fancy", "They show the correct order to follow", "They add more words to the document", "They replace diagrams"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p4", topicId: 46, prompt: "Which word best belongs in technical writing?", options: ["Once upon a time", "First, connect the cable", "I feel very happy today", "Deep in the enchanted forest"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p5", topicId: 46, prompt: "What should technical writing avoid?", options: ["Clear steps", "Simple language", "Unnecessary details and vague words", "A logical order"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_p6", topicId: 46, prompt: "A manual that explains how to set up a printer is an example of:", options: ["Poetry", "Historical fiction", "Technical writing", "A journal entry"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_p7", topicId: 46, prompt: "Which feature is common in procedural texts?", options: ["Rhyming lines", "Numbered or bulleted steps", "Character dialogue", "A plot twist"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p8", topicId: 46, prompt: "What does 'precise' mean in technical writing?", options: ["Using long, complex words", "Being vague and general", "Being exact and accurate", "Using many adjectives"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_p9", topicId: 46, prompt: "Which audience is most likely to read technical writing?", options: ["Someone looking for a bedtime story", "Someone following instructions to fix a bicycle", "Someone reading a mystery novel", "Someone enjoying a poem"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_p10", topicId: 46, prompt: "Why do technical texts often include diagrams?", options: ["To decorate the page", "To replace all written words", "To help readers understand visually", "To make the text longer"], correctIndex: 2),
    ],

    47: [
        MathExamQuestion(id: "eng_47_p1", topicId: 47, prompt: "What is a visual aid in a presentation?", options: ["Speaking very loudly", "A poster, slide, or image that supports your talk", "Reading directly from your notes", "Asking the audience questions"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p2", topicId: 47, prompt: "Why is eye contact important during a presentation?", options: ["It helps you remember your speech", "It connects you with your audience and shows confidence", "It makes your voice louder", "It replaces visual aids"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p3", topicId: 47, prompt: "What does vocal delivery include?", options: ["Your posture only", "The words on your slides", "Pace, volume, and clarity of your voice", "The color of your poster"], correctIndex: 2),
        MathExamQuestion(id: "eng_47_p4", topicId: 47, prompt: "Which is a good presentation habit?", options: ["Speaking very fast so you finish quickly", "Looking at the floor the whole time", "Practising your speech before presenting", "Reading every word off your notes"], correctIndex: 2),
        MathExamQuestion(id: "eng_47_p5", topicId: 47, prompt: "If your audience looks confused, you should:", options: ["Speak faster", "Stop and explain your point more clearly", "Move on immediately", "Lower your voice"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p6", topicId: 47, prompt: "Which is NOT a visual aid?", options: ["A poster", "A slideshow", "A diagram", "A loud sneeze"], correctIndex: 3),
        MathExamQuestion(id: "eng_47_p7", topicId: 47, prompt: "What should you do before your presentation?", options: ["Make up the content at the last minute", "Practise and know your material well", "Avoid eye contact with anyone", "Never use any notes"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p8", topicId: 47, prompt: "Speaking too quietly during a presentation is a problem because:", options: ["It sounds more dramatic", "The audience may not hear you", "It makes slides unnecessary", "It shows confidence"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p9", topicId: 47, prompt: "How should you stand when presenting?", options: ["Slouch and look at the ceiling", "Stand straight and face your audience", "Turn your back to the audience", "Sit on the floor"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_p10", topicId: 47, prompt: "What is the purpose of practising a presentation?", options: ["To waste time before the big day", "To memorise everything word-for-word only", "To feel more comfortable and improve delivery", "To replace the need for visual aids"], correctIndex: 2),
    ],

    48: [
        MathExamQuestion(id: "eng_48_p1", topicId: 48, prompt: "What is a debate?", options: ["A creative story told aloud", "A structured argument where two sides discuss a topic", "A poem recited in front of a class", "A quiz about spelling"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p2", topicId: 48, prompt: "What is a counterargument?", options: ["Your own main argument", "A response that challenges the other side's point", "A question you ask the judge", "An introduction to a debate"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p3", topicId: 48, prompt: "Which makes the strongest argument?", options: ["Personal feelings alone", "A fact supported by evidence", "A loud voice", "Guessing"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p4", topicId: 48, prompt: "What does it mean to argue 'for' a topic in a debate?", options: ["To say the topic is wrong", "To support and agree with the topic", "To remain neutral", "To ignore the topic"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p5", topicId: 48, prompt: "Which word signals a counterargument?", options: ["Furthermore", "However", "In addition", "Also"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p6", topicId: 48, prompt: "A good debater should:", options: ["Only repeat their own point louder", "Interrupt the other speaker constantly", "Listen to the other side and respond logically", "Ignore the evidence"], correctIndex: 2),
        MathExamQuestion(id: "eng_48_p7", topicId: 48, prompt: "What is evidence in an argument?", options: ["A wild guess", "Facts, statistics, or examples that support your claim", "Your personal opinion alone", "A loud declaration"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p8", topicId: 48, prompt: "Debate topic: 'Homework should be banned.' Which is a strong argument FOR this?", options: ["Homework is fun sometimes", "Homework takes time away from rest and family", "Some students like homework", "Teachers assign homework"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_p9", topicId: 48, prompt: "What should you do before a debate?", options: ["Research the topic and prepare arguments", "Make up facts", "Refuse to listen to the other side", "Choose a random opinion"], correctIndex: 0),
        MathExamQuestion(id: "eng_48_p10", topicId: 48, prompt: "Which is NOT a feature of a structured debate?", options: ["Taking turns to speak", "Using evidence", "Shouting over opponents", "Listening to the other side"], correctIndex: 2),
    ],

    49: [
        MathExamQuestion(id: "eng_49_p1", topicId: 49, prompt: "What does 'active listening' mean?", options: ["Listening while doing something else", "Paying full attention to the speaker", "Pretending to listen", "Listening only to the first sentence"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_p2", topicId: 49, prompt: "Your teacher says: 'Open your book, turn to page 10, and underline the title.' How many steps are there?", options: ["1", "2", "3", "4"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_p3", topicId: 49, prompt: "Which is a sign of good listening?", options: ["Looking out the window", "Nodding and making eye contact with the speaker", "Talking while the speaker is talking", "Thinking about lunch"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_p4", topicId: 49, prompt: "Why should you avoid distractions while listening?", options: ["Distractions are helpful", "They help you focus better", "They cause you to miss important information", "They make listening more fun"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_p5", topicId: 49, prompt: "Your teacher says: 'First wash your hands, then dry them, then put on your gloves.' What is the second step?", options: ["Wash your hands", "Dry your hands", "Put on gloves", "Get water"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_p6", topicId: 49, prompt: "What is the best thing to do if you missed part of the instructions?", options: ["Guess what to do", "Politely ask the speaker to repeat", "Do nothing", "Start a different task"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_p7", topicId: 49, prompt: "Which word helps signal the order of steps when listening?", options: ["But", "Although", "First, then, finally", "However"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_p8", topicId: 49, prompt: "Listening comprehension means:", options: ["Understanding what you hear", "Speaking loudly and clearly", "Reading silently", "Writing quickly"], correctIndex: 0),
        MathExamQuestion(id: "eng_49_p9", topicId: 49, prompt: "What should you do after hearing multi-step directions?", options: ["Start on the last step first", "Forget the steps and improvise", "Follow the steps in the correct order", "Only do the first step"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_p10", topicId: 49, prompt: "Which of these helps you remember what you heard?", options: ["Daydreaming", "Writing key words as notes", "Looking away from the speaker", "Talking to a friend"], correctIndex: 1),
    ],

    50: [
        MathExamQuestion(id: "eng_50_p1", topicId: 50, prompt: "In a story, a cause is:", options: ["What happens at the end of the story", "Why something happens", "The main character's name", "The setting of the story"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_p2", topicId: 50, prompt: "An effect is:", options: ["The reason something happened", "What happens as a result of the cause", "The title of the story", "The author's opinion"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_p3", topicId: 50, prompt: "'It rained heavily, so the game was cancelled.' What is the effect?", options: ["It rained heavily", "The game was cancelled", "The players were wet", "The coach was angry"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_p4", topicId: 50, prompt: "Which word is a clue for cause and effect?", options: ["While", "Because", "Although", "Meanwhile"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_p5", topicId: 50, prompt: "'She studied hard, so she passed the test.' What is the cause?", options: ["She passed the test", "She was nervous", "She studied hard", "The test was easy"], correctIndex: 2),
        MathExamQuestion(id: "eng_50_p6", topicId: 50, prompt: "Which sentence shows a cause-and-effect relationship?", options: ["The dog is brown.", "Tom ran fast and the bird flew.", "Maria was tired because she stayed up late.", "The book has many pages."], correctIndex: 2),
        MathExamQuestion(id: "eng_50_p7", topicId: 50, prompt: "'The ice melted as a result of the warm weather.' The cause is:", options: ["The ice melted", "The warm weather", "It was winter", "The ice was thick"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_p8", topicId: 50, prompt: "Which word does NOT signal cause and effect?", options: ["Therefore", "Because", "As a result", "Although"], correctIndex: 3),
        MathExamQuestion(id: "eng_50_p9", topicId: 50, prompt: "What question helps you find an effect?", options: ["Who is the main character?", "Where does the story happen?", "What happened as a result?", "What is the title?"], correctIndex: 2),
        MathExamQuestion(id: "eng_50_p10", topicId: 50, prompt: "'The flowers grew because they were watered daily.' How many cause-effect relationships are in this sentence?", options: ["0", "1", "2", "3"], correctIndex: 1),
    ],

    51: [
        MathExamQuestion(id: "eng_51_p1", topicId: 51, prompt: "What does 'compare' mean when reading two texts?", options: ["Find what is different", "Find what is the same", "Summarise both texts", "Find the main character"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_p2", topicId: 51, prompt: "What does 'contrast' mean when reading two texts?", options: ["Find similarities", "Find differences", "Find the theme", "Find the setting"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_p3", topicId: 51, prompt: "Which tool is often used to compare and contrast two texts?", options: ["A timeline", "A Venn diagram", "A numbered list", "A glossary"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_p4", topicId: 51, prompt: "Text A is set in a city. Text B is set in a forest. What is this an example of?", options: ["Same theme", "Same setting", "Different settings", "Same characters"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_p5", topicId: 51, prompt: "Both texts are about friendship. This is a:", options: ["Difference", "Similarity", "Contrast", "Conflict"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_p6", topicId: 51, prompt: "Which word signals a contrast?", options: ["Similarly", "Also", "Both", "However"], correctIndex: 3),
        MathExamQuestion(id: "eng_51_p7", topicId: 51, prompt: "Which word signals a comparison?", options: ["On the other hand", "In contrast", "Likewise", "But"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_p8", topicId: 51, prompt: "In a Venn diagram, where do similarities go?", options: ["Only in the left circle", "Only in the right circle", "In the overlapping middle section", "Outside both circles"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_p9", topicId: 51, prompt: "Text A and Text B both have a brave main character. In a Venn diagram, this goes:", options: ["In Text A's circle only", "In Text B's circle only", "In the overlapping section", "Outside both circles"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_p10", topicId: 51, prompt: "Text A uses facts; Text B uses a story to teach a lesson. This is a:", options: ["Similarity in purpose", "Similarity in format", "Difference in format", "Difference in topic"], correctIndex: 2),
    ],

    52: [
        MathExamQuestion(id: "eng_52_p1", topicId: 52, prompt: "What is a diary entry?", options: ["A story about someone else's life", "A personal record of your thoughts and feelings", "A news report about events", "A letter to a friend"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_p2", topicId: 52, prompt: "Which pronouns are used in diary writing?", options: ["He, she, they", "You, your", "I, me, my", "It, its"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_p3", topicId: 52, prompt: "How does a diary entry usually begin?", options: ["Once upon a time", "Dear Diary, [date]", "The following report shows", "Chapter One"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_p4", topicId: 52, prompt: "What is the purpose of keeping a journal?", options: ["To give instructions", "To write facts about science", "To reflect on your personal experiences and feelings", "To debate a topic"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_p5", topicId: 52, prompt: "Which is the best opening for a diary entry?", options: ["Once there was a dragon...", "Dear Diary, Today was amazing!", "Step 1: Wake up early.", "According to research..."], correctIndex: 1),
        MathExamQuestion(id: "eng_52_p6", topicId: 52, prompt: "A diary entry is written in which 'voice'?", options: ["Third person", "Second person", "First person", "No particular person"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_p7", topicId: 52, prompt: "Which sentence fits a diary entry?", options: ["The experiment results were positive.", "Once upon a time, a princess lived.", "I felt so proud when I scored a goal today!", "Step 3: Add two cups of flour."], correctIndex: 2),
        MathExamQuestion(id: "eng_52_p8", topicId: 52, prompt: "Why might someone write in a journal every day?", options: ["To improve technical skills", "To practise storytelling for others", "To remember events and process feelings", "To pass a test"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_p9", topicId: 52, prompt: "Which word does NOT belong in a diary entry opener?", options: ["Dear Diary", "Today", "I felt", "Step 1"], correctIndex: 3),
        MathExamQuestion(id: "eng_52_p10", topicId: 52, prompt: "A journal is similar to a diary because:", options: ["Both use third person voice", "Both are personal records of thoughts and experiences", "Both follow numbered steps", "Both argue for a position"], correctIndex: 1),
    ],

    53: [
        MathExamQuestion(id: "eng_53_p1", topicId: 53, prompt: "What is a literary genre?", options: ["A type or category of literature", "A character in a story", "The setting of a book", "The author's name"], correctIndex: 0),
        MathExamQuestion(id: "eng_53_p2", topicId: 53, prompt: "A story featuring a detective solving a crime belongs to which genre?", options: ["Fantasy", "Mystery", "Science Fiction", "Historical Fiction"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_p3", topicId: 53, prompt: "A story about space travel in the year 3000 belongs to which genre?", options: ["Realistic Fiction", "Mystery", "Science Fiction", "Historical Fiction"], correctIndex: 2),
        MathExamQuestion(id: "eng_53_p4", topicId: 53, prompt: "A story featuring dragons, magic, and wizards belongs to which genre?", options: ["Realistic Fiction", "Fantasy", "Mystery", "Historical Fiction"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_p5", topicId: 53, prompt: "A story set during World War II about a real historical event belongs to which genre?", options: ["Science Fiction", "Mystery", "Fantasy", "Historical Fiction"], correctIndex: 3),
        MathExamQuestion(id: "eng_53_p6", topicId: 53, prompt: "A story about a girl dealing with friendship problems in modern-day school belongs to which genre?", options: ["Realistic Fiction", "Fantasy", "Science Fiction", "Mystery"], correctIndex: 0),
        MathExamQuestion(id: "eng_53_p7", topicId: 53, prompt: "Which is a feature of the fantasy genre?", options: ["Robots and advanced technology", "Magic, mythical creatures, or imaginary worlds", "Real historical events", "Clues and crimes to solve"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_p8", topicId: 53, prompt: "Why is knowing the genre of a book useful?", options: ["It tells you the book's page count", "It helps you know what type of story to expect", "It tells you who illustrated the book", "It shows you the publisher"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_p9", topicId: 53, prompt: "Which genre is most likely to include robots, aliens, or futuristic inventions?", options: ["Historical Fiction", "Mystery", "Realistic Fiction", "Science Fiction"], correctIndex: 3),
        MathExamQuestion(id: "eng_53_p10", topicId: 53, prompt: "A story about a kid who finds a mysterious old map and follows clues best fits which genre?", options: ["Science Fiction", "Historical Fiction", "Mystery", "Realistic Fiction"], correctIndex: 2),
    ],

    // Topic 54: Nouns and Pronouns
    54: [
        MathExamQuestion(id: "eng_54_p1", topicId: 54, prompt: "Which of these is a noun?", options: ["run", "slowly", "mountain", "bright"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_p2", topicId: 54, prompt: "Which of these is a proper noun?", options: ["city", "dog", "London", "happiness"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_p3", topicId: 54, prompt: "Which word is a pronoun?", options: ["table", "she", "jump", "yellow"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_p4", topicId: 54, prompt: "Which pronoun replaces 'Tom and Sam'?", options: ["he", "she", "it", "they"], correctIndex: 3),
        MathExamQuestion(id: "eng_54_p5", topicId: 54, prompt: "Choose the correct pronoun: 'The book is on the shelf. ___ is red.'", options: ["He", "She", "It", "They"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_p6", topicId: 54, prompt: "Which sentence uses a pronoun correctly?", options: ["Her went to school.", "She went to school.", "Hers went to school.", "She's went to school."], correctIndex: 1),
        MathExamQuestion(id: "eng_54_p7", topicId: 54, prompt: "Which of these is a common noun?", options: ["Paris", "Emma", "river", "Monday"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_p8", topicId: 54, prompt: "What type of noun is 'kindness'?", options: ["Person noun", "Place noun", "Abstract noun", "Proper noun"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_p9", topicId: 54, prompt: "Replace the noun: 'Maya loves Maya's cat.' Which pronoun makes this correct?", options: ["his", "her", "their", "its"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_p10", topicId: 54, prompt: "Which is a plural noun?", options: ["child", "mouse", "children", "foot"], correctIndex: 2),
    ],

    // Topic 55: Verbs and Tenses
    55: [
        MathExamQuestion(id: "eng_55_p1", topicId: 55, prompt: "Which word is a verb?", options: ["happy", "swim", "quickly", "table"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_p2", topicId: 55, prompt: "Which sentence is in the past tense?", options: ["She runs every day.", "She will run tomorrow.", "She ran yesterday.", "She runs fast."], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p3", topicId: 55, prompt: "Which sentence is in the future tense?", options: ["I ate my lunch.", "I eat my lunch.", "I will eat my lunch.", "I was eating my lunch."], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p4", topicId: 55, prompt: "Which sentence is in the present tense?", options: ["The dog barked loudly.", "The dog will bark.", "The dog barks loudly.", "The dog had barked."], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p5", topicId: 55, prompt: "What is the past tense of 'run'?", options: ["runned", "runs", "ran", "running"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p6", topicId: 55, prompt: "What is the past tense of 'write'?", options: ["writed", "written", "wrote", "writing"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p7", topicId: 55, prompt: "Which word shows future tense?", options: ["played", "plays", "will play", "was playing"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p8", topicId: 55, prompt: "Choose the correct verb: 'Yesterday, she ___ a letter.'", options: ["writes", "write", "wrote", "will write"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_p9", topicId: 55, prompt: "Which sentence uses a linking verb?", options: ["She runs fast.", "The soup is hot.", "They jumped high.", "He read the book."], correctIndex: 1),
        MathExamQuestion(id: "eng_55_p10", topicId: 55, prompt: "Which sentence is in the correct tense for something happening right now?", options: ["She was sleeping.", "She sleeps now.", "She slept.", "She will sleep."], correctIndex: 1),
    ],

    // Topic 56: Adjectives and Adverbs
    56: [
        MathExamQuestion(id: "eng_56_p1", topicId: 56, prompt: "Which word is an adjective?", options: ["quickly", "beautiful", "run", "under"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_p2", topicId: 56, prompt: "Which word is an adverb?", options: ["tall", "gently", "flower", "school"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_p3", topicId: 56, prompt: "Adjectives describe which part of speech?", options: ["Verbs", "Adverbs", "Nouns", "Conjunctions"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_p4", topicId: 56, prompt: "Adverbs can describe which part of speech?", options: ["Only nouns", "Only verbs", "Only adjectives", "Verbs, adjectives, or other adverbs"], correctIndex: 3),
        MathExamQuestion(id: "eng_56_p5", topicId: 56, prompt: "Which sentence has an adjective?", options: ["She runs.", "They swim.", "The old bridge crumbled.", "We ate."], correctIndex: 2),
        MathExamQuestion(id: "eng_56_p6", topicId: 56, prompt: "Which sentence has an adverb?", options: ["The cat is fluffy.", "He spoke softly.", "A tall tree stands there.", "Red roses bloomed."], correctIndex: 1),
        MathExamQuestion(id: "eng_56_p7", topicId: 56, prompt: "What does the adjective 'enormous' tell you?", options: ["How something is done", "The size of something", "When something happens", "Where something is"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_p8", topicId: 56, prompt: "In 'She sang beautifully', what is the adverb?", options: ["She", "sang", "beautifully", "none"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_p9", topicId: 56, prompt: "Which word is a comparative adjective?", options: ["fast", "faster", "fastest", "fastly"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_p10", topicId: 56, prompt: "Which adverb tells WHEN something happens?", options: ["loudly", "here", "yesterday", "gently"], correctIndex: 2),
    ],

    // Topic 57: Punctuation
    57: [
        MathExamQuestion(id: "eng_57_p1", topicId: 57, prompt: "What punctuation mark ends a statement?", options: ["?", "!", ".", ","], correctIndex: 2),
        MathExamQuestion(id: "eng_57_p2", topicId: 57, prompt: "Which sentence is punctuated correctly?", options: ["Where are you going", "Where are you going.", "Where are you going?", "Where are you going!"], correctIndex: 2),
        MathExamQuestion(id: "eng_57_p3", topicId: 57, prompt: "What is the purpose of a comma in a list?", options: ["To end the sentence", "To separate items", "To show ownership", "To ask a question"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_p4", topicId: 57, prompt: "Which sentence uses an apostrophe for ownership?", options: ["dont go", "the dogs bone", "the dog's bone", "the dogs' bone are"], correctIndex: 2),
        MathExamQuestion(id: "eng_57_p5", topicId: 57, prompt: "Which sentence uses an exclamation mark correctly?", options: ["I like ice cream!", "Do you like ice cream!", "The sky is blue!", "She walked slowly!"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_p6", topicId: 57, prompt: "Which sentence is punctuated correctly?", options: ["I like cats dogs and birds.", "I like cats, dogs and birds.", "I like, cats dogs, and birds.", "I like cats dogs, and, birds."], correctIndex: 1),
        MathExamQuestion(id: "eng_57_p7", topicId: 57, prompt: "What does an apostrophe show in 'can't'?", options: ["Ownership", "Missing letters in a contraction", "A list", "Emphasis"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_p8", topicId: 57, prompt: "Which sentence uses a capital letter correctly?", options: ["I live in london.", "i live in London.", "I live in London.", "I Live In London."], correctIndex: 2),
        MathExamQuestion(id: "eng_57_p9", topicId: 57, prompt: "What punctuation separates two ideas that are closely related?", options: ["Comma", "Full stop", "Question mark", "Semicolon"], correctIndex: 3),
        MathExamQuestion(id: "eng_57_p10", topicId: 57, prompt: "Which sentence uses quotation marks correctly?", options: ["\"She said hello.\"", "She said \"hello.", "She said hello\".", "She \"said hello\"."], correctIndex: 0),
    ],

    // Topic 58: Reading Comprehension
    58: [
        MathExamQuestion(id: "eng_58_p1", topicId: 58, prompt: "What is the 'main idea' of a passage?", options: ["The first sentence", "What the passage is mostly about", "The last sentence", "A small detail"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_p2", topicId: 58, prompt: "What is an inference?", options: ["A direct quote from the text", "A smart guess using clues from the text", "A summary of all events", "The title of the passage"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_p3", topicId: 58, prompt: "Supporting details in a text...", options: ["Are the most important idea", "Give facts that support the main idea", "Are always found in the title", "Are fictional"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_p4", topicId: 58, prompt: "Read: 'Leo pulled on his coat and grabbed his umbrella.' What can you infer?", options: ["Leo is going swimming.", "It is probably cold or rainy outside.", "Leo is going to the shops only.", "Leo lost his bag."], correctIndex: 1),
        MathExamQuestion(id: "eng_58_p5", topicId: 58, prompt: "When an author writes to convince you of something, the purpose is to...", options: ["Inform", "Entertain", "Persuade", "Describe"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_p6", topicId: 58, prompt: "What does it mean to summarise a text?", options: ["Copy every word", "Re-read it aloud", "State the key points briefly in your own words", "Find every detail"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_p7", topicId: 58, prompt: "Which text feature helps a reader find topics quickly in a non-fiction book?", options: ["The author's name", "A blank page", "A table of contents", "The dedication page"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_p8", topicId: 58, prompt: "To understand an unknown word in a text, you should...", options: ["Skip it and move on", "Use the surrounding sentences as context clues", "Count the letters", "Look at the cover"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_p9", topicId: 58, prompt: "What question helps you find the main idea?", options: ["How many pages is this?", "Who is the author?", "What is this mostly about?", "When was this written?"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_p10", topicId: 58, prompt: "A reader who makes connections between the text and their own life is using which strategy?", options: ["Summarising", "Predicting", "Text-to-self connection", "Skimming"], correctIndex: 2),
    ],

    // Topic 59: Writing Sentences
    59: [
        MathExamQuestion(id: "eng_59_p1", topicId: 59, prompt: "Which of these is a complete sentence?", options: ["The big blue sky.", "Jumped over the fence.", "The rabbit hopped away.", "Very quietly."], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p2", topicId: 59, prompt: "What does every sentence need?", options: ["An adjective and a noun", "A subject and a predicate", "Three or more words", "A comma"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_p3", topicId: 59, prompt: "Which of these is a sentence fragment?", options: ["She smiled brightly.", "Running through the park.", "The storm came quickly.", "They went home."], correctIndex: 1),
        MathExamQuestion(id: "eng_59_p4", topicId: 59, prompt: "Which of these is a run-on sentence?", options: ["She was tired, so she slept.", "He left early.", "I was hungry I ate I felt better.", "Although it was late, she stayed."], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p5", topicId: 59, prompt: "Which sentence is written most clearly?", options: ["The dog big barked.", "Barked the big dog.", "The big dog barked.", "Big the dog barked."], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p6", topicId: 59, prompt: "Which word improves the sentence 'The dog barked'?", options: ["The dog barked.", "Dog barked the.", "The enormous dog barked fiercely.", "Barked dog the enormous."], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p7", topicId: 59, prompt: "What is the subject in 'My younger brother loves football'?", options: ["loves", "football", "My younger brother", "younger"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p8", topicId: 59, prompt: "Which sentence uses the most precise and vivid language?", options: ["The thing was nice.", "The sunset was pretty.", "The blazing sunset painted the sky orange and gold.", "It was good."], correctIndex: 2),
        MathExamQuestion(id: "eng_59_p9", topicId: 59, prompt: "Which tip best helps you check your writing?", options: ["Count the number of words", "Read your sentence aloud to hear if it sounds right", "Use the longest words possible", "Avoid using verbs"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_p10", topicId: 59, prompt: "Which sentence correctly joins two ideas?", options: ["She was tired she slept.", "She was tired, so she slept.", "She was tired, slept.", "She tired was, so slept."], correctIndex: 1),
    ],
    ]

    // MARK: - Exam Questions (Topics 1-18)

    private static let examQuestionsByTopic: [Int: [MathExamQuestion]] = [

        // Topic 1: The Alphabet & Letter Sounds
        1: [
            MathExamQuestion(id: "eng_1_e1", topicId: 1, prompt: "What is the 13th letter of the English alphabet?", options: ["L", "M", "N", "K"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e2", topicId: 1, prompt: "Which of these letters is a vowel?", options: ["T", "S", "I", "P"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_e3", topicId: 1, prompt: "How many letters come after 'R' in the alphabet?", options: ["5", "6", "7", "8"], correctIndex: 3),
            MathExamQuestion(id: "eng_1_e4", topicId: 1, prompt: "Which word starts with the /w/ sound?", options: ["vine", "wine", "dine", "pine"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e5", topicId: 1, prompt: "Which letter makes the /k/ sound in 'kite'?", options: ["c", "k", "q", "g"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e6", topicId: 1, prompt: "How many consonants are in the alphabet?", options: ["19", "20", "21", "22"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_e7", topicId: 1, prompt: "Which pair of letters are both vowels?", options: ["A and B", "E and I", "C and D", "F and G"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e8", topicId: 1, prompt: "Which word ends with the /n/ sound?", options: ["map", "bat", "pan", "top"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_e9", topicId: 1, prompt: "The letter 'Y' is sometimes treated as which type of letter?", options: ["Consonant only", "Vowel only", "Either a vowel or consonant", "Neither"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_e10", topicId: 1, prompt: "Which letter comes immediately before 'G'?", options: ["E", "F", "H", "D"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e11", topicId: 1, prompt: "Which letter can represent both the /k/ sound (as in 'cat') and the /s/ sound (as in 'city')?", options: ["G", "C", "S", "K"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_e12", topicId: 1, prompt: "How many letters in the word 'STRENGTH' are consonants?", options: ["5", "6", "7", "8"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_e13", topicId: 1, prompt: "Which two letters are most frequently silent at the start of English words (e.g., 'knight', 'gnome')?", options: ["ph and gh", "kn and gn", "wr and kn", "kn and wr"], correctIndex: 3),
            MathExamQuestion(id: "eng_1_e14", topicId: 1, prompt: "In the word 'phone', which two letters together make the /f/ sound?", options: ["ph", "pn", "ho", "oe"], correctIndex: 0),
            MathExamQuestion(id: "eng_1_e15", topicId: 1, prompt: "Which statement correctly describes the letter 'Q' in English?", options: ["It always appears alone", "It almost always appears with the letter 'U' after it", "It makes the same sound as 'K' in every word", "It is a vowel in disguise"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_h1", topicId: 1, prompt: "Which of the following statements best explains why the letters 'C' and 'K' can both represent the /k/ sound, yet English spelling uses them in different contexts?", options: ["'C' is always used before 'a', 'o', 'u', and 'K' before 'e', 'i', 'y' to maintain the /k/ sound", "'K' is older than 'C' and gradually replaced it", "They are completely interchangeable with no pattern", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_1_h2", topicId: 1, prompt: "The word 'pneumonia' begins with 'pn-' but only the /n/ sound is pronounced. What broader phonological phenomenon does this illustrate?", options: ["Double letters always go silent", "English has inherited silent consonant clusters from Greek and Latin origins", "The letter 'p' is always silent", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_1_h3", topicId: 1, prompt: "In the word 'box', the letter 'x' represents which TWO sounds blended together?", options: ["/ks/", "/gz/", "/kz/", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_1_h4", topicId: 1, prompt: "A student claims that 'y' is always a consonant. Which word provides the BEST counter-example?", options: ["yellow", "yak", "myth", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eng_1_h5", topicId: 1, prompt: "How many letters in the English alphabet can represent more than one distinct phoneme (sound)?", options: ["Only 2 (c and g)", "Only the 5 vowels", "Many consonants and all vowels can represent multiple sounds", "I don't know / Wasn't taught"], correctIndex: 2)
        ],

        // Topic 2: Short Vowels & CVC Words
        2: [
            MathExamQuestion(id: "eng_2_e1", topicId: 2, prompt: "What vowel sound is in the middle of 'wet'?", options: ["Short a", "Short e", "Short i", "Short o"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e2", topicId: 2, prompt: "Which three words are all CVC words?", options: ["bit, sat, log", "bike, lake, hope", "street, train, green", "this, that, them"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_e3", topicId: 2, prompt: "Which word has a short 'i' sound?", options: ["kite", "bite", "night", "fit"], correctIndex: 3),
            MathExamQuestion(id: "eng_2_e4", topicId: 2, prompt: "How many letters does a CVC word have?", options: ["2", "3", "4", "5"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e5", topicId: 2, prompt: "Which word does NOT have a short vowel?", options: ["hat", "hot", "hug", "hope"], correctIndex: 3),
            MathExamQuestion(id: "eng_2_e6", topicId: 2, prompt: "Which pair both have the short 'a' sound?", options: ["bat / bite", "cat / can", "cap / cape", "mad / made"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e7", topicId: 2, prompt: "Which word has the short 'o' sound?", options: ["mode", "mole", "mop", "mope"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_e8", topicId: 2, prompt: "In a CVC word, what does the middle letter represent?", options: ["Consonant", "Vowel", "Either", "Neither"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e9", topicId: 2, prompt: "Which two words both have the short 'u' sound?", options: ["cup / cube", "mud / mule", "tub / tug", "fun / fuse"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_e10", topicId: 2, prompt: "Which word is a CVC word with a short 'e' sound?", options: ["beet", "beam", "bed", "bead"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_e11", topicId: 2, prompt: "Which word contains the short 'i' sound spelled in an unusual way?", options: ["bit", "gym", "big", "sit"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e12", topicId: 2, prompt: "All five short vowels appear once each in 'elephant'. Which short vowel sounds are represented by the letters in this order?", options: ["short e, short i, short a", "short e, long e, short a", "short e, short u, short a", "long e, short i, short a"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_e13", topicId: 2, prompt: "Which pair of CVC words differ by only the vowel?", options: ["cat / bat", "hat / hot", "dog / log", "sit / sat"], correctIndex: 1),
            MathExamQuestion(id: "eng_2_e14", topicId: 2, prompt: "A word follows CVC pattern when its vowel makes the short sound. Which word violates this rule despite looking like a CVC word?", options: ["hat", "bus", "vet", "war"], correctIndex: 3),
            MathExamQuestion(id: "eng_2_e15", topicId: 2, prompt: "Which group contains ONLY words with short vowel sounds?", options: ["map, men, tip, fox, bun", "map, mane, tip, fox, bun", "map, men, tip, phone, bun", "tape, men, tip, fox, bun"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_h1", topicId: 2, prompt: "The word 'bread' contains the vowel pair 'ea' but makes a short /e/ sound. Which other word uses 'ea' to make the SAME short /e/ sound?", options: ["team", "heat", "sweat", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eng_2_h2", topicId: 2, prompt: "A student argues that 'said' contains a short vowel. Which response is most accurate?", options: ["Correct — 'ai' makes a short /e/ sound in 'said', making it an irregular spelling", "Incorrect — 'said' contains a long vowel", "Incorrect — 'said' has no vowel sound", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_h3", topicId: 2, prompt: "Which pair of words are MINIMAL PAIRS differing only by their short vowel sound?", options: ["bit / bat", "sit / site", "hop / hope", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_h4", topicId: 2, prompt: "In linguistics, the CVC pattern describes the structure of many short-vowel words. What does changing ONLY the initial consonant of a CVC word create?", options: ["A word family (rhyming set)", "A compound word", "A digraph", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_2_h5", topicId: 2, prompt: "Which statement best explains why some words with a CVC appearance (e.g., 'war', 'fur') do NOT follow standard short vowel rules?", options: ["CVC is not a real pattern", "The letters 'r', 'w', and 'l' can alter vowel sounds, producing r-controlled or l-influenced vowels instead of standard short sounds", "These words are always pronounced differently depending on accent", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        // Topic 3: Sight Words
        3: [
            MathExamQuestion(id: "eng_3_e1", topicId: 3, prompt: "Why are sight words important to learn?", options: ["They are always long words", "They help you read faster and more fluently", "They are only used in maths", "They are the hardest words in English"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e2", topicId: 3, prompt: "Which sentence uses sight words correctly?", options: ["She were happy.", "They was going.", "We are going to the park.", "He are my friend."], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e3", topicId: 3, prompt: "Which of these groups are all sight words?", options: ["elephant, bicycle, umbrella", "the, are, said, have", "running, jumping, playing", "cat, dog, bird"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e4", topicId: 3, prompt: "Complete: 'He ___ my best friend.'", options: ["are", "is", "were", "am"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e5", topicId: 3, prompt: "Which word is a sight word that shows past tense?", options: ["run", "jump", "was", "eat"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e6", topicId: 3, prompt: "Complete: 'The books ___ on the shelf.'", options: ["is", "was", "are", "am"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e7", topicId: 3, prompt: "Which sight word means 'belonging to them'?", options: ["there", "they're", "their", "the"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e8", topicId: 3, prompt: "Complete: 'I ___ a red apple.'", options: ["have", "has", "had", "having"], correctIndex: 0),
            MathExamQuestion(id: "eng_3_e9", topicId: 3, prompt: "Which of these is a sight word meaning 'in addition'?", options: ["two", "to", "too", "tow"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e10", topicId: 3, prompt: "Which group contains only sight words?", options: ["run, skip, hop", "said, were, have, they", "table, chair, lamp", "reading, writing, spelling"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e11", topicId: 3, prompt: "Why can many sight words not be decoded using standard phonics rules?", options: ["They are always very long words", "They have irregular spellings that do not follow common phonics patterns", "They are borrowed from other languages only", "They are made-up words"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e12", topicId: 3, prompt: "Choose the correct sight word for both blanks: '___ going to the park, and ___ is near the school.'", options: ["Their / it", "They're / it", "There / it", "Their / there"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e13", topicId: 3, prompt: "Which sentence uses the homophones 'there', 'their', and 'they're' all correctly?", options: ["There going to their school over they're.", "They're going to their school over there.", "Their going to they're school over there.", "There going to they're school over their."], correctIndex: 1),
            MathExamQuestion(id: "eng_3_e14", topicId: 3, prompt: "Select the sentence where every sight word is used correctly: 'She ___ said ___ was coming, but ___ not sure.'", options: ["have / she / I'm", "had / they / they're", "has / he / I'm", "were / we / your"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_e15", topicId: 3, prompt: "Which of these sight words can function as BOTH a noun and a conjunction depending on context?", options: ["was", "have", "for", "are"], correctIndex: 2),
            MathExamQuestion(id: "eng_3_h1", topicId: 3, prompt: "A fluent reader instantly recognises 'said' despite its irregular spelling. What cognitive process does this demonstrate?", options: ["Phonological decoding", "Whole-word sight recognition (orthographic mapping)", "Context guessing only", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_h2", topicId: 3, prompt: "Which sentence correctly uses 'were', 'where', and 'we're' in that order?", options: ["We're going where the others were waiting.", "Were going we're the others where waiting.", "Where going were the others we're waiting.", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_3_h3", topicId: 3, prompt: "Sight words like 'the', 'and', and 'is' are called HIGH-FREQUENCY words. Why is this term more precise than 'sight words' for instructional purposes?", options: ["They describe words that must be read visually, not sounded out", "They describe how often words appear in text, which motivates why automatic recognition is prioritised regardless of phonics regularity", "They refer only to irregular words that cannot be decoded", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_h4", topicId: 3, prompt: "Choose the sentence that correctly uses 'its' and 'it's' in the same sentence.", options: ["Its a shame that the dog lost it's collar.", "It's a shame that the dog lost its collar.", "Its a shame that the dog lost its collar.", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_3_h5", topicId: 3, prompt: "The sight word 'though' contains the letter cluster '-ough' which appears in many words with different pronunciations. In 'though', the '-ough' sounds like which other word?", options: ["'off' (as in cough)", "'oh' (as in go)", "'oo' (as in through)", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        // Topic 4: Simple Sentences
        4: [
            MathExamQuestion(id: "eng_4_e1", topicId: 4, prompt: "Which sentence has a subject and a predicate?", options: ["Running fast.", "The old tree.", "The rabbit hopped away.", "Under the bridge."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e2", topicId: 4, prompt: "What is the subject in 'My little sister loves dancing'?", options: ["loves", "dancing", "little", "My little sister"], correctIndex: 3),
            MathExamQuestion(id: "eng_4_e3", topicId: 4, prompt: "Which sentence is a complete sentence?", options: ["Because it was raining.", "The clouds were dark.", "After the game.", "When she arrived."], correctIndex: 1),
            MathExamQuestion(id: "eng_4_e4", topicId: 4, prompt: "What must every complete sentence have?", options: ["An adjective", "A subject and a verb", "Three or more words", "A comma"], correctIndex: 1),
            MathExamQuestion(id: "eng_4_e5", topicId: 4, prompt: "Which sentence is punctuated correctly?", options: ["the cat sat on the mat", "The cat sat on the mat.", "The cat sat on the mat!", "the Cat sat on the Mat."], correctIndex: 1),
            MathExamQuestion(id: "eng_4_e6", topicId: 4, prompt: "What is the predicate in 'The birds sing every morning'?", options: ["The birds", "birds", "sing every morning", "every morning"], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e7", topicId: 4, prompt: "Which of these is NOT a complete sentence?", options: ["She smiled.", "The sun rose.", "Jumping over the fence.", "They went home."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e8", topicId: 4, prompt: "Which word is the verb in 'My dog eats carrots'?", options: ["My", "dog", "eats", "carrots"], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e9", topicId: 4, prompt: "A sentence that asks something needs a...", options: ["period", "comma", "exclamation mark", "question mark"], correctIndex: 3),
            MathExamQuestion(id: "eng_4_e10", topicId: 4, prompt: "Which sentence correctly shows a command?", options: ["Are you sitting?", "She sat down.", "Sit down, please.", "Why did she sit?"], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e11", topicId: 4, prompt: "Which sentence contains a compound subject?", options: ["The teacher explained the rule.", "The cat and the dog played in the garden.", "Running is good exercise.", "She wrote a long essay."], correctIndex: 1),
            MathExamQuestion(id: "eng_4_e12", topicId: 4, prompt: "A sentence fragment is problematic because it...", options: ["Contains too many nouns", "Does not express a complete thought and confuses the reader", "Is too long for a single sentence", "Contains more than one verb"], correctIndex: 1),
            MathExamQuestion(id: "eng_4_e13", topicId: 4, prompt: "Which revision correctly turns the fragment 'Because the weather was terrible.' into a complete sentence?", options: ["Because the weather was terrible, we cancelled the match.", "Because, the weather was terrible.", "The weather was terrible because.", "Weather terrible because."], correctIndex: 0),
            MathExamQuestion(id: "eng_4_e14", topicId: 4, prompt: "In the sentence 'Every morning, the enthusiastic students quietly complete their work', what is the simple subject?", options: ["morning", "enthusiastic students", "students", "work"], correctIndex: 2),
            MathExamQuestion(id: "eng_4_e15", topicId: 4, prompt: "Which sentence is a run-on sentence?", options: ["She sang a song.", "The dog barked, and the cat hissed.", "It was raining we forgot our umbrellas we got very wet.", "Although tired, she finished."], correctIndex: 2),
            MathExamQuestion(id: "eng_4_h1", topicId: 4, prompt: "In transformational grammar, a 'kernel sentence' is the simplest declarative form. Which of these is the kernel sentence underlying 'The tall girl quickly read the long novel'?", options: ["The girl read the novel.", "She read.", "Read quickly.", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_4_h2", topicId: 4, prompt: "A comma splice occurs when two independent clauses are joined with ONLY a comma. Which sentence is a comma splice?", options: ["She was tired, so she slept.", "He left early, the meeting was boring.", "Although late, she arrived safely.", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_4_h3", topicId: 4, prompt: "Which revision of the comma splice 'I was hungry, I ate a sandwich.' uses a SEMICOLON correctly?", options: ["I was hungry; I ate a sandwich.", "I was hungry; and I ate a sandwich.", "I was hungry, and; I ate a sandwich.", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_4_h4", topicId: 4, prompt: "In the sentence 'Reluctantly, the exhausted athletes accepted defeat.', what is the grammatical function of the word 'Reluctantly'?", options: ["It is an adjective modifying 'athletes'", "It is an adverb modifying the entire verb phrase 'accepted defeat'", "It is the subject of the sentence", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_4_h5", topicId: 4, prompt: "Which of the following pairs consists of a SIMPLE sentence and a COMPOUND sentence correctly identified?", options: ["'The wind blew.' (simple) / 'The wind blew and the rain fell.' (compound)", "'The wind blew.' (compound) / 'The wind blew and the rain fell.' (simple)", "Both are simple sentences", "I don't know / Wasn't taught"], correctIndex: 0)
        ],

        // Topic 5: Rhyming & Word Families
        5: [
            MathExamQuestion(id: "eng_5_e1", topicId: 5, prompt: "Which set of words all belong to the '-ight' family?", options: ["light, night, right, sight", "lit, nit, rit, sit", "late, nate, rate, sate", "lip, nip, rip, sip"], correctIndex: 0),
            MathExamQuestion(id: "eng_5_e2", topicId: 5, prompt: "Which word does NOT rhyme with 'cake'?", options: ["lake", "make", "rake", "lack"], correctIndex: 3),
            MathExamQuestion(id: "eng_5_e3", topicId: 5, prompt: "How many words can you make from the '-an' family? Which group is correct?", options: ["can, fan, man, pan, ran", "can, fun, man, pan, run", "can, fin, man, pan, rin", "can, fen, man, pin, ren"], correctIndex: 0),
            MathExamQuestion(id: "eng_5_e4", topicId: 5, prompt: "Which pair of words rhymes?", options: ["moon / man", "star / far", "sun / son (same word)", "cloud / crowd"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_e5", topicId: 5, prompt: "What do words in the same word family share?", options: ["The same first letter", "The same number of syllables", "The same ending pattern", "The same meaning"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_e6", topicId: 5, prompt: "Which word rhymes with 'street'?", options: ["stir", "sat", "sleet", "slot"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_e7", topicId: 5, prompt: "Which word belongs to the '-ump' family?", options: ["lamp", "limp", "lump", "loop"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_e8", topicId: 5, prompt: "Which pair does NOT rhyme?", options: ["fly / sky", "goat / float", "ship / skip", "tree / free"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_e9", topicId: 5, prompt: "Which word rhymes with 'clock'?", options: ["clam", "clean", "click", "block"], correctIndex: 3),
            MathExamQuestion(id: "eng_5_e10", topicId: 5, prompt: "How many words in this set rhyme with 'blue': true, shoe, clue, grew?", options: ["1", "2", "3", "4"], correctIndex: 3),
            MathExamQuestion(id: "eng_5_e11", topicId: 5, prompt: "Which word does NOT belong to the '-ight' word family?", options: ["fight", "might", "height", "sight"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_e12", topicId: 5, prompt: "Two words are in the same word family if they share the same rime (vowel + ending). Which pair shares the SAME rime?", options: ["through / though", "coat / boat", "bear / fear", "love / cove"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_e13", topicId: 5, prompt: "Which word rhymes with 'orange'? (Select the best option given that true rhymes are rare.)", options: ["door-hinge", "storage", "porch", "lozenge"], correctIndex: 0),
            MathExamQuestion(id: "eng_5_e14", topicId: 5, prompt: "The words 'bough', 'though', 'through', and 'cough' all share the same four letters '-ough'. How many different pronunciations of '-ough' are there across these four words?", options: ["1", "2", "3", "4"], correctIndex: 3),
            MathExamQuestion(id: "eng_5_e15", topicId: 5, prompt: "Which set of words represents three different word families even though they all look similar?", options: ["cat, bat, hat", "stone, bone, tone", "love, move, cove", "light, night, right"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_h1", topicId: 5, prompt: "In poetry, a 'near rhyme' (or slant rhyme) uses words that are similar but not identical in sound. Which pair is a near rhyme?", options: ["cat / bat", "moon / spoon", "time / tame", "I don't know / Wasn't taught"], correctIndex: 2),
            MathExamQuestion(id: "eng_5_h2", topicId: 5, prompt: "The '-ight' word family (light, night, right) uses a vowel digraph 'igh'. What sound does 'igh' represent?", options: ["Short /i/", "Long /i/", "Short /e/", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_h3", topicId: 5, prompt: "Rhyme scheme is used to describe the pattern of rhymes in a poem. In a quatrain with the scheme ABAB, which lines rhyme with each other?", options: ["Lines 1 and 2 rhyme; lines 3 and 4 rhyme", "Lines 1 and 3 rhyme; lines 2 and 4 rhyme", "All four lines rhyme", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_h4", topicId: 5, prompt: "The words 'bear', 'bare', 'stare', and 'there' all share the /air/ sound but have different spellings. What is the linguistic term for words that sound the same but differ in spelling and meaning?", options: ["Synonyms", "Homophones", "Antonyms", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_5_h5", topicId: 5, prompt: "Why do linguists say English rhyming is complicated compared to languages like Spanish or Italian?", options: ["English has fewer words", "English spelling is inconsistent because it inherited words from many different languages with different spelling systems", "English has no rhyming words", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        // Topic 6: Long Vowels & Silent E
        6: [
            MathExamQuestion(id: "eng_6_e1", topicId: 6, prompt: "Which set of words all follow the silent 'e' rule?", options: ["cake, bike, hope, cute", "cat, bit, hot, cup", "cape, cape, cape, cape", "lake, late, lane, lame"], correctIndex: 0),
            MathExamQuestion(id: "eng_6_e2", topicId: 6, prompt: "What happens to the word 'rid' when you add a silent 'e'?", options: ["It becomes 'ridd'", "It becomes 'ride'", "It becomes 'ried'", "Nothing changes"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e3", topicId: 6, prompt: "Which word has a long 'o' sound?", options: ["top", "stop", "tone", "toss"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_e4", topicId: 6, prompt: "In 'time', what role does the final 'e' play?", options: ["It is pronounced", "It makes the 'i' long", "It makes the 't' silent", "It changes the meaning to plural"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e5", topicId: 6, prompt: "Which pair correctly shows the short-to-long vowel change with silent 'e'?", options: ["cat → cate", "can → cane", "cap → cap", "cup → cupe"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e6", topicId: 6, prompt: "Which of these words has a long 'a' sound?", options: ["and", "ant", "ate", "apt"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_e7", topicId: 6, prompt: "Which word does NOT follow the silent 'e' pattern?", options: ["bone", "lane", "tune", "fence"], correctIndex: 3),
            MathExamQuestion(id: "eng_6_e8", topicId: 6, prompt: "What is the long vowel sound in the word 'eve'?", options: ["Long a", "Long e", "Long i", "Long o"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e9", topicId: 6, prompt: "Which word has the long 'u' sound?", options: ["cup", "cut", "cue", "cud"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_e10", topicId: 6, prompt: "Which sentence contains a silent 'e' word?", options: ["The cat sat on the mat.", "She rode her bike to the park.", "Run fast to the finish line.", "The big red bus stopped."], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e11", topicId: 6, prompt: "Which pair shows that adding a silent 'e' changes BOTH the vowel sound AND the word's meaning significantly?", options: ["slid / slide", "bath / bathe", "hop / hope", "All of the above"], correctIndex: 3),
            MathExamQuestion(id: "eng_6_e12", topicId: 6, prompt: "What happens to the vowel in 'pine' if you remove the silent 'e'?", options: ["It becomes a long vowel", "It becomes a short vowel, giving 'pin'", "Nothing changes", "The word becomes unpronouneable"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e13", topicId: 6, prompt: "Which word has a long vowel sound achieved WITHOUT a silent 'e'?", options: ["cake", "bite", "tree", "hope"], correctIndex: 2),
            MathExamQuestion(id: "eng_6_e14", topicId: 6, prompt: "The word 'give' ends in a silent 'e' but the 'i' remains short. This shows that the silent 'e' rule...", options: ["Always works without exception", "Works in most cases, but there are exceptions in English", "Only works with the vowel 'a'", "Is not a real rule"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_e15", topicId: 6, prompt: "Which four words all demonstrate the silent 'e' rule correctly, each with a different long vowel?", options: ["cape, kite, home, cute", "cap, kit, hop, cut", "cape, kit, home, cut", "cap, kite, hop, cute"], correctIndex: 0),
            MathExamQuestion(id: "eng_6_h1", topicId: 6, prompt: "The word 'have' ends in a silent 'e' but does NOT follow the magic-e rule (the vowel 'a' remains short). Which of the following words is in the SAME exception category?", options: ["came", "give", "made", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_h2", topicId: 6, prompt: "In phonics instruction, the VCe pattern describes the magic-e rule. What do the letters V, C, and e stand for in this pattern?", options: ["Very, Careful, exception", "Vowel, Consonant, silent e", "Variant, Common, ending", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_h3", topicId: 6, prompt: "A student adds a silent 'e' to the word 'come' and expects the vowel to go long. Why does this reasoning fail?", options: ["Silent 'e' only works with the vowels 'a' and 'i'", "The word 'come' is an exception — its vowel stays short despite the VCe pattern, likely due to historical pronunciation shifts", "The word 'come' already has a long vowel", "I don't know / Wasn't taught"], correctIndex: 1),
            MathExamQuestion(id: "eng_6_h4", topicId: 6, prompt: "Long vowels can be spelled in multiple ways beyond VCe. Which set shows THREE different ways to spell the long /eɪ/ (long 'a') sound?", options: ["cake (VCe), rain (ai vowel team), they (ey pattern)", "cake (VCe), key (ey), beet (ee)", "mate (VCe), meat (ea), meet (ee)", "I don't know / Wasn't taught"], correctIndex: 0),
            MathExamQuestion(id: "eng_6_h5", topicId: 6, prompt: "If a student knows the VCe pattern, they should be able to predict the pronunciation of the nonsense word 'frupe'. Which pronunciation is most consistent with the rule?", options: ["Short /u/ as in 'cup' — froop-uh", "Long /u/ as in 'flute' — /fruːp/", "Silent — the word cannot be pronounced", "I don't know / Wasn't taught"], correctIndex: 1)
        ],

        // Topic 7: Consonant Blends & Digraphs
        7: [
            MathExamQuestion(id: "eng_7_e1", topicId: 7, prompt: "Which word starts with a consonant blend AND ends with a digraph?", options: ["frog", "that", "cloth", "shop"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e2", topicId: 7, prompt: "What is the difference between a blend and a digraph?", options: ["They are the same thing", "A blend keeps both sounds; a digraph makes one new sound", "A digraph keeps both sounds; a blend makes one new sound", "Neither can start a word"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_e3", topicId: 7, prompt: "Which set contains only digraphs?", options: ["bl, cr, tr, st", "sh, ch, th, wh", "fr, gr, pr, br", "sl, sp, sm, sn"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_e4", topicId: 7, prompt: "Which word contains a final blend?", options: ["fish", "chip", "sand", "show"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e5", topicId: 7, prompt: "What sound does 'ph' make as a digraph?", options: ["/p/", "/h/", "/f/", "/b/"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e6", topicId: 7, prompt: "Which word has the 'st' blend?", options: ["shine", "stripe", "shape", "shore"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_e7", topicId: 7, prompt: "Which set contains only consonant blends?", options: ["sh, ch, wh", "th, ph, ng", "bl, gr, str, spl", "an, in, on, un"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e8", topicId: 7, prompt: "Which word ends with the 'nk' blend?", options: ["think", "this", "thin", "thick"], correctIndex: 0),
            MathExamQuestion(id: "eng_7_e9", topicId: 7, prompt: "How many sounds do you hear in the digraph 'sh'?", options: ["0", "1", "2", "3"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_e10", topicId: 7, prompt: "Which word has BOTH a blend at the start and a digraph at the end?", options: ["fish", "stop", "bring", "stretch"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e11", topicId: 7, prompt: "The digraph 'ch' can make three different sounds. Which set correctly shows all three?", options: ["/ch/ (chair), /k/ (school), /sh/ (chef)", "/ch/ (chair), /sh/ (shy), /th/ (the)", "/k/ (king), /ch/ (chain), /g/ (gift)", "/sh/ (ship), /k/ (kick), /ch/ (each)"], correctIndex: 0),
            MathExamQuestion(id: "eng_7_e12", topicId: 7, prompt: "Which three-letter blend appears at the start of 'splash'?", options: ["sp-", "pl-", "spl-", "sh-"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e13", topicId: 7, prompt: "In the word 'strength', how many consonant blends or digraphs can be identified?", options: ["1", "2", "3", "4"], correctIndex: 1),
            MathExamQuestion(id: "eng_7_e14", topicId: 7, prompt: "Which word contains a FINAL consonant blend (at the end of the word)?", options: ["shop", "chin", "lamp", "whale"], correctIndex: 2),
            MathExamQuestion(id: "eng_7_e15", topicId: 7, prompt: "Why is it important to distinguish between blends and digraphs when decoding words?", options: ["They are used only in poetry", "Blends preserve individual letter sounds while digraphs create a single new sound, which affects how you read and spell", "Both always appear at the start of a word", "It is not important — they work the same way"], correctIndex: 1)
        ],

        // Topic 8: Nouns & Verbs
        8: [
            MathExamQuestion(id: "eng_8_e1", topicId: 8, prompt: "Which sentence contains a proper noun?", options: ["The dog ran away.", "She ate an apple.", "Paris is a city in France.", "He plays football."], correctIndex: 2),
            MathExamQuestion(id: "eng_8_e2", topicId: 8, prompt: "Which word is a linking verb?", options: ["jump", "run", "is", "eat"], correctIndex: 2),
            MathExamQuestion(id: "eng_8_e3", topicId: 8, prompt: "What is a collective noun?", options: ["A noun that names one person", "A noun that names a group", "A verb that shows action", "An adjective"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e4", topicId: 8, prompt: "In 'The team played well', which word is a collective noun?", options: ["The", "team", "played", "well"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e5", topicId: 8, prompt: "Which of these is an abstract noun?", options: ["chair", "river", "courage", "apple"], correctIndex: 2),
            MathExamQuestion(id: "eng_8_e6", topicId: 8, prompt: "Which sentence uses a verb in the past tense?", options: ["She runs every day.", "They will dance.", "He jumped over the puddle.", "We are eating."], correctIndex: 2),
            MathExamQuestion(id: "eng_8_e7", topicId: 8, prompt: "Which word is both a noun AND a verb?", options: ["quickly", "beautiful", "run", "and"], correctIndex: 2),
            MathExamQuestion(id: "eng_8_e8", topicId: 8, prompt: "Which sentence has two nouns?", options: ["Run fast.", "The cat and the dog played.", "She is happy.", "Jump high."], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e9", topicId: 8, prompt: "What is a proper noun?", options: ["A noun that is an action", "A noun that names a specific person, place, or thing", "A noun that describes", "A noun that connects"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e10", topicId: 8, prompt: "Which is a verb phrase?", options: ["the old house", "has been sleeping", "a beautiful day", "very quickly"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e11", topicId: 8, prompt: "In the sentence 'The discovery of ancient artefacts excited the archaeologists', which noun is abstract?", options: ["discovery", "artefacts", "archaeologists", "There is no abstract noun"], correctIndex: 0),
            MathExamQuestion(id: "eng_8_e12", topicId: 8, prompt: "Which sentence uses a transitive verb (a verb that requires a direct object)?", options: ["She slept.", "He disappeared.", "They sang.", "She carried the heavy box."], correctIndex: 3),
            MathExamQuestion(id: "eng_8_e13", topicId: 8, prompt: "What is the function of an auxiliary (helping) verb?", options: ["To replace the main noun", "To assist the main verb by expressing tense, mood, or aspect", "To describe the subject", "To join two sentences"], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e14", topicId: 8, prompt: "Which sentence contains a gerund (a verb form used as a noun)?", options: ["She is running fast.", "Running every morning is her habit.", "They ran in the race.", "He runs daily."], correctIndex: 1),
            MathExamQuestion(id: "eng_8_e15", topicId: 8, prompt: "The word 'light' in 'Turn on the light' (noun) versus 'Please light the candle' (verb) is an example of:", options: ["A homophone", "Synonym usage", "A word that functions as multiple parts of speech", "An irregular verb form"], correctIndex: 2)
        ],

        // Topic 9: Adjectives & Adverbs
        9: [
            MathExamQuestion(id: "eng_9_e1", topicId: 9, prompt: "Which sentence has both an adjective and an adverb?", options: ["She ran.", "The slow turtle walked steadily.", "Big dog.", "Run quickly."], correctIndex: 1),
            MathExamQuestion(id: "eng_9_e2", topicId: 9, prompt: "What is the comparative form of the adjective 'big'?", options: ["biggest", "more big", "bigger", "bigg"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e3", topicId: 9, prompt: "Which word is a superlative adjective?", options: ["taller", "tall", "tallest", "tallish"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e4", topicId: 9, prompt: "Which adverb tells us WHEN something happens?", options: ["quickly", "here", "yesterday", "loudly"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e5", topicId: 9, prompt: "Which adverb tells us WHERE something happens?", options: ["never", "there", "carefully", "soon"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_e6", topicId: 9, prompt: "In 'She is the most beautiful flower', 'most beautiful' is...", options: ["A comparative adjective", "A superlative adjective", "An adverb", "A noun"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_e7", topicId: 9, prompt: "Which word is an adjective in 'an ancient, crumbling castle'?", options: ["an", "ancient", "castle", "crumbling and ancient"], correctIndex: 1),
            MathExamQuestion(id: "eng_9_e8", topicId: 9, prompt: "Adverbs can modify which parts of speech?", options: ["Only verbs", "Only adjectives", "Verbs, adjectives, and other adverbs", "Only nouns"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e9", topicId: 9, prompt: "What is the superlative form of 'good'?", options: ["gooder", "better", "goodest", "best"], correctIndex: 3),
            MathExamQuestion(id: "eng_9_e10", topicId: 9, prompt: "In 'He spoke very quietly', which word is an adverb modifying another adverb?", options: ["He", "spoke", "very", "quietly"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e11", topicId: 9, prompt: "Which sentence uses an adjective as a subject complement (predicate adjective)?", options: ["The happy child laughed.", "The child is happy.", "She wore a happy expression.", "Happy children play."], correctIndex: 1),
            MathExamQuestion(id: "eng_9_e12", topicId: 9, prompt: "What is the irregular comparative and superlative of the adjective 'bad'?", options: ["badder / baddest", "more bad / most bad", "worse / worst", "worser / worsest"], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e13", topicId: 9, prompt: "Which sentence contains an adverb that modifies an adjective (not a verb)?", options: ["She ran quickly.", "He spoke softly.", "The exam was extremely difficult.", "They left early."], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e14", topicId: 9, prompt: "Choose the sentence where 'hard' is used as an ADVERB.", options: ["It was a hard decision.", "The hard rock didn't crack.", "She studied hard for the exam.", "He had a hard time sleeping."], correctIndex: 2),
            MathExamQuestion(id: "eng_9_e15", topicId: 9, prompt: "Which group lists adjectives in the correct natural English order before a noun?", options: ["a wooden old small box", "a small old wooden box", "a old small wooden box", "an wooden small old box"], correctIndex: 1)
        ],

        // Topic 10: Punctuation
        10: [
            MathExamQuestion(id: "eng_10_e1", topicId: 10, prompt: "Which sentence uses a semicolon correctly?", options: ["She likes cats; she also likes dogs.", "She; likes cats and dogs.", "She likes; cats and dogs.", "She likes cats and; dogs."], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e2", topicId: 10, prompt: "When do you use a colon (:)?", options: ["To end a sentence", "To separate two independent clauses", "Before a list or explanation", "Inside a quoted phrase"], correctIndex: 2),
            MathExamQuestion(id: "eng_10_e3", topicId: 10, prompt: "Which sentence correctly uses quotation marks?", options: ["She said, \"Hello!\"", "She said, 'Hello!\"", "\"She said, Hello!\"", "She \"said, Hello!\""], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e4", topicId: 10, prompt: "Which sentence uses an apostrophe correctly for possession?", options: ["The boys' jackets were blue.", "The boys jacket's were blue.", "The boy's' jackets were blue.", "The boys jackets' were blue."], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e5", topicId: 10, prompt: "Where does a comma go when addressing someone by name?", options: ["Before the sentence only", "After their name or to separate it from the rest", "At the end of the sentence", "It is never used with names"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e6", topicId: 10, prompt: "Which is a correct use of a hyphen?", options: ["re-do the work", "the well-known author", "she ran quickly-", "cats-and-dogs"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e7", topicId: 10, prompt: "Which sentence has ALL punctuation correct?", options: ["have you seen my dog", "Have you seen my dog?", "Have you seen my dog!", "have you seen my dog?"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e8", topicId: 10, prompt: "An ellipsis (...) is used to show...", options: ["The end of a sentence", "A pause or that something is left out", "A list", "Ownership"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e9", topicId: 10, prompt: "Which correctly punctuates a direct address?", options: ["Come here Tom!", "Come here, Tom!", "Come, here Tom!", "Come here Tom?"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e10", topicId: 10, prompt: "Which sentence uses a comma correctly with a conjunction?", options: ["She was tired, and she kept going.", "She was tired and, she kept going.", "She was, tired and she kept going.", "She was tired and she, kept going."], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e11", topicId: 10, prompt: "What is the Oxford comma, and which sentence uses it?", options: ["A comma before 'and' in a list; 'She bought milk, bread, and eggs.'", "A comma after an introductory clause only; 'However, she was tired.'", "A comma used in British English only; 'She, he and they went.'", "A comma never used before 'and' in English"], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e12", topicId: 10, prompt: "Which sentence correctly uses parentheses (brackets) to add non-essential information?", options: ["The concert (was amazing) and long.", "The concert was amazing (and I cried during the final song).", "The (concert was) amazing and long.", "The concert was (amazing and long)."], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e13", topicId: 10, prompt: "A sentence ends with a quotation that is itself a question. Which punctuation is correct?", options: ["He asked, \"Are you coming?\".", "He asked, \"Are you coming?\"", "He asked, \"Are you coming.\"?", "He asked, \"Are you coming\"?"], correctIndex: 1),
            MathExamQuestion(id: "eng_10_e14", topicId: 10, prompt: "Which sentence correctly uses a dash to interrupt and add emphasis?", options: ["She finally did it—she broke the world record.", "She finally—did it she broke the world record.", "She finally did it she—broke the world record.", "She—finally did it, she broke the world record."], correctIndex: 0),
            MathExamQuestion(id: "eng_10_e15", topicId: 10, prompt: "When using a semicolon to join two independent clauses, what must be true of each clause?", options: ["One must be a question", "Both must be independent clauses that are closely related in meaning", "The second clause must begin with 'and'", "One must be longer than the other"], correctIndex: 1)
        ],

        // Topic 11: Compound Words & Contractions
        11: [
            MathExamQuestion(id: "eng_11_e1", topicId: 11, prompt: "Which compound word describes a place where books are stored?", options: ["bookworm", "bookshelf", "notebook", "bookmark"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e2", topicId: 11, prompt: "What is the full form of the contraction 'couldn't'?", options: ["could not", "could now", "could nothing", "could note"], correctIndex: 0),
            MathExamQuestion(id: "eng_11_e3", topicId: 11, prompt: "Which of these is an 'open' compound word (written as two words)?", options: ["sunflower", "ice cream", "butterfly", "bedroom"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e4", topicId: 11, prompt: "Which contraction is formed from 'she would'?", options: ["she'ld", "she'd", "she'll", "she's"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e5", topicId: 11, prompt: "Which sentence uses a contraction correctly?", options: ["I ca'nt find my keys.", "I can't find my keys.", "I cant' find my keys.", "I cann't find my keys."], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e6", topicId: 11, prompt: "Which compound word means 'a place to park planes'?", options: ["airmail", "airfield", "airline", "airwave"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e7", topicId: 11, prompt: "What is 'they would' as a contraction?", options: ["they'll", "they'd", "they've", "they're"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e8", topicId: 11, prompt: "Which compound word is an insect?", options: ["sunburn", "butterfly", "doorbell", "football"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e9", topicId: 11, prompt: "Which of these is NOT a contraction?", options: ["I'm", "we'll", "can't", "rainbow"], correctIndex: 3),
            MathExamQuestion(id: "eng_11_e10", topicId: 11, prompt: "What two words make up 'earthquake'?", options: ["earth + quake", "ear + thquake", "eart + hquake", "e + arthquake"], correctIndex: 0),
            MathExamQuestion(id: "eng_11_e11", topicId: 11, prompt: "Which of the following is a hyphenated compound word?", options: ["sunflower", "well-being", "bedroom", "rainfall"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e12", topicId: 11, prompt: "The contraction 'it's' is ONLY ever short for which words?", options: ["its own / it owns", "it is / it has", "it was / it will", "it should / it could"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e13", topicId: 11, prompt: "Which sentence incorrectly confuses a contraction with a possessive pronoun?", options: ["It's raining outside.", "The dog wagged it's tail.", "They're going to the park.", "You're my best friend."], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e14", topicId: 11, prompt: "Which compound word has changed meaning significantly from the sum of its parts (idiomatic compound)?", options: ["bookshelf", "butterfly", "bedroom", "sunlight"], correctIndex: 1),
            MathExamQuestion(id: "eng_11_e15", topicId: 11, prompt: "Which contraction correctly represents 'we would have'?", options: ["we'd've", "we'dve", "we've'd", "wed've"], correctIndex: 0)
        ],

        // Topic 12: Prefixes & Suffixes
        12: [
            MathExamQuestion(id: "eng_12_e1", topicId: 12, prompt: "What does the prefix 'mis-' mean?", options: ["Before", "Again", "Wrongly", "Not"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e2", topicId: 12, prompt: "Which word uses the suffix '-tion' to make a noun from a verb?", options: ["quickly", "action", "beautiful", "redo"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_e3", topicId: 12, prompt: "What does 'prehistoric' mean?", options: ["After history", "During history", "Before recorded history", "Part of history"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e4", topicId: 12, prompt: "Which word uses the prefix 'inter-' meaning 'between'?", options: ["international", "internal", "interested", "internet  -  all of these"], correctIndex: 0),
            MathExamQuestion(id: "eng_12_e5", topicId: 12, prompt: "What does the suffix '-able' mean?", options: ["Without", "Full of", "Capable of being", "The state of"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e6", topicId: 12, prompt: "Which suffix changes a noun into an adjective meaning 'relating to'?", options: ["-tion", "-ness", "-al", "-ly"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e7", topicId: 12, prompt: "What does 'misspell' mean?", options: ["Spell correctly", "Spell again", "Spell wrongly", "Spell before"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e8", topicId: 12, prompt: "Which prefix means 'against' or 'opposite'?", options: ["pre-", "anti-", "re-", "un-"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_e9", topicId: 12, prompt: "What does the suffix '-er' do to a verb like 'teach'?", options: ["Makes it negative", "Makes it a person who does the action", "Makes it an adverb", "Makes it plural"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_e10", topicId: 12, prompt: "What does 'submarine' literally mean based on its prefix?", options: ["Above the sea", "Beside the sea", "Below the sea", "Across the sea"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e11", topicId: 12, prompt: "The suffix '-ify' means 'to make'. Which word correctly uses it to mean 'to make more intense'?", options: ["clarify", "intensify", "notify", "justify"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_e12", topicId: 12, prompt: "Which word uses the prefix 'trans-' meaning 'across or through'?", options: ["transport", "translate", "transplant", "All of the above"], correctIndex: 3),
            MathExamQuestion(id: "eng_12_e13", topicId: 12, prompt: "What does the prefix 'circum-' mean, as in 'circumnavigate'?", options: ["Against", "Around", "Before", "Above"], correctIndex: 1),
            MathExamQuestion(id: "eng_12_e14", topicId: 12, prompt: "The suffix '-ous' makes an adjective meaning 'full of' or 'having the quality of'. Which word does NOT use this suffix?", options: ["dangerous", "famous", "jealous", "serious"], correctIndex: 2),
            MathExamQuestion(id: "eng_12_e15", topicId: 12, prompt: "Adding the prefix 'un-' and suffix '-able' to 'predict' creates which word, and what does it mean?", options: ["unpredictable — cannot be predicted", "unpredictible — not clear", "unpredictable — predicted wrongly", "unpredictable — predicted again"], correctIndex: 0)
        ],

        // Topic 13: Synonyms & Antonyms
        13: [
            MathExamQuestion(id: "eng_13_e1", topicId: 13, prompt: "Which word is the best synonym for 'enormous'?", options: ["tiny", "medium", "huge", "average"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e2", topicId: 13, prompt: "What is the antonym of 'generous'?", options: ["kind", "selfish", "giving", "friendly"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_e3", topicId: 13, prompt: "Which pair are synonyms?", options: ["brave / cowardly", "quick / rapid", "heavy / light", "loud / quiet"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_e4", topicId: 13, prompt: "Which word is an antonym for 'transparent'?", options: ["clear", "see-through", "opaque", "glass"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e5", topicId: 13, prompt: "Why is using synonyms useful in writing?", options: ["To confuse the reader", "To avoid repeating the same word", "To make sentences shorter", "To add punctuation"], correctIndex: 1),
            MathExamQuestion(id: "eng_13_e6", topicId: 13, prompt: "Which word is a synonym for 'ancient'?", options: ["modern", "new", "old", "young"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e7", topicId: 13, prompt: "Which pair are antonyms?", options: ["wet / damp", "loud / noisy", "brave / fearful", "fast / swift"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e8", topicId: 13, prompt: "Which word is the best synonym for 'exhausted'?", options: ["energised", "rested", "tired", "excited"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e9", topicId: 13, prompt: "What is the antonym of 'victory'?", options: ["win", "triumph", "defeat", "success"], correctIndex: 2),
            MathExamQuestion(id: "eng_13_e10", topicId: 13, prompt: "Which set contains only synonyms for 'walk'?", options: ["run, sprint, dash", "stroll, march, stride", "jump, hop, skip", "swim, wade, float"], correctIndex: 1)
        ],

        // Topic 14: Reading Comprehension
        14: [
            MathExamQuestion(id: "eng_14_e1", topicId: 14, prompt: "A student reads: 'Maria grabbed her umbrella and frowned at the grey sky.' What can you infer?", options: ["Maria is happy", "It is probably going to rain", "It is sunny", "Maria is going swimming"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e2", topicId: 14, prompt: "Which best describes a 'text-to-self connection'?", options: ["Comparing two texts", "Linking what you read to world events", "Linking what you read to your own experience", "Finding the main idea"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_e3", topicId: 14, prompt: "What is a 'topic sentence'?", options: ["The last sentence of a paragraph", "The sentence that introduces the main idea of a paragraph", "A sentence with no verb", "A sentence that asks a question"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e4", topicId: 14, prompt: "What does it mean to 'make a prediction' while reading?", options: ["To summarise what happened", "To guess what will happen next based on clues", "To find the main idea", "To define unknown words"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e5", topicId: 14, prompt: "Which type of text would most likely have headings and bullet points?", options: ["A poem", "A fairy tale", "An informational article", "A short story"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_e6", topicId: 14, prompt: "What is the difference between a fact and an opinion?", options: ["Facts are always wrong; opinions are right", "Facts can be proven; opinions express a viewpoint", "They are the same", "Opinions can be proven; facts express a feeling"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e7", topicId: 14, prompt: "A student reads: 'The shelves were empty and the fridge was bare.' This detail supports the main idea that...", options: ["The house was very new", "The family needed to go food shopping", "The family was very tidy", "The house was very large"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e8", topicId: 14, prompt: "What does 'visualising' mean as a reading strategy?", options: ["Reading aloud", "Looking up every word in a dictionary", "Creating a mental picture of what you read", "Skipping difficult parts"], correctIndex: 2),
            MathExamQuestion(id: "eng_14_e9", topicId: 14, prompt: "Which strategy helps you understand an unknown word?", options: ["Skip it and continue", "Use context clues from surrounding sentences", "Only read the first letter", "Ask someone else to read it"], correctIndex: 1),
            MathExamQuestion(id: "eng_14_e10", topicId: 14, prompt: "What does 'point of view' mean in a text?", options: ["How fast you read", "The perspective from which a story is told", "The length of the text", "The font size used"], correctIndex: 1)
        ],

        // Topic 15: Story Elements
        15: [
            MathExamQuestion(id: "eng_15_e1", topicId: 15, prompt: "What is the 'climax' of a story?", options: ["The introduction of characters", "The setting description", "The most exciting or intense turning point", "The final resolution"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_e2", topicId: 15, prompt: "A story told from the first-person point of view uses...", options: ["he/she/they", "I/we/my", "you/your", "one/oneself"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_e3", topicId: 15, prompt: "What is 'foreshadowing' in a story?", options: ["A description of the setting", "Clues that hint at what will happen later", "The story's resolution", "A character's dialogue"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_e4", topicId: 15, prompt: "What type of conflict is 'person vs. nature'?", options: ["A character fighting another character", "A character struggling against a natural force", "A character fighting society", "A character fighting themselves"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_e5", topicId: 15, prompt: "In story structure, what comes between the rising action and the falling action?", options: ["Exposition", "Resolution", "Climax", "Conflict introduction"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_e6", topicId: 15, prompt: "What does 'characterisation' mean?", options: ["The story's setting", "How the author reveals what characters are like", "The plot summary", "The genre of the story"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_e7", topicId: 15, prompt: "A story about a knight who must defeat a dragon to save a village has what type of conflict?", options: ["Person vs. self", "Person vs. society", "Person vs. nature", "Person vs. creature/antagonist"], correctIndex: 3),
            MathExamQuestion(id: "eng_15_e8", topicId: 15, prompt: "What is the 'exposition' in a story?", options: ["The most exciting part", "The very end", "The introduction that sets up characters and setting", "The conflict"], correctIndex: 2),
            MathExamQuestion(id: "eng_15_e9", topicId: 15, prompt: "Which best describes the 'theme' of a story?", options: ["What the main character looks like", "The lesson or message the story conveys", "Where the story takes place", "The genre of the story"], correctIndex: 1),
            MathExamQuestion(id: "eng_15_e10", topicId: 15, prompt: "A 'dynamic' character is one who...", options: ["Never changes throughout the story", "Changes and grows over the course of the story", "Always makes good decisions", "Has no conflict"], correctIndex: 1)
        ],

        // Topic 16: Types of Sentences
        16: [
            MathExamQuestion(id: "eng_16_e1", topicId: 16, prompt: "What is a compound sentence?", options: ["A sentence with one clause", "Two or more independent clauses joined by a conjunction", "A sentence with no verb", "A sentence with many adjectives"], correctIndex: 1),
            MathExamQuestion(id: "eng_16_e2", topicId: 16, prompt: "Which word often introduces an interrogative sentence?", options: ["The", "Run", "Who", "And"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_e3", topicId: 16, prompt: "Which is a compound sentence?", options: ["She smiled.", "She smiled, and he laughed.", "Smiling happily.", "She smiled because she was happy."], correctIndex: 1),
            MathExamQuestion(id: "eng_16_e4", topicId: 16, prompt: "An imperative sentence can end with which two punctuation marks?", options: [". or ,", ". or !", "? or !", "; or :"], correctIndex: 1),
            MathExamQuestion(id: "eng_16_e5", topicId: 16, prompt: "What makes a sentence 'exclamatory'?", options: ["It asks a question", "It gives a command", "It shows strong emotion or surprise", "It states a fact"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_e6", topicId: 16, prompt: "Which conjunction is most commonly used to join two independent clauses?", options: ["but", "and", "or", "All of the above"], correctIndex: 3),
            MathExamQuestion(id: "eng_16_e7", topicId: 16, prompt: "Which sentence is an example of a declarative sentence?", options: ["Go to bed now.", "Have you eaten?", "The Earth orbits the Sun.", "What a day!"], correctIndex: 2),
            MathExamQuestion(id: "eng_16_e8", topicId: 16, prompt: "A complex sentence contains...", options: ["Two independent clauses", "An independent clause and a dependent clause", "Only a dependent clause", "Three verbs"], correctIndex: 1),
            MathExamQuestion(id: "eng_16_e9", topicId: 16, prompt: "Which of these is a dependent clause?", options: ["She ran fast.", "The dog barked.", "Because it was raining.", "He smiled."], correctIndex: 2),
            MathExamQuestion(id: "eng_16_e10", topicId: 16, prompt: "Which correctly identifies the sentence type: 'What an incredible journey that was!'?", options: ["Declarative", "Interrogative", "Imperative", "Exclamatory"], correctIndex: 3)
        ],

        // Topic 17: Homophones & Confused Words
        17: [
            MathExamQuestion(id: "eng_17_e1", topicId: 17, prompt: "Which sentence uses 'affect' and 'effect' correctly?", options: ["The rain will effect the game. The affect was bad.", "The rain will affect the game. The effect was bad.", "The rain will effect the game. The effect was bad.", "The rain will affect the game. The affect was bad."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_e2", topicId: 17, prompt: "Which sentence uses 'then' correctly?", options: ["She is taller then me.", "I like cats then dogs.", "First we eat, then we play.", "I am stronger, then him."], correctIndex: 2),
            MathExamQuestion(id: "eng_17_e3", topicId: 17, prompt: "Which is the correct homophone for the sound /rɪt/?", options: ["write", "right", "rite", "All three are homophones of each other"], correctIndex: 3),
            MathExamQuestion(id: "eng_17_e4", topicId: 17, prompt: "Which sentence uses 'accept' correctly?", options: ["I cannot except your offer.", "I cannot accept your offer.", "Accept there were no good options.", "I will except the award."], correctIndex: 1),
            MathExamQuestion(id: "eng_17_e5", topicId: 17, prompt: "Choose the correct word: 'The weather will ___ our plans.'", options: ["effect", "affect", "affekt", "efect"], correctIndex: 1),
            MathExamQuestion(id: "eng_17_e6", topicId: 17, prompt: "Which sentence uses 'whose' correctly?", options: ["Whose going to the party?", "I know whose bag this is.", "Whose is going home?", "Whose are they going?"], correctIndex: 1),
            MathExamQuestion(id: "eng_17_e7", topicId: 17, prompt: "Choose the correct word: 'She has ___ much homework.'", options: ["to", "two", "too", "tow"], correctIndex: 2),
            MathExamQuestion(id: "eng_17_e8", topicId: 17, prompt: "Which sentence uses 'passed' correctly?", options: ["We past the library.", "Time past slowly.", "She passed the exam.", "He past the ball."], correctIndex: 2),
            MathExamQuestion(id: "eng_17_e9", topicId: 17, prompt: "Which pair are homophones?", options: ["here / hear", "were / where", "new / knew", "All of the above"], correctIndex: 3),
            MathExamQuestion(id: "eng_17_e10", topicId: 17, prompt: "Choose the correct word: '___ the weather is bad, we'll cancel.'", options: ["Weather", "Wether", "Whether", "Whither"], correctIndex: 2)
        ],

        // Topic 18: Parts of Speech
        18: [
            MathExamQuestion(id: "eng_18_e1", topicId: 18, prompt: "In 'Wow, that was amazing!', 'Wow' is a/an...", options: ["Noun", "Verb", "Adjective", "Interjection"], correctIndex: 3),
            MathExamQuestion(id: "eng_18_e2", topicId: 18, prompt: "Which sentence contains a preposition?", options: ["She ran fast.", "The cat is under the table.", "He smiled.", "They danced joyfully."], correctIndex: 1),
            MathExamQuestion(id: "eng_18_e3", topicId: 18, prompt: "What does a conjunction do?", options: ["Names a person or place", "Describes a noun", "Joins words, phrases, or clauses", "Shows strong emotion"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_e4", topicId: 18, prompt: "In 'She gave him the book', 'him' is a/an...", options: ["Noun", "Pronoun", "Adjective", "Adverb"], correctIndex: 1),
            MathExamQuestion(id: "eng_18_e5", topicId: 18, prompt: "Which word is a coordinating conjunction?", options: ["because", "although", "but", "since"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_e6", topicId: 18, prompt: "In 'She walked slowly through the dark forest', which word is a preposition?", options: ["slowly", "dark", "through", "forest"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_e7", topicId: 18, prompt: "Which sentence correctly uses all eight parts of speech?", options: ["Dogs run.", "Oh! She carefully placed her beautiful red roses beside the vase and smiled.", "The girl ran quickly.", "He is fast."], correctIndex: 1),
            MathExamQuestion(id: "eng_18_e8", topicId: 18, prompt: "What type of pronoun is used as the subject of a sentence?", options: ["Object pronoun (him, her, them)", "Subject pronoun (he, she, they)", "Possessive pronoun (his, hers)", "Reflexive pronoun (himself)"], correctIndex: 1),
            MathExamQuestion(id: "eng_18_e9", topicId: 18, prompt: "Which part of speech is 'because' in 'She left because she was tired'?", options: ["Preposition", "Pronoun", "Conjunction", "Interjection"], correctIndex: 2),
            MathExamQuestion(id: "eng_18_e10", topicId: 18, prompt: "In 'The friendly dog wagged its tail happily', how many parts of speech are represented?", options: ["4", "5", "6", "7"], correctIndex: 2)
        ],

        // Topic 19: Subject & Predicate
        19: [
            MathExamQuestion(id: "eng_19_e1", topicId: 19, prompt: "In 'The exhausted runners crossed the finish line', what is the complete subject?", options: ["The exhausted runners", "runners", "crossed the finish line", "the finish line"], correctIndex: 0),
            MathExamQuestion(id: "eng_19_e2", topicId: 19, prompt: "Which sentence has a compound predicate?", options: ["She sang and danced on stage.", "She and he went to the store.", "The big brown dog barked.", "Running and jumping are fun."], correctIndex: 0),
            MathExamQuestion(id: "eng_19_e3", topicId: 19, prompt: "What is the simple subject in 'The tall oak tree by the river fell'?", options: ["tall oak tree", "tree", "river", "The tall oak tree by the river"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e4", topicId: 19, prompt: "Which sentence has a compound subject?", options: ["She ran quickly.", "Tom and Emma both won prizes.", "The dog barked loudly all night.", "He finished his homework early."], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e5", topicId: 19, prompt: "In an imperative sentence like 'Sit down!', what is the subject?", options: ["Sit", "down", "You (understood)", "There is no subject"], correctIndex: 2),
            MathExamQuestion(id: "eng_19_e6", topicId: 19, prompt: "What is the complete predicate in 'The ancient castle stood on a misty hill'?", options: ["The ancient castle", "stood on a misty hill", "ancient castle stood", "misty hill"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e7", topicId: 19, prompt: "Which part of the sentence does the simple predicate refer to?", options: ["The noun being described", "The main verb or verb phrase only", "All words after the subject", "The object of the sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e8", topicId: 19, prompt: "In 'Every student in the class passed the exam', what is the simple subject?", options: ["Every student in the class", "student", "class", "exam"], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e9", topicId: 19, prompt: "Which sentence contains BOTH a compound subject AND a compound predicate?", options: ["He ran fast.", "Lily and Max cooked and served dinner.", "She sang loudly.", "The dogs barked and ran."], correctIndex: 1),
            MathExamQuestion(id: "eng_19_e10", topicId: 19, prompt: "In 'There were many birds in the garden', what is the true subject?", options: ["There", "were", "birds", "garden"], correctIndex: 2)
        ],

        // Topic 20: Figurative Language
        20: [
            MathExamQuestion(id: "eng_20_e1", topicId: 20, prompt: "Which sentence uses personification?", options: ["He ran like the wind.", "The wind whispered secrets through the trees.", "The storm was a raging beast.", "She worked tirelessly all day."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_e2", topicId: 20, prompt: "What distinguishes a simile from a metaphor?", options: ["A simile is always about nature; a metaphor is not", "A simile uses 'like' or 'as'; a metaphor states a direct comparison", "A metaphor uses 'like' or 'as'; a simile does not", "They are identical devices"], correctIndex: 1),
            MathExamQuestion(id: "eng_20_e3", topicId: 20, prompt: "Which sentence is an example of hyperbole?", options: ["The cat sat on the mat.", "She has a million things to do today.", "He walked slowly to school.", "The sun was bright."], correctIndex: 1),
            MathExamQuestion(id: "eng_20_e4", topicId: 20, prompt: "Identify the figurative language in: 'Peter Piper picked a peck of pickled peppers.'", options: ["Simile", "Metaphor", "Alliteration", "Onomatopoeia"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_e5", topicId: 20, prompt: "Which word is an example of onomatopoeia?", options: ["beautiful", "quickly", "sizzle", "enormous"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_e6", topicId: 20, prompt: "'Life is a rollercoaster' is an example of...", options: ["Simile", "Metaphor", "Hyperbole", "Personification"], correctIndex: 1),
            MathExamQuestion(id: "eng_20_e7", topicId: 20, prompt: "Which sentence uses a simile?", options: ["The classroom was a zoo.", "The stars danced across the sky.", "Her laughter was as bright as sunshine.", "The wind roared with fury."], correctIndex: 2),
            MathExamQuestion(id: "eng_20_e8", topicId: 20, prompt: "In 'The old house groaned under the weight of snow', what device is used?", options: ["Simile", "Alliteration", "Personification", "Hyperbole"], correctIndex: 2),
            MathExamQuestion(id: "eng_20_e9", topicId: 20, prompt: "Which sentence uses alliteration effectively?", options: ["She sells seashells by the seashore.", "The sun rises in the east.", "He ran as fast as lightning.", "The cat meowed loudly."], correctIndex: 0),
            MathExamQuestion(id: "eng_20_e10", topicId: 20, prompt: "A writer says 'I have told you a billion times!' This is an example of...", options: ["Personification", "Alliteration", "Simile", "Hyperbole"], correctIndex: 3)
        ],

        // Topic 21: Vocabulary in Context
        21: [
            MathExamQuestion(id: "eng_21_e1", topicId: 21, prompt: "What type of context clue is used here: 'The magnanimous, or extremely generous, donor gave millions'?", options: ["Synonym clue", "Definition clue", "Antonym clue", "Example clue"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_e2", topicId: 21, prompt: "'Although she appeared serene, her heart was racing with anxiety.' What does 'serene' most likely mean?", options: ["Panicked", "Calm and peaceful", "Angry", "Confused"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_e3", topicId: 21, prompt: "Which context clue strategy uses the opposite of an unknown word to determine its meaning?", options: ["Synonym clue", "Definition clue", "Antonym clue", "Inference clue"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_e4", topicId: 21, prompt: "'Unlike the lavish palace, the cottage was simple and bare.' What does 'lavish' most likely mean?", options: ["Small and basic", "Old and crumbling", "Luxurious and extravagant", "Dark and gloomy"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_e5", topicId: 21, prompt: "In 'Many predators  -  wolves, hawks, and lions, for instance  -  hunt at dawn', what type of clue helps define 'predators'?", options: ["Definition clue", "Example clue", "Antonym clue", "Tone clue"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_e6", topicId: 21, prompt: "'The taciturn professor rarely spoke during lectures, often letting silence fill the room.' What does 'taciturn' mean?", options: ["Extremely talkative", "Habitually silent or uncommunicative", "Forgetful", "Enthusiastic"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_e7", topicId: 21, prompt: "Which context strategy involves using the overall tone or mood of a passage to determine word meaning?", options: ["Direct definition", "Synonym substitution", "Tonal inference", "Example listing"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_e8", topicId: 21, prompt: "'The ephemeral beauty of cherry blossoms, lasting only days, makes them special.' What does 'ephemeral' mean?", options: ["Lasting forever", "Very colourful", "Short-lived", "Extremely fragrant"], correctIndex: 2),
            MathExamQuestion(id: "eng_21_e9", topicId: 21, prompt: "A student encounters 'benevolent' in a passage describing a kind ruler. Which meaning is most likely correct?", options: ["Cruel and harsh", "Well-meaning and generous", "Powerful and strong", "Secretive and sly"], correctIndex: 1),
            MathExamQuestion(id: "eng_21_e10", topicId: 21, prompt: "Why is using context clues a better first strategy than looking up every unknown word in a dictionary?", options: ["Dictionaries are always wrong", "Context clues are faster and help you understand the word in its specific usage", "Dictionaries only have simple words", "Context clues are more accurate than dictionaries"], correctIndex: 1)
        ],

        // Topic 22: Main Idea & Details
        22: [
            MathExamQuestion(id: "eng_22_e1", topicId: 22, prompt: "What is the difference between the 'topic' and the 'main idea' of a passage?", options: ["They are identical", "The topic is what the text is about; the main idea is the most important point about the topic", "The main idea is one word; the topic is a full sentence", "The topic is always in the first sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e2", topicId: 22, prompt: "A passage says: 'Plastic pollution kills marine life, damages ecosystems, and enters the food chain.' The main idea is that...", options: ["Plastic is useful for packaging", "Plastic pollution is harmful in multiple significant ways", "Marine animals eat plastic", "We should recycle more"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e3", topicId: 22, prompt: "What is an 'implied main idea'?", options: ["A main idea stated clearly in the first sentence", "A main idea the reader must infer because it is not directly stated", "A main idea found only in the conclusion", "A main idea that repeats in every paragraph"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e4", topicId: 22, prompt: "Which question best helps you identify the main idea of a paragraph?", options: ["Who is the author?", "What is the most important point the author is making?", "How many sentences are there?", "What words are repeated?"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e5", topicId: 22, prompt: "A supporting detail is best described as...", options: ["The central message of the whole text", "A fact, example, or reason that develops or proves the main idea", "The topic sentence of a paragraph", "The author's opinion"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e6", topicId: 22, prompt: "If a passage has multiple paragraphs, where is the overall main idea most likely stated?", options: ["Only in the last paragraph", "Usually in an introductory or concluding paragraph, or implied throughout", "In every single paragraph", "Only in the middle paragraph"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e7", topicId: 22, prompt: "A student reads a passage about wolves and correctly identifies: 'Wolves play a vital role in maintaining ecosystem balance.' This is most likely the...", options: ["Topic", "Supporting detail", "Main idea", "Conclusion sentence only"], correctIndex: 2),
            MathExamQuestion(id: "eng_22_e8", topicId: 22, prompt: "Which of the following is a supporting detail, not a main idea?", options: ["Exercise is essential for good health.", "Exercise improves mood, strengthens muscles, and reduces disease risk.", "Running for 30 minutes burns approximately 300 calories.", "Being active has numerous health benefits."], correctIndex: 2),
            MathExamQuestion(id: "eng_22_e9", topicId: 22, prompt: "What should you do after identifying the main idea of a passage?", options: ["Stop reading", "Check that your identified main idea is supported by the details in the text", "Rewrite the passage", "Look for the author's name"], correctIndex: 1),
            MathExamQuestion(id: "eng_22_e10", topicId: 22, prompt: "A passage contains these details: 'Bees pollinate crops. Bees produce honey. Bees control plant populations.' What is the most likely main idea?", options: ["Honey is delicious and nutritious.", "Bees are fascinating insects with complex social structures.", "Bees perform multiple functions that are vital to nature and humans.", "Crops need to be pollinated every season."], correctIndex: 2)
        ],

        // Topic 23: Point of View
        23: [
            MathExamQuestion(id: "eng_23_e1", topicId: 23, prompt: "What is the key difference between third-person limited and third-person omniscient narration?", options: ["They are the same", "Limited follows one character's thoughts; omniscient knows all characters' thoughts", "Omniscient follows one character; limited knows all thoughts", "Third-person limited uses 'I'"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e2", topicId: 23, prompt: "A narrator says: 'You walk into the room and immediately feel uneasy.' Which point of view is this?", options: ["First person", "Second person", "Third-person limited", "Third-person omniscient"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e3", topicId: 23, prompt: "How does an unreliable narrator affect a story?", options: ["It makes the story more factual", "The reader must question whether the narrator's account is accurate or biased", "It means the story has no plot", "It always means the narrator is lying"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e4", topicId: 23, prompt: "In first-person narration, what key limitation does the narrator have?", options: ["Cannot describe setting", "Can only know their own thoughts and perceptions, not other characters' inner feelings", "Must use formal language only", "Cannot use dialogue"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e5", topicId: 23, prompt: "Why might an author choose third-person omniscient narration?", options: ["To hide information from the reader", "To provide insight into multiple characters' thoughts and motivations", "To make the story feel more personal", "To confuse the reader"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e6", topicId: 23, prompt: "Which pronoun signals second-person point of view?", options: ["I", "He", "You", "They"], correctIndex: 2),
            MathExamQuestion(id: "eng_23_e7", topicId: 23, prompt: "How does point of view shape a reader's sympathies?", options: ["It does not affect the reader at all", "It determines what information and emotions the reader has access to, influencing who they support", "It only affects the genre of the text", "It tells the reader who wrote the book"], correctIndex: 1),
            MathExamQuestion(id: "eng_23_e8", topicId: 23, prompt: "A story is told from the perspective of the villain who believes their actions are justified. This is an example of...", options: ["Third-person omniscient", "Second-person narration", "First-person narration from an unusual/antagonist perspective", "Third-person limited with a heroic narrator"], correctIndex: 2),
            MathExamQuestion(id: "eng_23_e9", topicId: 23, prompt: "Which is a clue that a text uses third-person limited narration?", options: ["Uses 'I' and 'my' throughout", "Uses 'you' and 'your' throughout", "Uses 'he/she' and reveals only one character's inner thoughts", "Uses 'he/she' and reveals all characters' inner thoughts equally"], correctIndex: 2),
            MathExamQuestion(id: "eng_23_e10", topicId: 23, prompt: "If the same event is described differently by two first-person narrators, what does this reveal?", options: ["One of them must be wrong", "Point of view is entirely objective", "Perspective shapes interpretation, and two people can experience the same event differently", "First-person narration is always unreliable"], correctIndex: 2)
        ],

        // Topic 24: Text Structures
        24: [
            MathExamQuestion(id: "eng_24_e1", topicId: 24, prompt: "A text says: 'Because of deforestation, many species are losing their habitat, resulting in population decline.' Which text structure is this?", options: ["Sequence", "Compare and contrast", "Cause and effect", "Description"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e2", topicId: 24, prompt: "Which signal words indicate a compare-and-contrast structure?", options: ["first, then, finally", "because, therefore, as a result", "similarly, however, on the other hand", "for example, such as, including"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e3", topicId: 24, prompt: "A recipe uses the structure: 'First, mix the flour. Next, add the eggs. Finally, bake.' This is an example of...", options: ["Cause and effect", "Sequence", "Problem and solution", "Description"], correctIndex: 1),
            MathExamQuestion(id: "eng_24_e4", topicId: 24, prompt: "Which text structure would BEST organise an article about traffic congestion and proposals to fix it?", options: ["Description", "Sequence", "Problem and solution", "Compare and contrast"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e5", topicId: 24, prompt: "A graphic organiser with two overlapping circles is used for which text structure?", options: ["Sequence", "Cause and effect", "Compare and contrast", "Problem and solution"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e6", topicId: 24, prompt: "What is the primary purpose of a description text structure?", options: ["To explain why something happened", "To show how two things are different", "To paint a detailed picture of a topic using characteristics and attributes", "To list events in time order"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e7", topicId: 24, prompt: "Why is recognising text structure important for reading comprehension?", options: ["It helps you read faster without thinking", "It helps you predict how information is organised and where to find key ideas", "It tells you the author's name", "It makes texts shorter"], correctIndex: 1),
            MathExamQuestion(id: "eng_24_e8", topicId: 24, prompt: "A text about the American Revolution lists: Declaration of Independence → 1776 battles → Treaty of Paris 1783. This uses which structure?", options: ["Compare and contrast", "Sequence / chronological order", "Cause and effect", "Description"], correctIndex: 1),
            MathExamQuestion(id: "eng_24_e9", topicId: 24, prompt: "The phrase 'this led to' most strongly signals which text structure?", options: ["Description", "Compare and contrast", "Cause and effect", "Sequence"], correctIndex: 2),
            MathExamQuestion(id: "eng_24_e10", topicId: 24, prompt: "An author compares the diets, habitats, and behaviours of lions and tigers. Which structure are they using?", options: ["Problem and solution", "Sequence", "Description", "Compare and contrast"], correctIndex: 3)
        ],

        // Topic 25: Narrative Writing
        25: [
            MathExamQuestion(id: "eng_25_e1", topicId: 25, prompt: "What is the purpose of the 'exposition' at the start of a narrative?", options: ["To reveal the climax immediately", "To introduce the characters, setting, and background information", "To resolve the conflict", "To create the falling action"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_e2", topicId: 25, prompt: "Which punctuation is required when a character's dialogue is followed by a dialogue tag?", options: ["A period inside the quotation marks", "A comma inside the quotation marks before the closing quote", "A semicolon after the closing quote", "A colon before the dialogue tag"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_e3", topicId: 25, prompt: "Which is correctly punctuated dialogue?", options: ["\"I can't believe it\" she said.", "\"I can't believe it,\" she said.", "\"I can't believe it.\" she said.", "\"I can't believe it,\" She said."], correctIndex: 1),
            MathExamQuestion(id: "eng_25_e4", topicId: 25, prompt: "What does 'show, don't tell' mean in narrative writing?", options: ["Use only dialogue, no description", "Use vivid details and actions to convey emotions rather than stating them directly", "Always describe the setting first", "Tell the reader exactly how a character feels"], correctIndex: 1),
            MathExamQuestion(id: "eng_25_e5", topicId: 25, prompt: "Which type of conflict occurs inside a character's mind?", options: ["Person vs. nature", "Person vs. society", "Person vs. self", "Person vs. technology"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_e6", topicId: 25, prompt: "What is the narrative 'hook'?", options: ["The resolution of the conflict", "The concluding paragraph", "A compelling opening that grabs the reader's attention", "The dialogue between characters"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_e7", topicId: 25, prompt: "Which sentence better 'shows' rather than 'tells' that a character is nervous?", options: ["She was very nervous.", "She felt nervous about the speech.", "Her hands trembled as she stepped to the podium, heart hammering.", "The character experienced nervousness."], correctIndex: 2),
            MathExamQuestion(id: "eng_25_e8", topicId: 25, prompt: "In a story's structure, what happens AFTER the climax?", options: ["The exposition", "The rising action", "The falling action and resolution", "The introduction of new conflicts"], correctIndex: 2),
            MathExamQuestion(id: "eng_25_e9", topicId: 25, prompt: "Which technique best creates a sense of suspense in narrative writing?", options: ["Using short, choppy sentences and withholding key information", "Describing the resolution first", "Using only past tense verbs", "Starting with a dictionary definition"], correctIndex: 0),
            MathExamQuestion(id: "eng_25_e10", topicId: 25, prompt: "Why is consistent point of view important in narrative writing?", options: ["It makes sentences shorter", "It ensures the reader is not confused about who is narrating or thinking", "It limits the vocabulary used", "It always makes the story more exciting"], correctIndex: 1)
        ],

        // Topic 26: Poetry
        26: [
            MathExamQuestion(id: "eng_26_e1", topicId: 26, prompt: "A poem follows the rhyme scheme AABB. Which pattern matches?", options: ["Lines 1 & 3 rhyme; lines 2 & 4 rhyme", "Lines 1 & 2 rhyme; lines 3 & 4 rhyme", "Lines 1 & 4 rhyme; lines 2 & 3 rhyme", "No lines rhyme"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e2", topicId: 26, prompt: "What is iambic pentameter?", options: ["A poem with five stanzas", "A line of poetry with five iambic feet (da-DUM × 5)", "A rhyme scheme used in sonnets", "A type of free verse with no structure"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e3", topicId: 26, prompt: "What distinguishes free verse from other types of poetry?", options: ["It always rhymes", "It has no fixed rhyme scheme or meter", "It must have exactly four stanzas", "It is only written about nature"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e4", topicId: 26, prompt: "What is a 'stanza' in a poem?", options: ["A single line of poetry", "A group of lines forming a unit, like a paragraph in prose", "The rhyme scheme of the poem", "The poem's overall meter"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e5", topicId: 26, prompt: "Which poetic device is used in: 'The fair breeze blew, the white foam flew'?", options: ["Personification", "Hyperbole", "Alliteration", "Onomatopoeia"], correctIndex: 2),
            MathExamQuestion(id: "eng_26_e6", topicId: 26, prompt: "A Shakespearean sonnet has how many lines and what rhyme scheme?", options: ["12 lines, ABAB CDCD EFEF", "14 lines, ABAB CDCD EFEF GG", "16 lines, AABB CCDD", "14 lines, ABBA ABBA CDECDE"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e7", topicId: 26, prompt: "What is 'assonance' in poetry?", options: ["Repetition of consonant sounds", "Repetition of vowel sounds within nearby words", "A comparison using 'like' or 'as'", "A line that does not rhyme"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e8", topicId: 26, prompt: "In the rhyme scheme ABAB CDCD, what does each letter represent?", options: ["A different stanza", "A different poetic device", "Lines with matching end rhymes", "Lines with matching syllable counts"], correctIndex: 2),
            MathExamQuestion(id: "eng_26_e9", topicId: 26, prompt: "What is the main difference between a haiku and a limerick?", options: ["They both have the same syllable structure", "A haiku has 3 lines (5-7-5 syllables); a limerick has 5 lines with AABBA rhyme scheme", "A limerick is always serious; a haiku is humorous", "A haiku rhymes; a limerick does not"], correctIndex: 1),
            MathExamQuestion(id: "eng_26_e10", topicId: 26, prompt: "An 'end-stopped line' in poetry is one that...", options: ["Flows without pause into the next line", "Ends with a punctuation mark, creating a natural pause", "Never rhymes", "Uses enjambment"], correctIndex: 1)
        ],

        // Topic 27: Complex Sentences & Clauses
        27: [
            MathExamQuestion(id: "eng_27_e1", topicId: 27, prompt: "Which sentence is a compound-complex sentence?", options: ["She ran.", "Although she was tired, she ran, and he cheered.", "She was tired but kept going.", "Because it rained."], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e2", topicId: 27, prompt: "What is a relative clause?", options: ["A clause that stands alone as a sentence", "A dependent clause introduced by a relative pronoun (who, which, that) and modifies a noun", "A clause that expresses cause and effect", "A clause used only at the beginning of a sentence"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e3", topicId: 27, prompt: "Identify the dependent clause: 'When the storm finally passed, the children went outside.'", options: ["the children went outside", "the storm finally passed", "When the storm finally passed", "went outside"], correctIndex: 2),
            MathExamQuestion(id: "eng_27_e4", topicId: 27, prompt: "Which sentence contains a non-restrictive relative clause (requiring commas)?", options: ["The book that I borrowed is overdue.", "My sister, who lives in Paris, is visiting next week.", "The dog that bit me was large.", "The car which I drive is old."], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e5", topicId: 27, prompt: "What is the function of a subordinating conjunction?", options: ["To join two independent clauses of equal importance", "To introduce a dependent clause and show its relationship to the main clause", "To replace a noun in the sentence", "To describe how the action is performed"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e6", topicId: 27, prompt: "Which of these is a subordinating conjunction?", options: ["and", "but", "or", "although"], correctIndex: 3),
            MathExamQuestion(id: "eng_27_e7", topicId: 27, prompt: "Why can't a dependent clause stand alone as a sentence?", options: ["It has too many words", "It does not express a complete thought on its own", "It contains no verb", "It always begins with 'that'"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e8", topicId: 27, prompt: "Which sentence uses a relative pronoun correctly?", options: ["The man which I met was kind.", "The woman who I spoke to was helpful.", "The dog whom barked was loud.", "The car whose I drove was fast."], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e9", topicId: 27, prompt: "What is the difference between 'that' and 'which' in relative clauses?", options: ["They are always interchangeable", "'That' introduces restrictive clauses; 'which' introduces non-restrictive clauses (set off by commas)", "'Which' introduces restrictive clauses; 'that' introduces non-restrictive clauses", "Neither can begin a relative clause"], correctIndex: 1),
            MathExamQuestion(id: "eng_27_e10", topicId: 27, prompt: "In 'She reads every night, which improves her vocabulary', what does 'which' refer to?", options: ["She", "every night", "the entire preceding clause (she reads every night)", "vocabulary"], correctIndex: 2)
        ],

        // Topic 28: Active & Passive Voice
        28: [
            MathExamQuestion(id: "eng_28_e1", topicId: 28, prompt: "Convert to active voice: 'The award was presented by the mayor.'", options: ["The award presented the mayor.", "The mayor presented the award.", "The award presenting was done by the mayor.", "Was the award presented by the mayor?"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e2", topicId: 28, prompt: "Which sentence is in passive voice?", options: ["The students completed the project.", "She wrote the novel in six months.", "The novel was written by her in six months.", "He runs marathons every year."], correctIndex: 2),
            MathExamQuestion(id: "eng_28_e3", topicId: 28, prompt: "When is passive voice most appropriately used?", options: ["Always, because it sounds more formal", "When the doer of the action is unknown, unimportant, or intentionally omitted", "When writing fiction", "When using past tense only"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e4", topicId: 28, prompt: "In passive voice, the verb always consists of...", options: ["Two action verbs", "A form of 'to be' + a past participle", "An auxiliary verb + infinitive", "A modal verb only"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e5", topicId: 28, prompt: "Which scientific writing context most justifies passive voice use?", options: ["When listing steps in chronological order", "In lab reports where the focus is on the experiment, not the experimenter", "When describing a character's actions", "In persuasive essays to strengthen arguments"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e6", topicId: 28, prompt: "Identify the passive construction: 'Mistakes were made during the project.'", options: ["Active  -  'mistakes' is the subject doing the action", "Passive  -  'mistakes' is the subject receiving the action of 'made'", "Neither active nor passive", "Active because it uses past tense"], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e7", topicId: 28, prompt: "Convert to passive voice: 'Scientists discovered a new planet.'", options: ["A new planet discovered by scientists.", "Scientists were discovered a new planet.", "A new planet was discovered by scientists.", "Discovering a new planet was done by scientists."], correctIndex: 2),
            MathExamQuestion(id: "eng_28_e8", topicId: 28, prompt: "Which sentence BEST uses passive voice to strategically omit the agent?", options: ["The manager fired the employee.", "The employee was fired.", "The employee got fired by the manager.", "Firing happened to the employee."], correctIndex: 1),
            MathExamQuestion(id: "eng_28_e9", topicId: 28, prompt: "Which sentence is in future passive voice?", options: ["The report will be submitted tomorrow.", "She submits the report tomorrow.", "She will submit the report tomorrow.", "The report has been submitted."], correctIndex: 0),
            MathExamQuestion(id: "eng_28_e10", topicId: 28, prompt: "Why do style guides often recommend active voice for general writing?", options: ["Passive voice is grammatically incorrect", "Active voice is clearer, more direct, and usually more concise", "Active voice is only for fiction", "Passive voice cannot convey emotion"], correctIndex: 1)
        ],

        // Topic 29: Persuasive Writing & Rhetoric
        29: [
            MathExamQuestion(id: "eng_29_e1", topicId: 29, prompt: "Which appeal is being used: 'Nine out of ten dentists recommend this toothpaste'?", options: ["Pathos", "Ethos", "Logos", "Kairos"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_e2", topicId: 29, prompt: "A charity advertisement shows images of suffering children to convince viewers to donate. This primarily uses...", options: ["Logos", "Ethos", "Pathos", "Syllogism"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_e3", topicId: 29, prompt: "What is 'ethos' in rhetorical appeals?", options: ["An appeal to the audience's emotions", "An appeal to logic and evidence", "An appeal to the speaker's credibility and trustworthiness", "An appeal to urgency and timing"], correctIndex: 2),
            MathExamQuestion(id: "eng_29_e4", topicId: 29, prompt: "Which is a logical fallacy called 'ad hominem'?", options: ["Attacking the opponent's argument with evidence", "Attacking the person making the argument rather than the argument itself", "Using statistics to mislead", "Making a false comparison"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e5", topicId: 29, prompt: "What makes a persuasive argument stronger?", options: ["Relying entirely on emotional appeals", "Acknowledging and refuting counterarguments with evidence", "Using only anecdotal evidence", "Avoiding any use of facts or data"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e6", topicId: 29, prompt: "Which persuasive technique uses loaded or emotionally charged language?", options: ["Logos", "Connotation and diction", "Ethos", "Parallelism"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e7", topicId: 29, prompt: "A 'straw man' fallacy involves...", options: ["Introducing irrelevant evidence", "Misrepresenting an opponent's argument to make it easier to attack", "Appealing to popular opinion", "Using circular reasoning"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e8", topicId: 29, prompt: "What is the purpose of a 'call to action' in persuasive writing?", options: ["To summarise the opposing view", "To prompt the reader to take a specific action", "To introduce the topic", "To provide background information"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e9", topicId: 29, prompt: "Which rhetorical device involves repeating a structure for emphasis: 'We will fight on the beaches, we will fight on the landing grounds, we will fight in the fields'?", options: ["Alliteration", "Anaphora", "Antithesis", "Hyperbole"], correctIndex: 1),
            MathExamQuestion(id: "eng_29_e10", topicId: 29, prompt: "A student claims: 'Everyone is doing it, so it must be right.' This is an example of...", options: ["A strong logos appeal", "The 'bandwagon' fallacy", "A valid ethos appeal", "Sound deductive reasoning"], correctIndex: 1)
        ],

        // Topic 30: Literary Devices
        30: [
            MathExamQuestion(id: "eng_30_e1", topicId: 30, prompt: "What distinguishes 'situational irony' from 'verbal irony'?", options: ["They are identical", "Situational irony is when events turn out opposite to expectations; verbal irony is when words mean the opposite of what is said", "Verbal irony involves events; situational irony involves words", "Only situational irony can be used in fiction"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_e2", topicId: 30, prompt: "A story about a war has a white dove appear whenever peace is mentioned. This is an example of...", options: ["Foreshadowing", "Motif", "Allusion", "Irony"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_e3", topicId: 30, prompt: "What is an 'allusion' in literature?", options: ["A direct quotation from another work", "An indirect reference to a well-known person, place, event, or text", "A made-up story within a story", "A description of the setting"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_e4", topicId: 30, prompt: "A novel repeatedly mentions broken clocks whenever a character refuses to accept change. This recurring image is a...", options: ["Theme", "Symbol", "Motif", "Allusion"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_e5", topicId: 30, prompt: "What is the difference between 'theme' and 'plot' in a literary work?", options: ["They are the same thing", "Plot is what happens; theme is the underlying message or insight about human experience", "Theme is what happens; plot is the message", "Plot is only in fiction; theme is only in non-fiction"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_e6", topicId: 30, prompt: "When a character says 'What lovely weather' during a terrible storm, this is an example of...", options: ["Dramatic irony", "Situational irony", "Verbal irony / sarcasm", "Cosmic irony"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_e7", topicId: 30, prompt: "A story opens with: 'Little did Maria know, that morning would be the last ordinary day of her life.' This is...", options: ["A motif", "Dramatic irony", "Foreshadowing", "Symbolism"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_e8", topicId: 30, prompt: "What is 'dramatic irony'?", options: ["When the author is surprised by the plot", "When the audience knows information that a character does not", "When a character says the opposite of what they mean", "When the ending is unexpected"], correctIndex: 1),
            MathExamQuestion(id: "eng_30_e9", topicId: 30, prompt: "A green light at the end of a dock represents hope and longing in 'The Great Gatsby'. This is an example of...", options: ["Alliteration", "Allusion", "Symbolism", "Foreshadowing"], correctIndex: 2),
            MathExamQuestion(id: "eng_30_e10", topicId: 30, prompt: "A character says 'Beware the Ides of March' early in a play, hinting at future danger. This device is...", options: ["Allusion only", "Foreshadowing", "Situational irony", "Motif"], correctIndex: 1)
        ],

        // Topic 31: Author's Purpose & Bias
        31: [
            MathExamQuestion(id: "eng_31_e1", topicId: 31, prompt: "What does it mean to identify an author's 'bias'?", options: ["Determining the author's favourite topic", "Recognising when an author presents a one-sided view or uses language that favours one perspective", "Finding factual errors in the text", "Understanding the author's writing style"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e2", topicId: 31, prompt: "A newspaper article uses the word 'mob' for one group and 'crowd' for another group at the same event. What does this suggest?", options: ["Both words have identical connotations", "The author is using loaded language, indicating possible bias toward one group", "The article is perfectly objective", "The author is using similes"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e3", topicId: 31, prompt: "What is the PIE framework for author's purpose?", options: ["Plan, Investigate, Evaluate", "Persuade, Inform, Entertain", "Predict, Infer, Examine", "Purpose, Intent, Effect"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e4", topicId: 31, prompt: "An author writes an article presenting only the benefits of social media with no mention of drawbacks. This is an example of...", options: ["Objective reporting", "Confirmation bias and one-sided presentation", "Effective persuasion", "Good summarising technique"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e5", topicId: 31, prompt: "Which question BEST helps identify an author's purpose?", options: ["How long is the text?", "Who funded or published this text, and what did the author want the reader to think or do?", "Does the text use dialogue?", "How many paragraphs does it have?"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e6", topicId: 31, prompt: "A text uses facts and figures but selectively omits data that contradicts the author's argument. This is called...", options: ["Objective analysis", "Cherry-picking or selective evidence", "Strong logos appeal", "Valid academic research"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e7", topicId: 31, prompt: "What is 'confirmation bias' in a reader?", options: ["When a reader reads texts in alphabetical order", "When a reader accepts information that confirms their existing beliefs and dismisses contradictory evidence", "When a reader confirms the author's purpose", "When a reader checks all facts in a text"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e8", topicId: 31, prompt: "Which of these texts MOST LIKELY has an author's purpose to persuade?", options: ["An encyclopedia entry about penguins", "A political speech urging voters to support a policy", "A short story about a lost dog", "A recipe for chocolate cake"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e9", topicId: 31, prompt: "An editorial says 'irresponsible protesters disrupted the city.' What should a critical reader notice?", options: ["The text is completely factual", "The word 'irresponsible' is a loaded adjective that reveals the author's bias", "The author is using personification", "The sentence uses passive voice incorrectly"], correctIndex: 1),
            MathExamQuestion(id: "eng_31_e10", topicId: 31, prompt: "Why should readers consider the source and date of a text when evaluating author's purpose?", options: ["Older texts are always more reliable", "The source's funding, affiliation, and when it was published can all influence a text's perspective and relevance", "Only internet sources are biased", "Date and source never affect meaning"], correctIndex: 1)
        ],

        // Topic 32: Research & Citation
        32: [
            MathExamQuestion(id: "eng_32_e1", topicId: 32, prompt: "What is plagiarism?", options: ["Citing a source incorrectly", "Using someone else's words or ideas without giving them credit", "Writing a summary of a text", "Using more than two sources in a paper"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e2", topicId: 32, prompt: "What is the correct MLA format for a book citation?", options: ["Title, Author, Publisher, Year.", "Author Last, First. Title. Publisher, Year.", "Publisher: Author, Title, Year.", "Year, Author, Title, Publisher."], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e3", topicId: 32, prompt: "What is the difference between paraphrasing and summarising?", options: ["They are identical", "Paraphrasing restates a specific passage in your own words; summarising condenses the overall main ideas of a larger text", "Summarising restates specific passages; paraphrasing condenses main ideas", "Both require quotation marks"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e4", topicId: 32, prompt: "Even when you paraphrase someone's ideas, you must still...", options: ["Use quotation marks", "Cite the original source", "Copy the exact wording", "Avoid in-text citations"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e5", topicId: 32, prompt: "Which type of source is generally considered MOST reliable for academic research?", options: ["A personal blog post", "A peer-reviewed academic journal article", "A social media post", "An anonymous wiki entry"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e6", topicId: 32, prompt: "What does 'Works Cited' refer to in MLA format?", options: ["A list of all sources you read during research", "A list of only the sources directly cited in your paper", "A summary of your research topic", "The bibliography of your sources' sources"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e7", topicId: 32, prompt: "In MLA format, an in-text citation typically includes...", options: ["The full URL of the source", "The author's last name and page number in parentheses", "The full title and publication year", "The publisher's name only"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e8", topicId: 32, prompt: "What is the CRAAP test used for in research?", options: ["Testing writing grammar", "Evaluating source quality by checking Currency, Relevance, Authority, Accuracy, and Purpose", "Checking for plagiarism", "Formatting citations correctly"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e9", topicId: 32, prompt: "A student copies three sentences from an article, changes a few words, and does not cite it. This is...", options: ["Acceptable paraphrasing", "Still plagiarism because the source was not cited and the changes are too minimal", "Correct summarising technique", "Proper use of common knowledge"], correctIndex: 1),
            MathExamQuestion(id: "eng_32_e10", topicId: 32, prompt: "What is 'common knowledge' in research writing?", options: ["Information only experts know", "Widely known facts that do not require citation, such as 'the Earth orbits the Sun'", "Facts found in three or more sources", "Any information from encyclopedias"], correctIndex: 1)
        ],

        // Topic 33: Shakespeare & Classic Lit
        33: [
            MathExamQuestion(id: "eng_33_e1", topicId: 33, prompt: "What is iambic pentameter?", options: ["A poem with exactly five rhyming lines", "A metrical pattern of five iambic feet per line (ten syllables alternating unstressed-stressed)", "A type of Shakespearean comedy structure", "A rhyme scheme used only in sonnets"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e2", topicId: 33, prompt: "In Romeo and Juliet, what literary device is Shakespeare using when Juliet says 'What's in a name? That which we call a rose by any other name would smell as sweet'?", options: ["Foreshadowing doom", "Arguing that names are arbitrary labels and love transcends identity", "Using irony about her family's conflict", "Describing the garden setting"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e3", topicId: 33, prompt: "What is a 'soliloquy' in drama?", options: ["A conversation between two characters", "A speech where a character reveals their inner thoughts while alone on stage", "A short poem inserted into a play", "A scene with no dialogue"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e4", topicId: 33, prompt: "In Macbeth, the three witches' prophecies best demonstrate which literary device?", options: ["Allusion", "Symbolism", "Foreshadowing", "Alliteration"], correctIndex: 2),
            MathExamQuestion(id: "eng_33_e5", topicId: 33, prompt: "What is the central theme of Macbeth?", options: ["The power of true love", "The corrupting influence of unchecked ambition and the consequences of guilt", "The importance of family loyalty", "The conflict between nature and civilisation"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e6", topicId: 33, prompt: "Shakespeare's plays are written mostly in 'blank verse'. What does this mean?", options: ["Unrhymed iambic pentameter", "Rhyming couplets throughout", "Free verse with no meter", "Prose with occasional rhyme"], correctIndex: 0),
            MathExamQuestion(id: "eng_33_e7", topicId: 33, prompt: "In Romeo and Juliet, the Prologue tells the audience the lovers will die. This creates...", options: ["Situational irony throughout the play", "Dramatic irony  -  the audience knows the outcome while characters do not", "A surprise ending for the audience", "Verbal irony in the characters' speeches"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e8", topicId: 33, prompt: "Lady Macbeth is best characterised as...", options: ["A passive victim of circumstances", "A manipulative, ambitious character who drives Macbeth toward murder", "A loyal wife who opposes the murders", "A comic relief character"], correctIndex: 1),
            MathExamQuestion(id: "eng_33_e9", topicId: 33, prompt: "What does the dagger hallucination in Macbeth reveal about the character?", options: ["He has magical powers", "He is innocent of all crimes", "He is consumed by guilt and his mind is deteriorating", "The castle is genuinely haunted"], correctIndex: 2),
            MathExamQuestion(id: "eng_33_e10", topicId: 33, prompt: "Romeo and Juliet is classified as a tragedy primarily because...", options: ["It has no comic moments", "It ends with the deaths of the protagonists, partly resulting from their own choices and fate", "It is set in a historical period", "Shakespeare wrote it last"], correctIndex: 1)
        ],

        // Topic 34: Etymology & Word Roots
        34: [
            MathExamQuestion(id: "eng_34_e1", topicId: 34, prompt: "The root 'aud' comes from Latin meaning 'to hear'. Which word does NOT come from this root?", options: ["auditorium", "audible", "audience", "audio-visual  -  all come from 'aud'"], correctIndex: 3),
            MathExamQuestion(id: "eng_34_e2", topicId: 34, prompt: "If 'port' means 'to carry', what does 'export' literally mean?", options: ["To carry inward", "To carry out of a country", "To carry across", "To carry under"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_e3", topicId: 34, prompt: "The word 'telescope' comes from the Greek roots 'tele' (far) and 'scope' (to look). What does 'microscope' mean using the same logic?", options: ["To look far away", "To look at very small things (mikros = small)", "To look through water", "To look at moving objects"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_e4", topicId: 34, prompt: "Which word contains the Latin root 'vis' meaning 'to see'?", options: ["visualise", "vitamin", "vital", "vivid"], correctIndex: 0),
            MathExamQuestion(id: "eng_34_e5", topicId: 34, prompt: "The root 'graph' means 'to write'. Which word does NOT use this root?", options: ["biography", "geography", "graphic", "grammar"], correctIndex: 3),
            MathExamQuestion(id: "eng_34_e6", topicId: 34, prompt: "Understanding that 'bio' means 'life' helps you figure out that 'antibiotic' literally means...", options: ["Against life (kills harmful organisms)", "For life", "Supporting growth", "Natural medicine"], correctIndex: 0),
            MathExamQuestion(id: "eng_34_e7", topicId: 34, prompt: "The Greek root 'geo' means 'earth'. Which word uses this root to mean 'the study of the earth'?", options: ["geometry", "geology", "geography", "All of the above use 'geo'"], correctIndex: 3),
            MathExamQuestion(id: "eng_34_e8", topicId: 34, prompt: "If 'tele' means 'far' and 'phone' means 'sound/voice', a telephone literally means...", options: ["A device that amplifies sound", "A device that carries sound over a far distance", "A device for recording sound", "A device that creates sound"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_e9", topicId: 34, prompt: "The root 'rupt' means 'to break'. What does 'interrupt' literally mean?", options: ["To break through completely", "To break between (disrupt something in the middle)", "To break down", "To break above"], correctIndex: 1),
            MathExamQuestion(id: "eng_34_e10", topicId: 34, prompt: "How does knowing Latin and Greek roots help with reading unfamiliar academic vocabulary?", options: ["It replaces the need to ever use a dictionary", "It provides clues to the meaning of unknown words by analysing their component parts", "It only helps with science words", "It makes all words easier to spell"], correctIndex: 1)
        ],

        // Topic 35: Advanced Grammar & Punctuation
        35: [
            MathExamQuestion(id: "eng_35_e1", topicId: 35, prompt: "Which sentence correctly uses a semicolon?", options: ["She was tired; and she kept going.", "She was tired; she kept going.", "She was; tired and she kept going.", "She was tired; But kept going."], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e2", topicId: 35, prompt: "When should a colon be used?", options: ["To join two independent clauses that contrast", "To introduce a list, quotation, or explanation after an independent clause", "To replace a comma before a conjunction", "Inside parenthetical phrases"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e3", topicId: 35, prompt: "Which sentence demonstrates parallel structure?", options: ["She enjoys reading, to swim, and hiking.", "She enjoys reading, swimming, and hiking.", "She enjoys to read, swimming, and to hike.", "She enjoys read, swim, and hike."], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e4", topicId: 35, prompt: "Identify the misplaced modifier: 'Running down the street, the bus was almost missed by me.'", options: ["'down the street' should come before 'bus'", "'Running down the street' modifies 'me', not 'bus'  -  it should be 'Running down the street, I almost missed the bus.'", "The sentence has no error", "'almost' is in the wrong position"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e5", topicId: 35, prompt: "What is the primary use of an em dash ( - )?", options: ["To hyphenate compound adjectives", "To show sudden interruption, emphasis, or to set off a parenthetical comment forcefully", "To separate items in a list", "To connect prefixes to words"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e6", topicId: 35, prompt: "Which sentence has a dangling modifier?", options: ["After eating dinner, she went to bed.", "After eating dinner, the dishes were washed by her.", "Having finished the race, he collapsed.", "Excited about the trip, she packed quickly."], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e7", topicId: 35, prompt: "Which is an example of faulty parallelism?", options: ["He likes to run, swim, and cycle.", "She is intelligent, creative, and ambitious.", "They enjoy hiking, camping, and to fish.", "We need courage, patience, and skill."], correctIndex: 2),
            MathExamQuestion(id: "eng_35_e8", topicId: 35, prompt: "In 'I have three goals: to graduate, to travel, and to write a novel', what punctuation rule is demonstrated?", options: ["Semicolon before a list", "Colon after an independent clause to introduce a list", "Em dash to set off an appositive", "Comma splice between two clauses"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e9", topicId: 35, prompt: "What is a 'comma splice'?", options: ["Using a comma before a subordinating conjunction", "Incorrectly joining two independent clauses with only a comma", "A comma used in a series of three or more items", "A comma placed after an introductory clause"], correctIndex: 1),
            MathExamQuestion(id: "eng_35_e10", topicId: 35, prompt: "Which sentence correctly fixes a comma splice?", options: ["She studied hard, she passed the exam.", "She studied hard; she passed the exam.", "She studied hard, and, she passed the exam.", "She studied hard, but she passed the exam  -  both are wrong."], correctIndex: 1)
        ],

        36: [
        MathExamQuestion(id: "eng_36_e1", topicId: 36, prompt: "Which part of an informative text introduces the topic to the reader?", options: ["The conclusion", "The topic sentence or introduction", "The bibliography", "The diagram"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e2", topicId: 36, prompt: "Priya is writing a report on the water cycle. Which detail belongs in her report?", options: ["I love swimming in the rain.", "Water evaporates from oceans and falls back to Earth as rain.", "Water is wet.", "My favourite drink is water."], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e3", topicId: 36, prompt: "Which text structure is MOST common in a how-to piece?", options: ["Compare and contrast", "Problem and solution", "Sequential / step-by-step order", "Cause and effect"], correctIndex: 2),
        MathExamQuestion(id: "eng_36_e4", topicId: 36, prompt: "What is the role of transition words like 'In addition' and 'Furthermore' in informative writing?", options: ["To show the writer's opinion", "To link ideas and add new supporting information smoothly", "To conclude the piece", "To introduce the topic"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e5", topicId: 36, prompt: "Which sentence is the weakest as a supporting detail in a report about sharks?", options: ["Great white sharks can grow up to 6 metres long.", "Sharks have multiple rows of teeth that are replaced throughout their lives.", "I think sharks are the scariest animals.", "Sharks play a key role in maintaining the balance of ocean ecosystems."], correctIndex: 2),
        MathExamQuestion(id: "eng_36_e6", topicId: 36, prompt: "A student's conclusion reads: 'As we have seen, bees are vital pollinators that support plant life and food production worldwide.' What makes this a strong conclusion?", options: ["It introduces a new idea about bees.", "It restates the key point of the report and shows its significance.", "It lists every bee species mentioned.", "It copies the introduction word for word."], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e7", topicId: 36, prompt: "In an informative text, which is TRUE about the author's personal opinions?", options: ["They should dominate the text.", "They can replace facts.", "They should be minimised  -  facts and evidence are primary.", "They make the text more accurate."], correctIndex: 2),
        MathExamQuestion(id: "eng_36_e8", topicId: 36, prompt: "What makes using headings and subheadings useful in a long informative report?", options: ["They make the report look creative.", "They help readers navigate and locate specific information.", "They replace the need for topic sentences.", "They are required by law."], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e9", topicId: 36, prompt: "Which feature best signals a how-to text?", options: ["Characters and a plot", "Numbered steps in sequential order", "Rhyming couplets", "First-person emotional language"], correctIndex: 1),
        MathExamQuestion(id: "eng_36_e10", topicId: 36, prompt: "How does a strong informative text treat its audience?", options: ["It assumes they know everything already.", "It uses jargon without explanation.", "It provides clear, accurate information in language the reader can understand.", "It entertains rather than informs."], correctIndex: 2),
    ],

    37: [
        MathExamQuestion(id: "eng_37_e1", topicId: 37, prompt: "Which signal word most clearly introduces an opinion?", options: ["Scientists found that", "According to research", "In my view", "The data proves"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_e2", topicId: 37, prompt: "Zoe writes: 'School uniforms should be compulsory because they reduce bullying related to clothing and create a sense of belonging.' How many reasons does she give?", options: ["None", "One", "Two", "Three"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_e3", topicId: 37, prompt: "What is a counter-argument in opinion writing?", options: ["Your own main opinion", "An argument that opposes your view, which you then address", "A concluding sentence", "A supporting reason for your opinion"], correctIndex: 1),
        MathExamQuestion(id: "eng_37_e4", topicId: 37, prompt: "Which sentence provides the STRONGEST reason?", options: ["I just think it is a good idea.", "My friend agrees with me.", "Research shows that students who exercise daily score higher on tests.", "People have had different opinions on this for a long time."], correctIndex: 2),
        MathExamQuestion(id: "eng_37_e5", topicId: 37, prompt: "Opinion writing is different from persuasive writing because:", options: ["Opinion writing uses no evidence", "Persuasive writing specifically tries to change the reader's mind; opinion writing states a view", "Opinion writing is longer", "They are exactly the same genre"], correctIndex: 1),
        MathExamQuestion(id: "eng_37_e6", topicId: 37, prompt: "A student writes: 'I believe libraries are essential, because they give everyone free access to books and knowledge.' What writing technique does 'because' signal?", options: ["A counter-argument", "A conclusion", "A reason that supports the opinion", "A definition"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_e7", topicId: 37, prompt: "Which opening best grabs the reader's attention in an opinion essay?", options: ["In this essay I will write about zoos.", "Did you know that over 800,000 animals are kept in captivity in zoos worldwide? I believe this must change.", "Zoos have been around for a long time.", "My teacher asked me to write about zoos."], correctIndex: 1),
        MathExamQuestion(id: "eng_37_e8", topicId: 37, prompt: "Which phrase signals that a writer is about to give a concluding statement?", options: ["For example", "In addition", "In conclusion / To sum up", "On the other hand"], correctIndex: 2),
        MathExamQuestion(id: "eng_37_e9", topicId: 37, prompt: "Why should an opinion writer sometimes acknowledge the opposing view?", options: ["To confuse the reader", "To show they have thought carefully and to make their argument more convincing", "To change their own opinion", "Because they must include at least four opinions"], correctIndex: 1),
        MathExamQuestion(id: "eng_37_e10", topicId: 37, prompt: "Which is the best concluding sentence for an opinion piece arguing that art should be compulsory in schools?", options: ["Art can be difficult for some students.", "Some people disagree about art in schools.", "In conclusion, art education should be required in every school because it develops creativity and critical thinking in all learners.", "I like art very much."], correctIndex: 2),
    ],

    38: [
        MathExamQuestion(id: "eng_38_e1", topicId: 38, prompt: "Where exactly does the punctuation go at the end of spoken words, relative to the closing quotation mark?", options: ["After the closing quotation mark", "Before the closing quotation mark (inside it)", "On a new line", "It depends on the country  -  no rule applies"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_e2", topicId: 38, prompt: "Which correctly shows a dialogue tag placed BEFORE the speech?", options: ["She said, \"Let's explore the cave.\"", "\"Let's explore the cave,\" she said.", "\"Let's explore the cave.\" She said,", "She said 'Let's explore the cave.'"], correctIndex: 0),
        MathExamQuestion(id: "eng_38_e3", topicId: 38, prompt: "A student writes four lines of dialogue between two characters without starting new paragraphs. What is wrong?", options: ["There are too few quotation marks.", "Each new speaker should begin a new paragraph.", "The dialogue tags are missing.", "The sentences are too short."], correctIndex: 1),
        MathExamQuestion(id: "eng_38_e4", topicId: 38, prompt: "Identify the error: She shouted, \"Come back!\" He replied, \"Never.\" They both laughed.", options: ["'Never' should end with an exclamation mark.", "'Come back!' needs a comma after it.", "He replied should start on a new line (new paragraph).", "There are no errors."], correctIndex: 2),
        MathExamQuestion(id: "eng_38_e5", topicId: 38, prompt: "Which sentence correctly punctuates interrupted dialogue (dialogue tag in the middle)?", options: ["\"I think,\" she said \"we should leave.\"", "\"I think,\" she said, \"we should leave.\"", "\"I think\" she said, \"we should leave.\"", "\"I think,\" she said \"We should leave.\""], correctIndex: 1),
        MathExamQuestion(id: "eng_38_e6", topicId: 38, prompt: "Which alternative dialogue tag makes the writing more expressive than 'said'?", options: ["Spoke", "Remarked", "Whispered nervously", "Communicated"], correctIndex: 2),
        MathExamQuestion(id: "eng_38_e7", topicId: 38, prompt: "Why do authors vary their dialogue tags (e.g., whispered, exclaimed, murmured)?", options: ["To avoid using quotation marks", "To show the way something was said and make dialogue more vivid", "Because 'said' is grammatically incorrect", "To show the characters' appearance"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_e8", topicId: 38, prompt: "Correct the error: \"Watch out for the puddle!\" she Warned.", options: ["\"Watch out for the puddle!\" she warned.", "\"Watch out for the puddle,\" she warned!", "Watch out for the puddle! she warned.", "\"Watch out for the puddle?\" she warned."], correctIndex: 0),
        MathExamQuestion(id: "eng_38_e9", topicId: 38, prompt: "In a long piece of writing, what does using varied dialogue tags help the reader understand?", options: ["The setting of the story", "The tone, emotion, and manner in which characters speak", "The plot of the story only", "The number of characters"], correctIndex: 1),
        MathExamQuestion(id: "eng_38_e10", topicId: 38, prompt: "Which is the most precise revision of: 'I am so excited!' said Amy.", options: ["'I am so excited!' Amy said.", "\"I am so excited!\" Amy exclaimed, bouncing on her heels.", "Amy said I am so excited!", "\"I am so excited!\" said Amy said."], correctIndex: 1),
    ],

    39: [
        MathExamQuestion(id: "eng_39_e1", topicId: 39, prompt: "What is the possessive form of 'the students' (many students, shared resource)?", options: ["The student's work", "The students's work", "The students' work", "The students work's"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_e2", topicId: 39, prompt: "Choose the correct sentence.", options: ["The womens hats were on the shelf.", "The women's hats were on the shelf.", "The woman's hats were on the shelf.", "The womens' hats were on the shelf."], correctIndex: 1),
        MathExamQuestion(id: "eng_39_e3", topicId: 39, prompt: "What is the irregular plural of 'ox'?", options: ["Oxes", "Oxen", "Ox", "Oxies"], correctIndex: 1),
        MathExamQuestion(id: "eng_39_e4", topicId: 39, prompt: "Which sentence correctly uses both a plural and a possessive?", options: ["The childrens' toys were everywhere.", "The children's toys were everywhere.", "The childrens toys were everywhere.", "The child's toys were everywhere (plural)."], correctIndex: 1),
        MathExamQuestion(id: "eng_39_e5", topicId: 39, prompt: "Which word is BOTH a possessive noun and uses an apostrophe correctly?", options: ["Its (belonging to it  -  no apostrophe)", "It's (it is  -  not possessive)", "The cat's tail", "The cats tail"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_e6", topicId: 39, prompt: "How do you form the possessive of a singular noun that ends in 's', like 'James'?", options: ["James' bike or James's bike (both acceptable)", "James bike", "Jame's bike", "Jamess bike"], correctIndex: 0),
        MathExamQuestion(id: "eng_39_e7", topicId: 39, prompt: "What is the plural of 'knife'?", options: ["Knifes", "Knives", "Knifes'", "Knive"], correctIndex: 1),
        MathExamQuestion(id: "eng_39_e8", topicId: 39, prompt: "Which phrase shows that THREE DOGS share one kennel?", options: ["The dog's kennel", "The dogs kennel", "The dogs' kennel", "The dog kennel's"], correctIndex: 2),
        MathExamQuestion(id: "eng_39_e9", topicId: 39, prompt: "What is the irregular plural of 'half'?", options: ["Halfs", "Halves", "Halfes", "Halfe"], correctIndex: 1),
        MathExamQuestion(id: "eng_39_e10", topicId: 39, prompt: "Which sentence correctly uses a possessive with an irregular plural noun?", options: ["The mouses' cheese was eaten.", "The mice's cheese was eaten.", "The mices' cheese was eaten.", "The mouse's cheeses were eaten."], correctIndex: 1),
    ],

    40: [
        MathExamQuestion(id: "eng_40_e1", topicId: 40, prompt: "Which sentence is correctly capitalised?", options: ["The president of the united states lives in the white house.", "The President of the United States lives in the White House.", "the president of the United States lives in the white house.", "The President of the united states lives in the White house."], correctIndex: 1),
        MathExamQuestion(id: "eng_40_e2", topicId: 40, prompt: "The word 'summer'  -  when should it be capitalised?", options: ["Always, because seasons are important", "Never  -  seasons are common nouns and stay lowercase", "Only when at the start of a sentence", "Only in poetry"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_e3", topicId: 40, prompt: "Which title is capitalised correctly? (Main words are capitalised; short articles/prepositions inside a title are not.)", options: ["the Lion, The witch And The wardrobe", "The Lion, the Witch and the Wardrobe", "The lion, The Witch And The Wardrobe", "the lion, the witch and the wardrobe"], correctIndex: 1),
        MathExamQuestion(id: "eng_40_e4", topicId: 40, prompt: "Which of these does NOT require a capital letter?", options: ["A person's first name", "A specific country", "A common noun like 'river' used generally", "A day of the week"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_e5", topicId: 40, prompt: "Correct the capitalisation: 'last tuesday, dr. smith flew to new york for a conference.'", options: ["Last Tuesday, Dr. Smith flew to new york for a conference.", "Last Tuesday, Dr. Smith flew to New York for a conference.", "Last Tuesday, dr. Smith flew to New York for a conference.", "last Tuesday, Dr. Smith flew to New York for a conference."], correctIndex: 1),
        MathExamQuestion(id: "eng_40_e6", topicId: 40, prompt: "When writing the name of a language, should it be capitalised?", options: ["No  -  languages are common nouns", "Yes  -  languages are proper nouns (e.g., French, Swahili, English)", "Only if the language is rare", "Only in formal documents"], correctIndex: 1),
        MathExamQuestion(id: "eng_40_e7", topicId: 40, prompt: "Which phrase is capitalised correctly?", options: ["aunt sarah and uncle bob", "Aunt Sarah and uncle Bob", "Aunt Sarah and Uncle Bob", "aunt Sarah and Uncle bob"], correctIndex: 2),
        MathExamQuestion(id: "eng_40_e8", topicId: 40, prompt: "In 'I visited the Amazon River and the Pacific Ocean', why are 'Amazon River' and 'Pacific Ocean' capitalised?", options: ["Because they are large and important", "Because they are proper nouns  -  names of specific geographical features", "Because they come after a comma", "Because rivers and oceans always get capitals"], correctIndex: 1),
        MathExamQuestion(id: "eng_40_e9", topicId: 40, prompt: "Which sentence has a capitalisation error?", options: ["We studied the French Revolution in history class.", "My favourite subject is mathematics.", "She speaks Spanish and Portuguese fluently.", "On friday we visited the Natural History museum."], correctIndex: 3),
        MathExamQuestion(id: "eng_40_e10", topicId: 40, prompt: "Which is correct? (Referring to a family title used with a name vs. used generally.)", options: ["I called my Uncle yesterday. / Uncle Tom came to visit.", "I called my uncle yesterday. / Uncle Tom came to visit.", "I called my uncle yesterday. / uncle Tom came to visit.", "I called my Uncle Yesterday. / Uncle tom came to visit."], correctIndex: 1),
    ],

    41: [
        MathExamQuestion(id: "eng_41_e1", topicId: 41, prompt: "Which sentence is compound-complex?", options: ["The dog barked.", "The dog barked and the cat hissed.", "Although the dog barked, the cat slept.", "Although the dog barked, the cat hissed, and the bird flew away."], correctIndex: 3),
        MathExamQuestion(id: "eng_41_e2", topicId: 41, prompt: "Identify: 'When the bell rang, students packed their bags, and the teacher dismissed the class.'", options: ["Simple", "Compound", "Complex", "Compound-complex"], correctIndex: 3),
        MathExamQuestion(id: "eng_41_e3", topicId: 41, prompt: "Which revision best improves a piece that uses only simple sentences?", options: ["Replace all verbs with adjectives.", "Combine related ideas using conjunctions to create compound and complex sentences.", "Remove all punctuation.", "Add more nouns."], correctIndex: 1),
        MathExamQuestion(id: "eng_41_e4", topicId: 41, prompt: "What is a subordinate clause?", options: ["A clause that can stand alone as a sentence", "A clause that depends on the main clause to make sense", "A sentence with no verb", "A sentence with more than ten words"], correctIndex: 1),
        MathExamQuestion(id: "eng_41_e5", topicId: 41, prompt: "Which sentence most effectively opens a paragraph with variety?", options: ["It was cold.", "It was cold and dark outside.", "Shivering against the biting wind, Ella pulled her scarf tighter.", "It was very very cold."], correctIndex: 2),
        MathExamQuestion(id: "eng_41_e6", topicId: 41, prompt: "What does starting a sentence with a subordinate clause (e.g., 'Although she was tired, ...') add to writing?", options: ["It makes the sentence a fragment.", "It creates variety and emphasises contrast or condition before the main point.", "It removes the need for a main clause.", "It always makes sentences shorter."], correctIndex: 1),
        MathExamQuestion(id: "eng_41_e7", topicId: 41, prompt: "A passage reads: 'The rain fell. The wind blew. The trees bent. The children stayed inside.' What is the best revision strategy?", options: ["Add more adjectives to each simple sentence.", "Combine sentences: 'As the rain fell and the wind blew, bending the trees, the children stayed inside.'", "Delete two sentences.", "Change all verbs to present tense."], correctIndex: 1),
        MathExamQuestion(id: "eng_41_e8", topicId: 41, prompt: "Which coordinating conjunction would best join: 'She trained hard ___ she did not win the race.'", options: ["And", "So", "But", "Or"], correctIndex: 2),
        MathExamQuestion(id: "eng_41_e9", topicId: 41, prompt: "What is the effect of using a very short simple sentence after a long complex one?", options: ["It creates confusion.", "It adds emphasis and makes the short idea stand out.", "It weakens the long sentence.", "It is always a grammar error."], correctIndex: 1),
        MathExamQuestion(id: "eng_41_e10", topicId: 41, prompt: "Which writer's goal is best achieved through sentence variety?", options: ["Showing that you know many facts", "Making writing engaging by controlling pace and emphasis", "Avoiding the use of punctuation", "Writing the most words possible"], correctIndex: 1),
    ],

    42: [
        MathExamQuestion(id: "eng_42_e1", topicId: 42, prompt: "Read: 'The house was dark. No smoke rose from the chimney. Post piled up at the door.' What can you infer?", options: ["The family is having a party.", "Nobody has been home for some time.", "The house is newly built.", "The family is asleep."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e2", topicId: 42, prompt: "Which statement best describes a strong inference?", options: ["A guess that ignores the text", "A conclusion based on specific textual evidence and prior knowledge", "A direct quote from the passage", "A summary of the plot"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e3", topicId: 42, prompt: "Read: 'Mia checked her phone repeatedly, then sighed and put it face-down on the table.' What can you MOST likely infer?", options: ["Mia is bored with social media.", "Mia is waiting for a message and is disappointed or anxious it hasn't arrived.", "Mia dropped her phone accidentally.", "Mia is watching a video."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e4", topicId: 42, prompt: "A reader infers that a character is nervous. Which detail from the text MOST supports this?", options: ["The character smiled broadly.", "The character spoke in a loud, clear voice.", "The character twisted her hands together and avoided eye contact.", "The character ate a large meal."], correctIndex: 2),
        MathExamQuestion(id: "eng_42_e5", topicId: 42, prompt: "Why is background knowledge important when making inferences?", options: ["It lets you ignore the text entirely.", "It helps you fill in gaps the author left, using what you already know about the world.", "It is not useful  -  only the text matters.", "It tells you what the author was thinking."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e6", topicId: 42, prompt: "Read: 'She won the gold medal and stood on the podium as her nation's anthem played.' What can you infer about how she feels?", options: ["She is confused and lost.", "She feels proud and likely emotional.", "She is angry at the other competitors.", "She does not care about the race."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e7", topicId: 42, prompt: "What is the difference between an inference and an assumption?", options: ["They are identical.", "An inference is grounded in textual evidence; an assumption is made without evidence.", "An assumption is always correct.", "An inference ignores the text."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e8", topicId: 42, prompt: "Read: 'The scientist frowned at the results, crossed out a line of data, and started again from scratch.' What can you infer?", options: ["The scientist found exactly what they expected.", "The scientist made an error or got an unexpected result and needs to redo the work.", "The scientist is finished with the experiment.", "The scientist is teaching a student."], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e9", topicId: 42, prompt: "Which reading strategy helps you make better inferences as you read?", options: ["Reading as fast as possible without stopping", "Pausing to ask yourself what clues are present and what you already know", "Skipping unfamiliar words", "Only reading the first and last paragraphs"], correctIndex: 1),
        MathExamQuestion(id: "eng_42_e10", topicId: 42, prompt: "Read: 'The restaurant was packed. There was a 45-minute wait. The smell of garlic and herbs filled the air.' What can you infer about the restaurant?", options: ["The restaurant is about to close.", "The restaurant is popular and the food is likely very good.", "The restaurant is serving breakfast.", "Nobody likes this restaurant."], correctIndex: 1),
    ],

    43: [
        MathExamQuestion(id: "eng_43_e1", topicId: 43, prompt: "Which summary best captures the key idea of a passage about climate change?", options: ["Climate change is a very serious problem that everyone is talking about these days.", "Climate change, driven largely by human activity, is causing rising temperatures, extreme weather events, and threats to ecosystems worldwide.", "Scientists disagree about many things.", "The Earth's temperature has changed before."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e2", topicId: 43, prompt: "Original: 'Marie Curie was a pioneering physicist and chemist who conducted groundbreaking research on radioactivity and became the first woman to win a Nobel Prize.' Best paraphrase?", options: ["Marie Curie was a physicist.", "Marie Curie won a prize.", "Marie Curie was a trailblazing scientist whose research on radioactivity led to her becoming the first woman awarded a Nobel Prize.", "Marie Curie worked very hard."], correctIndex: 2),
        MathExamQuestion(id: "eng_43_e3", topicId: 43, prompt: "A student's 'summary' of a five-paragraph article is two pages long. What is the most likely problem?", options: ["The summary is too short.", "The student included too many supporting details instead of only key ideas.", "The student forgot to write a conclusion.", "The article was too short to summarise."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e4", topicId: 43, prompt: "Which technique should you use BEFORE writing a summary?", options: ["Copy the text three times.", "Highlight or identify the main idea and most important supporting points.", "Write a personal response about your feelings.", "Count the number of sentences."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e5", topicId: 43, prompt: "Why is paraphrasing an important academic skill?", options: ["It lets you pretend you wrote the original text.", "It demonstrates understanding and avoids plagiarism.", "It is faster than reading.", "It removes the need to cite sources."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e6", topicId: 43, prompt: "Which is a correct way to begin a summary?", options: ["In this text, the author argues that / explains that...", "I think that...", "Once upon a time...", "The title is..."], correctIndex: 0),
        MathExamQuestion(id: "eng_43_e7", topicId: 43, prompt: "What is the key difference between a summary and a paraphrase?", options: ["A paraphrase is always shorter than a summary.", "A summary condenses a whole text; a paraphrase rewrites a specific portion.", "A summary keeps original words; a paraphrase changes them.", "They are the same thing."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e8", topicId: 43, prompt: "A student paraphrases: 'The weather was very bad.' (Original: 'A powerful storm system caused widespread flooding and damage across the region.') What is wrong?", options: ["The paraphrase is too long.", "The paraphrase loses important specific information and is too vague.", "The paraphrase uses too many adjectives.", "Nothing is wrong."], correctIndex: 1),
        MathExamQuestion(id: "eng_43_e9", topicId: 43, prompt: "Which THREE elements are essential in a well-written summary?", options: ["Correct spelling, beautiful handwriting, and long sentences", "The writer's personal opinion, quotations, and the title", "Main idea, key supporting points, and concise language in your own words", "Character names, setting, and dialogue"], correctIndex: 2),
        MathExamQuestion(id: "eng_43_e10", topicId: 43, prompt: "What does it mean to 'condense' information in a summary?", options: ["To expand on all ideas with more detail", "To reduce the length while keeping only the most important points", "To copy and paste key sentences", "To translate the text into another language"], correctIndex: 1),
    ],

    44: [
        MathExamQuestion(id: "eng_44_e1", topicId: 44, prompt: "An ad claims: 'Doctors recommend SleepEase tablets.' What should a critical thinker question?", options: ["Nothing  -  doctors are always right", "Which doctors? How many? Was this study independent?", "What flavour the tablets are", "Whether the packaging is attractive"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e2", topicId: 44, prompt: "Which is the BEST definition of 'bias' in media?", options: ["Reporting only facts with no emotion", "A tendency to present information in a way that favours one side or perspective", "Using statistics in news reports", "Writing clearly and concisely"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e3", topicId: 44, prompt: "A news article is written by a tobacco company about the health effects of smoking. Why might a media-literate person be cautious?", options: ["The article is about a boring topic.", "The company has a financial interest in the outcome, which may bias the reporting.", "The article is too long.", "News articles are never trustworthy."], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e4", topicId: 44, prompt: "Which headline is MOST likely to be a fact rather than an opinion?", options: ["The new film is a masterpiece.", "Climate scientists are wrong about everything.", "Global average temperatures rose by 1.1°C between 1850 and 2022.", "Social media is destroying society."], correctIndex: 2),
        MathExamQuestion(id: "eng_44_e5", topicId: 44, prompt: "What does 'cross-referencing sources' mean when evaluating media?", options: ["Reading the same article multiple times", "Checking information against several independent, reliable sources", "Sharing the article with friends", "Printing the article out"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e6", topicId: 44, prompt: "Which persuasive technique does an advert use when it shows a celebrity saying 'I use this product every day'?", options: ["Statistical evidence", "Celebrity endorsement / appeal to authority", "Logical argument", "Fear appeal"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e7", topicId: 44, prompt: "What is a 'filter bubble' in the context of media literacy?", options: ["A device that blocks adverts", "When algorithms show you only content that matches your existing views, limiting exposure to different perspectives", "A news summary service", "A type of spam email"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e8", topicId: 44, prompt: "Which of these questions is MOST useful when evaluating a source online?", options: ["Is the website colourful and modern?", "Who created this, when was it written, and what evidence is provided?", "Does the article have many comments?", "Is the article short?"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e9", topicId: 44, prompt: "What is 'misinformation'?", options: ["Information that is deliberately kept secret", "False or inaccurate information, whether spread intentionally or by mistake", "Opinion stated as fact in an advert only", "Information found in libraries"], correctIndex: 1),
        MathExamQuestion(id: "eng_44_e10", topicId: 44, prompt: "A media-literate student reads a shocking news headline. What is the BEST first response?", options: ["Share it immediately to warn friends", "Believe it because headlines are always accurate", "Pause, read the full article, check the source, and verify with other reliable sources", "Ignore all news to avoid misinformation"], correctIndex: 2),
    ],

        45: [
        MathExamQuestion(id: "eng_45_e1", topicId: 45, prompt: "Which of the following is the best example of a proofreading correction?", options: ["Changing the topic of your essay", "Fixing 'teh' to 'the'", "Adding more paragraphs", "Choosing a new title"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e2", topicId: 45, prompt: "What is the difference between editing and revising?", options: ["They are exactly the same", "Editing fixes errors; revising improves ideas and structure", "Revising fixes spelling; editing changes the topic", "Editing adds more pages"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e3", topicId: 45, prompt: "Which sentence has a grammar error?", options: ["We went to the park.", "She runned all the way home.", "He is my best friend.", "They played soccer."], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e4", topicId: 45, prompt: "A peer reviewer suggests your conclusion is weak. What should you do?", options: ["Ignore the comment", "Delete the conclusion", "Rewrite the conclusion to be stronger", "Start a completely new essay"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_e5", topicId: 45, prompt: "Which punctuation mark ends a question?", options: ["Period (.)", "Exclamation mark (!)", "Question mark (?)", "Comma (,)"], correctIndex: 2),
        MathExamQuestion(id: "eng_45_e6", topicId: 45, prompt: "Why is it helpful to read your writing aloud when proofreading?", options: ["It makes your voice stronger", "It helps you hear mistakes that are hard to see", "It replaces spell-checking", "It is faster than reading silently"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e7", topicId: 45, prompt: "Which correctly uses a comma?", options: ["I like apples, bananas, and grapes.", "I like, apples bananas and grapes.", "I, like apples bananas and grapes.", "I like apples bananas, and grapes."], correctIndex: 0),
        MathExamQuestion(id: "eng_45_e8", topicId: 45, prompt: "What is the best order for the writing process?", options: ["Edit, draft, revise, publish", "Draft, revise, edit, publish", "Publish, draft, edit, revise", "Revise, edit, draft, publish"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e9", topicId: 45, prompt: "A student's essay has run-on sentences. What is the best fix?", options: ["Delete entire sentences", "Break the run-on sentences into shorter, correct sentences", "Add more run-on sentences", "Change the topic"], correctIndex: 1),
        MathExamQuestion(id: "eng_45_e10", topicId: 45, prompt: "Which is an example of a revision (not just editing)?", options: ["Fixing a spelling mistake", "Removing a whole section that doesn't support your argument", "Adding a missing comma", "Capitalising a proper noun"], correctIndex: 1),
    ],

    46: [
        MathExamQuestion(id: "eng_46_e1", topicId: 46, prompt: "Which of the following is the best opening for a set of instructions?", options: ["Once upon a time...", "You will need: scissors, glue, and paper. Step 1:", "I think this is how you do it...", "Long ago in a far-away land..."], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e2", topicId: 46, prompt: "Why is using precise language important in technical writing?", options: ["To make the writing more emotional", "To avoid confusion and ensure accuracy", "To entertain the reader", "To make the writing longer"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e3", topicId: 46, prompt: "Which transition word is most appropriate in a procedural text?", options: ["Once upon a time", "Surprisingly", "Next, connect the two wires", "I believe that"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_e4", topicId: 46, prompt: "A student writes instructions for folding a paper plane. Which is the best step?", options: ["Fold in a fun way.", "Fold the left edge to the centre crease.", "Fold it somehow.", "Do the folding part."], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e5", topicId: 46, prompt: "What should you do if you skip a step in procedural writing?", options: ["It doesn't matter", "Move on and complete the other steps", "The instructions may not work correctly", "Skip all remaining steps too"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_e6", topicId: 46, prompt: "Which is NOT a characteristic of technical writing?", options: ["Clear steps", "Precise language", "Emotional storytelling", "Logical order"], correctIndex: 2),
        MathExamQuestion(id: "eng_46_e7", topicId: 46, prompt: "A diagram in a technical document helps the reader:", options: ["Enjoy the story more", "Visualise what is being described", "Find rhyming words", "Understand the character"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e8", topicId: 46, prompt: "Which is the best example of precise technical language?", options: ["Add some water.", "Add approximately 250 millilitres of water.", "Pour a lot of water.", "Use water as needed."], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e9", topicId: 46, prompt: "An instruction manual should be written:", options: ["In past tense with lots of emotions", "In second person, using clear and direct commands", "As a poem with rhyming couplets", "As a personal diary entry"], correctIndex: 1),
        MathExamQuestion(id: "eng_46_e10", topicId: 46, prompt: "What is a procedural text?", options: ["A story with a plot twist", "A text that explains how to do something step by step", "A text that argues for a position", "A poem that describes nature"], correctIndex: 1),
    ],

    47: [
        MathExamQuestion(id: "eng_47_e1", topicId: 47, prompt: "Which describes effective vocal delivery?", options: ["Speaking fast and quietly", "Speaking clearly at a steady pace with varied tone", "Mumbling and looking away", "Shouting every word"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e2", topicId: 47, prompt: "What is the main reason to use a visual aid in a presentation?", options: ["To fill time", "To help the audience understand your topic better", "To avoid speaking", "To show off your artistic skills"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e3", topicId: 47, prompt: "A presenter speaks too fast. The audience is confused. What should the presenter do?", options: ["Speak even faster to finish", "Slow down and repeat key points", "Stop the presentation", "Remove all visual aids"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e4", topicId: 47, prompt: "Which is the best way to handle nervousness before presenting?", options: ["Cancel the presentation", "Practise thoroughly beforehand", "Read every word from notes without looking up", "Speak as quietly as possible"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e5", topicId: 47, prompt: "Why should slides in a presentation not be too crowded with text?", options: ["To save paper", "So the audience listens to you rather than just reading slides", "To make slides look blank", "To reduce the number of slides"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e6", topicId: 47, prompt: "What does 'pacing' mean in a presentation?", options: ["The colour of your visual aids", "The speed at which you speak", "The number of slides you use", "The topic you choose"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e7", topicId: 47, prompt: "A presenter uses a poster with a clear diagram. This is helpful because:", options: ["It replaces the need to speak", "It visually supports the spoken explanation", "It confuses the audience", "It makes the presentation shorter"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e8", topicId: 47, prompt: "What is the best response if an audience member asks a question you don't know?", options: ["Pretend you know and make something up", "Honestly say you are unsure and will find out", "Ignore the question", "End the presentation immediately"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e9", topicId: 47, prompt: "Which presentation habit builds the most audience trust?", options: ["Reading directly from a script without looking up", "Speaking confidently, making eye contact, and being prepared", "Using as many slides as possible", "Speaking in a very quiet voice"], correctIndex: 1),
        MathExamQuestion(id: "eng_47_e10", topicId: 47, prompt: "After finishing your presentation, you should:", options: ["Run out of the room", "Thank the audience and ask if there are questions", "Immediately start over", "Apologise for any mistakes at length"], correctIndex: 1),
    ],

    48: [
        MathExamQuestion(id: "eng_48_e1", topicId: 48, prompt: "What makes an argument 'logical'?", options: ["It uses emotional words only", "It is supported by relevant evidence and reasoning", "It is the loudest opinion", "It repeats the same point many times"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e2", topicId: 48, prompt: "In a formal debate, the 'affirmative' side:", options: ["Argues against the topic", "Argues in favour of the topic", "Asks the questions", "Judges the debate"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e3", topicId: 48, prompt: "Which is the strongest counterargument to 'We should have more PE at school'?", options: ["PE is tiring", "Extra PE time would take away from core academic subjects", "Running is hard", "Not everyone likes sport"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e4", topicId: 48, prompt: "What is the purpose of presenting evidence in a debate?", options: ["To confuse the other team", "To support your claim with proof", "To use up your speaking time", "To show off vocabulary"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e5", topicId: 48, prompt: "A debater says 'Everyone knows I am right.' This is weak because:", options: ["It is said too slowly", "It offers no specific evidence or reasoning", "It is too polite", "It is too long"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e6", topicId: 48, prompt: "Which sentence is a claim, not evidence?", options: ["A 2024 study found that sleep improves grades.", "Students who sleep 9 hours score higher.", "Sleep deprivation affects 60% of teenagers.", "Teens should sleep at least 9 hours per night."], correctIndex: 3),
        MathExamQuestion(id: "eng_48_e7", topicId: 48, prompt: "When should you listen during a debate?", options: ["Only when it is your turn to speak", "Only at the start", "Throughout the whole debate, especially when the other side speaks", "Never; preparation is enough"], correctIndex: 2),
        MathExamQuestion(id: "eng_48_e8", topicId: 48, prompt: "Which transition phrase best introduces a counterargument?", options: ["In addition", "Furthermore", "On the other hand", "First of all"], correctIndex: 2),
        MathExamQuestion(id: "eng_48_e9", topicId: 48, prompt: "What does 'rebuttal' mean in a debate?", options: ["Agreeing with the other side", "Responding to and challenging the opponent's argument", "Introducing your opening statement", "Summarising both sides"], correctIndex: 1),
        MathExamQuestion(id: "eng_48_e10", topicId: 48, prompt: "Which debate strategy is most effective?", options: ["Repeat your point louder if ignored", "Present evidence, address counterarguments, and stay calm", "Interrupt the other side frequently", "Focus only on personal opinions"], correctIndex: 1),
    ],

    49: [
        MathExamQuestion(id: "eng_49_e1", topicId: 49, prompt: "Which is the best example of active listening?", options: ["Thinking about what to say next while the teacher talks", "Focusing fully on the speaker and taking mental notes", "Drawing pictures during a lesson", "Talking quietly to a friend"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e2", topicId: 49, prompt: "The teacher says: 'Get out your pencil, open page 15, read paragraph two, and answer question three.' What is the third step?", options: ["Get out your pencil", "Open page 15", "Read paragraph two", "Answer question three"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_e3", topicId: 49, prompt: "A student follows only the first of three directions. What is the likely outcome?", options: ["The task is completely finished", "The student finishes faster", "The task is incomplete or incorrect", "Nothing changes"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_e4", topicId: 49, prompt: "Which strategy best helps you remember spoken directions?", options: ["Thinking about something else", "Writing key words while listening", "Waiting until all steps are done to try to remember", "Listening only to the last step"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e5", topicId: 49, prompt: "What does it mean to 'paraphrase' what you heard?", options: ["Repeat exactly what the speaker said", "Restate the information in your own words to check understanding", "Ignore what you heard", "Argue with the speaker"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e6", topicId: 49, prompt: "Which of the following is a distraction to listening?", options: ["Looking at the speaker", "Using headphones for music during a lesson", "Sitting up straight", "Nodding to show understanding"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e7", topicId: 49, prompt: "A speaker gives four steps to follow. You remember steps 1, 2, and 4 but missed step 3. You should:", options: ["Skip step 3 and continue", "Guess what step 3 might be", "Politely ask the speaker to repeat step 3", "Start all steps from scratch"], correctIndex: 2),
        MathExamQuestion(id: "eng_49_e8", topicId: 49, prompt: "Listening comprehension is tested when:", options: ["You write a personal story", "You answer questions about something you heard", "You read silently from a textbook", "You draw a picture"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e9", topicId: 49, prompt: "Which factor most helps you understand spoken multi-step instructions?", options: ["Focusing on only the first word", "Paying attention to all steps in order", "Writing the steps backwards", "Listening to the last step only"], correctIndex: 1),
        MathExamQuestion(id: "eng_49_e10", topicId: 49, prompt: "After someone gives you directions, a good active listener might:", options: ["Immediately walk away", "Restate the directions back to confirm understanding", "Say 'I didn't hear any of that'", "Ask unrelated questions"], correctIndex: 1),
    ],

    50: [
        MathExamQuestion(id: "eng_50_e1", topicId: 50, prompt: "'The child left the freezer open all night, so all the ice cream melted.' Identify the cause.", options: ["All the ice cream melted", "The child left the freezer open all night", "It was a hot summer day", "The child was hungry"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e2", topicId: 50, prompt: "Identify the effect: 'Because Maria practised daily, she became an excellent pianist.'", options: ["Maria practised daily", "She became an excellent pianist", "She liked music", "She had a piano at home"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e3", topicId: 50, prompt: "Which sentence does NOT show a cause-and-effect relationship?", options: ["She cried because she lost her cat.", "He studied hard, so he passed.", "The dog is brown and fluffy.", "It was cold, so they wore coats."], correctIndex: 2),
        MathExamQuestion(id: "eng_50_e4", topicId: 50, prompt: "In a text, which question helps identify the cause?", options: ["What happened next?", "Why did this happen?", "Where is the main character?", "Who wrote this text?"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e5", topicId: 50, prompt: "A story says: 'As a result of the drought, crops failed.' What is the cause?", options: ["Crops failed", "The farmer was sad", "The drought", "It was autumn"], correctIndex: 2),
        MathExamQuestion(id: "eng_50_e6", topicId: 50, prompt: "Can one cause have multiple effects?", options: ["No, one cause always has one effect", "Yes, one cause can lead to many effects", "Effects always come before causes", "No, effects and causes are unrelated"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e7", topicId: 50, prompt: "In the sentence 'The bridge collapsed because of the flood,' what is the effect?", options: ["The flood", "The bridge collapsed", "The river rose", "The town was evacuated"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e8", topicId: 50, prompt: "Which best completes the cause-effect statement? 'Jamie forgot her umbrella, _______ she got soaked in the rain.'", options: ["although", "so", "but", "because"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e9", topicId: 50, prompt: "An author uses cause and effect to:", options: ["Make the text rhyme", "Help readers understand why events happen", "Add more characters", "Change the setting"], correctIndex: 1),
        MathExamQuestion(id: "eng_50_e10", topicId: 50, prompt: "Which graphic organiser best shows cause-and-effect relationships?", options: ["A Venn diagram", "A flow chart with arrows showing causes leading to effects", "A glossary", "A character map"], correctIndex: 1),
    ],

    51: [
        MathExamQuestion(id: "eng_51_e1", topicId: 51, prompt: "Text A is a biography of Amelia Earhart. Text B is a biography of Neil Armstrong. A similarity is:", options: ["Both are about the same person", "Both are biographies of famous figures in aviation/space", "Both use fictional events", "Both are written as diary entries"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_e2", topicId: 51, prompt: "Text A uses a formal tone. Text B uses a friendly, casual tone. This is a:", options: ["Similarity in style", "Difference in tone", "Similarity in purpose", "Difference in topic"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_e3", topicId: 51, prompt: "In a Venn diagram comparing two texts, the outer sections of each circle hold:", options: ["Shared features", "Differences unique to each text", "The titles of both texts", "Questions about both texts"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_e4", topicId: 51, prompt: "Text A argues that zoos are harmful; Text B argues that zoos protect animals. They are:", options: ["Similar in their conclusions", "Contrasting in their viewpoints", "The same text written differently", "Identical in evidence"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_e5", topicId: 51, prompt: "Which transition phrase signals a comparison?", options: ["On the other hand", "In contrast", "Similarly to Text A, Text B also...", "However"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_e6", topicId: 51, prompt: "When contrasting texts, you might compare their:", options: ["Number of pages and font size", "Author's name and publication date only", "Purpose, audience, structure, and tone", "Cover colour and illustration style"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_e7", topicId: 51, prompt: "Both texts mention the importance of water conservation. This goes in which section of a Venn diagram?", options: ["Left circle only", "Right circle only", "The overlapping section", "Outside both circles"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_e8", topicId: 51, prompt: "Text A is a poem; Text B is an essay. Their main difference is:", options: ["Topic", "Author", "Text type / format", "Publication year"], correctIndex: 2),
        MathExamQuestion(id: "eng_51_e9", topicId: 51, prompt: "Why is it useful to compare and contrast two texts on the same topic?", options: ["To pick which text is more famous", "To understand different perspectives and deepen comprehension", "To find which text has more pages", "To see which text has a better title"], correctIndex: 1),
        MathExamQuestion(id: "eng_51_e10", topicId: 51, prompt: "Text A and Text B are both informational, but Text A uses statistics and Text B uses case studies. This is a difference in:", options: ["Topic", "Text type", "Evidence and approach", "Author purpose"], correctIndex: 2),
    ],

    52: [
        MathExamQuestion(id: "eng_52_e1", topicId: 52, prompt: "Which feature is unique to diary writing compared to most other genres?", options: ["It uses first-person voice and is addressed to 'Dear Diary'", "It always rhymes", "It follows numbered steps", "It argues a position"], correctIndex: 0),
        MathExamQuestion(id: "eng_52_e2", topicId: 52, prompt: "What is the purpose of dating a diary entry?", options: ["To make it look official", "To record when the event or feeling occurred", "To add decoration to the page", "To signal the end of the entry"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_e3", topicId: 52, prompt: "Which diary entry shows the best reflection?", options: ["Today I had breakfast.", "Step 1: I woke up.", "Today I argued with my sister. I felt upset, but later I realised she was trying to help me.", "Once upon a time I had a great day."], correctIndex: 2),
        MathExamQuestion(id: "eng_52_e4", topicId: 52, prompt: "A journal entry that only lists events without feelings or reflection is:", options: ["Perfect for a diary", "Missing the personal reflection that makes a diary meaningful", "An example of technical writing", "A good debate argument"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_e5", topicId: 52, prompt: "Which pronoun is most common in a diary entry?", options: ["He", "They", "I", "You"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_e6", topicId: 52, prompt: "Why might an author use diary entries as a narrative device in a novel?", options: ["To add more characters to the story", "To give insight into a character's private thoughts and feelings", "To make the book longer", "To replace dialogue"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_e7", topicId: 52, prompt: "A diary should typically be written in which tense for events that already happened?", options: ["Future tense", "Present tense only", "Past tense", "Conditional tense"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_e8", topicId: 52, prompt: "Which is a good topic for a diary entry?", options: ["How to build a kite", "Arguments for longer school days", "How I felt when I won the spelling bee today", "A story about a dragon in a castle"], correctIndex: 2),
        MathExamQuestion(id: "eng_52_e9", topicId: 52, prompt: "What is one key difference between a diary and a formal essay?", options: ["A diary uses formal academic language; an essay does not", "A diary is personal and emotional; an essay is formal and analytical", "An essay is always shorter than a diary", "A diary always has a thesis statement"], correctIndex: 1),
        MathExamQuestion(id: "eng_52_e10", topicId: 52, prompt: "A student writes: 'Dear Diary, March 22  -  Today was rough. I missed my best friend's birthday because I was sick. I felt terrible.' What makes this a strong diary entry?", options: ["It gives numbered instructions", "It is written in third person", "It includes a date, first-person voice, and honest personal reflection", "It contains rhyming lines"], correctIndex: 2),
    ],

    53: [
        MathExamQuestion(id: "eng_53_e1", topicId: 53, prompt: "A novel set in ancient Rome with fictional characters living through real historical events belongs to which genre?", options: ["Science Fiction", "Fantasy", "Historical Fiction", "Mystery"], correctIndex: 2),
        MathExamQuestion(id: "eng_53_e2", topicId: 53, prompt: "Which is a defining feature of the science fiction genre?", options: ["Magic spells and mythical creatures", "Settings and technology based on imagined future or scientific advances", "Real events from the past", "Everyday problems in a realistic modern setting"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_e3", topicId: 53, prompt: "A book about a girl in modern day New York who solves friendship problems at school belongs to which genre?", options: ["Historical Fiction", "Realistic Fiction", "Fantasy", "Science Fiction"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_e4", topicId: 53, prompt: "Which element would you most likely find in a fantasy novel?", options: ["A real historical battle", "A school in present-day London", "A dragon guarding an enchanted forest", "Robots exploring Mars in 2500"], correctIndex: 2),
        MathExamQuestion(id: "eng_53_e5", topicId: 53, prompt: "A mystery novel always includes:", options: ["A dragon or magical creature", "A problem, clues, and a resolution to the mystery", "Space travel and alien life", "A detailed timeline of history"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_e6", topicId: 53, prompt: "What makes historical fiction different from a history textbook?", options: ["Historical fiction uses only real people; textbooks use fictional ones", "Historical fiction blends real history with fictional characters or events; textbooks report facts only", "Historical fiction never mentions real events", "Textbooks always tell a story with a plot"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_e7", topicId: 53, prompt: "A reader who enjoys wondering 'whodunit?' and following clues would most enjoy which genre?", options: ["Realistic Fiction", "Science Fiction", "Mystery", "Historical Fiction"], correctIndex: 2),
        MathExamQuestion(id: "eng_53_e8", topicId: 53, prompt: "Which best explains why recognising a genre is helpful?", options: ["It tells you whether the book is long or short", "It helps you set expectations and choose books that match your interests", "It tells you how many characters are in the book", "It replaces the need to read the book"], correctIndex: 1),
        MathExamQuestion(id: "eng_53_e9", topicId: 53, prompt: "The Hunger Games is set in a future dystopian society with advanced technology. Its genre is:", options: ["Historical Fiction", "Realistic Fiction", "Mystery", "Science Fiction"], correctIndex: 3),
        MathExamQuestion(id: "eng_53_e10", topicId: 53, prompt: "A book features an ordinary boy who discovers he is a wizard and attends a school of magic. This is an example of:", options: ["Realistic Fiction", "Mystery", "Fantasy", "Historical Fiction"], correctIndex: 2),
    ],

    // Topic 54: Nouns and Pronouns
    54: [
        MathExamQuestion(id: "eng_54_e1", topicId: 54, prompt: "Which of these is a proper noun?", options: ["city", "river", "Mount Everest", "teacher", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e2", topicId: 54, prompt: "Which word is a pronoun?", options: ["table", "run", "we", "blue", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e3", topicId: 54, prompt: "Which sentence correctly replaces the noun with a pronoun?\n'The girls played in the park. ___ had a great time.'", options: ["He had a great time.", "They had a great time.", "It had a great time.", "She had a great time.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_e4", topicId: 54, prompt: "What type of noun is 'courage'?", options: ["Proper noun", "Collective noun", "Concrete noun", "Abstract noun", "I don't know / Wasn't taught"], correctIndex: 3),
        MathExamQuestion(id: "eng_54_e5", topicId: 54, prompt: "Which of these is a collective noun?", options: ["dog", "flock", "running", "slowly", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_e6", topicId: 54, prompt: "Choose the correct pronoun: 'Carlos forgot ___ homework.'", options: ["she", "their", "his", "her", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e7", topicId: 54, prompt: "Which sentence uses a reflexive pronoun?", options: ["She gave him the book.", "He hurt himself.", "They went home.", "We saw them there.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_e8", topicId: 54, prompt: "Which is the subject pronoun in 'She and I went to the library'?", options: ["the library", "went", "She and I", "to", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e9", topicId: 54, prompt: "What is the plural of the noun 'child'?", options: ["childs", "childes", "children", "childrens", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e10", topicId: 54, prompt: "Which sentence uses an object pronoun correctly?", options: ["Her gave me the pen.", "She gave I the pen.", "She gave me the pen.", "Me gave her the pen.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e11", topicId: 54, prompt: "Which of these nouns is both singular AND plural without changing form?", options: ["mouse", "sheep", "child", "foot", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_e12", topicId: 54, prompt: "In 'The team won their match', what kind of noun is 'team'?", options: ["Proper noun", "Abstract noun", "Collective noun", "Reflexive noun", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_54_e13", topicId: 54, prompt: "Which sentence uses a possessive pronoun?", options: ["The dog is hers.", "She went to school.", "They ran quickly.", "We ate lunch.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_54_e14", topicId: 54, prompt: "Which pronoun agrees with the noun in: 'Each student must bring ___ own pencil.'?", options: ["their", "his or her", "our", "its", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_54_e15", topicId: 54, prompt: "Which sentence avoids repeating the noun correctly by using a pronoun?\n'Tom loves football. ___ plays every weekend.'", options: ["She plays every weekend.", "He plays every weekend.", "It plays every weekend.", "They plays every weekend.", "I don't know / Wasn't taught"], correctIndex: 1),
    ],

    // Topic 55: Verbs and Tenses
    55: [
        MathExamQuestion(id: "eng_55_e1", topicId: 55, prompt: "Which sentence is written in the past tense?", options: ["She walks to school.", "She will walk to school.", "She walked to school.", "She is walking to school.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e2", topicId: 55, prompt: "What is the past tense of the irregular verb 'go'?", options: ["goed", "goes", "going", "went", "I don't know / Wasn't taught"], correctIndex: 3),
        MathExamQuestion(id: "eng_55_e3", topicId: 55, prompt: "Which sentence is in the present continuous tense?", options: ["She played.", "She plays.", "She is playing.", "She will play.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e4", topicId: 55, prompt: "Which word is an action verb in: 'The chef quickly prepared a delicious meal.'?", options: ["quickly", "delicious", "prepared", "meal", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e5", topicId: 55, prompt: "Which sentence uses a linking verb?", options: ["She ran a marathon.", "The cake smells wonderful.", "He threw the ball.", "They finished early.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_e6", topicId: 55, prompt: "Choose the correct verb tense: 'By next year, she ___ here for ten years.'", options: ["works", "worked", "will have worked", "is working", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e7", topicId: 55, prompt: "Which sentence correctly uses subject-verb agreement?", options: ["The dogs barks loudly.", "The dog bark loudly.", "The dogs bark loudly.", "The dogs are barks.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e8", topicId: 55, prompt: "What is the past participle of 'break'?", options: ["broke", "breaked", "broken", "breaking", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e9", topicId: 55, prompt: "Which sentence uses the past perfect tense?", options: ["She eats lunch.", "She had eaten lunch before the meeting.", "She will eat lunch.", "She is eating lunch.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_e10", topicId: 55, prompt: "Which modal verb expresses ability?", options: ["should", "must", "can", "might", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e11", topicId: 55, prompt: "In 'She had already left when I arrived', which event happened first?", options: ["I arrived", "She left", "Both at the same time", "Neither is clear", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_e12", topicId: 55, prompt: "Which sentence uses the correct form of 'lie' and 'lay'?", options: ["Please lay down and rest.", "The book lays on the table.", "He laid the book on the table.", "She lied down yesterday.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_55_e13", topicId: 55, prompt: "Which sentence is in the passive voice?", options: ["The chef cooked the meal.", "The meal was cooked by the chef.", "She is cooking the meal.", "He cooked brilliantly.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_e14", topicId: 55, prompt: "Which group contains only irregular past tense verbs?", options: ["walked, jumped, played", "ran, swam, wrote", "talked, smiled, shouted", "danced, climbed, painted", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_55_e15", topicId: 55, prompt: "Select the sentence that correctly uses the present perfect tense.", options: ["She went to Paris twice.", "She has been to Paris twice.", "She is going to Paris twice.", "She goes to Paris twice.", "I don't know / Wasn't taught"], correctIndex: 1),
    ],

    // Topic 56: Adjectives and Adverbs
    56: [
        MathExamQuestion(id: "eng_56_e1", topicId: 56, prompt: "Which word is an adjective in: 'The excited children ran into the playground'?", options: ["children", "ran", "excited", "into", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e2", topicId: 56, prompt: "Which word is an adverb in: 'She answered every question correctly'?", options: ["She", "answered", "question", "correctly", "I don't know / Wasn't taught"], correctIndex: 3),
        MathExamQuestion(id: "eng_56_e3", topicId: 56, prompt: "Which is the correct superlative form of 'good'?", options: ["gooder", "more good", "best", "goodest", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e4", topicId: 56, prompt: "Which sentence uses a comparative adjective correctly?", options: ["This is the tallest building in the city.", "This building is more tall than that one.", "This building is taller than that one.", "This is tall building.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e5", topicId: 56, prompt: "Which adverb tells WHERE something happens?", options: ["soon", "quietly", "here", "often", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e6", topicId: 56, prompt: "In 'The extremely talented musician played beautifully', which word is an adverb modifying an adjective?", options: ["talented", "musician", "extremely", "beautifully", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e7", topicId: 56, prompt: "Which sentence uses an adjective clause?", options: ["She ran quickly.", "The book, which I borrowed last week, is excellent.", "He spoke loudly.", "They arrived early.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_e8", topicId: 56, prompt: "Which adverb is an intensifier (it makes another adverb or adjective stronger)?", options: ["slowly", "never", "very", "soon", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e9", topicId: 56, prompt: "What is the correct order of adjectives in English?", options: ["colour, size, opinion", "opinion, size, colour", "size, colour, opinion", "opinion, number, colour", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_e10", topicId: 56, prompt: "Which sentence correctly uses a predicate adjective?", options: ["The happy girl smiled.", "The sunset looked beautiful.", "She wore a red dress.", "A brilliant scientist worked.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_e11", topicId: 56, prompt: "Which sentence has a double negative (an error)?", options: ["She didn't find anything.", "She found nothing.", "She didn't find nothing.", "She found something.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e12", topicId: 56, prompt: "Which word correctly fills the blank: 'He drives more ___ than his sister.'?", options: ["careful", "carefully", "more careful", "most carefully", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_56_e13", topicId: 56, prompt: "Which adjective describes NUMBER?", options: ["smooth", "purple", "several", "enormous", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e14", topicId: 56, prompt: "Which sentence uses 'well' correctly (as an adverb)?", options: ["She feels good about the test.", "She did good on the test.", "She did well on the test.", "She is good at singing good.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_56_e15", topicId: 56, prompt: "Which word is a participial adjective in: 'The broken window let in the cold'?", options: ["window", "let", "cold", "broken", "I don't know / Wasn't taught"], correctIndex: 3),
    ],

    // Topic 57: Punctuation
    57: [
        MathExamQuestion(id: "eng_57_e1", topicId: 57, prompt: "Which sentence is correctly punctuated?", options: ["She went to the shops she bought milk.", "She went to the shops, and she bought milk.", "She went to the shops and, she bought milk.", "She, went to the shops and she bought milk.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e2", topicId: 57, prompt: "Which sentence uses a semicolon correctly?", options: ["I love reading; and I read every day.", "I love reading; I read every day.", "I love reading, I; read every day.", "I; love reading every day.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e3", topicId: 57, prompt: "Which sentence uses a colon correctly?", options: ["She needed: to go to the shop.", "She needed three things: bread, milk, and eggs.", "She: needed bread, milk, and eggs.", "She needed bread: milk and eggs.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e4", topicId: 57, prompt: "Which sentence uses an apostrophe for possession correctly?", options: ["The childrens' toys were everywhere.", "The children's toys were everywhere.", "The childrens toys were everywhere.", "The childs' toys were everywhere.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e5", topicId: 57, prompt: "Where should a comma be placed in this sentence: 'After finishing her homework she went outside to play'?", options: ["After 'outside'", "After 'homework'", "After 'she'", "After 'went'", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e6", topicId: 57, prompt: "Which sentence uses quotation marks correctly?", options: ["She said, \"I love reading.\"", "She said, I love reading.", "\"She said, I love reading\".", "She said \"I love\" reading.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e7", topicId: 57, prompt: "Which sentence correctly uses a comma before a coordinating conjunction?", options: ["She was tired, but she kept working.", "She was tired but, she kept working.", "She was, tired but she kept working.", "She was tired but she, kept working.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e8", topicId: 57, prompt: "Which option correctly punctuates the title of a short story?", options: ["The Gift", "the gift", "\"The Gift\"", "THE GIFT", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_57_e9", topicId: 57, prompt: "Which sentence uses an em dash correctly?", options: ["She grabbed her bag — and ran.", "She grabbed, her bag and ran.", "She; grabbed her bag and ran.", "She grabbed her: bag and ran.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e10", topicId: 57, prompt: "Which sentence contains a parenthetical phrase correctly punctuated?", options: ["My dog (a golden retriever) loves swimming.", "My dog, a golden retriever loves swimming.", "My dog a golden retriever, loves swimming.", "My dog a golden retriever loves swimming.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e11", topicId: 57, prompt: "Which sentence shows correct use of an ellipsis?", options: ["She paused... and then whispered the answer.", "She paused......and then whispered.", "She... paused and then whispered.", "She paused and then... whispered.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e12", topicId: 57, prompt: "In which case do you NOT use a capital letter?", options: ["At the start of a sentence", "For the pronoun 'I'", "For proper nouns", "For common nouns like 'dog' or 'table'", "I don't know / Wasn't taught"], correctIndex: 3),
        MathExamQuestion(id: "eng_57_e13", topicId: 57, prompt: "Which sentence uses a hyphen correctly?", options: ["She is a well-known author.", "She is a well known author.", "She is a well — known author.", "She is a well: known author.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_57_e14", topicId: 57, prompt: "Which sentence correctly punctuates a list of three items using the Oxford comma?", options: ["I bought apples, bananas and grapes.", "I bought apples, bananas, and grapes.", "I bought, apples bananas and grapes.", "I bought apples bananas, and grapes.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_57_e15", topicId: 57, prompt: "Which sentence is a correctly punctuated complex sentence?", options: ["Although it was raining we went outside.", "Although it was raining, we went outside.", "Although, it was raining we went outside.", "Although it was raining we, went outside.", "I don't know / Wasn't taught"], correctIndex: 1),
    ],

    // Topic 58: Reading Comprehension
    58: [
        MathExamQuestion(id: "eng_58_e1", topicId: 58, prompt: "Which of these is a text feature found in non-fiction books?", options: ["A plot twist", "A dialogue tag", "A bold heading", "A simile", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_e2", topicId: 58, prompt: "A reader uses context clues. What does this mean?", options: ["Skipping words they don't know", "Using surrounding text to figure out an unknown word's meaning", "Looking up every word in a dictionary", "Counting the sentences in a paragraph", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e3", topicId: 58, prompt: "Read: 'Maria's hands shook as she opened the envelope. She closed her eyes before looking.' What can you infer?", options: ["Maria is excited or nervous about the result.", "Maria is very tired.", "Maria does not want to open letters.", "Maria is angry.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_58_e4", topicId: 58, prompt: "What is the difference between a main idea and a theme?", options: ["They are exactly the same thing.", "A main idea is what a text is about; a theme is the deeper message or lesson.", "A theme is a factual statement; a main idea is an opinion.", "A main idea only applies to fiction.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e5", topicId: 58, prompt: "Which strategy best helps a reader understand a complex paragraph?", options: ["Read only the first sentence.", "Re-read the paragraph and summarise each sentence.", "Skip to the next paragraph.", "Count the number of words.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e6", topicId: 58, prompt: "The author's tone is described as 'sarcastic'. What does this mean?", options: ["The author is very happy and excited.", "The author uses mockery or irony to say the opposite of what they mean.", "The author is presenting neutral facts.", "The author is telling a personal story.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e7", topicId: 58, prompt: "Read: 'The documentary explained how coral reefs are formed and why they are essential to marine ecosystems.' What is the author's purpose?", options: ["To entertain with a funny story", "To persuade readers to visit coral reefs", "To inform readers about coral reefs", "To describe the colour of coral", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_e8", topicId: 58, prompt: "Which question is a literal comprehension question (answered directly in the text)?", options: ["What might happen next?", "How does this connect to your own life?", "What time does the story take place, according to the text?", "What is the hidden message of the story?", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_e9", topicId: 58, prompt: "What is the purpose of a topic sentence in a paragraph?", options: ["To give an example", "To state the main idea of that paragraph", "To close the paragraph", "To list supporting details", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e10", topicId: 58, prompt: "Read: 'Forests cover about 31% of Earth's land area. They are home to more than 80% of land animals. Without forests, many species would face extinction.' What is the central idea?", options: ["Forests are very old.", "Forests are critically important to life on Earth.", "Animals live in many places.", "Forests cover a large area.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e11", topicId: 58, prompt: "When a reader visualises while reading, they are...", options: ["Counting the paragraphs", "Making mental images of what the text describes", "Re-reading aloud", "Skimming for key words", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e12", topicId: 58, prompt: "What does 'point of view' tell you in a fiction text?", options: ["The genre of the book", "Who is telling the story and how they experience events", "The length of the chapters", "The setting of the story", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_58_e13", topicId: 58, prompt: "A student reads a persuasive text and identifies 'loaded language'. What have they found?", options: ["Neutral, balanced facts", "Technical vocabulary", "Emotionally charged words designed to influence the reader", "A list of statistics", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_e14", topicId: 58, prompt: "What is the purpose of a concluding sentence in a paragraph?", options: ["To introduce the topic", "To give the most important detail", "To wrap up the paragraph's idea and link to the next", "To list examples", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_58_e15", topicId: 58, prompt: "Which reading strategy involves asking: 'What do I already know about this topic before I start reading'?", options: ["Summarising", "Visualising", "Activating prior knowledge", "Making inferences", "I don't know / Wasn't taught"], correctIndex: 2),
    ],

    // Topic 59: Writing Sentences
    59: [
        MathExamQuestion(id: "eng_59_e1", topicId: 59, prompt: "Which of these is a complete sentence?", options: ["Running through the forest.", "The ancient, mossy oak.", "The ancient oak stood silently.", "Because it was very dark.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e2", topicId: 59, prompt: "Which is a sentence fragment?", options: ["She wrote a long letter.", "The lightning flashed.", "After the storm finally passed.", "He finished first.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e3", topicId: 59, prompt: "Which revision correctly fixes this fragment: 'Although she was exhausted.'?", options: ["Although she was exhausted, she finished the race.", "Although. She was exhausted.", "She was, although exhausted.", "Although exhausted she was.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_59_e4", topicId: 59, prompt: "Which sentence is a run-on?", options: ["The wind blew and the rain fell.", "It was cold; we stayed inside.", "I was late I missed the bus I had to walk.", "Although tired, she continued.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e5", topicId: 59, prompt: "Which revision best fixes the run-on: 'She was nervous she kept practising she improved'?", options: ["She was nervous, so she kept practising, and she improved.", "She was nervous she kept practising, she improved.", "She, nervous, kept practising, improved.", "Nervous she kept practising improving.", "I don't know / Wasn't taught"], correctIndex: 0),
        MathExamQuestion(id: "eng_59_e6", topicId: 59, prompt: "Which sentence uses the most precise and vivid language?", options: ["The thing moved.", "The animal was big.", "The sleek cheetah sprinted across the golden savanna.", "It went fast.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e7", topicId: 59, prompt: "Which sentence uses correct subject-verb agreement?", options: ["The group of students are noisy.", "Neither the teacher nor the students is ready.", "Each of the players has their own locker.", "The team are winning.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e8", topicId: 59, prompt: "Which sentence has a misplaced modifier?", options: ["She quickly finished her homework.", "Running to catch the bus, her bag fell open.", "The dog, which was brown, barked loudly.", "He painted the fence carefully.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_e9", topicId: 59, prompt: "Which sentence demonstrates parallel structure?", options: ["She likes running, to swim, and cycling.", "She likes to run, to swim, and to cycle.", "She likes running, swimming, and to cycle.", "She likes to run, swimming, and cycle.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_e10", topicId: 59, prompt: "Which sentence best opens a descriptive paragraph about a thunderstorm?", options: ["There was a storm.", "It rained.", "The sky darkened and thunder rumbled as the first fat drops of rain began to fall.", "A storm happened last night.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e11", topicId: 59, prompt: "What is the term for using a variety of sentence lengths and structures to improve writing flow?", options: ["Repetition", "Sentence variety", "Sentence fragments", "Run-on sentences", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_e12", topicId: 59, prompt: "Which sentence correctly uses a subordinating conjunction?", options: ["Because. She left early.", "She left early because she felt ill.", "She felt ill but because she left.", "Because she left early, it was fine.", "I don't know / Wasn't taught"], correctIndex: 1),
        MathExamQuestion(id: "eng_59_e13", topicId: 59, prompt: "Which transition word best introduces a contrasting idea?", options: ["Furthermore", "Similarly", "However", "Therefore", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e14", topicId: 59, prompt: "A student writes: 'The girl went to the shop. The girl bought apples. The girl went home.' What is the BEST way to improve this?", options: ["Remove the middle sentence.", "Keep it as is — short sentences are best.", "Combine the sentences: 'The girl went to the shop, bought apples, and went home.'", "Add more sentences to make it longer.", "I don't know / Wasn't taught"], correctIndex: 2),
        MathExamQuestion(id: "eng_59_e15", topicId: 59, prompt: "Which technique best helps a writer check that their sentences are clear and varied?", options: ["Count the number of adjectives used", "Read the writing aloud and listen for awkward or repetitive patterns", "Make every sentence exactly ten words long", "Use the same sentence structure throughout", "I don't know / Wasn't taught"], correctIndex: 1),
    ],
    ]
}
