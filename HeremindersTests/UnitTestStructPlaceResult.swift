//
//  UnitTestStructPlaceResult.swift
//  HeremindersTests
//
//  Created by Diego Llopis on 12/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import CoreLocation
@testable import Hereminders

class StructPlaceResultUnitTest: XCTestCase {

    func testStructPlaceResult() throws {
        
        let name: String = "Universidade Braz Cubas"
        
        let address: String = "Rua São Nunca"
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
        
        let dummy = PlaceResult(name: name, address: address, coordinate: coordinate)
        
        XCTAssert(dummy.name == name)
        XCTAssert(dummy.address == address)
        XCTAssert(dummy.coordinate.latitude == coordinate.latitude)
        XCTAssert(dummy.coordinate.longitude == coordinate.longitude)
    }
}

