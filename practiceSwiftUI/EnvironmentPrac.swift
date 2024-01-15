//
//  EnvironmentPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/15/24.
//

import SwiftUI
import Combine

struct EnvironmentPrac: View {
    let speedSetting = SpeedSetting()   // 인스턴스 생성
    var body: some View {
        VStack {
            SpeedControlView()
            SpeedDisplayView()
        }
        .environmentObject(speedSetting)  // 인스턴스 값을 전달 , 전달 받은 쪽에서는 참조하여 실행.
    }
}

#Preview {
    EnvironmentPrac()
}

class SpeedSetting: ObservableObject {  // 변화하는 대상, 그리고 공유될 객체
    @Published var speed = 0.0
}

struct SpeedControlView: View {
    @EnvironmentObject var speedSetting: SpeedSetting   // 객체 참조(값을 전달 받음.)
    var body: some View {
        Slider(value: $speedSetting.speed, in: 0...100)
    }
}
struct SpeedDisplayView: View {
    @EnvironmentObject var speedSetting: SpeedSetting   // 객체 참조
    var body: some View {
        Text("Speed = \(speedSetting.speed)")
    }
}

/// 객체는 관찰되는 객체와 동일한 방식으로 작동되지만, 뷰 계층 구조를 통해 전달되지 않고 콘텐트 뷰의 모든 하위 뷰에 접근할 수 있다.
