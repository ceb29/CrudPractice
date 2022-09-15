//
//  SaveNewUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class AddUserViewModel: ObservableObject{
    @Published var users: [String] = []
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var addUserFlag : Bool = false
    
    func addUser(){
        if checkFieldNotEmpty(text: firstName) && checkFieldNotEmpty(text: lastName){
            users.append(firstName + " " + lastName)
            firstName = ""
            lastName = ""
            addUserFlag = false
        }
        else{
            addUserFlag = true
        }
    }
    
    func checkFieldNotEmpty(text: String) -> Bool{
        if text == ""{
            return false
        }
        return true
    }
}
