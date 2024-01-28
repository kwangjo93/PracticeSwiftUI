//
//  AnimationPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/28/24.
//

import SwiftUI

struct AnimationPrac: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    @State private var redCircle = false
    var body: some View {
        VStack {
            Button(action: {
                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            }) {
                Text("Click to animate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeOut(duration: 1), value: rotation)
            }//Button
            .padding()
            Button(action: {
                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            }) {
                Text("Click to Aimate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .animation(.spring(response: 1,  //Spring 효과
                                       dampingFraction: 0.2,
                                       blendDuration: 0),
                               value: rotation)
            }//Button
            .padding()
            Button(action: {
                self.rotation = (self.rotation < 360 ? self.rotation + 360 : 0)
            }) {
                Text("Click to Aimate")
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeOut(duration: 1).repeatCount(10, autoreverses: false), value: rotation) // 반복
            }//Button
            .padding()
            Button(action: { withAnimation(.linear(duration: 2)) {
                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            } //withAnimation
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            }) {
                Text("Click to Explicit Aimate")
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
            }//Button
            .padding()
            Circle()
                .fill(redCircle ? .red : .blue)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        redCircle.toggle()
                    }//withAnimation
                }//onTapGesture
        }//VStack
     
    }
}

#Preview {
    AnimationPrac()
}

/*
 1. linear - 지정된 시간 동안 일정한 속도로
 2. easeOut - 빠른 속도로 시작하여 끝으로 갈수록 느려진
 3. easeIn - 느린 속도로 시작하여 끝으로 갈수록 빨라진
 4. easeInOut - 느린 속도로 시작하여 점점 속도를 올리다가 끝에는 다시 느려진
 5.
 */
