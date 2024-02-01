//
//  ChartPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/1/24.
//

import SwiftUI
import Charts

struct ChartPrac: View {
    let tempData: [MonthlyTemp] = [
        MonthlyTemp(month: "Jan", degrees: 50),
        MonthlyTemp(month: "Feb", degrees: 43),
        MonthlyTemp(month: "Mar", degrees: 61)
    ]
    var body: some View {
        Chart {
            ForEach(tempData) { data in
                AreaMark(x: .value("Month", data.month),
                         y: .value("Temp", data.degrees))
            }
            
        }
        
    }
}

#Preview {
    ChartPrac()
}

//데이터모델
struct MonthlyTemp: Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
}
