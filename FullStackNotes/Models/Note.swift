//
//  Note.swift
//  Note
//
//  Created by Sergio Bost on 8/19/21.
//

import Foundation

struct Note: Identifiable {
    
    let title: String
    var altTitle: String?
    let body: String
    let language: Language
    var apiStore: [CodeExample]
    let id = UUID()
    
    private var favorite = false
    
    var length: String {
        switch body.count {
        case 0...100:
            return "Short"
        case 101..<400:
            return "Medium"
        default:
            return "Long"
        }
    }
    var hasAltTitle: Bool {
        altTitle != nil
    }
    var codeSnippets: Int {
        var count = 0
        for apiRef in apiStore {
            if let apiCount = apiRef.codeSnippet?.count {
                count += apiCount
            }
        }
        return count
    }
    var hasCodeSnippets: Bool {
        if apiStore.isEmpty {
            return false
        }
        return apiStore[0].codeSnippet != nil
    }
    
    init(title: String, altTitle: String? = nil,
         body: String, language: Language,
         apiStore: [CodeExample] = []) {
        self.title = title
        self.altTitle = altTitle
        self.language = language
        self.body = body
        self.apiStore = apiStore
    }

    mutating func makeFavorite() {
        self.favorite = true
    }
    
    mutating func unFavorite() {
        self.favorite = false
    }
    
    func stepThroughCodeSnippets(forward: Bool = true, completion: () -> Void) {
        guard !apiStore.isEmpty else { return }
        
    }
}

// Should we keep the long body with Lorem Ipsum?

struct MockData {
    static var notes = [
        Note(title: "List Comprehension", body:
                """
                SwiftUI views all either have an implicit ID or
                an explicit one. This way Swi
                ftUI knows which view to
                re-render during state change
                """,
             language: .python, apiStore: MockData.apis),
        Note(title: "Map Function", body:
                """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui.
                Integer elementum efficitur tempus. Nam in fringilla neque.
                Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet,
                quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor,
                in facilisis augue molestie vitae. Vivamus sollicitudin
                justo sit amet dolor facilisis iaculis.
                Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce
                pulvinar ligula vitae dapibus pretium.
                Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex.
                Vestibulum ut massa elit.
                Interdum et malesuada fames ac ante ipsum primis in faucibus.
                Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem.
                Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu,
                lobortis vitae elit eu, varius dictum leo.
                """,
 language: .swift, apiStore: MockData.apis),
        Note(title: "Custom Filter", body:
                """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis,
                pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus.
                Nam in fringilla neque. Donec lacinia lacinia feugiat.
                Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi,
                vel blandit mauris nisl id ipsum. Mauris convallis odio tortor,
                in facilisis augue molestie vitae. Vivamus sollicitudin justo
                sit amet dolor facilisis iaculis.
                Cras pulvinar augue velit, non rutrum elit tincidunt in.
                Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis,
                fringilla tortor id, rhoncus ex. Vestibulum ut massa elit.
                Interdum et malesuada fames ac ante ipsum primis in faucibus.
                Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem.
                Fusce sed lectus commodo, tristique nisi facilisis, sodales est.
                Sed quam arcu, lobortis vitae elit eu, varius dictum leo.
                """,
             language: .haskell, apiStore: MockData.apis),
        Note(title: "URL Request", body:
                """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed
                massa venenatis, pharetra erat elementum, volutpat dui. Integer
                elementum efficitur tempus. Nam in fringilla neque. Donec lacinia
                lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet,
                quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris
                convallis odio tortor, in facilisis augue molestie vitae. Vivamus
                sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar
                augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae
                dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id,
                rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante
                ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis.
                Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis,
                sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.
                """,
             language: .java, apiStore: MockData.apis)
    
    ]
    static let apis = [
        CodeExample(name: "Reduce", type: .dictionary,
                    codeSnippet: MockData.codeSnippets, tags: []),
        CodeExample(name: "Abstraction", type: .languageSpecific,
                    codeSnippet: MockData.codeSnippets, tags: []),
        CodeExample(name: "Network URL Request", type: .dictionary,
                    codeSnippet: MockData.codeSnippets, tags: [])
    ]
    
    static let codeSnippets = [
        "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 6}.filter {$0 % 2 == 0}",
        "myArray.map{$0 * 6}.filter {$0 % 4 == 0}", "myArray.map{$0 * 6}.filter {$0 % 6 == 0}",
        "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 5}.filter {$0 % 3 == 0}"
    ]
}
