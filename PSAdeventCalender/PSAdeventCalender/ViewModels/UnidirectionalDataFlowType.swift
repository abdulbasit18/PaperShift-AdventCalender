//
//  UnidirectionalDataFlowType.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    func apply(_ input: InputType)
}

