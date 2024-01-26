//
//  GridPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/26/24.
//

import SwiftUI

struct GridItemPrac: View {
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridVItems = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 50)),
        GridItem(.flexible())
    ]
    private var girdHItems = [GridItem(.fixed(150)),
                              GridItem(.adaptive(minimum: 80)),
                              GridItem(.fixed(150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridVItems, spacing: 10) {
                ForEach((0...8), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }//LazyVGrid
            .padding()
        }//ScrollView
        ScrollView(.horizontal) {
            LazyHGrid(rows: girdHItems, spacing: 10) {
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }//LazyHGrid
            .padding()
        }//ScrollView
    }//View
}

#Preview {
    GridItemPrac()
}

struct CellContent: View {
    var index: Int
    var color: Color
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

/*
 GridItem
 - .flexible = 배열의 GridItem의 수가 그리드에 포함된 열의 수를 나타낸다. 그리드아이템이 3이면 3개의 열
 - .adaptive(minimum: , maximum: ) = 뷰가 차지하는 공간에 맞출 수 있는 한 많은 행이나 열이 자동으로 표시
 - .fixex(CGFloat) = 행 또는 열을 특정 크기로 설정할 수 있다.
 */
