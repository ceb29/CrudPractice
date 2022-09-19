//
//  UserTextFieldsViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/19/22.
//

import Foundation

class UserFieldsViewModel{
    //could add regex for each text field into this class
    
    func checkUserFields(user: NewUserModel) -> Bool{
        //method to check if user fields are blank
        //returns true if fields are not blank
        if checkFieldNotEmpty(text: user.name) && checkFieldNotEmpty(text: user.occupation) &&  checkFieldNotEmpty(text: user.education) &&  checkFieldNotEmpty(text: user.phone) && checkFieldNotEmpty(text: user.about){
            return true
        }
        return false
    }
    
    func checkFieldNotEmpty(text: String) -> Bool{
        //method to check if a single field is blank
        //return true if not blank
        if text == ""{
            return false
        }
        return true
    }
}
