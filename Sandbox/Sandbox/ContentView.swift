//
//  ContentView.swift
//  Sandbox
//
//  Created by Frank Solleveld on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(1..<11) { i in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.teal.gradient)
                            .frame(height: 120)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(.horizontal, 16, for: .scrollContent)
        }
    }
}

#Preview {
    ContentView()
}

/*
 ScrollView {
     ForEach(0..<100) { i in
         Text("Item \(i)")
             .frame(maxWidth: .infinity)
             .frame(height: 135)
             .background(
                 RoundedRectangle(cornerRadius: 12)
                     .fill(.blue.gradient)
             )
             .padding(.horizontal)
     }
     .scrollTargetLayout()
 }
 .scrollTargetBehavior(.viewAligned(limitBehavior: .never))
 .navigationTitle("Sandbox")
 */

/*
 List {
     Section {
         RoundedRectangle(cornerRadius: 12)
             .fill(.indigo.gradient)
             .frame(height: 200)
             .listRowBackground(Color.clear)
             .listRowInsets(.init())
     }

     ForEach(1..<100) { i in
         Text("Row \(i)")
     }
 }
 .contentMargins(.top, 260, for: .scrollIndicators)
 */

/*
 ScrollView(.horizontal, showsIndicators: false) {
     HStack {
         ForEach(1..<12) { i in
             RoundedRectangle(cornerRadius: 12)
                 .fill(.mint.gradient)
                 .frame(width: 200, height: 120)
         }
     }
 }
 .contentMargins(40, for: .scrollContent)
 */
