//
//  TextFieldViewPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 12/18/23.
//

import SwiftUI

struct TextFieldViewPrac: View {
    @State private var userName = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                TextField("아이디를 입력해 주세요.", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)//자동 설정
                Button(action: {
                    self.userName = ""
                }, label: {
                    if userName.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 27))
                            .foregroundColor(.primary)
                    }
                })
            }//HStack
            HStack {
                SecureField("비밀번호를 입력해 주세요.", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                Button(action: {
                    self.password = ""
                }, label: {
                    if password.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 27))
                            .foregroundColor(.primary)
                    }
                })
            }//HStack
            Text("입력한 비밀번호 : \(password)")
        }//VStack
        .padding(.horizontal, 50)
    }
}

#Preview {
    TextFieldViewPrac()
}
