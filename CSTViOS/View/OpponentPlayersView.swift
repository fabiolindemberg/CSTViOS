//
//  OpponentPlayersView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

struct OpponentPlayersView: View {
    @Binding var opponentPlayers: OpponentPlayers
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("secondary-background"))
                    .cornerRadius(10)
                    .frame(width: 200, height: 60)
                HStack(alignment: .bottom) {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(opponentPlayers.playerTeamOne?.name ?? "N/A")
                            .font(.caption2)
                            .bold()
                            .lineLimit(1)
                            .foregroundColor(.white)
                        Text(opponentPlayers.playerTeamOne?.fullName ?? "N/A")
                            .font(.caption2)
                            .lineLimit(1)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    PlayerImageView(url: URL(string: opponentPlayers.playerTeamOne?.imageUrl ?? ""),
                              squareSize: 55)
                }
                .offset(x: -7, y: -8)
            }
            .offset(x: -10)

            ZStack {
                Rectangle()
                    .foregroundColor(Color("secondary-background"))
                    .cornerRadius(10)
                    .frame(width: 200, height: 60)
                HStack(alignment: .bottom) {

                    PlayerImageView(url: URL(string: opponentPlayers.playerTeamOne?.imageUrl ?? ""),
                              squareSize: 55)

                    VStack(alignment: .leading) {
                        Text(opponentPlayers.playerTeamTwo?.name ?? "N/A")
                            .font(.caption2)
                            .bold()
                            .lineLimit(1)
                            .foregroundColor(.white)
                        Text(opponentPlayers.playerTeamTwo?.fullName ?? "N/A")
                            .font(.caption2)
                            .lineLimit(1)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    Spacer()
                }
                .offset(x: 7, y: -8)
            }
            .offset(x: 10)
        }
        .background(Color("primary-background"))
    }
}

struct OpponentPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        OpponentPlayersView(opponentPlayers: .constant(opponentPlayersMock))
    }
}
