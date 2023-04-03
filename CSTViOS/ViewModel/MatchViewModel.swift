//
//  MatchViewModel.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

@MainActor class MatchViewModel: ObservableObject, ViewModelProtocol {
    private var allMatches: [Match] = []
    private var fetchTask: Task<Void, Never>?
    private var service: ServiceProtocol?
    var playersViewModel: PlayersViewModel?
    @Published var matches: [Match] = []
    @Published var loading = false
    @Published var showDetailView = false
    @Published var presentErrorMessage: Bool = false
    var errorInfo: (title: String, message: String)? {
        didSet {
            self.presentErrorMessage = self.errorInfo != nil
        }
    }
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetch() async {
        guard !showDetailView else {
            return
        }
        
        guard let service = service else {
            return
        }
        
        fetchTask?.cancel()

        fetchTask = Task {
            self.loading = true
            
            let todaysMatchesResult = await service.fetchTodaysMatches()
            let futureMatchesResult = await service.fetchFutureMatches()
            
            switch todaysMatchesResult {
            case .success(let todaysMatches):
                allMatches = todaysMatches
                errorInfo = nil
                break
            case .failure(let error):
                handle(error: error)
                return
            }
            
            switch futureMatchesResult {
            case .success(let futureMatches):
                allMatches += futureMatches
                errorInfo = nil
                break
            case .failure(let error):
                handle(error: error)
                return
            }
            
            self.matches = self.allMatches
            self.loading = false
        }
    }
    
    func select(match: Match) {
        if self.playersViewModel == nil {
            self.playersViewModel = PlayersViewModel(service: Service(), match: match)
        } else if self.playersViewModel?.match.id != match.id {
            playersViewModel?.match = match
        }
        
        self.showDetailView = true
    }
}
