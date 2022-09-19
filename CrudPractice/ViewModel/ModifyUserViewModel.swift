//
//  ModifyUserViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class ModifyUserViewModel: UserFieldsViewModel, ObservableObject{
    @Published var user = UserModel(id: -1, name: "", occupation: "", education: "", phone: "", about: "")
    @Published var getUserDataFlag: Bool = true
    @Published var addUserFlag: Bool = false
    @Published var modifySuccessFlag: Bool = false
    
    func getUserData(id: Int){
        //get request for the current user id
        //could just pass data between views
        UsersAPIService.shared.getOneUser(id: id, comp: {[weak self] user in
            //check if data is nil
            guard user != nil else{
                print("failed to get users")
                DispatchQueue.main.async {
                    self?.getUserDataFlag = false
                }
                return
            }
            
            //update user fields
            DispatchQueue.main.async {
                self?.getUserDataFlag = true
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
}
