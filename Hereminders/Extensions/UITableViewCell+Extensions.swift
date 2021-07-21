//
//  UITableViewCell+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension UITableViewCell {

    class func registerXib(in tableView: UITableView) {
        let className = self.classIdentifier()
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
    }

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
