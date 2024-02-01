//
//  SalesData.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/1/24.
//

import Foundation

//데이터모델
struct Salesinfo: Identifiable {
    var id = UUID()
    var month: String
    var total: Int

    var retailSales: [Salesinfo] = [
        .init(month: "Jan", total: 5),
        .init(month: "Feb", total: 7),
        .init(month: "March", total: 6),
        .init(month: "April", total: 5),
        .init(month: "May", total: 6),
        .init(month: "June", total: 3),
        .init(month: "July", total: 6),
    ]

    var onlineSales: [Salesinfo] = [
        .init(month: "Jan", total: 2),
        .init(month: "Feb", total: 4),
        .init(month: "March", total: 5),
        .init(month: "April", total: 2),
        .init(month: "May", total: 4),
        .init(month: "June", total: 1),
        .init(month: "July", total: 4),
    ]
}


