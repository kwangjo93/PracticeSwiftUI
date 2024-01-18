//
//  AnyLayoutPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/13/24.
//

import SwiftUI

// Stack의 동적 할당
struct AnyLayoutPrac: View {
    @State
    var myLayout: AnyLayout = AnyLayout(VStackLayout())  // Stack 의 동적 할당을 위한 State Property
    var body: some View {
        myLayout {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
        } //myLayout
        
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }, label: {
                Text("HStack")
            })
            Button(action: {
                myLayout = AnyLayout(VStackLayout())
            }, label: {
                Text("VStack")
            })
        }
    }
}

#Preview {
    AnyLayoutPrac()
}
