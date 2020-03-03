//
//  MainCalenderView.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import SwiftUI

struct QConstants {
  static let showDesigner = true
  static let columnsMax = 8
  static let vSpacingMaxToGeometryRatio: CGFloat = 0.5 // 50%
  static let vPaddingMaxToGeometryRatio: CGFloat = 0.3 // 30%
  static let hPaddingMaxToGeometryRatio: CGFloat = 0.3 // 30%
}

struct MainCalenderView: View {
    @ObservedObject var viewModel: MainCalenderViewModel

      var body: some View {
        GeometryReader { geometry in
          ZStack {

            self.backgroundGradient
            .edgesIgnoringSafeArea(.all)
            VStack {
                Image("papershift_logo")
                    .shadow(color: .primary, radius: 10, x: -1, y: 0.05)
                    
                Spacer()
                self.gridView(geometry)
            }
            .alert(isPresented: self.$viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(self.viewModel.errorMessage))
                   })
          }
            
        }
       
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
      }

    private var backgroundGradient: Color {

        return .white
    }
    
    private func gridView( _ geometry: GeometryProxy) -> some View {
        GridView(viewModel.calenderItems) {
        GridCell(calenderItem: $0)
            
      }
    }
    
}

struct MainCalenderView_Previews: PreviewProvider {
    static var previews: some View {
        MainCalenderView(viewModel: MainCalenderViewModel.init())
    }
}
