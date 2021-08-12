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
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let red1:CGFloat=0, green1:CGFloat=0, blue1:CGFloat=0, alpha1:CGFloat=0
        UIColor.heremindersBlue.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let red2:CGFloat=0, green2:CGFloat=0, blue2:CGFloat=0, alpha2:CGFloat=0
        UIColor.heremindersGreen.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        XCTAssertEqual(red1, red2)
        XCTAssertEqual(green1, green2)
        XCTAssertEqual(blue1, blue2)
        XCTAssertEqual(alpha1, alpha2)
    }
}
