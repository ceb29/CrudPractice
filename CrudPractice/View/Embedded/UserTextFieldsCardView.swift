//
//  UserTextFieldsCardView.swift
//  CrudPractice
//
//  Created by admin on 9/15/22.
//

import SwiftUI

struct UserTextFieldsCardView: View {
    @Binding var name: String
    @Binding var occupation: String
    @Binding var education: String
    @Binding var phone: String
    @Binding var about: String
    
    var body: some View {
        // TextFields
        UserTextFieldView(label: "Name", text: $name)

        UserTextFieldView(label: "Occupation", text: $occupation)
        
        HStack{
            Text("Education")
                .frame(minWidth: 100, alignment: .leading)
            TextEditor(text: $education)
                .border(.black)
        }
        
        UserTextFieldView(label: "Phone", text: $phone)
        
        HStack{
            Text("About")
                .frame(minWidth: 100, alignment: .leading)
            TextEditor(text: $about)
                .border(.black)
        }
    }
}
