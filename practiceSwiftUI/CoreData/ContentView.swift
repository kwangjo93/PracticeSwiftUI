//
//  ContentView.swift
//  practiceSwiftUI
//
//  Created by 천광조 on 2/2/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var name = ""
    @State var quantity = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Product.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var products: FetchedResults<Product>
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addProduct()
                    }//Button
                    Spacer()
                    NavigationLink(destination: ResultView(name: name,
                                                           viewContext: viewContext)) {
                        Text("Find")
                    }
                    Spacer()
                    Button("Clear") {
                        name = ""
                        quantity = ""
                    }//Button
                    Spacer()
                }//HStack
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not found")
                        }//HStack
                    }
                    .onDelete(perform: deleteProducts)
                }//List
                .navigationTitle("Product Database")
            }//VStack
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }//NavigationView
    }//body

    private func addProduct() {
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
    
}

#Preview {
    ContentView()
}
