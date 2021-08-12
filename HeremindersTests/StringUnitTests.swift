//
//  StringUnitTests.swift
//  HeremindersTests
//
//  Created by Gabriela Sillis on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
@testable import Hereminders

class StringUnitTests: XCTestCase {

    func testRemovingSpaces() throws {
        // given
        let input: String = "User Name"
        let expected: String = "UserName"

        // when
        let result =  input.removingSpaces()

        // then
        XCTAssertEqual(expected, result)
    }
}
