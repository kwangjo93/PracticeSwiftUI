//
//  ActorPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/17/24.
//

import SwiftUI

struct ActorPrac: View {
    var body: some View {
        Button(action: {
            Task {  // Task - 동기 함수에서 비동기 함수를 호출
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }
    func doSomething() async {
        let store = TimeStore()
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takesTooLong())
                }
            }
        }
        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }//doSomething
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}

#Preview {
    ActorPrac()
}

actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}






// --------------------------------------
actor BuildMessage {
    var message: String = ""
    let greeting = "Hello"
    
    func setName(name: String) {
        self.message = "\(greeting) \(name)"
    }
    
    //nonisolated - await키워드 없이 호출 가능 키워드(가변의 내용은 안되고, 불변적으로 get 으로만 사용 가능!!)
    nonisolated func getGreeting() -> String {
        return greeting
    }
}

/// 클래스와의 차이점 = 비동기 함수 또는 Task 클로저 내부 와 같이 비동기 컨텍스트 내에서만 생성 및 액세스할 수 있다.
/// 액터 메서드를 호출하거나 속성에 접근하라 때에는 await 키워드를 반드시 사용
/// 액터의 데이터는 다른 앱의 코드들과 격리되는데 이는 동시접근(DataRace)를 방지 위함.
