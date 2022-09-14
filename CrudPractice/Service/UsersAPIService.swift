//
//  UsersAPIService.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import Foundation

class UsersAPIService{
    static var shared = UsersAPIService()
    
    private init(){
        
    }
    
    func getUsers(comp: @escaping (UsersModel?) -> ()){
        let urlRequest = URL(string: "https://3c973fab-8504-45ac-a455-20fbb351edd0.mock.pstmn.io/test1")
        
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
    
}
