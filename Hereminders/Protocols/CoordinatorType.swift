//
//  CoordinatorType.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/30/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {

    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorType] { get set }

    func start()
}

extension CoordinatorType {

    func dismissViewController(_ completion: (()-> Void)? = nil) {

        if self.navigationController.presentedViewController != nil {
            self.navigationController.dismiss(animated: true, completion: completion)
            self.childCoordinators.removeLast()
        }
    }
}
