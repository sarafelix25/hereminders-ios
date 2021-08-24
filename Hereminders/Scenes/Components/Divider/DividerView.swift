//
//  DividerView.swift
//  Hereminders
//
//  Created by Diego Llopis on 19/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

final class DividerView: UIView {
    
    init() {
        super.init(frame: .zero)
		  configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Extension ViewProtocol
extension DividerView: ViewProtocol {
	
	func configureSubviews() {
		self.backgroundColor = .lightGray
	}
	
	func configureConstraints() {
		self.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
	}
	
}
