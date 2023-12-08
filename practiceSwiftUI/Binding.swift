//
//  Binding.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/3/23.
//

import SwiftUI

struct Bindingpractice: View {
    @State
        private var isActivated: Bool = false

        var body: some View {
            NavigationView{
                VStack{
                    HStack{
                        MyVstackView(isActivated: $isActivated)
                        MyVstackView(isActivated: $isActivated)
                        MyVstackView(isActivated: $isActivated)
                        
                    } // Hstack
                        .padding(isActivated ? 50.0 : 10.0)
                        //
                        .background(isActivated ? Color.yellow : Color.black)
                       // 탭 재스쳐 추가
                        .onTapGesture {
                            print("HStack 이 클릭되었다.")
                            withAnimation {
                                self.isActivated.toggle()
                            }
                    }// Hstack
            
                    //Binding 값 넘겨주기
                    NavigationLink(destination: MyTextView(isActivated: $isActivated) ){
                        Text("네비게이션")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                    } .padding(.top, 50)
                }
                
            } // NavigationView
        }
    }//body

struct MyVstackView: View {
    @Binding
    var isActivated: Bool
 
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
             Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 60))
             Text("2!")
               .fontWeight(.bold)
                .font(.system(size: 60))
             Text("3!")
              .fontWeight(.bold)
                .font(.system(size: 60))
        } // Vstack
            .background(self.isActivated ? Color.green : Color.red)
            .padding(self.isActivated ? 10 : 0)
    }
}


struct MyTextView: View {
    
       @Binding
       var isActivated: Bool
       
       init(isActivated: Binding<Bool> = .constant(false)) {
           _isActivated = isActivated
       }
   
    @State
    private var index: Int = 0
    
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
            //최소, 최대 값으로 프레임 설정
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray)
                .background(self.isActivated ? Color.black : Color.white)
            Spacer()
        } // VStack
        .background(backgroundColors[index])
        //safeArea 를 무시하고 풀화면으로 설정
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템이 클릭 되었다.")
            if(self.index == self.backgroundColors.count - 1){
                self.index = 0
            } else {
                self.index += 1
            }
        } // onTapGesture
    }//Body
    
    
}



#Preview {
    Bindingpractice()
}
