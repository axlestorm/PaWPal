//
//  SurveyViewController.swift
//  PaWPal
//
//  Created by cs laptop on 9/9/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import UIKit


class SurveyViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

class Survey{
    //make this into an array of question arrays (one per survey page)
    var questions = [Question]()
}

class Question{
    var questionType = ""
    var questionPrompt = ""
   
    var answerType = ""
    //ex. slider, text, check boxes, multiple sliders
}

