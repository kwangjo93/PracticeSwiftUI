//
//  ViewBuilderPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/13/24.
//
import SwiftUI

struct ViewBuilderPrac: View {
    var body: some View {
        MyVStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            HStack {
                Image(systemName: "star")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        } //MyVStack
        .padding()
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack {
            Image(systemName: "star")
            Image(systemName: "star.fill")
            Image(systemName: "star")
        }
        
    }
}

#Preview {
    ViewBuilderPrac()
}

struct MyVStack<Content: View>: View {
    let content: () -> Content    // 클로저 타입의 저장속성 만들기
    init(@ViewBuilder content: @escaping () -> Content) {   // 외부주입 생성자
        self.content = content
    }

    var body: some View {
        VStack(spacing: 10) {
            content()  // VSTack 안에 외부주입으로 들어오는 것을 실행하도록.
        }
        .font(.largeTitle)
    }
}
