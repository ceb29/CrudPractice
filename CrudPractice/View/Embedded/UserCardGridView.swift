//
//  UserCardGridView.swift
//  CrudPractice
//
//  Created by admin on 9/19/22.
//

import SwiftUI

struct UserCardGridView: View {
    @Binding var users : [UserModel]
    private let columns = [GridItem(.adaptive(minimum: 300))]
    
    var body: some View {
        //Scrollabel grid of user cards
        ScrollView{
            LazyVGrid(columns: columns, spacing: 25){
                ForEach(users, id: \.self){user in
                    NavigationLink(destination: ModifyUserView(userID: user.id)){
                        UserCardView(name: user.name, education: user.education, phone: user.phone)
                    }
                    .foregroundColor(.black)
                }
                .shadow(color: .gray, radius: 1, x: 0, y: 4)
            }
            .padding()
        } // ScrollView
            .overlay(
                NavigationLink(destination: SaveNewUserView()){
                    AddButtonView()
                        .padding()
                }
                , alignment: .bottomTrailing
            )
    }
}


