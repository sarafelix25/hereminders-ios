//
//  PlaceDetailsCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/9/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

class PlaceDetailsCoordinator: CoordinatorType {

    var navigationController: UINavigationController

    var childCoordinators: [CoordinatorType] = []

    let place: Place
    private let dataController: DataControllerType

    init(place: Place, navigationController: UINavigationController, dataController: DataControllerType) {
        self.place = place
        self.navigationController = navigationController
        self.dataController = dataController
    }

    public func start() {

//        let viewController = PlaceDetailsViewController(dataController: self.dataController, place: self.place)
        let viewController = PlaceDetailsViewController2()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
