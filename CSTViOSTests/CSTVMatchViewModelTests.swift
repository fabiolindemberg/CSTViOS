//
//  CSTVMatchViewModelTests.swift
//  CSTViOSTests
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import XCTest

final class CSTVMatchViewModelTests: XCTestCase {
    var viewModel: MatchViewModel?
    var matches: [Match]?
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = MatchViewModel(service: ServiceMockSuccess())

        if let data = mockJson.data(using: .utf8) {
            matches = try? JSONDecoder().customDecoder.decode([Match].self, from: data)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    @MainActor func testInitialLoadMatches() async throws {
        await viewModel?.initialLoadMatches()
        XCTAssertEqual(viewModel?.matches.count ?? 0, 1, accuracy: 1)
    }

    @MainActor func testLoadMoreMatches() async throws {
        await viewModel?.initialLoadMatches()
        await viewModel?.loadMoreMatches()
        XCTAssertEqual(viewModel?.matches.count ?? 0, 1, accuracy: 1)
    }

    @MainActor func testSelectMatch() async throws {
        guard let match = matches?.first else {
            XCTFail("A match is expected but nil was found")
            return
        }
        
        viewModel?.select(match: match)

        XCTAssertNotNil(viewModel?.playersViewModel)
        XCTAssertNotNil(viewModel?.playersViewModel?.match)
        XCTAssertTrue(viewModel?.showDetailView ?? false)
        XCTAssertEqual(viewModel?.playersViewModel?.match.id, match.id)
    }
    
    @MainActor func testIsTheLastPage() throws {
        if let match = viewModel?.matches.last {
            XCTAssertTrue(viewModel?.isTheLast(match: match) ?? false)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
