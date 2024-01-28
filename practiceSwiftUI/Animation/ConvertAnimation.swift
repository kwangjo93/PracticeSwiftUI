//
//  ConvertAnimation.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/28/24.
//

import SwiftUI

struct ConvertAnimation: View {
    @State private var isButtonVisible: Bool = true
    @State private var isTextVisible: Bool = true
    @State private var isLabelVisible: Bool = true
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 0.7)), label: {
                Text("Show / Hide Button")
            })
            .padding()
            
            if isButtonVisible {
                Button(action: {
                    
                }, label: {
                    Text("Example Button")
                })
                .font(.largeTitle)
                .transition(.move(edge: .top))
            }
            Toggle(isOn: $isTextVisible.animation(.linear(duration: 0.7)), label: {
                Text("Show / Hide Text")
            })
            .padding()
            
            if isTextVisible {
                Button(action: {
                    
                }, label: {
                    Text("Example Text")
                        .foregroundStyle(.red)
                })
                .font(.largeTitle)
//                .transition(AnyTransition.slide.combined(with: .move(edge: .top)))
                .transition(.fadeAndMove)
            }
            
            Toggle(isOn: $isLabelVisible.animation(.linear(duration: 0.7)), label: {
                Text("Show / Hide Text")
            })
            .padding()
            
            if isLabelVisible {
                Button(action: {
                    
                }, label: {
                    Text("Example Label")
                        .foregroundStyle(.yellow)
                })
                .font(.largeTitle)
                .transition(.asymmetric(insertion: .scale, removal: .slide)) // 비대칭 전환
            }
        }//VStack
    }//View
}

#Preview {
    ConvertAnimation()
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top))
    }
}

/* transition()
 1. .slide - 뷰가 슬라이딩하여 들어오거나 나간다
 2. .scale - 뷰의 크기가 커지면서 나타나고 작아지면서 사라진다.
 3. .move(edge: edge) - 지정된 방향으로 뷰가 이동되며, 추가되거나 제거
 4. .opacity - 디폴트 전환 효과로 페이드되는 동안 크기 위치 유지.
 */
