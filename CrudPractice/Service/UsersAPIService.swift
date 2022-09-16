//
//  UsersAPIService.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

//to do:
//add comments
//pass errors in completion
//add missing methods for update and delete
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
    
    //need to add custom type to return status in completion
    func addUser(user: NewUserModel, comp: @escaping (Bool) -> ()){
        var status: Bool = false
        do{
            let userData = try JSONEncoder().encode(user)
            let url = URL(string: "http://localhost:3000/users")
            
            guard url != nil else{
                print("url nil")
                comp(status)
                return
            }
            
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "Post"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: userData){data, response, error in
                guard error == nil else{
                    print("error during upload task")
                    comp(status)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else{
                    print("no response")
                    comp(status)
                    return
                }
                
                guard response.statusCode > 199, response.statusCode < 300 else{
                    print("error with server")
                    print(response.statusCode)
                    comp(status)
                    return
                }
                
                if response.mimeType != nil && response.mimeType == "application/json"{
                    if data != nil{
                        let dataReturned = String(data: data!, encoding: .utf8)
                        guard dataReturned != nil else{
                            print("failed to convert data")
                            comp(status) //need to add enumeration for different status cases
                            return
                        }
                        print("Post data: " + dataReturned!)
                    }
                    else{
                        print("no data returned from post")
                    }
                }
                status = true
                comp(status)
            }
            uploadTask.resume()
        }
        catch{
            print("json encoder error")
            comp(status)
        }
    }
    
    func updateUser(user: UsersModel, comp: @escaping (Bool) -> ()){
        //Note:
        //need to add the upload task to its own func
        //only difference between this and save is url and request type
        var status: Bool = false
        do{
            let userData = try JSONEncoder().encode(user)
            let url = URL(string: "http://localhost:3000/users/" + String(user.id))
            
            guard url != nil else{
                print("url nil")
                comp(status)
                return
            }
            
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "Put"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: userData){data, response, error in
                guard error == nil else{
                    print("error during upload task")
                    comp(status)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else{
                    print("no response")
                    comp(status)
                    return
                }
                
                guard response.statusCode > 199, response.statusCode < 300 else{
                    print("error with server")
                    print(response.statusCode)
                    comp(status)
                    return
                }
                
                if response.mimeType != nil && response.mimeType == "application/json"{
                    if data != nil{
                        let dataReturned = String(data: data!, encoding: .utf8)
                        guard dataReturned != nil else{
                            print("failed to convert data")
                            comp(status) //need to add enumeration for different status cases
                            return
                        }
                        print("Post data: " + dataReturned!)
                    }
                    else{
                        print("no data returned from post")
                    }
                }
                status = true
                comp(status)
            }
            uploadTask.resume()
        }
        catch{
            print("json encoder error")
            comp(status)
        }
    }
    
    func deleteUser(user : UsersModel) {
        guard let url = URL(string: "http://localhost:3000/users/\(user.id)") else {
            print("url not found")
            return
        }

        let data = try? JSONEncoder().encode(user)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request){ data, res, error in
            if error != nil {
                print("error")
                return
            }
        }.resume()

    }
}
