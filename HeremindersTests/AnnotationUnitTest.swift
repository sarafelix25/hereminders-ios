//
//  AnnotationUnitTest.swift
//  HeremindersTests
//
//  Created by sara.batista.d.felix on 12/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import MapKit

@testable import Hereminders

class AnnotationUnitTest: XCTestCase {

    func testAnnotation() throws {
        let title: String = "Mauá"
        let coordinate = CLLocationCoordinate2D(latitude:  -23.6669527, longitude: -46.4616922)
        
        let notes = Annotation(title: title, coordinate: coordinate)
        
        XCTAssert(notes.title == title)
        XCTAssert(notes.coordinate.latitude == coordinate.latitude)
        XCTAssert(notes.coordinate.longitude == coordinate.longitude)
    }
}
