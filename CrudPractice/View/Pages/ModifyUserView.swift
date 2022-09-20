//
//  ModifyUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

//need to figure out change texteditor alignment when screen is small
import SwiftUI

struct ModifyUserView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var userID: Int
    @State private var showingAlert = false
    @StateObject var modifyUserViewModel = ModifyUserViewModel()
    
    var body: some View {
        ZStack{
            //Background Color
            BackgroundView()
            
            VStack(spacing: 0){
                //Background Bar top
                BackgroundBarView()
                    .shadow(color: .gray, radius: 1, x: 0, y: 4)

                //User card and alert messages
                if modifyUserViewModel.getUserDataFlag{
                    VStack(){
                        //Profile Image
                        ProfileImageView()
                            .padding(.vertical)
                            
                        // TextFields
                        UserTextFieldsCardView(name: $modifyUserViewModel.user.name, occupation: $modifyUserViewModel.user.occupation, education: $modifyUserViewModel.user.education, phone: $modifyUserViewModel.user.phone, about: $modifyUserViewModel.user.about)
                            .padding(.horizontal)

                        //Alert Messages
                        if modifyUserViewModel.addUserFlag == true{
                            Text("Please fill in all fields")
                                .foregroundColor(.red)
                        }
                        
                        if modifyUserViewModel.modifySuccessFlag == true{
                            Text("User has been successfully modified")
                        }
                        
                        Spacer()
                        
                        //Modify and Delete Buttons
                        HStack(spacing: 40){
                            //need to add alert view for update instead of text
                            CustomButtonView(image: "pencil", label: "Modify")
                                .onTapGesture {
                                    modifyUserViewModel.updateUser()
                                }
                            
                            CustomButtonView(image: "trash.fill", label: "Delete")
                                .onTapGesture {
                                    showingAlert = true
                                }
                                .alert("Delete Item?", isPresented: $showingAlert){
                                    Button("Yes"){
                                        modifyUserViewModel.deleteUser(usera: modifyUserViewModel.user)
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    Button("No"){}
                                }
                        }// HStack
                            .padding()

                    } // VStack
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 1, x: 0, y: 4)
                        .padding(.vertical, UIScreen.main.bounds.size.height/10)
                        .padding(.horizontal, UIScreen.main.bounds.size.height/20)
                }
                else{
                    Spacer()
                    
                    //Alert Message
                    Text("Failed to load user.")
                        .font(.title)
                        .bold()
                    
                    //Retry Button
                    CustomButtonView(image: "arrow.clockwise", label: "Retry")
                        .onTapGesture {
                            modifyUserViewModel.getUserData(id: userID)
                            }
                    
                    Spacer()
                }

                //Background Bar Bottom
                BackgroundBarView()
                
            }// VStack
            
        }// ZStack
            .onAppear {modifyUserViewModel.getUserData(id: userID)}
    }
}

//struct ModifyUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModifyUserView(userID: 0, rootPresenting: false)
//.previewInterfaceOrientation(.portraitUpsideDown)
//    }
//}
