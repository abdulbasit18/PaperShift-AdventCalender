//
//  MainCalenderViewModelTests.swift
//  PSAdeventCalenderTests
//
//  Created by Abdul Basit on 03/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
import Combine
import XCTest
@testable import PSAdeventCalender

final class MainCalenderViewModelTests: XCTestCase {
    
    func test_updateRepositoriesWhenOnAppear() {
        let apiService = MockAPIService()
        apiService.stub(for: AdventCalenderListRequest.self) { _ in
            Result.Publisher(
                AdventCalenderListResponse(
                    items: [
                        .init(id: 0,
                              title: "test",
                              image: "test",
                              announcementTitle: "test",
                              annouchmentMessage: "test")
                    ]
                )
            ).eraseToAnyPublisher()
        }
        let viewModel = makeViewModel(apiService: apiService)
        viewModel.apply(.onAppear)
        XCTAssertTrue(!viewModel.calenderItems.isEmpty)
    }
    
    func test_serviceErrorWhenOnAppear() {
        let apiService = MockAPIService()
        apiService.stub(for: AdventCalenderListRequest.self) { _ in
            Result.Publisher(
                APIServiceError.responseError
            ).eraseToAnyPublisher()
        }
        let viewModel = makeViewModel(apiService: apiService)
        viewModel.apply(.onAppear)
        XCTAssertTrue(viewModel.isErrorShown)
    }
    
    func test_logListViewWhenOnAppear() {
        let trackerService = MockTrackerService()
        let viewModel = makeViewModel(trackerService: trackerService)
        
        viewModel.apply(.onAppear)
        XCTAssertTrue(trackerService.loggedTypes.contains(.gridView))
    }
    
    private func makeViewModel(
        apiService: APIServiceType = MockAPIService(),
        trackerService: TrackerType = MockTrackerService(),
        experimentService: ExperimentServiceType = MockExperimentService()
        ) -> MainCalenderViewModel {
        return MainCalenderViewModel(
            apiService: apiService,
            trackerService: trackerService,
            experimentService: experimentService
        )
    }
}
