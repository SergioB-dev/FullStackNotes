//
//  FullStackNotesUITests.swift
//  FullStackNotesUITests
//
//  Created by Sergio Bost on 8/18/21.
//

import XCTest
@testable import FullStackNotes

class FullStackNotesUITests: XCTestCase {

    override func setUpWithError() throws {
    
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBaseNotes() {
        
        XCTAssertTrue(XCUIApplication().staticTexts["List Comprehension"].exists)
        XCTAssertTrue(XCUIApplication().staticTexts["Map Function"].exists)
        XCTAssertTrue(XCUIApplication().staticTexts["Custom Filter"].exists)
        XCTAssertTrue(XCUIApplication().staticTexts["URL Request"].exists)
    }
        
    func testAPITraversal() {
        XCUIApplication().staticTexts["List Comprehension"].tap()
        
         [
            "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 6}.filter {$0 % 2 == 0}",
            "myArray.map{$0 * 6}.filter {$0 % 4 == 0}", "myArray.map{$0 * 6}.filter {$0 % 6 == 0}",
            "myArray.map{$0 * 6}.filter {$0 % 3 == 0}", "myArray.map{$0 * 5}.filter {$0 % 3 == 0}",
            "this == that"
        ].forEach { snippet in
            XCTAssertTrue(XCUIApplication().staticTexts[snippet].exists)
            XCUIApplication().staticTexts["Triangle Arrow Right"].tap()
        }
 
    }
}
