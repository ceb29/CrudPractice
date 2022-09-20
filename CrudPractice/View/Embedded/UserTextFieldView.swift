//
//  UserTextFieldView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct UserTextFieldView: View {
    var label: String
    @Binding var text: String
    
    var body: some View {
        //View used for single line text fields
        HStack {
            //Label
            Text(label)
                .frame(maxWidth: 100, alignment: .leading)
            
            //TextField
            TextField("", text: $text)
                .padding(.leading, 5)
                //.frame(minHeight: 28)
                .border(.black)
        }// HStack
    }
}
