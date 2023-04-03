//
//  TeamView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI
import CachedAsyncImage

struct TeamView: View {
    var team: Team?
    
    var body: some View {
        VStack(alignment: .center) {
            CachedAsyncImage(url: URL(string: team?.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Circle()
                    .foregroundColor(Color("placeholder-background"))

            }
            .frame(width: 60, height: 60)
        
            Text(team?.name ?? "")
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(team: matchMock.teamTwo)
    }
}
