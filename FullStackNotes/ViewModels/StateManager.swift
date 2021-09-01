//
//  StateManager.swift
//  StateManager
//
//  Created by Sergio Bost on 8/20/21.
//

import SwiftUI

final class StateManager: ObservableObject {
    @Published var displayChoice: DisplayChoice = .allNotes
    
    func beautifyCodeSnippet(word: String) -> AttributedString {
        let colors: [Color] = [.indigo, .blue, .pink, .green, .mint]
        let items = word.components(separatedBy: ".")
        var aString = AttributedString(word)
        
        for item in items {
            let range = aString.range(of: item)!
            aString[range].foregroundColor = colors[Int.random(in: 0...4)]
            
            let bRange = aString.range(of: "{")!
            let cRange = aString.range(of: "}")!
            aString[bRange].foregroundColor = .black
            aString[cRange].foregroundColor = .black
            
        }
        print(aString.runs.count)
        
        return aString
    }
}

enum DisplayChoice : String, CaseIterable, Identifiable {
    
    case allNotes = "All"
    case byCategory = "By Category"
    
    var id: String { self.rawValue }
}
