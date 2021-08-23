//
//  DividerView.swift
//  Hereminders
//
//  Created by Diego Llopis on 19/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit
@testable import Hereminders

final class DividerView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.configureSubviews()
        self.configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.backgroundColor = .lightGray
    }
    
    private func configureConstraints() {
        self.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }
}
