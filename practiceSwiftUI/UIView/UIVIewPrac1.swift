//
//  UIVIewPrac1.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/4/24.
//

import SwiftUI

struct UIVIewPrac1: View {
    var body: some View {
        MyScrollView(text: "안녕하세요")
    }
}

#Preview {
    UIVIewPrac1()
}

// UILabel
struct MyUILabel: UIViewRepresentable {
    var text: String

    // makeUIView 함수에서는 뷰를 생성하고 초기화하는 작업을 해야합니다.
    func makeUIView(context: Context) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }

    // updateUIView 함수에서는 뷰의 업데이트 작업을 수행합니다.
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}

struct MyScrollView: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator,
                                             action: #selector(Coordinator.handleRefresh),
                                             for: .valueChanged)
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        myLabel.text = text
        scrollView.addSubview(myLabel)
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //coordinator
    class Coordinator: NSObject, UIScrollViewDelegate {
        var control: MyScrollView
        
        init(_ control: MyScrollView) {
            self.control = control
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("View is Scrolling")
        }
        
        @objc func handleRefresh(sender: UIRefreshControl) {
            sender.endRefreshing()
        }
    }
}

