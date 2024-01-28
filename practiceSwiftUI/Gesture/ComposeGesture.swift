//
//  ComposeGesture.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/29/24.
//

import SwiftUI

struct ComposeGesture: View {
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnabled: Bool = false
    var body: some View {
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .onEnded({ _ in  // 프레스가 1초가 지난 후에
                self.dragEnabled = true
            })
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transition in
                switch value {
                case .first(true):
                    print("Long press in progress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded({ value in  // 드래그가 끝는 후에
                self.dragEnabled = false
            })
   
        return Image(systemName: "hand.point.right.fill")
            .foregroundStyle(dragEnabled ? Color.green : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressAndDrag)
    }
}

#Preview {
    ComposeGesture()
}
