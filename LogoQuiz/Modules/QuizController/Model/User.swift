//
//  User.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import Foundation

class User {
    private var username: String
    private var score: Int
    
    func updateScore() {
        score += 1
    }
    
    func resetScore() {
        score = 0
    }
    
    func reduceScore() {
        score = (score-1) > 0 ? score-1 : 0
    }
    
    init(name: String) {
        username = name
        score = 0
    }
}
