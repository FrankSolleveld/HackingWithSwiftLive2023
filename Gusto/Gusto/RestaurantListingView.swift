//
//  RestaurantListingView.swift
//  Gusto
//
//  Created by Frank Solleveld on 27/06/2023.
//

import SwiftUI
import SwiftData

struct RestaurantListingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [
        SortDescriptor(\.priceRating, order: .reverse),
        SortDescriptor(\.name)
    ]) var restaurants: [Restaurant]

    init(sort: SortDescriptor<Restaurant>, searchString: String = "") {
        _restaurants = Query(
            filter: #Predicate {
                searchString.isEmpty || $0.name.contains(searchString)
            },
            sort: [sort]
        )
    }

    var body: some View {
        ForEach(restaurants) { restaurant in
            NavigationLink(value: restaurant) {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .bold()

                    HStack(spacing: 20) {
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

                        HStack {
                            Image(systemName: "heart")
                            Text(String(restaurant.totalRating))
                        }
                    }
                }
            }
        }
        .onDelete(perform: deleteRestaurant)
    }

    private func deleteRestaurant(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = restaurants[item]
            modelContext.delete(object)
        }
    }
}

struct RestaurantListingView_Previews: PreviewProvider {
    static var previews: some View {
        let configuration = ModelConfiguration(inMemory: true)
        let container = try! ModelContainer(for: Restaurant.self, configuration)
        NavigationStack {
            RestaurantListingView(sort: SortDescriptor(\.name))
                .modelContainer(container)
        }
    }
}
