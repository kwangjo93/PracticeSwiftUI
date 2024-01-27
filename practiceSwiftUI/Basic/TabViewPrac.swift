//
//  TabViewPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/11/23.
//

import SwiftUI

struct TabViewPrac: View {
    @State private var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            TabItemView11(title: "ddd", imageString: "person")
                .tabItem { Image(systemName: "person")
                            Text("dd")}.tag(1)
            TabItemView11(title: "123", imageString: "star")
                .tabItem { Image(systemName: "star") }.tag(2)
            TabItemView11(title: "dzxw", imageString: "doc")
                .tabItem { Image(systemName: "doc") }.tag(3)
        }
        .font(.largeTitle)
    }
}

#Preview {
    TabViewPrac()
}

struct TabItemView11:View {
    var title: String
    var imageString: String
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(systemName: imageString)
        }
    }
}
