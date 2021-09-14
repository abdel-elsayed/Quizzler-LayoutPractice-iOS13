//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var score: UILabel!
    var quizBrain = QuizBrain.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if (quizBrain.checkAnswer(sender.currentTitle!)){
            sender.backgroundColor = .green
        }
        else{
            sender.backgroundColor = .red
        }
        
        quizBrain.updateCount()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector:#selector(updateUI), userInfo:nil, repeats:false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        score.text = String(quizBrain.correctQuestion)
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBarView.progress = quizBrain.getProgress()
    }
}

