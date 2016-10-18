//
//  UIViewController+DisplayAlert.swift
//  PaWPal
//
//  Created by Tiffany Fong on 9/17/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import Foundation
import UIKit

// This extension allows all view controllers within PaWPal to use methods like displayAlert

extension UIViewController {
    
    /*
     * displayAlert
     *
     * Params:
     *    title - String - text at top of alert
     *    message - String - main text of alert
     *    handler - function - what happens after you dismiss alert
     *
     * Usage:
     *    self.displayAlert("Alert", message: "Click ok to dismiss alert", handler: nil)
     *
     *    self.displayAlert("Dismiss VC", message: "Click ok to dismiss this view controller",
     *      handler: { action in
     *        self.dismissViewControllerAnimated(true, completion: nil)
     *      })
     */
    func displayAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "Ok", style: .Default, handler: handler)
        
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /*
     * displayYesNoAlert
     *
     * Params:
     *    title - String - text at top of alert
     *    message - String - main text of alert
     *    handler - function - what happens after you click "Yes"
     *
     * Usage:
     *    self.displayYesNoAlert("Alert", message: "Are you sure you want to submit?", yesHandler: submit)
     *
     * Note: Only "Yes" has a handler, "No" merely dismisses the alert
     */
    func displayYesNoAlert(title: String, message: String, yesHandler: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: yesHandler))
        
        alertController.addAction(UIAlertAction(title: "No", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
}