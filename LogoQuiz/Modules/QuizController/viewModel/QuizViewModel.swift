//
//  QuizViewModel.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import Foundation
import UIKit

class QuizViewModel {
    
    var questions: [QuizQuestion]
    private var currentIndex: Int = 0
    private var user: User
    
    init(ques: [QuizQuestion], userName: String = "test") {
        self.questions = ques
        self.user = User(name: userName)
        //for demo purpose loading data from file
        parseJsonFromFile()
    }
    
    func getNextQuestion() -> QuizQuestion? {
        
        if questions.indices.contains(currentIndex+1) {
            currentIndex += 1
            return questions[currentIndex]
        }
        return nil
    }
    
    func getCurrentQuestion() -> QuizQuestion? {
        return questions[currentIndex]
    }
    
    func updateScore() {
        user.updateScore()
    }

   
}

extension QuizViewModel {
    func parseJsonFromFile() {
        if let fileData = readLocalFile() {
            self.questions = parse(jsonData: fileData)
        }
    }
    
    private func readLocalFile(forName name: String = "LogoResponse") -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
        
    private func parse(jsonData: Data) -> [QuizQuestion] {
        do {
            let decodedData = try JSONDecoder().decode([LogoObject].self,
                                                       from: jsonData)
            
            return mappedTOQuestionData(data: decodedData)
        } catch {
            return []
        }
    }
    
    private func mappedTOQuestionData(data: [LogoObject]) -> [QuizQuestion] {
        var result: [QuizQuestion] = []
        
        for logoObj in data {
            result.append(LogoQuestion(imageUrl: logoObj.imgUrl, name: logoObj.name))
        }
        return result
    }
    
    
}
