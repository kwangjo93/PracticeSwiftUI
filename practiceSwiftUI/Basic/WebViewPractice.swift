//
//  WebViewPractice.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/4/23.
//

import SwiftUI
import WebKit

struct WebViewPractice: View {
    
    
    var body: some View {
        
        NavigationView{
            HStack {
                NavigationLink(destination: MyWebView(urlString: "www.naver.com")
                    .edgesIgnoringSafeArea(.all)
                ) {
                    Text("네이버")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebView(urlString: "www.Youtube.com")
                    .edgesIgnoringSafeArea(.all)
                ) {
                    Text("유튜브")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebView(urlString: "www.google.com")
                    .edgesIgnoringSafeArea(.all)
                ) {
                    Text("구글")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
            }//HStack
        }//NavigationView
    }//body
    
}

#Preview {
    WebViewPractice()
}


struct MyWebView: UIViewRepresentable {
 
    var urlString: String
    
    //UIView 만들기
    func makeUIView(context: Context) -> some WKWebView {
        guard let urlString = URL(string: urlString) else { return WKWebView()}
        let webView = WKWebView()
        webView.load(URLRequest(url: urlString))
        return webView
    }
    
    //UI Update
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<MyWebView>) {
        
    }
    
    
}



/*
- inf.plist 에서 App Transport Security Setting -> Allow Arbritary Loads -> Yes
- UIKit의 UIView 를 사용할 수 있도록 하는 것 -> UIViewRepresentable 사용
 */
