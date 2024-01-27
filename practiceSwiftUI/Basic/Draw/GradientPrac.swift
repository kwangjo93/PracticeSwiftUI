//
//  GradientPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/27/24.
//

import SwiftUI

struct GradientPrac: View {
    let colors = Gradient(colors: [
        Color.red,
        Color.yellow,
        Color.green,
        Color.blue,
        Color.purple
    ])
    var body: some View {
        ScrollView {
            Circle()
                .fill(.orange.gradient.shadow(.drop(color: .red,radius: 30)))//그라디언트
                .frame(width: 200, height: 200)
            Circle()
                .fill(.blue.shadow(.inner(color: .white,radius: 50)))//이너쉐도우
                .frame(width: 200, height: 200)
            Circle()
                .fill(RadialGradient(gradient: colors,
                                     center: .center,
                                     startRadius: CGFloat(0),
                                     endRadius: CGFloat(150)))
                .frame(width: 300, height: 300)
            Rectangle()
                .fill(LinearGradient(gradient: colors,
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(width: 180, height: 160)
            MyShape()
                .fill(RadialGradient(gradient: colors,
                                     center: .center,
                                     startRadius: CGFloat(0),
                                     endRadius: CGFloat(300)))
                .background(LinearGradient(gradient: Gradient(colors: [Color.black,
                                                                       Color.white]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .frame(width: 360, height: 350)
        }
   
    }
}

#Preview {
    GradientPrac()
}
