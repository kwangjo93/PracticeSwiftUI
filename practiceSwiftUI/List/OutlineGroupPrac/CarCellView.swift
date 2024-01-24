//
//  CarCellView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/24/24.
//

import SwiftUI

struct CarCellView: View {
    var item: CarInfo
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.green)
            Text(item.name)
        }
    }
}

#Preview {
    CarCellView(item: CarInfo(name: "Volvo", image: "car.circle"))
}
