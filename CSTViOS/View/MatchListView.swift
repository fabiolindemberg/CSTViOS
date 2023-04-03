//
//  MatchListView.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

struct MatchListView: View {
    @ObservedObject var viewModel: MatchViewModel

    var body: some View {
        VStack {
            if !viewModel.loadingFirstPage {
                List($viewModel.matches) { $match in
                    MatchCardView(match: $match, onClick: {
                        viewModel.select(match: match)
                    })
                    .navigationDestination(isPresented: $viewModel.showDetailView, destination: {
                        if let playersViewModel = viewModel.playersViewModel {
                            MatchDetailView(viewModel: playersViewModel)
                        }
                    })
                    .listRowBackground(Color("primary-background"))
                    .listRowSeparator(.hidden)
                    .onAppear {
                        if viewModel.isTheLast(match: match) {
                            Task {
                                await viewModel.loadMoreMatches()
                            }
                        }
                    }
                }
                .listStyle(.inset)
                .scrollContentBackground (.hidden)
                .background(Color("primary-background"))
                
                if viewModel.loadingMoreMatches {
                    ProgressView()
                        .scaleEffect(1.4125)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            } else {
                ZStack {
                    Color("primary-background")
                    ProgressView()
                        .scaleEffect(1.4125)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .alert(isPresented: $viewModel.presentErrorMessage, content: {
            Alert(title: Text(viewModel.errorInfo?.title ?? ""),
                  message: Text(viewModel.errorInfo?.message ?? ""))
        })
        .background(Color("primary-background"))
        .navigationTitle(Constants.Views.matchesTitle)
        .navigationBarTitleDisplayMode(.large)
        .task {
            await viewModel.initialLoadMatches()
        }
        .refreshable {
            await viewModel.initialLoadMatches()
        }
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView(viewModel: MatchViewModel(service: ServiceMockSuccess()))
    }
}
