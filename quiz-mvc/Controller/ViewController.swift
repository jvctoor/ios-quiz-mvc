//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            questionLabel.textColor = UIColor.green
        } else {
            questionLabel.textColor = UIColor.red
        }
        
        quizBrain.updateQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(updateUI) , userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        questionLabel.textColor = UIColor.white
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    
}


