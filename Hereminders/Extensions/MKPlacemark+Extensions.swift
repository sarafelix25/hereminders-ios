//
//  MKPlacemark.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/30/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import MapKit

extension MKPlacemark {

    func formattedAddress() -> String {

        let addressComponents: [String] = [self.thoroughfare,
                                            self.subThoroughfare,
                                            self.subLocality].compactMap({ $0 })

        let address = addressComponents.joined(separator: ", ")
        return address
    }
}
