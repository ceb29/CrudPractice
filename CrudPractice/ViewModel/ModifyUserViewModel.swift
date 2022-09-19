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
        //get request for the current user id
        //could just pass data between views
        UsersAPIService.shared.getOneUser(id: id, comp: {[weak self] user in
            //check if data is nil
            guard user != nil else{
                print("failed to get users")
                return
            }
            
            //update user fields
            DispatchQueue.main.async {
                self?.user = user!
            }
        })
    }
    
    func deleteUser(usera: UserModel){
        //delete API call
        //print("user id to delete here: ", id)
        //let parameters : [String: Any] = ["id": id]
        print("user to delete, ", usera)
        UsersAPIService.shared.deleteUser(user: usera)
    }
    
    func updateUser(){
        //method for modifying user with put request
        
        //create new var with NewUserModel type for api method
        let updatedUser = NewUserModel(name: user.name, occupation: user.occupation, education: user.education, phone: user.phone, about: user.about)
        
        //check if fields are blank and set addUserFlag if they are blank
        //then use api call to update user
        //set modifySuccessFlag if api call was successful
        if checkUserFields(user: updatedUser){
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
