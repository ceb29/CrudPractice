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
            //Safe Area
            Color(.red)
                .ignoresSafeArea()
            
            //Center color
            Color("LightBrown")
                .edgesIgnoringSafeArea(.horizontal)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
.previewInterfaceOrientation(.landscapeRight)
    }
}
