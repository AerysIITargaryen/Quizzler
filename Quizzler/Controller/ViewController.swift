//
//  ViewController.swift
//  Quizzler
//
//  Created by Иван Станкин on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        thirdButton.layer.cornerRadius = 20
        
        updateUI()
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.3)) {
            self.updateUI()
        }
        
        
        
    }
    
    func updateUI() {
        
        let answerTitles = quizBrain.getAnswers()
        
        trueButton.setTitle(answerTitles[0], for: .normal)
        falseButton.setTitle(answerTitles[1], for: .normal)
        thirdButton.setTitle(answerTitles[2], for: .normal)
        
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear
        
        
    }
    
        
    

}

