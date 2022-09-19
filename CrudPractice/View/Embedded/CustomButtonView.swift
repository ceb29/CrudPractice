//
//  CustomButtonView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct CustomButtonView: View {
    var image: String
    var label: String
    
    var body: some View {
        //View used for all buttons
        HStack{
            //Icon
            Image(systemName: image)
            
            //Text
            Text(label)
        }// HStack
            .frame(width: 100, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 1, x: 0, y: 4)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(image: "checkmark", label: "Test")
    }
}
