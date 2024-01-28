//
//  UpdateingAction.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/28/24.
//

import SwiftUI

struct UpdateingAction: View {
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    var body: some View {
        let longPressAndDrag = LongPressGesture(minimumDuration: 2.0)
            .updating($longPress) { value, state, transition in
                state = value
            }
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }
        
        let drag = DragGesture()
            .updating($offset) { dragValue, state, trasaction in
                state = dragValue.translation
            }
        return Image(systemName: "hand.point.right.fill")
            .foregroundStyle(longPress ? Color.red : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressAndDrag)
    }
}

#Preview {
    UpdateingAction()
}

/* updating
 - DragGesture.Value
    - location(CGPont) = 드래그 제스처의 현재 위치
    - predictedEndLocation(CGPoint) = 현재의 드래그 속도를 바탕으로 드래그를 멈추게 된다면 예상되는 최종위치
    - predictedEndTranslation(CGPoint) = 현재의 드래그 속도를 바탕으로 드래그를 멈추게 된다면 예상 오프셋
    - startLocation(CGPoint) = 드래그 제스처가 시작된 위치
    - time(Date) = 현재 드래그 이벤트가 발생한 타임스탬프
    - traslation(CGSize) = 드래그 제스처를 시작한 위치부터 현재 위치까지의 총 오프셋
 - @GestureState
 - Transaction
 
 */
