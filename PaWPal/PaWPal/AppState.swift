//
//  AppState.swift
//  PaWPal
//
//  Created by cs laptop on 9/25/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//


import Foundation
import FirebaseDatabase

class AppState: NSObject {
    
    static let emptySurvey: [String: AnyObject] =
        ["timestamp": "", // time when survey was submitted
        "where": "",
        "activity": "",
        "elseOptional": "",
        
        "enjoyment": 0,
        "concentration": 0,
        "gettingBetter": 0,
        "choice": 0,
        
        "challenge": 0,
        "skilled": 0,
        "succeeding": 0,
        "wishElse": 0,
        
        "interaction": Array(count: 5, repeatedValue: false),
        "howLong": "",
        
        "feeling": Array(count: 5, repeatedValue: 4.0),
        
        "strongEmotionsOptional": "",
        "elseMindOptional": ""
    ]
    
    static let sharedInstance = AppState()
    
    var userName: String?
    var userEmail: String?
    var uid: String?
    var school: String?
    var wakeTime: String?
    var sleepTime: String?
    var closestScheduledNotification: String?
    var furthestScheduledNotification: String?
    var dailySurveyCount = 0
    var totalSurveyCount = 0
    var databaseRef = FIRDatabase.database().reference()
    var surveyList:[String:AnyObject] = emptySurvey
}
