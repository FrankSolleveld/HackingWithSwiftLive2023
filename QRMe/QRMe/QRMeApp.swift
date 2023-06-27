//
//  QRMeApp.swift
//  QRMe
//
//  Created by Paul Hudson on 27/06/2023.
//

import SwiftUI

@main
struct QRMeApp: App {
    @State private var viewModel = QRMe()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
