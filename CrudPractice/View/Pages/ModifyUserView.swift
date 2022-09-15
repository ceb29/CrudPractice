//
//  ModifyUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

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
                    UserTextFieldView(label: "Name", text: $modifyUserViewModel.user.name)
                    
                    
                    UserTextFieldView(label: "Occupation", text: $modifyUserViewModel.user.occupation)
                    HStack{
                        Text("Education")
                            .frame(minWidth: 100, alignment: .leading)
                        TextEditor(text: $modifyUserViewModel.user.education)
                            //.padding(8)
                            .border(.black)
                    }
                    
                    UserTextFieldView(label: "Phone", text: $modifyUserViewModel.user.phone)
                    HStack{
                        Text("About")
                            .frame(minWidth: 100, alignment: .leading)
                        TextEditor(text: $modifyUserViewModel.user.about)
                            //.padding(8)
                            .border(.black)
                    }
                    
                    
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
                                //modifyUserViewModel.deleteUser()
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
.previewInterfaceOrientation(.landscapeLeft)
    }
}
