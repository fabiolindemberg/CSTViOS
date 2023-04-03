//
//  CSTVPlayersViewModelTests.swift
//  CSTViOSTests
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import XCTest

final class CSTVPlayersViewModelTests: XCTestCase {
    var viewModel: PlayersViewModel?

    @MainActor override func setUpWithError() throws {
        if let data = mockJson.data(using: .utf8) {
            let matches = try? JSONDecoder().customDecoder.decode([Match].self, from: data)
            
            if let match = matches?.first {
                viewModel = PlayersViewModel(service: ServiceMockSuccess(), match: match)
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testFetchPlayers() async throws {
        await viewModel?.fetchPlayers()
        XCTAssertEqual(viewModel?.opposingPlayers.count ?? 0, 1, accuracy: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
