//
//  AdventCalenderListRequest.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation

struct AdventCalenderListRequest: APIRequestType {
    typealias Response = AdventCalenderListResponse
    var path: String { return "/bins/9cg0m" }
    var queryItems: [URLQueryItem]?
}
