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
    var apiStore: [API]
    let id = UUID()
    
    var length: String {
        switch body.count {
        case 0..<100:
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
    
    
    private var favorite = false
    
    init(title: String, altTitle: String? = nil, body: String, language: Language, apiStore: [API] = []) {
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
    
    
}

// Should we keep the long body with Lorem Ipsum?

struct MockData {
    static let notes = [
        Note(title: "List Comprehension", body: "SwiftUI views all either have an implicit ID or an explicit one. This way SwiftUI knows which view to re-render during state change", language: .python),
        Note(title: "Map Function", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.",  language: .swift, apiStore: MockData.apis),
        Note(title: "Custom Filter", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.",  language: .haskell),
        Note(title: "URL Request", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed massa venenatis, pharetra erat elementum, volutpat dui. Integer elementum efficitur tempus. Nam in fringilla neque. Donec lacinia lacinia feugiat. Cras venenatis, tellus gravida gravida imperdiet, quam nulla rutrum nisi, vel blandit mauris nisl id ipsum. Mauris convallis odio tortor, in facilisis augue molestie vitae. Vivamus sollicitudin justo sit amet dolor facilisis iaculis. Cras pulvinar augue velit, non rutrum elit tincidunt in. Fusce pulvinar ligula vitae dapibus pretium. Sed sit amet dui facilisis, fringilla tortor id, rhoncus ex. Vestibulum ut massa elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eu mauris id tortor varius venenatis. Mauris a metus lorem. Fusce sed lectus commodo, tristique nisi facilisis, sodales est. Sed quam arcu, lobortis vitae elit eu, varius dictum leo.",  language: .java),
    
    ]
    static let apis = [
        API(name: "Reduce", type: .dictionary, codeSnippet: MockData.codeSnippets, tags: []), API(name: "Abstraction", type: .languageSpecific, codeSnippet: MockData.codeSnippets, tags: []), API(name: "Network URL Request", type: .dictionary, codeSnippet: MockData.codeSnippets, tags: [])
    ]
    
    static let codeSnippets = [
        "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 6}.filter {$0 % 2 == 0}",
        "myArray.map{$0 * 6}.filter {$0 % 4 == 0}", "myArray.map{$0 * 6}.filter {$0 % 6 == 0}",
        "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 5}.filter {$0 % 3 == 0}"
    ]
}

enum Language {
    case swift
    case python
    case haskell
    case csharp
    case objc
    case ruby
    case java
    case javascript
    
    var image: String {
        switch self {
        case .swift:
            return "swift"
        case .python:
            return "python"
        case .haskell:
            return "haskell"
        case .csharp:
            return "c#"
        case .objc:
            return "objc"
        case .ruby:
            return "ruby"
        case .java:
            return "java"
        case .javascript:
            return "js"
        }
    }
    
}



