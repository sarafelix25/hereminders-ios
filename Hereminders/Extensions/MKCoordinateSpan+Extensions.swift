//
//  MKCoordinateSpan+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/23/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import MapKit

extension MKCoordinateSpan {

    static var `default`: MKCoordinateSpan {
        get {
            return MKCoordinateSpan(latitudeDelta: 0.0017,
                                    longitudeDelta: 0.0017)
        }
    }
}
