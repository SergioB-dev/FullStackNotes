//
//  StateManager.swift
//  StateManager
//
//  Created by Sergio Bost on 8/20/21.
//

import SwiftUI

final class StateManager: ObservableObject {
    @Published var displayChoice: DisplayChoice = .allNotes
    
    func beautifyCodeSnippet(code: String) -> String {
        let colors = [Color.green, .blue, .orange, .red, .pink]
        var workingString = code.components(separatedBy: ".")
        var workingList = [NSAttributedString]()
        
        for str in workingString {
            let randomNumber = Int.random(in: 0...4)
            workingList.append(NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor : colors[randomNumber]]))
        }
       // return String(workingList[0])
    }
}

enum DisplayChoice : String, CaseIterable, Identifiable {
    
    case allNotes = "All"
    case byCategory = "By Category"
    
    var id: String { self.rawValue }
}
