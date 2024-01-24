//
//  DisclosurePrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 1/24/24.
//

import SwiftUI

struct DisclosurePrac: View {
    @State private var stateOne = false
    @State private var stateTwo = false
    @State private var stateThree = false
    var body: some View {
        Form {
            DisclosureGroup {
                Toggle("Allow Notifications", isOn: $stateOne)
                    .padding()
                Toggle("Audible Alerts", isOn: $stateTwo)
                    .padding()
                Toggle("Color Inversion", isOn: $stateThree)
                    .padding()
            } label: {
                Label("Notification Settings", systemImage: "gear")
            }
        }
    }
}

#Preview {
    DisclosurePrac()
}
