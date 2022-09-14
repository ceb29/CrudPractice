//
//  UsersViewModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class UsersViewModel: ObservableObject{
    @Published var users : [User] = []
    
    func getUsers(){
        UsersAPIService.shared.getUsers(comp: {[weak self] data in
            guard data != nil else{
                print("failed to get users")
                return
            }
            
            let usersData = data!.users
            
            DispatchQueue.main.async {
                self?.users = usersData
            }
        })
    }
}
