//
//  ContentView.swift
//  WorkLess
//
//  Created by Paul Hudson on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    @State private var showingAddActivity = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    RankView()
                }

                Section("Your Progress") {
                    if dataController.activityProgress.isEmpty {
                        ContentUnavailableView {
                            Label("No Activities", systemImage: "figure.disc.sports")
                        } description: {
                            Text("Get a hobby for once...")
                        } actions: {
                            Button("Add a new hobby") {
                                showingAddActivity.toggle()
                            }
                        }
                    } else {
                        ForEach(dataController.activityProgress) { item in
                            ActivityProgressView(item: item)
                        }
                        .onDelete(perform: deleteProgress)
                    }
                }
            }
            .navigationTitle("Work Less")
            .toolbar {
                Button {
                    showingAddActivity.toggle()
                } label: {
                    Label("Add Activity", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView()
            }
        }
    }

    func deleteProgress(_ indexSet: IndexSet) {
        dataController.removeProgress(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
        .environmentObject(DataController())
}