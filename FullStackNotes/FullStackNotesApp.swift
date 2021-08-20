//
//  FullStackNotesApp.swift
//  FullStackNotes
//
//  Created by Sergio Bost on 8/18/21.
//

import SwiftUI

@main
struct FullStackNotesApp: App {
    @StateObject private var stateManager = StateManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }.environmentObject(stateManager)
        }
    }
}
