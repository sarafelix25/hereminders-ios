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

    func testInitUIColor() throws {

        let color: UIColor = UIColor(red: 255, green: 51, blue: 51)

        let expectedRed: CGFloat = CGFloat(255)/255.0
        let expectedBlue: CGFloat = CGFloat(51)/255.0
        let expectedGreen: CGFloat = CGFloat(51)/255.0

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        XCTAssertEqual(red, expectedRed)
        XCTAssertEqual(green, expectedGreen)
        XCTAssertEqual(blue, expectedBlue)
    }
}
