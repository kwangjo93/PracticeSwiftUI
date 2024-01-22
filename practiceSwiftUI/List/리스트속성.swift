//
//  ListPrac1.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/22/24.
//

import SwiftUI

struct ListPrac1: View {
    var body: some View {
        List {
            Text("Wash the car")
                .listRowSeparator(.hidden)
            Text("Pick up kids from school bus @ 3pm")
                .listRowSeparatorTint(.red)
            Text("Action the kids on eBay")
                .listRowSeparatorTint(.mint)
            Text("Order Pizza for dinner")
                .listRowBackground(Image(systemName: "star.fill"))
        }
    }
}

#Preview {
    ListPrac1()
}
