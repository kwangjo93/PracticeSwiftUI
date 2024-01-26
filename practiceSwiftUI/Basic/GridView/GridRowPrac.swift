//
//  GridRowPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/26/24.
//

import SwiftUI

struct GridRowPrac: View {
    var body: some View {
        //정렬과 간격
        Grid(alignment: .bottomTrailing, horizontalSpacing: 30, verticalSpacing: 10) {
            GridRow {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center) // 개별 정렬 관리
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.topLeading)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing) //개별 수평정렬 관리
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            GridRow(alignment: .top) {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent(index: 0, color: .yellow)
            }
            .font(.largeTitle)
            GridRow {
                ForEach((1...5), id: \.self) { index in
                    if index % 2 == 1 {
                        CellContent(index: index, color: .red)
                    } else {
                        Color.blue.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    
                }
            }//GridRow
            GridRow {
                ForEach((6...8), id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }//GridRow
            GridRow {
                ForEach((11...12), id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }//GridRow
            CellContent(index: 16, color: .yellow)
            
            //열 확장하기
            GridRow {
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }
        .padding()
    }
}

#Preview {
    GridRowPrac()
}
 // GridRow = 아이템의 개수가 행의 개수가 된다.
