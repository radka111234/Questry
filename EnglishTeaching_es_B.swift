import Foundation

// MARK: - English Teaching Pack: Spanish (Topics 19-35)

let esTeachingTopicsB: [(id: Int, title: String, intro: String, example: String)] = [
    (19, "Sujeto y Predicado", "Toda oración en inglés tiene un sujeto (de quién se habla) y un predicado (lo que hace o es).", "En 'The dog runs fast', 'The dog' es el sujeto y 'runs fast' es el predicado."),
    (20, "Lenguaje Figurado", "El lenguaje figurado usa palabras de forma no literal para crear imágenes vívidas en inglés.", "Simile: 'brave as a lion'. Metaphor: 'time is money'. Personification: 'the wind whispered'."),
    (21, "Vocabulario en Contexto", "Puedes descubrir el significado de palabras desconocidas en inglés usando las pistas del contexto.", "En 'She was famished  -  she hadn't eaten all day', 'famished' significa muy hambrienta."),
    (22, "Idea Principal", "La idea principal es el mensaje más importante de un párrafo. Los detalles de apoyo la explican.", "En un párrafo sobre perros, la idea principal puede ser: 'Dogs are loyal pets.'"),
    (23, "Punto de Vista", "El punto de vista indica desde qué perspectiva está narrada una historia en inglés.", "Primera persona: I/me. Segunda persona: you. Tercera persona: he/she/they."),
    (24, "Estructuras Textuales", "Los textos en inglés usan estructuras para organizar la información de diferentes maneras.", "Compare/contrast, cause/effect, problem/solution, sequence, description."),
    (25, "Escritura Narrativa", "La narrativa cuenta una historia con inicio, desarrollo y desenlace, usando diálogo y lenguaje descriptivo.", "El arco narrativo incluye: exposition, rising action, climax, falling action, resolution."),
    (26, "Poesía Inglesa", "La poesía inglesa usa rima, métrica, aliteración y otras herramientas para crear belleza con el lenguaje.", "Un soneto tiene 14 líneas. ABAB es un esquema de rima alternada."),
    (27, "Oraciones Compuestas", "Las oraciones compuestas en inglés unen dos cláusulas independientes con conjunciones coordinantes (FANBOYS).", "FANBOYS: For, And, Nor, But, Or, Yet, So. Ejemplo: 'I was tired, but I studied.'"),
    (28, "Voz Activa y Pasiva", "En voz activa el sujeto realiza la acción. En voz pasiva el sujeto recibe la acción.", "Activa: 'The dog bit the man.' Pasiva: 'The man was bitten by the dog.'"),
    (29, "Escritura Persuasiva", "La escritura persuasiva en inglés convence al lector usando tesis, evidencia y recursos retóricos.", "Ethos = credibilidad, Pathos = emoción, Logos = lógica/razón."),
    (30, "Recursos Literarios", "Los recursos literarios enriquecen los textos en inglés con capas de significado.", "Foreshadowing anticipa eventos futuros. La ironía dice lo opuesto de lo que se quiere decir."),
    (31, "Propósito del Autor", "El autor escribe para informar, persuadir o entretener. Reconocer el propósito ayuda a comprender mejor.", "Un artículo de noticias informa. Un anuncio persuade. Un cuento entretiene."),
    (32, "Investigación y Citas", "Al investigar en inglés debes parafrasear, citar fuentes y evitar el plagio usando formato MLA.", "MLA: Apellido, Nombre. Título. Editorial, Año."),
    (33, "Shakespeare y Literatura Clásica", "Shakespeare escribió en inglés isabelino usando pentámetro yámbico, sonetos, tragedias y comedias.", "Un soliloquio es cuando un personaje habla solo revelando sus pensamientos internos."),
    (34, "Etimología", "Muchas palabras en inglés vienen del latín y el griego. Conocer las raíces ayuda a entender vocabulario nuevo.", "bio=vida, geo=tierra, port=llevar, dict=decir, scrib=escribir."),
    (35, "Gramática Avanzada", "La gramática avanzada en inglés incluye puntuación especial y estructuras paralelas.", "Punto y coma (;) une cláusulas relacionadas. Los dos puntos (:) introducen listas o explicaciones.")
]

// MARK: - Practice Questions (10 per topic)

let esTeachingPracticeB: [Int: [MathExamQuestion]] = [

    19: [
        MathExamQuestion(id: "es_teach_19_p1", topicId: 19, prompt: "¿Cuál es el sujeto en la oración 'The cat sleeps on the sofa'?", options: ["sleeps", "The cat", "on the sofa", "sofa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_19_p2", topicId: 19, prompt: "¿Cuál es el predicado en la oración 'My sister plays the piano'?", options: ["My sister", "the piano", "plays the piano", "My"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_19_p3", topicId: 19, prompt: "En 'The tall boy ran quickly', ¿cuál es el sujeto?", options: ["ran quickly", "tall", "The tall boy", "quickly"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_19_p4", topicId: 19, prompt: "¿Qué parte de la oración dice lo que el sujeto hace o es?", options: ["El sujeto", "El predicado", "El artículo", "El adjetivo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_19_p5", topicId: 19, prompt: "En 'Birds sing beautifully in the morning', ¿cuál es el sujeto?", options: ["sing beautifully", "in the morning", "beautifully", "Birds"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_19_p6", topicId: 19, prompt: "¿Cuál de estas oraciones tiene el sujeto 'We'?", options: ["She runs fast.", "We love pizza.", "They play soccer.", "He reads books."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_19_p7", topicId: 19, prompt: "En 'The old man walks slowly', el predicado es:", options: ["The old man", "slowly", "walks slowly", "old"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_19_p8", topicId: 19, prompt: "¿Cuál es el sujeto en 'My best friend moved to a new city'?", options: ["moved to a new city", "a new city", "My best friend", "new city"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_19_p9", topicId: 19, prompt: "En inglés, el sujeto simple suele ser:", options: ["Un verbo", "Un sustantivo o pronombre", "Un adverbio", "Una preposición"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_19_p10", topicId: 19, prompt: "¿Cuál es el predicado en 'The happy children laughed all afternoon'?", options: ["The happy children", "happy children", "laughed all afternoon", "all afternoon"], correctIndex: 2)
    ],

    20: [
        MathExamQuestion(id: "es_teach_20_p1", topicId: 20, prompt: "¿Qué tipo de lenguaje figurado es 'Her smile is sunshine'?", options: ["Símil", "Metáfora", "Personificación", "Hipérbole"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_20_p2", topicId: 20, prompt: "¿Cuál de estas frases es un símil en inglés?", options: ["The wind sang.", "He is a rock.", "She runs like the wind.", "Time flies."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_20_p3", topicId: 20, prompt: "La personificación en inglés consiste en:", options: ["Comparar dos cosas usando 'like' o 'as'", "Dar cualidades humanas a objetos o animales", "Exagerar para dar énfasis", "Describir con muchos adjetivos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_20_p4", topicId: 20, prompt: "¿Qué figura retórica es 'I've told you a million times'?", options: ["Metáfora", "Símil", "Personificación", "Hipérbole"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_20_p5", topicId: 20, prompt: "'The stars danced in the sky' es un ejemplo de:", options: ["Símil", "Hipérbole", "Personificación", "Metáfora"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_20_p6", topicId: 20, prompt: "¿Cuál es la diferencia entre un símil y una metáfora?", options: ["No hay diferencia", "El símil usa 'like' o 'as', la metáfora no", "La metáfora usa 'like' o 'as', el símil no", "El símil es más largo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_20_p7", topicId: 20, prompt: "'Life is a rollercoaster' es un ejemplo de:", options: ["Símil", "Metáfora", "Hipérbole", "Personificación"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_20_p8", topicId: 20, prompt: "¿Cuál de estas es una hipérbole en inglés?", options: ["He is as fast as a cheetah.", "The moon smiled at us.", "I'm so hungry I could eat a horse.", "Time is gold."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_20_p9", topicId: 20, prompt: "'As brave as a lion' es un ejemplo de:", options: ["Metáfora", "Personificación", "Hipérbole", "Símil"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_20_p10", topicId: 20, prompt: "¿Qué figura retórica usa lenguaje NO literal para crear imágenes?", options: ["Gramática literal", "Lenguaje figurado", "Puntuación", "Conjugación"], correctIndex: 1)
    ],

    21: [
        MathExamQuestion(id: "es_teach_21_p1", topicId: 21, prompt: "En 'The ancient, crumbling castle looked abandoned', ¿qué significa 'ancient'?", options: ["Nuevo", "Muy viejo", "Colorido", "Pequeño"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p2", topicId: 21, prompt: "¿Qué estrategia usas cuando adivinas el significado de una palabra por las palabras que la rodean?", options: ["Buscar en el diccionario", "Usar pistas de contexto", "Preguntar al maestro", "Ignorar la palabra"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p3", topicId: 21, prompt: "En 'She was elated  -  jumping for joy after winning', 'elated' significa:", options: ["Triste", "Cansada", "Muy feliz", "Enojada"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_21_p4", topicId: 21, prompt: "¿Cuál pista de contexto es una definición directa?", options: ["She was tired.", "He was famished, or extremely hungry.", "The dog barked.", "She ran fast."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p5", topicId: 21, prompt: "En 'Unlike his gregarious sister, Tom was shy and quiet', 'gregarious' significa:", options: ["Tímida", "Sociable", "Inteligente", "Alta"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p6", topicId: 21, prompt: "¿Cuál es una pista de contraste?", options: ["In other words...", "Also called...", "However, unlike...", "For example..."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_21_p7", topicId: 21, prompt: "En 'The benevolent king helped all his people generously', 'benevolent' significa:", options: ["Cruel", "Bondadoso", "Perezoso", "Pobre"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p8", topicId: 21, prompt: "Las pistas de contexto pueden ser:", options: ["Solo sinónimos", "Definiciones, ejemplos, antónimos o descripciones", "Solo antónimos", "Solo imágenes"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p9", topicId: 21, prompt: "En 'The novice, or beginner, made many mistakes', ¿qué significa 'novice'?", options: ["Experto", "Principiante", "Maestro", "Ganador"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_21_p10", topicId: 21, prompt: "¿Qué frase indica que viene una definición o explicación en inglés?", options: ["However", "In other words", "On the other hand", "Therefore"], correctIndex: 1)
    ],

    22: [
        MathExamQuestion(id: "es_teach_22_p1", topicId: 22, prompt: "¿Qué es la idea principal de un párrafo?", options: ["El primer detalle mencionado", "El mensaje más importante del párrafo", "La última oración", "Un ejemplo específico"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p2", topicId: 22, prompt: "¿Cómo se llama en inglés la oración que expresa la idea principal?", options: ["Supporting sentence", "Topic sentence", "Concluding sentence", "Detail sentence"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p3", topicId: 22, prompt: "Los detalles de apoyo ('supporting details') sirven para:", options: ["Contradecir la idea principal", "Explicar o desarrollar la idea principal", "Cambiar de tema", "Concluir el texto"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p4", topicId: 22, prompt: "Si un párrafo habla sobre los beneficios del ejercicio, la idea principal probablemente es:", options: ["El ejercicio es difícil.", "Exercise has many health benefits.", "Some people don't like exercise.", "Running is tiring."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p5", topicId: 22, prompt: "¿Dónde suele aparecer la idea principal en un párrafo?", options: ["Solo en el medio", "Solo al final", "Al inicio, al final, o implícita", "Nunca se menciona"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_22_p6", topicId: 22, prompt: "¿Qué es una idea principal implícita?", options: ["Una que aparece al principio", "Una que el lector debe deducir", "Una que se repite dos veces", "Una que tiene ejemplos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p7", topicId: 22, prompt: "Un detalle de apoyo en inglés es:", options: ["La idea más importante", "Una oración que da más información sobre la idea principal", "La conclusión del párrafo", "El título del texto"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p8", topicId: 22, prompt: "¿Cuál de estas opciones es una idea principal sobre los delfines?", options: ["Dolphins jump.", "Dolphins are highly intelligent marine mammals.", "Some dolphins are gray.", "Dolphins live in water."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p9", topicId: 22, prompt: "La diferencia entre tema e idea principal es:", options: ["Son lo mismo", "El tema es una palabra/frase; la idea principal es una oración completa", "La idea principal es una palabra", "El tema es más largo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_22_p10", topicId: 22, prompt: "¿Cuál de estas es una oración temática (topic sentence) efectiva?", options: ["Dogs.", "There are dogs.", "Dogs make excellent companions for many reasons.", "The dog ran."], correctIndex: 2)
    ],

    23: [
        MathExamQuestion(id: "es_teach_23_p1", topicId: 23, prompt: "¿Qué pronombres se usan en la primera persona en inglés?", options: ["He, she, it", "You, your", "I, me, my, we, us", "They, them"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_23_p2", topicId: 23, prompt: "En una historia narrada en primera persona, ¿quién narra?", options: ["Un narrador externo", "Un personaje dentro de la historia", "El autor del libro", "Un personaje invisible"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_23_p3", topicId: 23, prompt: "'You walk into the dark room and feel a chill.' ¿En qué punto de vista está escrito?", options: ["Primera persona", "Segunda persona", "Tercera persona limitada", "Tercera persona omnisciente"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_23_p4", topicId: 23, prompt: "La tercera persona omnisciente en inglés significa que el narrador:", options: ["Solo conoce los pensamientos de un personaje", "Conoce los pensamientos de todos los personajes", "Es un personaje de la historia", "Solo describe lo que se ve"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_23_p5", topicId: 23, prompt: "'She opened the letter and smiled.' ¿En qué punto de vista está?", options: ["Primera persona", "Segunda persona", "Tercera persona", "Ninguno"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_23_p6", topicId: 23, prompt: "¿Qué pronombres indican tercera persona en inglés?", options: ["I, we", "You, your", "He, she, it, they", "Me, us"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_23_p7", topicId: 23, prompt: "'I love reading books every night.' ¿En qué punto de vista está?", options: ["Segunda persona", "Tercera persona", "Primera persona", "Cuarta persona"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_23_p8", topicId: 23, prompt: "¿Cuál es una ventaja de narrar en primera persona?", options: ["El lector conoce todos los pensamientos", "El lector se siente más cerca del narrador", "Es más objetiva", "Usa más vocabulario"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_23_p9", topicId: 23, prompt: "La tercera persona limitada se enfoca en:", options: ["Todos los personajes igualmente", "Solo los pensamientos de un personaje", "El punto de vista del lector", "Lo que el autor piensa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_23_p10", topicId: 23, prompt: "¿Cuál de estas frases está en segunda persona?", options: ["I went to the store.", "He bought a book.", "You should try this!", "They played outside."], correctIndex: 2)
    ],

    24: [
        MathExamQuestion(id: "es_teach_24_p1", topicId: 24, prompt: "¿Cuál estructura textual en inglés explica por qué ocurre algo y qué resultado tiene?", options: ["Compare/contrast", "Description", "Cause/effect", "Problem/solution"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_24_p2", topicId: 24, prompt: "Las palabras 'similarly', 'however', 'on the other hand' indican una estructura de:", options: ["Secuencia", "Compare/contrast", "Causa/efecto", "Descripción"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_24_p3", topicId: 24, prompt: "¿Cuál estructura textual usa palabras como 'first', 'next', 'then', 'finally'?", options: ["Description", "Cause/effect", "Sequence", "Compare/contrast"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_24_p4", topicId: 24, prompt: "Un texto que describe un problema y luego da una solución usa la estructura:", options: ["Compare/contrast", "Sequence", "Description", "Problem/solution"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_24_p5", topicId: 24, prompt: "Las palabras 'because', 'therefore', 'as a result' indican:", options: ["Secuencia", "Descripción", "Causa/efecto", "Problema/solución"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_24_p6", topicId: 24, prompt: "Un texto descriptivo en inglés usa principalmente:", options: ["Palabras de tiempo", "Palabras de causa", "Adjetivos y detalles sensoriales", "Conectores de contraste"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_24_p7", topicId: 24, prompt: "'Both dogs and cats make good pets. However, dogs need more exercise.' ¿Qué estructura es?", options: ["Secuencia", "Compare/contrast", "Causa/efecto", "Problema/solución"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_24_p8", topicId: 24, prompt: "¿Por qué es importante identificar la estructura de un texto?", options: ["Para escribir más rápido", "Para entender mejor cómo está organizada la información", "Para encontrar palabras difíciles", "Para contar párrafos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_24_p9", topicId: 24, prompt: "'The town had no clean water. To solve this, they built new pipes.' ¿Qué estructura es?", options: ["Descripción", "Secuencia", "Compare/contrast", "Problem/solution"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_24_p10", topicId: 24, prompt: "¿Cuál conectivo es típico de la estructura de secuencia?", options: ["However", "Therefore", "First, then, finally", "Similarly"], correctIndex: 2)
    ],

    25: [
        MathExamQuestion(id: "es_teach_25_p1", topicId: 25, prompt: "¿Cómo se llama el punto más emocionante de una historia en inglés?", options: ["Resolution", "Exposition", "Climax", "Rising action"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_25_p2", topicId: 25, prompt: "¿Qué parte del arco narrativo presenta a los personajes y el ambiente?", options: ["Climax", "Falling action", "Exposition", "Resolution"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_25_p3", topicId: 25, prompt: "¿Cómo se puntúa correctamente el diálogo en inglés?", options: ["She said I'm happy.", "She said, 'I'm happy.'", "She said I'm happy!", "She said; I'm happy."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_25_p4", topicId: 25, prompt: "El lenguaje descriptivo en una narrativa sirve para:", options: ["Resumir la historia", "Crear imágenes vívidas en la mente del lector", "Listar eventos en orden", "Explicar datos", ], correctIndex: 1),
        MathExamQuestion(id: "es_teach_25_p5", topicId: 25, prompt: "¿Qué es el 'resolution' en una narrativa inglesa?", options: ["El inicio de la historia", "El conflicto principal", "El punto más alto de tensión", "El final donde se resuelve el conflicto"], correctIndex: 3),
        MathExamQuestion(id: "es_teach_25_p6", topicId: 25, prompt: "El 'rising action' en una narrativa es:", options: ["Los eventos que llevan al clímax", "El final de la historia", "La presentación del ambiente", "La solución del conflicto"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_25_p7", topicId: 25, prompt: "¿Cuál es el propósito principal de incluir diálogo en una narración?", options: ["Hacer el texto más largo", "Revelar la personalidad de los personajes y avanzar la trama", "Confundir al lector", "Agregar datos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_25_p8", topicId: 25, prompt: "Un buen párrafo de apertura narrativa debe:", options: ["Revelar el final", "Captar la atención del lector e introducir el escenario", "Listar todos los personajes", "Explicar el tema"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_25_p9", topicId: 25, prompt: "¿Cuál de estas palabras es un verbo de diálogo (dialogue tag) en inglés?", options: ["Quickly", "Beautiful", "Whispered", "Running"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_25_p10", topicId: 25, prompt: "El 'falling action' ocurre:", options: ["Antes del clímax", "Durante el clímax", "Después del clímax pero antes de la resolución", "Al inicio de la historia"], correctIndex: 2)
    ],

    26: [
        MathExamQuestion(id: "es_teach_26_p1", topicId: 26, prompt: "¿Cuántas líneas tiene un soneto en inglés?", options: ["10", "12", "14", "16"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_26_p2", topicId: 26, prompt: "¿Qué es un esquema de rima ABAB?", options: ["Las líneas 1 y 3 riman, las líneas 2 y 4 riman", "Las líneas 1 y 2 riman, las 3 y 4 riman", "Todas las líneas riman", "Ninguna línea rima"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_26_p3", topicId: 26, prompt: "¿Qué es la aliteración en poesía inglesa?", options: ["La repetición de sonidos vocálicos", "La repetición del mismo sonido consonántico al inicio de palabras cercanas", "Palabras que riman al final", "El ritmo del poema"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p4", topicId: 26, prompt: "¿Cómo se llama cada sección o bloque de líneas en un poema en inglés?", options: ["Verse", "Stanza", "Chorus", "Chapter"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p5", topicId: 26, prompt: "'Peter Piper picked a peck of pickled peppers' es un ejemplo de:", options: ["Rima", "Aliteración", "Asonancia", "Métrica"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p6", topicId: 26, prompt: "¿Qué es la asonancia en poesía?", options: ["Repetición de sonidos consonánticos", "Repetición de sonidos vocálicos en palabras cercanas", "Palabras que riman perfectamente", "El número de sílabas"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p7", topicId: 26, prompt: "En el esquema AABB, ¿qué líneas riman?", options: ["1 con 3, 2 con 4", "1 con 2, 3 con 4", "Todas con todas", "Ninguna"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p8", topicId: 26, prompt: "¿Qué es el verso libre ('free verse') en poesía inglesa?", options: ["Poesía con rima perfecta", "Poesía sin rima ni métrica fija", "Poesía muy corta", "Poesía con 14 líneas"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p9", topicId: 26, prompt: "La métrica (meter) en poesía inglesa se refiere a:", options: ["El número de estrofas", "El patrón de sílabas acentuadas y no acentuadas", "El tema del poema", "El tipo de rima"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_26_p10", topicId: 26, prompt: "¿Cuál de estas palabras rima con 'night' en inglés?", options: ["Nice", "Knife", "Light", "Know"], correctIndex: 2)
    ],

    27: [
        MathExamQuestion(id: "es_teach_27_p1", topicId: 27, prompt: "¿Qué significa FANBOYS en gramática inglesa?", options: ["Un grupo musical", "Las conjunciones coordinantes: For, And, Nor, But, Or, Yet, So", "Tipos de adverbios", "Pronombres personales"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p2", topicId: 27, prompt: "¿Cuál de estas es una oración compuesta correcta en inglés?", options: ["I was tired.", "I was tired but I kept studying.", "Because I was tired.", "Tired I was."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p3", topicId: 27, prompt: "En 'She wanted to dance, so she took lessons', ¿qué conjunción se usa?", options: ["But", "And", "So", "Nor"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_27_p4", topicId: 27, prompt: "¿Cuántas cláusulas independientes tiene una oración compuesta?", options: ["Solo una", "Dos o más", "Ninguna", "Tres únicamente"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p5", topicId: 27, prompt: "¿Cuál conjunción de FANBOYS indica contraste?", options: ["And", "Or", "But", "For"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_27_p6", topicId: 27, prompt: "'I wanted coffee, yet I ordered tea.' ¿Qué conjunción se usó?", options: ["Or", "Yet", "Nor", "So"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p7", topicId: 27, prompt: "¿Cómo se escribe correctamente una oración compuesta con conjunción coordinante?", options: ["Cláusula + cláusula", "Cláusula, + conjunción + cláusula", "Conjunción + cláusula", "Cláusula + punto + cláusula"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p8", topicId: 27, prompt: "'Neither Sam nor Lisa came to the party.' ¿Qué conjunción se usa?", options: ["But", "Or", "Nor", "And"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_27_p9", topicId: 27, prompt: "La conjunción 'for' en FANBOYS equivale en español a:", options: ["Para", "Porque/pues (da razón)", "Y también", "Pero"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_27_p10", topicId: 27, prompt: "¿Cuál oración usa correctamente la conjunción 'and'?", options: ["I like pizza, and.", "I like pizza and pasta.", "And I like pizza.", "I like, and pizza."], correctIndex: 1)
    ],

    28: [
        MathExamQuestion(id: "es_teach_28_p1", topicId: 28, prompt: "¿Cuál de estas oraciones está en voz pasiva en inglés?", options: ["The cat chased the mouse.", "The mouse was chased by the cat.", "The cat is running.", "The mouse runs fast."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_28_p2", topicId: 28, prompt: "En voz activa, el sujeto de la oración:", options: ["Recibe la acción", "Realiza la acción", "Describe la acción", "Ignora la acción"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_28_p3", topicId: 28, prompt: "¿Cuál es la forma pasiva de 'The teacher corrects the test'?", options: ["The test corrects the teacher.", "The test is corrected by the teacher.", "The teacher is correcting.", "Tests are teachers."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_28_p4", topicId: 28, prompt: "La voz pasiva en inglés se forma con:", options: ["Do/Does + verbo", "Have + participio pasado", "To be + participio pasado", "Will + verbo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_28_p5", topicId: 28, prompt: "'The cake was eaten by the children.' ¿Quién realizó la acción?", options: ["El pastel", "La madre", "Los niños", "Nadie"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_28_p6", topicId: 28, prompt: "¿Cuándo se prefiere la voz pasiva en inglés?", options: ["Cuando el actor es más importante", "Cuando el actor es desconocido o no importante", "Siempre es mejor", "Nunca se usa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_28_p7", topicId: 28, prompt: "¿Cuál de estas está en voz activa?", options: ["The window was broken.", "The letter was written.", "She wrote the letter.", "The game was played."], correctIndex: 2),
        MathExamQuestion(id: "es_teach_28_p8", topicId: 28, prompt: "Convierte a voz activa: 'The book was read by Maria.'", options: ["Maria reads books.", "Maria read the book.", "The book reads Maria.", "Books are read."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_28_p9", topicId: 28, prompt: "En 'The homework was forgotten', ¿a quién se menciona como actor?", options: ["Al maestro", "Al estudiante", "A nadie (actor no mencionado)", "A los padres"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_28_p10", topicId: 28, prompt: "¿Cuál tiempo verbal de 'to be' se usa en 'The song is sung by the choir'?", options: ["Was", "Were", "Is", "Been"], correctIndex: 2)
    ],

    29: [
        MathExamQuestion(id: "es_teach_29_p1", topicId: 29, prompt: "¿Qué es una tesis ('thesis statement') en escritura persuasiva en inglés?", options: ["Una pregunta al lector", "La oración principal que expresa la posición del autor", "Una lista de ejemplos", "La conclusión del ensayo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_29_p2", topicId: 29, prompt: "El 'pathos' en retórica inglesa se refiere a:", options: ["Usar lógica y datos", "Usar las emociones del lector", "Usar la credibilidad del autor", "Usar citas famosas"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_29_p3", topicId: 29, prompt: "El 'logos' en argumentación inglesa se basa en:", options: ["Emociones", "Credibilidad personal", "Lógica, datos y evidencia", "Opiniones personales"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_29_p4", topicId: 29, prompt: "¿Qué es el 'ethos' en escritura persuasiva?", options: ["Apelación a las emociones", "Apelación a la lógica", "Apelación a la credibilidad y autoridad del autor", "Apelación al entretenimiento"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_29_p5", topicId: 29, prompt: "¿Qué elemento persuasivo pide al lector que haga algo?", options: ["Thesis statement", "Evidence", "Call to action", "Hook"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_29_p6", topicId: 29, prompt: "Una buena evidencia en escritura persuasiva incluye:", options: ["Solo opiniones", "Estadísticas, hechos y ejemplos concretos", "Solo anécdotas personales", "Preguntas sin respuesta"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_29_p7", topicId: 29, prompt: "¿Cuál es el propósito de la escritura persuasiva?", options: ["Entretener al lector", "Informar sin tomar posición", "Convencer al lector de adoptar una posición", "Describir un lugar"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_29_p8", topicId: 29, prompt: "El 'hook' al inicio de un ensayo persuasivo sirve para:", options: ["Presentar la evidencia", "Captar la atención del lector", "Escribir la conclusión", "Definir palabras clave"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_29_p9", topicId: 29, prompt: "¿Qué significa 'counterargument' en escritura persuasiva?", options: ["El argumento principal", "La evidencia más fuerte", "El argumento del lado opuesto que se reconoce y refuta", "La conclusión"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_29_p10", topicId: 29, prompt: "Un ensayo persuasivo bien organizado incluye:", options: ["Solo la opinión del autor", "Introducción, argumentos con evidencia, contraargumento y conclusión", "Solo ejemplos", "Una historia larga"], correctIndex: 1)
    ],

    30: [
        MathExamQuestion(id: "es_teach_30_p1", topicId: 30, prompt: "¿Qué es el 'foreshadowing' en literatura inglesa?", options: ["Un tipo de metáfora", "Pistas que anticipan eventos futuros en la historia", "El tema principal", "El clímax de la historia"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p2", topicId: 30, prompt: "La ironía verbal ocurre cuando:", options: ["Los eventos resultan opuestos a lo esperado", "El personaje dice lo opuesto de lo que realmente quiere decir", "El lector sabe algo que el personaje no sabe", "Hay una coincidencia trágica"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p3", topicId: 30, prompt: "La ironía situacional ocurre cuando:", options: ["Un personaje dice lo contrario de lo que piensa", "El resultado es lo opuesto de lo que se esperaba", "El lector sabe más que el personaje", "El narrador miente"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p4", topicId: 30, prompt: "¿Qué es un símbolo ('symbol') en literatura inglesa?", options: ["Un tipo de personaje", "Un objeto o imagen que representa una idea más profunda", "Un tipo de rima", "Una estructura narrativa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p5", topicId: 30, prompt: "¿Qué es el tema ('theme') de una obra literaria?", options: ["El título del libro", "El mensaje universal o la idea central de la obra", "El nombre del autor", "El lugar donde ocurre la historia"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p6", topicId: 30, prompt: "Un 'motif' en literatura es:", options: ["El clímax de la historia", "Un elemento recurrente que tiene significado simbólico", "El tipo de narrador", "El género literario"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p7", topicId: 30, prompt: "Si una historia sobre la guerra tiene flores rojas en cada escena trágica, las flores son:", options: ["Foreshadowing", "Un motif", "Ironía verbal", "Voz pasiva"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_30_p8", topicId: 30, prompt: "En la ironía dramática, ¿quién sabe más?", options: ["El personaje principal", "El antagonista", "El lector/audiencia", "El narrador"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_30_p9", topicId: 30, prompt: "¿Cuál de estos es un tema común ('theme') en literatura inglesa?", options: ["El nombre del protagonista", "El año de publicación", "Good vs. evil / El bien contra el mal", "El número de páginas"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_30_p10", topicId: 30, prompt: "El 'foreshadowing' se diferencia del 'flashback' en que:", options: ["Son iguales", "El foreshadowing mira al futuro; el flashback mira al pasado", "El flashback mira al futuro", "El foreshadowing mira al pasado"], correctIndex: 1)
    ],

    31: [
        MathExamQuestion(id: "es_teach_31_p1", topicId: 31, prompt: "¿Cuáles son los tres propósitos principales de un autor en inglés?", options: ["Leer, escribir, hablar", "Informar, persuadir, entretener", "Describir, narrar, argumentar", "Comparar, contrastar, analizar"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_31_p2", topicId: 31, prompt: "Un artículo de periódico sobre un terremoto probablemente tiene como propósito:", options: ["Entretener", "Persuadir", "Informar", "Poetizar"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_31_p3", topicId: 31, prompt: "Un anuncio publicitario en inglés tiene principalmente el propósito de:", options: ["Informar objetivamente", "Entretener con humor", "Persuadir al lector de comprar algo", "Narrar una historia"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_31_p4", topicId: 31, prompt: "¿Qué es el sesgo ('bias') en un texto?", options: ["Una perspectiva equilibrada", "Una preferencia o inclinación que afecta la objetividad del autor", "Un tipo de estructura textual", "Un recurso literario"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_31_p5", topicId: 31, prompt: "Una novela de aventuras tiene principalmente el propósito de:", options: ["Informar sobre datos históricos", "Persuadir sobre un tema político", "Entretener al lector", "Enseñar gramática"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_31_p6", topicId: 31, prompt: "¿Cómo puedes identificar el propósito de un autor?", options: ["Por el número de páginas", "Por el tipo de lenguaje, tono y contenido", "Por el tamaño de la letra", "Por el color de la portada"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_31_p7", topicId: 31, prompt: "Un texto que solo presenta un lado de un argumento puede mostrar:", options: ["Objetividad", "Sesgo del autor", "Estructura de secuencia", "Voz pasiva"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_31_p8", topicId: 31, prompt: "¿Cuál texto tiene más probabilidad de ser objetivo (sin sesgo)?", options: ["Un editorial de opinión", "Una enciclopedia", "Un anuncio de campaña", "Un poema político"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_31_p9", topicId: 31, prompt: "'You should definitely buy this product  -  it changed my life!' El propósito es:", options: ["Informar", "Entretener", "Persuadir", "Describir"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_31_p10", topicId: 31, prompt: "La perspectiva del autor se refiere a:", options: ["El año en que escribió", "Su punto de vista y actitud hacia el tema", "El formato del texto", "El número de argumentos"], correctIndex: 1)
    ],

    32: [
        MathExamQuestion(id: "es_teach_32_p1", topicId: 32, prompt: "¿Qué es parafrasear en inglés?", options: ["Copiar exactamente lo que dice el autor", "Expresar la idea del autor con tus propias palabras", "Inventar información nueva", "Citar con comillas"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p2", topicId: 32, prompt: "¿Cuándo se usan comillas ('quotes') en investigación?", options: ["Siempre que escribes", "Cuando copias exactamente las palabras de una fuente", "Cuando parafraseas", "Nunca en trabajos académicos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p3", topicId: 32, prompt: "¿Qué es el plagio en investigación?", options: ["Citar correctamente las fuentes", "Parafrasear con atribución", "Usar las ideas o palabras de otro sin dar crédito", "Escribir tu opinión"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_32_p4", topicId: 32, prompt: "En formato MLA, ¿cómo se inicia una entrada de bibliografía?", options: ["Con el título del libro", "Con el apellido del autor", "Con el año de publicación", "Con el nombre de la editorial"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p5", topicId: 32, prompt: "¿Qué significa MLA en investigación en inglés?", options: ["Modern Language Association", "Multiple Learning Approaches", "Main Literary Analysis", "Manuscript Layout Authority"], correctIndex: 0),
        MathExamQuestion(id: "es_teach_32_p6", topicId: 32, prompt: "Una cita directa ('direct quote') en inglés requiere:", options: ["Solo el nombre del autor", "Comillas y referencia a la fuente", "Solo el número de página", "Solo el año"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p7", topicId: 32, prompt: "¿Por qué es importante citar las fuentes?", options: ["Para hacer el trabajo más largo", "Para dar crédito a los autores y evitar el plagio", "Para impresionar al maestro", "Para usar más vocabulario"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p8", topicId: 32, prompt: "Una paráfrasis efectiva debe:", options: ["Copiar la estructura de la oración original", "Cambiar las palabras Y la estructura manteniendo el significado", "Usar exactamente las mismas palabras", "Cambiar solo una palabra"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p9", topicId: 32, prompt: "En MLA, ¿cómo se cita brevemente dentro del texto?", options: ["Solo con el título", "Con el apellido del autor y número de página entre paréntesis", "Con la fecha de publicación", "Con el nombre completo del autor"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_32_p10", topicId: 32, prompt: "¿Cuál de estas acciones es plagio?", options: ["Parafrasear y citar la fuente", "Citar directamente con comillas", "Copiar un párrafo sin mencionar al autor", "Usar tus propias ideas"], correctIndex: 2)
    ],

    33: [
        MathExamQuestion(id: "es_teach_33_p1", topicId: 33, prompt: "¿Cuántas sílabas tiene el pentámetro yámbico ('iambic pentameter')?", options: ["8", "10", "12", "14"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p2", topicId: 33, prompt: "¿Qué es un soliloquio en teatro inglés?", options: ["Un diálogo entre dos personajes", "Una canción del coro", "Un discurso largo de un personaje solo en el escenario", "Una descripción del narrador"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_33_p3", topicId: 33, prompt: "¿Cuál es la diferencia entre una tragedia y una comedia de Shakespeare?", options: ["La tragedia es más corta", "La tragedia termina en muerte o desastre; la comedia termina felizmente", "La comedia usa más personajes", "No hay diferencia"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p4", topicId: 33, prompt: "¿Cuántas líneas tiene un soneto shakespeariano?", options: ["12", "14", "16", "18"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p5", topicId: 33, prompt: "Un yambo ('iamb') es una unidad de dos sílabas con patrón:", options: ["Acentuada-no acentuada", "No acentuada-acentuada", "Acentuada-acentuada", "No acentuada-no acentuada"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p6", topicId: 33, prompt: "'Romeo and Juliet' es una tragedia porque:", options: ["Tiene muchos chistes", "Termina con la muerte de los protagonistas", "Es una historia de amor feliz", "Tiene finales múltiples"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p7", topicId: 33, prompt: "¿En qué idioma escribió Shakespeare?", options: ["Inglés moderno", "Inglés antiguo (Old English)", "Inglés isabelino/moderno temprano (Early Modern English)", "Francés"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_33_p8", topicId: 33, prompt: "¿Qué es un aparte ('aside') en teatro?", options: ["Una escena de acción", "Palabras que un personaje dice al público sin que los otros personajes escuchen", "Un soliloquio largo", "Una canción"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p9", topicId: 33, prompt: "El soneto shakespeariano termina con:", options: ["Dos estrofas de 7 líneas", "Tres cuartetos y un pareado (couplet)", "Una sola estrofa larga", "Cuatro tercetos"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_33_p10", topicId: 33, prompt: "'A Midsummer Night's Dream' es un ejemplo de:", options: ["Tragedia", "Historia (history play)", "Comedia", "Soneto"], correctIndex: 2)
    ],

    34: [
        MathExamQuestion(id: "es_teach_34_p1", topicId: 34, prompt: "La raíz latina 'bio' significa:", options: ["Tierra", "Agua", "Vida", "Cielo"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_34_p2", topicId: 34, prompt: "¿Qué significa la raíz griega 'geo'?", options: ["Tiempo", "Tierra", "Agua", "Fuego"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_34_p3", topicId: 34, prompt: "La raíz 'port' en inglés (como en 'transport', 'portable') significa:", options: ["Decir", "Escribir", "Llevar/transportar", "Ver"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_34_p4", topicId: 34, prompt: "La raíz 'dict' (como en 'dictionary', 'predict') significa:", options: ["Escribir", "Decir", "Pensar", "Correr"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_34_p5", topicId: 34, prompt: "La raíz 'scrib/script' (como en 'describe', 'manuscript') significa:", options: ["Leer", "Hablar", "Escribir", "Dibujar"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_34_p6", topicId: 34, prompt: "¿Qué significa la raíz 'aqua' en inglés?", options: ["Fuego", "Tierra", "Agua", "Aire"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_34_p7", topicId: 34, prompt: "Si 'tele' significa 'lejos', ¿qué significa 'telescope'?", options: ["Un instrumento para escuchar cerca", "Un instrumento para ver lejos", "Un instrumento para escribir", "Un instrumento para hablar"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_34_p8", topicId: 34, prompt: "La raíz 'aud' (como en 'audio', 'audience') significa:", options: ["Ver", "Hablar", "Escuchar", "Tocar"], correctIndex: 2),
        MathExamQuestion(id: "es_teach_34_p9", topicId: 34, prompt: "Conocer las raíces de las palabras ayuda a:", options: ["Escribir más rápido", "Adivinar el significado de palabras desconocidas", "Memorizar ortografía", "Hablar más fuerte"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_34_p10", topicId: 34, prompt: "La raíz 'graph' (como en 'photograph', 'paragraph') significa:", options: ["Hablar", "Escuchar", "Escribir/dibujar/registrar", "Correr"], correctIndex: 2)
    ],

    35: [
        MathExamQuestion(id: "es_teach_35_p1", topicId: 35, prompt: "¿Cuándo se usa el punto y coma (;) en inglés?", options: ["Para separar elementos de una lista simple", "Para unir dos cláusulas independientes relacionadas", "Al final de una pregunta", "Antes de una conjunción coordinante"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p2", topicId: 35, prompt: "¿Cuándo se usan los dos puntos (:) en inglés?", options: ["Para separar dos oraciones no relacionadas", "Para introducir una lista, explicación o cita", "En lugar de la coma", "Al final de un párrafo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p3", topicId: 35, prompt: "¿Cuál es el uso del guion largo (em dash  - ) en inglés?", options: ["Dividir palabras al final de línea", "Dar énfasis, indicar una pausa dramática o agregar información", "Unir palabras compuestas", "Indicar un diálogo"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p4", topicId: 35, prompt: "¿Qué es la estructura paralela en inglés?", options: ["Usar el mismo tiempo verbal siempre", "Usar la misma forma gramatical para elementos coordinados", "Escribir oraciones del mismo largo", "Usar solo oraciones simples"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p5", topicId: 35, prompt: "¿Cuál oración usa estructura paralela correctamente?", options: ["She likes swimming, to run, and dance.", "She likes swimming, running, and dancing.", "She likes swim, running, and to dance.", "She likes to swim, runs, and dancing."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p6", topicId: 35, prompt: "Un 'dangling modifier' en inglés es:", options: ["Un adjetivo bien colocado", "Un modificador que no está claramente conectado a lo que modifica", "Un adverbio al final de la oración", "Una cláusula relativa"], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p7", topicId: 35, prompt: "¿Cuál de estas oraciones tiene un 'dangling modifier'?", options: ["Running fast, she won the race.", "Running fast, the race was won.", "She ran fast and won.", "The fast runner won."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p8", topicId: 35, prompt: "¿Cuál oración usa los dos puntos correctamente?", options: ["I need: to go now.", "She has three pets: a cat, a dog, and a fish.", "He said: hello.", "They: went to the store."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p9", topicId: 35, prompt: "¿Cuál oración usa el punto y coma correctamente?", options: ["I love dogs; because they're loyal.", "I love dogs; they are loyal companions.", "I love dogs; and cats.", "I love dogs; running."], correctIndex: 1),
        MathExamQuestion(id: "es_teach_35_p10", topicId: 35, prompt: "En 'She is talented  -  no doubt about it', el em dash sirve para:", options: ["Listar elementos", "Dar énfasis a la afirmación", "Introducir una pregunta", "Separar párrafos"], correctIndex: 1)
    ]
]

// MARK: - Exam Questions (10 per topic)

let esTeachingExamB: [Int: [MathExamQuestion]] = [

    19: [
        MathExamQuestion(id: "es_exam_19_e1", topicId: 19, prompt: "¿Cuál es el sujeto en 'The young scientist discovered a new element'?", options: ["discovered", "a new element", "The young scientist", "new element"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_19_e2", topicId: 19, prompt: "¿Cuál es el predicado en 'All the students passed the exam'?", options: ["All the students", "passed the exam", "the exam", "All"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_19_e3", topicId: 19, prompt: "Identifica el sujeto: 'My two older brothers play basketball every weekend.'", options: ["play basketball", "every weekend", "basketball", "My two older brothers"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_19_e4", topicId: 19, prompt: "¿Cuál de estas opciones contiene solo el predicado de 'The blue bird sang a beautiful song'?", options: ["The blue bird", "blue bird", "sang a beautiful song", "a beautiful song"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_19_e5", topicId: 19, prompt: "¿Qué es el sujeto compuesto en inglés?", options: ["Un sujeto con un verbo compuesto", "Un sujeto formado por dos o más sustantivos o pronombres", "Una oración sin predicado", "Un sujeto muy largo"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_19_e6", topicId: 19, prompt: "En 'Tom and Sarah went to the library', el sujeto compuesto es:", options: ["went to the library", "the library", "Tom and Sarah", "Sarah"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_19_e7", topicId: 19, prompt: "¿Cuál de estas es una oración completa con sujeto y predicado?", options: ["Running in the park.", "The happy dog.", "She laughed.", "Beautiful flowers."], correctIndex: 2),
        MathExamQuestion(id: "es_exam_19_e8", topicId: 19, prompt: "En la oración 'After school, the children play outside', ¿cuál es el sujeto?", options: ["After school", "play outside", "outside", "the children"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_19_e9", topicId: 19, prompt: "¿Cuál es el predicado en 'The enormous elephant drank from the river'?", options: ["The enormous elephant", "enormous", "from the river", "drank from the river"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_19_e10", topicId: 19, prompt: "El sujeto de una oración siempre incluye:", options: ["Un verbo", "El sustantivo o pronombre principal sobre quien trata la oración", "Un adverbio", "Una preposición"], correctIndex: 1)
    ],

    20: [
        MathExamQuestion(id: "es_exam_20_e1", topicId: 20, prompt: "'The classroom was a zoo during lunch.' ¿Qué figura retórica es?", options: ["Símil", "Metáfora", "Personificación", "Hipérbole"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_20_e2", topicId: 20, prompt: "'The trees whispered secrets to each other.' ¿Qué figura es?", options: ["Hipérbole", "Metáfora", "Símil", "Personificación"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_20_e3", topicId: 20, prompt: "'He ran as fast as lightning.' ¿Qué figura retórica es?", options: ["Metáfora", "Hipérbole", "Símil", "Personificación"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_20_e4", topicId: 20, prompt: "'I've been waiting forever!' ¿Qué figura retórica es?", options: ["Símil", "Metáfora", "Personificación", "Hipérbole"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_20_e5", topicId: 20, prompt: "¿Cuál usa 'like' o 'as' para comparar?", options: ["Metáfora", "Personificación", "Símil", "Hipérbole"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_20_e6", topicId: 20, prompt: "'Her voice is music to my ears.' ¿Qué figura retórica es?", options: ["Hipérbole", "Símil", "Personificación", "Metáfora"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_20_e7", topicId: 20, prompt: "¿Cuál figura NO usa lenguaje literal?", options: ["Lenguaje denotativo", "Lenguaje científico", "Lenguaje figurado", "Lenguaje técnico"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_20_e8", topicId: 20, prompt: "'The wind howled angrily through the night.' La figura retórica es:", options: ["Símil", "Hipérbole", "Metáfora", "Personificación"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_20_e9", topicId: 20, prompt: "'She is as sweet as honey.' ¿Cuál es la figura?", options: ["Metáfora", "Hipérbole", "Símil", "Personificación"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_20_e10", topicId: 20, prompt: "El lenguaje figurado se usa principalmente para:", options: ["Dar instrucciones claras", "Crear imágenes vívidas y expresar ideas de forma más poética", "Escribir definiciones", "Listar datos"], correctIndex: 1)
    ],

    21: [
        MathExamQuestion(id: "es_exam_21_e1", topicId: 21, prompt: "En 'The audacious knight  -  bold and fearless  -  charged into battle', 'audacious' significa:", options: ["Cobarde", "Atrevido/audaz", "Cansado", "Anciano"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_21_e2", topicId: 21, prompt: "¿Qué tipo de pista de contexto da un ejemplo de la palabra?", options: ["Definición directa", "Antónimo", "Ejemplo", "Experiencia personal"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_21_e3", topicId: 21, prompt: "En 'She felt melancholy  -  not sad, but deeply thoughtful and wistful', 'melancholy' es similar a:", options: ["Alegre", "Enojada", "Pensativa y nostálgica", "Emocionada"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_21_e4", topicId: 21, prompt: "Las palabras 'however', 'but', 'unlike' señalan una pista de:", options: ["Definición", "Ejemplo", "Contraste/antónimo", "Reafirmación"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_21_e5", topicId: 21, prompt: "En 'The verbose speaker talked so much that everyone fell asleep', 'verbose' significa:", options: ["Aburrido", "Que habla demasiado", "Silencioso", "Inteligente"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_21_e6", topicId: 21, prompt: "La estrategia de usar el contexto para entender palabras nuevas se llama:", options: ["Análisis fonético", "Inferencia de vocabulario por contexto", "Memorización", "Traducción literal"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_21_e7", topicId: 21, prompt: "En 'Unlike the arid desert, the rainforest receives plenty of water', 'arid' significa:", options: ["Húmedo", "Seco", "Verde", "Frío"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_21_e8", topicId: 21, prompt: "¿Cuál frase señala que viene una reformulación o definición?", options: ["On the contrary", "In other words / that is", "However", "As a result"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_21_e9", topicId: 21, prompt: "En 'She was meticulous about her work, checking every detail twice', 'meticulous' significa:", options: ["Descuidada", "Rápida", "Muy cuidadosa y detallista", "Creativa"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_21_e10", topicId: 21, prompt: "¿Cuándo es más útil usar pistas de contexto?", options: ["Cuando conoces la palabra perfectamente", "Cuando encuentras una palabra desconocida en un texto", "Cuando escribes tu opinión", "Cuando memorizas vocabulario"], correctIndex: 1)
    ],

    22: [
        MathExamQuestion(id: "es_exam_22_e1", topicId: 22, prompt: "Lee: 'Wolves are social animals. They live in packs. Each pack has a leader.' La idea principal es:", options: ["Los lobos son peligrosos.", "Los lobos son animales sociales.", "Los lobos tienen líderes fuertes.", "Los lobos viven en el bosque."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e2", topicId: 22, prompt: "¿Cuál de estas oraciones es un detalle de apoyo, NO una idea principal?", options: ["Exercise has many health benefits.", "Exercise improves mental health.", "Dogs are great companions.", "Reading develops critical thinking."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e3", topicId: 22, prompt: "¿Dónde suele estar la oración temática (topic sentence) en un párrafo bien estructurado?", options: ["Solo en el medio", "Solo al final", "Usualmente al principio", "Nunca se menciona directamente"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_22_e4", topicId: 22, prompt: "Lee: 'Bees make honey. They pollinate flowers. They live in colonies. Bees are essential to our ecosystem.' La idea principal es:", options: ["Las abejas hacen miel.", "Las abejas son esenciales para el ecosistema.", "Las abejas viven en colonias.", "Las abejas polinizan flores."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e5", topicId: 22, prompt: "¿Qué hace que una oración temática sea efectiva?", options: ["Ser muy larga y detallada", "Ser vaga e imprecisa", "Expresar claramente la idea central del párrafo", "Comenzar con 'I think'"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_22_e6", topicId: 22, prompt: "Una idea principal implícita requiere que el lector:", options: ["La encuentre en el primer párrafo", "La deduzca de los detalles", "La busque en el diccionario", "La ignore"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e7", topicId: 22, prompt: "¿Cuántos detalles de apoyo suele tener un párrafo bien desarrollado?", options: ["Solo uno", "Ninguno", "Varios (generalmente 2-5)", "Todos los que el autor quiera sin límite"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_22_e8", topicId: 22, prompt: "El 'tema' de un texto es diferente de la 'idea principal' porque:", options: ["Son exactamente lo mismo", "El tema es una palabra/frase breve; la idea principal es una afirmación completa", "La idea principal es más vaga", "El tema siempre está al final"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e9", topicId: 22, prompt: "Lee: 'The library offers free books, internet access, and study rooms.' ¿Qué tipo de oración es esta?", options: ["Idea principal", "Detalle de apoyo", "Conclusión", "Oración de transición"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_22_e10", topicId: 22, prompt: "¿Cuál de estas es la idea principal más fuerte sobre el reciclaje?", options: ["People recycle.", "Recycling reduces waste.", "Some cans are recyclable.", "Recycling is a habit practiced worldwide that significantly benefits the environment."], correctIndex: 3)
    ],

    23: [
        MathExamQuestion(id: "es_exam_23_e1", topicId: 23, prompt: "'We hiked through the mountains and felt free.' ¿En qué punto de vista está?", options: ["Segunda persona", "Tercera persona", "Primera persona plural", "Primera persona singular"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_23_e2", topicId: 23, prompt: "¿Cuál narrador puede conocer los pensamientos de TODOS los personajes?", options: ["Primera persona", "Segunda persona", "Tercera persona limitada", "Tercera persona omnisciente"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_23_e3", topicId: 23, prompt: "'Imagine you are standing at the edge of the world.' ¿En qué punto de vista está?", options: ["Primera persona", "Segunda persona", "Tercera persona", "Tercera omnisciente"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_23_e4", topicId: 23, prompt: "¿Cuál limitación tiene el narrador en primera persona?", options: ["No puede describir el ambiente", "Solo conoce sus propios pensamientos y experiencias", "No puede hablar con otros personajes", "Debe ser el protagonista siempre"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_23_e5", topicId: 23, prompt: "'He stared at the stars, wondering what lay beyond.' ¿Qué punto de vista es?", options: ["Primera persona", "Segunda persona", "Tercera persona", "Cuarta persona"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_23_e6", topicId: 23, prompt: "Un narrador en tercera persona limitada:", options: ["Conoce todos los pensamientos", "Solo conoce los pensamientos de un personaje", "Es un personaje de la historia", "Habla directamente al lector"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_23_e7", topicId: 23, prompt: "¿Por qué los autores eligen la segunda persona ('you')?", options: ["Es el punto de vista más común", "Para crear distancia emocional", "Para hacer al lector parte de la historia", "Porque es más fácil de escribir"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_23_e8", topicId: 23, prompt: "Identifica el punto de vista: 'I couldn't believe what I was seeing  -  a real dragon!'", options: ["Segunda persona", "Tercera persona omnisciente", "Primera persona", "Tercera persona limitada"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_23_e9", topicId: 23, prompt: "¿Cuál pronombre de tercera persona singular neutro se usa en inglés moderno para personas?", options: ["He", "She", "They", "It"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_23_e10", topicId: 23, prompt: "Cambiar el punto de vista de una historia afecta principalmente:", options: ["La longitud del texto", "La perspectiva y la información que el lector recibe", "El vocabulario usado", "El número de personajes"], correctIndex: 1)
    ],

    24: [
        MathExamQuestion(id: "es_exam_24_e1", topicId: 24, prompt: "'First, mix the flour. Next, add eggs. Then, bake for 30 minutes.' ¿Qué estructura es?", options: ["Causa/efecto", "Compare/contrast", "Sequence", "Problem/solution"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e2", topicId: 24, prompt: "'Many students struggle with math anxiety. Teachers can help by making lessons fun.' ¿Qué estructura es?", options: ["Secuencia", "Descripción", "Compare/contrast", "Problem/solution"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_24_e3", topicId: 24, prompt: "'The forest is lush and green, full of towering trees and colorful birds.' ¿Qué estructura es?", options: ["Secuencia", "Causa/efecto", "Description", "Problem/solution"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e4", topicId: 24, prompt: "'Because of heavy rain, the river flooded, damaging many homes.' ¿Qué estructura es?", options: ["Description", "Sequence", "Compare/contrast", "Cause/effect"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_24_e5", topicId: 24, prompt: "¿Cuál señal textual indica compare/contrast?", options: ["First, then, finally", "Because, therefore, as a result", "Similarly, both, on the other hand", "For example, such as"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e6", topicId: 24, prompt: "'Cats are independent, while dogs need more attention.' ¿Qué estructura es?", options: ["Sequence", "Cause/effect", "Compare/contrast", "Description"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e7", topicId: 24, prompt: "Identificar la estructura textual ayuda al lector a:", options: ["Escribir más rápido", "Entender cómo está organizada la información", "Memorizar el texto", "Encontrar el título"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_24_e8", topicId: 24, prompt: "'As a result of deforestation, many animals lost their habitat.' ¿Qué estructura es?", options: ["Compare/contrast", "Description", "Cause/effect", "Sequence"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e9", topicId: 24, prompt: "¿Cuál texto usa estructura de descripción?", options: ["First the eggs hatched, then they grew.", "The volcano erupted, causing fires.", "The ancient temple has tall stone pillars and carved walls.", "Cats sleep more than dogs."], correctIndex: 2),
        MathExamQuestion(id: "es_exam_24_e10", topicId: 24, prompt: "La estructura problem/solution es común en textos:", options: ["Narrativos de ficción", "Poéticos", "Expositivos e informativos", "Dramáticos teatrales"], correctIndex: 2)
    ],

    25: [
        MathExamQuestion(id: "es_exam_25_e1", topicId: 25, prompt: "¿En qué parte del arco narrativo se introduce el conflicto principal?", options: ["Resolution", "Climax", "Rising action", "Exposition"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_25_e2", topicId: 25, prompt: "¿Cuál es el propósito de la exposición ('exposition') en una narrativa?", options: ["Resolver el conflicto", "Presentar personajes, ambiente y situación inicial", "Crear el clímax", "Cerrar la historia"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_25_e3", topicId: 25, prompt: "¿Cómo se escribe correctamente el diálogo con tag después?", options: ["\"Hello\" she said.", "\"Hello,\" she said.", "\"Hello.\" She said.", "\"Hello\", she said."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_25_e4", topicId: 25, prompt: "El lenguaje sensorial en narrativa incluye descripciones de:", options: ["Solo lo visual", "Solo sonidos", "Los cinco sentidos: vista, oído, olfato, tacto, gusto", "Solo los hechos"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_25_e5", topicId: 25, prompt: "¿Qué sigue después del climax en el arco narrativo?", options: ["Exposition", "Rising action", "Falling action", "Conflict"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_25_e6", topicId: 25, prompt: "Un conflicto persona vs. naturaleza en inglés ('person vs. nature') sería:", options: ["Un estudiante pelea con su amigo", "Un personaje lucha contra sus miedos internos", "Un explorador sobrevive una tormenta en el mar", "Un héroe enfrenta al villano"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_25_e7", topicId: 25, prompt: "¿Cuál detalle hace más vívida una descripción narrativa?", options: ["'The house was big.'", "'The old house creaked with every step on its worn floorboards.'", "'There was a house.'", "'The house existed.'"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_25_e8", topicId: 25, prompt: "El 'setting' de una narrativa se refiere a:", options: ["Los personajes principales", "El conflicto principal", "El tiempo y lugar donde ocurre la historia", "El narrador de la historia"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_25_e9", topicId: 25, prompt: "¿Qué verbo de diálogo es más descriptivo que 'said' en inglés?", options: ["Talked", "Whispered", "Spoke", "Told"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_25_e10", topicId: 25, prompt: "Un buen final narrativo ('resolution') debe:", options: ["Crear un conflicto nuevo", "Resolver el conflicto de forma satisfactoria", "Presentar nuevos personajes", "Repetir la introducción"], correctIndex: 1)
    ],

    26: [
        MathExamQuestion(id: "es_exam_26_e1", topicId: 26, prompt: "¿Cuál poema tiene rima AABB?", options: ["I wandered lonely as a cloud / That floats on high o'er vales and hills", "Roses are red / Violets are blue / Sugar is sweet / And so are you", "Shall I compare thee to a summer's day?", "Two roads diverged in a yellow wood"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e2", topicId: 26, prompt: "¿Cuántas estrofas tiene normalmente un soneto shakespeariano?", options: ["2 (dos octavas)", "3 cuartetos + 1 pareado", "4 cuartetos", "1 estrofa larga"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e3", topicId: 26, prompt: "'Sally sells seashells by the seashore.' Es un ejemplo de:", options: ["Asonancia", "Rima perfecta", "Aliteración", "Métrica yámbica"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_26_e4", topicId: 26, prompt: "La asonancia en 'the rain in Spain stays mainly' está en:", options: ["Los sonidos r y s", "El sonido vocálico 'ai'", "Las palabras al final", "El ritmo general"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e5", topicId: 26, prompt: "¿Qué tipo de poema NO tiene rima ni métrica fija?", options: ["Soneto", "Haiku", "Free verse", "Limericks"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_26_e6", topicId: 26, prompt: "¿Cuántas líneas tiene un haiku en inglés?", options: ["4", "3", "5", "7"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e7", topicId: 26, prompt: "El esquema de rima ABAB significa que:", options: ["Las líneas 1 y 2 riman", "Las líneas 1 y 3 riman; las 2 y 4 riman", "Todas riman con la primera", "Ninguna rima"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e8", topicId: 26, prompt: "¿Qué recurso poético repite sonidos vocálicos como en 'sweet dreams of thee'?", options: ["Aliteración", "Rima perfecta", "Asonancia", "Onomatopeya"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_26_e9", topicId: 26, prompt: "Un 'couplet' en poesía inglesa es:", options: ["Una estrofa de cuatro líneas", "Un par de líneas que riman", "Un poema completo de dos líneas", "Una estrofa sin rima"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_26_e10", topicId: 26, prompt: "¿Cuál de estas palabras rima con 'moon' en inglés?", options: ["Mon", "Mine", "Tune", "Man"], correctIndex: 2)
    ],

    27: [
        MathExamQuestion(id: "es_exam_27_e1", topicId: 27, prompt: "¿Cuál conjunción de FANBOYS indica una alternativa?", options: ["And", "But", "Or", "So"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_27_e2", topicId: 27, prompt: "¿Cuál oración compuesta está correctamente puntuada?", options: ["I wanted to go but she stayed home.", "I wanted to go, but she stayed home.", "I wanted to go but, she stayed home.", "I wanted to go. but she stayed home."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_27_e3", topicId: 27, prompt: "'He studied hard, for he wanted to pass.' ¿Qué conjunción se usó y qué significa?", options: ["For  -  y también", "For  -  porque/pues", "For  -  pero", "For  -  o"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_27_e4", topicId: 27, prompt: "¿Cuál de estas NO es una conjunción coordinante (FANBOYS)?", options: ["And", "But", "Because", "So"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_27_e5", topicId: 27, prompt: "Completa: 'She was nervous, ___ she took a deep breath and smiled.'", options: ["for", "nor", "yet", "so"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_27_e6", topicId: 27, prompt: "'Neither the teacher nor the students knew the answer.' ¿Qué conjunción se usó?", options: ["And", "But", "Nor", "Or"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_27_e7", topicId: 27, prompt: "La coma antes de una conjunción coordinante en una oración compuesta se llama:", options: ["Oxford comma", "Serial comma", "Coordinating comma", "Em dash"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_27_e8", topicId: 27, prompt: "¿Cuál conjunción agregarías para unir? 'It was raining. We went to the beach.'", options: ["But", "Or", "Yet", "Nor"], correctIndex: 0),
        MathExamQuestion(id: "es_exam_27_e9", topicId: 27, prompt: "¿Cuántas conjunciones tiene FANBOYS?", options: ["5", "6", "7", "8"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_27_e10", topicId: 27, prompt: "¿Cuál es la diferencia entre 'or' y 'nor' en inglés?", options: ["Son idénticas", "'Or' es positivo (alternativa); 'nor' se usa en contextos negativos", "'Nor' es más formal siempre", "'Or' solo se usa en preguntas"], correctIndex: 1)
    ],

    28: [
        MathExamQuestion(id: "es_exam_28_e1", topicId: 28, prompt: "¿Cuál es la forma pasiva de 'Scientists discovered a new planet'?", options: ["A new planet discovered scientists.", "A new planet was discovered by scientists.", "Scientists were discovered by a planet.", "The planet discovers scientists."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_28_e2", topicId: 28, prompt: "En 'The windows were cleaned yesterday', ¿quién limpió?", options: ["Las ventanas", "El día", "No se menciona (agente omitido)", "El narrador"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e3", topicId: 28, prompt: "¿Cuál es la forma ACTIVA de 'The song was performed by the choir'?", options: ["The choir performs songs.", "The choir performed the song.", "Songs perform choirs.", "The song performed the choir."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_28_e4", topicId: 28, prompt: "¿En cuál situación se prefiere la voz pasiva?", options: ["Cuando el actor es lo más importante", "En escritura informal", "En noticias cuando el actor es desconocido: 'A man was arrested.'", "Siempre en cuentos infantiles"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e5", topicId: 28, prompt: "¿Cuál de estas está en voz ACTIVA?", options: ["The trophy was won by our team.", "The letter was delivered.", "Our team won the trophy.", "The cake is being eaten."], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e6", topicId: 28, prompt: "En pasiva presente ('present passive'), ¿qué forma de 'to be' se usa?", options: ["Was/were", "Has been", "Is/are", "Will be"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e7", topicId: 28, prompt: "¿Cuál oración es un ejemplo de voz pasiva en pasado?", options: ["She paints the wall.", "The wall was painted.", "She is painting the wall.", "She will paint the wall."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_28_e8", topicId: 28, prompt: "En 'The report must be submitted by Friday', ¿cuál es el sujeto que recibe la acción?", options: ["Friday", "The deadline", "The report", "The person"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e9", topicId: 28, prompt: "La voz pasiva es más común en:", options: ["Textos narrativos de aventura", "Diálogos informales", "Escritura científica y académica", "Poesía romántica"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_28_e10", topicId: 28, prompt: "Convierte a voz pasiva: 'The chef prepared a delicious meal.'", options: ["A delicious meal prepared the chef.", "A delicious meal was prepared by the chef.", "The chef is prepared.", "Meals are cooked always."], correctIndex: 1)
    ],

    29: [
        MathExamQuestion(id: "es_exam_29_e1", topicId: 29, prompt: "¿Cuál de estas es una tesis ('thesis statement') efectiva?", options: ["My essay is about recycling.", "Recycling.", "Mandatory recycling programs should be implemented in all schools because they reduce waste and teach responsibility.", "Some people recycle."], correctIndex: 2),
        MathExamQuestion(id: "es_exam_29_e2", topicId: 29, prompt: "Un autor usa estadísticas y datos científicos. ¿Qué tipo de apelación retórica es?", options: ["Pathos", "Ethos", "Logos", "Kairos"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_29_e3", topicId: 29, prompt: "Un autor menciona que es médico con 20 años de experiencia antes de dar consejos. ¿Qué apelación usa?", options: ["Logos", "Pathos", "Ethos", "Kairos"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_29_e4", topicId: 29, prompt: "Un anuncio muestra a niños sufriendo para motivar donaciones. ¿Qué apelación usa?", options: ["Logos", "Ethos", "Pathos", "None"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_29_e5", topicId: 29, prompt: "'Join us today and make a difference!' Es un ejemplo de:", options: ["Thesis statement", "Evidence", "Counterargument", "Call to action"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_29_e6", topicId: 29, prompt: "¿Por qué es importante incluir un contraargumento en un ensayo persuasivo?", options: ["Para debilitar el argumento propio", "Para demostrar que se considera la perspectiva opuesta y se puede rebatir", "Para hacer el ensayo más largo", "Porque el maestro lo exige"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_29_e7", topicId: 29, prompt: "¿Cuál de estas estrategias hace más fuerte un argumento persuasivo?", options: ["Solo usar emociones", "Combinar logos, ethos y pathos con evidencia sólida", "Repetir la misma idea muchas veces", "Ignorar los hechos"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_29_e8", topicId: 29, prompt: "Un 'hook' efectivo al inicio de un ensayo persuasivo puede ser:", options: ["La tesis directamente", "Una pregunta retórica, estadística impactante o anécdota", "Una lista de argumentos", "La conclusión"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_29_e9", topicId: 29, prompt: "La palabra 'although' al introducir un contraargumento sirve para:", options: ["Ignorarlo", "Reconocer el punto opuesto antes de rebatirlo", "Fortalecer el contraargumento", "Cambiar de tema"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_29_e10", topicId: 29, prompt: "¿Cuál estructura es típica de un ensayo persuasivo en inglés?", options: ["Solo introducción y conclusión", "Intro (hook + thesis) → Body paragraphs (claim + evidence) → Counterargument → Conclusion", "Lista de opiniones sin estructura", "Solo ejemplos sin argumentos"], correctIndex: 1)
    ],

    30: [
        MathExamQuestion(id: "es_exam_30_e1", topicId: 30, prompt: "En 'Romeo and Juliet', el frasco de veneno que Julieta tiene desde el principio es un ejemplo de:", options: ["Ironía verbal", "Simbolismo", "Foreshadowing", "Motif"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_30_e2", topicId: 30, prompt: "Una paloma blanca en literatura inglesa suele simbolizar:", options: ["Guerra y destrucción", "Misterio", "Paz e inocencia", "Peligro"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_30_e3", topicId: 30, prompt: "Ironía situacional: Un bombero cuya casa se quema. Esto es irónico porque:", options: ["Es gracioso", "Es lo opuesto de lo que se esperaría", "El bombero es un mal profesional", "Es un accidente común"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_30_e4", topicId: 30, prompt: "Ironía verbal: 'Oh great, it's Monday again.' En realidad el hablante:", options: ["Ama los lunes", "Está siendo sarcástico  -  no le gustan los lunes", "Está confundido", "Tiene razón"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_30_e5", topicId: 30, prompt: "Si en una historia la oscuridad aparece cada vez que algo malo va a ocurrir, la oscuridad es:", options: ["Un símil", "Un foreshadowing", "Un motif simbólico", "Una hipérbole"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_30_e6", topicId: 30, prompt: "¿Cuál es un tema universal ('theme') frecuente en literatura inglesa?", options: ["El nombre del protagonista", "La ciudad donde ocurre", "El poder corruptor del dinero", "El año de publicación"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_30_e7", topicId: 30, prompt: "El foreshadowing se diferencia del motif en que:", options: ["Son el mismo recurso", "El foreshadowing anticipa eventos específicos futuros; el motif es un elemento recurrente con significado", "El motif siempre anticipa el final", "El foreshadowing se repite muchas veces"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_30_e8", topicId: 30, prompt: "En ironía dramática, el público sabe que el asesino está escondido, pero el personaje no. Esto crea:", options: ["Comedia", "Suspenso y tensión", "Confusión", "Esperanza"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_30_e9", topicId: 30, prompt: "¿Cuál de estos es un ejemplo de simbolismo en literatura?", options: ["El personaje corre rápido.", "Una cadena rota representa la libertad del personaje.", "Hace frío en invierno.", "El villano es alto."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_30_e10", topicId: 30, prompt: "¿Cuál es la diferencia entre tema ('theme') y asunto ('subject') en inglés?", options: ["Son idénticos", "El asunto es el tópico general; el tema es el mensaje o lección sobre ese tópico", "El tema es más corto", "El asunto es más profundo"], correctIndex: 1)
    ],

    31: [
        MathExamQuestion(id: "es_exam_31_e1", topicId: 31, prompt: "Lee: 'New research shows that exercise improves memory by 20%.' El propósito del autor es:", options: ["Entretener", "Persuadir de hacer ejercicio", "Informar con datos", "Escribir poesía"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_31_e2", topicId: 31, prompt: "¿Qué indica sesgo ('bias') en un texto?", options: ["El autor usa muchos datos", "El autor presenta solo una perspectiva de forma unilateral", "El autor cita muchas fuentes", "El texto es muy largo"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e3", topicId: 31, prompt: "Un texto con el propósito de entretener probablemente incluye:", options: ["Estadísticas y gráficas", "Instrucciones paso a paso", "Personajes, trama y conflicto", "Definiciones técnicas"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_31_e4", topicId: 31, prompt: "¿Cómo puedes detectar el sesgo del autor?", options: ["Contando las palabras", "Identificando palabras cargadas de emoción y omisión de perspectivas opuestas", "Leyendo solo el título", "Mirando la longitud del texto"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e5", topicId: 31, prompt: "Un autor escribe: 'Everyone who cares about children MUST support this bill.' El tono es:", options: ["Objetivo e informativo", "Persuasivo con lenguaje emocional", "Neutral y científico", "Humorístico"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e6", topicId: 31, prompt: "¿Cuál tipo de texto tiene más probabilidad de ser imparcial?", options: ["Un editorial de opinión", "Un artículo científico revisado por expertos", "Un blog personal", "Un discurso político"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e7", topicId: 31, prompt: "La perspectiva del autor puede influir en:", options: ["El número de páginas del texto", "Qué información incluye, omite y cómo la presenta", "El tamaño de la fuente", "El número de capítulos"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e8", topicId: 31, prompt: "Un texto que informa usa principalmente:", options: ["Lenguaje emocional y exclamaciones", "Hechos, datos, definiciones y ejemplos objetivos", "Opiniones personales del autor", "Lenguaje figurado exagerado"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_31_e9", topicId: 31, prompt: "¿Cuál de estas preguntas ayuda a identificar el propósito del autor?", options: ["¿Cuántas páginas tiene?", "¿Quién es el personaje principal?", "¿Por qué escribió el autor este texto? ¿Qué quiere que el lector piense o haga?", "¿Cuándo se publicó?"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_31_e10", topicId: 31, prompt: "Si un texto sobre nutrición solo menciona los beneficios de cierto producto sin mencionar desventajas, muestra:", options: ["Objetividad científica", "Sesgo a favor del producto", "Estructura de secuencia", "Ironía del autor"], correctIndex: 1)
    ],

    32: [
        MathExamQuestion(id: "es_exam_32_e1", topicId: 32, prompt: "¿Cuál de estas es una paráfrasis correcta de 'The early bird catches the worm'?", options: ["The early bird catches the worm. (copia exacta)", "Las personas que empiezan temprano tienen más éxito.", "El pájaro come el gusano por la mañana.", "It's important to be a bird."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_32_e2", topicId: 32, prompt: "En formato MLA, ¿cómo se cita dentro del texto (in-text citation)?", options: ["(www.website.com)", "(Smith 45)", "(2023)", "(Title of Book)"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_32_e3", topicId: 32, prompt: "¿Cuál de estas acciones evita el plagio?", options: ["Cambiar solo algunas palabras sin citar", "Copiar y pegar con la fuente al final", "Parafrasear completamente y citar la fuente", "No mencionar de dónde viene la idea"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_32_e4", topicId: 32, prompt: "¿Cómo se llama la lista de fuentes al final de un trabajo en MLA?", options: ["References", "Bibliography", "Works Cited", "Sources"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_32_e5", topicId: 32, prompt: "Una cita directa debe ir entre:", options: ["Paréntesis ()", "Corchetes []", "Comillas \"\"", "Guiones  - "], correctIndex: 2),
        MathExamQuestion(id: "es_exam_32_e6", topicId: 32, prompt: "¿Cuál es la diferencia entre paráfrasis y resumen?", options: ["Son idénticos", "La paráfrasis reformula el texto completo con detalle; el resumen captura solo los puntos principales", "El resumen es más largo", "La paráfrasis omite detalles"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_32_e7", topicId: 32, prompt: "En investigación, ¿cuándo se necesita citar una fuente?", options: ["Solo cuando copias textualmente", "Cuando usas ideas, datos, imágenes o palabras de otro, ya sea textual o parafraseado", "Solo para libros, no páginas web", "Solo cuando el maestro lo pide"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_32_e8", topicId: 32, prompt: "¿Cuál de estas es una fuente confiable para investigación académica?", options: ["Un blog anónimo", "Wikipedia como fuente primaria", "Una revista académica revisada por expertos", "Un comentario en redes sociales"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_32_e9", topicId: 32, prompt: "En MLA, el formato correcto de entrada bibliográfica es:", options: ["Título. Autor. Año.", "Autor, Nombre. Título. Editorial, Año.", "Año. Autor. Título.", "Editorial: Autor (Año) Título."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_32_e10", topicId: 32, prompt: "¿Cuál es el propósito principal de citar fuentes en investigación?", options: ["Hacer el trabajo más largo", "Dar crédito a los autores originales y permitir verificar la información", "Impresionar con muchas referencias", "Cumplir con el formato solamente"], correctIndex: 1)
    ],

    33: [
        MathExamQuestion(id: "es_exam_33_e1", topicId: 33, prompt: "El famoso soliloquio 'To be or not to be' pertenece a:", options: ["Macbeth", "Othello", "Hamlet", "King Lear"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_33_e2", topicId: 33, prompt: "El pentámetro yámbico tiene ___ pies yámbicos por línea:", options: ["3", "4", "5", "6"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_33_e3", topicId: 33, prompt: "¿Cuál de estas obras de Shakespeare es una tragedia?", options: ["A Midsummer Night's Dream", "Much Ado About Nothing", "Macbeth", "The Taming of the Shrew"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_33_e4", topicId: 33, prompt: "¿Cuál de estas obras de Shakespeare es una comedia?", options: ["Hamlet", "Romeo and Juliet", "King Lear", "Twelfth Night"], correctIndex: 3),
        MathExamQuestion(id: "es_exam_33_e5", topicId: 33, prompt: "Un soneto shakespeariano tiene el esquema de rima:", options: ["ABBA ABBA CDC CDC EE", "ABAB CDCD EFEF GG", "AABB CCDD EEFF GG", "ABCD ABCD EFEF GG"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_33_e6", topicId: 33, prompt: "¿Qué es la 'tragic flaw' (hamartia) en una tragedia shakespeariana?", options: ["El villano de la obra", "La defecto o error fatal del héroe que causa su caída", "El discurso final", "El escenario de la obra"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_33_e7", topicId: 33, prompt: "¿En qué época vivió y escribió Shakespeare?", options: ["Siglo XII (medieval)", "Siglo XVI-XVII (isabelino/jacobeo)", "Siglo XVIII (ilustración)", "Siglo XIX (victoriano)"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_33_e8", topicId: 33, prompt: "El famoso Globe Theatre era el teatro de Shakespeare en:", options: ["Edinburgh", "Oxford", "London", "York"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_33_e9", topicId: 33, prompt: "'All the world's a stage, and all the men and women merely players.' Es de:", options: ["Hamlet", "Macbeth", "As You Like It", "Othello"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_33_e10", topicId: 33, prompt: "¿Qué característica del inglés isabelino aparece con frecuencia en Shakespeare?", options: ["Uso de emojis", "Pronombres 'thou', 'thee', 'thy' para la segunda persona", "Verbos sin conjugar", "Oraciones muy cortas de 3 palabras"], correctIndex: 1)
    ],

    34: [
        MathExamQuestion(id: "es_exam_34_e1", topicId: 34, prompt: "Si 'micro' significa pequeño, ¿qué significa 'microscope'?", options: ["Instrumento para ver cosas grandes", "Instrumento para ver cosas pequeñas", "Instrumento para escuchar", "Instrumento para medir"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e2", topicId: 34, prompt: "La raíz 'chron' (como en 'chronicle', 'chronic') significa:", options: ["Color", "Tiempo", "Número", "Lugar"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e3", topicId: 34, prompt: "Si 'phil' significa amor y 'sophia' significa sabiduría, 'philosophy' significa:", options: ["Historia del mundo", "Amor a la sabiduría", "Ciencia de los números", "Arte de la escritura"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e4", topicId: 34, prompt: "La raíz 'anthrop' (como en 'anthropology') significa:", options: ["Animal", "Planta", "Ser humano/hombre", "Dios"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_34_e5", topicId: 34, prompt: "Si 'terra' significa tierra, ¿qué significa 'terrestrial'?", options: ["Acuático", "Relacionado con la tierra o terrestre", "Celestial", "Submarino"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e6", topicId: 34, prompt: "La raíz 'photo' (como en 'photograph', 'photosynthesis') significa:", options: ["Agua", "Tierra", "Luz", "Aire"], correctIndex: 2),
        MathExamQuestion(id: "es_exam_34_e7", topicId: 34, prompt: "Si 'multi' significa muchos, ¿qué significa 'multilingual'?", options: ["Que habla un solo idioma", "Que habla muchos idiomas", "Que no habla ningún idioma", "Que estudia idiomas"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e8", topicId: 34, prompt: "La raíz 'rupt' (como en 'rupt', 'interrupt', 'erupt') significa:", options: ["Crecer", "Romper/interrumpir", "Construir", "Fluir"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e9", topicId: 34, prompt: "Si 'demo' significa pueblo y 'cracy' significa gobierno, 'democracy' significa:", options: ["Gobierno de uno", "Gobierno del pueblo", "Gobierno de los militares", "Sin gobierno"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_34_e10", topicId: 34, prompt: "La raíz 'vid/vis' (como en 'video', 'visible', 'vision') significa:", options: ["Escuchar", "Tocar", "Ver", "Hablar"], correctIndex: 2)
    ],

    35: [
        MathExamQuestion(id: "es_exam_35_e1", topicId: 35, prompt: "¿Cuál oración usa el punto y coma correctamente?", options: ["She loves dogs; but not cats.", "She loves dogs; she has three of them.", "She loves; dogs and cats.", "She; loves dogs."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e2", topicId: 35, prompt: "¿Cuál oración usa los dos puntos correctamente?", options: ["She needs: to go home.", "Bring the following: pencil, paper, and eraser.", "She said: that she was tired.", "They: went to the store."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e3", topicId: 35, prompt: "¿Cuál oración tiene estructura paralela incorrecta?", options: ["She likes reading, writing, and drawing.", "He enjoys swimming, to run, and dancing.", "They love hiking and camping.", "I need milk, eggs, and bread."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e4", topicId: 35, prompt: "Corrige: 'She likes to swim, running, and dance.'", options: ["She likes swim, running, and to dance.", "She likes to swim, to run, and to dance.", "She likes swimming, to run, dancing.", "She likes swim, run, dance."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e5", topicId: 35, prompt: "¿Cuál oración tiene un 'dangling modifier' (modificador colgante)?", options: ["Exhausted from the race, Maria sat down.", "Exhausted from the race, the chair was welcome.", "After finishing her homework, she watched TV.", "Running late, he called a taxi."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e6", topicId: 35, prompt: "¿Cuándo se usa el em dash ( - ) en inglés?", options: ["Para separar sílabas", "Para dar énfasis o añadir información de forma dramática  -  como aquí", "En lugar de punto final", "Para iniciar listas numeradas"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e7", topicId: 35, prompt: "¿Cuál oración usa los dos puntos INCORRECTAMENTE?", options: ["She had one dream: to become a doctor.", "The recipe needs: flour, sugar, and eggs. (introducción directa de lista)", "My favorite subjects are: math and science.", "He said one thing: never give up."], correctIndex: 2),
        MathExamQuestion(id: "es_exam_35_e8", topicId: 35, prompt: "La estructura paralela es importante porque:", options: ["Hace el texto más largo", "Crea ritmo, claridad y equilibrio en la escritura", "Es un requisito de MLA", "Solo aplica en poesía"], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e9", topicId: 35, prompt: "¿Cuál oración corrige el dangling modifier de 'Having finished the test, the results were announced'?", options: ["Having finished the test, announced results.", "Having finished the test, the teacher announced the results.", "The results finished the test and were announced.", "Finished testing, results came."], correctIndex: 1),
        MathExamQuestion(id: "es_exam_35_e10", topicId: 35, prompt: "¿Cuál de estas usa el punto y coma correctamente en una lista compleja?", options: ["I visited Paris, France London, England and Rome, Italy.", "I visited Paris, France; London, England; and Rome, Italy.", "I visited Paris France; London England; Rome Italy.", "I visited: Paris, London, Rome."], correctIndex: 1)
    ]
]
