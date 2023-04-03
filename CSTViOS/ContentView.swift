//
//  ContentView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 02/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSplashScreen = true

    var body: some View {
        ZStack {
            if showSplashScreen {
                SplashScreenView()
            } else {
                NavigationStack {
                    MatchListView(viewModel: MatchViewModel(service: Service()))
                }
                .edgesIgnoringSafeArea(.all)
                .accentColor(.white)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showSplashScreen = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
