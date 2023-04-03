//
//  MatchCardView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

struct MatchCardView: View {
    @Binding var match: Match
    var onClick: (()->())?
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(match.status != .running ? match.beginAt.shortDateTime : "agora")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 20, leading: 4, bottom: 10, trailing: 15))
                    .background(match.status == .running ? Color("badge-running") : Color("badge-not-running"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .offset(x: 10, y: -10)
            }

            HStack(alignment: .top) {
                TeamView(team: match.teamOne)
                    .padding(.trailing, 24)
                
                Text("vs")
                    .offset(y: 20)
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.5))
                
                TeamView(team: match.teamTwo)
                    .padding(.leading, 24)
            }
            .padding(.all, 24)
            
            Divider()
                .background(Color.white.opacity(0.5))
            
            HStack {
                AsyncImage(url: match.league.imageUrl?.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Circle()
                }
                .frame(width: 20, height: 20)
                
                Text(match.leaguePlusSerie)
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                Spacer()
            }
            .padding()
        }
        .background(Color("secondary-background"))
        .onTapGesture {
            onClick?()
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct MatchCardView_Previews: PreviewProvider {
    static var previews: some View {
        MatchCardView(match: .constant(matchMock))
    }
}
