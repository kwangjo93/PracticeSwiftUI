//
//  ListPrac2.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/22/24.
//

import SwiftUI

struct ListPrac2: View {
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Task out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    var body: some View {
        List(listData) { item in
            HStack {
                Image(systemName: item.imageName)
                Text(item.task)
            }
        }
    }
}

#Preview {
    ListPrac2()
}

//동적 리스트 - Identifiable 프로토콜을 따르는 클래스 또는 구조체
// 고유값 - id 라는 프로퍼티, String, Int, UUID와 같은 Hashable 프로토콜을 따르는 타입을 선택.

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}
