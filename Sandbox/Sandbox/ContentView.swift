//
//  ContentView.swift
//  Sandbox
//
//  Created by Frank Solleveld on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var triggerAnimation = false
    var body: some View {
        NavigationStack {
            Button(action: { triggerAnimation.toggle() }, label: {
                Label(
                    title: { Text("Taste the Rainbow") },
                    icon: { Image(systemName: "rainbow") }
                )
            })
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.variableColor, value: triggerAnimation)
            .font(.title)
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

/*
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
 */

/*
 ScrollView {
     VStack {
         ForEach(1..<11) { i in
             RoundedRectangle(cornerRadius: 12)
                 .fill(.indigo.gradient)
                 .frame(height: 200)
                 .scrollTransition(
                     topLeading: .identity,
                     bottomTrailing: .animated(.bouncy)
                 ) { content, phase in
                     content
                         .scaleEffect(phase == .topLeading ? 0.9 : 1)
                 }
         }
     }
 }
 .contentMargins(16, for: .scrollContent)
 */

/*
 ScrollView {
     VStack {
         Button(action: { flashNow.toggle() }, label: {
             Text("Flash!")
         })

         ForEach(1..<11) { i in
             RoundedRectangle(cornerRadius: 12)
                 .fill(.indigo.gradient)
                 .frame(height: 200)
         }
     }
 }
 .contentMargins(16, for: .scrollContent)
 // Indicator will briefly pop up onAppear.
 .scrollIndicatorsFlash(trigger: flashNow)
 */

/*
 Button(action: { triggerEffect.toggle() }, label: {
     Text("Hit Me!")
 })
 .sensoryFeedback(.impact, trigger: triggerEffect)
 */

/*
 @State private var completionCount = 0
 var body: some View {
     NavigationStack {
         Button(action: { completionCount += 1 }, label: {
             Label(
                 title: { Text("Times Completed: \(completionCount)") },
                 icon: { Image(systemName: "checkmark.rectangle.stack.fill") }
             )
         })
         .symbolEffect(.bounce, options: .repeat(3).speed(0.1),value: completionCount)
     }
 }
 */
