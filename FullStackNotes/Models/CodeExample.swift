//
//  API.swift
//  API
//
//  Created by Sergio Bost on 8/21/21.
//

import Foundation

struct CodeExample: Identifiable {
    let id = UUID()
    let name: String
    let type: APIType
    var codeSnippet: [String]?
    var tags: [String]?
}

enum APIType {
    case array
    case dictionary
    case higherOrderFunction
    case languageSpecific
}
