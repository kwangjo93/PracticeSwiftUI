//
//  GeometryReaderView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/10/23.
//

import SwiftUI

enum Touchindex {
    case one, two, three
}

struct GeometryReaderView: View {
    @State var index: Touchindex = .one
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: index == Touchindex.one ? 200 : 100, height: geometry.size.height / 3)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .onTapGesture {
                            withAnimation {
                                index = .one
                            }
                        }
                    
                    Text("Hello, World!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: index == Touchindex.two ? 200 : 100, height: geometry.size.height / 3)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .onTapGesture {
                            withAnimation {
                                index = .two
                            }
                        }
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: index == Touchindex.three ? 200 : 100, height: geometry.size.height / 3)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .onTapGesture {
                            withAnimation {
                                index = .three
                            }
                        }
                }//VStack
                Spacer()
            }//HStack
           
        }//GeometryReader
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    GeometryReaderView()
}


/*
 화면 크기, 위치, 및 기타 레이아웃 관련 정보에 액세스하여 뷰의 크기와 위치를 동적으로 조절하거나 레이아웃을 커스터마이즈할 수 있습니다.
 전체 뷰에 대해 %를 계산하여 그리기 때문에 어떤 기종을 사용하더라도 같은 사이즈로 표시된다!!
 */
