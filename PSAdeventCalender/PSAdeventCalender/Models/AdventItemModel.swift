//
//  AdventItemModel.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
import SwiftUI

struct AdventItemModel: Decodable, Hashable, Identifiable {
    var id: Int64
    var title: String?
    var image: String?
    var announcementTitle: String?
    var annouchmentMessage: String?
}
