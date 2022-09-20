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
                
                VStack(spacing: 0){
                    //Background Bar Top
                    BackgroundBarView()
                        .shadow(color: .gray, radius: 1, x: 0, y: 4)
                    
                    //Grid View and Alert Message
                    if usersViewModel.getUsersDataFlag{
                        //Grid of User Cards
                        UserCardGridView(users: $usersViewModel.users)
                            
                    }
                    else{
                        Spacer()
                        
                        //Alert Message
                        Text("Failed to load users.")
                            .font(.title)
                            .bold()
                        
                        //Retry Button
                        CustomButtonView(image: "arrow.clockwise", label: "Retry")
                            .onTapGesture {
                                usersViewModel.getUsers()
                            }
                        
                        Spacer()
                    }

                    //Background Bar Bottom
                    BackgroundBarView()
                    
                } // VStack
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
.previewInterfaceOrientation(.portrait)
    }
}
