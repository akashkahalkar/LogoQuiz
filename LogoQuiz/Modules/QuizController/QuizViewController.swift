//
//  ViewController.swift
//  LogoQuiz
//
//  Created by akash.kahalkar on 12/06/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var answerInputLabel: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    let viewModel = QuizViewModel(ques: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        //start by loading first question
        if let question = viewModel.getCurrentQuestion() {
            loadQuestion(question: question)
        } else {
            //need to handle no question state here
        }
    }
    
    //start validation of the answer
    @IBAction func checkButtonTapped(_ sender: Any) {
        
        if let answer = answerInputLabel.text,
           !answer.isEmpty {
            
            validateAnswer(answer: answer)
        } else {
            //probably need to show user that answer is incorrect and we can reduce the score
            debugPrint("Answer can not be empty")
        }
    }
    
    private func validateAnswer(answer: String) {
        //check if ans is correct update flow
        if let currentQuestion = viewModel.getCurrentQuestion() {
            
            //fore correct ans updated score and move to next question
            if currentQuestion.answer == answer.lowercased() {
                viewModel.updateScore()
                if let question = viewModel.getNextQuestion() {
                    loadQuestion(question: question)
                } else {
                    showEndState()
                }
            }
        }
    }
    
    //load the view with given question
    func loadQuestion(question: QuizQuestion) {
        ImageCache.shared.getImage(for: question.question) { (image) in
            DispatchQueue.main.async {
                self.logoImageView.image = image
            }
        }
    }
    
    func showEndState() {
        //Need to implement the end state of current level
    }
}
