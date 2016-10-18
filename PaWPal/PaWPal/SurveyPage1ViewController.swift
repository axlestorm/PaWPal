//
//  SurveyPage1ViewController.swift
//  PaWPal
//
//  Created by Tiffany Fong on 9/27/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import UIKit

class SurveyPage1ViewController: UIViewController {
    var temp1: TextQuestion!
    var temp2: TextQuestion!
    var temp3: TextQuestion!
    
    @IBAction func next(sender: UIButton) {
        // save data TODO - make required vs optional
        DatabaseController.updateText("where", question: temp1)
        DatabaseController.updateText("activity", question: temp2)
        DatabaseController.updateText("elseOptional", question: temp2)
        
        //submit survey - TODO notification for do you want to submit?
        
    }

    func displayQuestions(){
        
        // create the stack view
        let stackView = UIStackView()
        stackView.axis = .Vertical
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // add questions to the stack view
        if let textQ1 = NSBundle.mainBundle().loadNibNamed("TextQuestion", owner: self, options: nil).first as? TextQuestion {
            temp1 = textQ1
            stackView.addArrangedSubview(textQ1)
            textQ1.promptLabel.text = "Where were you?"
        }
        
        if let textQ2 = NSBundle.mainBundle().loadNibNamed("TextQuestion", owner: self, options: nil).first as? TextQuestion {
            temp2 = textQ2
            stackView.addArrangedSubview(textQ2)
            textQ2.promptLabel.text = "What was the main thing you were doing? "
        }
        
        if let textQ3 = NSBundle.mainBundle().loadNibNamed("TextQuestion", owner: self, options: nil).first as? TextQuestion {
            temp3 = textQ3
            stackView.addArrangedSubview(textQ3)
            textQ3.promptLabel.text = "(Optional) What else were you doing?"
        }
        
        view.addSubview(stackView)
        
        //autolayout the stack view - pin 30 up 20 left 20 right 100 down
        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[stackView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[stackView]-100-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
        view.addConstraints(stackView_H)
        view.addConstraints(stackView_V)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestions()
    }
}
