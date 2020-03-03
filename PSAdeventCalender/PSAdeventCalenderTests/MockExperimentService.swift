//
//  MockExperimentService.swift
//  PSAdeventCalenderTests
//
//  Created by Abdul Basit on 03/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
@testable import PSAdeventCalender

final class MockExperimentService: ExperimentServiceType {
    
    var stubs: [ExperimentKey: Bool] = [:]
    func experiment(for key: ExperimentKey, value: Bool) {
        stubs[key] = value
    }
    
    func experiment(for key: ExperimentKey) -> Bool {
        return stubs[key] ?? false
    }
}
