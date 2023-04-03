//
//  ImageView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI
import CachedAsyncImage

struct PlayerImageView: View {
    var url: URL?
    var squareSize: Double
    
    var body: some View {
        CachedAsyncImage(url: url) { image in
            image
                .resizable()
                .frame(width: squareSize, height: squareSize)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaledToFit()
        } placeholder: {
            Rectangle()
                .frame(width: squareSize, height: squareSize)
                .cornerRadius(10)
                .foregroundColor(Color("placeholder-background"))
            
        }
        .frame(width: squareSize, height: squareSize)
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerImageView(url: URL(string: opponentPlayersMock.playerTeamOne?.imageUrl ?? ""),
                  squareSize: 60)
    }
}
