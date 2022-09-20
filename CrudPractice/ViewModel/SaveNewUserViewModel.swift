//
//  SaveNewUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class SaveNewUserViewModel: UserFieldsViewModel, ObservableObject{
    @Published var user = NewUserModel(name: "", occupation: "", education: "", phone: "", about: "")
    @Published var addUserFlag: Bool = false
    @Published var statusFlag: Bool = false
    @Published var statusText: String = ""

    func addUser(){
        //method for adding a user using a post request
        
        //check if fields are blank and set addUserFlag if they are blank
        if checkUserFields(user: user){
            UsersAPIService.shared.uploadUserData(user: user, urlString: "http://localhost:3000/users/", requestType: "Post", comp: {[weak self] status in
                var statusText : String = ""
                
                if status{
                    statusText = "User successfully added"
                }
                else{
                    statusText = "Failed to add new user"
                }
                
                DispatchQueue.main.async {
                    self?.statusText = statusText
                    self?.statusFlag = true
                }
            })
            
            addUserFlag = false
        }
        else{
            addUserFlag = true
        }
    }
}

