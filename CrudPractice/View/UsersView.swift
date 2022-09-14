//
//  UsersView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersViewModel = UsersViewModel()
    var body: some View {
        
        ZStack {
            Color(.red)
                .ignoresSafeArea()
            VStack {
                List{
                    ForEach(usersViewModel.users, id: \.self){user in
                        Section{
                            VStack{
                                HStack{
                                    Text("First Name: ")
                                    Text(user.firstName)
                                    Spacer()
                                }
                                HStack{
                                    Text("Last Name: ")
                                    Text(user.lastName)
                                    Spacer()
                                }
                            }
                            .frame(height: 50)
                            .padding()
                        }
                       
                    }
                    
                    //.listRowBackground(Color(.blue))
                }
                .background(.blue)
                .overlay(
                    AddButtonView()
                        .padding()
                    , alignment: .bottomTrailing
                )
            .onAppear {usersViewModel.getUsers()}
            }
            .padding(.top, 50)
            .padding(.bottom, 50)
            
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
