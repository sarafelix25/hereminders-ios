//
//  UIColorUnitTests.swift
//  HeremindersTests
//
//  Created by Gabriela Sillis on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
@testable import Hereminders

class UIColorUnitTests: XCTestCase {

    func testCustomUIColors() throws {
        let inputBlue = UIColor.init(red: 66, green: 148, blue: 244)
        let inputGreen = UIColor.init(red: 90, green: 182, blue: 155)

        let expectedBlue = UIColor.heremindersBlue
        let expectedGreen = UIColor.heremindersGreen

        XCTAssertEqual(expectedBlue, inputBlue)
        XCTAssertEqual(expectedGreen, inputGreen)
    }
}
