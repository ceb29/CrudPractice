//
//  SaveNewUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class SaveNewUserViewModel: ObservableObject{
    @Published var user = NewUserModel(name: "", occupation: "", education: "", phone: "", about: "")
    @Published var addUserFlag: Bool = false
    @Published var successfullFlag: Bool = false

    func addUser(){
        //method for adding a user using a post request
        
        //check if fields are blank and set addUserFlag if they are blank
        if checkUserFields(user: user){
            UsersAPIService.shared.uploadUserData(user: user, urlString: "http://localhost:3000/users/", requestType: "Post", comp: {[weak self] status in
                DispatchQueue.main.async {
                    self?.successfullFlag = true
                }
            })
            
            addUserFlag = false
        }
        else{
            addUserFlag = true
        }
    }
    
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

