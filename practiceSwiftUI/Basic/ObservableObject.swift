//
//  ObservableObject.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/8/23.
//


import Foundation
import Combine
import SwiftUI

struct ObservableView: View {
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView { // NavigationView 추가
            VStack(alignment: .leading) {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    
                Button(action: {
                    resetCount() // 버튼을 눌렀을 때 resetCount() 함수 호출
                }) {
                    Text("Reset Counter")
                }
                .padding()
                .alignmentGuide(.leading, computeValue: { d in
                    d[HorizontalAlignment.trailing] - 20
                })
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
                .alignmentGuide(.leading, computeValue: { dimension in
                    dimension[HorizontalAlignment.trailing] - 150
                })
            }
        }
        .environmentObject(timerData)
    }
    
    // 버튼 액션으로 사용될 함수
    func resetCount() {
        timerData.resetCount()
    }
}


#Preview {
    ObservableView()
}

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer count = \(timerData.timeCount)")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
        } //VStact
    }//body
    
    func resetCount() {
        timerData.resetCount()
    }
}

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
    
    
    
}
