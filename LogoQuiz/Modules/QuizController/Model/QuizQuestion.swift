//
//  UizQuestion.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import Foundation

protocol QuizQuestion {
    var question: String {get}
    var answer: String {get}
    var type: QuestionType {get}
}
