//
//  ContentView.swift
//  TestAsyncAwaitObjc
//
//  Created by Carlos Jimenez on 2024-04-08.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Test Async") {
                Task {
                    let result = try await TestClass().testAsyncCall()
                    print(result)
                }
            }
            CustomButtonRepresentable()
                .frame(width: 150, height: 50)

        }
        .padding()
    }
}

struct TestClass {
    func testAsyncCall() async throws -> String {
        print("timer on")
        try await Task.sleep(nanoseconds: 1_950_000_000)
        print("timer off")
        return "Result"
    }
}

class AsyncBridge: NSObject {

    @objc func callAsyncMethod() async throws -> String {
        let result = try await TestClass().testAsyncCall()
        return result
    }
}

struct CustomButtonRepresentable: UIViewRepresentable {

    func makeUIView(context: Context) -> CustomView {
        let customView = CustomView()
        return customView
    }

    func updateUIView(_ uiView: CustomView, context: Context) { }
}

#Preview {
    ContentView()
}
