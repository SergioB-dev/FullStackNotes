//
//  File.swift
//  File
//
//  Created by Sergio Bost on 8/30/21.
//

import XCTest
@testable import FullStackNotes

class NoteTests: CustomTestCaseClass {
    
    func buildNotes(_ str: String) -> Note {
        return Note(title: "", body: str, language: .swift)
    }
    
    func testLength() {
        [
        (0...100, "Short"),
        (101...399, "Medium"),
        (400...401, "Long")
        ].forEach { range, expected in
            range.forEach {
                let note = buildNotes(String(repeating: "S", count: $0))
                
                XCTAssertEqual(expected, note.length, "Failed for \($0)")
            }
            
        }
        
    }
    
    func testAltTitle() {
        
    }
    
    func testHasCodeSnippets() { }
    
}
