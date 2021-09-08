//
//  WelcomeViewSnapshotTests.swift
//  HeremindersTests
//
//  Created by Alexandre Cardoso on 24/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting

@testable import Hereminders

class WelcomeViewSnapshotTests: XCTestCase {
	
	func test_welcomeView() {
		let frame = CGRect(x: 0, y: 0, width: 375, height: 180)
		let viewModelButton = ButtonViewModel(titleButton: "Add new place")
		let viewModel = WelcomeViewModel(title: "Welcome to Hereminders",
													subtitle: "Select or add new place",
													titleButton: viewModelButton)
		let sut = WelcomeView(frame: frame)
		
		sut.configure(with: viewModel)
		
		assertSnapshot(matching: sut, as: .image, record: false)
	}
	
}
