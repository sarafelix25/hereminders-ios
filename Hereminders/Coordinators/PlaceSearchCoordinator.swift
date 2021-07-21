//
//  PlaceSearchCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/21/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

protocol PlaceSearchCoordinatorDelegate: AnyObject {

    func placeSearchCoordinatorDidSelectPlace(_ place: PlaceResult)

    func placeSearchCoordinatorDidCancel()
}

class PlaceSearchCoordinator: CoordinatorType {

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorType] = []

    weak var delegate: PlaceSearchCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {

        let viewController = PlaceSearchViewController(delegate: self)
        let navigationController = viewController.insideNavigationController()

        self.navigationController.present(navigationController, animated: true)
    }
}

extension PlaceSearchCoordinator: PlaceSearchViewControllerDelegate {

    func didSelectPlace(_ place: PlaceResult) {

        self.delegate?.placeSearchCoordinatorDidSelectPlace(place)
    }

    func didCancel() {

        self.delegate?.placeSearchCoordinatorDidCancel()
    }
}
