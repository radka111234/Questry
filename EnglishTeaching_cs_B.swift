import Foundation

// MARK: - English Teaching Pack: Czech (Topics 19-35)

let csTeachingTopicsB: [(id: Int, title: String, intro: String, example: String)] = [
    (19, "Podmět a Přísudek", "Každá anglická věta musí mít podmět (kdo/co) a přísudek (co dělá/je). Podmět říká, o kom věta je, přísudek popisuje jeho činnost nebo stav.", "Ve větě 'The dog runs fast' je 'The dog' podmět a 'runs fast' přísudek."),
    (20, "Obrazný Jazyk", "Obrazný jazyk oživuje text pomocí přirovnání, metafor, personifikace a hyperboly. Pomáhá čtenáři lépe si představit popisovanou situaci.", "Přirovnání: 'She is as brave as a lion.' Metafora: 'Life is a journey.'"),
    (21, "Slovní Zásoba v Kontextu", "Pokud neznáš anglické slovo, hledej nápovědy v okolním textu – synonyma, antonyma, příklady nebo vysvětlení přímo ve větě.", "Ve větě 'The arid desert had no water' nás slovo 'no water' napoví, že 'arid' znamená 'suchý'."),
    (22, "Hlavní Myšlenka", "Hlavní myšlenka odstavce říká, o čem celý odstavec je. Podpůrné detaily ji rozvíjejí a dokazují. Hlavní myšlenku najdeš obvykle v první nebo poslední větě.", "Hlavní myšlenka: 'Dogs make great pets.' Detaily: věrní, přátelští, snadno vycvičitelní."),
    (23, "Vypravěčský Pohled", "Vypravěčský pohled určuje, z čí perspektivy je příběh vyprávěn. První osoba používá 'I/me', druhá osoba 'you', třetí osoba 'he/she/they'.", "První osoba: 'I walked into the room.' Třetí osoba: 'She walked into the room.'"),
    (24, "Textové Struktury", "Autoři organizují texty různými způsoby: porovnání a kontrast, příčina a následek, problém a řešení, nebo pořadí/sekvence. Rozpoznání struktury pomáhá porozumět textu.", "Příčina: 'It rained heavily.' Následek: 'The river flooded.'"),
    (25, "Vyprávěcí Psaní", "Příběh má začátek (uvedení postav a prostředí), střed (konflikt/problém) a konec (rozuzlení). Dialog se píše do uvozovek a každá replika začíná na novém řádku.", "\"Let's go,\" said Tom. \"I'm not ready,\" replied Anna."),
    (26, "Anglická Poezie", "Poezie využívá rýmové schéma (ABAB, AABB), sloky (stanza), aliteraci (opakování souhlásek) a asonanci (opakování samohlásek).", "Aliterace: 'Peter Piper picked a peck.' ABAB rýmové schéma: první a třetí verš rýmují, druhý a čtvrtý rýmují."),
    (27, "Souvětí", "Souvětí spojují dvě hlavní věty pomocí souřadicích spojek FANBOYS: for, and, nor, but, or, yet, so. Před spojkou se píše čárka.", "I wanted to go, but it was raining. She studied hard, so she passed the test."),
    (28, "Činný a Trpný Rod", "V činném rodu podmět vykonává činnost. V trpném rodu podmět přijímá činnost – tvoří se pomocí 'to be' + příčestí trpné.", "Činný: 'The chef cooked the meal.' Trpný: 'The meal was cooked by the chef.'"),
    (29, "Přesvědčivé Psaní", "Přesvědčivý text obsahuje tezi (hlavní tvrzení), důkazy, rétorické prostředky (ethos = důvěryhodnost, pathos = emoce, logos = logika) a výzvu k akci.", "Ethos: 'Experts agree...' Pathos: 'Think of the suffering children.' Logos: 'Studies show 80% improvement.'"),
    (30, "Literární Prostředky", "Literární prostředky jako předzvěst (foreshadowing), ironie, symbolismus, téma a motiv obohacují příběh a přidávají hlubší smysl.", "Symbolismus: holubice symbolizuje mír. Předzvěst: tmavé mraky naznačují nadcházející nebezpečí."),
    (31, "Záměr Autora", "Autor píše, aby informoval (to inform), přesvědčil (to persuade) nebo bavil (to entertain). Předpojatost (bias) znamená, že autor upřednostňuje jeden pohled.", "Záměr reklamního textu je přesvědčit. Záměr encyklopedie je informovat."),
    (32, "Výzkum a Citace", "Při psaní výzkumné práce musíš parafrázovat nebo citovat zdroje a uvést je v MLA formátu. Plagiátorství (opisování bez uvedení zdroje) je neetické.", "MLA citace: Smith, John. The Ocean. Blue Press, 2020."),
    (33, "Shakespeare a Klasická Literatura", "Shakespeare psal v jambickém pentametru (10 slabik, střídání nepřízvučných a přízvučných). Sonety mají 14 řádků. Tragédie končí smrtí hrdiny, komedie šťastným koncem.", "Jambický pentametr: 'Shall I compare thee to a summer's day?' (10 slabik)"),
    (34, "Etymologie", "Znalost latinských a řeckých kořenů pomáhá pochopit nová slova. Kořeny: bio = život, geo = země, port = nést, dict = říct, scrib/script = psát.", "Biography = bio (život) + graphy (psaní) = psaní o životě. Geography = geo (země) + graphy."),
    (35, "Pokročilá Gramatika", "Střední čárka (;) spojuje dvě hlavní věty. Dvojtečka (:) uvozuje seznam nebo vysvětlení. Pomlčka ( - ) zdůrazňuje vsuvku. Paralelní struktura zachovává stejnou gramatickou formu.", "Paralelní: 'She likes reading, writing, and swimming.' Střední čárka: 'I was tired; I went to bed.'")
]

// MARK: - Practice Questions (Topics 19-35)

let csTeachingPracticeB: [Int: [MathExamQuestion]] = [

    // MARK: Topic 19 - Podmět a Přísudek
    19: [
        MathExamQuestion(id: "cs_teach_19_p1", topicId: 19, prompt: "Co je podmět ve větě 'The cat sleeps on the sofa'?", options: ["sleeps", "The cat", "on the sofa", "sofa"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p2", topicId: 19, prompt: "Co je přísudek ve větě 'My brother plays football every day'?", options: ["My brother", "football", "plays football every day", "every day"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_19_p3", topicId: 19, prompt: "Která věta má správný podmět a přísudek?", options: ["Running fast the boy.", "The boy runs fast.", "Fast the boy running.", "Boy the runs fast."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p4", topicId: 19, prompt: "Co je podmět ve větě 'The tall girl with red hair sings beautifully'?", options: ["sings", "red hair", "The tall girl with red hair", "beautifully"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_19_p5", topicId: 19, prompt: "Jaký typ přísudku je ve větě 'She is happy'?", options: ["Slovesný přísudek (action verb)", "Jmenný přísudek (linking verb)", "Pomocný přísudek", "Neexistující přísudek"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p6", topicId: 19, prompt: "Může mít anglická věta skrytý podmět jako v češtině (např. 'Jdu domů')?", options: ["Ano, vždy", "Ne, podmět musí být vždy vyjádřen", "Jen v rozkazovacím způsobu", "Jen v otázkách"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p7", topicId: 19, prompt: "Identifikuj podmět: 'Running every morning keeps you healthy.'", options: ["every morning", "keeps", "you", "Running every morning"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_19_p8", topicId: 19, prompt: "Která věta je neúplná (chybí podmět nebo přísudek)?", options: ["The bird sings.", "Jumped over the fence.", "We are students.", "They study hard."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p9", topicId: 19, prompt: "Co je přísudek ve větě 'The old man and his dog walk slowly'?", options: ["The old man", "walk slowly", "his dog", "slowly"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_19_p10", topicId: 19, prompt: "Ve větě 'There are many books on the shelf' – co je skutečný podmět?", options: ["There", "many books", "the shelf", "are"], correctIndex: 1)
    ],

    // MARK: Topic 20 - Obrazný Jazyk
    20: [
        MathExamQuestion(id: "cs_teach_20_p1", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'Her smile is sunshine'?", options: ["Přirovnání (simile)", "Metafora", "Personifikace", "Hyperbola"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_20_p2", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'He runs as fast as a cheetah'?", options: ["Metafora", "Přirovnání (simile)", "Personifikace", "Ironie"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_20_p3", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'The wind whispered through the trees'?", options: ["Hyperbola", "Přirovnání", "Personifikace", "Metafora"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_20_p4", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'I've told you a million times!'?", options: ["Přirovnání", "Metafora", "Personifikace", "Hyperbola"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_20_p5", topicId: 20, prompt: "Která z vět je přirovnání (simile)?", options: ["The classroom was a zoo.", "Life is a rollercoaster.", "She sings like an angel.", "The stars danced in the sky."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_20_p6", topicId: 20, prompt: "Přirovnání (simile) obvykle obsahuje slova:", options: ["is/are", "like nebo as", "ing", "the"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_20_p7", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'The sun peeked over the mountains'?", options: ["Hyperbola", "Přirovnání", "Metafora", "Personifikace"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_20_p8", topicId: 20, prompt: "Která věta obsahuje metaforu?", options: ["He is as cold as ice.", "Her voice is music to my ears.", "The dog howled loudly.", "I ran quickly to school."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_20_p9", topicId: 20, prompt: "Co dělá personifikace?", options: ["Přirovnává dvě věci pomocí 'like' nebo 'as'", "Přidává nelidské věci lidské vlastnosti", "Zveličuje pro efekt", "Srovnává přímo bez spojovacích slov"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_20_p10", topicId: 20, prompt: "Jaký druh obrazného jazyka je věta 'My backpack weighs a ton'?", options: ["Přirovnání", "Metafora", "Personifikace", "Hyperbola"], correctIndex: 3)
    ],

    // MARK: Topic 21 - Slovní Zásoba v Kontextu
    21: [
        MathExamQuestion(id: "cs_teach_21_p1", topicId: 21, prompt: "Ve větě 'The benevolent teacher always helped struggling students' – co znamená 'benevolent'?", options: ["Přísný", "Laskavý", "Unavený", "Zaneprázdněný"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_21_p2", topicId: 21, prompt: "Ve větě 'She was elated  -  jumping and cheering  -  when she won' – co znamená 'elated'?", options: ["Smutná", "Unavená", "Nadšená/šťastná", "Překvapená"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_21_p3", topicId: 21, prompt: "Jak se nazývá metoda, kdy odhadujeme význam slova z okolního textu?", options: ["Slovníková metoda", "Kontextová nápověda", "Etymologická analýza", "Gramatická analýza"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_21_p4", topicId: 21, prompt: "Ve větě 'Unlike his gregarious sister, Tom was solitary and preferred being alone' – co znamená 'gregarious'?", options: ["Introvertní", "Společenský", "Chytrý", "Lenivý"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_21_p5", topicId: 21, prompt: "Který typ kontextové nápovědy je ve větě 'The precipitation, or rainfall, was heavy'?", options: ["Antonymum", "Příklad", "Definice/přeformulování", "Příčina a následek"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_21_p6", topicId: 21, prompt: "Ve větě 'The ancient, dilapidated building was falling apart' – co nejspíš znamená 'dilapidated'?", options: ["Nový", "Velký", "Zchátralý/zdevastovaný", "Drahý"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_21_p7", topicId: 21, prompt: "Antonymum je nápověda, kde kontext obsahuje:", options: ["Synonymum", "Slovo s opačným významem", "Příklad", "Definici"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_21_p8", topicId: 21, prompt: "Ve větě 'She was famished; she hadn't eaten since morning' – co znamená 'famished'?", options: ["Vyděšená", "Velmi hladová", "Nemocná", "Smutná"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_21_p9", topicId: 21, prompt: "Ve větě 'Nocturnal animals, such as owls and bats, sleep during the day' – co znamená 'nocturnal'?", options: ["Noční", "Velký", "Nebezpečný", "Rychlý"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_21_p10", topicId: 21, prompt: "Proč je důležité umět odhadnout význam slov z kontextu?", options: ["Abychom nepotřebovali slovník", "Abychom lépe porozuměli textu i bez znalosti každého slova", "Abychom psali rychleji", "Abychom se naučili gramatiku"], correctIndex: 1)
    ],

    // MARK: Topic 22 - Hlavní Myšlenka
    22: [
        MathExamQuestion(id: "cs_teach_22_p1", topicId: 22, prompt: "Co je hlavní myšlenka (main idea) odstavce?", options: ["Nejdelší věta v odstavci", "Nejzajímavější detail", "Ústřední tvrzení, o němž celý odstavec pojednává", "První věta vždy"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_22_p2", topicId: 22, prompt: "K čemu slouží podpůrné detaily (supporting details)?", options: ["Zavádějí nové téma", "Dokazují nebo rozvíjejí hlavní myšlenku", "Jsou důležitější než hlavní myšlenka", "Jsou vždy na konci odstavce"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_22_p3", topicId: 22, prompt: "Přečti: 'Dolphins are very intelligent. They can learn tricks. They communicate with each other. Scientists study their complex behavior.' – Co je hlavní myšlenka?", options: ["Delfíni dělají triky.", "Delfíni jsou velmi inteligentní.", "Vědci studují delfíny.", "Delfíni spolu komunikují."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_22_p4", topicId: 22, prompt: "Kde se hlavní myšlenka v odstavci nejčastěji nachází?", options: ["Vždy uprostřed", "Vždy na konci", "Na začátku nebo na konci odstavce", "Nikdy není výslovně uvedena"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_22_p5", topicId: 22, prompt: "Co je téma (topic) na rozdíl od hlavní myšlenky (main idea)?", options: ["Téma je podrobnější než hlavní myšlenka", "Téma je obecný předmět, hlavní myšlenka je konkrétní tvrzení o tématu", "Jsou to synonyma", "Téma je vždy věta, hlavní myšlenka je slovo"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_22_p6", topicId: 22, prompt: "Přečti: 'Exercise helps your heart. It strengthens muscles. Exercise improves mood. It also helps you sleep better.' – Co je hlavní myšlenka?", options: ["Cvičení zlepšuje spánek.", "Cvičení posiluje svaly.", "Cvičení má mnoho zdravotních výhod.", "Cvičení je těžké."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_22_p7", topicId: 22, prompt: "Nevyjádřená (implicitní) hlavní myšlenka znamená, že:", options: ["Je na začátku odstavce", "Čtenář si ji musí odvodit ze details", "Je vždy na konci", "Odstavec hlavní myšlenku nemá"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_22_p8", topicId: 22, prompt: "Který z těchto výroků by byl dobrou hlavní myšlenkou odstavce o psech?", options: ["Psi", "Psi jsou věrní a milující společníci.", "Zlatý retrívr je oblíbené plemeno.", "Psi jedí dvakrát denně."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_22_p9", topicId: 22, prompt: "Jak se jmenuje věta na začátku odstavce, která vyjadřuje hlavní myšlenku?", options: ["Podpůrná věta", "Závěrečná věta", "Tematická věta (topic sentence)", "Přechodová věta"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_22_p10", topicId: 22, prompt: "Proč je důležité identifikovat hlavní myšlenku při čtení?", options: ["Pomáhá psát delší texty", "Pomáhá pochopit, co je v textu nejdůležitější", "Pomáhá pamatovat si každé slovo", "Není to důležité"], correctIndex: 1)
    ],

    // MARK: Topic 23 - Vypravěčský Pohled
    23: [
        MathExamQuestion(id: "cs_teach_23_p1", topicId: 23, prompt: "Který vypravěčský pohled používá zájmena 'I' a 'me'?", options: ["Třetí osoba", "Druhá osoba", "První osoba", "Vševědoucí vypravěč"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_23_p2", topicId: 23, prompt: "Identifikuj vypravěčský pohled: 'You walk into the room and feel the cold air on your skin.'", options: ["První osoba", "Druhá osoba", "Třetí osoba omezená", "Třetí osoba vševědoucí"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p3", topicId: 23, prompt: "Jaký vypravěčský pohled je ve větě 'She opened the letter and gasped'?", options: ["První osoba", "Druhá osoba", "Třetí osoba", "Nulová osoba"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_23_p4", topicId: 23, prompt: "Jaká je výhoda vypravěče v první osobě?", options: ["Vypravěč ví vše o všech postavách", "Čtenář se blíže ztotožní s hlavní postavou", "Příběh je objektivnější", "Lze psát o více postavách najednou"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p5", topicId: 23, prompt: "Třetí osoba vševědoucí (omniscient) znamená:", options: ["Vypravěč zná jen myšlenky jedné postavy", "Vypravěč zná myšlenky a pocity všech postav", "Příběh je vyprávěn v druhé osobě", "Vypravěč je postava v příběhu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p6", topicId: 23, prompt: "Identifikuj pohled: 'Tom felt nervous. He had never spoken in front of so many people.'", options: ["První osoba", "Druhá osoba", "Třetí osoba omezená", "Třetí osoba vševědoucí"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_23_p7", topicId: 23, prompt: "Druhá osoba se v literatuře používá:", options: ["Velmi často, je nejběžnější", "Vzácněji, vytváří pocit přímého zapojení čtenáře", "Jen v básních", "Jen ve vědeckých textech"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p8", topicId: 23, prompt: "Přepiš do třetí osoby: 'I went to the store.' Správný přepis je:", options: ["You went to the store.", "She went to the store.", "We went to the store.", "Going to the store."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p9", topicId: 23, prompt: "Jakou nevýhodu má vypravěč v první osobě?", options: ["Příběh je méně zajímavý", "Čtenář vidí jen to, co hlavní postava vidí a ví", "Nelze použít dialog", "Nelze popsat prostředí"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_23_p10", topicId: 23, prompt: "Identifikuj pohled: 'As Maria studied, she worried about the test. Meanwhile, her brother Jake was carefree, not knowing the test existed.'", options: ["První osoba", "Druhá osoba", "Třetí osoba omezená", "Třetí osoba vševědoucí"], correctIndex: 3)
    ],

    // MARK: Topic 24 - Textové Struktury
    24: [
        MathExamQuestion(id: "cs_teach_24_p1", topicId: 24, prompt: "Text začíná: 'First, mix the flour. Then, add eggs. Finally, bake for 30 minutes.' Jaká je textová struktura?", options: ["Porovnání a kontrast", "Příčina a následek", "Sekvence/pořadí", "Problém a řešení"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_24_p2", topicId: 24, prompt: "Která klíčová slova naznačují strukturu 'příčina a následek'?", options: ["First, next, finally", "Because, therefore, as a result", "However, on the other hand", "For example, such as"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_24_p3", topicId: 24, prompt: "Text říká: 'Both cats and dogs make good pets. However, cats are more independent while dogs need more attention.' Jaká je struktura?", options: ["Sekvence", "Příčina a následek", "Porovnání a kontrast", "Problém a řešení"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_24_p4", topicId: 24, prompt: "Klíčová slova 'however', 'on the other hand', 'similarly' naznačují strukturu:", options: ["Sekvence", "Příčina a následek", "Porovnání a kontrast", "Popis"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_24_p5", topicId: 24, prompt: "Text říká: 'Many students struggle with reading. To help, schools have introduced reading programs.' Jaká je struktura?", options: ["Porovnání a kontrast", "Problém a řešení", "Příčina a následek", "Sekvence"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_24_p6", topicId: 24, prompt: "Proč je důležité rozpoznat textovou strukturu?", options: ["Abychom četli rychleji", "Pomáhá lépe pochopit a zapamatovat si obsah textu", "Abychom psali delší eseje", "Není to důležité"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_24_p7", topicId: 24, prompt: "Text začíná: 'The storm caused flooding. The flooding destroyed many homes.' Jaká je struktura?", options: ["Porovnání a kontrast", "Sekvence", "Příčina a následek", "Problém a řešení"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_24_p8", topicId: 24, prompt: "Klíčová slova 'first', 'next', 'then', 'finally' naznačují strukturu:", options: ["Příčina a následek", "Porovnání a kontrast", "Problém a řešení", "Sekvence/pořadí"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_24_p9", topicId: 24, prompt: "Textová struktura 'popis' (description) se nejčastěji vyznačuje:", options: ["Klíčovými slovy 'because' a 'therefore'", "Smyslovými detaily a adjektivy", "Klíčovými slovy 'first' a 'next'", "Klíčovými slovy 'however' a 'but'"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_24_p10", topicId: 24, prompt: "Text říká: 'Bullying is a serious issue. Schools should create safe zones and teach empathy.' Jaká je struktura?", options: ["Sekvence", "Popis", "Porovnání a kontrast", "Problém a řešení"], correctIndex: 3)
    ],

    // MARK: Topic 25 - Vyprávěcí Psaní
    25: [
        MathExamQuestion(id: "cs_teach_25_p1", topicId: 25, prompt: "Jaké jsou tři základní části příběhu (story arc)?", options: ["Úvod, závěr, epilog", "Začátek, střed, konec", "Konflikt, vyvrcholení, morálka", "Postavy, prostředí, děj"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p2", topicId: 25, prompt: "Jak se správně zapisuje dialog v angličtině?", options: ["Bez uvozovek, jen kurzívou", "Do uvozovek, každá replika na novém řádku", "Do závorek", "Tučně bez uvozovek"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p3", topicId: 25, prompt: "Která z vět má správně zapsaný dialog?", options: ["She said, I am tired.", "\"I am tired,\" she said.", "She said I am tired.", "I am tired. She said."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p4", topicId: 25, prompt: "Co je vyvrcholení (climax) příběhu?", options: ["Úvod postav a prostředí", "Nejnapínavější moment příběhu", "Závěr a rozuzlení", "Úvodní konflikt"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p5", topicId: 25, prompt: "Co je expozice (exposition) v příběhu?", options: ["Nejnapínavější část", "Závěr příběhu", "Úvod, kde jsou představeny postavy, prostředí a situace", "Konflikt"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_25_p6", topicId: 25, prompt: "Jak se nazývá hlavní problém nebo napětí v příběhu?", options: ["Téma", "Konflikt", "Rozuzlení", "Expozice"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p7", topicId: 25, prompt: "Co je rozuzlení (resolution) příběhu?", options: ["Začátek příběhu", "Střed s konfliktem", "Závěr, kde je konflikt vyřešen", "Vyvrcholení napětí"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_25_p8", topicId: 25, prompt: "Proč je dialog v příběhu důležitý?", options: ["Prodlužuje příběh", "Oživuje postavy a ukazuje jejich osobnosti", "Nahrazuje popis prostředí", "Není důležitý"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_25_p9", topicId: 25, prompt: "Která z vět nejlépe 'ukazuje' (show don't tell) emoce?", options: ["She was sad.", "She felt very sad inside.", "Tears rolled down her cheeks as she stared at the empty chair.", "Her emotion was sadness."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_25_p10", topicId: 25, prompt: "Co je narrator (vypravěč)?", options: ["Hlavní postava příběhu", "Hlas, který příběh vypráví", "Záporná postava", "Autor knihy"], correctIndex: 1)
    ],

    // MARK: Topic 26 - Anglická Poezie
    26: [
        MathExamQuestion(id: "cs_teach_26_p1", topicId: 26, prompt: "Jak se nazývá vzor rýmů v básni (např. ABAB)?", options: ["Aliterace", "Rýmové schéma (rhyme scheme)", "Asonance", "Metrum"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p2", topicId: 26, prompt: "Jaké rýmové schéma mají verše: 'The cat sat on a mat (A) / A dog ran down the road (B) / The cat wore a hat (A) / Carrying a heavy load (B)'?", options: ["AABB", "ABAB", "ABBA", "AAAB"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p3", topicId: 26, prompt: "Co je aliterace (alliteration)?", options: ["Opakování stejných samohlásek", "Opakování stejné souhlásky na začátku slov", "Vzor rýmů", "Skupina veršů"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p4", topicId: 26, prompt: "Která věta obsahuje aliteraci?", options: ["The sun is bright today.", "Sally sells seashells by the seashore.", "I love reading books.", "The dog barked loudly."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p5", topicId: 26, prompt: "Co je sloka (stanza) v básni?", options: ["Jeden verš", "Skupina veršů oddělená mezerou, podobná odstavci v próze", "Rýmové schéma", "Druh metafory"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p6", topicId: 26, prompt: "Co je asonance (assonance)?", options: ["Opakování souhlásek na začátku slov", "Opakování stejných samohlásek uvnitř slov", "Rýmování posledních slabik", "Skupina čtyř veršů"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p7", topicId: 26, prompt: "Která z možností obsahuje asonanci?", options: ["Peter Piper picked a peck.", "Go slow over the road home.", "She sells seashells.", "Big black bears bite."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_26_p8", topicId: 26, prompt: "Báseň bez rýmu a pevného metra se nazývá:", options: ["Sonet", "Limerick", "Volný verš (free verse)", "Haiku"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_26_p9", topicId: 26, prompt: "Kolik slabik má haiku celkem (v japonské tradici)?", options: ["10", "14", "17", "12"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_26_p10", topicId: 26, prompt: "Rýmové schéma AABB znamená:", options: ["První a třetí verš rýmují, druhý a čtvrtý rýmují", "Všechny čtyři verše rýmují stejně", "První a druhý verš rýmují, třetí a čtvrtý rýmují", "Žádné verše nerýmují"], correctIndex: 2)
    ],

    // MARK: Topic 27 - Souvětí (FANBOYS)
    27: [
        MathExamQuestion(id: "cs_teach_27_p1", topicId: 27, prompt: "Co znamená zkratka FANBOYS?", options: ["Sedm druhů příslovcí", "For, And, Nor, But, Or, Yet, So  -  souřadicí spojky", "Sedm druhů podstatných jmen", "Vzor pro psaní odstavců"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_27_p2", topicId: 27, prompt: "Která věta je správně zapsané souvětí s FANBOYS?", options: ["I was tired but I kept going.", "I was tired, but I kept going.", "I was tired but, I kept going.", "I was tired. But I kept going."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_27_p3", topicId: 27, prompt: "Vyber správnou spojku: 'She wanted to go, ___ it was raining.'", options: ["and", "or", "but", "nor"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_27_p4", topicId: 27, prompt: "Vyber správnou spojku: 'Study hard, ___ you will pass the exam.'", options: ["nor", "for", "so", "yet"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_27_p5", topicId: 27, prompt: "Co je souvětí (compound sentence)?", options: ["Věta s jedním podmětem a přísudkem", "Dvě nebo více hlavních vět spojených souřadicí spojkou", "Věta s vedlejší větou", "Věta bez spojky"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_27_p6", topicId: 27, prompt: "Souřadicí spojka 'for' v angličtině znamená přibližně:", options: ["ale", "nebo", "protože/neboť", "ani"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_27_p7", topicId: 27, prompt: "Souřadicí spojka 'nor' se používá:", options: ["Po kladné větě", "Po záporné větě pro přidání dalšího záporu", "Jako synonymum pro 'but'", "Pro vyjádření výsledku"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_27_p8", topicId: 27, prompt: "Která věta NENÍ souvětí (compound sentence)?", options: ["I like tea, and she likes coffee.", "He ran, but she walked.", "She studied hard because she wanted to pass.", "I was hungry, so I ate."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_27_p9", topicId: 27, prompt: "Vyber správnou spojku: 'He didn't call, ___ did he write a letter.'", options: ["and", "but", "nor", "or"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_27_p10", topicId: 27, prompt: "Spojka 'yet' v souvětí vyjadřuje:", options: ["Výsledek", "Přidání informace", "Kontrast (podobně jako 'but')", "Alternativu"], correctIndex: 2)
    ],

    // MARK: Topic 28 - Činný a Trpný Rod
    28: [
        MathExamQuestion(id: "cs_teach_28_p1", topicId: 28, prompt: "Která věta je v činném rodu (active voice)?", options: ["The cake was eaten by the children.", "The letter was written by Maria.", "The dog chased the cat.", "The car was repaired."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_28_p2", topicId: 28, prompt: "Která věta je v trpném rodu (passive voice)?", options: ["The teacher corrected the tests.", "The students played football.", "The book was written by a famous author.", "She opened the window."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_28_p3", topicId: 28, prompt: "Jak se tvoří trpný rod v angličtině?", options: ["Pomocné sloveso 'have' + příčestí minulé", "Pomocné sloveso 'be' + příčestí trpné (past participle)", "Pomocné sloveso 'do' + infinitiv", "Jen změnou pořadí slov"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_28_p4", topicId: 28, prompt: "Přeměň do trpného rodu: 'The chef cooked the meal.'", options: ["The meal cooked by the chef.", "The meal is cooked the chef.", "The meal was cooked by the chef.", "The chef was cooked the meal."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_28_p5", topicId: 28, prompt: "Kdy je vhodné použít trpný rod?", options: ["Vždy, je lepší než činný", "Když nevíme, kdo vykonavatelem je, nebo chceme zdůraznit objekt", "Jen ve vědeckých textech", "Nikdy v moderní angličtině"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_28_p6", topicId: 28, prompt: "Přeměň do činného rodu: 'The window was broken by Tom.'", options: ["Tom broke the window.", "The window broke Tom.", "Tom was broken the window.", "Breaking was done by Tom."], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_28_p7", topicId: 28, prompt: "Jaká je trpná forma věty 'Scientists discovered a new planet'?", options: ["A new planet discovered scientists.", "A new planet was discovered by scientists.", "Scientists were discovered a new planet.", "A new planet has discover by scientists."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_28_p8", topicId: 28, prompt: "Ve větě 'Mistakes were made' – proč se používá trpný rod?", options: ["Je kratší", "Vyhýbá se pojmenování osoby odpovědné za chyby", "Je gramaticky povinný", "Je elegantnější"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_28_p9", topicId: 28, prompt: "Identifikuj rod: 'The homework was forgotten by Jake.'", options: ["Činný rod", "Trpný rod", "Ani jeden", "Oba najednou"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_28_p10", topicId: 28, prompt: "Přeměň do trpného rodu: 'They will announce the results tomorrow.'", options: ["The results will be announced tomorrow.", "The results are announced tomorrow.", "Tomorrow will announce results.", "Results was announced by them."], correctIndex: 0)
    ],

    // MARK: Topic 29 - Přesvědčivé Psaní
    29: [
        MathExamQuestion(id: "cs_teach_29_p1", topicId: 29, prompt: "Co je teze (thesis statement) v přesvědčivém eseji?", options: ["Závěrečná věta eseje", "Hlavní tvrzení nebo argument autora", "Seznam důkazů", "Citát z jiného zdroje"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_29_p2", topicId: 29, prompt: "Co je ethos jako rétorický prostředek?", options: ["Apel na emoce čtenáře", "Apel na logiku a fakta", "Apel na důvěryhodnost a autoritu mluvčího", "Výzva k akci"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_29_p3", topicId: 29, prompt: "Který příklad ilustruje použití pathos?", options: ["'Studies show that 90% of experts agree.'", "'As a doctor with 20 years experience, I believe...'", "'Think of the innocent children suffering every day.'", "'The data clearly demonstrates...'"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_29_p4", topicId: 29, prompt: "Logos jako rétorický prostředek apeluje na:", options: ["Emoce", "Důvěryhodnost", "Logiku, fakta a statistiky", "Hodnoty publika"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_29_p5", topicId: 29, prompt: "Co je 'call to action' (výzva k akci)?", options: ["Úvod eseje", "Část textu, která vyzývá čtenáře, aby něco udělal", "Protiargument", "Definice problému"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_29_p6", topicId: 29, prompt: "Proč je důležité v přesvědčivém eseji zmínit protiargument (counter-argument)?", options: ["Není to důležité", "Aby byl esej delší", "Ukazuje to, že autor zná různé pohledy a umí je vyvrátit", "Protiargument nikdy neuvádíme"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_29_p7", topicId: 29, prompt: "Která z tezí je nejsilnější pro přesvědčivý esej?", options: ["Školy jsou důležité.", "Tato esej pojednává o školách.", "Školy by měly zrušit domácí úkoly, protože zvyšují stres a nepomáhají učení.", "Domácí úkoly jsou špatné."], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_29_p8", topicId: 29, prompt: "Který příklad ilustruje použití ethos?", options: ["'Imagine your child hungry every night.'", "'According to Nobel Prize-winning scientist Dr. Smith...'", "'Statistics show a 50% increase.'", "'Please, we must act now!'"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_29_p9", topicId: 29, prompt: "Co jsou emocionální slova (loaded language) v přesvědčivém psaní?", options: ["Neutrální popis faktů", "Slova záměrně vybraná pro vyvolání emocionální reakce", "Technické termíny", "Synonyma"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_29_p10", topicId: 29, prompt: "V jakém pořadí jsou obvykle části přesvědčivého eseje?", options: ["Závěr, důkazy, teze, úvod", "Úvod s tezí, důkazy/argumenty, protiargument s vyvracením, závěr", "Protiargument, teze, závěr", "Důkazy, úvod, teze, závěr"], correctIndex: 1)
    ],

    // MARK: Topic 30 - Literární Prostředky
    30: [
        MathExamQuestion(id: "cs_teach_30_p1", topicId: 30, prompt: "Co je foreshadowing (předzvěst)?", options: ["Odkaz na jiné literární dílo", "Nápověda nebo náznak toho, co se stane v budoucnosti", "Záměrná ironie", "Symbol představující téma"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_30_p2", topicId: 30, prompt: "Jaký druh ironie je, když postava říká něco a myslí opak (např. 'Oh, great!' po špatné zprávě)?", options: ["Situační ironie", "Dramatická ironie", "Verbální ironie/sarkasmus", "Kosmická ironie"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_30_p3", topicId: 30, prompt: "Dramatická ironie nastává, když:", options: ["Čtenář ví více než postava", "Postava říká opak toho, co si myslí", "Výsledek je opakem očekávání", "Autor vkládá ironie do názvu"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_30_p4", topicId: 30, prompt: "Co je symbolismus?", options: ["Přirovnání pomocí 'like' nebo 'as'", "Použití objektu, osoby nebo místa k reprezentaci abstraktní myšlenky", "Zveličení pro efekt", "Přidání lidských vlastností neživým věcem"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_30_p5", topicId: 30, prompt: "Co je téma (theme) literárního díla?", options: ["Hlavní postava příběhu", "Děj příběhu", "Ústřední myšlenka nebo poselství díla", "Prostředí příběhu"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_30_p6", topicId: 30, prompt: "Co je motiv (motif)?", options: ["Hlavní téma díla", "Opakující se prvek (symbol, idea, obraz) podporující téma", "Záporná postava", "Typ vypravěče"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_30_p7", topicId: 30, prompt: "Holubice jako symbol nejčastěji představuje:", options: ["Nebezpečí", "Mír a naději", "Smrt", "Lásku"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_30_p8", topicId: 30, prompt: "Situační ironie nastává, když:", options: ["Postava říká opak toho, co si myslí", "Čtenář ví více než postava", "Výsledek je přesným opakem toho, co bylo očekáváno", "Autor přímo oslovuje čtenáře"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_30_p9", topicId: 30, prompt: "Foreshadowing na začátku románu o válce by mohl být:", options: ["Popis klidné krajiny", "Dítě si hraje se zbraněmi", "Výběr vypravěče", "Počet kapitol"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_30_p10", topicId: 30, prompt: "Téma literárního díla se nejlépe vyjadřuje jako:", options: ["Jednoslovný pojem (např. 'láska')", "Celá věta vyjadřující myšlenku (např. 'Láska přemáhá všechny překážky')", "Jméno hlavní postavy", "Název díla"], correctIndex: 1)
    ],

    // MARK: Topic 31 - Záměr Autora
    31: [
        MathExamQuestion(id: "cs_teach_31_p1", topicId: 31, prompt: "Jaké jsou tři hlavní záměry autora?", options: ["Číst, psát, mluvit", "Informovat, přesvědčit, bavit", "Popisovat, analyzovat, hodnotit", "Vysvětlovat, definovat, porovnávat"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_31_p2", topicId: 31, prompt: "Jaký záměr má nejspíš novinový článek o počasí?", options: ["Přesvědčit", "Bavit", "Informovat", "Pobavit"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_31_p3", topicId: 31, prompt: "Jaký záměr má nejspíš reklamní text?", options: ["Informovat", "Přesvědčit", "Bavit", "Varovat"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_31_p4", topicId: 31, prompt: "Jaký záměr má nejspíš pohádka?", options: ["Přesvědčit", "Informovat", "Bavit", "Varovat"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_31_p5", topicId: 31, prompt: "Co je předpojatost (bias) v textu?", options: ["Neutrální prezentace faktů", "Upřednostňování jednoho pohledu nebo vynechávání jiných pohledů", "Použití vědeckých dat", "Přímá citace"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_31_p6", topicId: 31, prompt: "Jak poznáme, že text má záměr přesvědčit?", options: ["Obsahuje jen fakta a čísla", "Používá emocionální jazyk, argumenty a výzvy k akci", "Je psán neutrálně", "Popisuje historické události"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_31_p7", topicId: 31, prompt: "Autor píše: 'This dangerous, irresponsible policy must be stopped!' Jaký je záměr?", options: ["Informovat", "Bavit", "Přesvědčit", "Vysvětlit"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_31_p8", topicId: 31, prompt: "Který z textů nejspíš nemá předpojatost?", options: ["Reklamní brožura", "Politický projev", "Vědecká zpráva s peer review", "Osobní blog"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_31_p9", topicId: 31, prompt: "Záměr autora naučebnice matematiky je nejspíš:", options: ["Přesvědčit", "Informovat a vzdělávat", "Bavit", "Propagovat produkt"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_31_p10", topicId: 31, prompt: "Jak zjistíme záměr autora?", options: ["Přečteme jen titulek", "Sledujeme volbu slov, tón, typ informací a strukturu textu", "Zjistíme věk autora", "Spočítáme počet vět"], correctIndex: 1)
    ],

    // MARK: Topic 32 - Výzkum a Citace
    32: [
        MathExamQuestion(id: "cs_teach_32_p1", topicId: 32, prompt: "Co je parafrázování (paraphrasing)?", options: ["Doslovné opisování textu s uvozovkami", "Přepsání myšlenky vlastními slovy při zachování původního smyslu", "Vynechání citace", "Kopírování textu bez změny"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p2", topicId: 32, prompt: "Co je plagiátorství?", options: ["Používání vlastních slov", "Citování zdroje", "Vydávání cizí práce za svou bez uvedení zdroje", "Parafrázování s citací"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_32_p3", topicId: 32, prompt: "Kdy musíme citovat zdroj?", options: ["Jen při doslovném citování", "Při doslovném citování i parafrázování cizích myšlenek", "Nikdy, pokud použijeme vlastní slova", "Jen v akademických pracích"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p4", topicId: 32, prompt: "Jak vypadá správná MLA citace knihy?", options: ["Smith John, The Ocean, 2020.", "Smith, John. The Ocean. Blue Press, 2020.", "The Ocean by John Smith (2020)", "John Smith: The Ocean, Blue Press"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p5", topicId: 32, prompt: "Co je přímá citace (direct quote)?", options: ["Přepsání myšlenky vlastními slovy", "Doslovné převzetí textu zdroje uzavřené do uvozovek", "Odkaz na autora bez textu", "Shrnutí celého textu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p6", topicId: 32, prompt: "Která ze zdrojů je obvykle nejdůvěryhodnější pro výzkumnou práci?", options: ["Anonymní blog", "Wikipedia", "Recenzovaný vědecký časopis", "Sociální média"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_32_p7", topicId: 32, prompt: "Co je seznam použité literatury (Works Cited / Bibliography)?", options: ["Shrnutí práce", "Obsah práce", "Abecedně řazený seznam všech citovaných zdrojů na konci práce", "Rejstřík pojmů"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_32_p8", topicId: 32, prompt: "Proč je důležité uvádět zdroje?", options: ["Aby práce vypadala delší", "Aby čtenář mohl ověřit informace a autor projevil respekt k původní práci", "Je to jen formalita bez praktického smyslu", "Aby se vyhnout psaní vlastního textu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p9", topicId: 32, prompt: "Co je shrnutí (summary)?", options: ["Dословné kopírování textu", "Krátké přepsání hlavních myšlenek textu vlastními slovy", "Přidání vlastních názorů k textu", "Výběr nejzajímavějších citátů"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_32_p10", topicId: 32, prompt: "Zkratka MLA znamená:", options: ["Modern Language Association", "Mathematics and Literature Academy", "Multiple Language Approach", "Master of Liberal Arts"], correctIndex: 0)
    ],

    // MARK: Topic 33 - Shakespeare a Klasická Literatura
    33: [
        MathExamQuestion(id: "cs_teach_33_p1", topicId: 33, prompt: "Co je jambický pentametr?", options: ["Rýmové schéma ABAB", "Rytmický vzor s 10 slabikami: nepřízvučná + přízvučná, pětkrát za sebou", "Báseň se 14 verši", "Forma komedie"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p2", topicId: 33, prompt: "Kolik řádků má sonet (sonnet)?", options: ["10", "12", "14", "16"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_33_p3", topicId: 33, prompt: "Shakespearovská tragédie se obvykle vyznačuje:", options: ["Šťastným koncem a manželstvím", "Smrtí hlavního hrdiny a katarzí", "Komickými nedorozuměními", "Pohádkovým prostředím"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p4", topicId: 33, prompt: "Shakespearovská komedie se obvykle vyznačuje:", options: ["Smrtí hlavního hrdiny", "Šťastným koncem, obvykle manželstvím a smírem", "Válečnými konflikty", "Historickými událostmi"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p5", topicId: 33, prompt: "Která z her je Shakespearova tragédie?", options: ["A Midsummer Night's Dream", "Much Ado About Nothing", "Romeo and Juliet", "The Taming of the Shrew"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_33_p6", topicId: 33, prompt: "Který verš je příkladem jambického pentametru?", options: ["To be or not to be that is the question", "Shall I compare thee to a summer's day", "All the world's a stage", "Double double toil and trouble"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p7", topicId: 33, prompt: "Co je tragická vada (tragic flaw / hamartia)?", options: ["Chyba v textu hry", "Vlastnost nebo chyba hrdiny, která vede k jeho pádu", "Špatný překlad", "Vedlejší postava"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p8", topicId: 33, prompt: "Shakespearovy hry jsou psány převážně:", options: ["Moderní prózou", "Středověkou angličtinou (Early Modern English)", "Latinou", "Francouzštinou"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p9", topicId: 33, prompt: "Co je monolog (soliloquy) v divadle?", options: ["Dialog mezi dvěma postavami", "Řeč, kdy postava mluví sama pro sebe a odhaluje své myšlenky", "Sbor zpívající na jevišti", "Úvodní věta hry"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_33_p10", topicId: 33, prompt: "V jaké době žil a psal William Shakespeare?", options: ["Starověk (400 př. n. l.)", "Středověk (1000–1300)", "Renesance (přibližně 1564–1616)", "Romantismus (1800–1850)"], correctIndex: 2)
    ],

    // MARK: Topic 34 - Etymologie
    34: [
        MathExamQuestion(id: "cs_teach_34_p1", topicId: 34, prompt: "Co znamená řecký kořen 'bio'?", options: ["Země", "Voda", "Život", "Světlo"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_34_p2", topicId: 34, prompt: "Co znamená latinský kořen 'port'?", options: ["Říct", "Nést/přenášet", "Psát", "Vidět"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_34_p3", topicId: 34, prompt: "Co znamená řecký kořen 'geo'?", options: ["Čas", "Moře", "Vzduch", "Země"], correctIndex: 3),
        MathExamQuestion(id: "cs_teach_34_p4", topicId: 34, prompt: "Co znamená latinský kořen 'dict'?", options: ["Říct/pronést", "Psát", "Vidět", "Slyšet"], correctIndex: 0),
        MathExamQuestion(id: "cs_teach_34_p5", topicId: 34, prompt: "Co znamená latinský kořen 'scrib/script'?", options: ["Číst", "Počítat", "Psát", "Říct"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_34_p6", topicId: 34, prompt: "Slovo 'portable' obsahuje kořen 'port' (nést). Co znamená 'portable'?", options: ["Drahý", "Přenosný", "Těžký", "Starý"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_34_p7", topicId: 34, prompt: "Slovo 'biology' = bio (život) + logy (věda). Co je tedy biologie?", options: ["Věda o zemi", "Věda o životě", "Věda o hvězdách", "Věda o vodě"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_34_p8", topicId: 34, prompt: "Slovo 'dictionary' obsahuje kořen 'dict' (říct). Co je slovník?", options: ["Kniha s mapami", "Kniha zákonů", "Kniha vysvětlující slova a jejich výslovnost", "Kniha příběhů"], correctIndex: 2),
        MathExamQuestion(id: "cs_teach_34_p9", topicId: 34, prompt: "Co nejspíš znamená slovo 'manuscript' (kořen 'script' = psát, 'manu' = ruka)?", options: ["Tištěná kniha", "Ručně psaný nebo původní text", "Hudební nástroj", "Vědecký experiment"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_34_p10", topicId: 34, prompt: "Proč je znalost etymologie (kořenů slov) užitečná?", options: ["Pomáhá nám psát rychleji", "Pomáhá odhadnout význam neznámých slov v angličtině i jiných jazycích", "Je povinná pro zkoušky", "Nahrazuje slovník"], correctIndex: 1)
    ],

    // MARK: Topic 35 - Pokročilá Gramatika
    35: [
        MathExamQuestion(id: "cs_teach_35_p1", topicId: 35, prompt: "K čemu slouží středník (;) v angličtině?", options: ["Uvozuje seznam nebo výčet", "Spojuje dvě úzce související hlavní věty", "Označuje vsuvku", "Nahrazuje čárku v seznamu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p2", topicId: 35, prompt: "Která věta správně používá středník?", options: ["I love reading; books, magazines, and blogs.", "She was tired; so she went to bed.", "He bought milk; and bread.", "I am hungry; want to eat."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p3", topicId: 35, prompt: "K čemu slouží dvojtečka (:) v angličtině?", options: ["Spojuje dvě hlavní věty", "Uvozuje seznam, příklad nebo vysvětlení", "Označuje přímou řeč", "Nahrazuje středník"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p4", topicId: 35, prompt: "Která věta správně používá dvojtečku?", options: ["She needed: milk, eggs, and butter.", "She needed the following items: milk, eggs, and butter.", "She: needed milk eggs and butter.", "She needed milk: eggs and butter."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p5", topicId: 35, prompt: "K čemu slouží em pomlčka ( - ) v angličtině?", options: ["Odděluje položky v seznamu", "Zdůrazňuje vsuvku nebo dramatický přechod", "Nahrazuje dvojtečku vždy", "Označuje dialog"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p6", topicId: 35, prompt: "Co je paralelní struktura (parallel structure)?", options: ["Dvě věty se stejným podmětem", "Zachování stejné gramatické formy pro prvky ve výčtu nebo srovnání", "Použití středníku místo čárky", "Opakování stejného slova"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p7", topicId: 35, prompt: "Která věta má správnou paralelní strukturu?", options: ["She likes to read, writing, and to swim.", "She likes reading, writing, and swimming.", "She likes to read, to writing, and swim.", "She likes read, write, and to swim."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p8", topicId: 35, prompt: "Co je visící přívlastek (dangling modifier)?", options: ["Přídavné jméno bez podstatného jména", "Vedlejší věta, která gramaticky neodkazuje na správný podmět", "Příslovce na špatném místě ve větě", "Přísudek bez podmětu"], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p9", topicId: 35, prompt: "Která věta obsahuje visící přívlastek (dangling modifier)?", options: ["Running to the bus, Jake dropped his backpack.", "Running to the bus, the rain started.", "She ran quickly to the bus stop.", "After studying all night, she felt confident."], correctIndex: 1),
        MathExamQuestion(id: "cs_teach_35_p10", topicId: 35, prompt: "Která věta správně používá em pomlčku?", options: ["She had one dream - to travel the world.", "She had one dream  -  to, travel the world.", "She had one dream-to travel the world.", "She had one dream; to travel the world."], correctIndex: 0)
    ]
]
