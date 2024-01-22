//
//  리스트네비게이션.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/22/24.
//

import SwiftUI

struct ListPrac3: View {
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Task out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    @State private var newItemTitle = ""
    @State private var toggleStatus = true
    @State private var isAddModalPresented = false
    @State private var stackPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                Section(header: Text("Setting")) {
                    Toggle(isOn: $toggleStatus, label: {
                        Text("Allow Notifications")
                    })
                } // Section1
                Section(header: Text("To DO Tasks")) {
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) { // 값을 보낼 아이템
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }//HStack
                        } //NavigationLink
                    }//ForEach
                    .onDelete(perform: deleteItem ) // section을 기준으로 삭제할 리스트
                    .onMove(perform: moveItem)
                } // Section2
            }//List
            .navigationTitle(Text("To DO List"))
            .navigationBarItems(trailing: addButton)
            .navigationBarItems(trailing: EditButton())
            .navigationDestination(for: String.self) { task in
                Text("Selected task = \(task)")
            }
            .sheet(isPresented: $isAddModalPresented) {
                // 모달이 표시될 뷰
                VStack {
                    TextField("New Task", text: $newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Add") {
                        let newItem = ToDoItem(task: newItemTitle, imageName: "circle")
                        listData.append(newItem)
                        isAddModalPresented.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }//VStack
                .padding()
            }//sheet
        }//NavigationStack
    }
    private var addButton: some View {
        Button(action: {
            isAddModalPresented.toggle()
        }) {
            Text("Add")
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
    private func moveItem(from source: IndexSet,
                          to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
}


#Preview {
    ListPrac3()
}
/*
 var stackCount = stackPath.count
 stackPath.removeLast(stackCount) // 모두 제거하여 홈으로
 stckPath.append(value) // 특정 뷰로 이동
 */
