//
//  UITableViewCellUnitTests.swift
//  HeremindersTests
//
//  Created by Alexandre Cardoso on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
@testable import Hereminders


class UITableViewCellUnitTests: XCTestCase {
	
	func testClassIdentifier() {
		let expected = "MockCell"
		let sut = MockCell.classIdentifier()
		
		XCTAssert(sut == expected)
	}

}

class MockCell: UITableViewCell {
}
