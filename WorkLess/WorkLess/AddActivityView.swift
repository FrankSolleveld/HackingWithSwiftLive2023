//
//  ContentView.swift
//  WorkLess
//
//  Created by Paul Hudson on 26/06/2023.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(DataController.self) var dataController
    @Environment(\.dismiss) var dismiss

    @State private var unusedActivities = [Activity]()

    var body: some View {
        NavigationStack {
            Group {
                if unusedActivities.isEmpty {
                    ContentUnavailableView {
                        Label("You got all activities!", systemImage: "checkmark.seal.fill")
                    } description: {
                        Text("Maybe get back to work...")
                    }
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(unusedActivities) { activity in
                                Button {
                                    dataController.add(activity)
                                    dismiss()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Image(activity.id)
                                            .resizable()
                                            .scaledToFit()

                                        Text(activity.id)
                                            .font(.largeTitle)

                                        Text(activity.summary)
                                            .multilineTextAlignment(.leading)

                                        HStack {
                                            Text("**Difficulty:** \(activity.difficulty)")

                                            Spacer()

                                            Text("**Time:** \(activity.time)")
                                        }
                                    }
                                    .foregroundStyle(.white)
                                    .padding(20)
                                    .background(.blue.gradient)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .containerRelativeFrame(.horizontal, alignment: .center)
                                    .visualEffect { content, proxy in
                                            content
                                            .rotation3D(.degrees(proxy.frame(in: .scrollView).minX / 20), axis: (x: 0, y: -1, z: 0))
                                    }
                                }
                            }
                        }
                        .scrollTargetLayout()
                        .fixedSize()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(20, for: .scrollContent)
                }
            }
            .navigationTitle("Add Activity")
            .onAppear {
                unusedActivities = dataController.unusedActivities
            }
        }
    }
}

#Preview {
    AddActivityView()
        .environment(DataController())
}
