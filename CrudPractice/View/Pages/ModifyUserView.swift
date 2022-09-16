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
            BackgroundView()
            
            VStack {
                VStack(){
                    //Profile Image
                    ProfileImageView()
                        
                    
                    // TextFields
                    UserTextFieldsCardView(name: $modifyUserViewModel.user.name, occupation: $modifyUserViewModel.user.occupation, education: $modifyUserViewModel.user.education, phone: $modifyUserViewModel.user.phone, about: $modifyUserViewModel.user.about)
                    
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

//struct ModifyUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModifyUserView(userID: 0, rootPresenting: false)
//.previewInterfaceOrientation(.portraitUpsideDown)
//    }
//}
