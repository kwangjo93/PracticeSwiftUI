//
//  ContextMenuPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/27/24.
//

import SwiftUI

struct ContextMenuPrac: View {
    @State private var foregroundColor: Color = Color.black
    @State private var backgroundColor: Color = Color.white
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .font(.largeTitle)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .contextMenu {
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }, label: {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                })//Button
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                }, label: {
                    Text("Inverted Colors")
                    Image(systemName: "paintbrush.fill")
                })//Button
            }//contextMenu
    }//View
}

#Preview {
    ContextMenuPrac()
}

/*
 뷰를 롱 프레스 했을 때 나타나는 메뉴.
 */
