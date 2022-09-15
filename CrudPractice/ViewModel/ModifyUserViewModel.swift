//
//  ModifyUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class ModifyUserViewModel: ObservableObject{
    @Published var user = User(id: -1, name: "", occupation: "", education: "", phone: "", about: "") //need to make a custom struct for this
    @Published var addUserFlag: Bool = false
    @Published var succesfullFlag: Bool = false
    
    func getUserData(id: Int){
        UsersAPIService.shared.getUsers(comp: {[weak self] data in
            guard data != nil else{
                print("failed to get users")
                return
            }
            
            let usersData = data!.users
            
            DispatchQueue.main.async {
                self?.user = usersData[id]
            }
        })
    }
    
    func deleteUser(){
        //need to make delete API call
    }
    
    func updateUser(){
        //need to make update API call
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
