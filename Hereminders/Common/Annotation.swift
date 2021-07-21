//
//  Annotation.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/28/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {

    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
