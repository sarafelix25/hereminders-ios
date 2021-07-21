//
//  PremiumCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/16/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

class PremiumCoordinator: CoordinatorType {

    var navigationController: UINavigationController

    var childCoordinators: [CoordinatorType] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }

    public func start() {

        let viewController = PremiumViewController()
        viewController.delegate = self

        let navigationController = viewController.insideNavigationController()
        self.navigationController.present(navigationController, animated: true)
    }
}

extension PremiumCoordinator: PremiumViewControllerDelegate {

    func premiumViewControllerWantsToDismiss(_ viewController: PremiumViewController) {

        self.navigationController.dismiss(animated: true)
    }
}
