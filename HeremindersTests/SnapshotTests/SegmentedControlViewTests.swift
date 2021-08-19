//
//  SegmentedControlViewTests.swift
//  HeremindersTests
//
//  Created by Alexandre Cardoso on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class SegmentedControlViewTests: XCTestCase {
	
	func testSegmentedControlView() {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 62)
		let segmented = SegmentedControlView(frame: frame)
		
		assertSnapshot(matching: segmented, as: .image, record: false)
	}
	
}
