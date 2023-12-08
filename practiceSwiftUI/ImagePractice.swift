//
//  ImagePractice.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/6/23.
//

import SwiftUI

struct ImagePractice: View {
    var body: some View {
        CirCleImageView()
    }
}

struct CirCleImageView: View {
    var body: some View {
        Image("myImage")
            .resizable()   // 사이즈 맞추기
            .aspectRatio(contentMode: .fill) // 비율 맞추기
//            .scaledToFit() //aspectRatio 와 비슷
            .frame(width: 300, height: 300)
            /*.clipped()*/ // 프레임 설정 시 해당 프레임에 맞게 자르기
            .clipShape(Circle()) // 원으로 만들기
            .shadow(color: .gray, radius: 10, x: 5, y: 10)
            .overlay(Circle().stroke(Color.yellow, lineWidth: 3).padding(-10))
            .overlay(Text("오늘의 날씨")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .padding(.bottom, 120)
            )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
        Image(systemName: "bolt.circle")
            .font(.system(size: 200))
            .foregroundColor(.indigo)
            .shadow(color: .gray, radius: 2, x: 5, y: 5)
    }
}

#Preview {
    ImagePractice()
}
