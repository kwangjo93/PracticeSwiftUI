//
//  ContentView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/2/23.
//

import SwiftUI

struct Statepractice: View {
    
    //값의 변화를 감지한다. 구조체는 클래스의 참조로 값이 변하는 구조가 아닌 값 자체가 고정이기 때문에.
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        HStack {
            MyVStackView()
            MyVStackView()
            MyVStackView()
        }//HStack
        .padding(isActivated ? 50 : 10)
        .background(isActivated ? Color.yellow : Color.blue)
        .onTapGesture {
            //변화가 생기는 곳 제스처에 애니메이션 추가
            withAnimation {
                self.isActivated.toggle() // 값이 변하면 다시 렌더링
            }
        }
        
    }//body
}


struct MyVStackView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Hello")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .tint(Color.black)
            Text("World!!")
        }//VStack
        .padding()
        
    }//body
}


#Preview {
    Statepractice()
}


/*
 @StateObject 와 @State의 차이점
 `@StateObject`와 `@State`는 SwiftUI에서 상태를 관리하기 위한 두 가지 속성 래퍼(wrapper)입니다. 이 두 가지 속성은 서로 다른 용도와 동작 방식을 갖고 있습니다.

`@StateObject`
 - `@StateObject`는 SwiftUI 뷰의 생명주기와 별도로 객체의 생명주기를 관리합니다.
 - 객체가 한 번 생성되고 뷰의 생명주기와 무관하게 유지됩니다. 따라서 뷰가 다시 그려져도 해당 객체는 유지됩니다.
 - 주로 뷰가 의존하는 외부 객체(예: ViewModel, ObservableObject를 준수하는 클래스 등)를 생성하고 관리하는 데 사용됩니다.

 `@State`
 - `@State`는 SwiftUI 뷰 내에서 관리되는 간단한 값 또는 속성에 사용됩니다.
 - 상태가 변경될 때마다 해당 뷰를 다시 그리게 하여 상태 변경을 반영합니다.
 - 주로 뷰 내의 간단한 상태(예: 토글 상태, 입력 필드의 값 등)를 저장하고 관리하는 데 사용됩니다.
 - `@State`로 표시된 값은 해당 뷰의 렌더링에만 영향을 미치고, 뷰의 생명주기와 연결되어 있습니다.
 */
