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
            
            VStack{
                VStack(){
                    //Profile Image
                    ProfileImageView()
                    
                    // TextFields
                    UserTextFieldView(label: "Name", text: $saveNewUserViewModel.user.name)
                    UserTextFieldView(label: "Occupation", text: $saveNewUserViewModel.user.occupation)
                    UserTextFieldView(label: "Education", text: $saveNewUserViewModel.user.education)
                    UserTextFieldView(label: "Phone", text: $saveNewUserViewModel.user.phone)
                    UserTextFieldView(label: "About", text: $saveNewUserViewModel.user.about)
                    
                    //Alert Messages
                    if saveNewUserViewModel.addUserFlag == true{
                        Text("Please fill in both fields")
                            .foregroundColor(.red)
                    }
                    
                    //Save Button
                    CustomButtonView(image: "square.and.arrow.down", label: "Save")
                        .onTapGesture {
                            print("save")
                            //saveNewUserViewModel.addUser()
                        }
                    
                } //VStack
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            } //VStack
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
