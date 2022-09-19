//
//  ModifyUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class ModifyUserViewModel: ObservableObject{
    @Published var user = UserModel(id: -1, name: "", occupation: "", education: "", phone: "", about: "") //need to make a custom struct for this
    @Published var addUserFlag: Bool = false
    @Published var modifySuccessFlag: Bool = false
    
    func getUserData(id: Int){
        UsersAPIService.shared.getOneUser(id: id, comp: {[weak self] user in
            guard user != nil else{
                print("failed to get users")
                return
            }
            
            let userData = user!
            
            DispatchQueue.main.async {
                self?.user = userData
            }
        })
    }
    
    func deleteUser(usera: UserModel){
        //need to make delete API call
        //print("user id to delete here: ", id)
        //let parameters : [String: Any] = ["id": id]
        print("user to delete, ", usera)
        UsersAPIService.shared.deleteUser(user: usera)
    }
    
    func updateUser(){
        //need to make update API call
        let updatedUser = NewUserModel(name: user.name, occupation: user.occupation, education: user.education, phone: user.phone, about: user.about)
        
        if checkFieldNotEmpty(text: user.name) && checkFieldNotEmpty(text: user.occupation) &&  checkFieldNotEmpty(text: user.education) &&  checkFieldNotEmpty(text: user.phone) && checkFieldNotEmpty(text: user.about){
            
            UsersAPIService.shared.uploadUserData(user: updatedUser, urlString: "http://localhost:3000/users/\(user.id)", requestType: "Put", comp: {[weak self] status in
                
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
    
    func checkUserFields(user: UserModel){
        
    }
    
    //need to fix this duplicate code
    func checkFieldNotEmpty(text: String) -> Bool{
        if text == ""{
            return false
        }
        return true
    }
}
