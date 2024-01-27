//
//  DrawPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/27/24.
//

import SwiftUI

struct DrawPrac: View {
    var body: some View {
        ScrollView {
            Capsule()
                .stroke(style: StrokeStyle(lineWidth: 20,
                                           dash: [CGFloat(10), CGFloat(5), CGFloat(2)],
                                           dashPhase: 10))
                .foregroundStyle(.blue)
            .frame(width: 250, height: 150)
            Ellipse()
                .fill(.red)
                .frame(width: 250, height: 150)
                .overlay(Ellipse()
                    .stroke(.blue, lineWidth: 10)
                    .frame(width: 250, height: 150)
                )
            Path { path in
                path.move(to: CGPoint(x: 30, y: 30)) // move - 시작점의 좌표
                path.addLine(to: CGPoint(x: 10, y: 350)) //addLine - 직선 추가
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
            }//Path
            .fill(.green)
            .padding(.bottom, 200)
            MyShape()
                .fill(.orange)
                .frame(width: 360, height: 350)
        }
        
    }
}

#Preview {
    DrawPrac()
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


/*
 path()
 - addArc() = 반지름과 각도 값을 기반으로 호를 추가한다.
 - addCurve() = 주어진 끝점과 제어점을 사용하여 3차 베지어 곡선 추가
 - addLine() = 지정된 포인트까지 직선 추가
 - addLines() = 지정된 끝점들의 배열 간에 직선을 추가한다.
 - addQuadCurve() = 주어진 끝점과 제어점을 사용하여 2차 베지어 곡선 추가
 - closeSubPath() = 끝점과 시작점을 연결하ㅏ여 경로를 닫는다.
 참고 : https://developer.apple.com/documentation/switui/path
 */
