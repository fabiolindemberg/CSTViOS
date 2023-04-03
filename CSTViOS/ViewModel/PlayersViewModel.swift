//
//  PlayersViewModel.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

@MainActor final class PlayersViewModel: ObservableObject, ViewModelProtocol {
    @Published var opposingPlayers: [OpponentPlayers] = []
    @Published var loading = false
    @Published var match: Match
    @Published var presentErrorMessage: Bool = false
    var errorInfo: (title: String, message: String)? {
        didSet {
            self.presentErrorMessage = self.errorInfo != nil
        }
    }

    private var service: ServiceProtocol
    
    init(service: ServiceProtocol, match: Match) {
        self.service = service
        self.match = match
    }
    
    /// Retrieve players from a given match through Service layer and stores them into variable "opposingPlayers"
    func fetchPlayers() async {
        defer {
            DispatchQueue.main.async {
                self.loading = false
            }
        }
        
        DispatchQueue.main.async {
            self.loading = true
        }

        let result = await service.fetchPlayers(matchId: match.id)
        
        switch result {
        case .success(let opponents):
                self.opposingPlayers = self.rearrangePlayersInTwoTeams(teamOne: opponents.opponents.first,
                                                                   teamTwo: opponents.opponents.last)
            break
        case .failure(let error):
            handle(error: error)
        }
    }
}

extension PlayersViewModel {
    /// Arrange the players of teams one and two in a suitable format
    private func rearrangePlayersInTwoTeams(teamOne: Team?, teamTwo: Team?) -> [OpponentPlayers] {
        guard let playersTeamOne = teamOne?.players,
              let playersTeamTwo = teamTwo?.players else {
            return []
        }
        
        let greaterPlayersCount = playersTeamOne.count >= playersTeamTwo.count ? playersTeamOne.count : playersTeamTwo.count
        
        var opponentsPlayers: [OpponentPlayers] = []
        
        for index in 0..<greaterPlayersCount {
            let playerTeamOne = index < playersTeamOne.count ? playersTeamOne[index] : nil
            let playerTeamTwo = index < playersTeamTwo.count ? playersTeamTwo[index] : nil
                
            opponentsPlayers.append(OpponentPlayers(playerTeamOne: playerTeamOne, playerTeamTwo: playerTeamTwo))
        }
        
        return opponentsPlayers
    }
}
