//
//  ProfileImageView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 70, height: 70)
            .foregroundColor(.gray)
            .padding()
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
