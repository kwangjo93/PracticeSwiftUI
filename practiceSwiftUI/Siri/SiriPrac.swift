//
//  SiriPrac.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/3/24.
//

import SwiftUI
import Intents

struct SiriPrac: View {
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { oldValue, newValue in
                INPreferences.requestSiriAuthorization { status in
                    //상태에 따라 처리.
                }
            }
    }
}

#Preview {
    SiriPrac()
}
