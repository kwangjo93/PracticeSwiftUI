//
//  PersistenceController.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/2/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        self.container = NSPersistentContainer(name: "Products")
        container.loadPersistentStores { (storeDescription, error ) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
