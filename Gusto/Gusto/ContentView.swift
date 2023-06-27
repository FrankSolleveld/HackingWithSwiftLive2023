//
//  ContentView.swift
//  Gusto
//
//  Created by Frank Solleveld on 27/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var navPath = [Restaurant]()
    @State private var sortOrder = SortDescriptor(\Restaurant.name)
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                RestaurantListingView(sort: sortOrder, searchString: searchText)
            }
            .searchable(text: $searchText)
            .navigationTitle("Gusto")
            .navigationDestination(for: Restaurant.self) {
                EditRestaurantView(restaurant: $0)
            }
            .toolbar {
                Button("Add Samples", action: addSamples)
                Button(action: addNewRestaurant) {
                    Label {
                        Text("Add new restaurant")
                    } icon: {
                        Image(systemName: "plus")
                    }

                }

                Menu("Sort") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\Restaurant.name))

                        Text("Price")
                            .tag(SortDescriptor(\Restaurant.priceRating, order: .reverse))

                        Text("Quality")
                            .tag(SortDescriptor(\Restaurant.qualityRating, order: .reverse))

                        Text("Speed")
                            .tag(SortDescriptor(\Restaurant.speedRating, order: .reverse))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }

    private func addSamples() {
        let exampleRestaurants = [
            Restaurant(name: "Wok this Way", priceRating: 5, qualityRating: 4, speedRating: 3),
            Restaurant(name: "Thyme Square", priceRating: 3, qualityRating: 4, speedRating: 2),
            Restaurant(name: "Pasta la Vista", priceRating: 4, qualityRating: 4, speedRating: 3),
            Restaurant(name: "Life of Pie", priceRating: 1, qualityRating: 5, speedRating: 5),
            Restaurant(name: "Lord of the Wings", priceRating: 5, qualityRating: 5, speedRating: 5)
        ]

        exampleRestaurants.forEach {
            // Insert objects into the modelContext
            modelContext.insert($0)
        }
    }

    private func addNewRestaurant() {
        let newRestaurant = Restaurant(name: "New Restaurant", priceRating: 3, qualityRating: 3, speedRating: 3)
        modelContext.insert(newRestaurant)

        navPath = [newRestaurant]
    }

//    private func deleteAllRestaurants() {
//        try modelContext.delete(model: Restaurant.self)
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Restaurant.self, inMemory: true)
}
