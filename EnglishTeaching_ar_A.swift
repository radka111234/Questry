import Foundation

// MARK: - English Teaching Pack: Arabic (Topics 1-18)

let arTeachingTopicsA: [(id: Int, title: String, intro: String, example: String)] = [
    (1, "الأبجدية الإنجليزية", "تعلّم الحروف الـ 26 للأبجدية الإنجليزية وأصواتها وتمييز حروف العلة عن الحروف الساكنة.", "حرف 'A' يُنطق كما في كلمة 'apple' (تفاحة)، وهو من حروف العلة الخمسة: A, E, I, O, U."),
    (2, "حروف العلة القصيرة", "تعلّم كيفية نطق حروف العلة القصيرة في الكلمات الإنجليزية ذات النمط حرف ساكن + حرف علة + حرف ساكن (CVC).", "كلمة 'cat' (قطة) تحتوي على حرف العلة القصير 'a'، وكلمة 'dog' (كلب) تحتوي على 'o'."),
    (3, "الكلمات الشائعة", "تعلّم الكلمات الإنجليزية الأكثر شيوعاً التي تظهر في معظم النصوص مثل: the, and, is, was, are, have, said, you, they, from.", "جملة 'They are from here' (هم من هنا) تحتوي على ثلاث كلمات شائعة: they, are, from."),
    (4, "الجمل البسيطة", "تعلّم كيفية بناء جملة إنجليزية بسيطة تتكون من الفاعل (Subject) + الفعل (Verb) + المفعول (Object).", "جملة 'The cat drinks milk' (القطة تشرب الحليب): 'the cat' فاعل، 'drinks' فعل، 'milk' مفعول."),
    (5, "القوافي وعائلات الكلمات", "تعلّم الكلمات الإنجليزية المتقافية وعائلاتها مثل: عائلة '-at': cat/bat/hat، وعائلة '-an': can/man/ran.", "كلمات cat, bat, hat, mat تنتمي إلى عائلة '-at' وجميعها تقافي مع بعضها."),
    (6, "حروف العلة الطويلة", "تعلّم حروف العلة الطويلة وقاعدة الحرف 'E' الصامت في نهاية الكلمة التي تجعل حرف العلة يُنطق باسمه.", "كلمة 'cake' (كعكة): الـ 'E' الصامت في النهاية يجعل حرف 'a' يُنطق طويلاً /eɪ/ بدلاً من /æ/."),
    (7, "مجموعات الحروف الساكنة", "تعلّم مجموعات الحروف الساكنة المدمجة (blends) مثل: bl, br, cl, tr, st, sp، والحروف المزدوجة (digraphs) مثل: sh, ch, th, ph, wh.", "كلمة 'ship' (سفينة) تبدأ بـ digraph 'sh' الذي يُنطق صوتاً واحداً /ʃ/."),
    (8, "الأسماء والأفعال", "تعلّم الفرق بين الأسماء (Nouns) التي تدل على أشياء أو أشخاص أو أماكن، والأفعال (Verbs) التي تدل على أحداث أو حالات.", "كلمة 'dog' (كلب) اسم، وكلمة 'run' (يجري) فعل."),
    (9, "الصفات والظروف", "تعلّم الصفات (Adjectives) التي تصف الأسماء، والظروف (Adverbs) التي تصف الأفعال أو الصفات أو الظروف الأخرى.", "في جملة 'The big dog runs quickly': 'big' صفة تصف 'dog'، و'quickly' ظرف يصف 'runs'."),
    (10, "علامات الترقيم الإنجليزية", "تعلّم علامات الترقيم الأساسية في اللغة الإنجليزية: النقطة (.)، والفاصلة (,)، وعلامة الاستفهام (?)، وعلامة التعجب (!).", "الجملة الخبرية تنتهي بنقطة (.)، والجملة الاستفهامية تنتهي بعلامة استفهام (?)."),
    (11, "الكلمات المركبة والاختصارات", "تعلّم الكلمات المركبة (Compound Words) مثل: sunshine, football، والاختصارات (Contractions) مثل: don't, can't, I'm.", "كلمة 'sunshine' مركبة من 'sun' + 'shine'، وكلمة 'don't' اختصار لـ 'do not'."),
    (12, "البادئات واللواحق", "تعلّم البادئات (Prefixes) مثل: un-, re-، واللواحق (Suffixes) مثل: -ing, -ed, -er, -est, -ful, -less وكيف تغير معنى الكلمة.", "بادئة 'un-' تعني عكس الشيء: 'unhappy' = غير سعيد. لاحقة '-ful' تعني 'مليء بـ': 'helpful' = مفيد."),
    (13, "المترادفات والأضداد", "تعلّم المترادفات (Synonyms) وهي الكلمات ذات المعنى المتشابه، والأضداد (Antonyms) وهي الكلمات ذات المعنى المتعاكس.", "مترادفات: happy/glad (سعيد). أضداد: happy/sad (سعيد/حزين)، big/small (كبير/صغير)."),
    (14, "فهم المقروء", "تعلّم كيفية فهم النص الإنجليزي المقروء من خلال تحديد الفكرة الرئيسية والإجابة عن أسئلة: من؟ ماذا؟ أين؟ متى؟ لماذا؟", "عند قراءة قصة، اسأل نفسك: من الشخصية الرئيسية؟ ماذا حدث؟ أين ومتى؟ لماذا حدث ذلك؟"),
    (15, "عناصر القصة", "تعلّم العناصر الأساسية للقصة الإنجليزية: الشخصية (Character)، والمكان (Setting)، والحبكة (Plot)، والمشكلة (Problem)، والحل (Solution).", "في قصة 'The Three Little Pigs': الشخصيات ثلاثة خنازير، المشكلة هي الذئب، والحل هو بيت الطوب."),
    (16, "أنواع الجمل", "تعلّم الأنواع الأربعة للجمل الإنجليزية: الخبرية (Declarative)، والاستفهامية (Interrogative)، والتعجبية (Exclamatory)، والأمرية (Imperative).", "خبرية: 'I like cats.' استفهامية: 'Do you like cats?' تعجبية: 'What a great day!' أمرية: 'Sit down!'"),
    (17, "الكلمات المتشابهة نطقاً", "تعلّم الكلمات الإنجليزية المتشابهة في النطق لكنها تختلف في المعنى والكتابة (Homophones): there/their/they're, to/too/two, your/you're, its/it's.", "'there' = هناك، 'their' = ملكهم، 'they're' اختصار لـ 'they are'. جميعها تُنطق بنفس الطريقة!"),
    (18, "أقسام الكلام", "تعلّم أقسام الكلام الستة في اللغة الإنجليزية: الاسم (Noun)، والفعل (Verb)، والصفة (Adjective)، والظرف (Adverb)، والضمير (Pronoun)، وحرف الجر (Preposition).", "في جملة 'She quickly runs to school': 'She' ضمير، 'quickly' ظرف، 'runs' فعل، 'to' حرف جر، 'school' اسم.")
]

// MARK: - Practice Questions (10 per topic)

let arTeachingPracticeA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1  -  الأبجدية الإنجليزية
    1: [
        MathExamQuestion(id: "ar_teach_1_p1", topicId: 1, prompt: "كم عدد حروف الأبجدية الإنجليزية؟", options: ["٢٤", "٢٥", "٢٦", "٢٧"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_1_p2", topicId: 1, prompt: "أيٌّ من الحروف التالية ليس من حروف العلة (vowels) في اللغة الإنجليزية؟", options: ["A", "E", "B", "I"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_1_p3", topicId: 1, prompt: "كم عدد حروف العلة (vowels) في الأبجدية الإنجليزية؟", options: ["٣", "٤", "٥", "٦"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_1_p4", topicId: 1, prompt: "أيٌّ من الحروف التالية يأتي بعد حرف 'M' في الأبجدية الإنجليزية؟", options: ["L", "N", "O", "K"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_1_p5", topicId: 1, prompt: "أيٌّ من الكلمات التالية يبدأ بحرف علة (vowel)؟", options: ["cat", "dog", "apple", "bird"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_1_p6", topicId: 1, prompt: "ما هو الحرف الأول في الأبجدية الإنجليزية؟", options: ["B", "A", "Z", "E"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_1_p7", topicId: 1, prompt: "ما هو الحرف الأخير في الأبجدية الإنجليزية؟", options: ["X", "Y", "Z", "W"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_1_p8", topicId: 1, prompt: "أيٌّ من الحروف التالية حرف ساكن (consonant)؟", options: ["A", "E", "O", "T"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_1_p9", topicId: 1, prompt: "كلمة 'umbrella' (مظلة) تبدأ بأي حرف؟", options: ["A", "U", "O", "I"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_1_p10", topicId: 1, prompt: "أيٌّ من الحروف التالية يأتي بين حرفَي 'D' و'F' في الأبجدية؟", options: ["C", "E", "G", "B"], correctIndex: 1)
    ],

    // MARK: Topic 2  -  حروف العلة القصيرة
    2: [
        MathExamQuestion(id: "ar_teach_2_p1", topicId: 2, prompt: "كلمة 'cat' (قطة) تحتوي على أي حرف علة قصير؟", options: ["e", "i", "a", "o"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_2_p2", topicId: 2, prompt: "كلمة 'dog' (كلب) تحتوي على أي حرف علة قصير؟", options: ["a", "o", "u", "i"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_2_p3", topicId: 2, prompt: "كلمة 'sit' (يجلس) تحتوي على أي حرف علة قصير؟", options: ["e", "a", "i", "u"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_2_p4", topicId: 2, prompt: "كلمة 'cup' (كوب) تحتوي على أي حرف علة قصير؟", options: ["o", "a", "e", "u"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_2_p5", topicId: 2, prompt: "أيٌّ من الكلمات التالية يتبع النمط CVC (حرف ساكن + حرف علة + حرف ساكن)؟", options: ["street", "cat", "play", "train"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_2_p6", topicId: 2, prompt: "كلمة 'hop' (يقفز) تحتوي على أي حرف علة قصير؟", options: ["u", "a", "o", "i"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_2_p7", topicId: 2, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة القصير 'e'؟", options: ["cat", "hit", "bed", "pot"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_2_p8", topicId: 2, prompt: "ما هو حرف العلة في كلمة 'pin' (دبوس)؟", options: ["p", "i", "n", "u"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_2_p9", topicId: 2, prompt: "كلمة 'bug' (خنفساء) تحتوي على أي حرف علة قصير؟", options: ["a", "i", "e", "u"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_2_p10", topicId: 2, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة القصير 'o'؟", options: ["bit", "bat", "hot", "but"], correctIndex: 2)
    ],

    // MARK: Topic 3  -  الكلمات الشائعة
    3: [
        MathExamQuestion(id: "ar_teach_3_p1", topicId: 3, prompt: "ما معنى كلمة 'the' في العربية؟", options: ["في", "على", "أداة التعريف (الـ)", "و"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_3_p2", topicId: 3, prompt: "ما معنى كلمة 'and' في العربية؟", options: ["أو", "لكن", "و", "لأن"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_3_p3", topicId: 3, prompt: "ما معنى كلمة 'said' في العربية؟", options: ["ذهب", "قال", "جاء", "رأى"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_3_p4", topicId: 3, prompt: "أكمل الجملة: 'They ___ my friends.' بالكلمة الشائعة المناسبة.", options: ["is", "am", "are", "be"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_3_p5", topicId: 3, prompt: "ما معنى كلمة 'from' في العربية؟", options: ["إلى", "في", "على", "من"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_3_p6", topicId: 3, prompt: "أيٌّ من الكلمات التالية يمكن استخدامها بدلاً من 'is' مع ضمير 'they'؟", options: ["is", "am", "are", "was"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_3_p7", topicId: 3, prompt: "ما معنى كلمة 'have' في العربية؟", options: ["يريد", "يعطي", "يحتاج", "يملك"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_3_p8", topicId: 3, prompt: "أكمل الجملة: '___ are you?' بالكلمة الشائعة المناسبة.", options: ["What", "How", "Where", "Who"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_3_p9", topicId: 3, prompt: "ما معنى كلمة 'you' في العربية؟", options: ["هو", "هي", "أنت/أنتِ", "نحن"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_3_p10", topicId: 3, prompt: "أيٌّ من الكلمات التالية يعني 'كان' في الماضي (للمفرد)؟", options: ["are", "is", "was", "be"], correctIndex: 2)
    ],

    // MARK: Topic 4  -  الجمل البسيطة
    4: [
        MathExamQuestion(id: "ar_teach_4_p1", topicId: 4, prompt: "في جملة 'The boy reads a book' ما هو الفاعل (Subject)؟", options: ["reads", "a book", "The boy", "book"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_4_p2", topicId: 4, prompt: "في جملة 'Sara eats an apple' ما هو الفعل (Verb)؟", options: ["Sara", "apple", "an", "eats"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_4_p3", topicId: 4, prompt: "في جملة 'The dog chases the cat' ما هو المفعول به (Object)؟", options: ["The dog", "chases", "the cat", "dog"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_4_p4", topicId: 4, prompt: "أيٌّ من الخيارات التالية يُكمّل الجملة بشكل صحيح: 'She ___ to school every day.'", options: ["go", "goes", "going", "went"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_4_p5", topicId: 4, prompt: "أيٌّ من الجمل التالية مبنية بشكل صحيح (S + V + O)؟", options: ["Ball the kicks boy.", "The boy kicks the ball.", "Kicks boy the ball.", "The ball boy kicks."], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_4_p6", topicId: 4, prompt: "ما هو الفاعل في جملة 'Birds sing beautiful songs'؟", options: ["sing", "beautiful", "songs", "Birds"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_4_p7", topicId: 4, prompt: "أيٌّ من الجمل التالية تعني: 'القطة تشرب الحليب'؟", options: ["The milk drinks cat.", "The cat drinks milk.", "Drinks the cat milk.", "Cat the milk drinks."], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_4_p8", topicId: 4, prompt: "في جملة بسيطة، ما الترتيب الصحيح للكلمات؟", options: ["Object + Verb + Subject", "Verb + Subject + Object", "Subject + Verb + Object", "Object + Subject + Verb"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_4_p9", topicId: 4, prompt: "أيٌّ من الجمل التالية تعني: 'أحمد يلعب كرة القدم'؟", options: ["Football plays Ahmed.", "Ahmed plays football.", "Plays football Ahmed.", "Ahmed football plays."], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_4_p10", topicId: 4, prompt: "في جملة 'We love pizza' ما هو المفعول به؟", options: ["We", "love", "pizza", "We love"], correctIndex: 2)
    ],

    // MARK: Topic 5  -  القوافي وعائلات الكلمات
    5: [
        MathExamQuestion(id: "ar_teach_5_p1", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع كلمة 'cat'؟", options: ["dog", "hat", "cup", "run"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_5_p2", topicId: 5, prompt: "أيٌّ من الكلمات التالية تنتمي إلى عائلة '-an'؟", options: ["cat", "hat", "ran", "bit"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_5_p3", topicId: 5, prompt: "كلمات 'bat, cat, hat, mat' تنتمي جميعها إلى عائلة:", options: ["-an", "-in", "-at", "-ot"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_5_p4", topicId: 5, prompt: "أيٌّ من الكلمات التالية لا تقافي مع 'man'؟", options: ["can", "pan", "fan", "pin"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_5_p5", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'hop'؟", options: ["hat", "hip", "top", "cup"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_5_p6", topicId: 5, prompt: "كلمات 'sit, bit, hit, kit' تنتمي إلى عائلة:", options: ["-at", "-it", "-ot", "-ut"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_5_p7", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'sun'؟", options: ["son", "sin", "sit", "sap"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_5_p8", topicId: 5, prompt: "أضف كلمة جديدة إلى عائلة '-ug': bug, mug, rug, ___", options: ["bat", "jug", "bit", "bag"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_5_p9", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'red'؟", options: ["rid", "rad", "bed", "rod"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_5_p10", topicId: 5, prompt: "عائلة '-ot' تشمل: hot, pot, dot, ___. أيٌّ من الكلمات التالية ينتمي إليها؟", options: ["hat", "hit", "lot", "bat"], correctIndex: 2)
    ],

    // MARK: Topic 6  -  حروف العلة الطويلة
    6: [
        MathExamQuestion(id: "ar_teach_6_p1", topicId: 6, prompt: "في كلمة 'cake' (كعكة)، ما الذي يجعل حرف 'a' يُنطق طويلاً؟", options: ["حرف 'c' في البداية", "حرف 'e' الصامت في النهاية", "حرف 'k'", "لا يوجد سبب"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_6_p2", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف علة طويل؟", options: ["cat", "sit", "hop", "bike"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_6_p3", topicId: 6, prompt: "كلمة 'hope' (أمل) تحتوي على حرف علة طويل. ما هو؟", options: ["h", "p", "o", "e"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_6_p4", topicId: 6, prompt: "إضافة حرف 'e' في نهاية كلمة 'pin' يُحوّلها إلى:", options: ["pin", "pine", "pen", "pan"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_6_p5", topicId: 6, prompt: "أيٌّ من الكلمات التالية يتبع قاعدة الـ 'E' الصامت؟", options: ["cat", "hop", "cute", "bit"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_6_p6", topicId: 6, prompt: "إضافة حرف 'e' في نهاية كلمة 'hop' يُحوّلها إلى:", options: ["hop", "hip", "hope", "heap"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_6_p7", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة الطويل 'i'؟", options: ["sit", "bit", "kite", "hit"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_6_p8", topicId: 6, prompt: "كلمة 'cube' (مكعب) تحتوي على حرف علة طويل. ما هو؟", options: ["c", "u", "b", "e"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_6_p9", topicId: 6, prompt: "إضافة حرف 'e' في نهاية كلمة 'kit' يُحوّلها إلى:", options: ["kit", "kate", "kite", "cute"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_6_p10", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة الطويل 'a'؟", options: ["cat", "bat", "hat", "cake"], correctIndex: 3)
    ],

    // MARK: Topic 7  -  مجموعات الحروف الساكنة
    7: [
        MathExamQuestion(id: "ar_teach_7_p1", topicId: 7, prompt: "كلمة 'ship' (سفينة) تبدأ بـ digraph. ما هو؟", options: ["si", "sh", "hi", "sp"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_7_p2", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend (مجموعة حروف ساكنة مدمجة)؟", options: ["ship", "chat", "train", "then"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_7_p3", topicId: 7, prompt: "كلمة 'photo' (صورة) تبدأ بـ digraph يُنطق /f/. ما هو؟", options: ["ph", "po", "pt", "ho"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_7_p4", topicId: 7, prompt: "أيٌّ من الكلمات التالية يحتوي على digraph 'ch'؟", options: ["star", "chair", "train", "black"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_7_p5", topicId: 7, prompt: "كلمة 'black' (أسود) تبدأ بـ blend. ما هو؟", options: ["ba", "la", "bl", "ac"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_7_p6", topicId: 7, prompt: "digraph 'th' في كلمة 'the' يُنطق بأي صوت؟", options: ["/t/", "/d/", "/th/", "/s/"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_7_p7", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend 'st'؟", options: ["ship", "star", "chat", "when"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_7_p8", topicId: 7, prompt: "كلمة 'when' (متى) تبدأ بـ digraph. ما هو؟", options: ["we", "he", "wh", "en"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_7_p9", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend 'br'؟", options: ["black", "bread", "chest", "phone"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_7_p10", topicId: 7, prompt: "كلمة 'splash' تبدأ بـ blend ثلاثي. ما هو؟", options: ["sp", "spl", "pl", "ash"], correctIndex: 1)
    ],

    // MARK: Topic 8  -  الأسماء والأفعال
    8: [
        MathExamQuestion(id: "ar_teach_8_p1", topicId: 8, prompt: "أيٌّ من الكلمات التالية اسم (noun)؟", options: ["run", "happy", "school", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_8_p2", topicId: 8, prompt: "أيٌّ من الكلمات التالية فعل (verb)؟", options: ["cat", "big", "jump", "house"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_8_p3", topicId: 8, prompt: "في جملة 'The children play in the park'، ما هو الفعل؟", options: ["children", "park", "play", "The"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_8_p4", topicId: 8, prompt: "في جملة 'My dog barks loudly'، ما هو الاسم؟", options: ["barks", "loudly", "My", "dog"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_8_p5", topicId: 8, prompt: "أيٌّ من الكلمات التالية يمكن أن يكون اسماً وفعلاً معاً؟", options: ["big", "run", "quickly", "the"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_8_p6", topicId: 8, prompt: "كلمة 'teacher' (معلم) هي:", options: ["فعل", "صفة", "اسم", "ظرف"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_8_p7", topicId: 8, prompt: "كلمة 'sleep' (ينام) هي:", options: ["اسم", "فعل", "صفة", "ظرف"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_8_p8", topicId: 8, prompt: "أيٌّ من الكلمات التالية ليست اسماً؟", options: ["city", "eat", "friend", "book"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_8_p9", topicId: 8, prompt: "في جملة 'Sara reads every night'، ما هو الفعل؟", options: ["Sara", "reads", "every", "night"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_8_p10", topicId: 8, prompt: "أيٌّ من الكلمات التالية اسم مكان (place noun)؟", options: ["swim", "hospital", "blue", "fast"], correctIndex: 1)
    ],

    // MARK: Topic 9  -  الصفات والظروف
    9: [
        MathExamQuestion(id: "ar_teach_9_p1", topicId: 9, prompt: "أيٌّ من الكلمات التالية صفة (adjective)؟", options: ["run", "quickly", "beautiful", "sing"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_9_p2", topicId: 9, prompt: "أيٌّ من الكلمات التالية ظرف (adverb)؟", options: ["happy", "dog", "slowly", "red"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_9_p3", topicId: 9, prompt: "في جملة 'The big dog runs fast'، أيٌّ منها صفة؟", options: ["dog", "runs", "fast", "big"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_9_p4", topicId: 9, prompt: "في جملة 'She sings loudly'، أيٌّ منها ظرف؟", options: ["She", "sings", "loudly", "the"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_9_p5", topicId: 9, prompt: "الصفة في اللغة الإنجليزية تصف:", options: ["الفعل", "الاسم", "الجملة كلها", "الظرف"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_9_p6", topicId: 9, prompt: "الظرف في اللغة الإنجليزية يصف:", options: ["الاسم", "الفعل أو الصفة أو ظرف آخر", "الضمير فقط", "الاسم فقط"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_9_p7", topicId: 9, prompt: "أيٌّ من الكلمات التالية ظرف مكوّن بإضافة '-ly'؟", options: ["quick", "quickly", "quicker", "quickest"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_9_p8", topicId: 9, prompt: "في عبارة 'a tall building' (بناية طويلة)، أيٌّ منها صفة؟", options: ["a", "tall", "building", "a tall"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_9_p9", topicId: 9, prompt: "أيٌّ من الجمل التالية تحتوي على ظرف؟", options: ["The cat is big.", "She runs quickly.", "I have a dog.", "He is a boy."], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_9_p10", topicId: 9, prompt: "أيٌّ من الكلمات التالية يمكن استخدامها صفةً في الإنجليزية؟", options: ["happily", "sing", "small", "run"], correctIndex: 2)
    ],

    // MARK: Topic 10  -  علامات الترقيم الإنجليزية
    10: [
        MathExamQuestion(id: "ar_teach_10_p1", topicId: 10, prompt: "أيٌّ من علامات الترقيم التالية تُستخدم في نهاية الجملة الخبرية؟", options: ["?", "!", ",", "."], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_10_p2", topicId: 10, prompt: "أيٌّ من علامات الترقيم التالية تُستخدم في نهاية الجملة الاستفهامية؟", options: [".", "!", "?", ","], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_10_p3", topicId: 10, prompt: "أيٌّ من علامات الترقيم التالية تُستخدم في نهاية الجملة التعجبية؟", options: [".", "?", ",", "!"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_10_p4", topicId: 10, prompt: "الفاصلة (comma) تُستخدم في:", options: ["نهاية الجملة", "الفصل بين العناصر في قائمة", "بداية الجملة", "علامة السؤال"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_10_p5", topicId: 10, prompt: "أيٌّ من الجمل التالية يحتوي على علامة الترقيم الصحيحة؟", options: ["I like cats?", "What is your name.", "She is happy!", "He runs,"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_10_p6", topicId: 10, prompt: "في الجملة: 'I have a cat, a dog, and a fish.' كم فاصلة تحتوي؟", options: ["١", "٢", "٣", "٤"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_10_p7", topicId: 10, prompt: "ما علامة الترقيم الصحيحة في نهاية: 'Where do you live'؟", options: [".", "!", ",", "?"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_10_p8", topicId: 10, prompt: "ما علامة الترقيم الصحيحة في نهاية: 'What a beautiful day'؟", options: ["?", ".", ",", "!"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_10_p9", topicId: 10, prompt: "الجملة التالية تحتوي على خطأ في الترقيم: 'My name is Sara?' أيٌّ علامة الترقيم الصحيحة؟", options: ["!", ",", ".", "؟"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_10_p10", topicId: 10, prompt: "تُستخدم الفاصلة (,) عادةً قبل أي كلمة في القائمة؟", options: ["الكلمة الأولى", "الكلمة الوسطى فقط", "قبل 'and' في آخر القائمة", "لا تُستخدم أبداً"], correctIndex: 2)
    ],

    // MARK: Topic 11  -  الكلمات المركبة والاختصارات
    11: [
        MathExamQuestion(id: "ar_teach_11_p1", topicId: 11, prompt: "كلمة 'sunshine' مركبة من كلمتَين. ما هما؟", options: ["sun + set", "sun + shine", "sum + shine", "son + shine"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_11_p2", topicId: 11, prompt: "ما الكلمتان اللتان تكوّنان 'football'؟", options: ["foot + ball", "for + ball", "food + all", "fool + ball"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_11_p3", topicId: 11, prompt: "اختصار 'don't' يعني:", options: ["do not", "does not", "did not", "doing not"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_11_p4", topicId: 11, prompt: "اختصار 'I'm' يعني:", options: ["I may", "I am", "I might", "I must"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_11_p5", topicId: 11, prompt: "أيٌّ من الكلمات التالية كلمة مركبة (compound word)؟", options: ["beautiful", "rainbow", "quickly", "unhappy"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_11_p6", topicId: 11, prompt: "اختصار 'can't' يعني:", options: ["can not", "could not", "will not", "do not"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_11_p7", topicId: 11, prompt: "ما الكلمتان اللتان تكوّنان 'bedroom'؟", options: ["bed + room", "be + droom", "bird + room", "bead + room"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_11_p8", topicId: 11, prompt: "اختصار 'they're' يعني:", options: ["they were", "they are", "they will", "they have"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_11_p9", topicId: 11, prompt: "أيٌّ من الكلمات التالية كلمة مركبة؟", options: ["helpful", "starfish", "slowly", "unreal"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_11_p10", topicId: 11, prompt: "اختصار 'we'll' يعني:", options: ["we will", "we all", "we well", "we shall"], correctIndex: 0)
    ],

    // MARK: Topic 12  -  البادئات واللواحق
    12: [
        MathExamQuestion(id: "ar_teach_12_p1", topicId: 12, prompt: "ما معنى بادئة 'un-' في كلمة 'unhappy'؟", options: ["جداً", "غير / عكس", "مرة أخرى", "قبل"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p2", topicId: 12, prompt: "كلمة 'replay' تحتوي على بادئة 're-'. ما معناها؟", options: ["عكس", "غير", "مرة أخرى", "معاً"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_12_p3", topicId: 12, prompt: "لاحقة '-ing' في كلمة 'running' تدل على:", options: ["الماضي", "الحاضر المستمر", "المستقبل", "الأمر"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p4", topicId: 12, prompt: "لاحقة '-ed' في كلمة 'walked' تدل على:", options: ["الحاضر", "الماضي", "المستقبل", "الأمر"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p5", topicId: 12, prompt: "كلمة 'helpful' تحتوي على لاحقة '-ful'. ما معناها؟", options: ["بدون", "ممتلئ بـ / يتصف بـ", "عكس", "مرة أخرى"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p6", topicId: 12, prompt: "كلمة 'careless' تحتوي على لاحقة '-less'. ما معناها؟", options: ["ممتلئ بـ", "بدون / منعدم", "أكثر", "الأكثر"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p7", topicId: 12, prompt: "ما معنى كلمة 'unkind'؟", options: ["لطيف جداً", "غير لطيف", "لطيف مرة أخرى", "الأكثر لطفاً"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p8", topicId: 12, prompt: "لاحقة '-er' في كلمة 'faster' تُستخدم لـ:", options: ["المبالغة", "المقارنة (أسرع)", "التصغير", "الجمع"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p9", topicId: 12, prompt: "لاحقة '-est' في كلمة 'fastest' تُستخدم لـ:", options: ["المقارنة", "أعلى درجة (الأسرع)", "الفاعل", "الماضي"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_12_p10", topicId: 12, prompt: "أيٌّ من الكلمات التالية تحتوي على بادئة؟", options: ["helpful", "sadly", "redo", "teacher"], correctIndex: 2)
    ],

    // MARK: Topic 13  -  المترادفات والأضداد
    13: [
        MathExamQuestion(id: "ar_teach_13_p1", topicId: 13, prompt: "ما مرادف (synonym) كلمة 'happy' (سعيد)؟", options: ["sad", "glad", "angry", "scared"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_13_p2", topicId: 13, prompt: "ما ضد (antonym) كلمة 'big' (كبير)؟", options: ["huge", "large", "small", "tall"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_13_p3", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لكلمة 'fast' (سريع)؟", options: ["slow", "quick", "lazy", "calm"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_13_p4", topicId: 13, prompt: "ما ضد كلمة 'hot' (حار)؟", options: ["warm", "cool", "cold", "mild"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_13_p5", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لكلمة 'begin' (يبدأ)؟", options: ["end", "stop", "start", "finish"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_13_p6", topicId: 13, prompt: "ما ضد كلمة 'day' (نهار)؟", options: ["morning", "noon", "night", "evening"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_13_p7", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لكلمة 'beautiful' (جميل)؟", options: ["ugly", "pretty", "plain", "boring"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_13_p8", topicId: 13, prompt: "ما ضد كلمة 'up' (فوق)؟", options: ["high", "above", "over", "down"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_13_p9", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لكلمة 'smart' (ذكي)؟", options: ["dumb", "clever", "slow", "lazy"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_13_p10", topicId: 13, prompt: "ما ضد كلمة 'open' (مفتوح)؟", options: ["wide", "unlock", "close", "ajar"], correctIndex: 2)
    ],

    // MARK: Topic 14  -  فهم المقروء
    14: [
        MathExamQuestion(id: "ar_teach_14_p1", topicId: 14, prompt: "سؤال 'Who?' في فهم المقروء يسأل عن:", options: ["المكان", "الزمان", "الشخصية", "السبب"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_14_p2", topicId: 14, prompt: "سؤال 'Where?' في فهم المقروء يسأل عن:", options: ["الشخصية", "المكان", "الزمان", "السبب"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_14_p3", topicId: 14, prompt: "سؤال 'Why?' في فهم المقروء يسأل عن:", options: ["المكان", "الشخصية", "السبب", "الطريقة"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_14_p4", topicId: 14, prompt: "الفكرة الرئيسية (main idea) للنص هي:", options: ["أول جملة فقط", "آخر جملة فقط", "الموضوع الأساسي الذي يتحدث عنه النص", "أطول جملة في النص"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_14_p5", topicId: 14, prompt: "اقرأ: 'Sara loves cats. She has three cats at home. She feeds them every day.' ما الفكرة الرئيسية؟", options: ["سارة تذهب للمدرسة", "سارة تحب القطط وتعتني بها", "القطط تأكل كثيراً", "لدى سارة منزل كبير"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_14_p6", topicId: 14, prompt: "سؤال 'When?' في فهم المقروء يسأل عن:", options: ["المكان", "الشخصية", "السبب", "الزمان"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_14_p7", topicId: 14, prompt: "سؤال 'What?' في فهم المقروء يسأل عن:", options: ["الشيء أو الحدث", "المكان", "الشخصية", "السبب"], correctIndex: 0),
        MathExamQuestion(id: "ar_teach_14_p8", topicId: 14, prompt: "اقرأ: 'Tom went to the park on Sunday. He played football with his friends.' متى ذهب Tom إلى الحديقة؟", options: ["يوم السبت", "يوم الأحد", "يوم الجمعة", "يوم الاثنين"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_14_p9", topicId: 14, prompt: "التفاصيل الداعمة (supporting details) في النص تقوم بـ:", options: ["تقديم فكرة جديدة", "دعم وتوضيح الفكرة الرئيسية", "تغيير موضوع النص", "إنهاء النص"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_14_p10", topicId: 14, prompt: "اقرأ: 'Ali did not sleep well. He was tired all day.' لماذا كان علي متعباً؟", options: ["لأنه أكل كثيراً", "لأنه لم ينم جيداً", "لأنه جرى كثيراً", "لأنه مريض"], correctIndex: 1)
    ],

    // MARK: Topic 15  -  عناصر القصة
    15: [
        MathExamQuestion(id: "ar_teach_15_p1", topicId: 15, prompt: "الشخصية (Character) في القصة هي:", options: ["مكان أحداث القصة", "الشخص أو الحيوان الذي تدور حوله القصة", "المشكلة في القصة", "نهاية القصة"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_15_p2", topicId: 15, prompt: "المكان (Setting) في القصة يشير إلى:", options: ["الشخصية الرئيسية", "أين ومتى تجري أحداث القصة", "المشكلة الرئيسية", "حل المشكلة"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_15_p3", topicId: 15, prompt: "الحبكة (Plot) في القصة هي:", options: ["الشخصية الرئيسية", "مكان الأحداث", "تسلسل الأحداث في القصة", "وصف الشخصيات"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_15_p4", topicId: 15, prompt: "المشكلة (Problem) في القصة هي:", options: ["نهاية القصة السعيدة", "التحدي أو العقبة التي تواجه الشخصية", "مكان أحداث القصة", "وصف الشخصية"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_15_p5", topicId: 15, prompt: "الحل (Solution) في القصة هو:", options: ["بداية القصة", "مكان الأحداث", "كيف تحل الشخصية مشكلتها", "وصف الطقس في القصة"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_15_p6", topicId: 15, prompt: "في قصة 'The Three Little Pigs'، ما هي المشكلة؟", options: ["الخنازير الثلاثة تبني منازل", "الذئب يحاول هدم منازل الخنازير", "الخنازير تأكل", "الخنازير تلعب"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_15_p7", topicId: 15, prompt: "في قصة 'Goldilocks and the Three Bears'، من هي الشخصية الرئيسية؟", options: ["الدب الكبير", "Goldilocks", "الدب الصغير", "أم الدببة"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_15_p8", topicId: 15, prompt: "ما العنصر الذي يأتي عادةً في نهاية القصة؟", options: ["المشكلة", "المكان", "الشخصية", "الحل"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_15_p9", topicId: 15, prompt: "إذا كانت القصة تجري 'في غابة مظلمة في الليل'، فهذا يصف:", options: ["الشخصية", "المشكلة", "المكان والزمان", "الحل"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_15_p10", topicId: 15, prompt: "كم عنصراً رئيسياً تتكون منه القصة؟", options: ["٣", "٤", "٥", "٦"], correctIndex: 2)
    ],

    // MARK: Topic 16  -  أنواع الجمل
    16: [
        MathExamQuestion(id: "ar_teach_16_p1", topicId: 16, prompt: "الجملة 'I like ice cream.' هي جملة:", options: ["استفهامية", "تعجبية", "خبرية", "أمرية"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_16_p2", topicId: 16, prompt: "الجملة 'What is your name?' هي جملة:", options: ["خبرية", "استفهامية", "تعجبية", "أمرية"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_16_p3", topicId: 16, prompt: "الجملة 'What a wonderful surprise!' هي جملة:", options: ["خبرية", "استفهامية", "تعجبية", "أمرية"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_16_p4", topicId: 16, prompt: "الجملة 'Please close the door.' هي جملة:", options: ["خبرية", "استفهامية", "تعجبية", "أمرية"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_16_p5", topicId: 16, prompt: "الجملة الخبرية (Declarative) تنتهي بـ:", options: ["؟", "!", ",", "."], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_16_p6", topicId: 16, prompt: "الجملة الاستفهامية (Interrogative) تنتهي بـ:", options: [".", "!", "?", ","], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_16_p7", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة أمرية (Imperative)؟", options: ["I am happy.", "Are you tired?", "How great!", "Sit down, please."], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_16_p8", topicId: 16, prompt: "الجملة 'She has a beautiful dress.' هي:", options: ["أمرية", "تعجبية", "استفهامية", "خبرية"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_16_p9", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة تعجبية (Exclamatory)؟", options: ["I go to school.", "Do you like cats?", "How amazing that is!", "Come here."], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_16_p10", topicId: 16, prompt: "الجملة الأمرية (Imperative) عادةً تبدأ بـ:", options: ["ضمير", "فعل", "صفة", "اسم"], correctIndex: 1)
    ],

    // MARK: Topic 17  -  الكلمات المتشابهة نطقاً
    17: [
        MathExamQuestion(id: "ar_teach_17_p1", topicId: 17, prompt: "أيٌّ من الكلمات التالية تعني 'هناك' (في ذلك المكان)؟", options: ["their", "they're", "there", "the"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_17_p2", topicId: 17, prompt: "في جملة '___ going to the park.' أيٌّ الصحيح؟", options: ["Their", "There", "They're", "The're"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_17_p3", topicId: 17, prompt: "كلمة 'their' تعني:", options: ["هناك", "هم يكونون", "ملكهم/ملكهن", "هم"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_17_p4", topicId: 17, prompt: "أيٌّ من الكلمات التالية تعني 'إلى' (للمكان)؟", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_17_p5", topicId: 17, prompt: "كلمة 'too' يمكن أن تعني:", options: ["إلى / لـ", "اثنان أو أيضاً", "من", "في"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_17_p6", topicId: 17, prompt: "في جملة 'I have ___ cats.' أيٌّ الصحيح؟", options: ["to", "too", "two", "tow"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_17_p7", topicId: 17, prompt: "كلمة 'your' تعني:", options: ["أنت تكون", "ملكك/ملككِ", "هناك", "هم"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_17_p8", topicId: 17, prompt: "كلمة 'you're' هي اختصار لـ:", options: ["your are", "you are", "you were", "you have"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_17_p9", topicId: 17, prompt: "في جملة 'The cat licked ___ paw.' أيٌّ الصحيح؟", options: ["it's", "its", "its'", "it"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_17_p10", topicId: 17, prompt: "كلمة 'it's' هي اختصار لـ:", options: ["its own", "it is أو it has", "it was", "it will"], correctIndex: 1)
    ],

    // MARK: Topic 18  -  أقسام الكلام
    18: [
        MathExamQuestion(id: "ar_teach_18_p1", topicId: 18, prompt: "أيٌّ من الكلمات التالية اسم (noun)؟", options: ["run", "beautiful", "school", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_18_p2", topicId: 18, prompt: "أيٌّ من الكلمات التالية فعل (verb)؟", options: ["cat", "happy", "write", "blue"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_18_p3", topicId: 18, prompt: "أيٌّ من الكلمات التالية صفة (adjective)؟", options: ["run", "slowly", "tall", "they"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_18_p4", topicId: 18, prompt: "أيٌّ من الكلمات التالية ظرف (adverb)؟", options: ["cat", "sing", "red", "gently"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_18_p5", topicId: 18, prompt: "أيٌّ من الكلمات التالية ضمير (pronoun)؟", options: ["house", "run", "she", "big"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_18_p6", topicId: 18, prompt: "أيٌّ من الكلمات التالية حرف جر (preposition)؟", options: ["sing", "under", "happy", "they"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_18_p7", topicId: 18, prompt: "في جملة 'He runs fast'، ما قسم الكلمة 'He'؟", options: ["اسم", "فعل", "ضمير", "صفة"], correctIndex: 2),
        MathExamQuestion(id: "ar_teach_18_p8", topicId: 18, prompt: "في جملة 'The book is on the table'، ما قسم الكلمة 'on'؟", options: ["فعل", "صفة", "ظرف", "حرف جر"], correctIndex: 3),
        MathExamQuestion(id: "ar_teach_18_p9", topicId: 18, prompt: "كلمة 'beautiful' في جملة 'She has a beautiful dress' هي:", options: ["اسم", "صفة", "ظرف", "ضمير"], correctIndex: 1),
        MathExamQuestion(id: "ar_teach_18_p10", topicId: 18, prompt: "كم قسماً من أقسام الكلام تعلمناها؟", options: ["٤", "٥", "٦", "٧"], correctIndex: 2)
    ]
]

// MARK: - Exam Questions (10 per topic)

let arTeachingExamA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1  -  الأبجدية الإنجليزية
    1: [
        MathExamQuestion(id: "ar_exam_1_e1", topicId: 1, prompt: "حروف العلة (vowels) في الأبجدية الإنجليزية هي:", options: ["A, B, C, D, E", "A, E, I, O, U", "A, E, I, O, Y", "B, D, F, H, J"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_1_e2", topicId: 1, prompt: "ما هو الحرف العاشر في الأبجدية الإنجليزية؟", options: ["H", "I", "J", "K"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e3", topicId: 1, prompt: "أيٌّ من الكلمات التالية جميع حروفها حروف ساكنة (consonants) فقط؟", options: ["apple", "egg", "str", "out"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e4", topicId: 1, prompt: "حرف 'Y' في الأبجدية الإنجليزية يمكن أن يكون:", options: ["حرف ساكن فقط", "حرف علة فقط", "حرف ساكن أو حرف علة حسب موضعه", "ليس حرفاً إنجليزياً"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e5", topicId: 1, prompt: "أيٌّ من الحروف التالية يأتي بين 'P' و'R' في الأبجدية؟", options: ["O", "Q", "S", "N"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_1_e6", topicId: 1, prompt: "كم حرفاً ساكناً (consonant) يوجد في الأبجدية الإنجليزية؟", options: ["١٩", "٢٠", "٢١", "٢٢"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e7", topicId: 1, prompt: "أيٌّ من الكلمات التالية تبدأ بحرف ساكن؟", options: ["apple", "egg", "island", "dog"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_1_e8", topicId: 1, prompt: "الحرف 'E' هو الحرف رقم ___ في الأبجدية الإنجليزية.", options: ["٣", "٤", "٥", "٦"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e9", topicId: 1, prompt: "أيٌّ من الكلمات التالية تحتوي على حرفَي علة؟", options: ["cat", "dog", "rain", "sit"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_1_e10", topicId: 1, prompt: "ما هو الحرف الذي يأتي قبل 'Z' مباشرةً في الأبجدية؟", options: ["X", "Y", "W", "V"], correctIndex: 1)
    ],

    // MARK: Topic 2  -  حروف العلة القصيرة
    2: [
        MathExamQuestion(id: "ar_exam_2_e1", topicId: 2, prompt: "أيٌّ من الكلمات التالية تتبع النمط CVC وتحتوي على حرف علة قصير 'u'؟", options: ["cat", "bit", "sun", "hop"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_2_e2", topicId: 2, prompt: "ما هو حرف العلة القصير في كلمة 'red'؟", options: ["r", "e", "d", "a"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_2_e3", topicId: 2, prompt: "أيٌّ من الكلمات التالية لا تتبع النمط CVC؟", options: ["cat", "dog", "play", "cup"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_2_e4", topicId: 2, prompt: "كلمة 'hit' (يضرب) تحتوي على أي حرف علة قصير؟", options: ["a", "e", "i", "o"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_2_e5", topicId: 2, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة القصير 'a'؟", options: ["dig", "pot", "map", "sun"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_2_e6", topicId: 2, prompt: "ما هو حرف العلة في كلمة 'fox' (ثعلب)؟", options: ["f", "o", "x", "u"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_2_e7", topicId: 2, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة القصير 'e'؟", options: ["cat", "ten", "hop", "wig"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_2_e8", topicId: 2, prompt: "النمط CVC يعني:", options: ["حرف علة + حرف ساكن + حرف علة", "حرف ساكن + حرف علة + حرف ساكن", "حرفان ساكنان + حرف علة", "حرف علة + حرفان ساكنان"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_2_e9", topicId: 2, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة القصير 'o'؟", options: ["sit", "cat", "dot", "fun"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_2_e10", topicId: 2, prompt: "ما هو حرف العلة القصير في كلمة 'mud' (طين)؟", options: ["m", "u", "d", "a"], correctIndex: 1)
    ],

    // MARK: Topic 3  -  الكلمات الشائعة
    3: [
        MathExamQuestion(id: "ar_exam_3_e1", topicId: 3, prompt: "أكمل الجملة: 'I ___ a student.' بالكلمة الصحيحة.", options: ["are", "is", "am", "be"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_3_e2", topicId: 3, prompt: "أيٌّ من الكلمات التالية تعني 'هم' (ضمير الجمع)؟", options: ["he", "she", "they", "it"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_3_e3", topicId: 3, prompt: "أكمل الجملة: 'She ___ a good girl.' بالكلمة الصحيحة.", options: ["are", "is", "am", "be"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_3_e4", topicId: 3, prompt: "كلمة 'said' هي الصيغة الماضية لأي فعل؟", options: ["see", "sit", "say", "sell"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_3_e5", topicId: 3, prompt: "أكمل الجملة: 'We ___ happy today.' بالكلمة الصحيحة.", options: ["is", "am", "are", "be"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_3_e6", topicId: 3, prompt: "ما معنى الجملة: 'They have a big house.'؟", options: ["لديهم منزل صغير", "لديهم منزل كبير", "يريدون منزلاً كبيراً", "رأوا منزلاً كبيراً"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_3_e7", topicId: 3, prompt: "أيٌّ من الجمل التالية يستخدم كلمة 'from' بشكل صحيح؟", options: ["I from Egypt.", "She is from Egypt.", "He from goes Egypt.", "They from is Egypt."], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_3_e8", topicId: 3, prompt: "ما معنى كلمة 'was'؟", options: ["كانت/كان (ماضي)", "يكون (حاضر)", "سيكون (مستقبل)", "يريد"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_3_e9", topicId: 3, prompt: "أكمل الجملة: 'The cat ___ on the mat.' بالكلمة الصحيحة.", options: ["are", "am", "is", "be"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_3_e10", topicId: 3, prompt: "أيٌّ من الجمل التالية تستخدم 'and' بشكل صحيح؟", options: ["I like cats and.", "I like cats and dogs.", "And I like cats.", "I and like cats."], correctIndex: 1)
    ],

    // MARK: Topic 4  -  الجمل البسيطة
    4: [
        MathExamQuestion(id: "ar_exam_4_e1", topicId: 4, prompt: "أيٌّ من الجمل التالية بها ترتيب صحيح S+V+O؟", options: ["Milk drinks the cat.", "The cat drinks milk.", "Drinks the cat milk.", "Milk the cat drinks."], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_4_e2", topicId: 4, prompt: "ما هو الفاعل في: 'My sister reads books every night.'؟", options: ["reads", "books", "My sister", "night"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_4_e3", topicId: 4, prompt: "ما هو المفعول به في: 'The chef cooks delicious food.'؟", options: ["The chef", "cooks", "delicious", "food"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_4_e4", topicId: 4, prompt: "أيٌّ من الجمل التالية مبنية بشكل خاطئ؟", options: ["She eats an apple.", "He plays football.", "The bird sings.", "Runs the boy fast."], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_4_e5", topicId: 4, prompt: "الجملة 'Birds fly.' تتكون من:", options: ["فاعل + مفعول", "فاعل + فعل", "فعل + مفعول", "فاعل فقط"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_4_e6", topicId: 4, prompt: "أيٌّ من الجمل التالية تعني 'الطالب يكتب درسه'؟", options: ["The lesson writes the student.", "The student writes the lesson.", "Writes the student the lesson.", "The lesson student writes."], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_4_e7", topicId: 4, prompt: "ما هو الفعل في: 'The baby cries every night.'؟", options: ["baby", "The", "cries", "night"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_4_e8", topicId: 4, prompt: "أيٌّ من الجمل التالية لها فاعل وفعل ومفعول؟", options: ["Dogs bark.", "She sleeps.", "I love pizza.", "He runs."], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_4_e9", topicId: 4, prompt: "ما الفرق بين الجملة 'She plays.' والجملة 'She plays tennis.'؟", options: ["لا فرق بينهما", "الأولى ليس فيها مفعول، والثانية فيها مفعول 'tennis'", "الثانية خاطئة", "الأولى أطول"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_4_e10", topicId: 4, prompt: "أكمل الجملة: 'The children ___ football in the park.'", options: ["plays", "play", "playing", "played"], correctIndex: 1)
    ],

    // MARK: Topic 5  -  القوافي وعائلات الكلمات
    5: [
        MathExamQuestion(id: "ar_exam_5_e1", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'light'؟", options: ["late", "night", "lift", "lint"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_5_e2", topicId: 5, prompt: "أيٌّ من الكلمات التالية لا تنتمي إلى عائلة '-ack'؟", options: ["back", "sack", "rack", "rock"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_5_e3", topicId: 5, prompt: "كلمات 'sing, ring, king, wing' تنتمي إلى عائلة:", options: ["-in", "-ing", "-ig", "-ink"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_5_e4", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'make'؟", options: ["lake", "milk", "mat", "map"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_5_e5", topicId: 5, prompt: "أضف كلمة إلى عائلة '-all': ball, call, fall, ___", options: ["hill", "fill", "tall", "tell"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_5_e6", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'cake'؟", options: ["cat", "cup", "lake", "lock"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_5_e7", topicId: 5, prompt: "عائلة '-ight' تشمل: night, right, light, ___. أيٌّ الأنسب؟", options: ["bit", "sit", "might", "mint"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_5_e8", topicId: 5, prompt: "أيٌّ من الكلمات التالية تقافي مع 'cool'؟", options: ["col", "cat", "pool", "pull"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_5_e9", topicId: 5, prompt: "كلمات 'cry, fly, sky, try' تشترك في:", options: ["نفس حرف البداية", "القافية /aɪ/", "نفس عدد الحروف", "نفس المعنى"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_5_e10", topicId: 5, prompt: "أيٌّ من الكلمات التالية لا تقافي مع 'day'؟", options: ["say", "play", "way", "dip"], correctIndex: 3)
    ],

    // MARK: Topic 6  -  حروف العلة الطويلة
    6: [
        MathExamQuestion(id: "ar_exam_6_e1", topicId: 6, prompt: "ما الفرق بين 'cap' (قبعة) و'cape' (رداء)؟", options: ["لا فرق", "حرف E في النهاية يجعل حرف A طويلاً", "cape أقصر", "cap لها معنى أكبر"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_6_e2", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف علة طويل 'e'؟", options: ["bed", "pet", "set", "feet"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_6_e3", topicId: 6, prompt: "قاعدة 'الحرف E الصامت' تقول إن الـ 'e' في نهاية الكلمة:", options: ["يُنطق بوضوح", "يجعل حرف العلة قبله طويلاً ولا يُنطق هو", "يُضاف للتزيين فقط", "يغير الحرف الأخير"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_6_e4", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة الطويل 'o'؟", options: ["hot", "hop", "pot", "hope"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_6_e5", topicId: 6, prompt: "ما الذي يحدث عند إضافة 'e' إلى نهاية كلمة 'tub'؟", options: ["تصبح 'tab'", "تصبح 'tube' وحرف U يصبح طويلاً", "تصبح 'top'", "لا يتغير شيء"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_6_e6", topicId: 6, prompt: "أيٌّ من الكلمات التالية تتبع قاعدة الـ 'E' الصامت؟", options: ["cat", "dog", "run", "late"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_6_e7", topicId: 6, prompt: "كلمة 'ride' (يركب) تحتوي على حرف علة طويل. ما نطق حرف العلة؟", options: ["/ɪ/ كما في sit", "/aɪ/ كما في ice", "/e/ كما في bed", "/ɔ/ كما في hot"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_6_e8", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف علة طويل 'a'؟", options: ["bat", "cat", "hat", "plate"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_6_e9", topicId: 6, prompt: "ما الكلمة الناتجة عن إضافة 'e' لـ 'cub' (شبل)؟", options: ["cub", "cab", "cube", "club"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_6_e10", topicId: 6, prompt: "أيٌّ من الكلمات التالية يحتوي على حرف العلة الطويل 'u'؟", options: ["cup", "bus", "run", "cute"], correctIndex: 3)
    ],

    // MARK: Topic 7  -  مجموعات الحروف الساكنة
    7: [
        MathExamQuestion(id: "ar_exam_7_e1", topicId: 7, prompt: "ما الفرق بين الـ 'blend' والـ 'digraph'؟", options: ["لا فرق بينهما", "الـ blend يُنطق فيه كل حرف بشكل منفصل، والـ digraph يُنطق صوتاً واحداً جديداً", "الـ digraph أطول", "الـ blend لا يوجد في الإنجليزية"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_7_e2", topicId: 7, prompt: "كلمة 'cheese' (جبن) تبدأ بـ digraph. ما هو؟", options: ["ce", "he", "ch", "ee"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e3", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend 'cl'؟", options: ["church", "chair", "clap", "cheap"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e4", topicId: 7, prompt: "digraph 'ph' يُنطق مثل:", options: ["/p/ + /h/", "/f/", "/b/", "/v/"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_7_e5", topicId: 7, prompt: "أيٌّ من الكلمات التالية تحتوي على digraph 'th'؟", options: ["star", "stop", "think", "black"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e6", topicId: 7, prompt: "كلمة 'spring' تبدأ بـ blend ثلاثي. ما هو؟", options: ["sp", "pr", "spr", "ing"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e7", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend 'tr'؟", options: ["three", "this", "tree", "them"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e8", topicId: 7, prompt: "digraph 'wh' في كلمة 'where' يُنطق مثل:", options: ["/w/", "/h/", "/wh/", "/v/"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_7_e9", topicId: 7, prompt: "أيٌّ من الكلمات التالية يبدأ بـ blend 'sp'؟", options: ["ship", "chip", "spin", "thin"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_7_e10", topicId: 7, prompt: "digraph 'sh' في كلمة 'shell' (صدفة) يُنطق:", options: ["/s/ + /h/", "/ʃ/ صوت واحد", "/sk/", "/st/"], correctIndex: 1)
    ],

    // MARK: Topic 8  -  الأسماء والأفعال
    8: [
        MathExamQuestion(id: "ar_exam_8_e1", topicId: 8, prompt: "أيٌّ من الكلمات التالية اسم شخص (person noun)؟", options: ["run", "city", "doctor", "happy"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e2", topicId: 8, prompt: "أيٌّ من الكلمات التالية فعل مساعد (helping verb)؟", options: ["cat", "is", "big", "fast"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_8_e3", topicId: 8, prompt: "في جملة 'The birds sing sweetly'، ما هي الأسماء؟", options: ["sing, sweetly", "birds, sing", "The, birds", "birds"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_8_e4", topicId: 8, prompt: "أيٌّ من الكلمات التالية فعل في الماضي؟", options: ["run", "eat", "played", "big"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e5", topicId: 8, prompt: "الاسم الجمع (plural noun) لكلمة 'child' (طفل) هو:", options: ["childs", "childes", "children", "child's"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e6", topicId: 8, prompt: "أيٌّ من الكلمات التالية فعل في الحاضر المستمر؟", options: ["played", "play", "playing", "plays"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e7", topicId: 8, prompt: "في جملة 'Ahmed and Sara go to school'، كم اسماً يوجد؟", options: ["١", "٢", "٣", "٤"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_8_e8", topicId: 8, prompt: "أيٌّ من الكلمات التالية اسم مجرد (abstract noun) يدل على شعور؟", options: ["table", "dog", "love", "run"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e9", topicId: 8, prompt: "الجمع الصحيح لكلمة 'box' (صندوق) هو:", options: ["boxs", "boxies", "boxes", "boxen"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_8_e10", topicId: 8, prompt: "أيٌّ من الجمل التالية تحتوي على فعلَين؟", options: ["She eats.", "He runs and jumps.", "The big dog.", "A red car."], correctIndex: 1)
    ],

    // MARK: Topic 9  -  الصفات والظروف
    9: [
        MathExamQuestion(id: "ar_exam_9_e1", topicId: 9, prompt: "أيٌّ من الجمل التالية تحتوي على صفة؟", options: ["She runs.", "He eats.", "I have a green bag.", "They play."], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e2", topicId: 9, prompt: "أيٌّ من الجمل التالية تحتوي على ظرف؟", options: ["She has a cat.", "He runs quickly.", "I like pizza.", "We play football."], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_9_e3", topicId: 9, prompt: "في 'The tall tree fell down'، أيٌّ منها صفة وأيٌّ منها ظرف؟", options: ["'tall' صفة، 'down' ظرف", "'tree' صفة، 'fell' ظرف", "'The' صفة، 'tall' ظرف", "'fell' صفة، 'tree' ظرف"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_9_e4", topicId: 9, prompt: "الكلمة 'never' (لا تقافي) هي:", options: ["صفة", "اسم", "ظرف", "فعل"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e5", topicId: 9, prompt: "أيٌّ من الكلمات التالية صفة تدل على اللون؟", options: ["quickly", "run", "blue", "eat"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e6", topicId: 9, prompt: "أيٌّ من الظروف التالية يدل على الوقت؟", options: ["slowly", "gently", "tomorrow", "beautiful"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e7", topicId: 9, prompt: "في 'She has long hair'، أيٌّ منها صفة؟", options: ["She", "has", "long", "hair"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e8", topicId: 9, prompt: "أيٌّ من الظروف التالية يدل على المكان؟", options: ["slowly", "here", "never", "well"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_9_e9", topicId: 9, prompt: "أيٌّ من الجمل التالية تحتوي على صفة وظرف معاً؟", options: ["She runs.", "He eats.", "The tiny cat runs quickly.", "They play."], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_9_e10", topicId: 9, prompt: "ظرف 'always' (دائماً) يصف:", options: ["الاسم", "تكرار الفعل", "الشخصية", "اللون"], correctIndex: 1)
    ],

    // MARK: Topic 10  -  علامات الترقيم الإنجليزية
    10: [
        MathExamQuestion(id: "ar_exam_10_e1", topicId: 10, prompt: "أيٌّ من الجمل التالية يحتوي على علامة ترقيم صحيحة؟", options: ["Do you like cats.", "I love music!", "Where are you!", "She is happy?"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e2", topicId: 10, prompt: "في الجملة: 'I need milk, eggs, and butter.' كم فاصلة تحتوي؟", options: ["١", "٢", "٣", "٤"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e3", topicId: 10, prompt: "الجملة 'Help! There is a fire!' تحتوي على:", options: ["نقطتَين فقط", "علامتَي تعجب فقط", "علامة استفهام وتعجب", "فاصلتَين"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e4", topicId: 10, prompt: "أيٌّ من الجمل التالية به خطأ في الترقيم؟", options: ["I like cats.", "Do you like cats?", "What a great day!", "She is happy?"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_10_e5", topicId: 10, prompt: "الجملة: '___ you like coffee?' تحتاج إلى:", options: ["نقطة", "فاصلة", "علامة استفهام", "علامة تعجب"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_10_e6", topicId: 10, prompt: "الفاصلة (,) تُستخدم أيضاً:", options: ["في نهاية الجملة فقط", "للفصل بين جملتَين مترابطتَين", "بدلاً من النقطة", "في بداية الجملة"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e7", topicId: 10, prompt: "أيٌّ من الجمل التالية جملة تعجبية صحيحة؟", options: ["What a beautiful sunset?", "What a beautiful sunset!", "What a beautiful sunset.", "What a beautiful sunset,"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e8", topicId: 10, prompt: "في الجملة الأمرية مثل 'Come here.' تُستخدم:", options: ["علامة استفهام", "علامة تعجب أو نقطة", "فاصلة", "لا علامة ترقيم"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_10_e9", topicId: 10, prompt: "أيٌّ من الجمل التالية يستخدم الفاصلة بشكل صحيح؟", options: ["I like, cats.", "She runs, fast.", "I have a cat, a dog, and a fish.", "He, eats pizza."], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_10_e10", topicId: 10, prompt: "الجملة الاستفهامية يجب أن تبدأ بـ:", options: ["علامة استفهام", "حرف كبير وتنتهي بعلامة استفهام", "فاصلة", "نقطة"], correctIndex: 1)
    ],

    // MARK: Topic 11  -  الكلمات المركبة والاختصارات
    11: [
        MathExamQuestion(id: "ar_exam_11_e1", topicId: 11, prompt: "ما الكلمة المركبة الناتجة من 'birth' + 'day'؟", options: ["birthplace", "birthday", "birthmark", "birdday"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_11_e2", topicId: 11, prompt: "اختصار 'won't' يعني:", options: ["was not", "would not", "will not", "were not"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_11_e3", topicId: 11, prompt: "أيٌّ من الكلمات التالية ليست كلمة مركبة؟", options: ["airport", "bookshelf", "beautiful", "bathroom"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_11_e4", topicId: 11, prompt: "اختصار 'she's' يمكن أن يعني:", options: ["she is أو she has", "she was", "she will", "she had only"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_11_e5", topicId: 11, prompt: "ما الكلمة المركبة الناتجة من 'fire' + 'works'؟", options: ["firetruck", "fireside", "fireworks", "fireplace"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_11_e6", topicId: 11, prompt: "اختصار 'isn't' يعني:", options: ["is not", "it not", "in not", "I not"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_11_e7", topicId: 11, prompt: "أيٌّ من الاختصارات التالية صحيح؟", options: ["ca'nt", "can't", "cant'", "c'ant"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_11_e8", topicId: 11, prompt: "ما الكلمتان اللتان تكوّنان 'butterfly'؟", options: ["butter + fly", "butt + erfly", "but + terfly", "butte + rfly"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_11_e9", topicId: 11, prompt: "اختصار 'they'll' يعني:", options: ["they all", "they will", "they well", "they shall"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_11_e10", topicId: 11, prompt: "أيٌّ من الكلمات التالية كلمة مركبة تعني 'ضوء القمر'؟", options: ["sunlight", "starlight", "moonlight", "daylight"], correctIndex: 2)
    ],

    // MARK: Topic 12  -  البادئات واللواحق
    12: [
        MathExamQuestion(id: "ar_exam_12_e1", topicId: 12, prompt: "ما معنى كلمة 'rewrite'؟", options: ["كتب بشكل سيئ", "كتب مرة أخرى", "لم يكتب", "كتب أولاً"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_12_e2", topicId: 12, prompt: "ما معنى كلمة 'powerless'؟", options: ["قوي جداً", "مليء بالقوة", "بلا قوة / ضعيف", "يُعيد القوة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_12_e3", topicId: 12, prompt: "لاحقة '-er' في كلمة 'teacher' تعني:", options: ["أكثر", "شخص يقوم بشيء ما", "بلا", "مرة أخرى"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_12_e4", topicId: 12, prompt: "ما معنى كلمة 'uncomfortable'؟", options: ["مريح جداً", "غير مريح", "مريح مرة أخرى", "الأكثر راحة"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_12_e5", topicId: 12, prompt: "بادئة 're-' + كلمة 'build' = 'rebuild'. ما معناها؟", options: ["بنى أول مرة", "بنى بشكل جيد", "أعاد البناء", "لم يبنِ"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_12_e6", topicId: 12, prompt: "لاحقة '-ful' في كلمة 'joyful' تعني:", options: ["بلا فرح", "مليء بالفرح", "أكثر فرحاً", "الأكثر فرحاً"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_12_e7", topicId: 12, prompt: "ما الكلمة التي تعني 'الأكثر حدة' من بين الخيارات؟", options: ["sharp", "sharper", "sharpest", "sharply"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_12_e8", topicId: 12, prompt: "ما معنى كلمة 'hopeless'؟", options: ["مليء بالأمل", "واعد", "بلا أمل / يائس", "يأمل مرة أخرى"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_12_e9", topicId: 12, prompt: "ما الكلمة التي تعني 'أذكى من' (مقارنة)؟", options: ["smart", "smartly", "smarter", "smartest"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_12_e10", topicId: 12, prompt: "بادئة 'un-' + 'lock' = 'unlock'. ما معناها؟", options: ["أغلق ثانية", "أغلق بإحكام", "يفتح القفل / يفك القفل", "أغلق أولاً"], correctIndex: 2)
    ],

    // MARK: Topic 13  -  المترادفات والأضداد
    13: [
        MathExamQuestion(id: "ar_exam_13_e1", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لـ 'large' (كبير)؟", options: ["tiny", "small", "huge", "little"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e2", topicId: 13, prompt: "ما ضد كلمة 'ancient' (قديم)؟", options: ["old", "modern", "antique", "historic"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_13_e3", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لـ 'angry' (غاضب)؟", options: ["happy", "calm", "furious", "sad"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e4", topicId: 13, prompt: "ما ضد كلمة 'give' (يعطي)؟", options: ["offer", "lend", "take", "share"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e5", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لـ 'tired' (متعب)؟", options: ["energetic", "active", "sleepy", "awake"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e6", topicId: 13, prompt: "ما ضد كلمة 'first' (أول)؟", options: ["second", "last", "middle", "next"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_13_e7", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لـ 'scared' (خائف)؟", options: ["brave", "calm", "afraid", "bold"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e8", topicId: 13, prompt: "ما ضد كلمة 'remember' (يتذكر)؟", options: ["recall", "think", "forget", "know"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_13_e9", topicId: 13, prompt: "أيٌّ من الكلمات التالية مرادف لـ 'thin' (نحيل)؟", options: ["fat", "slim", "heavy", "wide"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_13_e10", topicId: 13, prompt: "ما ضد كلمة 'always' (دائماً)؟", options: ["sometimes", "often", "usually", "never"], correctIndex: 3)
    ],

    // MARK: Topic 14  -  فهم المقروء
    14: [
        MathExamQuestion(id: "ar_exam_14_e1", topicId: 14, prompt: "اقرأ: 'Lina loves reading. She reads every night before bed. She has fifty books in her room.' ما الفكرة الرئيسية؟", options: ["لينا تنام مبكراً", "لينا تحب القراءة وتمارسها كثيراً", "لدى لينا غرفة كبيرة", "لينا تشتري الكتب"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_14_e2", topicId: 14, prompt: "اقرأ: 'It was raining hard. Tom stayed inside and played games.' لماذا بقي Tom في المنزل؟", options: ["لأنه مريض", "لأنه يريد اللعب", "لأن الطقس كان ممطراً", "لأن والديه طلبا ذلك"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e3", topicId: 14, prompt: "سؤال 'How did the character feel?' يسأل عن:", options: ["المكان", "الزمان", "مشاعر الشخصية", "حل المشكلة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e4", topicId: 14, prompt: "اقرأ: 'The sun rises in the east.' ما هو موضوع الجملة؟", options: ["الغروب", "شروق الشمس في الشرق", "الغرب", "الليل"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_14_e5", topicId: 14, prompt: "التفاصيل الداعمة (supporting details) يجب أن:", options: ["تتحدث عن موضوع مختلف", "تتناقض مع الفكرة الرئيسية", "تدعم الفكرة الرئيسية وتشرحها", "تأتي قبل الفكرة الرئيسية دائماً"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e6", topicId: 14, prompt: "اقرأ: 'Nadia woke up late. She missed the bus. She had to walk to school.' ماذا كانت المشكلة أولاً؟", options: ["مشت نادية للمدرسة", "نادية فاتها الحافلة", "نادية استيقظت متأخرة", "المدرسة بعيدة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e7", topicId: 14, prompt: "اقرأ: 'Penguins live in cold places. They cannot fly, but they swim very well.' ما المعلومة الصحيحة عن البطاريق؟", options: ["تعيش في الأماكن الحارة", "تطير بسرعة كبيرة", "تسبح بشكل ممتاز", "لا تحب الماء"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e8", topicId: 14, prompt: "الخلاصة (summary) الجيدة للنص يجب أن:", options: ["تذكر كل التفاصيل", "تكون أطول من النص الأصلي", "تحتوي على الأفكار الرئيسية فقط بإيجاز", "تذكر رأي القارئ"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e9", topicId: 14, prompt: "اقرأ: 'In 1969, humans landed on the Moon for the first time.' متى وصل الإنسان إلى القمر؟", options: ["١٩٦٧", "١٩٦٨", "١٩٦٩", "١٩٧٠"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_14_e10", topicId: 14, prompt: "الاستنتاج (inference) في القراءة يعني:", options: ["قراءة الكلمات بصوت عالٍ", "فهم معنى ضمني لم يُذكر صراحةً في النص", "حفظ النص كاملاً", "ترجمة النص"], correctIndex: 1)
    ],

    // MARK: Topic 15  -  عناصر القصة
    15: [
        MathExamQuestion(id: "ar_exam_15_e1", topicId: 15, prompt: "اقرأ: 'Once upon a time, a brave girl named Rose lived in a small village near a dark forest.' من هي الشخصية الرئيسية؟", options: ["القرية", "الغابة", "Rose", "القصة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_15_e2", topicId: 15, prompt: "في نفس القصة، أين تجري الأحداث (Setting)؟", options: ["في مدينة كبيرة", "في قرية صغيرة بالقرب من غابة مظلمة", "في المدرسة", "في القصر"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e3", topicId: 15, prompt: "الحبكة (Plot) في القصة تشمل:", options: ["وصف الشخصيات فقط", "الأحداث من البداية حتى النهاية", "مكان القصة فقط", "الحوار فقط"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e4", topicId: 15, prompt: "ذروة الأحداث (climax) في القصة هي:", options: ["بداية القصة", "أهيج لحظة في القصة وأشدها توتراً", "نهاية القصة", "وصف الشخصية"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e5", topicId: 15, prompt: "في قصة 'Little Red Riding Hood'، ما هي المشكلة؟", options: ["الفتاة لا تعرف طريق بيت جدتها", "الذئب يتظاهر بأنه الجدة ويشكّل خطراً", "الجدة تسكن بعيداً جداً", "السلة ثقيلة جداً"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e6", topicId: 15, prompt: "عنصر 'الحل' (solution) يأتي عادةً:", options: ["في بداية القصة", "في وسط القصة", "في نهاية القصة", "قبل المشكلة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_15_e7", topicId: 15, prompt: "الشخصية الثانوية (minor character) في القصة هي:", options: ["البطل الرئيسي", "شخصية تظهر قليلاً ودورها محدود", "الشرير الرئيسي", "الراوي"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e8", topicId: 15, prompt: "الزمان (time) في عنصر المكان والزمان (Setting) يشير إلى:", options: ["أين تجري القصة", "متى تجري القصة (في الماضي، الحاضر، أو المستقبل)", "طول القصة", "أسلوب الكاتب"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_15_e9", topicId: 15, prompt: "اقرأ: 'Jack could not reach the apple on the tree. He got a ladder and climbed up.' ما هو الحل؟", options: ["تسلّق الشجرة بيديه", "ترك التفاحة", "أحضر سلّماً وتسلّق", "طلب المساعدة من صديق"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_15_e10", topicId: 15, prompt: "مجموعة عناصر القصة الصحيحة هي:", options: ["Character, Setting, Plot, Problem, Solution", "Character, Color, Plot, Answer, End", "Person, Place, Action, Question, Answer", "Hero, Villain, Place, Time, Finish"], correctIndex: 0)
    ],

    // MARK: Topic 16  -  أنواع الجمل
    16: [
        MathExamQuestion(id: "ar_exam_16_e1", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة خبرية (Declarative)؟", options: ["Where do you live?", "What a great idea!", "Open the window.", "I live in Cairo."], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_16_e2", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة استفهامية (Interrogative)؟", options: ["I love reading.", "Stop making noise!", "How old are you?", "Come here now."], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_16_e3", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة تعجبية (Exclamatory)؟", options: ["She is my friend.", "Is she your friend?", "Be my friend.", "How wonderful she is!"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_16_e4", topicId: 16, prompt: "أيٌّ من الجمل التالية جملة أمرية (Imperative)؟", options: ["He plays well.", "Does he play well?", "How well he plays!", "Play well!"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_16_e5", topicId: 16, prompt: "الجملة الأمرية عادةً لا تحتوي على:", options: ["فعل", "مفعول", "فاعل مذكور صراحةً", "علامة ترقيم"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_16_e6", topicId: 16, prompt: "كيف تحوّل جملة 'She sings.' إلى استفهامية؟", options: ["'She sings?'", "'Does she sing?'", "'Sing she!'", "'She sing!'"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_16_e7", topicId: 16, prompt: "الجملة 'Please be quiet.' هي:", options: ["خبرية", "استفهامية", "أمرية", "تعجبية"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_16_e8", topicId: 16, prompt: "الجملة 'What a scary movie!' هي:", options: ["خبرية", "استفهامية", "أمرية", "تعجبية"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_16_e9", topicId: 16, prompt: "كيف تحوّل 'You are happy.' إلى جملة تعجبية؟", options: ["'Are you happy?'", "'How happy you are!'", "'Be happy!'", "'You happy!'"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_16_e10", topicId: 16, prompt: "أيٌّ من الجمل التالية يمكن أن تكون خبرية وأمرية في آن معاً بحسب السياق؟", options: ["Where are you?", "How amazing!", "Stop.", "I like pizza."], correctIndex: 2)
    ],

    // MARK: Topic 17  -  الكلمات المتشابهة نطقاً
    17: [
        MathExamQuestion(id: "ar_exam_17_e1", topicId: 17, prompt: "أكمل الجملة بالكلمة الصحيحة: 'Put the book over ___.' (هناك)", options: ["their", "they're", "there", "the're"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_17_e2", topicId: 17, prompt: "أكمل الجملة: '___ going to win the game.' (هم يكونون)", options: ["Their", "There", "They're", "The're"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_17_e3", topicId: 17, prompt: "أكمل الجملة: 'I lost ___ bag.' (ملكي  -  ضمير المتكلم المفرد)", options: ["my", "me", "I", "mine"], correctIndex: 0),
        MathExamQuestion(id: "ar_exam_17_e4", topicId: 17, prompt: "أكمل الجملة: 'Is this ___ book?' (ملككَ/ملككِ)", options: ["you're", "your", "you", "you'd"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_17_e5", topicId: 17, prompt: "أكمل الجملة: 'I want ___ go to the park.' (إلى / لـ)", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_17_e6", topicId: 17, prompt: "أكمل الجملة: 'I like pizza ___ .' (أيضاً)", options: ["to", "two", "too", "tow"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_17_e7", topicId: 17, prompt: "أكمل الجملة: 'The dog wagged ___ tail.' (ذيله - ملك الكلب)", options: ["it's", "its", "it", "its'"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_17_e8", topicId: 17, prompt: "أكمل الجملة: '___ raining outside.' (هو يكون  -  it is)", options: ["Its", "It's", "It", "Its'"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_17_e9", topicId: 17, prompt: "في الجملة '___ my friends at the park.' أيٌّ صحيح؟", options: ["Their", "There", "They're", "Theirs"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_17_e10", topicId: 17, prompt: "أيٌّ من الجمل التالية تستخدم 'to', 'too', و'two' بشكل صحيح؟", options: ["I went too the park with too friends.", "I went to the park with two friends, too.", "I went two the park with to friends.", "I went to the park with to friends too."], correctIndex: 1)
    ],

    // MARK: Topic 18  -  أقسام الكلام
    18: [
        MathExamQuestion(id: "ar_exam_18_e1", topicId: 18, prompt: "في جملة 'The happy children play outside every day.'، حدّد قسم كلمة 'children'.", options: ["فعل", "صفة", "اسم", "ظرف"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_18_e2", topicId: 18, prompt: "في نفس الجملة، حدّد قسم كلمة 'happy'.", options: ["اسم", "فعل", "صفة", "ضمير"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_18_e3", topicId: 18, prompt: "في نفس الجملة، حدّد قسم كلمة 'play'.", options: ["اسم", "فعل", "صفة", "ظرف"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_18_e4", topicId: 18, prompt: "في نفس الجملة، حدّد قسم كلمة 'outside'.", options: ["اسم", "فعل", "صفة", "ظرف"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_18_e5", topicId: 18, prompt: "في جملة 'She put the book on the shelf.'، حدّد قسم كلمة 'She'.", options: ["اسم", "فعل", "ضمير", "صفة"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_18_e6", topicId: 18, prompt: "في نفس الجملة، حدّد قسم كلمة 'on'.", options: ["فعل", "صفة", "ظرف", "حرف جر"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_18_e7", topicId: 18, prompt: "الضمائر الإنجليزية تشمل:", options: ["cat, dog, bird", "he, she, it, they, we", "run, jump, swim", "big, small, tall"], correctIndex: 1),
        MathExamQuestion(id: "ar_exam_18_e8", topicId: 18, prompt: "أحرف الجر (prepositions) الإنجليزية الشائعة تشمل:", options: ["run, jump, play", "happy, sad, tall", "in, on, under, behind", "quickly, slowly, gently"], correctIndex: 2),
        MathExamQuestion(id: "ar_exam_18_e9", topicId: 18, prompt: "في جملة 'We quickly finished our homework.'، كم قسماً من أقسام الكلام يمكنك تحديدها؟", options: ["٢ (ضمير + فعل)", "٣ (ضمير + ظرف + فعل)", "٤ (ضمير + ظرف + فعل + ضمير + اسم)", "٥ أقسام"], correctIndex: 3),
        MathExamQuestion(id: "ar_exam_18_e10", topicId: 18, prompt: "أيٌّ من الجمل التالية تحتوي على جميع أقسام الكلام الستة التي تعلمناها؟", options: ["She runs.", "He runs fast.", "She quickly puts the book on the table.", "The cat sleeps."], correctIndex: 2)
    ]
]
