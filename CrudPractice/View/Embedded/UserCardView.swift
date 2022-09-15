//
//  UserCardView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct UserCardView: View {
    var name: String
    var education: String
    var phone: String
    
    var body: some View {
        HStack {
            ProfileImageView()
                .padding()
            
            VStack(spacing: 10){
                    HStack{
                        Text(name)
                            .font(.title)
                        Spacer()
                    }
                    
                    HStack{
                        Text(education)
                        Spacer()
                    }
                   
                    HStack{
                        Text(phone)
                        Spacer()
                    }

                }
        }
            .frame(height: 150)
            .background(.white)
            .cornerRadius(10)
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(name: "John", education: "University of West Florida", phone: "555-555-555")
    }
}
