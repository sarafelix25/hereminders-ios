//
//  EmptyViewSnapshotTests.swift
//  HeremindersTests
//
//  Created by Rodrigo Borges on 16/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class EmptyViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 200, height: 200)

    func testEmptyView() {

        let viewModel = EmptyViewModel(emptyMessage: "This is a empty message")

        let emptyView = EmptyView()
        emptyView.configure(with: viewModel)

        assertSnapshot(matching: emptyView,
                       as: Snapshotting.image(size: self.snapshotSize))
    }

    func testEmptyViewLongMessage() {

        let viewModel = EmptyViewModel(emptyMessage: "This is a very very very long long long empty message")

        let emptyView = EmptyView()
        emptyView.configure(with: viewModel)

        assertSnapshot(matching: emptyView,
                       as: Snapshotting.image(size: self.snapshotSize))
    }
}
