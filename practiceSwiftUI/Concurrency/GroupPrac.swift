//
//  GroupPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/17/24.
//

import SwiftUI

struct GroupPrac: View {
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
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
    }
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}
// 동시성을 사용하여 작업할 때 작업이 생성된 순서대로 완료된다는 보장이 없다.
// addTask - 추가작업
// cancelAll() - 그룹의 모든 작업을 취소하는 메서드
// isCancelled - 작업 그룹이 이미 취소 되었는지 여부
// isEmpty - 작업 그룹 내에 작업이 남아 있는지에 대한 여부
#Preview {
    GroupPrac()
}
