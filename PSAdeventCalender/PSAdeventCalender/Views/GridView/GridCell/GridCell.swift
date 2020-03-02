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
    @State var rotation: Double = 0

  var body: some View {
    VStack {
        Image("papershift_logo")
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .shadow(color: .primary, radius: 5)
        .padding([.horizontal, .top], 7)
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 0, z: 1), anchor: .center)
      Text(calenderItem.title ?? "").lineLimit(1)
      Text(calenderItem.title ?? "").lineLimit(1)

    }
        
    .onTapGesture {
        withAnimation { () -> Void in
            (self.rotation == 0) ? (self.rotation = 180) : (self.rotation = 0)
        }
    }
    
    .font(.headline).foregroundColor(.white)
  }
}

