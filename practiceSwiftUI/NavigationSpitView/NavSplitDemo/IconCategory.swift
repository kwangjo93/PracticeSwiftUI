//
//  IconCategory.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/23/24.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    let categoryName: String
    let images: [String]
}
