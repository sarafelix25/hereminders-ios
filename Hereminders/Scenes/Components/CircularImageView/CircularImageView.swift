//
//  CircularImageView.swift
//  Hereminders
//
//  Created by Dairan on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

final class CircularImageView: UIView {
  // MARK: Lifecycle

   init() {
    super.init(frame: .zero)
    configureSubviews()
    configureConstrains()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  func configure(with viewModel: CircularImageViewModel) {
    circularImageView.image = viewModel.image
  }

  // MARK: Private

  private let circularImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 24
    imageView.layer.masksToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private func configureSubviews() {
    addSubview(circularImageView)
  }

  private func configureConstrains() {
    NSLayoutConstraint.activate([
      circularImageView.widthAnchor.constraint(equalToConstant: 48),
      circularImageView.heightAnchor.constraint(equalToConstant: 48),
      circularImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      circularImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
