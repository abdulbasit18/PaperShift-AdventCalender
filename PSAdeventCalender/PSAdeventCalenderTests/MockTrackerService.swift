//
//  MockTrackerService.swift
//  PSAdeventCalenderTests
//
//  Created by Abdul Basit on 03/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
@testable import PSAdeventCalender

final class MockTrackerService: TrackerType {
    
    private(set) var loggedTypes: [TrackEventType] = []
    
    func log(type: TrackEventType) {
        loggedTypes.append(type)
    }
}
