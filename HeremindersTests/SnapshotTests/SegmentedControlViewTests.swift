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
		let frame = CGRect(x: 0, y: 0, width: 375, height: 62)
		let segmentedView = SegmentedControlView(frame: frame)
		let names = ["Ao chegar", "Ao sair"]
		let viewModel = SegmentedControlViewViewModel(namesSegment: names, initialIndex: 0)
		
		segmentedView.configure(with: viewModel)

		assertSnapshot(matching: segmentedView, as: .image, record: false)
	}
	
}
