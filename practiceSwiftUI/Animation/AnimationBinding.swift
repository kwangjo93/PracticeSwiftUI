//
//  AnimationBinding.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/28/24.
//

import SwiftUI

struct AnimationBinding: View {
    @State private var visibility = false
    @State private var rotation: Double = 0
    @State private var isSpinning: Bool = true
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 1.3)), label: {
                Text("Toggle Text Views")
            }) //Toggle
            .padding()
            if visibility {
                Text("Hello World")
                    .font(.largeTitle)
            } else {
                Text("Goodbye World")
                    .font(.largeTitle)
            }
            ZStack { // 자동 애니메이션 시작
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundStyle(Color.blue)
                    .frame(width: 360, height: 360)
                Image(systemName: "forward.fill")
                    .font(.largeTitle)
                    .offset(y: -180)
                    .rotationEffect(.degrees(rotation))
                    .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: rotation) // 반복
            }//ZStack
            .onAppear() {
                self.isSpinning.toggle()
                rotation = isSpinning ? 0 : 360
            }
        }//VStack
    }//View
}

#Preview {
    AnimationBinding()
}
