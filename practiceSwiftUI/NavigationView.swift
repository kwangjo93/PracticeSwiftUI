//
//  NavigationView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/9/23.
//

import SwiftUI

struct NavigationViewPractice: View {
    var body: some View {
        NavigationView{
            Text("NavigationView")
//                .navigationTitle("하위요")
//                .navigationBarTitle("하위요")
                .navigationBarTitle("하위요", displayMode: .large)//.inline, .automatic
                .navigationBarItems(
                       leading: Button(action: {
                           print("person")
                       }) {
                           Image(systemName: "person")
                               .font(.largeTitle)
                       },
                       trailing: Button(action: {
                           print("right button")
                       }) {
                           Text("오른쪽 버튼")
                       }
                   )
//                .navigationBarHidden(true)
//                .navigationBarBackButtonHidden(true)
            
        }//NavigationView
        
    }//body
}

#Preview {
    NavigationViewPractice()
}
