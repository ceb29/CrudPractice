//
//  ModifyUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class ModifyUserViewModel: ObservableObject{
    @Published var user = UsersModel(id: -1, name: "", occupation: "", education: "", phone: "", about: "") //need to make a custom struct for this
    @Published var addUserFlag: Bool = false
    @Published var modifySuccessFlag: Bool = false
    
    func getUserData(id: Int){
        UsersAPIService.shared.getOneUser(id: id, comp: {[weak self] data in
            guard data != nil else{
                print("failed to get users")
                return
            }
            
            let usersData = data!
            
            DispatchQueue.main.async {
                self?.user = usersData
            }
        })
    }
    
    func deleteUser(usera: UsersModel){
        //need to make delete API call
        //print("user id to delete here: ", id)
        //let parameters : [String: Any] = ["id": id]
        print("user to delete, ", usera)
        UsersAPIService.shared.deleteUser(user: usera)
    }
    
    func updateUser(){
        //need to make update API call
        if checkFieldNotEmpty(text: user.name) && checkFieldNotEmpty(text: user.occupation) &&  checkFieldNotEmpty(text: user.education) &&  checkFieldNotEmpty(text: user.phone) && checkFieldNotEmpty(text: user.about){
            UsersAPIService.shared.updateUser(user: user, comp: {[weak self] status in
                DispatchQueue.main.async {
                    self?.modifySuccessFlag = status
                }
            })
            addUserFlag = false
        }
        else{
            addUserFlag = true
        }
    }
    
    //need to fix this duplicate code
    func checkFieldNotEmpty(text: String) -> Bool{
        if text == ""{
            return false
        }
        return true
    }
}
