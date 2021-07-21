//
//  UIViewController+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension UIViewController {

    func insideNavigationController() -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = .formSheet

        return navigationController
    }

    func presentAlert(withTitle title: String,
                      andMessage message: String,
                      andConfirmTitle confirmTitle: String,
                      onConfirm confirmAction: @escaping () -> Void,
                      onDeny denyAction: (() -> Void)? = nil) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        let confirmAction = UIAlertAction(title: confirmTitle, style: .destructive) { action in
            confirmAction()
        }

        let denyAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(confirmAction)
        alertController.addAction(denyAction)

        self.present(alertController, animated: true)
    }

    func presentTextInputAlert(withTitle title: String,
                               andMessage message: String,
                               andConfirmTitle confirmTitle: String,
                               onConfirm confirmAction: @escaping (_ text: String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { action in
            let text = alertController.textFields?.first?.text ?? ""
            confirmAction(text)
        }

        let denyAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addTextField { textField in
            textField.autocapitalizationType = .sentences
        }

        alertController.addAction(confirmAction)
        alertController.addAction(denyAction)
        
        self.present(alertController, animated: true)
    }
}
