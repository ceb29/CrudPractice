//
//  AddButtonView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.red)
                .frame(width: 80, height: 80)
                .shadow(color: .gray, radius: 1, x: 0, y: 4)
            Image(systemName: "person.badge.plus")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }
        
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
