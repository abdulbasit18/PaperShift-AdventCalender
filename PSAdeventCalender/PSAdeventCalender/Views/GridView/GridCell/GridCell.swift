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
    @State var attempts: Int = 0
    @State private var showingPopupA = false
    var body: some View {
        VStack {
            Image(calenderItem.image ?? "")
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
            .padding(.bottom, -20)
        }.popover(isPresented: self.$showingPopupA) { // Add Popover Screen
            DetailCalenderView(calenderItem: self.calenderItem) // Should be handled through coordinator but due time constraint its not used
        }
        .modifier(Shake(animatableData: CGFloat(attempts)))
        .onTapGesture {
            withAnimation(.default) {
                withAnimation(.default) {
                    
                    let calender = Calendar(identifier: .gregorian)
                    let weekday = calender.component(.weekday, from: Date())
                    if self.calenderItem.id > weekday {
                        self.attempts += 1} else {
                        self.showingPopupA = true
                    }
                }

            }
        }
        .font(.headline).foregroundColor(.white)
    }
}
