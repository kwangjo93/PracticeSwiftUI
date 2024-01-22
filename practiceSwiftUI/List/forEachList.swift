//
//  forEachList.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/22/24.
//

import SwiftUI

struct forEachList: View {
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Task out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    @State private var toggleStatus = true
    var body: some View {
        List {
            Section(header: Text("Setting")) {
                Toggle(isOn: $toggleStatus, label: {
                    Text("Allow Notifications")
                })
            } // Section1
            Section(header: Text("To DO Tasks")) {
                ForEach(listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }//HStack
                }//ForEach
            } // Section2
        }//List
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the kids", imageName: "person.2fill")
            ]
        }
    }//View
}

#Preview {
    forEachList()
}
