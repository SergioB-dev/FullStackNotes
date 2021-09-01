//
//  Language.swift
//  Language
//
//  Created by Sergio Bost on 9/1/21.
//

import Foundation

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
