//
//  CarInfo.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/24/24.
//

import Foundation

struct CarInfo: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var children: [CarInfo]?
}
