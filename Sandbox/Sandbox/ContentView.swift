//
//  ContentView.swift
//  Sandbox
//
//  Created by Frank Solleveld on 26/06/2023.
//

import SwiftUI
import Observation

@Observable
class ViewModel {
    var name = "Taylor"
    var age = 26
}

struct ContentView: View {
    var body: some View {
        NavigationStack {}
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

/*
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
 */

/*
 enum AnimationPhases: CaseIterable {
     case start, movingUp, scalingUp, movingDown
 }

 struct ContentView: View {
     @State private var isLiked = false

     var body: some View {
         NavigationStack {
             VStack {
                 Button(action: { isLiked.toggle() }, label: {
                     Image(systemName: "heart")
                         .symbolVariant(isLiked ? .fill : .none)
                 })
                 .foregroundColor(.red)
                 .font(.largeTitle)
                 .phaseAnimator(isLiked ? AnimationPhases.allCases : [.start], trigger: isLiked) { content, phase in
                     content
                         .scaleEffect(phase == .scalingUp ? 2 : 1)
                         .offset(y: phase != .start ? -50 : 0)
                 }
                 /*
                  animation: { phase in
                     if phase {
                         .easeIn
                     } else {
                         .snappy
                     }
                 }
                  */
             }
         }
     }
 }
 */

/*
 NavigationStack {
     ScrollView {
         ForEach(0..<100) { i in
             Text("This is an example text message bubble.")
                 .padding(10)
                 .foregroundColor(.white)
                 .background(.blue.gradient)
                 .clipShape(Capsule())
                 .frame(maxWidth: .infinity, alignment: .trailing)
                 .visualEffect { content, proxy in
                     content
                         .hueRotation(-.degrees(proxy.frame(in: .global).minY / 45))
                 }
         }
     }
     .contentMargins(.trailing, 10, for: .scrollContent)
 }
 */

/*
 size = 50.0
 NavigationStack {
     Circle()
         .fill(.red)
         .frame(width: size, height: size)
         .visualEffect { content, proxy in
             content
                 .hueRotation(-.degrees(proxy.size.width / 2))
         }
         .onAppear {
             withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                 size = 250
             }
         }
 }
 */

/*
 NavigationStack {
     Text("This is an important title.")
         .padding()
         .background(.blue)
         .foregroundStyle(.white)
         .clipShape(.rect(cornerRadii: .init(topLeading: 20, bottomTrailing: 20)))
 }
 */
