//
//  CircularImageViewTests.swift
//  HeremindersTests
//
//  Created by Dairan on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

// Implementar uma View que define uma imagem com formato arredondado.
// Tamanho: 48px x 48px

@testable import Hereminders
import SnapshotTesting
import XCTest

class CircularImageViewTests: XCTestCase {
  func testImplementandoCircularImageViewUsandoViewCodeCom48px() throws {

    let circularImage = CircularImageView(withName: "avatar")

    let snapshopSize = CGSize(width: 48, height: 48)
    assertSnapshot(matching: circularImage, as: Snapshotting.image(size: snapshopSize))

  }
}
