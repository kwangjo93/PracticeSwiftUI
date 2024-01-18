//
//  State2.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/14/24.
//

import SwiftUI

struct State2: View {
    @State private var wifiEnabled = true
    @State private var userNamae = ""
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled, label: {
                Text("Enable Wi - Fi")
            }) //Toggle
            TextField("Enter user name", text: $userNamae)
                .padding()
            Text(userNamae)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
        }
    }
}

#Preview {
    State2()
}
