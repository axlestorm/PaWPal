//
//  String+IsValidEmail.swift
//  PaWPal
//
//  Created by Tiffany Fong on 9/14/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import Foundation

// This extension allows all strings within PaWPal to use methods like isValidEmail

extension String {
    
    /* 
     * isValidEmail
     *
     * Usage:
     *     "valid@email.com".isValidEmail()
     *     "invalid".isValidEmail()
     *
     * Output: 
     *     Bool
     */
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
}