//
//  NewUserModel.swift
//  CrudPractice
//
//  Created by admin on 9/15/22.
//

import Foundation

struct NewUserModel: Codable, Hashable{
    //var id : Int
    var name: String
    var occupation: String
    var education: String
    var phone: String
    var about: String
}
