//
//  ContributorTableViewCellTests.swift
//  HeremindersTests
//
//  Created by Dairan on 23/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

@testable import Hereminders
import SnapshotTesting
import XCTest

class ContributorTableViewCellTests: XCTestCase {
  func testContributorTableViewCell() throws {
    let titleViewModel = TitleSubtitleViewModel(title: "Nome do Contribuidor", subtitle: "Nome do cargo da pessoa")
    let circularViewModel = CircularImageViewModel(with: Image(named: "avatar"))
    let viewModelSut = ContribuitorTableViewCellViewModel(titleSubtitleViewVM: titleViewModel, circurlarImageViewVM: circularViewModel)

    let sut = ContributorTableViewCell(with: viewModelSut)


    assertSnapshot(matching: sut, as: Snapshotting.image(), record: true)
  }
}
