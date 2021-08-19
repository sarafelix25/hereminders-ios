//
//  CircularImageView.swift
//  Hereminders
//
//  Created by Dairan on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class CircularImageView: UIView {
  // MARK: Lifecycle

  override init(frame: CGRect) {
    self.avatarImagem = UIImage(named: "no-image")!
    super.init(frame: .zero)
  }

  convenience init(withName image: String) {
    self.init()
    self.avatarImagem = UIImage(named: image) ?? UIImage()
    configureUI()
    configureConstrains()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private let circularImageView: UIImageView = {
    let imagemView = UIImageView()
    imagemView.layer.cornerRadius = 24
    imagemView.layer.masksToBounds = true
    imagemView.translatesAutoresizingMaskIntoConstraints = false
    return imagemView
  }()

  private var avatarImagem: UIImage

  private func configureUI() {
    circularImageView.image = avatarImagem
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
