//
//  ViewProtocol.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 24/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation

protocol ViewProtocol {
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
