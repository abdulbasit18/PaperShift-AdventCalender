//
//  UIColorExtensions.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 03/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import SwiftUI

extension Color {
    static var backgroundGradient: LinearGradient {
      let gradient = Gradient(colors: [
        Color(red: 81/255.0, green: 171/255.0, blue: 142/255.0),
        Color(red: 214/255.0, green: 86/255.0, blue: 100/255.0)
      ])
      return LinearGradient(gradient: gradient,
                            startPoint: .top,
                            endPoint: .bottom)
    }
    
    static var secondayTextColor: Color{
        return Color("SecondayColor")
    }
    
    static var primaryTextColor: Color{
        return Color("PrimaryColor")
    }
}
