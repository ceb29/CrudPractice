//
//  ModifyUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

//need to figure out change texteditor alignment when screen is small
import SwiftUI

struct ModifyUserView: View {
    var userID: Int
    @StateObject var modifyUserViewModel = ModifyUserViewModel()
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack {
                VStack(){
                    //Profile Image
                    ProfileImageView()
                        
                    
                    // TextFields
                    UserTextFieldsCardView(name: $modifyUserViewModel.user.name, occupation: $modifyUserViewModel.user.occupation, education: $modifyUserViewModel.user.education, phone: $modifyUserViewModel.user.phone, about: $modifyUserViewModel.user.about)
                    
                    //Alert Messages
                    if modifyUserViewModel.addUserFlag == true{
                        Text("Please fill in both fields")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    //Modify and Delete Buttons
                    HStack(spacing: 40){
                        CustomButtonView(image: "pencil", label: "Modify")
                            .onTapGesture {
                                print("update")
                                //modifyUserViewModel.updateUser()
                            }
                        CustomButtonView(image: "trash.fill", label: "Delete")
                            .onTapGesture {
                                print("delete")
                                modifyUserViewModel.deleteUser(usera: modifyUserViewModel.user)
                            }
                    }
                    
                } //VStack
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            } //VStack
                .shadow(color: .gray, radius: 1, x: 0, y: 4)
                .padding([.top, .bottom], 120)
                .padding([.leading, .trailing], 40)
        }
        .onAppear {modifyUserViewModel.getUserData(id: userID)}
    }
}

struct ModifyUserView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyUserView(userID: 0)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
