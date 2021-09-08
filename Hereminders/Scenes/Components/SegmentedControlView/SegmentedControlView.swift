//
//  SegmentedControlView.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

final class SegmentedControlView: UIView {
	
	// MARK: - UI Element
	private var segmentedControl: UISegmentedControl = {
		let segmented = UISegmentedControl(frame: .zero)
		segmented.translatesAutoresizingMaskIntoConstraints = false
		segmented.selectedSegmentTintColor = UIColor.heremindersBlue
		segmented.backgroundColor = UIColor.white
		UISegmentedControl.appearance()
			.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
		UISegmentedControl.appearance()
			.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.heremindersBlue], for: .normal)
		return segmented
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	func configure(with viewModel: SegmentedControlViewViewModel){
		for (index, name) in viewModel.namesSegment.enumerated() {
			segmentedControl.insertSegment(withTitle: name, at: index, animated: false)
		}
		segmentedControl.selectedSegmentIndex = viewModel.initialIndex
	}
	
}


// MARK: - Extension ViewProtocol
extension SegmentedControlView: ViewProtocol {
	
	func configureSubviews() {
		addSubview(segmentedControl)
	}
	
	func configureConstraints() {
		NSLayoutConstraint.activate([
			segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
		])
	}
	
}
