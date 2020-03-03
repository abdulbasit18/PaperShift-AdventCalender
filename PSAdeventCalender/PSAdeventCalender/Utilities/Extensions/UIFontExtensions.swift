//
//  UIFontExtensions.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    static func appSemiBoldFontWith(size: CGFloat ) -> Font {
        return Font.custom("Lato-SemiboldItalic", size: size)
    }
    static func appRegularFontWith(size: CGFloat ) -> Font {
        return Font.custom("Lato-Regular", size: size)
    }
    static func appMediumFontWith(size: CGFloat ) -> Font {
        return Font.custom("Lato-Medium", size: size)
    }
    static func appItalicFontWith(size: CGFloat ) -> Font {
        return Font.custom("Lato-Italic", size: size)
    }
}
