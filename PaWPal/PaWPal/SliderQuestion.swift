//
//  SliderQuestion.swift
//  PaWPal
//
//  Created by Tiffany Fong on 9/27/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import Foundation
import UIKit

class SliderQuestion: UIView {
    
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var answerSlider: UISlider!
    
    @IBAction func sliderMoved(sender: UISlider) {
        sender.setValue(Float(lroundf(answerSlider.value)), animated: true)
    }
}
