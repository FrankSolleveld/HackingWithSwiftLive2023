//
//  EditRestaurantView.swift
//  Gusto
//
//  Created by Frank Solleveld on 27/06/2023.
//

import SwiftUI
import SwiftData

struct EditRestaurantView: View {
    @Bindable var restaurant: Restaurant

    @State private var showingDishAlert = false
    @State private var dishName = ""
    @State private var dishReview = ""

    var body: some View {
        Form {
            TextField("Name of restaurant", text: $restaurant.name)

            Section("Ratings") {
                Picker("Price", selection: $restaurant.priceRating) {
                    ForEach(0..<6) { i in
                        Text(String(i))
                    }
                }

                Picker("Quality", selection: $restaurant.qualityRating) {
                    ForEach(0..<6) { i in
                        Text(String(i))
                    }
                }

                Picker("Speed", selection: $restaurant.speedRating) {
                    ForEach(0..<6) { i in
                        Text(String(i))
                    }
                }

                Text("Average Score: \(Double(restaurant.totalRating))")
            }

            Section("Dish") {
                ForEach(restaurant.dishes) { dish in
                    Text(dish.name)
                }
            }
        }
        .navigationTitle(restaurant.name)
        .toolbar {
            Button("Add Dish") {
                showingDishAlert.toggle()
            }
        }
        .alert("Add a new dish", isPresented: $showingDishAlert) {
            TextField("Dish Name", text: $dishName)
            TextField("Your review", text: $dishReview)

            Button(action: createDish) {
                Text("Save Dish")
            }
        }
    }

    func createDish() {
        let dish = Dish(name: dishName, review: dishReview)
        restaurant.dishes.append(dish)
    }
}

struct EditRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        let configuration = ModelConfiguration(inMemory: true)
        let container = try! ModelContainer(for: Restaurant.self, configuration)
        NavigationStack {
            EditRestaurantView(restaurant: .init(name: "KFC", priceRating: 5, qualityRating: 4, speedRating: 2))
                .modelContainer(container)
        }
    }
}
