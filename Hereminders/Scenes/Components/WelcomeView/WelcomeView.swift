//
//  WelcomeView.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 24/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

final class WelcomeView: UIView {
	
	// MARK: - UI Elements
	private let stackView: UIStackView = {
		let stack = UIStackView(frame: .zero)
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fill
		stack.spacing = 16
		stack.alignment = .center
		stack.backgroundColor = .white
		return stack
	}()
	
	private let iconImageView: UIImageView = {
		let imageView = UIImageView(frame: .zero)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = Asset.imgLogo.image
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		label.textColor = .black
		label.textAlignment = .center
		return label
	}()
	
	private let subtitleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
		label.textColor = .black
		label.textAlignment = .center
		return label
	}()
	
	private let addNewPlaceButton: ButtonView = {
		let view = ButtonView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		
		configureSubviews()
		configureConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	private func configureSubviews() {
		addSubview(stackView)
		stackView.addArrangedSubview(iconImageView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(subtitleLabel)
		stackView.addArrangedSubview(addNewPlaceButton)
		
		backgroundColor = .white
	}
	
	private func configureConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			
			iconImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 1),
			iconImageView.heightAnchor.constraint(equalToConstant: 50),
			iconImageView.widthAnchor.constraint(equalToConstant: 50),
			
			addNewPlaceButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			addNewPlaceButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
			addNewPlaceButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}
	
	func configure(with viewModel: WelcomeViewModel) {
		titleLabel.text = viewModel.title
		subtitleLabel.text = viewModel.subtitle
		addNewPlaceButton.configure(with: viewModel.titleButton)
	}
	
}
