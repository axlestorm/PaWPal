//
//  SurveyPage4ViewController.swift
//  PaWPal
//
//  Created by Doren Lan on 10/4/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import UIKit

class SurveyPage4ViewController: UIViewController, AutoCompleteTextFieldDataSource, AutoCompleteTextFieldDelegate {
    var q1: MultiCheckQuestion!
    var q2: TextQuestion!
    
    var activityLength: [String] = ["1 hour", "20 minutes"]
    
    var autoCompleteDictionary = [AutoCompleteTextField: [String]]()
    
    @IBAction func save(sender: UIButton) {
        DatabaseController.updateMultiCheck("interaction", question: q1)
        DatabaseController.updateText("howLong", question: q2)
    }
    
    @IBAction func next(sender: UIButton) {
        // require that text fields be complete
        guard let textAnswer = q2.answerTextField.text
            where !textAnswer.isEmpty else {
                self.displayAlert("Hello", message: "Please fill in all required fields :)", handler: nil)
                return
        }
        save(sender)
    }
    
    func displayQuestions(){
        
        // create the stack view
        let stackView = UIStackView()
        stackView.axis = .Vertical
        stackView.distribution = .FillProportionally
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // add questions to view
        q1 = MultiCheckQuestion.addToSurvey("Who were you with? (Check all that apply)", key: "interaction", stackView: stackView)
        q2 = TextQuestion.addToSurvey("How long had you been doing this activity for?", key: "howLong", stackView: stackView, placeHolder: "")
        
        view.addSubview(stackView)
        
        //autolayout the stack view - pin 30 up 20 left 20 right 100 down
        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[stackView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[stackView]-100-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
        view.addConstraints(stackView_H)
        view.addConstraints(stackView_V)
        
        autoCompleteDictionary = [q2.answerTextField: activityLength]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestions()
        
        q2.answerTextField.autoCompleteTextFieldDataSource = self
        q2.answerTextField.showAutoCompleteButton(autoCompleteButtonViewMode: .WhileEditing)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func autoCompleteTextFieldDataSource(autoCompleteTextField: AutoCompleteTextField) -> [String] {
        
        return autoCompleteDictionary[autoCompleteTextField]!
    }
}