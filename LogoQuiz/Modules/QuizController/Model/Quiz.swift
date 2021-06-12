//
//  Quiz.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import Foundation


class Quiz {
    
    private var questions: [QuizQuestion] = []
    
    init(questions: [QuizQuestion]) {
        self.questions = questions
    }
    
    //get question for given index
    func getQuestion(at index: Int) -> QuizQuestion? {
        if questions.indices.contains(index) {
            return questions[index]
        }
        return nil
    }
}


enum QuestionType {
    case text
    case image
}

struct LogoQuestion: QuizQuestion {
    
    var question: String {
        get {
            return imageUrl
        }
    }
    
    var answer: String {
        get {
            return name.lowercased()
        }
    }
    
    var type: QuestionType {
        return .image
    }
    
    let imageUrl: String
    let name: String
}
