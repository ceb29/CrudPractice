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
        NavigationView {
            ZStack {
                //Background Color
                BackgroundView()
                
                if usersViewModel.getUsersDataFlag{
                    //Grid of User Cards
                    UserCardGridView(users: $usersViewModel.users)
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                }
                else{
                    VStack{
                        //Alert Message
                        Text("Failed to load users.")
                            .font(.title)
                            .bold()
                        
                        //Retry Button
                        CustomButtonView(image: "arrow.clockwise", label: "Retry")
                            .onTapGesture {
                                usersViewModel.getUsers()
                            }
                    }// VStack
                }
            } // ZStack
                .onAppear {usersViewModel.getUsers()}
                .navigationBarTitleDisplayMode(.inline)
        }// NavigationView
            .navigationViewStyle(.stack)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
