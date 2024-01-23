//
//  NavigationSplitViewPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/23/24.
//

import SwiftUI

struct NavigationSplitViewPrac: View {
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor: String?
    @State private var columVisibility = NavigationSplitViewVisibility.doubleColumn
    var body: some View {
        NavigationSplitView(columnVisibility: $columVisibility) {
            List(colors, id: \.self, selection: $selectedColor) { color in
                Text(color).tag(color)
            }
            .navigationSplitViewColumnWidth(100)
        } detail: {
            Text(selectedColor ?? "No Color Selected")
        }
        .navigationSplitViewStyle(.automatic)
    }
}

#Preview {
    NavigationSplitViewPrac()
}

/*
 .navigationSplitViewStyle(.automatic)
 - automatic : 컨텐트, 화면 크기, 열 선택 등의 요소를 기반으로 표시
 - balanced : 사이드바 및 컨텐트 열에 대한 공간을 제공하기 위해 디테일 너비를 줄인다.
 - prominentDetail : 디테일 열의 크기가 변경되는 것을 막는다.(주로 사이트바, 컨텐트 열을 생성할때 생성.)
 */
