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
        List{
            ForEach(usersViewModel.users, id: \.self){user in
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
                .padding()
            }
        }
        .overlay(
            AddButtonView()
                .padding()
            , alignment: .bottomTrailing
        )
        .onAppear {usersViewModel.getUsers()}
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
