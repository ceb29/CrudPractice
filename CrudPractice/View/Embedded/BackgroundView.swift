//
//  BackgroundView.swift
//  CrudPractice
//
//  Created by admin on 9/14/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        //would be easier to just use an image as background
        ZStack{
            //Top and bottom color
            Color(.red)
                .ignoresSafeArea()
            
            //Center color
            Color("LightBrown")
                .ignoresSafeArea()
                .padding(.top, 20)
                .padding(.bottom, 40)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
