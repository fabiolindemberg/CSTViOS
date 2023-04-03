//
//  SplashScreenView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color("primary-background")
            Image("fuze-logo")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
