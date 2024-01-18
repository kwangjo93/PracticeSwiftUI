//
//  LifrCyclePrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/18/24.
//

import SwiftUI

struct LifrCyclePrac: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    LifrCyclePrac()
}

struct FirstTabView: View {
    @State
    var title = "First"
    var body: some View {
        Text(title)
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
            .task(priority: .background) {
                title = await changeTitle()
            }
    }// View
    func changeTitle() async -> String {
        sleep(5)
        return "Async task completed"
    }
}
struct SecondTabView: View {
    @State
    private var text: String = ""
    var body: some View {
       TextEditor(text: $text)
            .padding()
            .onChange(of: text) { oldValue, newValue in
                print("\(text)")
            }
    }
}
