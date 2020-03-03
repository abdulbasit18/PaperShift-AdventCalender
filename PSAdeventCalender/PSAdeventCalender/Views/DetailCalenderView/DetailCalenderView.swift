//
//  DetailCalenderView.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import SwiftUI

struct DetailCalenderView: View {
    
    var calenderItem: AdventItemModel
    
    var body: some View {
        VStack {
            Image("papershift_logo")
                .shadow(color: .primary, radius: 10, x: -1, y: 0.05)
                .padding()
//            Spacer()
            
            Image(calenderItem.image ?? "")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .frame(width: 200, height: 200, alignment: .top)
                .padding()
            
            VStack {
                Text(calenderItem.announcementTitle ?? "")
                    .font(Font.appSemiBoldFontWith(size: 40))
                    .foregroundColor(Color.primaryTextColor)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.primary, radius: 4, x: 0.5, y: 0.005)
                Text(calenderItem.annouchmentMessage ?? "")
                    .font(Font.appItalicFontWith(size: 25))
                    .foregroundColor(Color.secondayTextColor)
                    .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
            Spacer()
        }
    }
}
