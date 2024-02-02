//
//  CoreDataDemoApp.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/2/24.
//

import SwiftUI

struct CoreDataDemoApp: View {
    let persistenceController = PersistenceController.shared
    var body: some View {
        ContentView()
            .environment(\.managedObjectContext,
                          persistenceController.container.viewContext)
    }
}

#Preview {
    CoreDataDemoApp()
}
