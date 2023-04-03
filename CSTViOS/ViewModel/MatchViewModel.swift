//
//  MatchViewModel.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

@MainActor class MatchViewModel: ObservableObject, ViewModelProtocol {
    private var fetchTask: Task<Void, Never>?
    private var service: ServiceProtocol?
    private var page = 1
    private var perPage = 10
    private var pagesHasEnded = false
    var playersViewModel: PlayersViewModel?
    var loadingFirstPage: Bool {
        loading && page == 1
    }
    var loadingMore: Bool {
        loading && page > 1
    }
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
    
    func loadMore() async {
        guard !pagesHasEnded else {
            return
        }
        
        guard let service = service else {
            return
        }
        
        fetchTask?.cancel()
        fetchTask = Task {
            self.loading = true

            let futureMatchesResult = await service.fetchFutureMatches(page, perPage: perPage)
            
            page += 1
            
            switch futureMatchesResult {
            case .success(let futureMatches):
                pagesHasEnded = futureMatches.count < perPage
                matches += futureMatches
                errorInfo = nil
                break
            case .failure(let error):
                handle(error: error)
                return
            }
            
            self.loading = false
        }
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
            
            switch todaysMatchesResult {
            case .success(let todaysMatches):
                matches = todaysMatches
                await loadMore()
                errorInfo = nil
                break
            case .failure(let error):
                handle(error: error)
                return
            }

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
    
    func isTheLast(match: Match) -> Bool {
        match.id == matches.last?.id ?? 0
    }
}
