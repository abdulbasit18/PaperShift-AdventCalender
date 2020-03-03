//
//  GridView.swift
//  PSAdeventCalender
//
//  Created by Abdul Basit on 02/03/2020.
//  Copyright © 2020 Abdul Basit. All rights reserved.
//

import SwiftUI


/// A container that presents rows of data arranged in multiple columns.
@available(iOS 13.0, OSX 10.15, *)
public struct GridView<Data, Content>: View
  where Data : RandomAccessCollection, Content : View, Data.Element : Identifiable {
  private struct GridIndex : Identifiable { var id: Int }
  
  // MARK: - STORED PROPERTIES
  
  private let columns: Int
  private let columnsInLandscape: Int
  private let vSpacing: CGFloat
  private let hSpacing: CGFloat
  private let vPadding: CGFloat
  private let hPadding: CGFloat
    
  
  private let data: [Data.Element]
  private let content: (Data.Element) -> Content
  
  // MARK: - INITIALIZERS
  
  public init(_ data: Data,
              columns: Int,
              columnsInLandscape: Int? = nil,
              vSpacing: CGFloat = 10,
              hSpacing: CGFloat = 10,
              vPadding: CGFloat = 10,
              hPadding: CGFloat = 10,
              content: @escaping (Data.Element) -> Content) {
    self.data = data.map { $0 }
    self.content = content
    self.columns = max(1, columns)
    self.columnsInLandscape = columnsInLandscape ?? max(1, columns)
    self.vSpacing = vSpacing
    self.hSpacing = hSpacing
    self.vPadding = vPadding
    self.hPadding = hPadding
  }
    

    public init(_ data: Data,content: @escaping (Data.Element) -> Content){
        self.data = data.map { $0 }
        self.content = content
        self.columns = 3
        self.columnsInLandscape = 3
        self.vSpacing = 0
        self.hSpacing = 10.0
        self.vPadding = 0.0
        self.hPadding = 10.0
    }

  // MARK: - COMPUTED PROPERTIES
  
  private var rows: Int {
    data.count / self.cols
  }
  
  private var cols: Int {
    #if os(tvOS)
    return columnsInLandscape
    #elseif os(macOS)
    return columnsInLandscape
    #else
    return UIDevice.current.orientation.isLandscape ? columnsInLandscape : columns
    #endif
  }
  
  /// Declares the content and behavior of this view.
  public var body: some View {
      GeometryReader { geometry in
          if !self.data.isEmpty {
              ScrollView(showsIndicators: false) {
                  VStack(spacing: self.vSpacing) {
                      ForEach((0..<self.rows).map { GridIndex(id: $0) }) { row in
                          self.rowAtIndex(row.id * self.cols,
                                          geometry: geometry)
                      }
                      // Handle last row
                      if self.data.count % self.cols > 0 {
                          self.rowAtIndex(self.cols * self.rows,
                                          geometry: geometry,
                                          isLastRow: true)
                      }
                  }
              }
              .padding(.horizontal, self.hPadding)
              .padding(.vertical, self.vPadding)
          }
      }
  }
  
  // MARK: - `BODY BUILDER` 💪 FUNCTIONS
  
  private func rowAtIndex(_ index: Int,
                          geometry: GeometryProxy,
                          isLastRow: Bool = false) -> some View {
    HStack(spacing: self.hSpacing) {
      ForEach((0..<(isLastRow ? data.count % cols : cols))
      .map { GridIndex(id: $0) }) { column in
        self.content(self.data[index + column.id])
        .frame(width: self.contentWidthFor(geometry))
      }
      if isLastRow { Spacer() }
    }
  }
    
  // MARK: - HELPER FUNCTIONS
  
  private func contentWidthFor(_ geometry: GeometryProxy) -> CGFloat {
    let hSpacings = hSpacing * (CGFloat(self.cols) - 1)
    let width = geometry.size.width - hSpacings - hPadding * 2
    return width / CGFloat(self.cols)
  }
}
