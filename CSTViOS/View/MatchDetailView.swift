//
//  MatchDetailView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

struct MatchDetailView: View {
    @ObservedObject var viewModel: PlayersViewModel
    
    var body: some View {
        ZStack {
            Color("primary-background")
                .edgesIgnoringSafeArea(.all)
            if !viewModel.loading {
                VStack {
                    HStack(alignment: .top) {
                        HStack(alignment: .top) {
                            TeamView(team: viewModel.match.teamOne)
                                .padding(.trailing, 24)
                            
                            Text("vs")
                                .offset(y: 20)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.5))
                            
                            TeamView(team: viewModel.match.teamTwo)
                                .padding(.leading, 24)
                        }
                    }
                    .padding()
                    
                    Text(viewModel.match.beginAt.shortDateTime)
                        .foregroundColor(.white)
                        .padding()
                    
                    if !viewModel.opposingPlayers.isEmpty {
                        List($viewModel.opposingPlayers) { $opponentPlayers in
                            OpponentPlayersView(opponentPlayers: $opponentPlayers)
                                .listRowBackground(Color("primary-background"))
                        }
                        .listStyle(.plain)
                        .scrollContentBackground (.hidden)
                        .background(Color.clear)
                    .listRowSeparator(.hidden)
                    } else {
                        Spacer()
                    }
                }
                .background(Color("primary-background"))
            } else {
                ProgressView()
                    .scaleEffect(1.42)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
        .navigationTitle(viewModel.match.leaguePlusSerie)
        .navigationBarTitleDisplayMode(.inline)
        .task(id: viewModel.match.id) {
            await viewModel.fetchPlayers()
        }
    }
}

struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView(viewModel: PlayersViewModel(service: ServiceMockSuccess(), match: matchMock))
        MatchDetailView(viewModel: PlayersViewModel(service: ServiceMockFailure(), match: matchMock))
    }
}
