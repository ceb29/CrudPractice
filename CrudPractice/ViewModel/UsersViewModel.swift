//
//  UsersViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class UsersViewModel: ObservableObject{
    @Published var users: [UserModel] = []
    @Published var getUsersDataFlag: Bool = true
    
    func getUsers(){
        //get all users stored in database using a get request
        UsersAPIService.shared.getUsers(comp: {[weak self] usersData in
            //check if data is nil
            guard usersData != nil else{
                print("failed to get users")
                DispatchQueue.main.async {
                    self?.getUsersDataFlag = false
                }
                return
            }
           
            DispatchQueue.main.async {
                self?.getUsersDataFlag = true
                self?.users = usersData!
            }
        })
    }
}
