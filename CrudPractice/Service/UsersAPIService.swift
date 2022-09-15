//
//  UsersAPIService.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

//to do:
//add comments
//pass errors in completion
//add missing methods for update, delete, and create
//add alerts if data fails to load in views
//add alerts for success (checkmarks in views)

import Foundation

class UsersAPIService{
    static var shared = UsersAPIService()
    
    private init(){
        
    }
    
    func getUsers(comp: @escaping ([UsersModel]?) -> ()){
        let urlRequest = URL(string: "http://localhost:3000/users")
        
        guard urlRequest != nil else{
            print("url is nil")
            return
        }
        
        let datask = URLSession.shared.dataTask(with: urlRequest!, completionHandler: {data, response, error in
            guard data != nil else{
                print("data is nil")
                return
            }
            
            guard error == nil else{
                print("error during datask")
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
                let users = try decoder.decode([UsersModel].self, from: data!)
                comp(users)
            }
            catch{
                print("decoder error")
                print(error)
            }
            
        })
        datask.resume()
    }
    
    func getOneUser(id: Int, comp: @escaping (UsersModel?) -> ()){
        let urlRequest = URL(string: "http://localhost:3000/users/" + String(id))
        
        guard urlRequest != nil else{
            print("url is nil")
            return
        }
        
        let datask = URLSession.shared.dataTask(with: urlRequest!, completionHandler: {data, response, error in
            guard data != nil else{
                print("data is nil")
                return
            }
            
            guard error == nil else{
                print("error during datask")
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
                let users = try decoder.decode(UsersModel.self, from: data!)
                comp(users)
            }
            catch{
                print("decoder error")
                print(error)
            }
            
        })
        datask.resume()
    }
    
    func addUser(body: [String: String]){
        
    }
    
    func updateUser(id: Int, body: [String : String]){
        
    }
    
    func deleteUser(id: Int){
        
    }
    
}
