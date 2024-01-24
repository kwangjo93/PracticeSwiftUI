//
//  OutlineGroupPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/24/24.
//

import SwiftUI

struct OutlineGroupPrac: View {
    var body: some View {
        List {
            ForEach(carItems) { carItem in
                Section(header: Text(carItem.name)) { // 처음 상단의 데이터를 섹션으로
                    //그 다음부터 데이터의 값으로 outline 실행
                    OutlineGroup(carItem.children ?? [CarInfo](), children: \.children) { child in
                            CarCellView(item: child)
                    }
                }
            }
        }//List
        .listStyle(InsetListStyle())
    }//body
}

#Preview {
    OutlineGroupPrac()
}

//더미데이터
let carItems: [CarInfo] = [
    CarInfo(name: "Hybrid Cars", image: "leaf.fill", children: [
        CarInfo(name: "Toyota", image: "car.circle", children: [
            CarInfo(name: "Prius", image: "leaf.fill"),
            CarInfo(name: "Highlander", image: "leaf.fill"),
                CarInfo(name: "Lexus", image: "car.circle", children: [
                    CarInfo(name: "Lexus RX", image: "leaf.fill"),
                    CarInfo(name: "Lexus NX", image: "leaf.fill")])
        ]),
        CarInfo(name: "Ford", image: "car.circle", children: [
            CarInfo(name: "Fusion Energi", image: "leaf.fill"),
            CarInfo(name: "Escape", image: "leaf.fill"),
            CarInfo(name: "Volvo", image: "car.circle", children: [
                CarInfo(name: "S90 Hybrid", image: "leaf.fill"),
                CarInfo(name: "XC90 Hybrid", image: "leaf.fill")])
        ]),
    ]),
    CarInfo(name: "Electric Cars", image: "bolt.car.fill", children: [
        CarInfo(name: "Tesla", image: "car.circle", children: [
            CarInfo(name: "Model 3", image: "bolt.car.fill")
        ]),
        CarInfo(name: "Karma", image: "car.circle", children: [
            CarInfo(name: "Revero GT", image: "bolt.car.fill")
        ])
    ])
]
