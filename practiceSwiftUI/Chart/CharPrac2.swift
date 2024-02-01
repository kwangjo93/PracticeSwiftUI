//
//  CharPrac2.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/1/24.
//

import SwiftUI
import Charts

struct CharPrac2: View {
    let tempData: [MonthlyTemp] = [
        MonthlyTemp(month: "Jan", degrees: 50),
        MonthlyTemp(month: "Feb", degrees: 43),
        MonthlyTemp(month: "Mar", degrees: 61)
    ]
    let tempData2: [MonthlyTemp2] = [
        MonthlyTemp2(month: "Jan", degrees: 50, year: "2021"),
        MonthlyTemp2(month: "Feb", degrees: 43, year: "2021"),
        MonthlyTemp2(month: "Mar", degrees: 61, year: "2021"),
        
        MonthlyTemp2(month: "Jan", degrees: 30, year: "2022"),
        MonthlyTemp2(month: "Feb", degrees: 38, year: "2022"),
        MonthlyTemp2(month: "Mar", degrees: 29, year: "2022")
    ]
    var body: some View {
        Chart(tempData) { data in
            RectangleMark(x: .value("Month", data.month),
                          y: .value("Temp", data.degrees))
            LineMark (x: .value("Month", data.month),
                      y: .value("Temp", data.degrees))
        }//Chart
        Chart {
            ForEach(tempData2) { data in
                LineMark(x: .value("Month", data.month),
                         y: .value("Temp", data.degrees)
                )
                .interpolationMethod(.stepEnd) // 보간법 변경하기(포인트를 연결짓는 선.)
                .foregroundStyle(by: .value("Year", data.year))  // 색상 별로 구분
                .symbol(by: .value("Year", data.year))  // 심볼 아이콘
            }
        }//Chart
        .chartPlotStyle { plotArea in
            plotArea.background(.gray.opacity(0.4))   // 배경 설정
        }
    }
}

#Preview {
    CharPrac2()
}

struct MonthlyTemp2: Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
    var year: String
}
