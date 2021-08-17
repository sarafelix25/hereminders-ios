//
//  MKPlaceMarkExtensionsUnitTest.swift
//  HeremindersTests
//
//  Created by Diego Llopis on 13/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import MapKit
import Contacts
@testable import Hereminders

class MKPlaceMarkExtensionsUnitTest: XCTestCase {

    func unitTestPlaceMarkExtensions() throws {
        
        let coords = CLLocationCoordinate2D(latitude: 51.5083, longitude: -0.1384)
        
        let address = [CNPostalAddressStreetKey: "Rua Bela Cintra, 1491", CNPostalAddressSubLocalityKey: "Consolação"]
        
        let placemark = MKPlacemark(coordinate: coords, addressDictionary: address)
        
        let addressTest = placemark.formattedAddress()
        
        let correctAddress = "Rua Bela Cintra, 1491, Consolação"

        XCTAssert(addressTest == correctAddress)
    }
}
