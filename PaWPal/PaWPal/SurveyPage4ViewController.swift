//
//  SurveyPage4ViewController.swift
//  PaWPal
//
//  Created by Doren Lan on 10/4/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import UIKit

class SurveyPage4ViewController: UIViewController {
    var q1: MultiCheckQuestion!
    var q2: TextQuestion!
    
    @IBAction func save(sender: UIButton) {
        for q in [q1, q2] {
            DatabaseController.updateAnswer(q)
        }
    }
    
    @IBAction func next(sender: UIButton) {
        // require positive numerical answer
        guard let textAnswer = q2.answerTextField.text, let num = Float(textAnswer)
            where num > 0 else {
                self.displayAlert("Hello", message: "Please enter a positive number :)", handler: nil)
                return
        }
        save(sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create questions
        q1 = MultiCheckQuestion.create("Who were you with? (Check all that apply)",
                                       key: "interaction")
        q2 = TextQuestion.create("How many hours have you been doing this activity? (in hours)",
                                 key: "howLong", placeHolder: "", required: true)
        // for numerical answers
        q2.answerTextField.keyboardType = .NumberPad
        
        self.displayQuestions([q1, q2], distribution: .FillProportionally)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}