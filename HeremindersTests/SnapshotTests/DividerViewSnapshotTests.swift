//
//  DividerViewSnapshotTests.swift
//  HeremindersTests
//
//  Created by Diego Llopis on 19/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class DividerViewSnapshotTests: XCTestCase {

    func testDividerView() throws {
        
        let dividerView = DividerView()
        
        assertSnapshot(matching: dividerView, as: Snapshotting.image(size: CGSize(width: 100, height: 1)))
    }
}
