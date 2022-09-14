//
//  AddUserView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct AddUserView: View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var users : [String] = []
    
    var body: some View {
        ZStack {
            //Background Color
            LinearGradient(colors: [Color("BlueBackground"), Color("LightBlueBackground")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                VStack(){
                    // TextFields
                    HStack {
                        Text("First Name")
                            .frame(maxWidth: 100)
                        
                        TextField("", text: $firstName)
                            .padding(8)
                            .border(.black)
                        
                    }
                    HStack {
                        Text("Last Name")
                            .frame(maxWidth: 100)
                        
                        TextField("", text: $lastName)
                            .padding(8)
                            .border(.black)
                    }
                    
                        
                    //Add and Save Buttons
                    HStack(){
                        Button("add"){
                            users.append(firstName + " " + lastName)
                        }
                        .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button("save"){
                            print("saved")
                        }
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }// HStack
                    HStack(){
                        Text("List of Names")
                            .bold()
                        Spacer()
                    }
                    List{
                        ForEach(users, id: \.self){user in
                            Text(user)
                        }
                    }
                    .cornerRadius(10)
                } //VStack
                    //.frame(maxHeight: 300)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            } //VStack
            .padding()
                
        } // ZStack
        
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
