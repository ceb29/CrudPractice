//
//  UsersView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersViewModel = UsersViewModel()
    let columns = [GridItem(.adaptive(minimum: 300))]
    
    var body: some View {
        NavigationView {
            ZStack {
                //Background Color
                BackgroundView()
                
                //Grid of User Cards
                VStack {
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 25){
                            ForEach(usersViewModel.users, id: \.self){user in
                                UserCardView(name: user.name, education: user.education, phone: user.phone)
                            }
                            .shadow(color: .gray, radius: 1, x: 0, y: 4)
                        }
                        .padding()
                    }
                        .overlay(
                            NavigationLink(destination: SaveNewUserView()){
                                AddButtonView()
                                    .padding()
                            }
                            , alignment: .bottomTrailing
                        )
                        .onAppear {usersViewModel.getUsers()}
                }
                .padding(.top, 40)
                .padding(.bottom, 40)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
