import Foundation

// MARK: - English Teaching Pack: Spanish (Topics 1-18)

let esTeachingTopicsA: [(id: Int, title: String, intro: String, example: String)] = [
    (1, "El Alfabeto Inglés", "Aprende las 26 letras del alfabeto inglés, sus nombres y sonidos, y la diferencia entre vocales y consonantes.", "La letra 'A' suena como en 'apple' (manzana). Las vocales son: A, E, I, O, U."),
    (2, "Vocales Cortas", "Las vocales cortas tienen sonidos breves y aparecen en palabras CVC (consonante-vocal-consonante).", "La 'a' corta suena como en 'cat' (gato). La 'i' corta suena como en 'sit' (sentarse)."),
    (3, "Palabras de Vista", "Las palabras de vista son palabras comunes en inglés que debes reconocer inmediatamente sin deletrearlas.", "Palabras como 'the', 'and', 'is', 'was' aparecen muy frecuentemente en textos en inglés."),
    (4, "Oraciones Simples", "Una oración simple en inglés tiene sujeto + verbo + objeto. El orden de las palabras es muy importante.", "La oración 'The dog eats food' tiene sujeto (the dog), verbo (eats) y objeto (food)."),
    (5, "Rimas y Familias", "Las familias de palabras comparten el mismo final y riman entre sí en inglés.", "La familia '-at' incluye: cat, bat, hat, mat, rat. Todas riman porque terminan igual."),
    (6, "Vocales Largas", "Las vocales largas suenan como el nombre de la letra. La regla de la 'e' silenciosa hace la vocal larga.", "La palabra 'cake' tiene la vocal 'a' larga porque hay una 'e' silenciosa al final."),
    (7, "Grupos Consonánticos", "Los grupos consonánticos son dos o más consonantes juntas. Los dígrafos forman un solo sonido nuevo.", "El dígrafo 'sh' hace el sonido /sh/ como en 'ship'. El grupo 'bl' se oye en 'blue'."),
    (8, "Sustantivos y Verbos", "En inglés, los sustantivos nombran personas, lugares o cosas. Los verbos expresan acciones o estados.", "En la oración 'The cat runs', 'cat' es el sustantivo y 'runs' es el verbo."),
    (9, "Adjetivos y Adverbios", "Los adjetivos describen sustantivos. Los adverbios describen verbos, adjetivos u otros adverbios.", "En 'The big dog runs quickly', 'big' es adjetivo y 'quickly' es adverbio."),
    (10, "Puntuación Inglesa", "Los signos de puntuación en inglés ayudan a organizar y dar sentido a las oraciones.", "El punto (.) termina una oración. El signo de interrogación (?) cierra una pregunta."),
    (11, "Palabras Compuestas y Contracciones", "Las palabras compuestas unen dos palabras. Las contracciones acortan palabras usando un apóstrofo.", "'Sunshine' = sun + shine. 'Don't' = do + not (la 'o' de 'not' se reemplaza con apóstrofo)."),
    (12, "Prefijos y Sufijos", "Los prefijos van al inicio de la palabra y los sufijos al final, cambiando su significado.", "'Un-' significa 'no': unhappy = no feliz. '-ful' significa 'lleno de': helpful = lleno de ayuda."),
    (13, "Sinónimos y Antónimos", "Los sinónimos son palabras con significado similar. Los antónimos son palabras con significado opuesto.", "'Happy' y 'glad' son sinónimos. 'Happy' y 'sad' son antónimos."),
    (14, "Comprensión Lectora", "La comprensión lectora te ayuda a entender lo que lees respondiendo preguntas sobre el texto.", "Preguntas de comprensión: Who? (¿Quién?), What? (¿Qué?), Where? (¿Dónde?), When? (¿Cuándo?), Why? (¿Por qué?)"),
    (15, "Elementos del Cuento", "Todo cuento en inglés tiene personajes, ambiente, trama, problema y solución.", "En 'Goldilocks and the Three Bears', Goldilocks es el personaje principal y el bosque es el ambiente."),
    (16, "Tipos de Oraciones", "En inglés hay cuatro tipos de oraciones según su propósito: declarativas, interrogativas, exclamativas e imperativas.", "'The sky is blue.' es declarativa. '¿Is the sky blue?' es interrogativa."),
    (17, "Homófonos Ingleses", "Los homófonos son palabras que suenan igual pero se escriben diferente y tienen distinto significado.", "'There', 'their' y 'they're' suenan igual pero significan cosas distintas."),
    (18, "Partes del Discurso", "Las partes del discurso clasifican las palabras según su función en la oración.", "En 'She quickly runs to school', 'She' es pronombre, 'quickly' es adverbio, 'runs' es verbo.")
]

// MARK: - Practice Questions (10 per topic)

let esTeachingPracticeA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1 - El Alfabeto Inglés
    1: [
        MathExamQuestion(id: "es_teach_1_p1", topicId: 1, prompt: "¿Cuántas letras tiene el alfabeto inglés?", options: ["24", "25", "26", "27"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_p2", topicId: 1, prompt: "¿Cuáles son las vocales del alfabeto inglés?", options: ["A, E, I, O, U", "A, B, C, D, E", "E, I, O, U, W", "A, E, I, O, Y"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_1_p3", topicId: 1, prompt: "¿Cuál de estas letras es una consonante en inglés?", options: ["A", "E", "B", "I"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_p4", topicId: 1, prompt: "¿Qué letra del alfabeto inglés viene después de la 'M'?", options: ["L", "N", "K", "O"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_1_p5", topicId: 1, prompt: "¿Cuál es la última letra del alfabeto inglés?", options: ["X", "Y", "Z", "W"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_p6", topicId: 1, prompt: "¿Cuántas vocales tiene el alfabeto inglés?", options: ["4", "5", "6", "7"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_1_p7", topicId: 1, prompt: "La palabra 'apple' empieza con la letra:", options: ["A", "E", "I", "O"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_1_p8", topicId: 1, prompt: "¿Cuál de estas palabras en inglés empieza con una vocal?", options: ["dog", "cat", "elephant", "fish"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_p9", topicId: 1, prompt: "¿Qué letra viene antes de la 'Z' en el alfabeto inglés?", options: ["X", "W", "Y", "V"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_p10", topicId: 1, prompt: "¿Cuál es la primera letra del alfabeto inglés?", options: ["B", "A", "C", "E"], correctIndex: 1)
    ],

    // MARK: Topic 2 - Vocales Cortas
    2: [
        MathExamQuestion(id: "es_teach_2_p1", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'a'?", options: ["cake", "car", "cat", "care"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p2", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'i'?", options: ["bike", "kite", "sit", "mine"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p3", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'o'?", options: ["hope", "bone", "dog", "home"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p4", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'u'?", options: ["cute", "tube", "cup", "mule"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p5", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'e'?", options: ["see", "bee", "bed", "fee"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p6", topicId: 2, prompt: "La palabra 'hop' tiene la vocal corta:", options: ["a", "e", "i", "o"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_2_p7", topicId: 2, prompt: "¿Cuál es una palabra CVC (consonante-vocal-consonante)?", options: ["apple", "cat", "tree", "blue"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_2_p8", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'a'?", options: ["play", "rain", "bat", "bay"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p9", topicId: 2, prompt: "La palabra 'big' tiene la vocal corta:", options: ["a", "e", "i", "o"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_p10", topicId: 2, prompt: "¿Cuál de estas palabras NO tiene una vocal corta?", options: ["dog", "sit", "cake", "cup"], correctIndex: 2)
    ],

    // MARK: Topic 3 - Palabras de Vista
    3: [
        MathExamQuestion(id: "es_teach_3_p1", topicId: 3, prompt: "¿Qué significa la palabra de vista 'the' en inglés?", options: ["un/una", "el/la/los/las", "mi/mis", "este/esta"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_p2", topicId: 3, prompt: "¿Qué significa 'and' en inglés?", options: ["pero", "o", "y", "porque"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_p3", topicId: 3, prompt: "¿Qué significa 'was' en inglés?", options: ["es/está", "era/estaba", "será", "ha sido"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_p4", topicId: 3, prompt: "Completa la oración: '___ cat is sleeping.' ¿Qué palabra va aquí?", options: ["A", "An", "The", "Is"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_p5", topicId: 3, prompt: "¿Qué significa 'they' en inglés?", options: ["él", "ella", "nosotros", "ellos/ellas"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_3_p6", topicId: 3, prompt: "¿Qué significa 'have' en inglés?", options: ["ser/estar", "tener", "ir", "ver"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_p7", topicId: 3, prompt: "¿Qué significa 'said' en inglés?", options: ["dijo/dijeron", "dice/dicen", "dirá", "ha dicho"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_3_p8", topicId: 3, prompt: "¿Qué significa 'from' en inglés?", options: ["hasta", "hacia", "desde/de", "entre"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_p9", topicId: 3, prompt: "¿Cuál de estas es una 'palabra de vista' muy común en inglés?", options: ["elephant", "because", "the", "apple"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_p10", topicId: 3, prompt: "¿Qué significa 'are' en inglés?", options: ["soy/estoy", "son/están/eres/estás", "era/estaba", "seré"], correctIndex: 1)
    ],

    // MARK: Topic 4 - Oraciones Simples
    4: [
        MathExamQuestion(id: "es_teach_4_p1", topicId: 4, prompt: "¿Cuál es el orden correcto de una oración simple en inglés?", options: ["Verbo + Sujeto + Objeto", "Objeto + Verbo + Sujeto", "Sujeto + Verbo + Objeto", "Sujeto + Objeto + Verbo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p2", topicId: 4, prompt: "¿Cuál de estas es una oración correcta en inglés?", options: ["Eats the dog bone.", "The dog eats a bone.", "A bone the dog eats.", "Dog the a bone eats."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_p3", topicId: 4, prompt: "En la oración 'The girl reads a book', ¿cuál es el sujeto?", options: ["reads", "a book", "The girl", "book"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p4", topicId: 4, prompt: "En la oración 'The boy kicks the ball', ¿cuál es el verbo?", options: ["The boy", "kicks", "the ball", "ball"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_p5", topicId: 4, prompt: "¿Cuál de estas oraciones está en inglés correcto?", options: ["She goes school to.", "To school she goes.", "She goes to school.", "Goes she to school."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p6", topicId: 4, prompt: "En la oración 'My cat drinks milk', ¿cuál es el objeto?", options: ["My cat", "drinks", "milk", "cat drinks"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p7", topicId: 4, prompt: "¿Cómo se dice correctamente en inglés: 'Yo como una manzana'?", options: ["I an apple eat.", "Eat I an apple.", "I eat an apple.", "An apple I eat."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p8", topicId: 4, prompt: "¿Cuál oración tiene la estructura Sujeto + Verbo + Objeto?", options: ["Run fast!", "Is it raining?", "The fish swims in water.", "What a big fish!"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_p9", topicId: 4, prompt: "¿Qué le falta a esta oración: 'The bird ___ in the sky.'?", options: ["quickly", "flies", "blue", "high"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_p10", topicId: 4, prompt: "¿Cómo se dice 'El perro corre rápido' en inglés?", options: ["The dog runs fast.", "Fast runs the dog.", "Dog the fast runs.", "Runs fast the dog."], correctIndex: 0)
    ],

    // MARK: Topic 5 - Rimas y Familias
    5: [
        MathExamQuestion(id: "es_teach_5_p1", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'cat'?", options: ["cup", "bat", "bit", "cut"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_5_p2", topicId: 5, prompt: "¿Cuál de estas palabras pertenece a la familia '-an'?", options: ["bin", "ban", "bone", "bun"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_5_p3", topicId: 5, prompt: "¿Qué palabras forman la familia '-at'?", options: ["cat, bat, hat", "cup, pup, sup", "dog, log, fog", "big, dig, wig"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_5_p4", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'man'?", options: ["men", "run", "can", "moon"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_p5", topicId: 5, prompt: "¿Cuál de estas palabras NO pertenece a la familia '-og'?", options: ["dog", "fog", "log", "dot"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_5_p6", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'ran'?", options: ["run", "rain", "fan", "fun"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_p7", topicId: 5, prompt: "¿Qué palabras forman la familia '-ig'?", options: ["fig, pig, big", "fog, dog, log", "fan, man, ran", "cup, pup, sup"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_5_p8", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'hop'?", options: ["hip", "hap", "top", "tip"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_p9", topicId: 5, prompt: "¿Cuál es la parte que se repite en la familia de palabras '-un'?", options: ["-at", "-un", "-in", "-an"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_5_p10", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'hat'?", options: ["hot", "hit", "mat", "hut"], correctIndex: 2)
    ],

    // MARK: Topic 6 - Vocales Largas
    6: [
        MathExamQuestion(id: "es_teach_6_p1", topicId: 6, prompt: "¿Cuál de estas palabras tiene una vocal larga 'a'?", options: ["cat", "cap", "cake", "can"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p2", topicId: 6, prompt: "¿Cuál es la regla de la 'e' silenciosa?", options: ["La 'e' al final hace la vocal anterior corta", "La 'e' al final hace la vocal anterior larga", "La 'e' al final no cambia nada", "La 'e' al final se pronuncia fuerte"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_6_p3", topicId: 6, prompt: "¿Cuál de estas palabras tiene la vocal larga 'i'?", options: ["sit", "bit", "bike", "wig"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p4", topicId: 6, prompt: "La palabra 'hope' tiene la vocal larga:", options: ["a", "e", "i", "o"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_6_p5", topicId: 6, prompt: "¿Cuál de estas palabras tiene la vocal larga 'u'?", options: ["cup", "bug", "cute", "cut"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p6", topicId: 6, prompt: "Si agregas una 'e' silenciosa a 'cap', ¿qué palabra formas?", options: ["cape", "cap", "cup", "cop"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_6_p7", topicId: 6, prompt: "¿Cuál de estas palabras NO tiene vocal larga?", options: ["cake", "bike", "dog", "hope"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p8", topicId: 6, prompt: "¿Qué vocal larga tiene la palabra 'time'?", options: ["a", "e", "i", "o"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p9", topicId: 6, prompt: "Si agregas una 'e' silenciosa a 'bit', ¿qué palabra formas?", options: ["bat", "bet", "bite", "bot"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_p10", topicId: 6, prompt: "¿Cuál de estas palabras tiene vocal larga 'e'?", options: ["bed", "red", "these", "pet"], correctIndex: 2)
    ],

    // MARK: Topic 7 - Grupos Consonánticos
    7: [
        MathExamQuestion(id: "es_teach_7_p1", topicId: 7, prompt: "¿Cuál es el dígrafo en la palabra 'ship'?", options: ["si", "ip", "sh", "hi"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_p2", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo consonántico 'bl'?", options: ["black", "flack", "clack", "slack"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_7_p3", topicId: 7, prompt: "El dígrafo 'ch' suena como en:", options: ["shoe", "chair", "phone", "that"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_p4", topicId: 7, prompt: "¿Cuál de estas palabras tiene el dígrafo 'th'?", options: ["ship", "chair", "phone", "that"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_7_p5", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo 'tr'?", options: ["star", "train", "plan", "free"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_p6", topicId: 7, prompt: "El dígrafo 'ph' suena como la letra:", options: ["p", "b", "f", "v"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_p7", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo 'st'?", options: ["play", "stay", "pray", "clay"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_p8", topicId: 7, prompt: "¿Cuál de estas palabras tiene el dígrafo 'wh'?", options: ["when", "then", "shin", "chin"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_7_p9", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo consonántico 'sp'?", options: ["stop", "spin", "skip", "slip"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_p10", topicId: 7, prompt: "¿Cuántos sonidos hace el dígrafo 'sh' en inglés?", options: ["Dos sonidos separados", "Un solo sonido nuevo", "Tres sonidos", "Ningún sonido"], correctIndex: 1)
    ],

    // MARK: Topic 8 - Sustantivos y Verbos
    8: [
        MathExamQuestion(id: "es_teach_8_p1", topicId: 8, prompt: "En inglés, ¿cuál de estas palabras es un sustantivo?", options: ["run", "happy", "dog", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_p2", topicId: 8, prompt: "En inglés, ¿cuál de estas palabras es un verbo?", options: ["cat", "blue", "jump", "fast"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_p3", topicId: 8, prompt: "En la oración 'The bird sings a song', ¿cuál es el sustantivo?", options: ["sings", "The bird", "a song", "bird y song"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_8_p4", topicId: 8, prompt: "¿Cuál de estas palabras es un verbo en inglés?", options: ["flower", "sky", "swim", "beach"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_p5", topicId: 8, prompt: "¿Cuál de estas palabras es un sustantivo en inglés?", options: ["eat", "sleep", "run", "school"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_8_p6", topicId: 8, prompt: "En la oración 'The children play in the park', ¿cuál es el verbo?", options: ["children", "play", "park", "the"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_8_p7", topicId: 8, prompt: "¿Cuál de estas es una lista de sustantivos en inglés?", options: ["run, jump, swim", "cat, house, book", "big, small, tall", "quickly, slowly, fast"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_8_p8", topicId: 8, prompt: "¿Cuál de estas es una lista de verbos en inglés?", options: ["dog, cat, bird", "red, blue, green", "walk, talk, eat", "happy, sad, angry"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_p9", topicId: 8, prompt: "¿Qué tipo de palabra es 'teacher' en inglés?", options: ["Verbo", "Adjetivo", "Sustantivo", "Adverbio"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_p10", topicId: 8, prompt: "¿Qué tipo de palabra es 'write' en inglés?", options: ["Sustantivo", "Verbo", "Adjetivo", "Preposición"], correctIndex: 1)
    ],

    // MARK: Topic 9 - Adjetivos y Adverbios
    9: [
        MathExamQuestion(id: "es_teach_9_p1", topicId: 9, prompt: "En inglés, ¿cuál de estas palabras es un adjetivo?", options: ["run", "quickly", "beautiful", "sing"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p2", topicId: 9, prompt: "En inglés, ¿cuál de estas palabras es un adverbio?", options: ["big", "cat", "slowly", "house"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p3", topicId: 9, prompt: "En la oración 'The tall boy runs fast', ¿cuál es el adjetivo?", options: ["runs", "fast", "tall", "boy"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p4", topicId: 9, prompt: "En la oración 'She sings loudly', ¿cuál es el adverbio?", options: ["She", "sings", "loudly", "song"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p5", topicId: 9, prompt: "¿Cuál de estas palabras describe un sustantivo (es adjetivo)?", options: ["quickly", "run", "small", "eat"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p6", topicId: 9, prompt: "¿Cuál de estas palabras describe un verbo (es adverbio)?", options: ["happy", "softly", "tall", "red"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_9_p7", topicId: 9, prompt: "¿Cuál es una lista de adjetivos en inglés?", options: ["run, jump, fly", "the, a, an", "big, small, red", "quickly, slowly, fast"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p8", topicId: 9, prompt: "¿Cuál es una lista de adverbios en inglés?", options: ["happy, sad, angry", "quickly, slowly, loudly", "dog, cat, bird", "run, walk, jump"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_9_p9", topicId: 9, prompt: "Muchos adverbios en inglés terminan en:", options: ["-tion", "-ing", "-ly", "-ed"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_p10", topicId: 9, prompt: "En la oración 'The red ball bounces high', ¿cuántos modificadores hay?", options: ["Uno (red)", "Uno (high)", "Dos (red y high)", "Ninguno"], correctIndex: 2)
    ],

    // MARK: Topic 10 - Puntuación Inglesa
    10: [
        MathExamQuestion(id: "es_teach_10_p1", topicId: 10, prompt: "¿Qué signo de puntuación termina una oración declarativa en inglés?", options: ["?", "!", ".", ","], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_p2", topicId: 10, prompt: "¿Qué signo se usa al final de una pregunta en inglés?", options: [".", "!", "?", ","], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_p3", topicId: 10, prompt: "¿Qué signo de puntuación se usa en inglés para separar elementos en una lista?", options: [".", "?", "!", ","], correctIndex: 3),
        MathExamQuestion(id: "es_teach_10_p4", topicId: 10, prompt: "¿Cuál puntuación cierra una oración de exclamación en inglés?", options: [".", ",", "?", "!"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_10_p5", topicId: 10, prompt: "¿Cuál de estas oraciones tiene la puntuación correcta en inglés?", options: ["What is your name.", "What is your name!", "What is your name?", "What is your name,"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_p6", topicId: 10, prompt: "¿Cuál de estas oraciones tiene la puntuación correcta en inglés?", options: ["I love pizza?", "I love pizza.", "I love pizza,", "I love pizza"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_p7", topicId: 10, prompt: "A diferencia del español, en inglés las preguntas:", options: ["Empiezan con ¿ y terminan con ?", "Solo terminan con ?", "Empiezan con ! y terminan con ?", "No usan signos de puntuación"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_p8", topicId: 10, prompt: "¿Qué se usa para separar una ciudad y un estado en inglés?", options: ["Punto (.)", "Coma (,)", "Dos puntos (:)", "Punto y coma (;)"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_p9", topicId: 10, prompt: "¿Cuál de estas oraciones es exclamativa y tiene puntuación correcta?", options: ["What a great day.", "What a great day?", "What a great day!", "What a great day,"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_p10", topicId: 10, prompt: "¿Cuántos signos de pregunta se usan para cerrar una pregunta en inglés?", options: ["Dos (¿?)", "Ninguno", "Uno (?)", "Depende de la oración"], correctIndex: 2)
    ],

    // MARK: Topic 11 - Palabras Compuestas y Contracciones
    11: [
        MathExamQuestion(id: "es_teach_11_p1", topicId: 11, prompt: "¿Cuál de estas es una palabra compuesta en inglés?", options: ["running", "sunshine", "quickly", "helpful"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_p2", topicId: 11, prompt: "¿Qué dos palabras forman 'football'?", options: ["foot + ball", "foo + tball", "fo + otball", "f + ootball"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_p3", topicId: 11, prompt: "¿Qué significa la contracción 'don't' en inglés?", options: ["do not", "does not", "did not", "doing not"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_p4", topicId: 11, prompt: "¿Qué significa la contracción 'can't' en inglés?", options: ["could not", "cannot / can not", "will not", "should not"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_p5", topicId: 11, prompt: "¿Qué significa la contracción 'I'm' en inglés?", options: ["I was", "I will", "I am", "I have"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_11_p6", topicId: 11, prompt: "¿Cuál de estas es una palabra compuesta en inglés?", options: ["jumped", "birthday", "slowly", "unhappy"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_p7", topicId: 11, prompt: "¿Qué dos palabras forman la palabra compuesta 'rainbow'?", options: ["rain + bow", "ran + bow", "rain + brow", "ran + brow"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_p8", topicId: 11, prompt: "¿Qué significa la contracción 'he's' en inglés?", options: ["he was", "he is / he has", "he will", "he had"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_p9", topicId: 11, prompt: "¿Cuál de estas NO es una contracción en inglés?", options: ["don't", "can't", "I'm", "football"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_11_p10", topicId: 11, prompt: "¿Qué representa el apóstrofo en una contracción?", options: ["Una letra extra", "Una letra o letras que se omitieron", "El nombre del autor", "Que la palabra es compuesta"], correctIndex: 1)
    ],

    // MARK: Topic 12 - Prefijos y Sufijos
    12: [
        MathExamQuestion(id: "es_teach_12_p1", topicId: 12, prompt: "¿Qué significa el prefijo 'un-' en inglés?", options: ["Mucho", "No / lo opuesto", "Otra vez", "Antes de"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p2", topicId: 12, prompt: "¿Qué significa 'unhappy' en inglés?", options: ["Muy feliz", "Bastante feliz", "No feliz / infeliz", "Feliz de nuevo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_12_p3", topicId: 12, prompt: "¿Qué significa el prefijo 're-' en inglés?", options: ["No", "De nuevo / otra vez", "Antes", "Después"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p4", topicId: 12, prompt: "¿Qué significa 'redo' en inglés?", options: ["No hacer", "Deshacer", "Hacer de nuevo", "Hacer antes"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_12_p5", topicId: 12, prompt: "¿Qué sufijo se agrega para formar el gerundio en inglés?", options: ["-ed", "-ing", "-er", "-est"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p6", topicId: 12, prompt: "¿Qué significa el sufijo '-ful' en inglés?", options: ["Sin", "Lleno de / que tiene", "De nuevo", "El que hace"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p7", topicId: 12, prompt: "¿Qué significa 'helpful' en inglés?", options: ["Sin ayuda", "Que ayuda / útil", "Ayudar de nuevo", "El más útil"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p8", topicId: 12, prompt: "¿Qué significa el sufijo '-less' en inglés?", options: ["Lleno de", "Sin / que le falta", "Más que", "El que hace"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p9", topicId: 12, prompt: "¿Qué sufijo se usa para el superlativo en inglés (el más...)?", options: ["-er", "-est", "-ing", "-ed"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_p10", topicId: 12, prompt: "¿Cuál de estas palabras tiene un prefijo?", options: ["jumped", "helper", "rewrite", "fastest"], correctIndex: 2)
    ],

    // MARK: Topic 13 - Sinónimos y Antónimos
    13: [
        MathExamQuestion(id: "es_teach_13_p1", topicId: 13, prompt: "¿Cuál es el antónimo (opuesto) de 'happy' en inglés?", options: ["glad", "joyful", "sad", "cheerful"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_p2", topicId: 13, prompt: "¿Cuál es el sinónimo de 'big' en inglés?", options: ["small", "tiny", "large", "little"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_p3", topicId: 13, prompt: "¿Cuál es el antónimo de 'fast' en inglés?", options: ["quick", "rapid", "swift", "slow"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_13_p4", topicId: 13, prompt: "¿Cuál es el sinónimo de 'happy' en inglés?", options: ["sad", "angry", "glad", "scared"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_p5", topicId: 13, prompt: "¿Cuál es el antónimo de 'big' en inglés?", options: ["large", "huge", "giant", "small"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_13_p6", topicId: 13, prompt: "¿Cuál es el sinónimo de 'fast' en inglés?", options: ["slow", "quick", "calm", "lazy"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_13_p7", topicId: 13, prompt: "¿Cuál es el antónimo de 'hot' en inglés?", options: ["warm", "cool", "cold", "mild"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_p8", topicId: 13, prompt: "¿Cuál es el sinónimo de 'scared' en inglés?", options: ["brave", "happy", "afraid", "calm"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_p9", topicId: 13, prompt: "¿Cuál es el antónimo de 'day' en inglés?", options: ["morning", "afternoon", "evening", "night"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_13_p10", topicId: 13, prompt: "¿Cuál par son sinónimos en inglés?", options: ["big / small", "hot / cold", "fast / quick", "day / night"], correctIndex: 2)
    ],

    // MARK: Topic 14 - Comprensión Lectora
    14: [
        MathExamQuestion(id: "es_teach_14_p1", topicId: 14, prompt: "En comprensión lectora en inglés, 'Who?' pregunta sobre:", options: ["El lugar", "El tiempo", "La persona o personaje", "La razón"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_p2", topicId: 14, prompt: "En comprensión lectora en inglés, 'Where?' pregunta sobre:", options: ["La persona", "El lugar", "El tiempo", "La causa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_p3", topicId: 14, prompt: "En comprensión lectora en inglés, 'When?' pregunta sobre:", options: ["La persona", "El lugar", "El tiempo", "La razón"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_p4", topicId: 14, prompt: "En comprensión lectora en inglés, 'Why?' pregunta sobre:", options: ["La persona", "El lugar", "El tiempo", "La razón o causa"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_14_p5", topicId: 14, prompt: "La 'idea principal' de un texto es:", options: ["El último párrafo", "Un detalle pequeño", "El tema o mensaje más importante", "El título del texto"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_p6", topicId: 14, prompt: "Lee: 'Tom went to the park. He played soccer.' ¿Qué hizo Tom?", options: ["Fue a la tienda", "Jugó fútbol en el parque", "Durmió en el parque", "Comió en el parque"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_p7", topicId: 14, prompt: "Lee: 'Sara has a red apple. She eats it at lunch.' ¿De qué color es la manzana?", options: ["Verde", "Amarilla", "Roja", "Morada"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_p8", topicId: 14, prompt: "En comprensión lectora, 'What?' pregunta sobre:", options: ["El lugar", "El tiempo", "La cosa o el evento", "La persona"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_p9", topicId: 14, prompt: "Lee: 'It was cold outside. Jake wore his coat.' ¿Por qué Jake usó su abrigo?", options: ["Porque estaba lloviendo", "Porque hacía frío afuera", "Porque le gustaba el abrigo", "Porque era de noche"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_p10", topicId: 14, prompt: "Un 'detalle de apoyo' en un texto es:", options: ["La idea más importante", "Información que apoya la idea principal", "El título del texto", "La conclusión del texto"], correctIndex: 1)
    ],

    // MARK: Topic 15 - Elementos del Cuento
    15: [
        MathExamQuestion(id: "es_teach_15_p1", topicId: 15, prompt: "¿Cómo se llama el elemento del cuento que describe el lugar donde ocurre la historia?", options: ["Character (personaje)", "Setting (ambiente)", "Plot (trama)", "Theme (tema)"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_p2", topicId: 15, prompt: "¿Cómo se llama el personaje principal en inglés?", options: ["Antagonist", "Setting", "Main character", "Author"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p3", topicId: 15, prompt: "En un cuento, el 'problem' (problema) es:", options: ["El lugar de la historia", "El conflicto que el personaje debe resolver", "El final de la historia", "El personaje principal"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_p4", topicId: 15, prompt: "En un cuento, la 'solution' (solución) es:", options: ["El comienzo de la historia", "El problema del personaje", "Cómo se resuelve el problema", "El personaje malo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p5", topicId: 15, prompt: "¿Qué es el 'plot' en inglés?", options: ["El personaje", "El lugar", "La secuencia de eventos de la historia", "El autor"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p6", topicId: 15, prompt: "En 'Little Red Riding Hood', ¿quién es el antagonista?", options: ["Little Red Riding Hood", "Grandmother", "The wolf", "The hunter"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p7", topicId: 15, prompt: "¿Cuántos elementos principales tiene un cuento en inglés?", options: ["2 (personaje y lugar)", "3 (personaje, lugar y trama)", "5 (personaje, ambiente, trama, problema y solución)", "4 (principio, desarrollo, clímax y final)"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p8", topicId: 15, prompt: "El 'setting' de un cuento incluye:", options: ["Solo el lugar", "Solo el tiempo", "El lugar y el tiempo de la historia", "Los personajes de la historia"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p9", topicId: 15, prompt: "En un cuento, ¿qué viene primero?", options: ["El problema", "La solución", "La introducción de personajes y ambiente", "El clímax"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_p10", topicId: 15, prompt: "¿Cómo se llama el punto más emocionante de una historia en inglés?", options: ["Resolution", "Setting", "Climax", "Introduction"], correctIndex: 2)
    ],

    // MARK: Topic 16 - Tipos de Oraciones
    16: [
        MathExamQuestion(id: "es_teach_16_p1", topicId: 16, prompt: "Una oración declarativa en inglés:", options: ["Hace una pregunta", "Da una orden", "Expresa emoción", "Da información"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_16_p2", topicId: 16, prompt: "¿Cuál de estas es una oración interrogativa en inglés?", options: ["The sky is blue.", "What a beautiful sky!", "Is the sky blue?", "Look at the sky."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_p3", topicId: 16, prompt: "¿Cuál de estas es una oración exclamativa en inglés?", options: ["The dog is big.", "Is the dog big?", "What a big dog!", "Look at the dog."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_p4", topicId: 16, prompt: "¿Cuál de estas es una oración imperativa en inglés?", options: ["The door is open.", "Is the door open?", "What an open door!", "Open the door!"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_16_p5", topicId: 16, prompt: "Una oración imperativa en inglés generalmente:", options: ["Empieza con el sujeto 'I'", "Empieza con un verbo y da una orden", "Empieza con 'What' o 'How'", "Termina con ?"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_16_p6", topicId: 16, prompt: "¿Qué tipo de oración es 'Please sit down.'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_16_p7", topicId: 16, prompt: "¿Qué tipo de oración es 'I like chocolate.'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_16_p8", topicId: 16, prompt: "¿Qué tipo de oración es 'How amazing that is!'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_p9", topicId: 16, prompt: "¿Qué tipo de oración es 'Where do you live?'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_16_p10", topicId: 16, prompt: "¿Cuántos tipos de oraciones hay en inglés?", options: ["2", "3", "4", "5"], correctIndex: 2)
    ],

    // MARK: Topic 17 - Homófonos Ingleses
    17: [
        MathExamQuestion(id: "es_teach_17_p1", topicId: 17, prompt: "¿Cuál es la forma correcta: 'The book is over ___.' (allá)?", options: ["their", "they're", "there", "the're"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p2", topicId: 17, prompt: "¿Cuál es la forma correcta: '___ going to the park.' (ellos están)?", options: ["There", "Their", "They're", "Thier"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p3", topicId: 17, prompt: "¿Cuál es la forma correcta: 'That is ___ house.' (de ellos)?", options: ["there", "they're", "their", "the're"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p4", topicId: 17, prompt: "¿Cuál es la forma correcta: 'I want ___ go to school.' (infinitivo)?", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p5", topicId: 17, prompt: "¿Cuál es la forma correcta: 'I have ___ cats.' (número 2)?", options: ["to", "too", "two", "tow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p6", topicId: 17, prompt: "¿Cuál es la forma correcta: 'I like it ___.' (también)?", options: ["to", "two", "too", "tow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p7", topicId: 17, prompt: "¿Cuál es la forma correcta: 'Is this ___ book?' (tu/tuyo)?", options: ["you're", "your", "yore", "yor"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_17_p8", topicId: 17, prompt: "¿Cuál es la forma correcta: '___ so kind!' (tú eres)?", options: ["Your", "Yore", "You're", "Yor"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_p9", topicId: 17, prompt: "¿Cuál es la forma correcta: 'The dog hurt ___ paw.' (su, del perro)?", options: ["it's", "its", "its'", "it"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_17_p10", topicId: 17, prompt: "¿Cuál es la forma correcta: '___ raining outside.' (está)?", options: ["Its", "Its'", "It's", "Itss"], correctIndex: 2)
    ],

    // MARK: Topic 18 - Partes del Discurso
    18: [
        MathExamQuestion(id: "es_teach_18_p1", topicId: 18, prompt: "¿Qué parte del discurso es la palabra 'she' en inglés?", options: ["Noun (sustantivo)", "Verb (verbo)", "Pronoun (pronombre)", "Adjective (adjetivo)"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_18_p2", topicId: 18, prompt: "¿Qué parte del discurso es 'in' en la oración 'The cat is in the box'?", options: ["Noun (sustantivo)", "Verb (verbo)", "Adjective (adjetivo)", "Preposition (preposición)"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_p3", topicId: 18, prompt: "¿Cuáles son los pronombres personales sujeto en inglés?", options: ["I, you, he, she, it, we, they", "my, your, his, her, its, our, their", "me, you, him, her, it, us, them", "am, is, are, was, were"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_18_p4", topicId: 18, prompt: "¿Qué parte del discurso es 'beautiful' en inglés?", options: ["Noun", "Verb", "Adjective", "Adverb"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_18_p5", topicId: 18, prompt: "¿Qué parte del discurso es 'quickly' en inglés?", options: ["Noun", "Verb", "Adjective", "Adverb"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_p6", topicId: 18, prompt: "¿Qué parte del discurso es 'table' en inglés?", options: ["Noun", "Verb", "Adjective", "Preposition"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_18_p7", topicId: 18, prompt: "¿Qué parte del discurso es 'jump' en inglés?", options: ["Noun", "Verb", "Adjective", "Adverb"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_18_p8", topicId: 18, prompt: "¿Cuántas partes del discurso principales hay en inglés según esta lección?", options: ["4", "5", "6", "8"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_18_p9", topicId: 18, prompt: "En la oración 'He runs to school', ¿qué parte del discurso es 'to'?", options: ["Noun", "Verb", "Adjective", "Preposition"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_p10", topicId: 18, prompt: "¿Qué parte del discurso reemplaza a un sustantivo para no repetirlo?", options: ["Verb (verbo)", "Adjective (adjetivo)", "Pronoun (pronombre)", "Preposition (preposición)"], correctIndex: 2)
    ]
]

// MARK: - Exam Questions (10 per topic)

let esTeachingExamA: [Int: [MathExamQuestion]] = [

    // MARK: Topic 1 - El Alfabeto Inglés
    1: [
        MathExamQuestion(id: "es_teach_1_e1", topicId: 1, prompt: "¿Cuántas consonantes tiene el alfabeto inglés?", options: ["19", "20", "21", "22"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e2", topicId: 1, prompt: "¿Cuál de estas letras es una vocal en inglés?", options: ["B", "C", "U", "D"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e3", topicId: 1, prompt: "¿Qué letra del alfabeto inglés viene antes de la 'F'?", options: ["G", "D", "E", "H"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e4", topicId: 1, prompt: "La palabra 'umbrella' (paraguas) empieza con:", options: ["Una consonante", "Una vocal", "Un dígrafo", "Un grupo consonántico"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_1_e5", topicId: 1, prompt: "¿Cuál de estas palabras en inglés empieza con una consonante?", options: ["ocean", "ice", "ant", "star"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_1_e6", topicId: 1, prompt: "¿Cuál es la décima letra del alfabeto inglés?", options: ["I", "J", "K", "H"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_1_e7", topicId: 1, prompt: "¿Cuál de estas letras NO es vocal en inglés?", options: ["A", "E", "R", "I"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e8", topicId: 1, prompt: "¿Qué letra viene entre la 'P' y la 'R' en el alfabeto inglés?", options: ["O", "S", "Q", "N"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e9", topicId: 1, prompt: "La letra 'Y' en inglés puede funcionar como:", options: ["Solo consonante", "Solo vocal", "Consonante y a veces vocal", "Ninguna de las anteriores"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_1_e10", topicId: 1, prompt: "¿Cuántas letras hay entre la 'A' y la 'E' en el alfabeto inglés?", options: ["2 (B, C)", "3 (B, C, D)", "4 (B, C, D, E)", "1 (B)"], correctIndex: 1)
    ],

    // MARK: Topic 2 - Vocales Cortas
    2: [
        MathExamQuestion(id: "es_teach_2_e1", topicId: 2, prompt: "¿Cuál de estas palabras tiene la vocal corta 'e'?", options: ["tree", "bee", "wet", "sea"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e2", topicId: 2, prompt: "¿Cuál es la vocal corta en la palabra 'mud'?", options: ["a", "e", "i", "u"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_2_e3", topicId: 2, prompt: "¿Cuántas sílabas tiene una palabra CVC típica con vocal corta?", options: ["Tres", "Dos", "Una", "Cuatro"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e4", topicId: 2, prompt: "¿Cuál de estas palabras tiene vocal corta 'o'?", options: ["boat", "road", "fox", "flow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e5", topicId: 2, prompt: "¿Cuál de estas NO tiene vocal corta?", options: ["sit", "hop", "run", "bake"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_2_e6", topicId: 2, prompt: "La vocal corta 'a' suena como en:", options: ["cake", "rain", "cat", "pay"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e7", topicId: 2, prompt: "¿Cuál de estas palabras tiene vocal corta 'u'?", options: ["mule", "fuse", "rub", "tube"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e8", topicId: 2, prompt: "¿Cuál de estas palabras tiene vocal corta 'i'?", options: ["ride", "fine", "pin", "mine"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_2_e9", topicId: 2, prompt: "¿Cuál es la vocal corta en la palabra 'net'?", options: ["a", "e", "i", "o"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_2_e10", topicId: 2, prompt: "¿Cuántas vocales cortas hay en inglés?", options: ["3", "4", "5", "6"], correctIndex: 2)
    ],

    // MARK: Topic 3 - Palabras de Vista
    3: [
        MathExamQuestion(id: "es_teach_3_e1", topicId: 3, prompt: "¿Cuál de estas es una 'sight word' (palabra de vista)?", options: ["elephant", "because", "said", "jumping"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e2", topicId: 3, prompt: "¿Qué significa la palabra de vista 'because' en inglés?", options: ["después", "antes", "porque", "aunque"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e3", topicId: 3, prompt: "Completa la oración: '___ you like pizza?' ¿Qué palabra va aquí?", options: ["Are", "Do", "Is", "Have"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_e4", topicId: 3, prompt: "¿Qué significa 'you' en inglés?", options: ["yo", "él", "tú/usted", "nosotros"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e5", topicId: 3, prompt: "¿Cuál de estas palabras de vista significa 'es/está'?", options: ["was", "were", "is", "are"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e6", topicId: 3, prompt: "¿Por qué son importantes las palabras de vista?", options: ["Porque son las más largas", "Porque aparecen frecuentemente y ayudan a leer más fluido", "Porque son las más difíciles de deletrear", "Porque solo se usan en libros"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_e7", topicId: 3, prompt: "¿Qué significa 'have' en la oración 'I have a dog'?", options: ["quiero", "veo", "tengo", "soy"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e8", topicId: 3, prompt: "¿Cuál de estas es una lista de palabras de vista?", options: ["cat, dog, bird", "the, and, is, was", "running, jumping, eating", "big, small, tall"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_3_e9", topicId: 3, prompt: "Completa la oración: 'They ___ at school.' ¿Qué palabra va aquí?", options: ["am", "is", "are", "was"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_3_e10", topicId: 3, prompt: "¿Qué significa 'from' en 'She is from Mexico'?", options: ["en", "hacia", "de/desde", "para"], correctIndex: 2)
    ],

    // MARK: Topic 4 - Oraciones Simples
    4: [
        MathExamQuestion(id: "es_teach_4_e1", topicId: 4, prompt: "¿Cuál de estas oraciones tiene el orden correcto en inglés?", options: ["Pizza eats the boy.", "The boy eats pizza.", "Eats the boy pizza.", "The pizza boy eats."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_e2", topicId: 4, prompt: "¿Cuál es el sujeto en 'My sister loves dancing'?", options: ["loves", "dancing", "My sister", "loves dancing"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_e3", topicId: 4, prompt: "¿Cuál es el verbo en 'The students read books every day'?", options: ["students", "read", "books", "every day"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_e4", topicId: 4, prompt: "¿Cómo se dice 'Ella bebe agua' correctamente en inglés?", options: ["Water drinks she.", "She water drinks.", "She drinks water.", "Drinks she water."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_e5", topicId: 4, prompt: "¿Cuál de estas oraciones está correctamente formada en inglés?", options: ["Plays he soccer.", "He plays soccer.", "Soccer plays he.", "He soccer plays."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_e6", topicId: 4, prompt: "¿Cuál es el objeto en la oración 'We watch a movie'?", options: ["We", "watch", "a movie", "watch a movie"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_4_e7", topicId: 4, prompt: "¿Qué palabra falta en: 'The birds ___ in the trees'?", options: ["sleep", "sleeps", "sleeping", "slept"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_4_e8", topicId: 4, prompt: "¿Cuál oración tiene sujeto + verbo + objeto?", options: ["Stop!", "Is it big?", "How nice!", "She reads a book."], correctIndex: 3),
        MathExamQuestion(id: "es_teach_4_e9", topicId: 4, prompt: "¿Cómo se dice 'Los niños juegan fútbol' en inglés?", options: ["Soccer play the children.", "The children play soccer.", "Play the children soccer.", "Soccer the children play."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_4_e10", topicId: 4, prompt: "En inglés, ¿dónde va normalmente el adjetivo respecto al sustantivo?", options: ["Después del sustantivo", "Antes del sustantivo", "Al final de la oración", "Al inicio de la oración"], correctIndex: 1)
    ],

    // MARK: Topic 5 - Rimas y Familias
    5: [
        MathExamQuestion(id: "es_teach_5_e1", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'jump'?", options: ["dump", "camp", "lamp", "limp"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_5_e2", topicId: 5, prompt: "¿Cuál de estas palabras pertenece a la familia '-ight'?", options: ["bite", "light", "lite", "lyte"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_5_e3", topicId: 5, prompt: "¿Cuántas palabras de la familia '-at' puedes identificar en la lista? (cat, bat, hat, car, mat)", options: ["2", "3", "4", "5"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e4", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'cake'?", options: ["rack", "click", "lake", "lock"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e5", topicId: 5, prompt: "¿Cuál de estas palabras pertenece a la familia '-all'?", options: ["fell", "fill", "fall", "full"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e6", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'night'?", options: ["neat", "note", "fight", "flat"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e7", topicId: 5, prompt: "¿Cuál NO rima con las demás? (ring, sing, king, run)", options: ["ring", "sing", "king", "run"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_5_e8", topicId: 5, prompt: "¿Cuál de estas palabras pertenece a la familia '-ame'?", options: ["ham", "hum", "game", "gem"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e9", topicId: 5, prompt: "¿Cuál de estas palabras rima con 'blue'?", options: ["blow", "blade", "glue", "globe"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_5_e10", topicId: 5, prompt: "¿Cuál de estas palabras pertenece a la familia '-ake'?", options: ["snack", "snake", "snick", "snuck"], correctIndex: 1)
    ],

    // MARK: Topic 6 - Vocales Largas
    6: [
        MathExamQuestion(id: "es_teach_6_e1", topicId: 6, prompt: "Si agregas una 'e' silenciosa a 'hop', ¿qué palabra formas?", options: ["hap", "hip", "hope", "hup"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_e2", topicId: 6, prompt: "¿Cuál de estas palabras tiene la vocal larga 'a'?", options: ["map", "mad", "man", "make"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_6_e3", topicId: 6, prompt: "¿Cuál de estas palabras tiene la vocal larga 'o'?", options: ["hot", "hop", "hoe", "hog"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_6_e4", topicId: 6, prompt: "¿Cuál es la vocal larga en la palabra 'mule'?", options: ["a", "e", "i", "u"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_6_e5", topicId: 6, prompt: "Si agregas una 'e' silenciosa a 'pin', ¿qué palabra formas?", options: ["pane", "pine", "pone", "pune"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_6_e6", topicId: 6, prompt: "¿Cuál de estas palabras NO tiene vocal larga?", options: ["name", "time", "globe", "him"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_6_e7", topicId: 6, prompt: "La vocal larga suena como:", options: ["Un sonido muy corto y rápido", "El nombre de la letra vocal", "Un sonido completamente diferente", "La misma que la vocal corta"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_6_e8", topicId: 6, prompt: "¿Qué vocal larga tiene la palabra 'these'?", options: ["a", "e", "i", "o"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_6_e9", topicId: 6, prompt: "Si agregas una 'e' silenciosa a 'cut', ¿qué palabra formas?", options: ["cat", "cot", "cite", "cute"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_6_e10", topicId: 6, prompt: "¿Cuál de estas palabras tiene vocal larga 'i'?", options: ["him", "sip", "hide", "hit"], correctIndex: 2)
    ],

    // MARK: Topic 7 - Grupos Consonánticos
    7: [
        MathExamQuestion(id: "es_teach_7_e1", topicId: 7, prompt: "¿Cuál es el dígrafo en la palabra 'phone'?", options: ["po", "ho", "ph", "ne"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_e2", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el dígrafo 'wh'?", options: ["that", "shoe", "whale", "chin"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_e3", topicId: 7, prompt: "¿Cuál de estas palabras tiene el grupo consonántico 'br'?", options: ["plate", "brake", "float", "slope"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_e4", topicId: 7, prompt: "El dígrafo 'th' puede hacer cuántos sonidos diferentes?", options: ["Uno", "Dos", "Tres", "Cuatro"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_e5", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo consonántico 'cl'?", options: ["plan", "flan", "clan", "blan"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_e6", topicId: 7, prompt: "¿Cuál de estas palabras tiene el dígrafo 'ch'?", options: ["shape", "chair", "that", "phone"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_e7", topicId: 7, prompt: "¿Cuál de estas palabras tiene el grupo 'sp' al inicio?", options: ["play", "stay", "spoon", "pray"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_e8", topicId: 7, prompt: "¿Cuál es la diferencia entre un grupo consonántico y un dígrafo?", options: ["No hay diferencia", "Un grupo mantiene sonidos separados; un dígrafo crea un sonido nuevo", "Un dígrafo siempre tiene 3 letras", "Un grupo siempre tiene 2 letras"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_7_e9", topicId: 7, prompt: "¿Cuál de estas palabras empieza con el grupo 'fr'?", options: ["pray", "play", "frog", "bray"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_7_e10", topicId: 7, prompt: "¿Cuál de estas palabras tiene el dígrafo 'sh' al final?", options: ["chin", "thin", "fish", "with"], correctIndex: 2)
    ],

    // MARK: Topic 8 - Sustantivos y Verbos
    8: [
        MathExamQuestion(id: "es_teach_8_e1", topicId: 8, prompt: "¿Cuál de estas palabras es un sustantivo en inglés?", options: ["quickly", "run", "beautiful", "city"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_8_e2", topicId: 8, prompt: "¿Cuál de estas palabras es un verbo en inglés?", options: ["doctor", "happy", "dance", "red"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_e3", topicId: 8, prompt: "Un sustantivo propio en inglés (nombre específico) siempre:", options: ["Se escribe en minúscula", "Se escribe con mayúscula inicial", "Va al final de la oración", "Va con 'the' siempre"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_8_e4", topicId: 8, prompt: "¿Cuál de estas palabras es un sustantivo propio en inglés?", options: ["city", "school", "London", "river"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_e5", topicId: 8, prompt: "¿Cuál de estas palabras puede ser tanto sustantivo como verbo en inglés?", options: ["quickly", "run", "beautiful", "very"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_8_e6", topicId: 8, prompt: "En la oración 'The teacher writes on the board', ¿cuántos sustantivos hay?", options: ["Uno (teacher)", "Dos (teacher, board)", "Tres (teacher, writes, board)", "Ninguno"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_8_e7", topicId: 8, prompt: "¿Cuál de estas palabras es un verbo de acción en inglés?", options: ["table", "happy", "climb", "slowly"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_e8", topicId: 8, prompt: "¿Cuál de estas NO es un sustantivo en inglés?", options: ["flower", "mountain", "ocean", "eat"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_8_e9", topicId: 8, prompt: "¿Cuál de estas palabras es un verbo de estado en inglés?", options: ["run", "jump", "is", "swim"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_8_e10", topicId: 8, prompt: "¿Cómo se forma el plural de la mayoría de sustantivos en inglés?", options: ["Agregando -es", "Agregando -s", "Cambiando la vocal", "Agregando -ing"], correctIndex: 1)
    ],

    // MARK: Topic 9 - Adjetivos y Adverbios
    9: [
        MathExamQuestion(id: "es_teach_9_e1", topicId: 9, prompt: "¿Cuál de estas palabras es un adjetivo en inglés?", options: ["softly", "run", "purple", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e2", topicId: 9, prompt: "¿Cuál de estas palabras es un adverbio en inglés?", options: ["tall", "angry", "carefully", "cold"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e3", topicId: 9, prompt: "Los adjetivos en inglés generalmente van:", options: ["Después del sustantivo", "Antes del sustantivo", "Al final de la oración", "Antes del verbo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_9_e4", topicId: 9, prompt: "¿Cómo se forma la mayoría de los adverbios en inglés?", options: ["Adjetivo + -tion", "Adjetivo + -ing", "Adjetivo + -ly", "Adjetivo + -ed"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e5", topicId: 9, prompt: "¿Cuál es el adverbio formado del adjetivo 'happy'?", options: ["happied", "happiing", "happily", "happiton"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e6", topicId: 9, prompt: "En la oración 'The tiny kitten meows softly', ¿cuál es el adjetivo?", options: ["meows", "softly", "tiny", "kitten"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e7", topicId: 9, prompt: "En la oración 'She speaks Spanish fluently', ¿cuál es el adverbio?", options: ["She", "speaks", "Spanish", "fluently"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_9_e8", topicId: 9, prompt: "¿Cuál de estas NO es un adjetivo en inglés?", options: ["cold", "bright", "softly", "tall"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_9_e9", topicId: 9, prompt: "¿Cuál de estas oraciones usa el adjetivo correctamente?", options: ["She runs quick.", "The quick fox jumps.", "She is quickest ever.", "Runs quick she."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_9_e10", topicId: 9, prompt: "¿Cuál de estas oraciones usa el adverbio correctamente?", options: ["He sings beautiful.", "He sings beautifully.", "He beautifully sings song.", "Beautiful he sings."], correctIndex: 1)
    ],

    // MARK: Topic 10 - Puntuación Inglesa
    10: [
        MathExamQuestion(id: "es_teach_10_e1", topicId: 10, prompt: "¿Qué signo de puntuación se usa en inglés para separar cláusulas independientes?", options: ["Comma (,)", "Period (.)", "Semicolon (;)", "Colon (:)"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_e2", topicId: 10, prompt: "¿Cuál de estas oraciones usa la coma correctamente?", options: ["I like cats dogs and birds.", "I like cats, dogs, and birds.", "I like, cats dogs and birds.", "I, like cats dogs and birds."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e3", topicId: 10, prompt: "¿Qué hace la mayúscula inicial en inglés?", options: ["Se usa en todas las palabras", "Se usa para iniciar oraciones y en nombres propios", "Solo se usa en nombres", "Solo se usa al inicio del texto"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e4", topicId: 10, prompt: "¿Cuál de estas oraciones tiene la puntuación y mayúscula correcta?", options: ["the dog runs fast.", "The dog runs fast.", "The dog runs fast", "the dog runs fast"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e5", topicId: 10, prompt: "¿Cuándo se usa el apóstrofo en inglés?", options: ["Solo en preguntas", "En contracciones y para mostrar posesión", "Solo al final de las palabras", "Solo con números"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e6", topicId: 10, prompt: "¿Cuál de estas oraciones usa el apóstrofo correctamente?", options: ["Its cold today.", "It's cold today.", "Its' cold today.", "I'ts cold today."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e7", topicId: 10, prompt: "¿Cuál de estas oraciones tiene la puntuación correcta para una lista?", options: ["I need: milk eggs and bread.", "I need milk, eggs, and bread.", "I need milk eggs and, bread.", "I need, milk, eggs, and, bread."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e8", topicId: 10, prompt: "¿Qué tipo de oración termina con '!' en inglés?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_10_e9", topicId: 10, prompt: "En inglés, las comillas se usan para:", options: ["Indicar preguntas", "Mostrar el habla directa o citas", "Separar ideas", "Indicar exclamaciones"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_10_e10", topicId: 10, prompt: "¿Cuál oración tiene la puntuación correcta?", options: ["Wow that is amazing", "Wow, that is amazing!", "Wow that is amazing!", "Wow, that is amazing."], correctIndex: 1)
    ],

    // MARK: Topic 11 - Palabras Compuestas y Contracciones
    11: [
        MathExamQuestion(id: "es_teach_11_e1", topicId: 11, prompt: "¿Qué dos palabras forman 'bedroom'?", options: ["bed + room", "be + droom", "bedr + oom", "b + edroom"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_e2", topicId: 11, prompt: "¿Qué significa la contracción 'she's' en inglés?", options: ["she was", "she is / she has", "she will", "she can"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_e3", topicId: 11, prompt: "¿Qué dos palabras forman la contracción 'won't'?", options: ["wo + not", "will + not", "would + not", "want + not"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_e4", topicId: 11, prompt: "¿Cuál de estas es una palabra compuesta en inglés?", options: ["wouldn't", "playing", "sunflower", "helpful"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_11_e5", topicId: 11, prompt: "¿Qué significa la contracción 'they've' en inglés?", options: ["they are", "they were", "they have", "they will"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_11_e6", topicId: 11, prompt: "¿Qué dos palabras forman 'butterfly'?", options: ["butter + fly", "but + terfly", "butt + erfly", "butterf + ly"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_e7", topicId: 11, prompt: "¿Qué contracción corresponde a 'we are'?", options: ["we're", "were", "we'd", "we've"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_11_e8", topicId: 11, prompt: "¿Cuál de estas palabras compuestas significa 'tarea escolar'?", options: ["bedroom", "homework", "sunshine", "football"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_11_e9", topicId: 11, prompt: "¿Qué contracción corresponde a 'could not'?", options: ["can't", "won't", "couldn't", "shouldn't"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_11_e10", topicId: 11, prompt: "¿Qué dos palabras forman 'starfish'?", options: ["star + fish", "sta + rfish", "starf + ish", "s + tarfish"], correctIndex: 0)
    ],

    // MARK: Topic 12 - Prefijos y Sufijos
    12: [
        MathExamQuestion(id: "es_teach_12_e1", topicId: 12, prompt: "¿Cuál es el significado de 'unbelievable' en inglés?", options: ["Muy creíble", "Que se puede creer fácilmente", "Increíble / no creíble", "Creer de nuevo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_12_e2", topicId: 12, prompt: "¿Cuál es el significado de 'reread' en inglés?", options: ["No leer", "Leer de nuevo", "El mejor lector", "Que le gusta leer"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e3", topicId: 12, prompt: "¿Cuál es el significado de 'careless' en inglés?", options: ["Con mucho cuidado", "Sin cuidado / descuidado", "Que cuida mucho", "Cuidar de nuevo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e4", topicId: 12, prompt: "¿Cuál es el significado de 'colorful' en inglés?", options: ["Sin color", "Colorido / lleno de color", "El color más bello", "Colorear de nuevo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e5", topicId: 12, prompt: "¿Cuál sufijo convierte un adjetivo en su forma comparativa?", options: ["-est", "-ful", "-er", "-less"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_12_e6", topicId: 12, prompt: "¿Qué significa 'powerless' en inglés?", options: ["Poderoso", "Sin poder", "Muy poderoso", "El más poderoso"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e7", topicId: 12, prompt: "¿Qué sufijo se agrega para indicar que una acción ya ocurrió (pasado)?", options: ["-ing", "-er", "-ed", "-est"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_12_e8", topicId: 12, prompt: "¿Cuál es el significado de 'unclear' en inglés?", options: ["Muy claro", "No claro / confuso", "El más claro", "Clarificar"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e9", topicId: 12, prompt: "¿Cuál de estas palabras tiene el sufijo '-ful'?", options: ["jumping", "careful", "redo", "unhappy"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_12_e10", topicId: 12, prompt: "¿Cuál de estas palabras tiene el prefijo 're-'?", options: ["reading", "helpful", "rebuild", "fastest"], correctIndex: 2)
    ],

    // MARK: Topic 13 - Sinónimos y Antónimos
    13: [
        MathExamQuestion(id: "es_teach_13_e1", topicId: 13, prompt: "¿Cuál es el antónimo de 'beautiful' en inglés?", options: ["pretty", "lovely", "ugly", "gorgeous"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e2", topicId: 13, prompt: "¿Cuál es el sinónimo de 'angry' en inglés?", options: ["happy", "calm", "furious", "sad"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e3", topicId: 13, prompt: "¿Cuál es el antónimo de 'start' en inglés?", options: ["begin", "commence", "launch", "finish"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_13_e4", topicId: 13, prompt: "¿Cuál es el sinónimo de 'cold' en inglés?", options: ["warm", "hot", "chilly", "burning"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e5", topicId: 13, prompt: "¿Cuál par son antónimos en inglés?", options: ["begin / start", "happy / joyful", "old / new", "big / large"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e6", topicId: 13, prompt: "¿Cuál es el sinónimo de 'small' en inglés?", options: ["large", "huge", "tiny", "enormous"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e7", topicId: 13, prompt: "¿Cuál es el antónimo de 'above' en inglés?", options: ["over", "up", "high", "below"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_13_e8", topicId: 13, prompt: "¿Cuál par son sinónimos en inglés?", options: ["hot / cold", "day / night", "smart / intelligent", "fast / slow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e9", topicId: 13, prompt: "¿Cuál es el antónimo de 'remember' en inglés?", options: ["recall", "memorize", "forget", "remind"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_13_e10", topicId: 13, prompt: "¿Cuál es el sinónimo de 'thin' en inglés?", options: ["fat", "wide", "broad", "slim"], correctIndex: 3)
    ],

    // MARK: Topic 14 - Comprensión Lectora
    14: [
        MathExamQuestion(id: "es_teach_14_e1", topicId: 14, prompt: "Lee: 'Anna woke up early. She brushed her teeth and ate breakfast. Then she ran to catch the school bus.' ¿Cuál es la idea principal?", options: ["Anna tiene hambre", "Anna se prepara para ir a la escuela", "Anna llega tarde al autobús", "Anna no desayunó"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_e2", topicId: 14, prompt: "Lee: 'The sky turned dark. Thunder roared and lightning flashed.' ¿Qué está pasando?", options: ["Está saliendo el sol", "Es una noche tranquila", "Hay una tormenta", "Es un día de playa"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_e3", topicId: 14, prompt: "¿Qué pregunta de comprensión ayuda a encontrar el tema principal del texto?", options: ["Who? (¿Quién?)", "What is it mostly about? (¿De qué trata principalmente?)", "Where? (¿Dónde?)", "When? (¿Cuándo?)"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_e4", topicId: 14, prompt: "Lee: 'Max has a dog named Buddy. Buddy likes to run and play fetch.' ¿Cómo se llama el perro?", options: ["Max", "Fetch", "Buddy", "Play"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_e5", topicId: 14, prompt: "Lee: 'The library closes at 6 PM on weekdays.' ¿Cuándo cierra la biblioteca entre semana?", options: ["A las 5 PM", "A las 6 PM", "A las 7 PM", "A las 8 PM"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_e6", topicId: 14, prompt: "Una inferencia en inglés es cuando:", options: ["Lees solo el título", "Usas pistas del texto para deducir algo que no se dice directamente", "Copias el texto exactamente", "Lees solo el primer párrafo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_e7", topicId: 14, prompt: "Lee: 'The children laughed and cheered when the clown arrived.' ¿Cómo se sintieron los niños?", options: ["Asustados", "Tristes", "Aburridos", "Felices y emocionados"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_14_e8", topicId: 14, prompt: "¿Qué es el 'main idea' (idea principal) de un texto?", options: ["La primera oración", "El punto más importante que el autor quiere comunicar", "El último párrafo", "Todos los detalles del texto"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_14_e9", topicId: 14, prompt: "Lee: 'Birds build nests in trees. They use sticks, leaves, and grass.' ¿Para qué usan los pájaros palitos y hojas?", options: ["Para comer", "Para volar", "Para construir nidos", "Para jugar"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_14_e10", topicId: 14, prompt: "¿Qué son los 'supporting details' (detalles de apoyo) en un texto?", options: ["La idea principal del texto", "Información específica que apoya y explica la idea principal", "El título del texto", "La opinión del lector"], correctIndex: 1)
    ],

    // MARK: Topic 15 - Elementos del Cuento
    15: [
        MathExamQuestion(id: "es_teach_15_e1", topicId: 15, prompt: "En el cuento 'The Three Little Pigs', ¿cuál es el problema?", options: ["Los cerditos construyen casas", "El lobo derriba las casas de los cerditos", "Los cerditos son amigos", "El lobo come paja"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_e2", topicId: 15, prompt: "En el cuento 'Cinderella', ¿cuál es el 'setting' (ambiente)?", options: ["Un castillo en un reino lejano y en el pasado", "Una ciudad moderna", "Un bosque tropical", "Una escuela"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_15_e3", topicId: 15, prompt: "¿Qué es el 'climax' de un cuento?", options: ["El inicio de la historia", "El momento más intenso o emocionante", "La presentación de los personajes", "La solución del problema"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_e4", topicId: 15, prompt: "En 'Jack and the Beanstalk', ¿quién es el antagonista?", options: ["Jack", "Jack's mother", "The giant", "The magic beans"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_e5", topicId: 15, prompt: "¿Cuál es la 'resolution' (resolución) de un cuento?", options: ["Cuando se presenta el problema", "Cuando se introducen los personajes", "Cuando el problema se resuelve al final", "Cuando ocurre el evento más emocionante"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_e6", topicId: 15, prompt: "En un cuento, los 'characters' (personajes) son:", options: ["El lugar donde ocurre la historia", "Las personas, animales o seres que participan en la historia", "La secuencia de eventos", "El problema del cuento"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_e7", topicId: 15, prompt: "¿Qué es el 'theme' (tema) de un cuento?", options: ["El título del cuento", "El lugar de la historia", "El mensaje o enseñanza principal del cuento", "El nombre del autor"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_15_e8", topicId: 15, prompt: "¿Cuál es el orden correcto de los elementos de la trama?", options: ["Clímax → Introducción → Conflicto → Resolución", "Introducción → Conflicto → Clímax → Resolución", "Resolución → Clímax → Conflicto → Introducción", "Conflicto → Introducción → Resolución → Clímax"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_e9", topicId: 15, prompt: "En 'Snow White', ¿cuál es el problema principal?", options: ["Snow White no tiene amigos", "La madrastra malvada quiere dañar a Snow White", "Los enanos no quieren a Snow White", "Snow White está perdida en el bosque"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_15_e10", topicId: 15, prompt: "¿Qué información nos da el 'setting' de un cuento?", options: ["Quiénes son los personajes", "Qué problema tiene el personaje", "Dónde y cuándo ocurre la historia", "Cómo termina la historia"], correctIndex: 2)
    ],

    // MARK: Topic 16 - Tipos de Oraciones
    16: [
        MathExamQuestion(id: "es_teach_16_e1", topicId: 16, prompt: "¿Cuál de estas es una oración declarativa en inglés?", options: ["Run fast!", "Is it hot today?", "The sun is very hot today.", "How hot it is!"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_e2", topicId: 16, prompt: "¿Cuál de estas es una oración imperativa en inglés?", options: ["It is raining.", "Is it raining?", "How it rains!", "Bring your umbrella."], correctIndex: 3),
        MathExamQuestion(id: "es_teach_16_e3", topicId: 16, prompt: "Las oraciones imperativas en inglés muchas veces no tienen sujeto porque:", options: ["El sujeto es 'I' (yo)", "El sujeto 'you' (tú/usted) está implícito", "No tienen verbo", "El sujeto es 'they' (ellos)"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_16_e4", topicId: 16, prompt: "¿Qué tipo de oración es 'What a beautiful sunset!'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_e5", topicId: 16, prompt: "¿Cuál de estas oraciones es interrogativa en inglés?", options: ["She likes cats.", "Like cats she does.", "Does she like cats?", "She does like cats!"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_e6", topicId: 16, prompt: "¿Cuántos tipos de oraciones hay en inglés?", options: ["2", "3", "4", "5"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_e7", topicId: 16, prompt: "¿Qué tipo de oración es 'Please be quiet.'?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_16_e8", topicId: 16, prompt: "¿Con qué palabras suelen empezar las preguntas en inglés?", options: ["The, A, An", "Who, What, Where, When, Why, How, Do, Does, Is, Are", "I, You, He, She", "Run, Jump, Walk"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_16_e9", topicId: 16, prompt: "¿Cuál de estas oraciones es declarativa y tiene puntuación correcta?", options: ["My favorite color is blue!", "My favorite color is blue?", "My favorite color is blue.", "My favorite color is blue"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_16_e10", topicId: 16, prompt: "¿Qué tipo de oración expresa emoción intensa en inglés?", options: ["Declarativa", "Interrogativa", "Exclamativa", "Imperativa"], correctIndex: 2)
    ],

    // MARK: Topic 17 - Homófonos Ingleses
    17: [
        MathExamQuestion(id: "es_teach_17_e1", topicId: 17, prompt: "¿Cuál es la diferencia entre 'there', 'their' y 'they're'?", options: ["Son exactamente lo mismo", "There=lugar, Their=de ellos, They're=ellos son/están", "Their=lugar, There=de ellos, They're=ellos son/están", "They're=lugar, Their=ellos son/están, There=de ellos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_17_e2", topicId: 17, prompt: "Elige la correcta: 'We need ___ finish our homework.' (debemos terminar)", options: ["too", "two", "to", "tow"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_e3", topicId: 17, prompt: "Elige la correcta: '___ dog is very friendly.' (el perro de ellos)", options: ["There", "They're", "Their", "Thier"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_e4", topicId: 17, prompt: "Elige la correcta: 'I want a cookie, ___.' (también)", options: ["to", "two", "tow", "too"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_17_e5", topicId: 17, prompt: "Elige la correcta: '___ already at the park.' (ellos ya están)", options: ["Their", "There", "They're", "Thier"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_e6", topicId: 17, prompt: "Elige la correcta: 'The cat hurt ___ tail.' (su cola, del gato)", options: ["it's", "its", "it'ss", "its'"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_17_e7", topicId: 17, prompt: "Elige la correcta: '___ a beautiful day outside.' (está siendo)", options: ["Its", "Its'", "It's", "Itss"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_e8", topicId: 17, prompt: "Elige la correcta: 'I put the book over ___.' (allá)", options: ["their", "they're", "there", "thier"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_17_e9", topicId: 17, prompt: "Elige la correcta: '___ going on vacation.' (ellos se van)", options: ["Their", "There", "Thier", "They're"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_17_e10", topicId: 17, prompt: "¿Cuál oración usa 'your' y 'you're' correctamente?", options: ["Your so kind! You're bag is nice.", "You're so kind! Your bag is nice.", "You're so kind! You're bag is nice.", "Your so kind! Your bag is nice."], correctIndex: 1)
    ],

    // MARK: Topic 18 - Partes del Discurso
    18: [
        MathExamQuestion(id: "es_teach_18_e1", topicId: 18, prompt: "Identifica todas las partes del discurso en: 'She quickly runs to school.' ¿Qué parte del discurso es 'quickly'?", options: ["Noun", "Verb", "Adjective", "Adverb"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_e2", topicId: 18, prompt: "¿Cuál es la parte del discurso de 'on' en 'The book is on the table'?", options: ["Noun", "Verb", "Adjective", "Preposition"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_e3", topicId: 18, prompt: "¿Cuál es la parte del discurso de 'we' en inglés?", options: ["Noun", "Pronoun", "Verb", "Adjective"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_18_e4", topicId: 18, prompt: "En la oración 'The happy children play outside', ¿cuántos adjetivos hay?", options: ["Ninguno", "Uno (happy)", "Dos (happy, outside)", "Tres (happy, children, outside)"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_18_e5", topicId: 18, prompt: "¿Qué parte del discurso es 'under' en 'The cat is under the bed'?", options: ["Noun", "Verb", "Adjective", "Preposition"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_e6", topicId: 18, prompt: "¿Qué parte del discurso es 'they' en inglés?", options: ["Noun", "Pronoun", "Verb", "Adverb"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_18_e7", topicId: 18, prompt: "En la oración 'He reads books carefully', identifica el adverbio:", options: ["He", "reads", "books", "carefully"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_18_e8", topicId: 18, prompt: "¿Qué parte del discurso es 'friendship' en inglés?", options: ["Verb", "Adjective", "Noun", "Adverb"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_18_e9", topicId: 18, prompt: "¿Cuál de estas oraciones tiene: pronombre + adverbio + verbo + preposición + sustantivo?", options: ["She quickly runs to school.", "The big dog barks.", "Books are interesting.", "Run fast!"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_18_e10", topicId: 18, prompt: "¿Cuál de las siguientes palabras es una preposición en inglés?", options: ["beautiful", "sing", "between", "happily"], correctIndex: 2)
    ]
]
