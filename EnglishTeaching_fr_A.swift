import Foundation

// MARK: - English Teaching Pack: French (Topics 1-18)

let frTeachingTopicsA: [(id: Int, title: String, intro: String, example: String)] = [
    (1, "L'Alphabet Anglais", "Apprends les 26 lettres de l'alphabet anglais et leurs sons. L'anglais utilise l'alphabet latin avec 26 lettres : 5 voyelles (a, e, i, o, u) et 21 consonnes.", "La lettre 'A' se prononce comme dans 'apple' (pomme). La lettre 'B' se prononce comme dans 'ball' (balle)."),
    (2, "Les Voyelles Courtes", "Les voyelles courtes sont des sons brefs. Les cinq voyelles courtes en anglais sont : a (cat), e (bed), i (sit), o (hop), u (cup). On les trouve souvent dans des mots courts à trois lettres.", "Le mot 'cat' (chat) contient le son voyelle court 'a'. Le mot 'cup' (tasse) contient le son voyelle court 'u'."),
    (3, "Les Mots Fréquents", "Les mots fréquents (sight words) sont des mots anglais très courants qu'il faut reconnaître immédiatement. Exemples : the, and, is, was, are, have, said, you, they, from.", "La phrase 'The cat is big' contient deux mots fréquents : 'the' et 'is'. Il faut les apprendre par cœur."),
    (4, "Les Phrases Simples", "Une phrase simple en anglais suit souvent la structure Sujet + Verbe + Objet (SVO). Le sujet fait l'action, le verbe décrit l'action, et l'objet reçoit l'action.", "Dans la phrase 'The dog eats the bone' (Le chien mange l'os), 'The dog' est le sujet, 'eats' est le verbe, et 'the bone' est l'objet."),
    (5, "Les Rimes", "Les rimes anglaises partagent la même terminaison sonore. La famille '-at' : cat, bat, hat, mat, rat. La famille '-an' : can, man, ran, fan, pan. Les rimes aident à lire de nouveaux mots.", "Les mots 'cat', 'bat' et 'hat' riment car ils se terminent tous par le son '-at'. Si tu connais 'cat', tu peux lire 'bat' et 'hat'."),
    (6, "Les Voyelles Longues", "Les voyelles longues se prononcent comme le nom de la lettre. La règle du E muet : quand un mot se termine par 'e', la voyelle devient longue. Exemples : cake, bike, hope, cute.", "Le mot 'cap' a une voyelle courte, mais 'cape' (cap + e muet) a une voyelle longue. Le 'e' final change le son de la voyelle."),
    (7, "Les Groupes Consonantiques", "Les groupes consonantiques (blends) : bl, br, cl, cr, dr, fl, fr, gl, gr, pl, pr, sl, sm, sn, sp, st, sw, tr. Les digrammes : sh (ship), ch (chair), th (think), ph (phone), wh (whale).", "Dans 'black', on entend les deux sons 'b' et 'l' ensemble. Dans 'ship', 'sh' fait un seul son nouveau que ni 's' ni 'h' ne fait seul."),
    (8, "Les Noms et les Verbes", "Un nom (noun) désigne une personne, un animal, un lieu ou une chose : boy, dog, school, book. Un verbe (verb) décrit une action ou un état : run, eat, sleep, is. En anglais, les noms peuvent devenir pluriels en ajoutant 's' ou 'es'.", "Dans la phrase 'The bird sings', 'bird' est un nom (chose/animal) et 'sings' est un verbe (action). Identifie le nom et le verbe dans chaque phrase."),
    (9, "Les Adjectifs et les Adverbes", "Un adjectif décrit un nom : big, small, happy, red, fast. Un adverbe modifie un verbe ou un adjectif : quickly, slowly, very, always, never. Les adverbes de manière se forment souvent en ajoutant '-ly' à l'adjectif.", "Dans 'The quick fox runs quickly', 'quick' est un adjectif (décrit le renard) et 'quickly' est un adverbe (décrit comment il court)."),
    (10, "La Ponctuation Anglaise", "Les signes de ponctuation anglais principaux : le point (.) termine une phrase déclarative, la virgule (,) sépare des éléments, le point d'interrogation (?) termine une question, le point d'exclamation (!) exprime une émotion forte.", "La phrase 'Where is my book?' se termine par '?' car c'est une question. La phrase 'I love English!' se termine par '!' car elle exprime de l'enthousiasme."),
    (11, "Les Mots Composés", "Les mots composés (compound words) combinent deux mots pour en former un nouveau : sun + shine = sunshine, foot + ball = football. Les contractions combinent deux mots avec une apostrophe : do not = don't, can not = can't, I am = I'm.", "Le mot 'raincoat' vient de 'rain' (pluie) + 'coat' (manteau). La contraction 'she's' vient de 'she is' ou 'she has'."),
    (12, "Les Préfixes et Suffixes", "Un préfixe s'ajoute au début d'un mot pour changer son sens : un- (unhappy = malheureux), re- (redo = refaire). Un suffixe s'ajoute à la fin : -ing (running), -ed (walked), -er (faster), -est (fastest), -ful (beautiful), -less (homeless).", "Le mot 'unhappy' = préfixe 'un-' + 'happy'. Le mot 'careful' = 'care' + suffixe '-ful'. Les préfixes et suffixes aident à comprendre de nouveaux mots."),
    (13, "Les Synonymes et Antonymes", "Les synonymes sont des mots qui ont le même sens : happy/joyful (heureux), big/large (grand), fast/quick (rapide). Les antonymes sont des mots de sens opposé : happy/sad, big/small, fast/slow, hot/cold.", "Le synonyme de 'happy' est 'joyful'. L'antonyme de 'happy' est 'sad'. Connaître les synonymes enrichit ton vocabulaire anglais."),
    (14, "La Compréhension", "Pour bien comprendre un texte en anglais, pose-toi ces questions : Who? (Qui?), What? (Quoi?), Where? (Où?), When? (Quand?), Why? (Pourquoi?), How? (Comment?). L'idée principale est le sujet central du texte.", "Si tu lis 'Tom went to the store on Monday to buy apples', tu peux répondre : Who? Tom. Where? The store. When? Monday. Why? To buy apples."),
    (15, "Les Éléments du Récit", "Un récit en anglais comprend : le personnage (character)  -  qui est dans l'histoire, le cadre (setting)  -  où et quand se passe l'histoire, l'intrigue (plot)  -  ce qui se passe, le problème (problem)  -  le conflit, la solution  -  comment le problème est résolu.", "Dans 'Goldilocks and the Three Bears', le personnage est Goldilocks, le cadre est une forêt et une maison, le problème est qu'elle entre dans la maison des ours, et la solution est qu'elle s'enfuit."),
    (16, "Les Types de Phrases", "Il y a quatre types de phrases en anglais : déclarative (statement)  -  donne une information, se termine par '.'. Interrogative (question)  -  pose une question, se termine par '?'. Exclamative (exclamation)  -  exprime une émotion forte, se termine par '!'. Impérative (command)  -  donne un ordre.", "Déclarative : 'The sun is hot.' Interrogative : 'Is the sun hot?' Exclamative : 'The sun is so hot!' Impérative : 'Look at the sun!'"),
    (17, "Les Homophones Anglais", "Les homophones se prononcent de la même façon mais ont des orthographes et sens différents. Exemples importants : there/their/they're, to/too/two, your/you're, its/it's, here/hear, know/no.", "'There' = là-bas (lieu). 'Their' = leur (possessif). 'They're' = they are (contraction). Exemple : 'They're going to their house over there.'"),
    (18, "Les Parties du Discours", "Les parties du discours en anglais : nom (noun)  -  personne/lieu/chose, verbe (verb)  -  action/état, adjectif (adjective)  -  décrit un nom, adverbe (adverb)  -  modifie un verbe/adjectif, pronom (pronoun)  -  remplace un nom (I, he, she, they), préposition (preposition)  -  montre la relation (in, on, at, under).", "Dans 'She quickly put the red book on the table', 'She' est un pronom, 'quickly' est un adverbe, 'put' est un verbe, 'red' est un adjectif, 'book' est un nom, et 'on' est une préposition.")
]

// MARK: - Practice Questions (10 per topic)

let frTeachingPracticeA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1  -  L'Alphabet Anglais
    1: [
        MathExamQuestion(id: "fr_teach_1_p1", topicId: 1, prompt: "Combien de lettres y a-t-il dans l'alphabet anglais ?", options: ["24", "25", "26", "27"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p2", topicId: 1, prompt: "Combien de voyelles y a-t-il dans l'alphabet anglais ?", options: ["3", "4", "5", "6"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p3", topicId: 1, prompt: "Laquelle de ces lettres est une voyelle en anglais ?", options: ["B", "C", "E", "G"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p4", topicId: 1, prompt: "Quelle est la première lettre de l'alphabet anglais ?", options: ["Z", "B", "A", "E"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p5", topicId: 1, prompt: "Quelle est la dernière lettre de l'alphabet anglais ?", options: ["X", "Y", "Z", "W"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p6", topicId: 1, prompt: "Combien de consonnes y a-t-il dans l'alphabet anglais ?", options: ["19", "20", "21", "22"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_1_p7", topicId: 1, prompt: "Laquelle de ces lettres est une consonne ?", options: ["A", "E", "I", "T"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_1_p8", topicId: 1, prompt: "Quelle lettre anglaise ressemble à la lettre française 'K' ?", options: ["C", "K", "Q", "X"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_1_p9", topicId: 1, prompt: "Dans quel ordre viennent ces lettres dans l'alphabet anglais ?", options: ["M, L, K", "K, L, M", "L, M, K", "M, K, L"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_1_p10", topicId: 1, prompt: "Quelle lettre anglaise se prononce comme le mot français 'aïe' ?", options: ["A", "I", "Y", "E"], correctIndex: 1)
    ],

    // MARK: Topic 2  -  Les Voyelles Courtes
    2: [
        MathExamQuestion(id: "fr_teach_2_p1", topicId: 2, prompt: "Quel son de voyelle courte entend-on dans le mot 'cat' (chat) ?", options: ["e court", "a court", "i court", "o court"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_2_p2", topicId: 2, prompt: "Lequel de ces mots contient un son 'i' court ?", options: ["bike", "kite", "sit", "ice"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p3", topicId: 2, prompt: "Quel son de voyelle courte entend-on dans le mot 'cup' (tasse) ?", options: ["a court", "e court", "o court", "u court"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_2_p4", topicId: 2, prompt: "Lequel de ces mots contient un son 'e' court ?", options: ["bee", "tree", "bed", "feel"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p5", topicId: 2, prompt: "Quel son de voyelle courte entend-on dans le mot 'hop' (sauter) ?", options: ["a court", "u court", "o court", "i court"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p6", topicId: 2, prompt: "Parmi ces mots, lequel a une voyelle courte ?", options: ["cake", "bike", "dog", "note"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p7", topicId: 2, prompt: "Quel mot rime avec 'sit' et a aussi un 'i' court ?", options: ["site", "bite", "hit", "kite"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p8", topicId: 2, prompt: "Le mot 'pan' contient quel son de voyelle courte ?", options: ["e court", "a court", "o court", "u court"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_2_p9", topicId: 2, prompt: "Combien de voyelles courtes y a-t-il en anglais ?", options: ["3", "4", "5", "6"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_2_p10", topicId: 2, prompt: "Lequel de ces mots est un mot CVC (consonne-voyelle-consonne) avec une voyelle courte ?", options: ["road", "rain", "red", "real"], correctIndex: 2)
    ],

    // MARK: Topic 3  -  Les Mots Fréquents
    3: [
        MathExamQuestion(id: "fr_teach_3_p1", topicId: 3, prompt: "Comment dit-on 'le/la/les' en anglais (article défini) ?", options: ["a", "an", "the", "is"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p2", topicId: 3, prompt: "Quel mot fréquent signifie 'était' (passé de 'être') en anglais ?", options: ["is", "are", "were", "was"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_3_p3", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'ils/elles' ?", options: ["them", "their", "there", "they"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_3_p4", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'avoir' (forme verbale) ?", options: ["has", "had", "have", "having"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p5", topicId: 3, prompt: "Complète la phrase : '__ dog is big.' (Le chien est grand.)", options: ["A", "An", "The", "Is"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p6", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'et' ?", options: ["or", "but", "and", "so"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p7", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'de/depuis' ?", options: ["for", "with", "from", "into"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p8", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'sont' (forme plurielle de 'être') ?", options: ["is", "am", "was", "are"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_3_p9", topicId: 3, prompt: "Quel mot fréquent anglais signifie 'toi/vous' ?", options: ["I", "me", "you", "we"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_3_p10", topicId: 3, prompt: "Quelle phrase utilise correctement le mot fréquent 'said' ?", options: ["She said hello.", "She said to happy.", "She was said.", "Said she happy."], correctIndex: 0)
    ],

    // MARK: Topic 4  -  Les Phrases Simples
    4: [
        MathExamQuestion(id: "fr_teach_4_p1", topicId: 4, prompt: "Dans la phrase 'The cat drinks milk', quel est le sujet ?", options: ["drinks", "milk", "The cat", "The"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p2", topicId: 4, prompt: "Dans la phrase 'Sara reads a book', quel est le verbe ?", options: ["Sara", "reads", "a", "book"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_4_p3", topicId: 4, prompt: "Quelle phrase anglaise est correctement formée ?", options: ["Runs the boy fast.", "The boy fast runs.", "The boy runs fast.", "Fast boy the runs."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p4", topicId: 4, prompt: "Dans la phrase 'Tom kicks the ball', quel est l'objet ?", options: ["Tom", "kicks", "the ball", "the"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p5", topicId: 4, prompt: "Laquelle de ces phrases suit la structure Sujet + Verbe + Objet ?", options: ["Quickly runs she.", "She runs quickly.", "She quickly.", "Runs she quickly."], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_4_p6", topicId: 4, prompt: "Comment traduit-on 'Je mange une pomme' en anglais ?", options: ["Apple eat I.", "I an apple eat.", "I eat an apple.", "Eat I apple an."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p7", topicId: 4, prompt: "Dans la phrase 'Birds sing songs', qu'est-ce qui est le sujet ?", options: ["sing", "songs", "Birds", "song"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p8", topicId: 4, prompt: "Quelle phrase anglaise est grammaticalement correcte ?", options: ["Dog the barks.", "The barks dog.", "Barks the dog.", "The dog barks."], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_4_p9", topicId: 4, prompt: "Dans 'My sister loves chocolate', quel mot est le verbe ?", options: ["My", "sister", "loves", "chocolate"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_4_p10", topicId: 4, prompt: "Quelle est la traduction correcte de 'Le poisson nage dans l'eau' ?", options: ["The fish swims in the water.", "In water the fish swims.", "Swims fish the water.", "The water fish swims in."], correctIndex: 0)
    ],

    // MARK: Topic 5  -  Les Rimes
    5: [
        MathExamQuestion(id: "fr_teach_5_p1", topicId: 5, prompt: "Quel mot rime avec 'cat' (chat) en anglais ?", options: ["cup", "bat", "bit", "cot"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_5_p2", topicId: 5, prompt: "Quel mot rime avec 'can' (boîte) en anglais ?", options: ["pin", "pan", "man", "cane"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_5_p3", topicId: 5, prompt: "Lequel de ces mots ne rime pas avec 'hat' ?", options: ["bat", "cat", "mat", "hit"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_5_p4", topicId: 5, prompt: "Quel mot appartient à la famille de rimes '-an' ?", options: ["ban", "bin", "bone", "bun"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_5_p5", topicId: 5, prompt: "Quel mot rime avec 'run' (courir) ?", options: ["ran", "rain", "fun", "rune"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_5_p6", topicId: 5, prompt: "Parmi ces mots, lequel rime avec 'big' ?", options: ["bag", "bug", "pig", "bog"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_5_p7", topicId: 5, prompt: "Quel son partagent les mots 'cat', 'bat', 'hat' et 'mat' ?", options: ["-et", "-it", "-at", "-ut"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_5_p8", topicId: 5, prompt: "Quel nouveau mot peux-tu former en remplaçant 'c' dans 'cat' par 'r' ?", options: ["rut", "rat", "rot", "ret"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_5_p9", topicId: 5, prompt: "Quel mot rime avec 'hop' en anglais ?", options: ["hip", "hap", "top", "tip"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_5_p10", topicId: 5, prompt: "Quel mot rime avec 'bell' en anglais ?", options: ["ball", "bill", "bull", "tell"], correctIndex: 3)
    ],

    // MARK: Topic 6  -  Les Voyelles Longues
    6: [
        MathExamQuestion(id: "fr_teach_6_p1", topicId: 6, prompt: "Quel mot contient un son de voyelle longue grâce à la règle du E muet ?", options: ["cap", "can", "cake", "cab"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_6_p2", topicId: 6, prompt: "Le mot 'bike' a-t-il une voyelle longue ou courte ?", options: ["Courte  -  i court comme dans 'sit'", "Longue  -  i long comme dans 'ice'", "Pas de voyelle", "Deux voyelles courtes"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_6_p3", topicId: 6, prompt: "Qu'arrive-t-il au son de la voyelle quand on ajoute un 'e' muet à 'hop' pour faire 'hope' ?", options: ["Le son reste le même", "La voyelle devient longue", "La voyelle disparaît", "On ajoute une nouvelle voyelle"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_6_p4", topicId: 6, prompt: "Lequel de ces mots a un son 'a' long ?", options: ["cat", "can", "cab", "cake"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_6_p5", topicId: 6, prompt: "Lequel de ces mots a un son 'u' long ?", options: ["cup", "cut", "cub", "cute"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_6_p6", topicId: 6, prompt: "Quel mot a un son 'o' long ?", options: ["hot", "hop", "hog", "hope"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_6_p7", topicId: 6, prompt: "Dans le mot 'kite', quelle est la voyelle longue ?", options: ["k", "i", "t", "e"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_6_p8", topicId: 6, prompt: "Quelle paire de mots illustre la règle du E muet ?", options: ["bit / bite", "sit / sat", "hot / hit", "cap / cup"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_6_p9", topicId: 6, prompt: "Quel mot a un son 'e' long ?", options: ["bed", "red", "set", "here"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_6_p10", topicId: 6, prompt: "La règle du E muet dit que quand un mot se termine par 'e', la voyelle...", options: ["disparaît", "devient longue", "devient courte", "se double"], correctIndex: 1)
    ],

    // MARK: Topic 7  -  Les Groupes Consonantiques
    7: [
        MathExamQuestion(id: "fr_teach_7_p1", topicId: 7, prompt: "Quel groupe consonantique (blend) entend-on au début du mot 'black' ?", options: ["br", "bl", "cl", "gl"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_7_p2", topicId: 7, prompt: "Dans le digramme 'sh', quel son est produit ?", options: ["Le son de 's' puis de 'h' séparément", "Un son nouveau comme dans 'ship'", "Seulement le son de 's'", "Seulement le son de 'h'"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_7_p3", topicId: 7, prompt: "Quel digramme entend-on dans le mot 'chair' ?", options: ["sh", "th", "ch", "ph"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_7_p4", topicId: 7, prompt: "Quel groupe consonantique commence le mot 'train' ?", options: ["tr", "dr", "br", "gr"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_7_p5", topicId: 7, prompt: "Quel digramme se trouve dans le mot 'phone' ?", options: ["sh", "ch", "wh", "ph"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_7_p6", topicId: 7, prompt: "Le mot 'think' commence par quel digramme ?", options: ["sh", "ch", "th", "wh"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_7_p7", topicId: 7, prompt: "Quel mot commence par le groupe consonantique 'sp' ?", options: ["stop", "step", "spin", "slim"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_7_p8", topicId: 7, prompt: "Quelle est la différence entre un blend et un digramme ?", options: ["Il n'y a pas de différence", "Un blend garde les deux sons ; un digramme crée un son nouveau", "Un digramme garde les deux sons ; un blend crée un son nouveau", "Un blend a trois lettres"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_7_p9", topicId: 7, prompt: "Quel digramme entend-on dans le mot 'whale' ?", options: ["sh", "ch", "th", "wh"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_7_p10", topicId: 7, prompt: "Quel groupe consonantique commence le mot 'frog' ?", options: ["fl", "fr", "gr", "dr"], correctIndex: 1)
    ],

    // MARK: Topic 8  -  Les Noms et les Verbes
    8: [
        MathExamQuestion(id: "fr_teach_8_p1", topicId: 8, prompt: "Lequel de ces mots est un nom (noun) en anglais ?", options: ["run", "jump", "book", "eat"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_8_p2", topicId: 8, prompt: "Lequel de ces mots est un verbe (verb) en anglais ?", options: ["cat", "tree", "sing", "flower"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_8_p3", topicId: 8, prompt: "Dans la phrase 'The bird flies high', quel mot est le verbe ?", options: ["The", "bird", "flies", "high"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_8_p4", topicId: 8, prompt: "Quel est le pluriel de 'box' en anglais ?", options: ["boxs", "boxes", "boxi", "box"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_8_p5", topicId: 8, prompt: "Lequel de ces mots est un nom de lieu ?", options: ["happy", "school", "run", "blue"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_8_p6", topicId: 8, prompt: "Dans 'Children play in the park', quel mot est le nom de lieu ?", options: ["Children", "play", "in", "park"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_8_p7", topicId: 8, prompt: "Quel est le pluriel correct de 'child' en anglais ?", options: ["childs", "childes", "children", "child's"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_8_p8", topicId: 8, prompt: "Lequel de ces mots est un verbe d'action ?", options: ["house", "green", "swim", "table"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_8_p9", topicId: 8, prompt: "Quel est le pluriel de 'mouse' (souris) en anglais ?", options: ["mouses", "mouse", "mices", "mice"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_8_p10", topicId: 8, prompt: "Dans la phrase 'The teacher writes on the board', quel mot est un verbe ?", options: ["teacher", "writes", "board", "The"], correctIndex: 1)
    ],

    // MARK: Topic 9  -  Les Adjectifs et les Adverbes
    9: [
        MathExamQuestion(id: "fr_teach_9_p1", topicId: 9, prompt: "Lequel de ces mots est un adjectif en anglais ?", options: ["quickly", "run", "happy", "sing"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p2", topicId: 9, prompt: "Lequel de ces mots est un adverbe en anglais ?", options: ["big", "slowly", "cat", "red"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_9_p3", topicId: 9, prompt: "Dans 'The tall boy runs quickly', quel mot est l'adjectif ?", options: ["quickly", "runs", "tall", "boy"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p4", topicId: 9, prompt: "Comment forme-t-on un adverbe de manière à partir de l'adjectif 'slow' ?", options: ["slows", "slowed", "slowly", "slower"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p5", topicId: 9, prompt: "Dans 'She sings beautifully', quel mot est l'adverbe ?", options: ["She", "sings", "beautifully", "sing"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p6", topicId: 9, prompt: "Quel adjectif est l'opposé de 'big' en anglais ?", options: ["large", "huge", "small", "tall"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p7", topicId: 9, prompt: "Lequel de ces mots décrit comment quelqu'un fait une action ?", options: ["red", "house", "carefully", "dog"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p8", topicId: 9, prompt: "Dans 'The red car moves fast', quel mot est l'adjectif ?", options: ["fast", "moves", "car", "red"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_9_p9", topicId: 9, prompt: "Quel adverbe signifie 'en ce moment' en anglais ?", options: ["never", "always", "now", "yesterday"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_9_p10", topicId: 9, prompt: "Quelle phrase utilise correctement un adverbe ?", options: ["She is a quickly runner.", "She runs quickly.", "She quick runs.", "She runs quick dog."], correctIndex: 1)
    ],

    // MARK: Topic 10  -  La Ponctuation Anglaise
    10: [
        MathExamQuestion(id: "fr_teach_10_p1", topicId: 10, prompt: "Par quel signe de ponctuation se termine une question en anglais ?", options: [".", "!", "?", ","], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_10_p2", topicId: 10, prompt: "Par quel signe de ponctuation se termine une phrase déclarative en anglais ?", options: ["?", "!", ",", "."], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_10_p3", topicId: 10, prompt: "Quelle ponctuation est utilisée dans 'Wow, that is amazing!' ?", options: ["Point et virgule", "Virgule et point d'exclamation", "Deux points et point d'interrogation", "Point et point d'interrogation"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_10_p4", topicId: 10, prompt: "Laquelle de ces phrases est correctement ponctuée ?", options: ["Where is my pen.", "Where is my pen!", "Where is my pen?", "Where is my pen,"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_10_p5", topicId: 10, prompt: "Quel signe de ponctuation sépare des éléments dans une liste ?", options: [".", "?", "!", ","], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_10_p6", topicId: 10, prompt: "Laquelle de ces phrases est correctement ponctuée ?", options: ["I love pizza", "I love pizza.", "I love pizza,", "I love pizza!."], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_10_p7", topicId: 10, prompt: "Quel signe de ponctuation exprime une grande émotion ou surprise ?", options: [".", ",", "?", "!"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_10_p8", topicId: 10, prompt: "Dans la phrase 'I have a cat, a dog, and a fish', pourquoi y a-t-il des virgules ?", options: ["Pour terminer la phrase", "Pour séparer les éléments de la liste", "Pour indiquer une question", "Pour montrer de l'émotion"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_10_p9", topicId: 10, prompt: "Quelle lettre doit être une majuscule en anglais au début d'une phrase ?", options: ["La dernière lettre", "La première lettre", "Toutes les lettres", "Aucune lettre"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_10_p10", topicId: 10, prompt: "Laquelle de ces phrases utilise correctement un point d'exclamation ?", options: ["What is your name!", "She goes to school!", "Watch out!", "Is it raining!"], correctIndex: 2)
    ],

    // MARK: Topic 11  -  Les Mots Composés
    11: [
        MathExamQuestion(id: "fr_teach_11_p1", topicId: 11, prompt: "Quel mot composé se forme avec 'sun' + 'shine' ?", options: ["sunlight", "sunshine", "sunray", "sunburn"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_11_p2", topicId: 11, prompt: "Quelle est la contraction de 'do not' en anglais ?", options: ["dont", "do'nt", "don't", "d'ont"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_11_p3", topicId: 11, prompt: "Quel mot composé se forme avec 'foot' + 'ball' ?", options: ["footrun", "footplay", "football", "footsport"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_11_p4", topicId: 11, prompt: "Quelle est la contraction de 'I am' en anglais ?", options: ["I'am", "Im", "I'm", "Iam"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_11_p5", topicId: 11, prompt: "Quel mot composé signifie 'chambre à coucher' ?", options: ["bathhouse", "bedroom", "bednight", "roombed"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_11_p6", topicId: 11, prompt: "Quelle est la contraction de 'cannot' ou 'can not' ?", options: ["can't", "cant", "can'not", "ca'nt"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_11_p7", topicId: 11, prompt: "Lequel de ces mots est un mot composé ?", options: ["happy", "rainbow", "quickly", "reads"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_11_p8", topicId: 11, prompt: "Que signifie la contraction 'she's' en anglais ?", options: ["she has / she is", "she was", "she will", "she does"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_11_p9", topicId: 11, prompt: "Quel mot composé se forme avec 'book' + 'shelf' ?", options: ["bookcase", "bookstand", "bookshelf", "bookrack"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_11_p10", topicId: 11, prompt: "Quelle est la contraction de 'they are' ?", options: ["their", "there", "they're", "theyare"], correctIndex: 2)
    ],

    // MARK: Topic 12  -  Les Préfixes et Suffixes
    12: [
        MathExamQuestion(id: "fr_teach_12_p1", topicId: 12, prompt: "Quel est le sens du préfixe 'un-' dans le mot 'unhappy' ?", options: ["très", "encore", "pas / non", "avant"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_12_p2", topicId: 12, prompt: "Que signifie le suffixe '-ful' dans le mot 'beautiful' ?", options: ["sans", "plein de", "encore", "pas"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_12_p3", topicId: 12, prompt: "Quel mot se forme avec le préfixe 're-' + 'do' ?", options: ["undo", "redo", "overdo", "misdo"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_12_p4", topicId: 12, prompt: "Que signifie le suffixe '-less' dans le mot 'homeless' ?", options: ["plein de", "encore", "sans", "très"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_12_p5", topicId: 12, prompt: "Comment forme-t-on le comparatif de supériorité de 'fast' en ajoutant un suffixe ?", options: ["fastest", "faster", "fastly", "fastful"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_12_p6", topicId: 12, prompt: "Quel suffixe indique le superlatif (le plus...) en anglais ?", options: ["-er", "-ly", "-est", "-ful"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_12_p7", topicId: 12, prompt: "Quelle est la forme '-ing' du verbe 'run' ?", options: ["runing", "runned", "running", "runns"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_12_p8", topicId: 12, prompt: "Quel mot contient le préfixe 're-' signifiant 'encore' ?", options: ["really", "ready", "rewrite", "result"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_12_p9", topicId: 12, prompt: "Que signifie 'careless' en anglais (care + -less) ?", options: ["très attentif", "sans soin / négligent", "plein de soin", "refaire"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_12_p10", topicId: 12, prompt: "Quelle est la forme passé (-ed) du verbe 'walk' ?", options: ["walking", "walked", "walks", "walker"], correctIndex: 1)
    ],

    // MARK: Topic 13  -  Les Synonymes et Antonymes
    13: [
        MathExamQuestion(id: "fr_teach_13_p1", topicId: 13, prompt: "Quel est le synonyme de 'happy' en anglais ?", options: ["sad", "angry", "joyful", "tired"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p2", topicId: 13, prompt: "Quel est l'antonyme de 'big' en anglais ?", options: ["large", "huge", "tall", "small"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_13_p3", topicId: 13, prompt: "Quel est le synonyme de 'fast' en anglais ?", options: ["slow", "quick", "calm", "soft"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_13_p4", topicId: 13, prompt: "Quel est l'antonyme de 'hot' en anglais ?", options: ["warm", "cool", "cold", "frozen"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p5", topicId: 13, prompt: "Quel mot est un synonyme de 'begin' (commencer) en anglais ?", options: ["finish", "end", "start", "stop"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p6", topicId: 13, prompt: "Quel est l'antonyme de 'day' (jour) en anglais ?", options: ["morning", "evening", "night", "noon"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p7", topicId: 13, prompt: "Quel mot est un synonyme de 'big' (grand) en anglais ?", options: ["tiny", "small", "large", "little"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p8", topicId: 13, prompt: "Quel est l'antonyme de 'love' (aimer) en anglais ?", options: ["like", "enjoy", "hate", "prefer"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p9", topicId: 13, prompt: "Quel mot est un synonyme de 'sad' (triste) en anglais ?", options: ["happy", "joyful", "unhappy", "glad"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_13_p10", topicId: 13, prompt: "Quel est l'antonyme de 'open' (ouvert) en anglais ?", options: ["wide", "shut", "unlock", "spread"], correctIndex: 1)
    ],

    // MARK: Topic 14  -  La Compréhension
    14: [
        MathExamQuestion(id: "fr_teach_14_p1", topicId: 14, prompt: "Quelle question en anglais demande 'Qui ?' ?", options: ["What?", "Where?", "Who?", "When?"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_14_p2", topicId: 14, prompt: "Quelle question en anglais demande 'Pourquoi ?' ?", options: ["Who?", "How?", "Where?", "Why?"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_14_p3", topicId: 14, prompt: "Lis : 'Emma went to the library on Saturday to borrow books.' Qui est le personnage principal ?", options: ["The library", "Saturday", "Emma", "The books"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_14_p4", topicId: 14, prompt: "Lis : 'Emma went to the library on Saturday to borrow books.' Quand est-elle allée à la bibliothèque ?", options: ["On Sunday", "On Saturday", "On Monday", "On Friday"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_14_p5", topicId: 14, prompt: "Quelle question en anglais demande 'Comment ?' ?", options: ["Why?", "What?", "Where?", "How?"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_14_p6", topicId: 14, prompt: "L'idée principale d'un texte est...", options: ["Un détail spécifique du texte", "Le sujet central du texte", "Le dernier mot du texte", "Le nom de l'auteur"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_14_p7", topicId: 14, prompt: "Lis : 'Tom loves football. He plays every day after school.' Quelle est l'idée principale ?", options: ["Tom goes to school.", "Tom plays every day.", "Tom loves football.", "School is fun."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_14_p8", topicId: 14, prompt: "Quelle question en anglais demande 'Où ?' ?", options: ["When?", "Who?", "Where?", "Why?"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_14_p9", topicId: 14, prompt: "Lis : 'Emma went to the library on Saturday to borrow books.' Pourquoi est-elle allée à la bibliothèque ?", options: ["To study", "To meet friends", "To borrow books", "To buy books"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_14_p10", topicId: 14, prompt: "Quelle question en anglais demande 'Quoi ?' ?", options: ["Who?", "What?", "When?", "How?"], correctIndex: 1)
    ],

    // MARK: Topic 15  -  Les Éléments du Récit
    15: [
        MathExamQuestion(id: "fr_teach_15_p1", topicId: 15, prompt: "Dans un récit anglais, qu'est-ce que le 'setting' (cadre) ?", options: ["Le problème de l'histoire", "L'endroit et le moment où se passe l'histoire", "Le personnage principal", "La solution du problème"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_15_p2", topicId: 15, prompt: "Qu'est-ce qu'un 'character' (personnage) dans un récit ?", options: ["L'endroit de l'histoire", "Ce qui se passe dans l'histoire", "Une personne ou un animal dans l'histoire", "La fin de l'histoire"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_15_p3", topicId: 15, prompt: "Dans 'The Three Little Pigs', quel est le 'problem' (problème) ?", options: ["Les cochons construisent des maisons.", "Le loup veut détruire les maisons des cochons.", "Les cochons sont des frères.", "Le loup est grand."], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_15_p4", topicId: 15, prompt: "Qu'est-ce que le 'plot' (intrigue) d'un récit ?", options: ["L'endroit où se passe l'histoire", "Ce qui se passe dans l'histoire (les événements)", "Le personnage principal", "La morale de l'histoire"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_15_p5", topicId: 15, prompt: "Qu'est-ce que la 'solution' dans un récit ?", options: ["Le début de l'histoire", "Le problème principal", "Comment le problème est résolu", "Le cadre de l'histoire"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_15_p6", topicId: 15, prompt: "Dans 'Cinderella', où se passe une grande partie de l'histoire ? (setting)", options: ["In a forest", "In a castle and a house", "In a school", "In a city"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_15_p7", topicId: 15, prompt: "Combien d'éléments principaux composent un récit selon les 5 éléments classiques ?", options: ["3", "4", "5", "6"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_15_p8", topicId: 15, prompt: "Qui est le 'protagonist' (protagoniste) dans un récit ?", options: ["Le méchant de l'histoire", "Le personnage principal", "L'auteur de l'histoire", "Le narrateur"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_15_p9", topicId: 15, prompt: "Dans 'Jack and the Beanstalk', quel est le cadre (setting) principal ?", options: ["Jack's house and the giant's castle in the sky", "A forest and a river", "A school and a playground", "A market and a farm"], correctIndex: 0),
        MathExamQuestion(id: "fr_teach_15_p10", topicId: 15, prompt: "Dans un récit, le 'conflict' (conflit) est...", options: ["La solution du problème", "Le cadre de l'histoire", "Le problème ou défi principal", "Le personnage secondaire"], correctIndex: 2)
    ],

    // MARK: Topic 16  -  Les Types de Phrases
    16: [
        MathExamQuestion(id: "fr_teach_16_p1", topicId: 16, prompt: "Laquelle de ces phrases est interrogative en anglais ?", options: ["The dog runs fast.", "Run, dog, run!", "Does the dog run fast?", "The dog is running."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_16_p2", topicId: 16, prompt: "Laquelle de ces phrases est déclarative en anglais ?", options: ["Is the sky blue?", "The sky is blue.", "How blue the sky is!", "Look at the blue sky."], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_16_p3", topicId: 16, prompt: "Laquelle de ces phrases est exclamative en anglais ?", options: ["The cat is big.", "Is the cat big?", "What a big cat!", "Feed the cat."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_16_p4", topicId: 16, prompt: "Laquelle de ces phrases est impérative (donne un ordre) en anglais ?", options: ["She opens the door.", "Does she open the door?", "Open the door!", "She opened the door."], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_16_p5", topicId: 16, prompt: "Par quoi se termine généralement une phrase impérative ?", options: ["? seulement", ". ou !", "? ou ,", ". ou ,"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_16_p6", topicId: 16, prompt: "La phrase 'What time is it?' est quel type de phrase ?", options: ["Déclarative", "Impérative", "Exclamative", "Interrogative"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_16_p7", topicId: 16, prompt: "La phrase 'Please sit down.' est quel type de phrase ?", options: ["Déclarative", "Impérative", "Interrogative", "Exclamative"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_16_p8", topicId: 16, prompt: "La phrase 'I love learning English.' est quel type de phrase ?", options: ["Interrogative", "Impérative", "Déclarative", "Exclamative"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_16_p9", topicId: 16, prompt: "La phrase 'How wonderful this day is!' est quel type de phrase ?", options: ["Déclarative", "Interrogative", "Impérative", "Exclamative"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_16_p10", topicId: 16, prompt: "Quelle phrase est une phrase impérative en anglais ?", options: ["She eats vegetables.", "Does she eat vegetables?", "Eat your vegetables!", "How she eats vegetables!"], correctIndex: 2)
    ],

    // MARK: Topic 17  -  Les Homophones Anglais
    17: [
        MathExamQuestion(id: "fr_teach_17_p1", topicId: 17, prompt: "Quelle est la différence entre 'there', 'their' et 'they're' ?", options: ["Ce sont trois façons d'écrire le même mot", "'there' = lieu, 'their' = possessif, 'they're' = they are", "'their' = lieu, 'there' = possessif, 'they're' = they were", "Ils ont des prononciations différentes"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p2", topicId: 17, prompt: "Complète : 'The children are going to ___ grandmother's house.'", options: ["there", "they're", "their", "theyre"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_17_p3", topicId: 17, prompt: "Quelle est la différence entre 'your' et 'you're' ?", options: ["Ce sont deux mots identiques", "'your' = possessif, 'you're' = you are", "'you're' = possessif, 'your' = you are", "Il n'y a pas de différence"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p4", topicId: 17, prompt: "Complète : '___ going to love this book!' (Tu vas adorer ce livre !)", options: ["Your", "You're", "Youre", "Yor"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p5", topicId: 17, prompt: "Quelle est la différence entre 'to', 'too' et 'two' ?", options: ["'to' = aussi, 'too' = numéro 2, 'two' = direction", "'to' = direction/infinitif, 'too' = aussi, 'two' = le chiffre 2", "Ce sont des synonymes", "Ils ont des prononciations différentes"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p6", topicId: 17, prompt: "Complète : 'I have ___ cats.' (J'ai deux chats.)", options: ["to", "too", "two", "tow"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_17_p7", topicId: 17, prompt: "Quelle est la différence entre 'its' et 'it's' ?", options: ["'its' = it is, 'it's' = possessif", "'its' = possessif, 'it's' = it is/it has", "Ce sont deux mots identiques", "'its' = there is, 'it's' = it was"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p8", topicId: 17, prompt: "Complète : 'The dog wagged ___ tail.' (Le chien a remué sa queue.)", options: ["it's", "its", "its'", "it is"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_17_p9", topicId: 17, prompt: "Complète : 'Put your bag over ___.' (Mets ton sac là-bas.)", options: ["their", "they're", "there", "the're"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_17_p10", topicId: 17, prompt: "Complète : 'I want to come ___!' (Je veux venir aussi !)", options: ["to", "two", "too", "tow"], correctIndex: 2)
    ],

    // MARK: Topic 18  -  Les Parties du Discours
    18: [
        MathExamQuestion(id: "fr_teach_18_p1", topicId: 18, prompt: "Qu'est-ce qu'un pronom (pronoun) en anglais ?", options: ["Un mot qui décrit un nom", "Un mot qui remplace un nom", "Un mot qui indique une action", "Un mot qui montre une relation"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_18_p2", topicId: 18, prompt: "Lequel de ces mots est une préposition (preposition) en anglais ?", options: ["run", "happy", "under", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_18_p3", topicId: 18, prompt: "Dans 'She put the book on the table', quel mot est un pronom ?", options: ["book", "She", "table", "put"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_18_p4", topicId: 18, prompt: "Lequel de ces mots est un pronom personnel en anglais ?", options: ["happy", "they", "book", "run"], correctIndex: 1),
        MathExamQuestion(id: "fr_teach_18_p5", topicId: 18, prompt: "Dans 'The cat is under the table', quelle est la préposition ?", options: ["cat", "is", "under", "table"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_18_p6", topicId: 18, prompt: "Combien de parties du discours principales y a-t-il en anglais selon la leçon ?", options: ["4", "5", "6", "8"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_18_p7", topicId: 18, prompt: "Dans 'They quickly ran to the park', identifie le pronom.", options: ["quickly", "ran", "They", "park"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_18_p8", topicId: 18, prompt: "Quelle préposition signifie 'sur' (sur une surface) en anglais ?", options: ["in", "at", "on", "by"], correctIndex: 2),
        MathExamQuestion(id: "fr_teach_18_p9", topicId: 18, prompt: "Dans la phrase 'I, he, she, we, they', quelle partie du discours est représentée ?", options: ["Noms", "Verbes", "Adjectifs", "Pronoms"], correctIndex: 3),
        MathExamQuestion(id: "fr_teach_18_p10", topicId: 18, prompt: "Quelle préposition utilise-t-on pour une adresse ou un lieu précis en anglais ?", options: ["in", "on", "at", "by"], correctIndex: 2)
    ]
]

// MARK: - Exam Questions (10 per topic)

let frTeachingExamA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1 Exam  -  L'Alphabet Anglais
    1: [
        MathExamQuestion(id: "fr_exam_1_e1", topicId: 1, prompt: "Quelles sont les cinq voyelles de l'alphabet anglais ?", options: ["a, e, i, o, u", "a, b, c, d, e", "a, e, i, y, u", "e, i, o, u, w"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_1_e2", topicId: 1, prompt: "Quelle lettre vient juste après 'M' dans l'alphabet anglais ?", options: ["L", "K", "N", "O"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_1_e3", topicId: 1, prompt: "La lettre 'Y' en anglais est-elle une voyelle ou une consonne ?", options: ["Toujours une voyelle", "Toujours une consonne", "Elle peut être les deux selon sa position", "Ni l'un ni l'autre"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_1_e4", topicId: 1, prompt: "Quelle lettre vient juste avant 'Z' dans l'alphabet anglais ?", options: ["X", "Y", "W", "V"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_1_e5", topicId: 1, prompt: "Parmi ces séries, laquelle représente les lettres de l'alphabet anglais dans le bon ordre ?", options: ["A, C, B, D", "A, B, D, C", "A, B, C, D", "B, A, C, D"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_1_e6", topicId: 1, prompt: "Laquelle de ces lettres n'existe pas dans l'alphabet anglais ?", options: ["W", "X", "Ñ", "Z"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_1_e7", topicId: 1, prompt: "Quelle est la 13ème lettre de l'alphabet anglais ?", options: ["L", "M", "N", "K"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_1_e8", topicId: 1, prompt: "Quel mot anglais commence par une voyelle ?", options: ["Bird", "Cat", "Apple", "Dog"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_1_e9", topicId: 1, prompt: "Dans le mot 'elephant', quelle est la première lettre ?", options: ["A", "E", "L", "H"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_1_e10", topicId: 1, prompt: "Combien de lettres y a-t-il entre 'A' et 'E' dans l'alphabet anglais ?", options: ["2", "3", "4", "5"], correctIndex: 1)
    ],

    // MARK: Topic 2 Exam  -  Les Voyelles Courtes
    2: [
        MathExamQuestion(id: "fr_exam_2_e1", topicId: 2, prompt: "Quel son de voyelle courte entend-on dans le mot 'bed' (lit) ?", options: ["a court", "e court", "i court", "o court"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_2_e2", topicId: 2, prompt: "Quel mot a le même son de voyelle courte que 'dog' ?", options: ["doe", "dote", "hop", "hole"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_2_e3", topicId: 2, prompt: "Lequel de ces mots n'a pas de voyelle courte ?", options: ["sit", "cat", "bike", "bed"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_2_e4", topicId: 2, prompt: "Quel son de voyelle courte entend-on dans le mot 'fun' (amusant) ?", options: ["a court", "e court", "i court", "u court"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_2_e5", topicId: 2, prompt: "Dans quel groupe les mots ont-ils tous le son 'a' court ?", options: ["cat, bat, mat", "cake, make, lake", "cat, cake, made", "bat, bake, late"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_2_e6", topicId: 2, prompt: "Lequel de ces mots a un son 'o' court ?", options: ["note", "bone", "rope", "fog"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_2_e7", topicId: 2, prompt: "Quel mot a le même son de voyelle courte que 'pig' ?", options: ["pile", "pine", "pin", "pie"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_2_e8", topicId: 2, prompt: "Lequel de ces groupes contient uniquement des mots avec une voyelle courte ?", options: ["sit, bit, fit", "site, bite, kite", "sit, bite, fit", "site, bit, kite"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_2_e9", topicId: 2, prompt: "Quel est l'exemple de la voyelle courte 'e' ?", options: ["tree", "bead", "red", "feel"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_2_e10", topicId: 2, prompt: "Dans quelle paire les deux mots ont-ils la même voyelle courte ?", options: ["cup / cap", "cup / bug", "cap / cape", "bug / huge"], correctIndex: 1)
    ],

    // MARK: Topic 3 Exam  -  Les Mots Fréquents
    3: [
        MathExamQuestion(id: "fr_exam_3_e1", topicId: 3, prompt: "Laquelle de ces phrases utilise correctement 'the' ?", options: ["The a dog is big.", "A the dog big.", "The dog is big.", "Dog the is big."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e2", topicId: 3, prompt: "Complète : 'My friends ___ at the park.' (Mes amis sont au parc.)", options: ["is", "am", "are", "was"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e3", topicId: 3, prompt: "Complète : 'She ___ born in Paris.' (Elle est née à Paris.)", options: ["is", "are", "am", "was"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_3_e4", topicId: 3, prompt: "Quel mot fréquent signifie 'dit' (passé de dire) en anglais ?", options: ["say", "says", "said", "saying"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e5", topicId: 3, prompt: "Lequel de ces mots est un mot fréquent (sight word) en anglais ?", options: ["elephant", "mountain", "the", "complicated"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e6", topicId: 3, prompt: "Complète : 'I ___ a new book.' (J'ai un nouveau livre.)", options: ["is", "am", "have", "are"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e7", topicId: 3, prompt: "Quelle phrase utilise correctement le mot fréquent 'from' ?", options: ["I from am France.", "I am from France.", "From I am France.", "I am France from."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_3_e8", topicId: 3, prompt: "Complète : '___ do you live?' (Où habites-tu ?)", options: ["Who", "What", "Where", "When"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e9", topicId: 3, prompt: "Lequel de ces mots est un mot fréquent pour exprimer la possession ?", options: ["run", "big", "have", "jump"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_3_e10", topicId: 3, prompt: "Complète : '___ name is Lena.' (Son prénom est Lena.)", options: ["She", "Her", "Hers", "She's"], correctIndex: 1)
    ],

    // MARK: Topic 4 Exam  -  Les Phrases Simples
    4: [
        MathExamQuestion(id: "fr_exam_4_e1", topicId: 4, prompt: "Laquelle de ces phrases est grammaticalement correcte en anglais ?", options: ["Plays soccer he.", "He soccer plays.", "He plays soccer.", "Soccer plays he."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e2", topicId: 4, prompt: "Dans 'My mother bakes delicious cakes', quel est le sujet ?", options: ["bakes", "delicious", "cakes", "My mother"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_4_e3", topicId: 4, prompt: "Quelle est la structure correcte d'une phrase anglaise simple ?", options: ["Objet + Verbe + Sujet", "Verbe + Sujet + Objet", "Sujet + Verbe + Objet", "Objet + Sujet + Verbe"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e4", topicId: 4, prompt: "Dans 'The children draw pictures', quel est l'objet ?", options: ["The children", "draw", "pictures", "The"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e5", topicId: 4, prompt: "Traduis en anglais : 'Elle mange une orange.'", options: ["Orange eats she an.", "She an orange eats.", "She eats an orange.", "Eats she an orange."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e6", topicId: 4, prompt: "Laquelle de ces phrases est incorrecte grammaticalement ?", options: ["The dog barks.", "She reads books.", "Runs the cat fast.", "We play football."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e7", topicId: 4, prompt: "Dans 'My dad drives a blue car', quel est le verbe ?", options: ["My dad", "drives", "blue", "car"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_4_e8", topicId: 4, prompt: "Quelle phrase complète a le bon ordre des mots en anglais ?", options: ["Milk drinks the baby.", "Drinks the baby milk.", "The baby drinks milk.", "Milk the baby drinks."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_4_e9", topicId: 4, prompt: "Dans 'Our team won the championship', quel est le sujet ?", options: ["team", "won", "championship", "Our team"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_4_e10", topicId: 4, prompt: "Traduis en anglais : 'Les oiseaux chantent des chansons.'", options: ["Songs sing the birds.", "The birds sing songs.", "Sing birds songs the.", "Birds the songs sing."], correctIndex: 1)
    ],

    // MARK: Topic 5 Exam  -  Les Rimes
    5: [
        MathExamQuestion(id: "fr_exam_5_e1", topicId: 5, prompt: "Lequel de ces mots rime avec 'night' en anglais ?", options: ["not", "net", "light", "note"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_5_e2", topicId: 5, prompt: "Quel groupe de mots contient uniquement des rimes ?", options: ["cat, dog, fish", "cat, bat, hat", "cat, sit, cup", "bat, bed, bug"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_5_e3", topicId: 5, prompt: "Quel mot ne rime pas avec 'make' en anglais ?", options: ["cake", "lake", "take", "mile"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_5_e4", topicId: 5, prompt: "Quel son partagent les mots 'king', 'ring', 'sing' et 'wing' ?", options: ["-ing", "-ong", "-ang", "-ung"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_5_e5", topicId: 5, prompt: "Quel nouveau mot peux-tu former en remplaçant le 'h' dans 'hop' par 'p' ?", options: ["hep", "hip", "pop", "pip"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_5_e6", topicId: 5, prompt: "Quel mot rime avec 'play' en anglais ?", options: ["pile", "plus", "day", "pill"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_5_e7", topicId: 5, prompt: "Quel mot appartient à la famille de rimes '-ight' ?", options: ["sight", "site", "sit", "sip"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_5_e8", topicId: 5, prompt: "Les mots 'fun', 'run' et 'sun' appartiennent à quelle famille de rimes ?", options: ["-an", "-in", "-un", "-on"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_5_e9", topicId: 5, prompt: "Quel mot rime avec 'tree' en anglais ?", options: ["try", "trip", "true", "free"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_5_e10", topicId: 5, prompt: "Quel mot ne rime pas avec les autres ?", options: ["cake", "make", "take", "tick"], correctIndex: 3)
    ],

    // MARK: Topic 6 Exam  -  Les Voyelles Longues
    6: [
        MathExamQuestion(id: "fr_exam_6_e1", topicId: 6, prompt: "Quelle paire de mots illustre la règle du E muet (la voyelle devient longue) ?", options: ["hop / hip", "hop / hope", "hop / hoop", "hip / rip"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_6_e2", topicId: 6, prompt: "Lequel de ces mots a un son 'i' long ?", options: ["bit", "sit", "hit", "kite"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_6_e3", topicId: 6, prompt: "Lequel de ces mots n'a pas de voyelle longue ?", options: ["cake", "bike", "hope", "dog"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_6_e4", topicId: 6, prompt: "Quel groupe contient uniquement des mots avec des voyelles longues ?", options: ["cat, big, hop", "cake, bike, hope", "cat, bike, hope", "cake, big, cup"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_6_e5", topicId: 6, prompt: "Si on ajoute un 'e' muet à 'cut', quel mot obtient-on et quel son a-t-il ?", options: ["cute  -  u long", "cute  -  u court", "cutte  -  u long", "cuto  -  u long"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_6_e6", topicId: 6, prompt: "Quel mot a un son 'a' long ?", options: ["man", "cap", "rain", "can"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_6_e7", topicId: 6, prompt: "Quel mot a un son 'o' long comme dans 'hope' ?", options: ["hot", "fond", "boat", "fog"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_6_e8", topicId: 6, prompt: "La règle du E muet s'applique-t-elle au mot 'have' ?", options: ["Oui, le 'a' dans 'have' est long", "Non, 'have' est une exception à la règle", "Oui, le 'e' final change le son", "Non, 'have' n'a pas de voyelle"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_6_e9", topicId: 6, prompt: "Quel mot a un son 'e' long comme dans 'tree' ?", options: ["red", "bed", "set", "green"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_6_e10", topicId: 6, prompt: "Si on enlève le 'e' final du mot 'pine', comment change le son ?", options: ["Le son du 'i' devient long", "Le son du 'i' devient court", "Le mot n'a plus de sens", "Le son ne change pas"], correctIndex: 1)
    ],

    // MARK: Topic 7 Exam  -  Les Groupes Consonantiques
    7: [
        MathExamQuestion(id: "fr_exam_7_e1", topicId: 7, prompt: "Quel digramme entend-on dans le mot 'think' ?", options: ["sh", "ch", "th", "wh"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e2", topicId: 7, prompt: "Lequel de ces mots commence par un blend consonantique ?", options: ["apple", "orange", "grape", "ice"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e3", topicId: 7, prompt: "Quel blend consonantique commence le mot 'clap' ?", options: ["cr", "gl", "cl", "fl"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e4", topicId: 7, prompt: "Quel digramme se trouve dans le mot 'shape' ?", options: ["sh", "ch", "th", "ph"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_7_e5", topicId: 7, prompt: "Quel mot contient le digramme 'ph' qui se prononce comme 'f' ?", options: ["shop", "chip", "phone", "thin"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e6", topicId: 7, prompt: "Quel blend consonantique commence le mot 'smile' ?", options: ["sl", "sp", "sn", "sm"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_7_e7", topicId: 7, prompt: "Dans le mot 'spring', combien de consonnes forment le blend initial ?", options: ["1", "2", "3", "4"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e8", topicId: 7, prompt: "Quel est le digramme dans le mot 'wheel' ?", options: ["sh", "wh", "ch", "th"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_7_e9", topicId: 7, prompt: "Quel mot commence par le blend 'st' ?", options: ["sleep", "snap", "star", "swim"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_7_e10", topicId: 7, prompt: "Lequel de ces mots contient un digramme ?", options: ["black", "plant", "choose", "strap"], correctIndex: 2)
    ],

    // MARK: Topic 8 Exam  -  Les Noms et les Verbes
    8: [
        MathExamQuestion(id: "fr_exam_8_e1", topicId: 8, prompt: "Lequel de ces groupes contient uniquement des noms ?", options: ["run, jump, swim", "table, chair, window", "big, small, tall", "quickly, slowly, softly"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_8_e2", topicId: 8, prompt: "Lequel de ces groupes contient uniquement des verbes ?", options: ["happy, sad, tired", "school, park, river", "eat, sleep, run", "red, blue, green"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e3", topicId: 8, prompt: "Quel est le pluriel de 'tooth' (dent) en anglais ?", options: ["tooths", "teeth", "toothes", "tooth"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_8_e4", topicId: 8, prompt: "Dans 'The pilot flies the plane', quel mot est un verbe ?", options: ["pilot", "plane", "flies", "The"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e5", topicId: 8, prompt: "Quel est le pluriel de 'fox' (renard) en anglais ?", options: ["foxs", "foxen", "foxes", "fox"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e6", topicId: 8, prompt: "Lequel de ces mots peut être à la fois un nom ET un verbe en anglais ?", options: ["big", "quickly", "run", "red"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e7", topicId: 8, prompt: "Quel est le pluriel de 'leaf' (feuille) en anglais ?", options: ["leafs", "leafes", "leaves", "leafe"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e8", topicId: 8, prompt: "Dans 'Scientists discover new planets', quel mot est le verbe ?", options: ["Scientists", "new", "planets", "discover"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_8_e9", topicId: 8, prompt: "Quel est le pluriel de 'woman' (femme) en anglais ?", options: ["womans", "womens", "women", "woman"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_8_e10", topicId: 8, prompt: "Lequel de ces noms est un nom propre en anglais ?", options: ["city", "river", "London", "mountain"], correctIndex: 2)
    ],

    // MARK: Topic 9 Exam  -  Les Adjectifs et les Adverbes
    9: [
        MathExamQuestion(id: "fr_exam_9_e1", topicId: 9, prompt: "Lequel de ces groupes contient uniquement des adjectifs en anglais ?", options: ["quickly, slowly, softly", "run, jump, eat", "big, happy, cold", "always, never, now"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_9_e2", topicId: 9, prompt: "Comment dit-on 'le plus grand' (superlatif de 'tall') en anglais ?", options: ["taller", "most tall", "tallest", "more tall"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_9_e3", topicId: 9, prompt: "Dans 'The extremely happy child laughed loudly', quel mot est un adverbe modifiant l'adjectif ?", options: ["happy", "child", "extremely", "laughed"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_9_e4", topicId: 9, prompt: "Quel adverbe est le synonyme de 'quickly' (rapidement) en anglais ?", options: ["slowly", "swiftly", "calmly", "gently"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_9_e5", topicId: 9, prompt: "Quel est le comparatif de supériorité de 'good' en anglais ?", options: ["gooder", "more good", "better", "best"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_9_e6", topicId: 9, prompt: "Quelle phrase utilise correctement un adjectif en anglais ?", options: ["She runs beautiful.", "She is a beautiful singer.", "She sings beautiful.", "Beautiful she runs."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_9_e7", topicId: 9, prompt: "Dans 'The old man walked very slowly', combien y a-t-il d'adverbes ?", options: ["1", "2", "3", "0"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_9_e8", topicId: 9, prompt: "Quel est l'adverbe formé à partir de l'adjectif 'careful' ?", options: ["carefuly", "carefuler", "carefully", "more careful"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_9_e9", topicId: 9, prompt: "Quel adjectif décrit la couleur en anglais ?", options: ["softly", "golden", "running", "often"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_9_e10", topicId: 9, prompt: "Dans 'She always arrives early', quel mot est un adverbe de fréquence ?", options: ["She", "always", "arrives", "early"], correctIndex: 1)
    ],

    // MARK: Topic 10 Exam  -  La Ponctuation Anglaise
    10: [
        MathExamQuestion(id: "fr_exam_10_e1", topicId: 10, prompt: "Laquelle de ces phrases est correctement ponctuée ?", options: ["Can you help me.", "Can you help me!", "Can you help me?", "Can you help me,"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_10_e2", topicId: 10, prompt: "Quelle ponctuation manque dans 'I like cats dogs and fish' ?", options: ["Des points d'exclamation", "Des virgules entre les éléments", "Des points d'interrogation", "Des apostrophes"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_10_e3", topicId: 10, prompt: "Laquelle de ces phrases est correctement ponctuée ?", options: ["Stop! Don't move.", "Stop Don't move.", "Stop? Don't move!", "Stop. Don't Move,"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_10_e4", topicId: 10, prompt: "Pourquoi 'London' commence-t-il par une majuscule en anglais ?", options: ["C'est le premier mot de la phrase", "C'est un nom propre", "C'est un verbe important", "C'est un adjectif"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_10_e5", topicId: 10, prompt: "Laquelle de ces phrases utilise correctement l'apostrophe ?", options: ["The dog's bowl is full.", "The dogs bowl is full.", "The dog,s bowl is full.", "The dog;s bowl is full."], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_10_e6", topicId: 10, prompt: "Combien de virgules sont nécessaires dans 'I bought apples oranges bananas and grapes' ?", options: ["1", "2", "3", "4"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_10_e7", topicId: 10, prompt: "Laquelle de ces phrases est correctement ponctuée ?", options: ["she lives in paris", "She lives in Paris.", "She lives in paris.", "she Lives in Paris."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_10_e8", topicId: 10, prompt: "Quel signe de ponctuation suit 'Dear Tom' dans une lettre informelle en anglais ?", options: [".", "?", "!", ","], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_10_e9", topicId: 10, prompt: "Laquelle de ces phrases utilise correctement le point d'exclamation ?", options: ["What is your name!?", "Happy birthday!", "She goes to school!", "I like tea!,"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_10_e10", topicId: 10, prompt: "Dans la phrase 'My favourite colours are red, blue, and green.', combien de signes de ponctuation y a-t-il en tout ?", options: ["2", "3", "4", "5"], correctIndex: 1)
    ],

    // MARK: Topic 11 Exam  -  Les Mots Composés
    11: [
        MathExamQuestion(id: "fr_exam_11_e1", topicId: 11, prompt: "Quel mot composé se forme avec 'birth' + 'day' ?", options: ["birthday", "birthtime", "daybirm", "birthnite"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_11_e2", topicId: 11, prompt: "Quelle est la forme complète de la contraction 'won't' ?", options: ["will not", "was not", "would not", "want not"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_11_e3", topicId: 11, prompt: "Quel mot composé se forme avec 'over' + 'night' ?", options: ["overday", "overnight", "nightly", "overlit"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_11_e4", topicId: 11, prompt: "Quelle est la forme complète de 'we're' ?", options: ["we were", "we are", "we will", "we have"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_11_e5", topicId: 11, prompt: "Quel mot composé signifie 'coucher de soleil' en anglais ?", options: ["sunlight", "sunrise", "sunset", "sunburn"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_11_e6", topicId: 11, prompt: "Quelle contraction est correctement écrite ?", options: ["i'am", "Im'", "I'm", "Iam'"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_11_e7", topicId: 11, prompt: "Quel mot composé se forme avec 'rain' + 'bow' ?", options: ["rainfall", "raincoat", "rainbow", "raindrop"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_11_e8", topicId: 11, prompt: "Quelle est la forme complète de 'he's' selon le contexte 'He's my brother' ?", options: ["he was", "he has", "he is", "he will"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_11_e9", topicId: 11, prompt: "Quel mot composé se forme avec 'cup' + 'cake' ?", options: ["cupcookie", "cakecup", "cupcake", "cupsweet"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_11_e10", topicId: 11, prompt: "Laquelle de ces contractions est correctement orthographiée ?", options: ["havent", "haven't", "hav'nt", "ha'vent"], correctIndex: 1)
    ],

    // MARK: Topic 12 Exam  -  Les Préfixes et Suffixes
    12: [
        MathExamQuestion(id: "fr_exam_12_e1", topicId: 12, prompt: "Que signifie le mot 'unbelievable' (un- + believable) en anglais ?", options: ["très croyable", "incroyable", "encore croyable", "presque croyable"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_12_e2", topicId: 12, prompt: "Quel suffixe ajoute-t-on à 'help' pour former 'helpful' ?", options: ["-less", "-ful", "-ing", "-ed"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_12_e3", topicId: 12, prompt: "Que signifie 'reread' (re- + read) ?", options: ["lire avant", "ne pas lire", "lire à nouveau", "lire vite"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_12_e4", topicId: 12, prompt: "Quel est le superlatif (le plus long) de 'long' en anglais ?", options: ["longer", "most long", "longest", "more long"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_12_e5", topicId: 12, prompt: "Que signifie 'powerless' (power + -less) en anglais ?", options: ["plein de pouvoir", "sans pouvoir / impuissant", "très puissant", "refaire"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_12_e6", topicId: 12, prompt: "Quelle est la forme en '-ing' du verbe 'write' ?", options: ["writeing", "writeing", "writting", "writing"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_12_e7", topicId: 12, prompt: "Que signifie le préfixe 'mis-' dans le mot 'misunderstand' ?", options: ["encore", "trop", "mal / incorrectement", "pas du tout"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_12_e8", topicId: 12, prompt: "Quel suffixe forme des adverbes de manière en anglais ?", options: ["-ful", "-less", "-ly", "-er"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_12_e9", topicId: 12, prompt: "Quelle est la forme passé (-ed) du verbe 'stop' ?", options: ["stoped", "stopted", "stopped", "stoppd"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_12_e10", topicId: 12, prompt: "Que signifie 'unhelpful' (un- + help + -ful) en anglais ?", options: ["très utile", "pas utile / inutile", "utile à nouveau", "trop utile"], correctIndex: 1)
    ],

    // MARK: Topic 13 Exam  -  Les Synonymes et Antonymes
    13: [
        MathExamQuestion(id: "fr_exam_13_e1", topicId: 13, prompt: "Quel est le synonyme de 'beautiful' (beau/belle) en anglais ?", options: ["ugly", "lovely", "sad", "tired"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_13_e2", topicId: 13, prompt: "Quel est l'antonyme de 'always' (toujours) en anglais ?", options: ["often", "sometimes", "never", "usually"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_13_e3", topicId: 13, prompt: "Quel est le synonyme de 'smart' (intelligent) en anglais ?", options: ["dumb", "clever", "silly", "slow"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_13_e4", topicId: 13, prompt: "Quel est l'antonyme de 'full' (plein) en anglais ?", options: ["filled", "packed", "empty", "loaded"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_13_e5", topicId: 13, prompt: "Quel mot est un synonyme de 'walk' (marcher) en anglais ?", options: ["run", "stroll", "jump", "fly"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_13_e6", topicId: 13, prompt: "Quel est l'antonyme de 'ancient' (ancien) en anglais ?", options: ["old", "aged", "modern", "historic"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_13_e7", topicId: 13, prompt: "Quel mot est un synonyme de 'tired' (fatigué) en anglais ?", options: ["energetic", "sleepy", "happy", "active"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_13_e8", topicId: 13, prompt: "Quel est l'antonyme de 'loud' (bruyant) en anglais ?", options: ["noisy", "quiet", "strong", "harsh"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_13_e9", topicId: 13, prompt: "Quel mot est un synonyme de 'angry' (en colère) en anglais ?", options: ["calm", "peaceful", "furious", "gentle"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_13_e10", topicId: 13, prompt: "Quel est l'antonyme de 'push' (pousser) en anglais ?", options: ["shove", "press", "pull", "hit"], correctIndex: 2)
    ],

    // MARK: Topic 14 Exam  -  La Compréhension
    14: [
        MathExamQuestion(id: "fr_exam_14_e1", topicId: 14, prompt: "Lis : 'Max has a dog named Rex. Every morning, Max takes Rex for a walk in the park.' Quelle est l'idée principale ?", options: ["Rex is a park.", "Max and Rex enjoy morning walks.", "The park is big.", "Dogs like mornings."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_14_e2", topicId: 14, prompt: "Lis : 'Anna loves painting. She paints every day after school.' Quelle question répond à 'When'?", options: ["Anna loves painting.", "She paints.", "Every day after school.", "She loves it."], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_14_e3", topicId: 14, prompt: "Quel mot en anglais répond à la question 'Quand ?' ?", options: ["Who?", "What?", "When?", "Where?"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_14_e4", topicId: 14, prompt: "Lis : 'Sam went to the beach with his family because it was a sunny day.' Pourquoi est-il allé à la plage ?", options: ["Because he loves swimming.", "Because it was a sunny day.", "Because his family asked him.", "Because school was closed."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_14_e5", topicId: 14, prompt: "Qu'est-ce qu'un 'detail' (détail) dans un texte de compréhension ?", options: ["L'idée principale du texte", "Une information spécifique qui soutient l'idée principale", "Le titre du texte", "Le nom de l'auteur"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_14_e6", topicId: 14, prompt: "Lis : 'Lily is eight years old. She loves reading books about animals.' Quel est l'âge de Lily ?", options: ["Six", "Seven", "Eight", "Nine"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_14_e7", topicId: 14, prompt: "Pour trouver l'idée principale d'un texte, quelle question faut-il se poser ?", options: ["Qui est l'auteur ?", "De quoi parle principalement ce texte ?", "Combien de mots y a-t-il ?", "Quelle est la dernière phrase ?"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_14_e8", topicId: 14, prompt: "Lis : 'It was raining hard. Jake put on his raincoat and boots before going outside.' Pourquoi Jake met-il son imperméable ?", options: ["Because he likes raincoats.", "Because it is raining hard.", "Because his mum asked him.", "Because it is cold."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_14_e9", topicId: 14, prompt: "Quel mot-question anglais demande la raison ou le but d'une action ?", options: ["Who", "What", "When", "Why"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_14_e10", topicId: 14, prompt: "Lis : 'Ben and Mia are best friends. They go to the same school and play together every day.' Où vont-ils ensemble ?", options: ["To the park", "To the library", "To the same school", "To the cinema"], correctIndex: 2)
    ],

    // MARK: Topic 15 Exam  -  Les Éléments du Récit
    15: [
        MathExamQuestion(id: "fr_exam_15_e1", topicId: 15, prompt: "Dans 'Little Red Riding Hood', qui est le personnage (character) principal ?", options: ["The wolf", "Grandma", "Little Red Riding Hood", "The hunter"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_15_e2", topicId: 15, prompt: "Dans 'Snow White', quel est le problème (problem) principal ?", options: ["Snow White is lost.", "The Evil Queen wants to harm Snow White.", "Snow White has no friends.", "The dwarfs are grumpy."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_15_e3", topicId: 15, prompt: "Où se passe généralement l'histoire de 'The Little Mermaid' ? (setting)", options: ["In a forest", "In a desert", "Under the sea and on land", "In a castle"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_15_e4", topicId: 15, prompt: "Dans 'Hansel and Gretel', quelle est la solution au problème ?", options: ["They find gold.", "They escape the witch and return home.", "They stay in the forest.", "The witch helps them."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_15_e5", topicId: 15, prompt: "Qu'est-ce que le 'narrator' (narrateur) dans un récit ?", options: ["Le personnage principal", "Le méchant de l'histoire", "Celui qui raconte l'histoire", "Le cadre de l'histoire"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_15_e6", topicId: 15, prompt: "Dans un récit, le 'climax' est...", options: ["Le début de l'histoire", "Le moment le plus intense de l'intrigue", "La solution du problème", "Le cadre de l'histoire"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_15_e7", topicId: 15, prompt: "Quel terme anglais décrit la morale ou le message d'une fable ?", options: ["setting", "plot", "theme", "character"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_15_e8", topicId: 15, prompt: "Dans 'The Tortoise and the Hare', quel est le thème principal ?", options: ["Speed always wins.", "Slow and steady wins the race.", "Animals can talk.", "Racing is fun."], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_15_e9", topicId: 15, prompt: "Qu'est-ce que l''antagonist' dans un récit anglais ?", options: ["Le personnage principal héroïque", "Le personnage qui crée le conflit / le méchant", "Le narrateur de l'histoire", "Le cadre de l'histoire"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_15_e10", topicId: 15, prompt: "Dans 'Beauty and the Beast', quel est le problème central ?", options: ["Beauty has no friends.", "The Beast is under a curse and must find love.", "Beauty is lost in the forest.", "The castle is too big."], correctIndex: 1)
    ],

    // MARK: Topic 16 Exam  -  Les Types de Phrases
    16: [
        MathExamQuestion(id: "fr_exam_16_e1", topicId: 16, prompt: "Classe la phrase 'How fast she runs!' selon son type.", options: ["Déclarative", "Interrogative", "Exclamative", "Impérative"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_16_e2", topicId: 16, prompt: "Classe la phrase 'Turn off the light, please.' selon son type.", options: ["Déclarative", "Impérative", "Interrogative", "Exclamative"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_16_e3", topicId: 16, prompt: "Classe la phrase 'The train arrives at noon.' selon son type.", options: ["Interrogative", "Exclamative", "Déclarative", "Impérative"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_16_e4", topicId: 16, prompt: "Classe la phrase 'Are you ready for the test?' selon son type.", options: ["Déclarative", "Exclamative", "Impérative", "Interrogative"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_16_e5", topicId: 16, prompt: "Quelle phrase impérative est correctement formulée en anglais ?", options: ["You should be quiet.", "Are you quiet?", "Be quiet!", "How quiet you are!"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_16_e6", topicId: 16, prompt: "Quelle phrase exclamative est correctement formulée en anglais ?", options: ["What a beautiful day it is!", "Is it a beautiful day?", "It is a beautiful day.", "Make it a beautiful day."], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_16_e7", topicId: 16, prompt: "Une phrase impérative en anglais commence souvent par...", options: ["Un sujet comme 'He' ou 'She'", "Un verbe à l'infinitif / base verbale", "Un point d'interrogation", "Un adjectif"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_16_e8", topicId: 16, prompt: "Classe la phrase 'Don't touch the hot stove!' selon son type.", options: ["Déclarative", "Interrogative", "Impérative", "Exclamative"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_16_e9", topicId: 16, prompt: "Quelle question interrogative est correctement formée en anglais ?", options: ["She is happy?", "Is she happy?", "Happy she is?", "Is happy she?"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_16_e10", topicId: 16, prompt: "Classe la phrase 'We won the championship!' selon son type.", options: ["Déclarative simple", "Interrogative", "Impérative", "Exclamative ou déclarative exclamée"], correctIndex: 3)
    ],

    // MARK: Topic 17 Exam  -  Les Homophones Anglais
    17: [
        MathExamQuestion(id: "fr_exam_17_e1", topicId: 17, prompt: "Choisis le bon homophone : 'I can ___ the birds singing.' (J'entends les oiseaux chanter.)", options: ["here", "hear", "heer", "her"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_17_e2", topicId: 17, prompt: "Choisis le bon homophone : 'She ___ the answer.' (Elle sait la réponse.)", options: ["no", "now", "know", "knew"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e3", topicId: 17, prompt: "Complète : 'The library is over ___.' (La bibliothèque est là-bas.)", options: ["their", "they're", "there", "the're"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e4", topicId: 17, prompt: "Complète : '___ going to be late.' (Ils vont être en retard.)", options: ["There", "Their", "They're", "Theyr'e"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e5", topicId: 17, prompt: "Complète : '___ cat is very fluffy.' (Leur chat est très duveteux.)", options: ["There", "They're", "Their", "Theyre"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e6", topicId: 17, prompt: "Complète : '___ my best friend.' (Tu es mon meilleur ami.)", options: ["Your", "You're", "Youre", "Yor"], correctIndex: 1),
        MathExamQuestion(id: "fr_exam_17_e7", topicId: 17, prompt: "Complète : 'This is ___ book.' (C'est ton livre.)", options: ["you're", "youre", "your", "yor"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e8", topicId: 17, prompt: "Complète : 'The cat licked ___ paw.' (Le chat lécha sa patte.)", options: ["it's", "its'", "its", "it is"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e9", topicId: 17, prompt: "Complète : 'I want ___ go to the park.' (Je veux aller au parc.)", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_17_e10", topicId: 17, prompt: "Complète : 'She is tired, and I am ___ tired.' (Elle est fatiguée, et moi aussi.)", options: ["to", "two", "too", "tow"], correctIndex: 2)
    ],

    // MARK: Topic 18 Exam  -  Les Parties du Discours
    18: [
        MathExamQuestion(id: "fr_exam_18_e1", topicId: 18, prompt: "Dans 'She carefully placed the small box on the shelf', identifie le pronom.", options: ["carefully", "small", "She", "shelf"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_18_e2", topicId: 18, prompt: "Dans 'She carefully placed the small box on the shelf', identifie la préposition.", options: ["carefully", "placed", "small", "on"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_18_e3", topicId: 18, prompt: "Dans 'She carefully placed the small box on the shelf', identifie l'adjectif.", options: ["carefully", "placed", "small", "She"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_18_e4", topicId: 18, prompt: "Dans 'She carefully placed the small box on the shelf', identifie l'adverbe.", options: ["carefully", "small", "on", "box"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_18_e5", topicId: 18, prompt: "Lequel de ces mots est une préposition en anglais ?", options: ["beautiful", "sing", "between", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_18_e6", topicId: 18, prompt: "Lequel de ces groupes contient uniquement des pronoms personnels en anglais ?", options: ["I, he, she, they", "run, eat, sleep", "big, small, tall", "in, on, at, under"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_18_e7", topicId: 18, prompt: "Quelle partie du discours est le mot 'above' dans 'The plane flew above the clouds' ?", options: ["Nom", "Verbe", "Adjectif", "Préposition"], correctIndex: 3),
        MathExamQuestion(id: "fr_exam_18_e8", topicId: 18, prompt: "Quelle partie du discours est le mot 'we' en anglais ?", options: ["Nom", "Verbe", "Pronom", "Adjectif"], correctIndex: 2),
        MathExamQuestion(id: "fr_exam_18_e9", topicId: 18, prompt: "Dans 'The friendly dog wagged its tail happily', combien d'adjectifs y a-t-il ?", options: ["1", "2", "3", "0"], correctIndex: 0),
        MathExamQuestion(id: "fr_exam_18_e10", topicId: 18, prompt: "Quelle phrase contient toutes les parties du discours : pronom, verbe, adjectif, nom, préposition ?", options: ["Running fast.", "She reads.", "She quickly reads the big book on the table.", "Big books."], correctIndex: 2)
    ]
]
