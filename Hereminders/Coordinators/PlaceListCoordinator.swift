//
//  PlaceListCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

class PlaceListCoordinator: CoordinatorType {

    private var viewModel: PlaceListViewModel?
    private let placeController: PlaceDataControllerType
    private let dataController: DataControllerType

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorType] = []

    init(navigationController: UINavigationController, placeController: PlaceDataControllerType, dataController: DataControllerType) {

        self.navigationController = navigationController
        self.placeController = placeController
        self.dataController = dataController
    }

    public func start() {

        let viewModel = PlaceListViewModel(placeController: self.placeController)
        self.viewModel = viewModel

        let viewController = PlaceListViewController(viewModel: viewModel, delegate: self)
        self.navigationController.pushViewController(viewController, animated: true)
    }

    func showPlaceSearch() {

        let placeSearchCoordinator = PlaceSearchCoordinator(navigationController: self.navigationController)
        placeSearchCoordinator.delegate = self
        placeSearchCoordinator.start()

        self.childCoordinators.append(placeSearchCoordinator)
    }

    func showPlaceDetails(_ place: Place) {

        let placeDetailsCoordinator = PlaceDetailsCoordinator(place: place, navigationController: self.navigationController, dataController: self.dataController)
        placeDetailsCoordinator.start()

        self.childCoordinators.append(placeDetailsCoordinator)
    }
}

extension PlaceListCoordinator: PlaceListViewControllerDelegate {

    func placeListViewControllerDidSelectPlace(_ place: Place) {

        self.showPlaceDetails(place)
    }

    func placeListViewControllerWantsToSearchPlace() {

        self.showPlaceSearch()
    }

    func placeListViewControllerDidCancel() {

    }
}

extension PlaceListCoordinator: PlaceSearchCoordinatorDelegate {

    func placeSearchCoordinatorDidSelectPlace(_ place: PlaceResult) {

        self.viewModel?.saveNewPlace(with: place)
        self.dismissViewController()
    }

    func placeSearchCoordinatorDidCancel() {

        self.dismissViewController()
    }
}
