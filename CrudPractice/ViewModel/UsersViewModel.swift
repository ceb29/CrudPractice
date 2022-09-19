//
//  UsersViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class UsersViewModel: ObservableObject{
    @Published var users : [UserModel] = []
    
    func getUsers(){
        UsersAPIService.shared.getUsers(comp: {[weak self] usersData in
            guard usersData != nil else{
                print("failed to get users")
                return
            }
           
            DispatchQueue.main.async {
                self?.users = usersData!
            }
        })
    }
}
