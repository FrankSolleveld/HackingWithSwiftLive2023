//
//  ActivityProgressView.swift
//  WorkLess
//
//  Created by Paul Hudson on 26/06/2023.
//

import SwiftUI

struct ActivityProgressView: View {
    @Environment(DataController.self) var dataController
    @State private var isPressed = false
    var item: ActivityProgress

    var body: some View {
        HStack {
            let _ = print("Invoking body of \(item.id)")
            Image(item.id)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(item.id)

                ProgressView(value: item.completion)
                    .tint(item.isComplete ? .green : .accentColor)
            }

            Button {
                isPressed.toggle()
                withAnimation {
                    dataController.add(to: item)
                }
            } label: {
                Label(item.progressTitle, systemImage: item.progressIcon)
                    .labelStyle(.iconOnly)
                    .symbolEffect(.bounce, value: isPressed)
            }
            .disabled(item.isComplete)
            .buttonStyle(.bordered)
            .clipShape(Circle())
        }
    }
}


