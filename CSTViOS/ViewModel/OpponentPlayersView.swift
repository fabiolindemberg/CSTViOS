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
                    
                    AsyncImage(url: URL(string: opponentPlayers.playerTeamOne?.imageUrl ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .aspectRatio(0.6, contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                            .foregroundColor(Color("placeholder-background"))

                    }
                    .frame(width: 60, height: 60)
                    
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

                    AsyncImage(url: URL(string: opponentPlayers.playerTeamTwo?.imageUrl ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .aspectRatio(0.6, contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                            .foregroundColor(Color("placeholder-background"))

                    }
                    .frame(width: 60, height: 60)

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
