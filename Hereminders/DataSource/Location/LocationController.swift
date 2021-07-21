//
//  LocationController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/25/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import CoreLocation

protocol LocationControllerDelegate: AnyObject {

    func locationControllerDidUpdateLocation(_ location: CLLocation)
    func locationControllerDidFailWithError(_ error: Error)
}

protocol LocationControllerType: AnyObject {

    var delegate: LocationControllerDelegate? { get set }
    func requestLocation()
}

final class LocationController: NSObject, LocationControllerType {

    weak var delegate: LocationControllerDelegate?

    private var locationManager: CLLocationManager = CLLocationManager()

    override init() {

        super.init()
        self.configureLocationManager()
    }

    private func configureLocationManager() {

        locationManager.delegate = self
    }

    func requestLocation() {
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
}

extension LocationController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

        self.delegate?.locationControllerDidFailWithError(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.first {

            self.delegate?.locationControllerDidUpdateLocation(location)
        }
    }
}
