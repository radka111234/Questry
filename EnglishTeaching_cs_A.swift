import Foundation

// MARK: - English Teaching Pack: Czech (Topics 1-18)

let csTeachingTopicsA: [(id: Int, title: String, intro: String, example: String)] = [
    (1, "Anglická Abeceda", "Nauč se 26 písmen anglické abecedy a jejich výslovnost.", "Písmeno 'A' zní jako v 'apple' (jablko)."),
    (2, "Krátké Samohlásky", "Procvič si krátké samohlásky v anglických slovech typu souhláska–samohláska–souhláska.", "Slovo 'cat' má krátkou samohlásku 'a'."),
    (3, "Nejčastější Slova", "Nauč se nejčastěji používaná anglická slova, která musíš znát.", "Slovo 'the' je nejčastější slovo v angličtině."),
    (4, "Jednoduché Věty", "Nauč se stavět jednoduché anglické věty se strukturou podmět + sloveso + předmět.", "Věta 'The cat drinks milk.' má podmět 'cat', sloveso 'drinks' a předmět 'milk'."),
    (5, "Rýmy a Slovní Rodiny", "Prozkoumej anglická rýmující se slova a slovní rodiny se stejnými koncovkami.", "Slova 'cat', 'bat', 'hat' patří do slovní rodiny '-at'."),
    (6, "Dlouhé Samohlásky", "Nauč se dlouhé samohlásky a pravidlo němého 'e' v angličtině.", "Slovo 'cake' má dlouhou samohlásku 'a' díky němému 'e' na konci."),
    (7, "Souhláskové Skupiny", "Procvič si souhláskové skupiny (bl, br, tr, st) a digrafiky (sh, ch, th) v angličtině.", "Slovo 'ship' začíná digrafem 'sh', který zní jako jedno písmeno."),
    (8, "Podstatná a Slovesa", "Nauč se rozdíl mezi anglickými podstatnými jmény a slovesy.", "Slovo 'dog' je podstatné jméno, slovo 'run' je sloveso."),
    (9, "Přídavná Jména a Příslovce", "Prozkoumej anglická přídavná jména (adjectives) a příslovce (adverbs).", "Slovo 'happy' je přídavné jméno, slovo 'happily' je příslovce."),
    (10, "Anglická Interpunkce", "Nauč se základní interpunkční znaménka v angličtině: tečka, čárka, otazník, vykřičník.", "Věta končící otazníkem '?' je vždy otázka."),
    (11, "Složená Slova", "Prozkoumej anglická složená slova a stažená slova (contractions).", "Slovo 'sunshine' je složené ze slov 'sun' + 'shine'. 'Don't' je stažení 'do not'."),
    (12, "Předpony a Přípony", "Nauč se anglické předpony (un-, re-) a přípony (-ing, -ed, -er, -ful, -less).", "Předpona 'un-' mění 'happy' na 'unhappy' (nešťastný)."),
    (13, "Synonyma a Antonyma", "Prozkoumej anglická synonyma (slova se stejným významem) a antonyma (slova s opačným významem).", "Synonymum pro 'happy' je 'glad'. Antonymum pro 'big' je 'small'."),
    (14, "Porozumění Textu", "Nauč se rozumět anglickému textu a odpovídat na otázky kdo, co, kde, kdy a proč.", "Hlavní myšlenka textu říká, o čem celý příběh nebo odstavec je."),
    (15, "Prvky Příběhu", "Prozkoumej základní stavební kameny anglického příběhu: postavy, prostředí, děj, problém a řešení.", "Postava (character) je osoba nebo zvíře v příběhu."),
    (16, "Druhy Vět", "Nauč se čtyři druhy anglických vět: oznamovací, tázací, zvolací a rozkazovací.", "Oznamovací věta (declarative) říká fakta a končí tečkou."),
    (17, "Anglické Homofony", "Prozkoumej anglická slova, která znějí stejně, ale mají různý pravopis a význam.", "'There', 'their' a 'they're' znějí stejně, ale mají různé významy."),
    (18, "Slovní Druhy", "Nauč se osm slovních druhů v angličtině: podstatné jméno, sloveso, přídavné jméno, příslovce, zájmeno, předložka, spojka, citoslovce.", "Zájmeno (pronoun) nahrazuje podstatné jméno, například 'he' místo 'John'.")
]

let csTeachingPracticeA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1  -  Anglická Abeceda
    1: [
        MathExamQuestion(id: "cs_teach_1_p1", topicId: 1, prompt: "Kolik písmen má anglická abeceda?", options: ["24", "25", "26", "28"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p2", topicId: 1, prompt: "Které z těchto písmen je samohláska v anglické abecedě?", options: ["B", "C", "E", "D"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p3", topicId: 1, prompt: "Kolik samohlásek obsahuje anglická abeceda?", options: ["4", "5", "6", "7"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_1_p4", topicId: 1, prompt: "Které písmeno přichází v anglické abecedě po 'M'?", options: ["L", "N", "O", "P"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_1_p5", topicId: 1, prompt: "Které písmeno v anglickém slově 'apple' je na prvním místě?", options: ["E", "P", "A", "L"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p6", topicId: 1, prompt: "Které z těchto písmen NENÍ samohláska v angličtině?", options: ["A", "E", "F", "I"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p7", topicId: 1, prompt: "Jaké je poslední písmeno anglické abecedy?", options: ["X", "Y", "Z", "W"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p8", topicId: 1, prompt: "Které písmeno přichází v anglické abecedě před 'G'?", options: ["E", "F", "H", "I"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_1_p9", topicId: 1, prompt: "Slovo 'ball' začíná kterým písmenem anglické abecedy?", options: ["D", "P", "B", "Q"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_1_p10", topicId: 1, prompt: "Která písmena jsou v angličtině samohlásky?", options: ["A, E, I, O, U", "A, B, C, D, E", "E, I, O, U, Y", "A, E, O, U, W"], correctIndex: 0)
    ],

    // MARK: Topic 2  -  Krátké Samohlásky
    2: [
        MathExamQuestion(id: "cs_teach_2_p1", topicId: 2, prompt: "Které slovo obsahuje krátkou samohlásku 'a'?", options: ["cake", "cat", "care", "came"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_2_p2", topicId: 2, prompt: "Jaká krátká samohláska je uprostřed slova 'dog'?", options: ["a", "e", "o", "u"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_2_p3", topicId: 2, prompt: "Které slovo obsahuje krátkou samohlásku 'i'?", options: ["bike", "site", "sit", "side"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_2_p4", topicId: 2, prompt: "Jaká je krátká samohláska ve slově 'cup'?", options: ["a", "o", "e", "u"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_2_p5", topicId: 2, prompt: "Které slovo má vzor CVC (souhláska–samohláska–souhláska)?", options: ["street", "cat", "play", "train"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_2_p6", topicId: 2, prompt: "Jaká krátká samohláska je ve slově 'hop'?", options: ["a", "u", "o", "i"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_2_p7", topicId: 2, prompt: "Které slovo obsahuje krátkou samohlásku 'e'?", options: ["feet", "bee", "bed", "beet"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_2_p8", topicId: 2, prompt: "Ve slově 'big' je krátká samohláska:", options: ["a", "i", "e", "o"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_2_p9", topicId: 2, prompt: "Které slovo NEMÁ krátkou samohlásku?", options: ["pit", "bat", "mud", "rain"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_2_p10", topicId: 2, prompt: "Jaká krátká samohláska je ve slově 'hen'?", options: ["a", "i", "e", "u"], correctIndex: 2)
    ],

    // MARK: Topic 3  -  Nejčastější Slova
    3: [
        MathExamQuestion(id: "cs_teach_3_p1", topicId: 3, prompt: "Jak se řekne 'a' (neurčitý člen) v angličtině?", options: ["the", "a / an", "is", "and"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_3_p2", topicId: 3, prompt: "Co znamená anglické slovo 'said'?", options: ["viděl", "řekl / řekla", "přišel", "měl"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_3_p3", topicId: 3, prompt: "Jak se řekne 'oni' v angličtině?", options: ["we", "you", "they", "she"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_3_p4", topicId: 3, prompt: "Co znamená anglické slovo 'have'?", options: ["mít", "být", "jít", "dát"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_3_p5", topicId: 3, prompt: "Které slovo znamená 'z' nebo 'od' v angličtině?", options: ["for", "with", "from", "by"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_3_p6", topicId: 3, prompt: "Co znamená anglické slovo 'was'?", options: ["bude", "je", "byl / byla", "jsou"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_3_p7", topicId: 3, prompt: "Jak se řekne 'ty' nebo 'vy' v angličtině?", options: ["I", "he", "you", "we"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_3_p8", topicId: 3, prompt: "Co znamená anglické slovo 'are'?", options: ["byl", "bude", "jste / jsou / jsi", "mít"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_3_p9", topicId: 3, prompt: "Které slovo je nejčastější slovo v anglickém jazyce?", options: ["is", "the", "a", "and"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_3_p10", topicId: 3, prompt: "Co znamená anglické slovo 'and'?", options: ["ale", "nebo", "a", "protože"], correctIndex: 2)
    ],

    // MARK: Topic 4  -  Jednoduché Věty
    4: [
        MathExamQuestion(id: "cs_teach_4_p1", topicId: 4, prompt: "Která z těchto vět má správnou anglickou strukturu podmět + sloveso + předmět?", options: ["Milk the drinks cat.", "The cat drinks milk.", "Drinks cat the milk.", "The milk cat drinks."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_4_p2", topicId: 4, prompt: "Co je podmět (subject) ve větě 'The dog runs fast.'?", options: ["runs", "fast", "The dog", "The dog runs"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_4_p3", topicId: 4, prompt: "Co je sloveso (verb) ve větě 'She eats an apple.'?", options: ["She", "eats", "an", "apple"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_4_p4", topicId: 4, prompt: "Která věta je v angličtině správně napsána?", options: ["i like cats.", "I like cats.", "I Like cats.", "i Like Cats."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_4_p5", topicId: 4, prompt: "Co je předmět (object) ve větě 'Tom reads a book.'?", options: ["Tom", "reads", "a book", "a"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_4_p6", topicId: 4, prompt: "Která věta je přeložena správně? 'Pes jí maso.'", options: ["The dog eat meat.", "The dog eats meat.", "Dog the eats meat.", "Eats the dog meat."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_4_p7", topicId: 4, prompt: "Anglická věta musí vždy začínat:", options: ["malým písmenem", "čárkou", "velkým písmenem", "tečkou"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_4_p8", topicId: 4, prompt: "Co je sloveso ve větě 'The birds sing a song.'?", options: ["birds", "sing", "song", "The"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_4_p9", topicId: 4, prompt: "Která z vět správně překládá 'Mám rád čokoládu.'?", options: ["I like chocolate.", "Like I chocolate.", "Chocolate I like.", "I chocolate like."], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_4_p10", topicId: 4, prompt: "Oznamovací věta v angličtině zpravidla končí:", options: ["otazníkem (?)", "vykřičníkem (!)", "tečkou (.)", "čárkou (,)"], correctIndex: 2)
    ],

    // MARK: Topic 5  -  Rýmy a Slovní Rodiny
    5: [
        MathExamQuestion(id: "cs_teach_5_p1", topicId: 5, prompt: "Které slovo rýmuje se slovem 'cat'?", options: ["cup", "bat", "bit", "cut"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_5_p2", topicId: 5, prompt: "Které slovo patří do slovní rodiny '-an'?", options: ["sun", "pin", "man", "fun"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_5_p3", topicId: 5, prompt: "Které slovo rýmuje se slovem 'dog'?", options: ["dig", "bag", "log", "dug"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_5_p4", topicId: 5, prompt: "Která slova tvoří slovní rodinu '-at'?", options: ["cat, bat, hat", "cat, cut, cot", "bat, bit, but", "hat, hit, hot"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_5_p5", topicId: 5, prompt: "Které slovo rýmuje se slovem 'run'?", options: ["ran", "rin", "sun", "sin"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_5_p6", topicId: 5, prompt: "Které slovo NERÝMUJE se slovem 'big'?", options: ["dig", "wig", "pig", "bag"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_5_p7", topicId: 5, prompt: "Které slovo patří do slovní rodiny '-op'?", options: ["cup", "cap", "hop", "hip"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_5_p8", topicId: 5, prompt: "Co mají společného slova v jedné slovní rodině?", options: ["Začínají stejným písmenem", "Mají stejnou koncovku", "Mají stejný počet písmen", "Jsou to slovesa"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_5_p9", topicId: 5, prompt: "Které slovo rýmuje se slovem 'cake'?", options: ["back", "lake", "luck", "kick"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_5_p10", topicId: 5, prompt: "Které slovo patří do slovní rodiny '-en'?", options: ["bin", "hen", "ban", "bun"], correctIndex: 1)
    ],

    // MARK: Topic 6  -  Dlouhé Samohlásky
    6: [
        MathExamQuestion(id: "cs_teach_6_p1", topicId: 6, prompt: "Které slovo obsahuje dlouhou samohlásku díky pravidlu němého 'e'?", options: ["cap", "cat", "cake", "can"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_6_p2", topicId: 6, prompt: "Co způsobuje němé 'e' na konci anglického slova?", options: ["Prodlouží předchozí samohlásku", "Zkrátí předchozí samohlásku", "Přidá novou slabiku", "Nic nemění"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_6_p3", topicId: 6, prompt: "Které slovo obsahuje dlouhou samohlásku 'i'?", options: ["bit", "hit", "sit", "bike"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_6_p4", topicId: 6, prompt: "Jaký je rozdíl mezi 'hop' a 'hope'?", options: ["Stejný význam", "'Hope' má dlouhé 'o' díky němému 'e'", "'Hop' má dlouhé 'o'", "Jsou to synonyma"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_6_p5", topicId: 6, prompt: "Které slovo obsahuje dlouhou samohlásku 'u'?", options: ["cup", "cut", "cub", "cute"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_6_p6", topicId: 6, prompt: "Které slovo obsahuje dlouhou samohlásku 'a'?", options: ["man", "made", "mad", "map"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_6_p7", topicId: 6, prompt: "Přidej němé 'e' ke slovu 'pin'. Co dostaneš?", options: ["pinn", "pine", "pean", "piene"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_6_p8", topicId: 6, prompt: "Které slovo obsahuje dlouhou samohlásku 'e'?", options: ["bed", "red", "these", "wet"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_6_p9", topicId: 6, prompt: "Co se stane se slovem 'kit', když přidáš němé 'e'?", options: ["Vznikne 'kite' s dlouhým 'i'", "Vznikne 'keet' s dlouhým 'e'", "Vznikne 'kate' s dlouhým 'a'", "Nic se nestane"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_6_p10", topicId: 6, prompt: "Které slovo NEOBSAHUJE dlouhou samohlásku?", options: ["lake", "time", "hope", "hot"], correctIndex: 3)
    ],

    // MARK: Topic 7  -  Souhláskové Skupiny
    7: [
        MathExamQuestion(id: "cs_teach_7_p1", topicId: 7, prompt: "Jaký digraf (digraph) začíná slovo 'ship'?", options: ["sp", "sh", "sl", "sc"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_7_p2", topicId: 7, prompt: "Které slovo začíná souhláskovou skupinou 'bl'?", options: ["black", "slack", "clack", "flack"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_7_p3", topicId: 7, prompt: "Digraf 'ch' ve slově 'chair' zní jako:", options: ["k", "š", "č", "s"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_7_p4", topicId: 7, prompt: "Které slovo začíná souhláskovou skupinou 'tr'?", options: ["star", "tree", "three", "street"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_7_p5", topicId: 7, prompt: "Digraf 'th' se vyskytuje ve slově:", options: ["ship", "shop", "this", "chip"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_7_p6", topicId: 7, prompt: "Které slovo obsahuje souhláskovou skupinu 'st'?", options: ["shop", "stop", "chop", "drop"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_7_p7", topicId: 7, prompt: "Co je digraf (digraph)?", options: ["Jedno písmeno s dvěma zvuky", "Dvě písmena, která tvoří jeden zvuk", "Tři písmena dohromady", "Samohláska na konci slova"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_7_p8", topicId: 7, prompt: "Které slovo začíná skupinou 'sp'?", options: ["slip", "trip", "spin", "chin"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_7_p9", topicId: 7, prompt: "Digraf 'ph' zní jako:", options: ["p", "f", "b", "v"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_7_p10", topicId: 7, prompt: "Které slovo začíná digrafem 'wh'?", options: ["who", "we", "well", "wide"], correctIndex: 0)
    ],

    // MARK: Topic 8  -  Podstatná a Slovesa
    8: [
        MathExamQuestion(id: "cs_teach_8_p1", topicId: 8, prompt: "Které anglické slovo je podstatné jméno (noun)?", options: ["run", "happy", "dog", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p2", topicId: 8, prompt: "Které anglické slovo je sloveso (verb)?", options: ["book", "table", "jump", "big"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p3", topicId: 8, prompt: "Co popisuje podstatné jméno (noun) v angličtině?", options: ["Činnost nebo stav", "Osobu, místo nebo věc", "Vlastnost osoby nebo věci", "Jak probíhá děj"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_8_p4", topicId: 8, prompt: "Které slovo je sloveso ve větě 'The bird sings a song.'?", options: ["bird", "sings", "song", "The"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_8_p5", topicId: 8, prompt: "Které slovo je podstatné jméno ve větě 'She reads a book.'?", options: ["She", "reads", "book", "a"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p6", topicId: 8, prompt: "Které z těchto slov je sloveso?", options: ["apple", "school", "swim", "flower"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p7", topicId: 8, prompt: "Jaký je správný plurál podstatného jména 'child' v angličtině?", options: ["childs", "childes", "children", "child's"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p8", topicId: 8, prompt: "Které z těchto slov je podstatné jméno?", options: ["eat", "run", "city", "sleep"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p9", topicId: 8, prompt: "Co vyjadřuje sloveso (verb) v anglické větě?", options: ["Osobu nebo věc", "Místo nebo čas", "Děj nebo stav", "Vlastnost nebo množství"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_8_p10", topicId: 8, prompt: "Které slovo je sloveso?", options: ["tree", "sky", "dance", "pencil"], correctIndex: 2)
    ],

    // MARK: Topic 9  -  Přídavná Jména a Příslovce
    9: [
        MathExamQuestion(id: "cs_teach_9_p1", topicId: 9, prompt: "Které z těchto slov je přídavné jméno (adjective) v angličtině?", options: ["run", "quickly", "beautiful", "sing"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_9_p2", topicId: 9, prompt: "Co popisuje přídavné jméno (adjective) v angličtině?", options: ["Sloveso", "Podstatné jméno nebo zájmeno", "Jiné příslovce", "Celou větu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_9_p3", topicId: 9, prompt: "Jak obvykle tvoříme příslovce (adverb) z přídavného jména v angličtině?", options: ["Přidáme '-er'", "Přidáme '-ly'", "Přidáme '-ing'", "Přidáme '-ed'"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_9_p4", topicId: 9, prompt: "Které slovo je příslovce (adverb)?", options: ["slow", "slowly", "slower", "slowest"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_9_p5", topicId: 9, prompt: "Ve větě 'She sings beautifully.' je 'beautifully':", options: ["přídavné jméno", "podstatné jméno", "příslovce", "sloveso"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_9_p6", topicId: 9, prompt: "Které přídavné jméno popisuje velikost?", options: ["quickly", "big", "sadly", "run"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_9_p7", topicId: 9, prompt: "Ve větě 'The big dog runs fast.' je 'big':", options: ["příslovce", "sloveso", "přídavné jméno", "zájmeno"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_9_p8", topicId: 9, prompt: "Které slovo je přídavné jméno?", options: ["happily", "run", "happy", "happiness"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_9_p9", topicId: 9, prompt: "Příslovce (adverb) v angličtině nejčastěji popisuje:", options: ["podstatné jméno", "sloveso, přídavné jméno nebo jiné příslovce", "předložku", "členy"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_9_p10", topicId: 9, prompt: "Které slovo je příslovce?", options: ["sad", "sadness", "sadly", "sadder"], correctIndex: 2)
    ],

    // MARK: Topic 10  -  Anglická Interpunkce
    10: [
        MathExamQuestion(id: "cs_teach_10_p1", topicId: 10, prompt: "Jaký interpunkční znaménko se dává na konec tázací věty v angličtině?", options: ["Tečka (.)", "Čárka (,)", "Vykřičník (!)", "Otazník (?)"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_10_p2", topicId: 10, prompt: "Jaký znaménko patří na konec oznamovací věty?", options: ["Otazník (?)", "Tečka (.)", "Vykřičník (!)", "Středník (;)"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_10_p3", topicId: 10, prompt: "Kdy se v angličtině používá vykřičník (!)?", options: ["Na konci každé věty", "Na konci otázky", "Pro vyjádření silné emoce nebo zvolání", "Před jménem osoby"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_10_p4", topicId: 10, prompt: "Čárka (,) v angličtině se používá:", options: ["Na konci věty", "K oddělení slov v seznamu", "Na začátku věty", "Místo tečky"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_10_p5", topicId: 10, prompt: "Která věta má správnou interpunkci?", options: ["What is your name.", "What is your name!", "What is your name?", "What is your name,"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_10_p6", topicId: 10, prompt: "Která věta má správnou interpunkci?", options: ["I love pizza?", "I love pizza.", "I love pizza,", "i love pizza."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_10_p7", topicId: 10, prompt: "Ke čemu slouží uvozovky (\") v anglickém textu?", options: ["K ukončení věty", "K označení přímé řeči nebo citátu", "K vyjádření otázky", "K oddělení dvou vět"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_10_p8", topicId: 10, prompt: "Která věta je zvolací (exclamatory) a má správnou interpunkci?", options: ["Watch out.", "Watch out?", "Watch out!", "watch out!"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_10_p9", topicId: 10, prompt: "Jakou interpunkci dáme za jméno při oslovení? Např. 'Hello, Tom___'", options: ["Tečku (.)", "Čárku (,)", "Otazník (?)", "Nic"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_10_p10", topicId: 10, prompt: "Která možnost správně uvádí tři základní interpunkční znaménka na konci věty?", options: ["Tečka, čárka, otazník", "Tečka, otazník, vykřičník", "Čárka, otazník, uvozovky", "Tečka, středník, závorka"], correctIndex: 1)
    ],

    // MARK: Topic 11  -  Složená Slova
    11: [
        MathExamQuestion(id: "cs_teach_11_p1", topicId: 11, prompt: "Které slovo je složené slovo (compound word)?", options: ["beautiful", "sunshine", "quickly", "running"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_11_p2", topicId: 11, prompt: "Z jakých dvou slov se skládá 'football'?", options: ["foot + ball", "foo + tball", "f + ootball", "fo + otball"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_11_p3", topicId: 11, prompt: "Co je stažené slovo (contraction) 'don't' zkratkou?", options: ["do not", "does not", "did not", "done not"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_11_p4", topicId: 11, prompt: "Co znamená apostrof (') ve stažených slovech jako 'can't'?", options: ["Přidává nové písmeno", "Nahrazuje vynechaná písmena", "Ukazuje množné číslo", "Označuje přivlastnění"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_11_p5", topicId: 11, prompt: "Stažené slovo 'I'm' je zkratkou pro:", options: ["I am", "I might", "I move", "I miss"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_11_p6", topicId: 11, prompt: "Které z těchto slov je složené slovo?", options: ["happy", "rainbow", "slowly", "children"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_11_p7", topicId: 11, prompt: "Co je zkratkou stažené slovo 'can't'?", options: ["can not", "cannot", "Obě odpovědi jsou správné", "could not"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_11_p8", topicId: 11, prompt: "Z jakých dvou slov se skládá složené slovo 'bedroom'?", options: ["bed + room", "be + droom", "bedr + oom", "b + edroom"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_11_p9", topicId: 11, prompt: "Stažené slovo 'they're' je zkratkou pro:", options: ["they are", "they were", "they have", "they run"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_11_p10", topicId: 11, prompt: "Které složené slovo znamená 'světlo slunce'?", options: ["moonlight", "sunshine", "starlight", "daybreak"], correctIndex: 1)
    ],

    // MARK: Topic 12  -  Předpony a Přípony
    12: [
        MathExamQuestion(id: "cs_teach_12_p1", topicId: 12, prompt: "Co znamená předpona 'un-' v angličtině?", options: ["Znovu", "Opak / negace", "Hodně", "Před"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p2", topicId: 12, prompt: "Co vznikne, když přidáš předponu 're-' ke slovu 'write'?", options: ["Unwrite", "Rewrite (napsat znovu)", "Writing", "Writer"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p3", topicId: 12, prompt: "Přípona '-ing' přidaná ke slovesu tvoří:", options: ["Množné číslo", "Minulý čas", "Průběhový tvar slovesa", "Přídavné jméno"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_12_p4", topicId: 12, prompt: "Co znamená přípona '-ful' ve slově 'helpful'?", options: ["Bez", "Plný něčeho / mající vlastnost", "Znovu", "Více"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p5", topicId: 12, prompt: "Co tvoří přípona '-less' ve slově 'hopeless'?", options: ["Zvětšení vlastnosti", "Opak / absence vlastnosti", "Průběhový tvar", "Množné číslo"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p6", topicId: 12, prompt: "Jaký tvar vznikne ze slova 'happy' přidáním přípony '-er'?", options: ["happily", "happiest", "happier", "happiness"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_12_p7", topicId: 12, prompt: "Předpona 'un-' ve slově 'unhappy' znamená:", options: ["Velmi šťastný", "Nešťastný", "Šťastnější", "Šťastnější než"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p8", topicId: 12, prompt: "Přípona '-ed' přidaná ke slovesu tvoří:", options: ["Přítomný čas", "Minulý čas", "Přídavné jméno", "Příslovce"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p9", topicId: 12, prompt: "Které slovo obsahuje příponu '-est'?", options: ["faster", "fastest", "fast", "fastly"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_12_p10", topicId: 12, prompt: "Co je předpona (prefix) v angličtině?", options: ["Část slova přidaná na konec", "Část slova přidaná na začátek", "Kořen slova", "Celé slovo"], correctIndex: 1)
    ],

    // MARK: Topic 13  -  Synonyma a Antonyma
    13: [
        MathExamQuestion(id: "cs_teach_13_p1", topicId: 13, prompt: "Co jsou synonyma (synonyms) v angličtině?", options: ["Slova s opačným významem", "Slova se stejným nebo podobným významem", "Slova, která se rýmují", "Slova ze stejné slovní rodiny"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_13_p2", topicId: 13, prompt: "Které slovo je synonymum pro 'happy' (šťastný)?", options: ["sad", "angry", "glad", "tired"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_13_p3", topicId: 13, prompt: "Co jsou antonyma (antonyms) v angličtině?", options: ["Slova se stejným významem", "Slova s opačným významem", "Slova se stejnou výslovností", "Složená slova"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_13_p4", topicId: 13, prompt: "Které slovo je antonymum pro 'big' (velký)?", options: ["large", "huge", "giant", "small"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_13_p5", topicId: 13, prompt: "Které slovo je synonymum pro 'fast' (rychlý)?", options: ["slow", "quick", "tired", "quiet"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_13_p6", topicId: 13, prompt: "Které slovo je antonymum pro 'hot' (horký)?", options: ["warm", "cool", "cold", "freezing"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_13_p7", topicId: 13, prompt: "Které slovo je synonymum pro 'begin' (začít)?", options: ["end", "finish", "start", "stop"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_13_p8", topicId: 13, prompt: "Které slovo je antonymum pro 'day' (den)?", options: ["morning", "afternoon", "evening", "night"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_13_p9", topicId: 13, prompt: "Které slovo je synonymum pro 'angry' (naštvaný)?", options: ["happy", "sad", "mad", "calm"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_13_p10", topicId: 13, prompt: "Které slovo je antonymum pro 'up' (nahoru)?", options: ["high", "above", "down", "over"], correctIndex: 2)
    ],

    // MARK: Topic 14  -  Porozumění Textu
    14: [
        MathExamQuestion(id: "cs_teach_14_p1", topicId: 14, prompt: "Co je 'hlavní myšlenka' (main idea) anglického textu?", options: ["Nejzajímavější věta v textu", "To, o čem celý text nebo odstavec pojednává", "Poslední věta odstavce", "Jméno postavy"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_14_p2", topicId: 14, prompt: "Otázka 'Who?' (Kdo?) v porozumění textu se ptá na:", options: ["Místo", "Čas", "Osobu nebo postavu", "Příčinu"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_14_p3", topicId: 14, prompt: "Otázka 'Where?' (Kde?) se ptá na:", options: ["Osobu", "Místo", "Čas", "Způsob"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_14_p4", topicId: 14, prompt: "Otázka 'When?' (Kdy?) se ptá na:", options: ["Příčinu", "Osobu", "Místo", "Čas"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_14_p5", topicId: 14, prompt: "Otázka 'Why?' (Proč?) se ptá na:", options: ["Místo", "Osobu", "Příčinu nebo důvod", "Čas"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_14_p6", topicId: 14, prompt: "Co jsou 'podpůrné detaily' (supporting details) v textu?", options: ["Nadpisy odstavců", "Fakta nebo příklady, které rozvíjejí hlavní myšlenku", "Poslední věta textu", "Jména postav"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_14_p7", topicId: 14, prompt: "Otázka 'What?' (Co?) se ptá na:", options: ["Čas", "Osobu", "Věc nebo děj", "Příčinu"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_14_p8", topicId: 14, prompt: "Co znamená 'inference' (dedukce) při čtení textu?", options: ["Doslova přeložit text", "Vyvodit závěr z indicií v textu", "Přečíst text nahlas", "Napsat shrnutí textu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_14_p9", topicId: 14, prompt: "Kde nejčastěji najdeme hlavní myšlenku odstavce?", options: ["Vždy na konci", "Vždy uprostřed", "Obvykle na začátku v tzv. tematické větě", "Nikdy v odstavci není"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_14_p10", topicId: 14, prompt: "Co je 'shrnutí' (summary) textu?", options: ["Doslova zapsaný text", "Stručný přehled hlavních myšlenek textu", "Překlad textu do jiného jazyka", "Seznam neznámých slov"], correctIndex: 1)
    ],

    // MARK: Topic 15  -  Prvky Příběhu
    15: [
        MathExamQuestion(id: "cs_teach_15_p1", topicId: 15, prompt: "Co je 'postava' (character) v příběhu?", options: ["Místo, kde se příběh odehrává", "Osoba nebo zvíře v příběhu", "Problém, který je třeba vyřešit", "Konec příběhu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p2", topicId: 15, prompt: "Co je 'prostředí' (setting) v příběhu?", options: ["Hlavní postava", "Místo a čas, kde se příběh odehrává", "Problém příběhu", "Poučení příběhu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p3", topicId: 15, prompt: "Co je 'děj' (plot) příběhu?", options: ["Popis postav", "Sled událostí v příběhu", "Místo příběhu", "Jméno autora"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p4", topicId: 15, prompt: "Co je 'problém' (problem) v příběhu?", options: ["Šťastný konec", "Výzva nebo konflikt, se kterým se postava potýká", "Popis prostředí", "Úvod příběhu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p5", topicId: 15, prompt: "Co je 'řešení' (solution) v příběhu?", options: ["Začátek příběhu", "Jak je problém vyřešen", "Popis postavy", "Prostředí příběhu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p6", topicId: 15, prompt: "Kdo je 'hlavní postava' (main character) příběhu?", options: ["Autor příběhu", "Postava, o které příběh nejvíce pojednává", "Každá postava v příběhu", "Postava, která se objeví jako první"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p7", topicId: 15, prompt: "Jak se nazývá poučení nebo zpráva příběhu v angličtině?", options: ["plot", "setting", "theme / moral", "character"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_15_p8", topicId: 15, prompt: "Jak se anglicky řekne 'začátek' příběhu?", options: ["middle", "end", "beginning", "climax"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_15_p9", topicId: 15, prompt: "Co je 'vyvrcholení' (climax) příběhu?", options: ["Klidný začátek příběhu", "Nejnapínavější nebo nejdůležitější část příběhu", "Konec příběhu", "Popis prostředí"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_15_p10", topicId: 15, prompt: "Kolik základních prvků (elements) má příběh?", options: ["2", "3", "4", "5"], correctIndex: 3)
    ],

    // MARK: Topic 16  -  Druhy Vět
    16: [
        MathExamQuestion(id: "cs_teach_16_p1", topicId: 16, prompt: "Jak se nazývá oznamovací věta v angličtině?", options: ["Interrogative", "Exclamatory", "Declarative", "Imperative"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p2", topicId: 16, prompt: "Jak se nazývá tázací věta v angličtině?", options: ["Declarative", "Interrogative", "Exclamatory", "Imperative"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_16_p3", topicId: 16, prompt: "Která věta je rozkazovací (imperative)?", options: ["I like apples.", "Do you like apples?", "Eat your apples!", "I love apples!"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p4", topicId: 16, prompt: "Která věta je zvolací (exclamatory)?", options: ["The sky is blue.", "Is the sky blue?", "Look at the sky!", "Look at the sky."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p5", topicId: 16, prompt: "Která věta je oznamovací (declarative)?", options: ["Run fast!", "Can you run?", "The cat is sleeping.", "Stop running!"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p6", topicId: 16, prompt: "Která věta je tázací (interrogative)?", options: ["The dog barks.", "The dog is barking!", "Does the dog bark?", "Bark, dog!"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p7", topicId: 16, prompt: "Oznamovací věta (declarative) vždy končí:", options: ["Vykřičníkem (!)", "Otazníkem (?)", "Tečkou (.)", "Čárkou (,)"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p8", topicId: 16, prompt: "Rozkazovací věta (imperative) obvykle:", options: ["Začíná zájmenem 'I'", "Začíná slovesem a dává příkaz nebo žádost", "Klade otázku", "Vyjadřuje překvapení"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_16_p9", topicId: 16, prompt: "Kolik druhů vět existuje v angličtině?", options: ["2", "3", "4", "5"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_16_p10", topicId: 16, prompt: "Zvolací věta (exclamatory) vyjadřuje:", options: ["Fakta nebo informace", "Příkaz nebo žádost", "Otázku", "Silnou emoci nebo pocit"], correctIndex: 3)
    ],

    // MARK: Topic 17  -  Anglické Homofony
    17: [
        MathExamQuestion(id: "cs_teach_17_p1", topicId: 17, prompt: "Co jsou homofony (homophones) v angličtině?", options: ["Slova se stejným pravopisem a významem", "Slova, která znějí stejně, ale mají různý pravopis a význam", "Slova s opačným významem", "Slova ze stejné slovní rodiny"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_17_p2", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'The book is over ___.' (Tamhle)', ne u nás)", options: ["their", "they're", "there", "the"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p3", topicId: 17, prompt: "Které slovo správně vyplní mezeru? '___ going to the park.' (Oni jdou)", options: ["Their", "There", "They're", "Theyre"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p4", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'I forgot ___ umbrella.' (jejich)", options: ["there", "they're", "their", "theyre"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p5", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'I want ___ go home.' (chci jít)", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p6", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'I have ___ cats.' (dvě)", options: ["to", "too", "two", "tew"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p7", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'She wants to come ___.' (také)", options: ["to", "two", "too", "tu"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_17_p8", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'Is this ___ book?' (tvoje)", options: ["you're", "your", "yore", "yor"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_17_p9", topicId: 17, prompt: "Které slovo správně vyplní mezeru? '___ a great day!' (Je to skvělý den!)", options: ["Its", "It's", "Its'", "Itss"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_17_p10", topicId: 17, prompt: "Které slovo správně vyplní mezeru? 'The dog wagged ___ tail.' (svůj ocas)", options: ["it's", "its'", "its", "it is"], correctIndex: 2)
    ],

    // MARK: Topic 18  -  Slovní Druhy
    18: [
        MathExamQuestion(id: "cs_teach_18_p1", topicId: 18, prompt: "Kolik hlavních slovních druhů rozlišuje angličtina?", options: ["5", "6", "7", "8"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_18_p2", topicId: 18, prompt: "Které slovo je zájmeno (pronoun)?", options: ["table", "run", "she", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_18_p3", topicId: 18, prompt: "Co vyjadřuje předložka (preposition) v angličtině?", options: ["Děj nebo stav", "Vztah mezi slovy, nejčastěji místo nebo směr", "Vlastnost osoby nebo věci", "Emoci nebo citoslovce"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_18_p4", topicId: 18, prompt: "Které slovo je předložka (preposition)?", options: ["happy", "run", "on", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_18_p5", topicId: 18, prompt: "Co je spojka (conjunction) v angličtině?", options: ["Slovo, které popisuje podstatné jméno", "Slovo, které spojuje dvě věty nebo slova dohromady", "Slovo, které nahrazuje podstatné jméno", "Slovo, které popisuje sloveso"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_18_p6", topicId: 18, prompt: "Které slovo je spojka (conjunction)?", options: ["cat", "run", "and", "big"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_18_p7", topicId: 18, prompt: "Co je citoslovce (interjection) v angličtině?", options: ["Slovo popisující sloveso", "Zvolání vyjadřující emoci, jako 'Wow!' nebo 'Oh!'", "Slovo nahrazující podstatné jméno", "Sloveso v rozkazovacím způsobu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_18_p8", topicId: 18, prompt: "Které slovo ve větě 'She runs quickly.' je příslovce (adverb)?", options: ["She", "runs", "quickly", "She runs"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_18_p9", topicId: 18, prompt: "Které slovo je podstatné jméno (noun)?", options: ["swim", "tall", "city", "softly"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_18_p10", topicId: 18, prompt: "Zájmeno (pronoun) v angličtině:", options: ["Popisuje podstatné jméno", "Vyjadřuje děj", "Nahrazuje podstatné jméno", "Spojuje dvě věty"], correctIndex: 2)
    ]
]

let csTeachingExamA: [Int: [MathExamQuestion]] = [

    // MARK: Exam Topic 1  -  Anglická Abeceda
    1: [
        MathExamQuestion(id: "cs_exam_1_e1", topicId: 1, prompt: "Které písmeno anglické abecedy je na 5. místě?", options: ["D", "E", "F", "G"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_1_e2", topicId: 1, prompt: "Kolik souhlásek obsahuje anglická abeceda?", options: ["19", "20", "21", "22"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_1_e3", topicId: 1, prompt: "Které z těchto písmen je samohláska?", options: ["G", "H", "O", "P"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_1_e4", topicId: 1, prompt: "Jaké je první písmeno anglické abecedy?", options: ["B", "A", "C", "D"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_1_e5", topicId: 1, prompt: "Které písmeno přichází v anglické abecedě po 'S'?", options: ["R", "Q", "T", "U"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_1_e6", topicId: 1, prompt: "Slovo 'elephant' začíná kterým písmenem?", options: ["A", "E", "I", "O"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_1_e7", topicId: 1, prompt: "Které písmeno přichází v anglické abecedě před 'Z'?", options: ["X", "Y", "W", "V"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_1_e8", topicId: 1, prompt: "Anglická abeceda má celkem:", options: ["24 písmen", "25 písmen", "26 písmen", "27 písmen"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_1_e9", topicId: 1, prompt: "Které z těchto písmen NENÍ souhláska?", options: ["B", "C", "U", "D"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_1_e10", topicId: 1, prompt: "Písmeno 'Q' se v anglické abecedě nachází na:", options: ["15. místě", "16. místě", "17. místě", "18. místě"], correctIndex: 2)
    ],

    // MARK: Exam Topic 2  -  Krátké Samohlásky
    2: [
        MathExamQuestion(id: "cs_exam_2_e1", topicId: 2, prompt: "Která samohláska je krátká ve slově 'map'?", options: ["e", "a", "i", "o"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_2_e2", topicId: 2, prompt: "Které slovo obsahuje krátkou samohlásku 'u'?", options: ["mule", "mute", "mud", "muse"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_2_e3", topicId: 2, prompt: "Jaká je krátká samohláska ve slově 'fish'?", options: ["a", "e", "i", "o"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_2_e4", topicId: 2, prompt: "Které slovo MÁ vzor CVC (souhláska–samohláska–souhláska)?", options: ["boat", "bed", "bead", "bear"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_2_e5", topicId: 2, prompt: "Jaká krátká samohláska je ve slově 'log'?", options: ["a", "e", "i", "o"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_2_e6", topicId: 2, prompt: "Které slovo má krátkou samohlásku 'e'?", options: ["eagle", "eat", "egg", "eel"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_2_e7", topicId: 2, prompt: "Slovo 'sun' má krátkou samohlásku:", options: ["a", "o", "u", "e"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_2_e8", topicId: 2, prompt: "Které slovo NEMÁ krátkou samohlásku?", options: ["hot", "hat", "hut", "hate"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_2_e9", topicId: 2, prompt: "Jaká krátká samohláska je ve slově 'tip'?", options: ["a", "e", "i", "u"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_2_e10", topicId: 2, prompt: "Které slovo má krátkou samohlásku 'o'?", options: ["rope", "rose", "rock", "rode"], correctIndex: 2)
    ],

    // MARK: Exam Topic 3  -  Nejčastější Slova
    3: [
        MathExamQuestion(id: "cs_exam_3_e1", topicId: 3, prompt: "Co znamená anglické slovo 'with'?", options: ["bez", "s / spolu s", "pro", "od"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_3_e2", topicId: 3, prompt: "Jak se řekne 'oni mají' anglicky?", options: ["they is", "they are", "they have", "they has"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_3_e3", topicId: 3, prompt: "Co znamená anglické slovo 'said'?", options: ["viděl", "řekl", "přišel", "šel"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_3_e4", topicId: 3, prompt: "Jak se řekne 'my' (1. osoba množného čísla) v angličtině?", options: ["they", "you", "we", "I"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_3_e5", topicId: 3, prompt: "Co znamená anglické slovo 'for'?", options: ["od", "s", "pro / za", "v"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_3_e6", topicId: 3, prompt: "Jak se řekne 'ona' v angličtině?", options: ["he", "they", "we", "she"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_3_e7", topicId: 3, prompt: "Co znamená anglické slovo 'but'?", options: ["a", "nebo", "ale", "protože"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_3_e8", topicId: 3, prompt: "Jak se řekne 'on' v angličtině?", options: ["she", "they", "we", "he"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_3_e9", topicId: 3, prompt: "Co znamená anglické slovo 'not'?", options: ["teď", "ne / není", "ani", "nic"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_3_e10", topicId: 3, prompt: "Jak se řekne 'to / ono' (věc nebo zvíře) v angličtině?", options: ["he", "she", "it", "they"], correctIndex: 2)
    ],

    // MARK: Exam Topic 4  -  Jednoduché Věty
    4: [
        MathExamQuestion(id: "cs_exam_4_e1", topicId: 4, prompt: "Která věta je správně sestavená anglická věta?", options: ["Plays she piano.", "She plays piano.", "Piano she plays.", "Plays piano she."], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_4_e2", topicId: 4, prompt: "Identifikuj podmět ve větě 'My sister likes chocolate.'", options: ["likes", "chocolate", "My sister", "My"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_4_e3", topicId: 4, prompt: "Identifikuj sloveso ve větě 'The children play football.'", options: ["children", "The", "play", "football"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_4_e4", topicId: 4, prompt: "Která věta správně překládá 'Ptáci zpívají ráno.'?", options: ["Birds sing morning.", "The birds sing in the morning.", "Sing the birds morning.", "In the morning sing birds."], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_4_e5", topicId: 4, prompt: "Která chyba je ve větě 'i have a dog.'?", options: ["Chybí tečka", "Slovo 'i' musí být 'I' (velké I)", "Chybí čárka", "Slovo 'dog' je špatně"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_4_e6", topicId: 4, prompt: "Identifikuj předmět (object) ve větě 'He drinks water.'", options: ["He", "drinks", "water", "He drinks"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_4_e7", topicId: 4, prompt: "Která věta přeloží správně 'Ráda čtu knihy.'?", options: ["Books I like read.", "I like to read books.", "Read I books like.", "Books read I like."], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_4_e8", topicId: 4, prompt: "Které zájmeno nahrazuje podmět 'The boy' v anglické větě?", options: ["She", "They", "He", "It"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_4_e9", topicId: 4, prompt: "Která z vět je anglicky ŠPATNĚ?", options: ["The cat sleeps.", "She eats breakfast.", "They plays games.", "He runs fast."], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_4_e10", topicId: 4, prompt: "Co je sloveso ve větě 'We eat breakfast every morning.'?", options: ["We", "eat", "breakfast", "morning"], correctIndex: 1)
    ],

    // MARK: Exam Topic 5  -  Rýmy a Slovní Rodiny
    5: [
        MathExamQuestion(id: "cs_exam_5_e1", topicId: 5, prompt: "Které slovo se rýmuje se slovem 'night'?", options: ["nigh", "knit", "light", "nigh"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_5_e2", topicId: 5, prompt: "Která skupina tvoří slovní rodinu '-ing'?", options: ["sing, ring, king", "sing, sang, sung", "ring, rang, rung", "king, queen, prince"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_5_e3", topicId: 5, prompt: "Které slovo se rýmuje se slovem 'moon'?", options: ["man", "mine", "soon", "mane"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_5_e4", topicId: 5, prompt: "Které slovo NERÝMUJE se zbytkem skupiny? 'bell, sell, fall, tell'", options: ["bell", "sell", "fall", "tell"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_5_e5", topicId: 5, prompt: "Které slovo patří do slovní rodiny '-ight'?", options: ["bit", "fight", "fit", "fat"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_5_e6", topicId: 5, prompt: "Které slovo se rýmuje se slovem 'tree'?", options: ["try", "tray", "free", "fray"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_5_e7", topicId: 5, prompt: "Která slova tvoří slovní rodinu '-ock'?", options: ["lock, rock, sock", "lock, lack, luck", "rock, rack, rick", "sock, sick, sack"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_5_e8", topicId: 5, prompt: "Které slovo se rýmuje se slovem 'play'?", options: ["pill", "pole", "pal", "day"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_5_e9", topicId: 5, prompt: "Které slovo patří do slovní rodiny '-all'?", options: ["bill", "ball", "bull", "bell"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_5_e10", topicId: 5, prompt: "Které slovo NERÝMUJE se slovem 'cake'?", options: ["lake", "make", "rake", "back"], correctIndex: 3)
    ],

    // MARK: Exam Topic 6  -  Dlouhé Samohlásky
    6: [
        MathExamQuestion(id: "cs_exam_6_e1", topicId: 6, prompt: "Které slovo má dlouhou samohlásku díky němému 'e'?", options: ["hit", "hid", "hide", "his"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_6_e2", topicId: 6, prompt: "Co se stane se samohláskou ve slově 'tub', když přidáš němé 'e'?", options: ["Zkrátí se", "Zmizí", "Prodlouží se a vznikne 'tube'", "Nic se nezmění"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_6_e3", topicId: 6, prompt: "Které slovo má dlouhou samohlásku 'o'?", options: ["hot", "hop", "hob", "home"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_6_e4", topicId: 6, prompt: "Které slovo NEOBSAHUJE dlouhou samohlásku?", options: ["kite", "note", "tape", "run"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_6_e5", topicId: 6, prompt: "Přidej němé 'e' ke slovu 'rod'. Co vznikne?", options: ["rode (dlouhé 'o')", "rood", "rude", "rode nemá smysl"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_6_e6", topicId: 6, prompt: "Které slovo má dlouhou samohlásku 'e'?", options: ["met", "men", "pet", "these"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_6_e7", topicId: 6, prompt: "Jaký zvuk vydává samohláska 'a' ve slově 'name'?", options: ["Krátký zvuk jako v 'cat'", "Dlouhý zvuk jako v 'cake'", "Žádný zvuk", "Zvuk 'e'"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_6_e8", topicId: 6, prompt: "Které dva tvary slov ukazují pravidlo němého 'e'?", options: ["can / cane", "car / card", "cap / cup", "cat / cut"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_6_e9", topicId: 6, prompt: "Které slovo má dlouhou samohlásku 'i'?", options: ["bit", "big", "bin", "bite"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_6_e10", topicId: 6, prompt: "Ve slově 'cute' je němé 'e' způsobuje:", options: ["Krátké 'u' jako v 'cup'", "Dlouhé 'u' jako v 'music'", "Ztišení celého slova", "Novou slabiku"], correctIndex: 1)
    ],

    // MARK: Exam Topic 7  -  Souhláskové Skupiny
    7: [
        MathExamQuestion(id: "cs_exam_7_e1", topicId: 7, prompt: "Které slovo začíná souhláskovou skupinou 'cl'?", options: ["slim", "clap", "slip", "flip"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_7_e2", topicId: 7, prompt: "Digraf 'sh' se vyskytuje ve slově:", options: ["chin", "thin", "shine", "wine"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_7_e3", topicId: 7, prompt: "Které slovo začíná skupinou 'br'?", options: ["brown", "crown", "frown", "grown"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_7_e4", topicId: 7, prompt: "Jak zní digraf 'th' ve slově 'think'?", options: ["Jako 't'", "Jako 's'", "Jako mezizubní souhláska (jako české 't+h')", "Jako 'f'"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_7_e5", topicId: 7, prompt: "Které slovo NEZAČÍNÁ souhláskovou skupinou?", options: ["flag", "sled", "open", "trip"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_7_e6", topicId: 7, prompt: "Digraf 'ch' se vyskytuje ve slově:", options: ["show", "sheep", "chair", "ship"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_7_e7", topicId: 7, prompt: "Které slovo začíná skupinou 'fl'?", options: ["slip", "clip", "flip", "trip"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_7_e8", topicId: 7, prompt: "Ve slově 'phone' digraf 'ph' zní jako:", options: ["p", "f", "b", "v"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_7_e9", topicId: 7, prompt: "Které slovo obsahuje digraf 'wh'?", options: ["where", "here", "were", "hare"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_7_e10", topicId: 7, prompt: "Co je souhláskový blend (blend) v angličtině?", options: ["Dvě písmena, která tvoří jeden zcela nový zvuk", "Dvě nebo více souhlásek, kde slyšíme každou zvlášť", "Samohláska na začátku slova", "Němé písmeno na konci slova"], correctIndex: 1)
    ],

    // MARK: Exam Topic 8  -  Podstatná a Slovesa
    8: [
        MathExamQuestion(id: "cs_exam_8_e1", topicId: 8, prompt: "Které slovo je podstatné jméno (noun)?", options: ["beautiful", "quickly", "mountain", "run"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_8_e2", topicId: 8, prompt: "Které slovo je sloveso (verb)?", options: ["garden", "flower", "water", "plant"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_8_e3", topicId: 8, prompt: "Jaký je správný plurál slova 'box' v angličtině?", options: ["boxs", "boxes", "boxi", "boxen"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_8_e4", topicId: 8, prompt: "Které slovo je sloveso ve větě 'The teacher explains the lesson.'?", options: ["teacher", "explains", "lesson", "The"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_8_e5", topicId: 8, prompt: "Jaký je správný plurál slova 'mouse' v angličtině?", options: ["mouses", "mousies", "mice", "mices"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_8_e6", topicId: 8, prompt: "Které slovo je podstatné jméno?", options: ["laugh", "friendship", "kind", "softly"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_8_e7", topicId: 8, prompt: "Ve větě 'My friends help me.' je 'help':", options: ["podstatné jméno", "přídavné jméno", "sloveso", "příslovce"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_8_e8", topicId: 8, prompt: "Jaký je správný plurál slova 'baby' v angličtině?", options: ["babys", "babyes", "babies", "babie"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_8_e9", topicId: 8, prompt: "Které slovo je sloveso?", options: ["happiness", "love", "joyful", "fast"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_8_e10", topicId: 8, prompt: "Podstatné jméno (noun) může být:", options: ["Pouze osoba", "Pouze věc", "Pouze místo", "Osoba, místo, věc nebo myšlenka"], correctIndex: 3)
    ],

    // MARK: Exam Topic 9  -  Přídavná Jména a Příslovce
    9: [
        MathExamQuestion(id: "cs_exam_9_e1", topicId: 9, prompt: "Které slovo je přídavné jméno (adjective)?", options: ["dance", "gracefully", "graceful", "dancer"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e2", topicId: 9, prompt: "Které slovo je příslovce (adverb)?", options: ["loud", "louder", "loudly", "loudest"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e3", topicId: 9, prompt: "Ve větě 'The clever girl solved the puzzle.' je 'clever':", options: ["příslovce", "sloveso", "přídavné jméno", "podstatné jméno"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e4", topicId: 9, prompt: "Které příslovce vznikne z přídavného jména 'careful'?", options: ["carefuly", "carefully", "carefulness", "more careful"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_9_e5", topicId: 9, prompt: "Přídavné jméno popisuje:", options: ["Jak se děj odehrává", "Podstatné jméno nebo zájmeno", "Jiné přídavné jméno", "Celou větu"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_9_e6", topicId: 9, prompt: "Které slovo je přídavné jméno?", options: ["quickly", "loud", "run", "very"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_9_e7", topicId: 9, prompt: "Ve větě 'He speaks softly.' je 'softly':", options: ["přídavné jméno", "podstatné jméno", "příslovce", "sloveso"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e8", topicId: 9, prompt: "Které příslovce vznikne z přídavného jména 'quick'?", options: ["quicker", "quickest", "quickly", "quickness"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e9", topicId: 9, prompt: "Které slovo ve větě 'The tiny kitten slept peacefully.' je přídavné jméno?", options: ["slept", "peacefully", "tiny", "kitten"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_9_e10", topicId: 9, prompt: "Příslovce (adverb) nejčastěji odpovídá na otázku:", options: ["Kdo? nebo Co?", "Jaký? nebo Který?", "Jak? Kde? Kdy? nebo Do jaké míry?", "Čí?"], correctIndex: 2)
    ],

    // MARK: Exam Topic 10  -  Anglická Interpunkce
    10: [
        MathExamQuestion(id: "cs_exam_10_e1", topicId: 10, prompt: "Která věta má CHYBNOU interpunkci?", options: ["She likes cats.", "Do you like dogs?", "Run fast!", "Where are you."], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_10_e2", topicId: 10, prompt: "Ve větě se seznamem 'I need eggs, milk, and bread.' čárky:", options: ["Jsou špatně umístěny", "Oddělují položky seznamu správně", "Nahrazují tečku", "Jsou zbytečné"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_10_e3", topicId: 10, prompt: "Apostrof (') se v angličtině používá:", options: ["Pro uvozovky", "Pro stažená slova a přivlastnění", "Na konci každé věty", "Před čísly"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_10_e4", topicId: 10, prompt: "Která věta má správnou interpunkci?", options: ["She said, I love you.", "She said, \"I love you.\"", "She said \"I love you\".", "She said I love you."], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_10_e5", topicId: 10, prompt: "Která věta je SPRÁVNĚ interpunkčně?", options: ["He is, a doctor.", "He is a doctor.", "He, is a doctor.", "He is a, doctor."], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_10_e6", topicId: 10, prompt: "Vykřičník (!) se používá pro:", options: ["Každodenní oznamovací věty", "Tázací věty", "Silná zvolání a výkřiky", "Seznamy slov"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_10_e7", topicId: 10, prompt: "Která věta má správnou interpunkci při přímé řeči?", options: ["\"Help!\" she cried.", "Help! she cried.", "\"Help!\" She cried.", "Help, she cried."], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_10_e8", topicId: 10, prompt: "Čárka (,) se v angličtině NEPOUŽÍVÁ pro:", options: ["Oddělení položek seznamu", "Oddělení vedlejší věty", "Oslovení osoby", "Ukončení věty místo tečky"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_10_e9", topicId: 10, prompt: "Která z vět má správnou interpunkci?", options: ["Wow, that's amazing!", "Wow that's amazing!", "Wow, that's amazing.", "wow, that's amazing!"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_10_e10", topicId: 10, prompt: "Co označuje apostrof v 'Sarah's book'?", options: ["Množné číslo", "Stažené slovo", "Přivlastnění (kniha Sáry)", "Přímou řeč"], correctIndex: 2)
    ],

    // MARK: Exam Topic 11  -  Složená Slova
    11: [
        MathExamQuestion(id: "cs_exam_11_e1", topicId: 11, prompt: "Co znamená složené slovo 'earthquake'?", options: ["vzduchový pád", "zemětřesení", "moře bouře", "pád kamene"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_11_e2", topicId: 11, prompt: "Stažené slovo 'she's' může být zkratkou pro:", options: ["she has nebo she is", "she was nebo she were", "she had nebo she did", "she will nebo she would"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_11_e3", topicId: 11, prompt: "Z jakých slov se skládá 'starfish'?", options: ["star + fish", "sta + rfish", "starf + ish", "s + tarfish"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_11_e4", topicId: 11, prompt: "Stažené slovo 'we're' je zkratkou pro:", options: ["we were", "we are", "we have", "we will"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_11_e5", topicId: 11, prompt: "Které z těchto slov je složené slovo?", options: ["beautiful", "quickly", "everywhere", "running"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_11_e6", topicId: 11, prompt: "Stažené slovo 'won't' je zkratkou pro:", options: ["would not", "will not", "was not", "were not"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_11_e7", topicId: 11, prompt: "Co znamená složené slovo 'toothbrush'?", options: ["zubní kartáček", "vlasový kartáč", "hřeben vlasů", "zubní pasta"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_11_e8", topicId: 11, prompt: "Stažené slovo 'you've' je zkratkou pro:", options: ["you will", "you are", "you have", "you were"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_11_e9", topicId: 11, prompt: "Které složené slovo správně spojuje 'fire' a 'place'?", options: ["fireplace", "placefire", "fire-places", "fireplaces"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_11_e10", topicId: 11, prompt: "Stažené slovo 'hasn't' je zkratkou pro:", options: ["have not", "had not", "has not", "having not"], correctIndex: 2)
    ],

    // MARK: Exam Topic 12  -  Předpony a Přípony
    12: [
        MathExamQuestion(id: "cs_exam_12_e1", topicId: 12, prompt: "Co znamená slovo 'unhappy'?", options: ["velmi šťastný", "nešťastný", "šťastnější", "nejšťastnější"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e2", topicId: 12, prompt: "Které slovo vznikne přidáním předpony 're-' ke slovu 'build'?", options: ["unbuilding", "rebuild (postavit znovu)", "building", "builder"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e3", topicId: 12, prompt: "Co znamená přípona '-ness' ve slově 'kindness'?", options: ["Příslovce", "Stav nebo vlastnost (laskavost)", "Sloveso v průběhu", "Opak"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e4", topicId: 12, prompt: "Které slovo obsahuje příponu '-ful'?", options: ["careful", "careless", "caring", "cared"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_12_e5", topicId: 12, prompt: "Co vznikne ze slova 'happy' přidáním přípony '-ness'?", options: ["happily", "happier", "happiness", "happiest"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_12_e6", topicId: 12, prompt: "Předpona 're-' ve slově 'reread' znamená:", options: ["přečíst poprvé", "číst znovu", "nečíst", "číst rychle"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e7", topicId: 12, prompt: "Které slovo obsahuje příponu '-less'?", options: ["hopeful", "hopeless", "hopelessly", "hoping"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e8", topicId: 12, prompt: "Co je přípona (suffix) v angličtině?", options: ["Část slova přidaná na začátek", "Část slova přidaná na konec", "Kořen slova", "Celé slovo"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_12_e9", topicId: 12, prompt: "Které slovo je přídavné jméno z podstatného jména 'care' (péče)?", options: ["caring", "cared", "careful", "carefulness"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_12_e10", topicId: 12, prompt: "Co vznikne ze slova 'play' přidáním přípony '-ful'?", options: ["playing", "played", "player", "playful"], correctIndex: 3)
    ],

    // MARK: Exam Topic 13  -  Synonyma a Antonyma
    13: [
        MathExamQuestion(id: "cs_exam_13_e1", topicId: 13, prompt: "Které slovo je synonymum pro 'large' (velký)?", options: ["tiny", "small", "huge", "short"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_13_e2", topicId: 13, prompt: "Které slovo je antonymum pro 'strong' (silný)?", options: ["powerful", "mighty", "weak", "tough"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_13_e3", topicId: 13, prompt: "Které slovo je synonymum pro 'scared' (vystrašený)?", options: ["brave", "calm", "afraid", "bold"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_13_e4", topicId: 13, prompt: "Které slovo je antonymum pro 'open' (otevřený)?", options: ["wide", "shut", "free", "clear"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_13_e5", topicId: 13, prompt: "Které slovo je synonymum pro 'talk' (mluvit)?", options: ["listen", "hear", "speak", "read"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_13_e6", topicId: 13, prompt: "Které slovo je antonymum pro 'loud' (hlasitý)?", options: ["noisy", "quiet", "clear", "strong"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_13_e7", topicId: 13, prompt: "Které slovo je synonymum pro 'pretty' (hezký)?", options: ["ugly", "awful", "beautiful", "dirty"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_13_e8", topicId: 13, prompt: "Které slovo je antonymum pro 'remember' (pamatovat si)?", options: ["recall", "think", "know", "forget"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_13_e9", topicId: 13, prompt: "Které slovo je synonymum pro 'tired' (unavený)?", options: ["energetic", "sleepy", "active", "lively"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_13_e10", topicId: 13, prompt: "Které slovo je antonymum pro 'ancient' (starověký/starý)?", options: ["old", "historic", "modern", "aged"], correctIndex: 2)
    ],

    // MARK: Exam Topic 14  -  Porozumění Textu
    14: [
        MathExamQuestion(id: "cs_exam_14_e1", topicId: 14, prompt: "Přečti si: 'Tom loves dogs. He has three dogs at home. Every morning he takes them for a walk.' Jaká je hlavní myšlenka?", options: ["Tom bydlí doma", "Tom chodí každé ráno ven", "Tom miluje psy a stará se o ně", "Tom má tři sourozence"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_14_e2", topicId: 14, prompt: "Přečti si: 'The sun rises in the east every morning.' Otázka 'Where?' (Kde?) Správná odpověď je:", options: ["Every morning", "The sun", "In the east", "Rises"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_14_e3", topicId: 14, prompt: "Otázka 'How?' (Jak?) v porozumění textu se ptá na:", options: ["Místo", "Čas", "Způsob nebo postup", "Příčinu"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_14_e4", topicId: 14, prompt: "Přečti si: 'Mary was cold because she forgot her jacket.' Proč byla Mary zima?", options: ["Protože pršelo", "Protože zapomněla bundu", "Protože šla ven", "Protože bylo ráno"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_14_e5", topicId: 14, prompt: "Co je 'tematická věta' (topic sentence) v odstavci?", options: ["Poslední věta odstavce", "Věta, která uvádí hlavní myšlenku odstavce", "Nejdelší věta odstavce", "Věta s nejvíce detaily"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_14_e6", topicId: 14, prompt: "Přečti si: 'The library was quiet. Students were reading books.' Kde se odehrává scéna?", options: ["Ve škole", "V knihovně", "Doma", "V parku"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_14_e7", topicId: 14, prompt: "Co znamená 'číst mezi řádky' (read between the lines) v angličtině?", options: ["Číst velmi pomalu", "Pochopit skrytý nebo nevyřčený význam", "Číst každé druhé řádky", "Číst text pozpátku"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_14_e8", topicId: 14, prompt: "Přečti si: 'It was raining heavily. Anna looked out the window sadly.' Co pravděpodobně Anna cítila?", options: ["Radost", "Zlost", "Zklamání nebo smutek", "Strach"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_14_e9", topicId: 14, prompt: "Co je 'závěr' (conclusion) článku nebo příběhu?", options: ["Úvod do tématu", "Konec, který shrnuje nebo uzavírá téma", "Nejdůležitější detail", "Seznam postav"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_14_e10", topicId: 14, prompt: "Přečti si: 'Jack woke up late. He grabbed his bag and ran to school.' Otázka 'Who?' Správná odpověď:", options: ["School", "Bag", "Jack", "Late"], correctIndex: 2)
    ],

    // MARK: Exam Topic 15  -  Prvky Příběhu
    15: [
        MathExamQuestion(id: "cs_exam_15_e1", topicId: 15, prompt: "V příběhu o dívce, která zachrání ztracené kotě, je kotě:", options: ["Prostředí příběhu", "Problém příběhu", "Vedlejší postava", "Řešení příběhu"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e2", topicId: 15, prompt: "Jak se anglicky řekne 'prostředí příběhu'?", options: ["character", "plot", "setting", "theme"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e3", topicId: 15, prompt: "V jakém pořadí se obvykle odehrávají části příběhu?", options: ["Konec, střed, začátek", "Střed, začátek, konec", "Začátek, střed, konec", "Konec, začátek, střed"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e4", topicId: 15, prompt: "Jak se anglicky řekne 'děj příběhu'?", options: ["setting", "theme", "character", "plot"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_15_e5", topicId: 15, prompt: "Ve příběhu 'Červená Karkulka' je vlk:", options: ["Hlavní postava (hrdinka)", "Prostředí příběhu", "Záporná postava / antagonista", "Řešení problému"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e6", topicId: 15, prompt: "Problém (problem/conflict) příběhu je:", options: ["Kde se příběh odehrává", "Výzva, se kterou se postava musí vyrovnat", "Poučení z příběhu", "Popis hlavní postavy"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_15_e7", topicId: 15, prompt: "Prostředí (setting) příběhu popisuje:", options: ["Myšlenky a city postavy", "Místo a čas příběhu", "Příčinu konfliktu", "Jméno autora"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_15_e8", topicId: 15, prompt: "Co se anglicky řekne 'poučení z příběhu'?", options: ["setting", "plot", "moral/theme", "character"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e9", topicId: 15, prompt: "Pokud se příběh odehrává 'v hlubokém temném lese za soumraku', je to popis:", options: ["Postavy", "Problému", "Prostředí", "Řešení"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_15_e10", topicId: 15, prompt: "Řešení (solution) nastane v příběhu:", options: ["Na začátku", "Uprostřed", "Při vrcholu příběhu", "Na konci, po vyřešení problému"], correctIndex: 3)
    ],

    // MARK: Exam Topic 16  -  Druhy Vět
    16: [
        MathExamQuestion(id: "cs_exam_16_e1", topicId: 16, prompt: "Která věta je oznamovací (declarative)?", options: ["Help me, please!", "Can you help me?", "Help me now!", "I need help."], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_16_e2", topicId: 16, prompt: "Která věta je tázací (interrogative)?", options: ["The sun is bright.", "How bright is the sun!", "Is the sun bright?", "The bright sun shines."], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_16_e3", topicId: 16, prompt: "Která věta je rozkazovací (imperative)?", options: ["I close the door.", "Do you close the door?", "What a door!", "Close the door, please."], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_16_e4", topicId: 16, prompt: "Která věta je zvolací (exclamatory)?", options: ["She won the race.", "Did she win the race?", "Win the race!", "What a great race she won!"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_16_e5", topicId: 16, prompt: "Tázací věta (interrogative) vždy končí:", options: ["Tečkou (.)", "Vykřičníkem (!)", "Otazníkem (?)", "Čárkou (,)"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_16_e6", topicId: 16, prompt: "Rozkazovací věta (imperative) vyjadřuje:", options: ["Fakt nebo informaci", "Příkaz, žádost nebo radu", "Silnou emoci", "Otázku"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_16_e7", topicId: 16, prompt: "Která věta je správně jako zvolací (exclamatory)?", options: ["How beautiful the flowers are!", "How beautiful the flowers are.", "How beautiful are the flowers?", "beautiful the flowers are!"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_16_e8", topicId: 16, prompt: "Věta 'Please sit down.' je:", options: ["Oznamovací (declarative)", "Tázací (interrogative)", "Rozkazovací (imperative)", "Zvolací (exclamatory)"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_16_e9", topicId: 16, prompt: "Která z vět je špatně zařazena? 'She is a good student.'", options: ["Tázací", "Oznamovací", "Zvolací", "Rozkazovací"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_16_e10", topicId: 16, prompt: "Věta 'Wow, what a beautiful sunset!' je:", options: ["Oznamovací", "Tázací", "Rozkazovací", "Zvolací"], correctIndex: 3)
    ],

    // MARK: Exam Topic 17  -  Anglické Homofony
    17: [
        MathExamQuestion(id: "cs_exam_17_e1", topicId: 17, prompt: "Vyber správné slovo: 'I ___ a letter to my friend.' (Napsal jsem)", options: ["wrote", "rote", "right", "write"], correctIndex: 0),
        MathExamQuestion(id: "cs_exam_17_e2", topicId: 17, prompt: "Vyber správné slovo: 'She ___ to music every day.' (Poslouchá)", options: ["hears", "here's", "hears", "listens"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_17_e3", topicId: 17, prompt: "'There' se používá pro:", options: ["Přivlastnění (jejich)", "Místo nebo existenci ('tamhle', 'je')", "Stažení 'they are'", "Zájmeno 'oni'"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_17_e4", topicId: 17, prompt: "'Their' se používá pro:", options: ["Místo nebo existenci", "Stažení 'they are'", "Přivlastnění (jejich)", "Příslovce místa"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_17_e5", topicId: 17, prompt: "Vyber správné slovo: '___ going home now.' (Oni jdou domů)", options: ["Their", "There", "They're", "Theyre"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_17_e6", topicId: 17, prompt: "Vyber správné slovo: 'I have ___ brothers.' (dva)", options: ["to", "too", "two", "tow"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_17_e7", topicId: 17, prompt: "Vyber správné slovo: '___ my best friend.' (Jsi / Ty jsi)", options: ["Your", "You're", "Yore", "Yor"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_17_e8", topicId: 17, prompt: "Vyber správné slovo: 'The cat hurt ___ paw.' (svou tlapku)", options: ["it's", "its'", "its", "it is"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_17_e9", topicId: 17, prompt: "Homofony jsou slova, která:", options: ["Mají stejný pravopis a různý zvuk", "Znějí stejně, ale mají různý pravopis a/nebo význam", "Mají opačný význam", "Patří do stejné slovní rodiny"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_17_e10", topicId: 17, prompt: "Vyber správné slovo: '___ a lovely day outside!' (Je to)", options: ["Its", "It's", "Its'", "Itss"], correctIndex: 1)
    ],

    // MARK: Exam Topic 18  -  Slovní Druhy
    18: [
        MathExamQuestion(id: "cs_exam_18_e1", topicId: 18, prompt: "Identifikuj slovní druh slova 'above' ve větě 'The bird flew above the trees.'", options: ["přídavné jméno", "sloveso", "předložka", "příslovce"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_18_e2", topicId: 18, prompt: "Identifikuj slovní druh slova 'but' ve větě 'I wanted to go, but I was tired.'", options: ["přídavné jméno", "podstatné jméno", "sloveso", "spojka"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_18_e3", topicId: 18, prompt: "Které slovo je zájmeno (pronoun) ve větě 'They love to play football.'?", options: ["love", "play", "They", "football"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_18_e4", topicId: 18, prompt: "Citoslovce (interjection) 'Ouch!' vyjadřuje:", options: ["Příkaz", "Bolest nebo překvapení", "Otázku", "Přivlastnění"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_18_e5", topicId: 18, prompt: "Identifikuj slovní druh slova 'beautiful' ve větě 'What a beautiful sunset!'", options: ["podstatné jméno", "přídavné jméno", "příslovce", "sloveso"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_18_e6", topicId: 18, prompt: "Které slovo je předložka (preposition) ve větě 'The cat is under the table.'?", options: ["cat", "is", "under", "table"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_18_e7", topicId: 18, prompt: "Identifikuj slovní druh slova 'quickly' ve větě 'She runs quickly.'", options: ["přídavné jméno", "podstatné jméno", "příslovce", "sloveso"], correctIndex: 2),
        MathExamQuestion(id: "cs_exam_18_e8", topicId: 18, prompt: "Které z těchto slov je spojka (conjunction)?", options: ["over", "because", "happy", "dance"], correctIndex: 1),
        MathExamQuestion(id: "cs_exam_18_e9", topicId: 18, prompt: "Identifikuj slovní druh slova 'we' ve větě 'We went to the park.'", options: ["podstatné jméno", "sloveso", "přídavné jméno", "zájmeno"], correctIndex: 3),
        MathExamQuestion(id: "cs_exam_18_e10", topicId: 18, prompt: "Která ze skupin správně pojmenovává 8 slovních druhů v angličtině?", options: ["podstatné jméno, sloveso, přídavné jméno, příslovce, zájmeno, předložka, spojka, citoslovce", "podstatné jméno, sloveso, přídavné jméno, příslovce, číslovka, předložka, spojka, citoslovce", "podstatné jméno, sloveso, přídavné jméno, příslovce, zájmeno, číslovka, spojka, citoslovce", "podstatné jméno, sloveso, přídavné jméno, příslovce, zájmeno, předložka, člen, citoslovce"], correctIndex: 0)
    ]
]
