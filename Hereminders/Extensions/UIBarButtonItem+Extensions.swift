//
//  UIBarButtonItem.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 9/4/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    static func customBarButtonItem(with image: UIImage?, for target: Any?, and selector: Selector) -> UIBarButtonItem {

        let customButton = UIButton(type: .custom)
        customButton.setImage(image, for: .normal)
        customButton.addTarget(target, action: selector, for: .touchUpInside)
        customButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        customButton.translatesAutoresizingMaskIntoConstraints = false

        let barButtonItem = UIBarButtonItem()
        barButtonItem.customView = customButton
        return barButtonItem
    }
}
