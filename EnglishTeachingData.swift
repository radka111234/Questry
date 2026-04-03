import Foundation

// MARK: - English Teaching Data Router
// Routes to the correct teaching pack based on the user's chosen teaching language.
// When teachingLanguage == .english, falls back to the standard EnglishGameData.

struct EnglishTeachingData {

    // Returns topic definitions for the current teaching language
    static func topics(for language: AppLanguage) -> [(id: Int, title: String, intro: String, example: String)] {
        switch language {
        case .spanish: return esTeachingTopicsA + esTeachingTopicsB
        case .french:  return frTeachingTopicsA + frTeachingTopicsB
        case .german:  return deTeachingTopicsA + deTeachingTopicsB
        case .czech:   return csTeachingTopicsA + csTeachingTopicsB
        case .arabic:  return arTeachingTopicsA + arTeachingTopicsB
        case .english: return []
        }
    }

    // Returns practice questions for a given topic and quest number (1-based, 5 questions each)
    static func practiceQuestions(topicId: Int, questNumber: Int, language: AppLanguage) -> [MathExamQuestion] {
        let questions = allPractice(for: language)[topicId] ?? []
        let start = (questNumber - 1) * 5
        guard start < questions.count else { return Array(questions.prefix(5)) }
        return Array(questions[start..<min(start + 5, questions.count)])
    }

    // Returns exam questions for a given topic
    static func examQuestions(topicId: Int, language: AppLanguage) -> [MathExamQuestion] {
        return allExam(for: language)[topicId] ?? []
    }

    // MARK: - Private helpers

    private static func allPractice(for language: AppLanguage) -> [Int: [MathExamQuestion]] {
        switch language {
        case .spanish: return esTeachingPracticeA.merging(esTeachingPracticeB) { $1 }
        case .french:  return frTeachingPracticeA.merging(frTeachingPracticeB) { $1 }
        case .german:  return deTeachingPracticeA.merging(deTeachingPracticeB) { $1 }
        case .czech:   return csTeachingPracticeA.merging(csTeachingPracticeB) { $1 }
        case .arabic:  return arTeachingPracticeA.merging(arTeachingPracticeB) { $1 }
        case .english: return [:]
        }
    }

    private static func allExam(for language: AppLanguage) -> [Int: [MathExamQuestion]] {
        switch language {
        case .spanish: return esTeachingExamA.merging(esTeachingExamB) { $1 }
        case .french:  return frTeachingExamA.merging(frTeachingExamB) { $1 }
        case .german:  return deTeachingExamA.merging(deTeachingExamB) { $1 }
        case .czech:   return csTeachingExamA
        case .arabic:  return arTeachingExamA
        case .english: return [:]
        }
    }
}
