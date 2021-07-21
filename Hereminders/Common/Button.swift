//
//  Button.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/9/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

class Button: UIButton {

    override var intrinsicContentSize: CGSize {

        return CGSize(width: UIViewNoIntrinsicMetric, height: 44)
    }

    @objc dynamic var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }

    @objc dynamic var titleLabelFont: UIFont {
        get {
            return self.titleLabel!.font
        }
        set {
            self.titleLabel!.font = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    func commonInit() {

    }
}
