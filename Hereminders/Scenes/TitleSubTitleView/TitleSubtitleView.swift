//
//  TitleSubtitleView.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 17/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

final class TitleSubtitleView: UIView {
	
	// MARK: - UI Element
	private var stackView: UIStackView = {
		let stack = UIStackView(frame: .zero)
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillEqually
		return stack
	}()
	
	private var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = UIColor.black
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.numberOfLines = 1
		return label
	}()
	
	private var subtitleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = UIColor.lightGray
		label.font = UIFont.systemFont(ofSize: 15)
		label.numberOfLines = 1
		return label
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
	func configure(with viewModel: TitleSubtitleViewModel) {
		titleLabel.text = viewModel.title
		subtitleLabel.text = viewModel.subtitle
	}
	
}


// MARK: - Extension ViewProtocol
extension TitleSubtitleView: ViewProtocol {
	
	func configureSubviews() {
		addSubview(stackView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(subtitleLabel)
	}
	
	func configureConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
	
}
