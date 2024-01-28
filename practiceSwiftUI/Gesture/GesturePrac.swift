//
//  GesturePrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/28/24.
//

import SwiftUI

struct GesturePrac: View {
    @State private var magnification: CGFloat = 1.0
    let tap1 = TapGesture()
        .onEnded { _ in
            print("Tapped")
        }
    let tap2 = TapGesture(count: 2) // 2번 클릭해야 탭 제스처 인식
        .onEnded { _ in
            print("Double Tapped")
        }
    let longPress = LongPressGesture(minimumDuration: 5, maximumDistance: 120)
        .onEnded { _ in
            print("Long Press")
        }
    lazy var magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
        .onChanged({ [self] value in
            magnification = value
        })
        .onEnded { _ in
            print("Gesture Ended")
        }
    
    var body: some View {
     
        Image(systemName: "hand.point.right.fill")
            .gesture(tap1)
            .padding()
        Image(systemName: "person")
            .gesture(tap2)
            .padding()
        Image(systemName: "star.fill")
            .gesture(longPress)
            .padding()
        Image(systemName: "circle")
            .resizable()
            .font(.largeTitle)
            .scaleEffect(magnification)
            .gesture(
                MagnificationGesture()
                .onChanged { value in
                    self.magnification = value
                }
            ) // 핀칭 동작 감지
            .frame(width: 100, height: 90)
            .padding()
    }
}

#Preview {
    GesturePrac()
}
/*
 onEnded - TabGesture 에 주로 사용. 제스처가 완료될 때 호출
 onchange - 처음 인식되었을 때 호출, 제스처가 끝날 때까지 제스처의 값이 변할 때마다 호출 디바이스 화면에서 움직이는 제스처를 사용할 때 유용(핀치)
 */
