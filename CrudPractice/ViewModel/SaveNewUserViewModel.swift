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
        if checkFieldNotEmpty(text: user.name) && checkFieldNotEmpty(text: user.occupation) &&  checkFieldNotEmpty(text: user.education) &&  checkFieldNotEmpty(text: user.phone) && checkFieldNotEmpty(text: user.about){
            
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
    
    func checkFieldNotEmpty(text: String) -> Bool{
        if text == ""{
            return false
        }
        return true
    }
}

