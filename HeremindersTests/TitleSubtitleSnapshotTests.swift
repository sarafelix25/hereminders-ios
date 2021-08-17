//
//  TitleSubtitleSnapshotTests.swift
//  HeremindersTests
//
//  Created by Alexandre Cardoso on 17/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class TitleSubtitleSnapshotTests: XCTestCase {
	
	func testTitleSubtitleView() {
		let frame = CGRect(x: 0, y: 0, width: 200, height: 75)
		let viewModel = TitleSubtitleViewModel(title: "Ronald Robertson",
															subtitle: "iOS Developer Fellow @Devpass")
		let titleSubtitleView = TitleSubtitleView(frame: frame)
		titleSubtitleView.backgroundColor = .white
		
		titleSubtitleView.configure(with: viewModel)
		
		assertSnapshot(matching: titleSubtitleView, as: .image, record: false)
	}
	
}
