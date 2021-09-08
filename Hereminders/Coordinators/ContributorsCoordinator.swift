//
//  ContributorsCoordinator.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ContributorsCoordinator: CoordinatorType {
	
	var navigationController: UINavigationController
	
	var childCoordinators: [CoordinatorType] = []
	
	init(navigationController: UINavigationController) {
		 self.navigationController = navigationController
	}
	
	func start() {
		let viewController = ContributorsViewController()
		self.navigationController.pushViewController(viewController, animated: true)
	}
	
}
