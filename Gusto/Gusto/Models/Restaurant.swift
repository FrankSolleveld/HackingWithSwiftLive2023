//
//  Restaurant.swift
//  Gusto
//
//  Created by Frank Solleveld on 27/06/2023.
//

import SwiftData

@Model
class Restaurant {
    var name: String
    var priceRating: Int
    var qualityRating: Int
    var speedRating: Int
    @Relationship(.cascade) var dishes: [Dish]

    var totalRating: Double {
        (Double(qualityRating + priceRating + speedRating) / 3).rounded()
    }

    init(name: String, priceRating: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.priceRating = priceRating
        self.qualityRating = qualityRating
        self.speedRating = speedRating
        self.dishes = []
    }
}

@Model
class Dish {
    var name: String
    var review: String

    init(name: String, review: String) {
        self.name = name
        self.review = review
    }
}
