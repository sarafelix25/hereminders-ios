//
//  TextInputCellSnapshotTests.swift
//  HeremindersTests
//
//  Created by Gabriela Sillis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class TextInputCellSnapshotTests: XCTestCase {

    func testTextInput() {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 40)
        let viewModel = TextInputCellViewModel(textInput: "Lorem ipsum dolor sit amet", placeholder: "Lorem ipsum")
        let cell = TextInputCell()
        cell.configure(with: viewModel)

        assertSnapshot(matching: cell, as: Snapshotting.image(size: size), record:  false)
    }

    func testLongTextInput() {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 40)
        let viewModel = TextInputCellViewModel(textInput: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt", placeholder: "Lorem ipsum")
        let cell = TextInputCell()
        cell.configure(with: viewModel)

        assertSnapshot(matching: cell, as: Snapshotting.image(size: size), record:  false)
    }

    func testPlaceholderTextInput() {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 40)
        let viewModel = TextInputCellViewModel(textInput: "", placeholder: "Lorem ipsum")
        let cell = TextInputCell()
        cell.configure(with: viewModel)

        assertSnapshot(matching: cell, as: Snapshotting.image(size: size), record:  false)
    }
}
