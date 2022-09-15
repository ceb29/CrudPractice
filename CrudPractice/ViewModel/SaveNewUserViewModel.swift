//
//  SaveNewUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class SaveNewUserViewModel: ObservableObject{
    @Published var user = UsersModel(id: -1, name: "", occupation: "", education: "", phone: "", about: "") //need to make a custom struct for this
    @Published var addUserFlag: Bool = false
    @Published var succesfullFlag: Bool = false

    func addUser(){
        if checkFieldNotEmpty(text: user.name) && checkFieldNotEmpty(text: user.occupation) &&  checkFieldNotEmpty(text: user.education) &&  checkFieldNotEmpty(text: user.phone) && checkFieldNotEmpty(text: user.about){
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

