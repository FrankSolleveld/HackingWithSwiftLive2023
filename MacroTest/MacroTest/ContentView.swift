//
//  ContentView.swift
//  MacroTest
//
//  Created by Frank Solleveld on 26/06/2023.
//

import SwiftUI

import SymbolValidator

struct ContentView: View {
    let url = #URL("url here")

    var body: some View {
        VStack {
            Image(systemName: #symbol("globe"))
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
