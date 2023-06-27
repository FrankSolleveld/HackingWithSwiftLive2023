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
    @Query var restaurants: [Restaurant]

    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .bold()
                            .padding(.bottom, 12)

                        HStack(spacing: 30) {
                            HStack {
                                Image(systemName: "dollarsign.circle")
                                Text(String(restaurant.priceRating))
                            }

                            HStack {
                                Image(systemName: "hand.thumbsup")
                                Text(String(restaurant.qualityRating))
                            }

                            HStack {
                                Image(systemName: "bolt")
                                Text(String(restaurant.speedRating))
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Gusto")
            .toolbar {
                Button("Add Samples", action: addSamples)
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
}

#Preview {
    ContentView()
        .modelContainer(for: Restaurant.self, inMemory: true)
}
