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
        HStack {
            Text(label)
                .frame(maxWidth: 100, alignment: .leading)
            
            TextField("", text: $text)
                .padding(8)
                .border(.black)
        }
    }
}
