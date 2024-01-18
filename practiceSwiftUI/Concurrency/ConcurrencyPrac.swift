//
//  ConcurrencyPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/16/24.
//

import SwiftUI

struct ConcurrencyPrac: View {
    var body: some View {
        Button(action: {
            Task {  // Task - 동기 함수에서 비동기 함수를 호출
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        }) // Button
    }
    func doSomething() async {
        print("Start - \(Date())")
// async 함수를 담는 것은 비동기 시간을 잡아먹지 않고 단순 뒤로 미루는 것이다. 그래서 await을 사용할 때 비동기의 시간 사용
        async let result = takesTooLong()
        print("After async-let \(Date())")
        
        print("result = \(await result)")
        print("End - \(Date())")
    }
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
    //우선순위와 취소
    func cancelTask() {
        let task = Task(priority: .high) { await doSomething }
        if (!task.isCancelled) {
            task.cancel()
        }
    }

    // 분리 작업 detached task - 속성을 상속하지 앟는다.
    //    let detachedTask =  Task.detached(priority: .medium) { // Task - 동기 함수에서 비동기 함수를 호출
    //        await doSomething()
    //    }
    //    if (!detachedTask.isCancelled) {
    //        detachedTask.cancel()
    //    }
}

#Preview {
    ConcurrencyPrac()
}
