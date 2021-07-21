//
//  UIColor+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/9/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
    }

    static let heremindersBlue = UIColor(red: 66, green: 148, blue: 244)
    static let heremindersGreen = UIColor(red: 90, green: 182, blue: 155)
}
