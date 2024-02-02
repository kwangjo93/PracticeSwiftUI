//
//  ResultView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/2/24.
//

import SwiftUI
import CoreData

struct ResultView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    @State var matches: [Product]?
    
    var body: some View {
        return VStack {
            List {
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
            }//List
            .navigationTitle("Results")
        }//VStack
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name)
            matches = try? viewContext.fetch(fetchRequest)
        }
    }//body
}


//#Preview {
//    ResultView()
//}
