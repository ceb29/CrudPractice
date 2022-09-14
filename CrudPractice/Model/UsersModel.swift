//
//  UserModel.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

struct UsersModel: Codable{
    var users: [User]
}

struct User: Codable, Hashable{
    var id : Int
    var firstName: String
    var lastName: String
}
