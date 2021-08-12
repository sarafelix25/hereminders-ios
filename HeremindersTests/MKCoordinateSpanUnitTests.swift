//
//  MKCoordinateSpanUnitTest.swift
//  HeremindersTests
//
//  Created by Dairan on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import MapKit
import XCTest
@testable import Hereminders

class MKCoordinateSpanUnitTests: XCTestCase {

  func testMKCoordinateSpan() {
    let latitude = 0.0017
    let longitude = 0.0017

    let sut = MKCoordinateSpan.default
    XCTAssertEqual(sut.latitudeDelta, latitude)
    XCTAssertEqual(sut.longitudeDelta, longitude)
  }
}
