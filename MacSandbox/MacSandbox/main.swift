//
//  main.swift
//  MacSandbox
//
//  Created by Frank Solleveld on 26/06/2023.
//

// MARK: If and Switch Statement

import SwiftUI

struct ContentView: View {
    @State private var isRed = false
    var body: some View {
        Button("Change Color") {
            isRed.toggle()
        }
        .foregroundColor(isRed ? .red : .blue)
        // This does not work above here if you would use the if and switch statement
    }
}

enum DeviceError: Error {
    case unsupportedDevice(String)
}

enum DeviceFamily {
    case iPhone
    case iPad
    case tv
    case watch
    case android

    var displayName: String {
        do {
            let result = switch self {
            case .iPhone: "iPhone"
            case .iPad: "iPad"
            case .tv: "Apple TV"
            case .watch: "Apple Watch"
            case .android:
                let reason = "We only support SwiftUI-capable devices."
                throw DeviceError.unsupportedDevice(reason)
            }
            return result
        } catch {
            fatalError("Sorry, not for you.")
        }
    }
}

let age = 18

let canVote = if age > 18 {
    "Yes"
} else if age >= 16 {
    "Soon"
} else {
    "No"
}
//let canVote: String
//if age > 18 {
//    canVote = "Yes"
//} else if age >= 16 {
//    canVote = "Soon"
//} else {
//    canVote = "No"
//}

func calculateResult (for score: Int) -> String {
    switch score {
    case ...40: "Fail"
    case 41...50: "E"
    case 51...60: "D"
    case 61...70: "C"
    case 71...85: "B"
    case 85...: "A"
    default: fatalError ("What did you score?!")
    }
}

print(calculateResult(for: 79))

