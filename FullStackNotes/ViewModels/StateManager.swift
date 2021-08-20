//
//  StateManager.swift
//  StateManager
//
//  Created by Sergio Bost on 8/20/21.
//

import SwiftUI

final class StateManager: ObservableObject {
    @Published var displayChoice: DisplayChoice = .allNotes
}

enum DisplayChoice : String, CaseIterable, Identifiable {
    
    case allNotes = "All"
    case byCategory = "By Category"
    
    var id: String { self.rawValue }
}
