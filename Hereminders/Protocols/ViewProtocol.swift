//
//  ViewProtocol.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 24/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol ViewProtocol: UIView {
	func configureView()
	func configureSubviews()
	func configureConstraints()
}

extension ViewProtocol {
	func configureView() {
		configureSubviews()
		configureConstraints()
	}
}
