//
//  CustomTestCase.swift
//  CustomTestCase
//
//  Created by Sergio Bost on 8/30/21.
//

import XCTest

class CustomTestCaseClass: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
}
