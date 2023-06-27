//
//  ContentView.swift
//  QRMe
//
//  Created by Paul Hudson on 27/06/2023.
//

import CoreImage.CIFilterBuiltins
import Observation
import SwiftUI

@Observable
class QRMe {
    var name: String {
        get {
            access(keyPath: \.name)
            return UserDefaults.standard.string(forKey: "name") ?? "Anonymous"
        }

        set {
            withMutation(keyPath: \.name) {
                UserDefaults.standard.setValue(newValue, forKey: "name")
            }
        }
    }

    var emailAddress: String {
        get {
            access(keyPath: \.emailAddress)
            return UserDefaults.standard.string(forKey: "email") ?? "example@test.com"
        }

        set {
            withMutation(keyPath: \.emailAddress) {
                UserDefaults.standard.setValue(newValue, forKey: "email")
            }
        }
    }

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    var qrCode: Image {
        let combinedString = "\(name)\(emailAddress)"
        filter.message = Data(combinedString.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                let uiImage = UIImage(cgImage: cgimg)
                return Image(uiImage: uiImage)
            }
        }

        return Image(systemName: "xmark.circle")
    }
}

struct ContentView: View {
    @Environment(QRMe.self) var viewModel
    var body: some View {
        @Bindable var viewModel = viewModel

        Form {
            TextField("Enter your name", text: $viewModel.name)
            TextField("Enter your email address", text: $viewModel.emailAddress)

            Section("Your QRMe code") {
                viewModel.qrCode
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(QRMe())
}
