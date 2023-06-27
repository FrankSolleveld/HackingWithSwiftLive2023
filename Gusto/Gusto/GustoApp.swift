//
//  GustoApp.swift
//  Gusto
//
//  Created by Frank Solleveld on 27/06/2023.
//

import SwiftUI
import SwiftData

@main
struct GustoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Restaurant.self)
    }
}
