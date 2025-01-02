//
//  Card_SET_App.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/6/24.
//

import SwiftUI

@main
struct Card_SET_App: App {
    @StateObject var game = SetViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
