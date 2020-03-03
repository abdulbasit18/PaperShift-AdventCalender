//
//  GridCell.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import Foundation
import SwiftUI

struct GridCell: View {
    var calenderItem: AdventItemModel
    
    var body: some View {
        VStack {
            Image("Avatar")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            VStack {
                Text(String(calenderItem.id))
                    .lineLimit(1)
                    .font(Font.appSemiBoldFontWith(size: 40))
                    .foregroundColor(Color.primaryTextColor)
                    .shadow(color: Color.primary, radius: 4, x: 0.5, y: 0.005)
                .padding(EdgeInsets())
                Text(calenderItem.title ?? "")
                    .lineLimit(1)
                    .font(Font.appItalicFontWith(size: 15))
                    .foregroundColor(Color.secondayTextColor)
                
            }
            .offset( y: -40)
            .padding(.bottom, -25)
        }
        .font(.headline).foregroundColor(.white)
    }
}
