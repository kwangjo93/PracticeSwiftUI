//
//  TextPractice.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/5/23.
//

import SwiftUI

struct TextPractice: View {
    var body: some View {
        //폰트 지정(title, largeTitle, headline, system(size:))
        Text("font(.title)")
            .font(.title)
            .padding()
        
        //텍스트의 굵기를 설정 (bold, headvy, light 등등)
        Text("fontWeight(.bold)")
            .fontWeight(.bold)
            .padding()
        
        //텍스트의 색상을 지정합니다.
        Text("foregroundColor(.red)")
            .foregroundColor(.red)
            .padding()
        
        //텍스트의 최대 줄 수를 제한합니다.
        Text("lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)lineLimit(2)")
            .lineLimit(2)
            .padding()
        
        //텍스트가 최대 줄 수에 도달하면 어떻게 생략되는지를 설정합니다.
        Text("truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)truncationMode(.tail)")
            .truncationMode(.middle)
            .padding()
        
        //텍스트 줄 사이의 간격을 조절합니다.
        //** UIKit 에서는 0을 넣으면 무한으로 되었지만, swiftUI에서는 0과 1은 같으며 줄 1개를 표시한다. swiftUI에서는 무한으로 하기 위해선 nil 을 넣어줘야한다.
        Text("lineSpacing(10)lineSpacing(10)lineSpacing(10)lineSpacing(10)lineSpacing(10)")
            .lineSpacing(10)
            .padding()
        
        // 글자 사이의 간격을 조절합니다.
        Text(".kerning(2)")
            .kerning(10)
            .padding()
        
        //글자와 글자 사이의 간격 조정
        Text(".tracking(10)")
            .tracking(10)
            .padding()
        
        //font 본문 스타일 caption
        Text(".font(.caption)")
            .font(.caption)
            .padding()
        
        
        Text(".shadow(color: .red, radius: 0.7, x: 5, y: 5)")
            .font(.caption)
            .padding()
            .shadow(color: .red, radius: 0.7, x: 5, y: 5)
    }
}

#Preview {
    TextPractice()
}
