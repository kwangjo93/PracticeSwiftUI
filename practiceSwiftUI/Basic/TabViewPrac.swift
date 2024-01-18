//
//  TabViewPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/11/23.
//

import SwiftUI

struct TabViewPrac: View {
    var body: some View {
        TabView {
            TabItemView11(title: "ddd", imageString: "person")
                .tabItem { Image(systemName: "person")
                            Text("dd")}
            TabItemView11(title: "123", imageString: "star")
                .tabItem { Image(systemName: "star") }
            TabItemView11(title: "dzxw", imageString: "doc")
                .tabItem { Image(systemName: "doc") }
            
        }
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
