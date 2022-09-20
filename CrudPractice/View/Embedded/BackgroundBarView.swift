//
//  BackgroundBarView.swift
//  CrudPractice
//
//  Created by admin on 9/19/22.
//

import SwiftUI

struct BackgroundBarView: View {
    var body: some View {
        Color(.red)
            .frame(height: UIScreen.main.bounds.size.height/20)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct BackgroundBarView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBarView()
    }
}
