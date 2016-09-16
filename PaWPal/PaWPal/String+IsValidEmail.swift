//
//  String+IsValidEmail.swift
//  PaWPal
//
//  Created by Tiffany Fong on 9/14/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import Foundation

// Class extensions allow functions like isValidEmail to be used in multiple files within PaWPal

// Usage: 
// "someemail@email.com".isValidEmail() --> true
// "notanemail".isValidEmail() --> false
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
}