import Foundation

// MARK: - AppLanguage

enum AppLanguage: String, CaseIterable {
    case english = "en"
    case arabic  = "ar"
    case czech   = "cs"
    case spanish = "es"
    case french  = "fr"
    case german  = "de"

    var displayName: String {
        switch self {
        case .english: return "English"
        case .arabic:  return "العربية"
        case .czech:   return "Čeština"
        case .spanish: return "Español"
        case .french:  return "Français"
        case .german:  return "Deutsch"
        }
    }

    var flag: String {
        switch self {
        case .english: return "🇬🇧"
        case .arabic:  return "🇸🇦"
        case .czech:   return "🇨🇿"
        case .spanish: return "🇪🇸"
        case .french:  return "🇫🇷"
        case .german:  return "🇩🇪"
        }
    }

    var englishName: String {
        switch self {
        case .english: return "English"
        case .arabic:  return "Arabic"
        case .czech:   return "Czech"
        case .spanish: return "Spanish"
        case .french:  return "French"
        case .german:  return "German"
        }
    }

    var isRTL: Bool {
        return self == .arabic
    }
}

// MARK: - LanguageManager

final class LanguageManager {

    static let shared = LanguageManager()
    private init() {}

    // MARK: - Persistence keys

    private enum Keys {
        static let appLanguage            = "app_language"
        static let engTeachingLanguage    = "eng_teaching_language"
        static let engTeachingChosen      = "eng_teaching_language_chosen"
    }

    // MARK: - Current language

    var currentLanguage: AppLanguage {
        get {
            guard let raw = UserDefaults.standard.string(forKey: Keys.appLanguage),
                  let lang = AppLanguage(rawValue: raw) else {
                return .english
            }
            return lang
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.appLanguage)
        }
    }

    // MARK: - English teaching language

    var englishTeachingLanguage: AppLanguage {
        get {
            guard let raw = UserDefaults.standard.string(forKey: Keys.engTeachingLanguage),
                  let lang = AppLanguage(rawValue: raw) else {
                return .english
            }
            return lang
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.engTeachingLanguage)
        }
    }

    var hasChosenTeachingLanguage: Bool {
        get { UserDefaults.standard.bool(forKey: Keys.engTeachingChosen) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.engTeachingChosen) }
    }

    // MARK: - Setters

    func setLanguage(_ language: AppLanguage) {
        currentLanguage = language
        // Notify the app to rebuild its UI with the new language
        NotificationCenter.default.post(name: .appLanguageDidChange, object: nil)
    }

    func setEnglishTeachingLanguage(_ language: AppLanguage) {
        englishTeachingLanguage = language
        hasChosenTeachingLanguage = true
    }

    // MARK: - Translation

    /// Returns the translated string for `key` in the current app language,
    /// falling back to English if the key is missing.
    func t(_ key: String) -> String {
        let lang = currentLanguage
        if let value = translations[lang]?[key] {
            return value
        }
        // Fallback to English
        return translations[.english]?[key] ?? key
    }

    // MARK: - Translations dictionary

    private let translations: [AppLanguage: [String: String]] = [

        // ── ENGLISH ──────────────────────────────────────────────────────────
        .english: [
            // Tab Bar
            "tab.home":    "Home",
            "tab.quests":  "Quests",
            "tab.profile": "Profile",

            // Main Map
            "map.title":           "World Map",
            "map.level":           "Level",
            "map.xp_progress":     "XP Progress",
            "map.locked":          "Locked",
            "map.unlock.science":  "Complete {0} more topics to unlock",
            "map.unlock.history":  "Complete all worlds to unlock",
            "map.math":            "Math",
            "map.english":         "English",
            "map.geography":       "Geography",
            "map.science":         "Science",
            "map.history":         "History",

            // World / Topics
            "world.back":                  "Back",
            "world.back_to_map":           "Back to Map",
            "world.start_quest":           "Start Quest",
            "world.quest_locked":          "Quest Locked",
            "world.completed":             "Completed",
            "world.diagnostic.title":      "Diagnostic Quiz",
            "world.diagnostic.subtitle":   "Let's see what you already know!",
            "world.topic_intro.start":     "Start",
            "world.topic_intro.quest":     "Quest {0} of {1}",

            // Game
            "game.check":           "Check",
            "game.next":            "Next",
            "game.correct":         "Correct!",
            "game.incorrect":       "Not quite  -  try again!",
            "game.question_count":  "Question {0} of {1}",
            "game.quest_complete":  "Quest Complete!",
            "game.exam_passed":     "Exam Passed!",
            "game.xp_earned":       "+{0} XP",
            "game.try_again":       "Try Again",
            "game.finish":          "Finish",
            "game.back_to_map":     "Back to Map",

            // Quests
            "quests.title":      "Daily Quests",
            "quests.extra":      "Extra Quests",
            "quests.complete":   "Complete",
            "quests.xp_reward":  "+{0} XP",
            "quests.streak":     "Streak",

            // Profile
            "profile.title":           "Profile",
            "profile.level":           "Level {0}",
            "profile.stats.quests":    "Quests",
            "profile.stats.streak":    "Streak",
            "profile.stats.islands":   "Islands",
            "profile.stats.xp":        "XP",
            "profile.avatar_studio":   "Avatar Studio",
            "profile.badges":          "Badges",
            "profile.world_progress":  "World Progress",
            "profile.settings":        "Settings",

            // Settings
            "settings.title":                 "Settings",
            "settings.language":              "App Language",
            "settings.english_teaching_lang": "English Teaching Language",
            "settings.preferences":           "Preferences",
            "settings.notifications":         "Notifications",
            "settings.subscription":          "Subscription",
            "settings.privacy":               "Privacy",
            "settings.help":                  "Help Center",
            "settings.feedback":              "Feedback",
            "settings.terms":                 "Terms of Service",
            "settings.privacy_policy":        "Privacy Policy",
            "settings.logout":                "Log Out",
            "settings.logout_confirm":        "Are you sure you want to log out?",
            "settings.cancel":                "Cancel",

            // English Teaching
            "eng.choose_lang.title":   "Choose Teaching Language",
            "eng.choose_lang.subtitle": "Which language should we use to teach you English?",
            "eng.choose_lang.button":  "Continue",
            "eng.native_label":        "Your native language",

            // Auth
            "auth.login":          "Log In",
            "auth.signup":         "Sign Up",
            "auth.username":       "Username",
            "auth.password":       "Password",
            "auth.welcome":        "Welcome to Questry!",
            "auth.error.invalid":  "Invalid username or password.",

            // Shop
            "shop.title":          "Rewards Shop",
            "shop.buy":            "Buy",
            "shop.not_enough_xp":  "Not enough XP",

            // Badges
            "badges.title":   "Badges",
            "badges.locked":  "Locked",

            // Progress
            "progress.title":       "World Progress",
            "progress.topics_done": "{0}/{1} Topics",

            // Language Picker
            "lang_picker_title_app":          "Choose Language",
            "lang_picker_title_teaching":     "Teaching Language",
            "lang_picker_teaching_subtitle":  "Which language do you want to learn English from?",

            // Preferences  -  Language section
            "pref_section_language":   "Language",
            "pref_app_language":       "App Language",
            "pref_teaching_language":  "Teaching Language",

            // English world - teaching language prompt
            "eng_prompt_title":    "What language should we teach you English in?",
            "eng_prompt_subtitle": "Pick the language you feel most comfortable with. You can change this later in Settings.",
            "eng_prompt_confirm":  "Let's Start! 🚀",
        ],

        // ── ARABIC ───────────────────────────────────────────────────────────
        .arabic: [
            // Tab Bar
            "tab.home":    "الرئيسية",
            "tab.quests":  "المهام",
            "tab.profile": "الملف الشخصي",

            // Main Map
            "map.title":           "خريطة العالم",
            "map.level":           "المستوى",
            "map.xp_progress":     "تقدُّم نقاط الخبرة",
            "map.locked":          "مقفل",
            "map.unlock.science":  "أكمل {0} موضوعات إضافية لإلغاء القفل",
            "map.unlock.history":  "أكمل جميع العوالم لإلغاء القفل",
            "map.math":            "الرياضيات",
            "map.english":         "الإنجليزية",
            "map.geography":       "الجغرافيا",
            "map.science":         "العلوم",
            "map.history":         "التاريخ",

            // World / Topics
            "world.back":                  "رجوع",
            "world.back_to_map":           "العودة إلى الخريطة",
            "world.start_quest":           "ابدأ المهمة",
            "world.quest_locked":          "المهمة مقفلة",
            "world.completed":             "مكتمل",
            "world.diagnostic.title":      "اختبار التشخيص",
            "world.diagnostic.subtitle":   "لنرَ ما تعرفه بالفعل!",
            "world.topic_intro.start":     "ابدأ",
            "world.topic_intro.quest":     "المهمة {0} من {1}",

            // Game
            "game.check":           "تحقق",
            "game.next":            "التالي",
            "game.correct":         "صحيح!",
            "game.incorrect":       "ليس تماماً  -  حاول مجدداً!",
            "game.question_count":  "السؤال {0} من {1}",
            "game.quest_complete":  "اكتملت المهمة!",
            "game.exam_passed":     "اجتزت الامتحان!",
            "game.xp_earned":       "+{0} نقطة خبرة",
            "game.try_again":       "حاول مجدداً",
            "game.finish":          "إنهاء",
            "game.back_to_map":     "العودة إلى الخريطة",

            // Quests
            "quests.title":      "مهام يومية",
            "quests.extra":      "مهام إضافية",
            "quests.complete":   "مكتمل",
            "quests.xp_reward":  "+{0} نقطة خبرة",
            "quests.streak":     "السلسلة",

            // Profile
            "profile.title":           "الملف الشخصي",
            "profile.level":           "المستوى {0}",
            "profile.stats.quests":    "المهام",
            "profile.stats.streak":    "السلسلة",
            "profile.stats.islands":   "الجزر",
            "profile.stats.xp":        "نقاط الخبرة",
            "profile.avatar_studio":   "استوديو الصورة الرمزية",
            "profile.badges":          "الشارات",
            "profile.world_progress":  "تقدُّم العوالم",
            "profile.settings":        "الإعدادات",

            // Settings
            "settings.title":                 "الإعدادات",
            "settings.language":              "لغة التطبيق",
            "settings.english_teaching_lang": "لغة تدريس الإنجليزية",
            "settings.preferences":           "التفضيلات",
            "settings.notifications":         "الإشعارات",
            "settings.subscription":          "الاشتراك",
            "settings.privacy":               "الخصوصية",
            "settings.help":                  "مركز المساعدة",
            "settings.feedback":              "التعليقات",
            "settings.terms":                 "شروط الخدمة",
            "settings.privacy_policy":        "سياسة الخصوصية",
            "settings.logout":                "تسجيل الخروج",
            "settings.logout_confirm":        "هل أنت متأكد من رغبتك في تسجيل الخروج؟",
            "settings.cancel":                "إلغاء",

            // English Teaching
            "eng.choose_lang.title":    "اختر لغة التدريس",
            "eng.choose_lang.subtitle": "بأيِّ لغة تريد أن نعلِّمك الإنجليزية؟",
            "eng.choose_lang.button":   "متابعة",
            "eng.native_label":         "لغتك الأم",

            // Auth
            "auth.login":          "تسجيل الدخول",
            "auth.signup":         "إنشاء حساب",
            "auth.username":       "اسم المستخدم",
            "auth.password":       "كلمة المرور",
            "auth.welcome":        "مرحباً بك في Questry!",
            "auth.error.invalid":  "اسم المستخدم أو كلمة المرور غير صحيحة.",

            // Shop
            "shop.title":          "متجر المكافآت",
            "shop.buy":            "شراء",
            "shop.not_enough_xp":  "نقاط الخبرة غير كافية",

            // Badges
            "badges.title":   "الشارات",
            "badges.locked":  "مقفل",

            // Progress
            "progress.title":       "تقدُّم العوالم",
            "progress.topics_done": "{0}/{1} موضوع",
        ],

        // ── CZECH ────────────────────────────────────────────────────────────
        .czech: [
            // Tab Bar
            "tab.home":    "Domů",
            "tab.quests":  "Úkoly",
            "tab.profile": "Profil",

            // Main Map
            "map.title":           "Mapa světa",
            "map.level":           "Úroveň",
            "map.xp_progress":     "Postup XP",
            "map.locked":          "Zamčeno",
            "map.unlock.science":  "Dokonči ještě {0} témat pro odemčení",
            "map.unlock.history":  "Dokonči všechny světy pro odemčení",
            "map.math":            "Matematika",
            "map.english":         "Angličtina",
            "map.geography":       "Zeměpis",
            "map.science":         "Přírodověda",
            "map.history":         "Dějepis",

            // World / Topics
            "world.back":                  "Zpět",
            "world.back_to_map":           "Zpět na mapu",
            "world.start_quest":           "Spustit úkol",
            "world.quest_locked":          "Úkol je zamčen",
            "world.completed":             "Dokončeno",
            "world.diagnostic.title":      "Diagnostický kvíz",
            "world.diagnostic.subtitle":   "Zjistíme, co už víš!",
            "world.topic_intro.start":     "Začít",
            "world.topic_intro.quest":     "Úkol {0} z {1}",

            // Game
            "game.check":           "Zkontrolovat",
            "game.next":            "Další",
            "game.correct":         "Správně!",
            "game.incorrect":       "Není to tak  -  zkus to znovu!",
            "game.question_count":  "Otázka {0} z {1}",
            "game.quest_complete":  "Úkol splněn!",
            "game.exam_passed":     "Zkouška úspěšně složena!",
            "game.xp_earned":       "+{0} XP",
            "game.try_again":       "Zkusit znovu",
            "game.finish":          "Dokončit",
            "game.back_to_map":     "Zpět na mapu",

            // Quests
            "quests.title":      "Denní úkoly",
            "quests.extra":      "Bonusové úkoly",
            "quests.complete":   "Dokončit",
            "quests.xp_reward":  "+{0} XP",
            "quests.streak":     "Série",

            // Profile
            "profile.title":           "Profil",
            "profile.level":           "Úroveň {0}",
            "profile.stats.quests":    "Úkoly",
            "profile.stats.streak":    "Série",
            "profile.stats.islands":   "Ostrovy",
            "profile.stats.xp":        "XP",
            "profile.avatar_studio":   "Studio avatarů",
            "profile.badges":          "Odznaky",
            "profile.world_progress":  "Postup ve světech",
            "profile.settings":        "Nastavení",

            // Settings
            "settings.title":                 "Nastavení",
            "settings.language":              "Jazyk aplikace",
            "settings.english_teaching_lang": "Jazyk výuky angličtiny",
            "settings.preferences":           "Předvolby",
            "settings.notifications":         "Oznámení",
            "settings.subscription":          "Předplatné",
            "settings.privacy":               "Soukromí",
            "settings.help":                  "Centrum nápovědy",
            "settings.feedback":              "Zpětná vazba",
            "settings.terms":                 "Podmínky služby",
            "settings.privacy_policy":        "Zásady ochrany soukromí",
            "settings.logout":                "Odhlásit se",
            "settings.logout_confirm":        "Opravdu se chceš odhlásit?",
            "settings.cancel":                "Zrušit",

            // English Teaching
            "eng.choose_lang.title":    "Vyber jazyk výuky",
            "eng.choose_lang.subtitle": "V jakém jazyce tě máme učit angličtinu?",
            "eng.choose_lang.button":   "Pokračovat",
            "eng.native_label":         "Tvůj rodný jazyk",

            // Auth
            "auth.login":          "Přihlásit se",
            "auth.signup":         "Registrovat se",
            "auth.username":       "Uživatelské jméno",
            "auth.password":       "Heslo",
            "auth.welcome":        "Vítej v Questry!",
            "auth.error.invalid":  "Nesprávné uživatelské jméno nebo heslo.",

            // Shop
            "shop.title":          "Obchod s odměnami",
            "shop.buy":            "Koupit",
            "shop.not_enough_xp":  "Nedostatek XP",

            // Badges
            "badges.title":   "Odznaky",
            "badges.locked":  "Zamčeno",

            // Progress
            "progress.title":       "Postup ve světech",
            "progress.topics_done": "{0}/{1} témat",
        ],

        // ── SPANISH ──────────────────────────────────────────────────────────
        .spanish: [
            // Tab Bar
            "tab.home":    "Inicio",
            "tab.quests":  "Misiones",
            "tab.profile": "Perfil",

            // Main Map
            "map.title":           "Mapa del mundo",
            "map.level":           "Nivel",
            "map.xp_progress":     "Progreso de XP",
            "map.locked":          "Bloqueado",
            "map.unlock.science":  "Completa {0} temas más para desbloquear",
            "map.unlock.history":  "Completa todos los mundos para desbloquear",
            "map.math":            "Matemáticas",
            "map.english":         "Inglés",
            "map.geography":       "Geografía",
            "map.science":         "Ciencias",
            "map.history":         "Historia",

            // World / Topics
            "world.back":                  "Atrás",
            "world.back_to_map":           "Volver al mapa",
            "world.start_quest":           "Iniciar misión",
            "world.quest_locked":          "Misión bloqueada",
            "world.completed":             "Completado",
            "world.diagnostic.title":      "Prueba de diagnóstico",
            "world.diagnostic.subtitle":   "¡Veamos qué ya sabes!",
            "world.topic_intro.start":     "Comenzar",
            "world.topic_intro.quest":     "Misión {0} de {1}",

            // Game
            "game.check":           "Comprobar",
            "game.next":            "Siguiente",
            "game.correct":         "¡Correcto!",
            "game.incorrect":       "No del todo  -  ¡inténtalo de nuevo!",
            "game.question_count":  "Pregunta {0} de {1}",
            "game.quest_complete":  "¡Misión completada!",
            "game.exam_passed":     "¡Examen superado!",
            "game.xp_earned":       "+{0} XP",
            "game.try_again":       "Intentar de nuevo",
            "game.finish":          "Finalizar",
            "game.back_to_map":     "Volver al mapa",

            // Quests
            "quests.title":      "Misiones diarias",
            "quests.extra":      "Misiones extra",
            "quests.complete":   "Completar",
            "quests.xp_reward":  "+{0} XP",
            "quests.streak":     "Racha",

            // Profile
            "profile.title":           "Perfil",
            "profile.level":           "Nivel {0}",
            "profile.stats.quests":    "Misiones",
            "profile.stats.streak":    "Racha",
            "profile.stats.islands":   "Islas",
            "profile.stats.xp":        "XP",
            "profile.avatar_studio":   "Estudio de avatares",
            "profile.badges":          "Insignias",
            "profile.world_progress":  "Progreso mundial",
            "profile.settings":        "Ajustes",

            // Settings
            "settings.title":                 "Ajustes",
            "settings.language":              "Idioma de la aplicación",
            "settings.english_teaching_lang": "Idioma de enseñanza del inglés",
            "settings.preferences":           "Preferencias",
            "settings.notifications":         "Notificaciones",
            "settings.subscription":          "Suscripción",
            "settings.privacy":               "Privacidad",
            "settings.help":                  "Centro de ayuda",
            "settings.feedback":              "Comentarios",
            "settings.terms":                 "Términos de servicio",
            "settings.privacy_policy":        "Política de privacidad",
            "settings.logout":                "Cerrar sesión",
            "settings.logout_confirm":        "¿Estás seguro de que quieres cerrar sesión?",
            "settings.cancel":                "Cancelar",

            // English Teaching
            "eng.choose_lang.title":    "Elegir idioma de enseñanza",
            "eng.choose_lang.subtitle": "¿En qué idioma quieres que te enseñemos inglés?",
            "eng.choose_lang.button":   "Continuar",
            "eng.native_label":         "Tu idioma nativo",

            // Auth
            "auth.login":          "Iniciar sesión",
            "auth.signup":         "Registrarse",
            "auth.username":       "Nombre de usuario",
            "auth.password":       "Contraseña",
            "auth.welcome":        "¡Bienvenido a Questry!",
            "auth.error.invalid":  "Nombre de usuario o contraseña incorrectos.",

            // Shop
            "shop.title":          "Tienda de recompensas",
            "shop.buy":            "Comprar",
            "shop.not_enough_xp":  "XP insuficiente",

            // Badges
            "badges.title":   "Insignias",
            "badges.locked":  "Bloqueado",

            // Progress
            "progress.title":       "Progreso mundial",
            "progress.topics_done": "{0}/{1} temas",
        ],

        // ── FRENCH ───────────────────────────────────────────────────────────
        .french: [
            // Tab Bar
            "tab.home":    "Accueil",
            "tab.quests":  "Quêtes",
            "tab.profile": "Profil",

            // Main Map
            "map.title":           "Carte du monde",
            "map.level":           "Niveau",
            "map.xp_progress":     "Progression XP",
            "map.locked":          "Verrouillé",
            "map.unlock.science":  "Complète {0} sujets supplémentaires pour déverrouiller",
            "map.unlock.history":  "Complète tous les mondes pour déverrouiller",
            "map.math":            "Mathématiques",
            "map.english":         "Anglais",
            "map.geography":       "Géographie",
            "map.science":         "Sciences",
            "map.history":         "Histoire",

            // World / Topics
            "world.back":                  "Retour",
            "world.back_to_map":           "Retour à la carte",
            "world.start_quest":           "Commencer la quête",
            "world.quest_locked":          "Quête verrouillée",
            "world.completed":             "Terminé",
            "world.diagnostic.title":      "Quiz de diagnostic",
            "world.diagnostic.subtitle":   "Voyons ce que tu sais déjà !",
            "world.topic_intro.start":     "Commencer",
            "world.topic_intro.quest":     "Quête {0} sur {1}",

            // Game
            "game.check":           "Vérifier",
            "game.next":            "Suivant",
            "game.correct":         "Correct !",
            "game.incorrect":       "Pas tout à fait  -  réessaie !",
            "game.question_count":  "Question {0} sur {1}",
            "game.quest_complete":  "Quête accomplie !",
            "game.exam_passed":     "Examen réussi !",
            "game.xp_earned":       "+{0} XP",
            "game.try_again":       "Réessayer",
            "game.finish":          "Terminer",
            "game.back_to_map":     "Retour à la carte",

            // Quests
            "quests.title":      "Quêtes quotidiennes",
            "quests.extra":      "Quêtes supplémentaires",
            "quests.complete":   "Terminer",
            "quests.xp_reward":  "+{0} XP",
            "quests.streak":     "Série",

            // Profile
            "profile.title":           "Profil",
            "profile.level":           "Niveau {0}",
            "profile.stats.quests":    "Quêtes",
            "profile.stats.streak":    "Série",
            "profile.stats.islands":   "Îles",
            "profile.stats.xp":        "XP",
            "profile.avatar_studio":   "Studio d'avatar",
            "profile.badges":          "Badges",
            "profile.world_progress":  "Progression mondiale",
            "profile.settings":        "Paramètres",

            // Settings
            "settings.title":                 "Paramètres",
            "settings.language":              "Langue de l'application",
            "settings.english_teaching_lang": "Langue d'enseignement de l'anglais",
            "settings.preferences":           "Préférences",
            "settings.notifications":         "Notifications",
            "settings.subscription":          "Abonnement",
            "settings.privacy":               "Confidentialité",
            "settings.help":                  "Centre d'aide",
            "settings.feedback":              "Commentaires",
            "settings.terms":                 "Conditions d'utilisation",
            "settings.privacy_policy":        "Politique de confidentialité",
            "settings.logout":                "Se déconnecter",
            "settings.logout_confirm":        "Es-tu sûr de vouloir te déconnecter ?",
            "settings.cancel":                "Annuler",

            // English Teaching
            "eng.choose_lang.title":    "Choisir la langue d'enseignement",
            "eng.choose_lang.subtitle": "Dans quelle langue veux-tu apprendre l'anglais ?",
            "eng.choose_lang.button":   "Continuer",
            "eng.native_label":         "Ta langue maternelle",

            // Auth
            "auth.login":          "Se connecter",
            "auth.signup":         "S'inscrire",
            "auth.username":       "Nom d'utilisateur",
            "auth.password":       "Mot de passe",
            "auth.welcome":        "Bienvenue sur Questry !",
            "auth.error.invalid":  "Nom d'utilisateur ou mot de passe incorrect.",

            // Shop
            "shop.title":          "Boutique de récompenses",
            "shop.buy":            "Acheter",
            "shop.not_enough_xp":  "XP insuffisants",

            // Badges
            "badges.title":   "Badges",
            "badges.locked":  "Verrouillé",

            // Progress
            "progress.title":       "Progression mondiale",
            "progress.topics_done": "{0}/{1} sujets",
        ],

        // ── GERMAN ───────────────────────────────────────────────────────────
        .german: [
            // Tab Bar
            "tab.home":    "Startseite",
            "tab.quests":  "Aufgaben",
            "tab.profile": "Profil",

            // Main Map
            "map.title":           "Weltkarte",
            "map.level":           "Level",
            "map.xp_progress":     "XP-Fortschritt",
            "map.locked":          "Gesperrt",
            "map.unlock.science":  "Schließe {0} weitere Themen ab, um freizuschalten",
            "map.unlock.history":  "Schließe alle Welten ab, um freizuschalten",
            "map.math":            "Mathematik",
            "map.english":         "Englisch",
            "map.geography":       "Geographie",
            "map.science":         "Naturwissenschaften",
            "map.history":         "Geschichte",

            // World / Topics
            "world.back":                  "Zurück",
            "world.back_to_map":           "Zurück zur Karte",
            "world.start_quest":           "Aufgabe starten",
            "world.quest_locked":          "Aufgabe gesperrt",
            "world.completed":             "Abgeschlossen",
            "world.diagnostic.title":      "Diagnose-Quiz",
            "world.diagnostic.subtitle":   "Lass uns sehen, was du schon weißt!",
            "world.topic_intro.start":     "Starten",
            "world.topic_intro.quest":     "Aufgabe {0} von {1}",

            // Game
            "game.check":           "Überprüfen",
            "game.next":            "Weiter",
            "game.correct":         "Richtig!",
            "game.incorrect":       "Nicht ganz  -  versuch es nochmal!",
            "game.question_count":  "Frage {0} von {1}",
            "game.quest_complete":  "Aufgabe erledigt!",
            "game.exam_passed":     "Prüfung bestanden!",
            "game.xp_earned":       "+{0} XP",
            "game.try_again":       "Nochmal versuchen",
            "game.finish":          "Fertigstellen",
            "game.back_to_map":     "Zurück zur Karte",

            // Quests
            "quests.title":      "Tägliche Aufgaben",
            "quests.extra":      "Zusatzaufgaben",
            "quests.complete":   "Abschließen",
            "quests.xp_reward":  "+{0} XP",
            "quests.streak":     "Serie",

            // Profile
            "profile.title":           "Profil",
            "profile.level":           "Level {0}",
            "profile.stats.quests":    "Aufgaben",
            "profile.stats.streak":    "Serie",
            "profile.stats.islands":   "Inseln",
            "profile.stats.xp":        "XP",
            "profile.avatar_studio":   "Avatar-Studio",
            "profile.badges":          "Abzeichen",
            "profile.world_progress":  "Weltfortschritt",
            "profile.settings":        "Einstellungen",

            // Settings
            "settings.title":                 "Einstellungen",
            "settings.language":              "App-Sprache",
            "settings.english_teaching_lang": "Unterrichtssprache für Englisch",
            "settings.preferences":           "Einstellungen",
            "settings.notifications":         "Benachrichtigungen",
            "settings.subscription":          "Abonnement",
            "settings.privacy":               "Datenschutz",
            "settings.help":                  "Hilfe-Center",
            "settings.feedback":              "Feedback",
            "settings.terms":                 "Nutzungsbedingungen",
            "settings.privacy_policy":        "Datenschutzrichtlinie",
            "settings.logout":                "Abmelden",
            "settings.logout_confirm":        "Bist du sicher, dass du dich abmelden möchtest?",
            "settings.cancel":                "Abbrechen",

            // English Teaching
            "eng.choose_lang.title":    "Unterrichtssprache wählen",
            "eng.choose_lang.subtitle": "In welcher Sprache sollen wir dir Englisch beibringen?",
            "eng.choose_lang.button":   "Weiter",
            "eng.native_label":         "Deine Muttersprache",

            // Auth
            "auth.login":          "Anmelden",
            "auth.signup":         "Registrieren",
            "auth.username":       "Benutzername",
            "auth.password":       "Passwort",
            "auth.welcome":        "Willkommen bei Questry!",
            "auth.error.invalid":  "Ungültiger Benutzername oder ungültiges Passwort.",

            // Shop
            "shop.title":          "Belohnungsladen",
            "shop.buy":            "Kaufen",
            "shop.not_enough_xp":  "Nicht genug XP",

            // Badges
            "badges.title":   "Abzeichen",
            "badges.locked":  "Gesperrt",

            // Progress
            "progress.title":       "Weltfortschritt",
            "progress.topics_done": "{0}/{1} Themen",
        ],
    ]
}

// MARK: - Notification name

extension Notification.Name {
    static let appLanguageDidChange = Notification.Name("appLanguageDidChange")
}

// MARK: - Global shorthand

/// Convenience global function  -  translates `key` using the current app language.
func t(_ key: String) -> String {
    LanguageManager.shared.t(key)
}
