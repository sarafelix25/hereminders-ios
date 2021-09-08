//
//  SettingsCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {

    func settingsCoordinatorDidCancel()
}

class SettingsCoordinator: CoordinatorType {

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorType] = []

    weak var delegate: SettingsCoordinatorDelegate?
    private let placeController: PlaceDataControllerType
    private let dataController: DataControllerType

    init(navigationController: UINavigationController, placeController: PlaceDataControllerType, dataController: DataControllerType) {

        self.navigationController = navigationController
        self.placeController = placeController
        self.dataController = dataController
    }

    public func start() {

        let viewController = SettingsViewController(delegate: self)
        let navigationController = viewController.insideNavigationController()

        self.navigationController.present(navigationController, animated: true)
    }

    func showPlaceList() {

        let placeListCoordinator = PlaceListCoordinator(navigationController: self.navigationController.presentedViewController as! UINavigationController,
                                                        placeController: self.placeController,
                                                        dataController: self.dataController)
        placeListCoordinator.start()

        self.childCoordinators.append(placeListCoordinator)
    }

    func showPremium() {

        let premiumCoordinator = PremiumCoordinator(navigationController: self.navigationController.presentedViewController as! UINavigationController)
        premiumCoordinator.start()

        self.childCoordinators.append(premiumCoordinator)
    }
	
	func showContributors() {
		
		if let presentedViewController = self.navigationController.presentedViewController as? UINavigationController {
			let contributorsCoordinator = ContributorsCoordinator(navigationController: presentedViewController)
			contributorsCoordinator.start()
			self.childCoordinators.append(contributorsCoordinator)
		}
	}
}

extension SettingsCoordinator: SettingsViewControllerDelegate {

    func settingsViewControllerWantsToBecomePremium() {

        self.showPremium()
    }

    func settingsViewControllerWantsToManagePlaces() {

        self.showPlaceList()
    }

    func settingsViewControllerWantsToClose() {

        self.delegate?.settingsCoordinatorDidCancel()
    }
	
	func settingsViewControllerWantsToContributors() {
		
		self.showContributors()
	}
}
