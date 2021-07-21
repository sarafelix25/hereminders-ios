//
//  MKMapView+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/23/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import MapKit

extension MKMapView {

    func showUserLocation() {

        let userLocationCoordinate = self.userLocation.coordinate
        let region = MKCoordinateRegion(center: userLocationCoordinate, span: .default)
        self.setRegion(region, animated: true)
    }

    func moveToAnnotation(_ annotation: MKAnnotation) {

        let span = self.region.span
        let coordinate = annotation.coordinate
        let region = MKCoordinateRegion(center: coordinate, span: span)

        self.setRegion(region, animated: true)
    }

    func replaceAnnotations(with annotations: [MKAnnotation]) {

        self.removeAnnotations(self.annotations)
        self.addAnnotations(annotations)
        self.showAnnotations(annotations, animated: true)
    }
}
