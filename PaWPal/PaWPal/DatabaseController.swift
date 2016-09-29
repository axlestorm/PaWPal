//
//  DatabaseController.swift
//  PaWPal
//
//  Created by Doren Lan on 9/15/16.
//  Copyright © 2016 HMC CS121 Group 5. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class DatabaseController {
    
    static func signUp(userEmail: String, userPassword: String) {
        //TODO: check async stuff here
        FIRAuth.auth()?.createUserWithEmail(userEmail, password: userPassword) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let ref = FIRDatabase.database().reference()
            let key = (user! as FIRUser).uid
            let signUp = ["uid": (user! as FIRUser).uid,
                        "userName": userEmail,
                        "userEmail": userEmail,
                        "school": "",
                        "wakeTime": "",
                        "sleepTime": ""]
            let childUpdates = ["/users/\(key)": signUp]
            ref.updateChildValues(childUpdates)
        }
    }
    
    static func signIn(userEmail: String, userPassword: String, completion: () -> Void) {
        FIRAuth.auth()?.signInWithEmail(userEmail, password: userPassword) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            AppState.sharedInstance.email = userEmail
            AppState.sharedInstance.uid = (user! as FIRUser).uid
            AppState.sharedInstance.userName = userEmail
            AppState.sharedInstance.signedIn = true
            
            let ref = FIRDatabase.database().reference()
            ref.child("users").child(getUid()).observeSingleEventOfType(FIRDataEventType.Value, withBlock:{ (snapshot) in
                let value = snapshot.value as? NSDictionary
                if let name = value?["name"] { AppState.sharedInstance.userName = name as? String }
                if let school = value?["school"] { AppState.sharedInstance.school = school as? String }
                if let wakeTime = value?["wakeTime"] { AppState.sharedInstance.wakeTime = wakeTime as? String }
                if let sleepTime = value?["sleepTime"] { AppState.sharedInstance.sleepTime = sleepTime as? String }
                }
            )
        }
        completion()
    }
    
    //list of functions to access user info
    static func getEmail() -> String{
        if let email = AppState.sharedInstance.email { return email }
        else { return "" }
    }
    
    static func getName() -> String{
        if let userName = AppState.sharedInstance.userName { return userName }
        else { return "" }
    }
    
    static func getSchool() -> String{
        if let school = AppState.sharedInstance.school { return school }
        else { return "" }
    }
    
    static func getWakeTime() -> String {
        if let time = AppState.sharedInstance.wakeTime { return time }
        else { return "" }
    }
    
    static func getSleepTime() -> String {
        if let time = AppState.sharedInstance.sleepTime { return time }
        else { return "" }
    }
    
    static func getUid() -> String {
        if let uid = AppState.sharedInstance.uid { return uid }
        else { return "" }
    }
    
    //list of functions to set user info
    static func setEmail(userEmail: String){
        //TODO
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func setPassword(userPassword: String){
        //TODO
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func setName(userName: String){
        //TODO
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "userName")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func setSchool(userSchool: String){
        let ref = FIRDatabase.database().reference()
        ref.child("/users/\(getUid())/school").setValue(userSchool)
        AppState.sharedInstance.school = userSchool
    }
    
    static func setWakeTime(wakeTime: String) {
        let ref = FIRDatabase.database().reference()
        ref.child("/users/\(getUid())/wakeTime").setValue(wakeTime)
        AppState.sharedInstance.wakeTime = wakeTime
    }
    
    static func setSleepTime(sleepTime: String) {
        let ref = FIRDatabase.database().reference()
        ref.child("/users/\(getUid())/sleepTime").setValue(sleepTime)
        AppState.sharedInstance.sleepTime = sleepTime
    }
    
}