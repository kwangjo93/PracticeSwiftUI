//
//  GeometryReaderProxyView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/11/23.
//

import SwiftUI

struct GeometryReaderProxyView: View {
    @State var index: Touchindex = .one
    
    //지오메트리 프록시를 매개변수로 CGPoint  반환 클로저
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX,
                       y: proxy.frame(in: .local).midY)
    }
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: index == Touchindex.one ? 200 : 100, height: proxy.size.height / 3)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .onTapGesture {
                            withAnimation {
                                index = .one
                            }
                        }
                    
//                    Text("Hello, World!")
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .frame(width: index == Touchindex.two ? 200 : 100, height: proxy.size.height / 3)
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .onTapGesture {
//                            withAnimation {
//                                index = .two
//                            }
//                        }
//                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .frame(width: index == Touchindex.three ? 200 : 100, height: proxy.size.height / 3)
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .onTapGesture {
//                            withAnimation {
//                                index = .three
//                            }
//                        }
                }//VStack
//                .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                .position(centerPosition(proxy))
                Spacer()
            }//HStack
           
        }//GeometryReader
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    GeometryReaderProxyView()
}

/*
 보여지는 뷰에서 CGFloat 값을 대입해야 하는 .position 속성 사용.
 .position(x: proxy.frame(in: .local).midX,
            y: proxy.frame(in: .local).midY)
 mid, min, max 를 활용하여 원하는 곳에 배치
 */
