//
//  asyncStream.swift
//  MacSandbox
//
//  Created by Frank Solleveld on 26/06/2023.
//

import SwiftUI

class URLWatcher {
    let (stream, continuation) = AsyncStream.makeStream(of: Data.self)
    private var task: Task<Void, Never>?

    var url: URL?
    var delay: Double = 10

    init(task: Task<Void, Never>? = nil, delay: Double = 10) {
        self.task = task
        self.delay = delay

        watch()
    }

    private func watch() {
        task = Task {
            do {
                while true {
                    guard let url else { return }

                    try await Task.sleep(for: .seconds(delay))
                    let (contents, _) = try await URLSession.shared.data(from: url)
                    continuation.yield(contents)
                }
            } catch {
                continuation.finish()
            }
        }
    }

    func cancel() {
        task?.cancel()
    }
}

//try await Task.sleep(for: .seconds(1), tolerance: .seconds(0.5))
//
//try await withThrowingTaskGroup(of: Void.self) { group in
//    // Work
//}
//
//try await withThrowingDiscardingTaskGroup { group in
//    // Work
//}
