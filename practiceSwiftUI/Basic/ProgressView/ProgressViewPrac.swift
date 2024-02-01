//
//  ProgressViewPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/1/24.
//

import SwiftUI

struct ProgressViewPrac: View {
    @State private var progress: Double = 1.0
    var body: some View {
        VStack {
            ProgressView("Task Progress 1", value: progress, total: 100)
                .tint(.orange)
            ProgressView("Task Progress 2", value: progress, total: 100)
                .tint(.orange)
            ProgressView("Task Progress 3", value: progress, total: 100)
                .tint(.orange)
        }
        .progressViewStyle(.automatic)
        .padding()
        ProgressView("Rest", value: progress, total: 100)
            .progressViewStyle(CircularProgressViewStyle())
        ProgressView("Working...")
        VStack {
            ProgressView("Custom Shadw Style", value: progress, total: 100)
                .progressViewStyle(ShadowProgressViewStyle())
            ProgressView("Custom Text Style", value: progress, total: 100)
                .progressViewStyle(MyCustomProgressViewStyle())
            ProgressView("Custom Shape Style", value: progress, total: 100)
                .progressViewStyle(CustomProgressShapeStyle())
            Slider(value: $progress, in: 1...100, step: 0.1)
                .tint(.red)
                .padding()
        }
    }
}

#Preview {
    ProgressViewPrac()
}


//custom style
struct ShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .tint(.red)
            .shadow(color: Color(red: 0, green: 0.7, blue: 0),
                    radius: 5.0,
                    x: 2.0,
                    y: 2.0)
            .progressViewStyle(.linear)
    }
}

//View를 리턴하기 때문에 어떤 뷰의 인스턴스로도 사용이 가능하다.
//fractionCompleted는 progress value을 가지고 계산해주는 메서드.
struct MyCustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let percent = Int(configuration.fractionCompleted! * 100)
        return Text("Task \(percent)% Complete")
    }
}

struct CustomProgressShapeStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        let degrees = configuration.fractionCompleted! * 360
        let percent = Int(configuration.fractionCompleted! * 100)
        return VStack {
            MyCircle(startAngle: .degrees(degrees), endAngle: .degrees(1))
                .frame(width: 200, height: 200)
                .padding(50)
            Text("Task \(percent)% Complete")
        }
        
    }
}

struct MyCircle: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.height / 2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)
        return path.strokedPath(.init(lineWidth: 50,
                                     dash: [5, 2],
                                     dashPhase: 10))
    }
}
