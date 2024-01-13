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
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}
