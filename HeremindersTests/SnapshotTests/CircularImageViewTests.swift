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
    let circularImage = UIImage(named: "avatar")
    let circularViewModel = CircularImageViewModel(with: circularImage)

    let circularImageView = CircularImageView()
    circularImageView.configure(with: circularViewModel)

    let snapshopSize = CGSize(width: 48, height: 48)
    assertSnapshot(matching: circularImageView,
                   as: Snapshotting.image(size: snapshopSize), record: false)
  }

  func testImplementandoCircularImageViewUsandoViewCodeCom48pxComNomeArquivoInvalido() throws {
    let circularImage = UIImage(named: "avataraaaaaaaaaaa")
    let circularViewModel = CircularImageViewModel(with: circularImage)

    let circularImageView = CircularImageView()
    circularImageView.configure(with: circularViewModel)

    let snapshopSize = CGSize(width: 48, height: 48)
    assertSnapshot(matching: circularImageView,
                   as: Snapshotting.image(size: snapshopSize), record: false)
  }
}
