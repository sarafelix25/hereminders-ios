//
//  ContributorTableViewCell.swift
//  Hereminders
//
//  Created by Dairan on 23/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ContributorTableViewCell: UITableViewCell {
  // MARK: Lifecycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubviews()
    addConstraints()
  }

  init(with viewModel: ContribuitorTableViewCellViewModel) {
    super.init(style: .default, reuseIdentifier: ContributorTableViewCell.identifier)
    self.viewModel = viewModel
    configureUI()
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  static let identifier = "ContributorTableViewCell"

  // MARK: Private

  private var viewModel: ContribuitorTableViewCellViewModel?

  private lazy var titleSubtitleView: TitleSubtitleView = {
    let view = TitleSubtitleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.configure(with: viewModel!.titleSubtitleViewVM) // TODO: tratamento force unwrap
    return view

  }()

  private lazy var circurlarImageView: CircularImageView = {
    let view = CircularImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.configure(with: viewModel!.circurlarImageViewVM) // TODO: tratamento force unwrap
    return view
  }()

  private func configureUI() {
    backgroundColor = .white
  }

  private func addSubviews() {
    addSubview(circurlarImageView)
    addSubview(titleSubtitleView)
  }

  private func addConstraints() {
    NSLayoutConstraint.activate([
      //      circurlarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//      circurlarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//
//      titleSubtitleView.centerXAnchor.constraint(equalTo: centerXAnchor),
//      titleSubtitleView.centerYAnchor.constraint(equalTo: centerYAnchor),

      circurlarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      circurlarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      circurlarImageView.widthAnchor.constraint(equalToConstant: 48),
      circurlarImageView.heightAnchor.constraint(equalToConstant: 48),

      titleSubtitleView.leadingAnchor.constraint(equalTo: circurlarImageView.trailingAnchor, constant: 10),
      titleSubtitleView.centerYAnchor.constraint(equalTo: centerYAnchor)

    ])
  }
}
