//
//  SaveNewUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

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
                    HStack {
                        Text("Name")
                            .frame(maxWidth: 100, alignment: .leading)
                        
                        TextField("", text: $saveNewUserViewModel.firstName)
                            .padding(8)
                            .border(.black)
                        
                    }
                    HStack {
                        Text("Occupation")
                            .frame(maxWidth: 100, alignment: .leading)
                        
                        TextField("", text: $saveNewUserViewModel.lastName)
                            .padding(8)
                            .border(.black)
                    }
                    HStack {
                        Text("Education")
                            .frame(maxWidth: 100, alignment: .leading)
                        
                        TextField("", text: $saveNewUserViewModel.lastName)
                            .padding(8)
                            .border(.black)
                    }
                    HStack {
                        Text("Phone")
                            .frame(maxWidth: 100, alignment: .leading)
                        
                        TextField("", text: $saveNewUserViewModel.lastName)
                            .padding(8)
                            .border(.black)
                    }
                    HStack {
                        Text("About")
                            .frame(maxWidth: 100, alignment: .leading)
                            
                        TextField("", text: $saveNewUserViewModel.lastName)
                            .padding(8)
                            .border(.black)
                    }
                    
                    //Alert Messages
                    if addUserViewModel.addUserFlag == true{
                        Text("Please fill in both fields")
                            .foregroundColor(.red)
                    }
                    
                    //Save Button
                    CustomButtonView(image: "square.and.arrow.down", label: "Save")
                    
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
    }
}
