//
//  NavSplitDemo.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/23/24.
//

import SwiftUI

struct NavSplitDemo: View {
    @State private var categories = [
        IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                      "questionmark.folder",
                                                      "questionmark.folder.fill.ar",
                                                      "folder.fill.badge.gear",
                                                      "questionmark.folder.fill"]),
    
        IconCategory(categoryName: "Circles", images: ["book.circle",
                                                      "books.vertical.circle",
                                                      "books.vertical.circle.fill",
                                                      "book.circle.fill",
                                                      "book.closed.circle"]),
        IconCategory(categoryName: "Folders", images: ["cloud.rain",
                                                      "cloud",
                                                      "cloud.drizzle.fill",
                                                      "cloud.fill",
                                                      "cloud.drizzle"])
    ]
    @State private var selectedCategory: IconCategory?  // 사이드바를 위한
    @State private var selectedImage: String?
    @State private var columVisibility = NavigationSplitViewVisibility.doubleColumn
    var body: some View {
        NavigationSplitView(columnVisibility: $columVisibility) {
            List(categories, selection: $selectedCategory) { category in
                Text(category.categoryName).tag(category)
            }//List
        } content: {
            if let selectedCategory {
                List(selectedCategory.images, id: \.self, selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }.tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Select an Image")
            }
        } // NavigationSplitView
        .navigationSplitViewStyle(.balanced)
    }//View
}

#Preview {
    NavSplitDemo()
}
