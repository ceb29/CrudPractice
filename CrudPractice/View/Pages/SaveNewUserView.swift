//
//  SaveNewUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

//need to add more lines for textfields that are longer
import SwiftUI

struct SaveNewUserView: View {
    @StateObject var saveNewUserViewModel = SaveNewUserViewModel()
    
    var body: some View {
        ZStack {
            //Background Color
            BackgroundView()

            VStack(){
                //Profile Image
                ProfileImageView()
                    .padding(.vertical)
                
                // TextFields
                UserTextFieldsCardView(name: $saveNewUserViewModel.user.name, occupation: $saveNewUserViewModel.user.occupation, education: $saveNewUserViewModel.user.education, phone: $saveNewUserViewModel.user.phone, about: $saveNewUserViewModel.user.about)
                    .padding(.horizontal)
                
                //Alert Messages
                if saveNewUserViewModel.addUserFlag == true{
                    Text("Please fill in all fields")
                        .foregroundColor(.red)
                }
                
                if saveNewUserViewModel.successfullFlag == true{
                    Text("User successfully added")
                }
                
                //Save Button
                CustomButtonView(image: "square.and.arrow.down", label: "Save")
                    .onTapGesture {
                        print("save")
                        saveNewUserViewModel.addUser()
                    }
                    .padding(.vertical)
                
            } //VStack
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 1, x: 0, y: 4)
                .padding([.top, .bottom], 150)
                .padding([.leading, .trailing], 40)
        } // ZStack
    }
}

struct SaveNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNewUserView()
.previewInterfaceOrientation(.portrait)
    }
}
