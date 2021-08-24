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
    super.init(style: .default, reuseIdentifier: ContributorTableViewCell.classIdentifier())
    self.viewModel = viewModel
    configureUI()
    addSubviews()
    addConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private var viewModel: ContribuitorTableViewCellViewModel?

  private lazy var titleSubtitleView: TitleSubtitleView = {
    let view = TitleSubtitleView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.configure(with: viewModel!.titleSubtitleViewVM) // TODO: tratamento force unwrap
    return view

  }()

  private lazy var circularImageView: CircularImageView = {
    let view = CircularImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.configure(with: viewModel!.circurlarImageViewVM) // TODO: tratamento force unwrap
    return view
  }()

  private func configureUI() {
    accessoryType = .disclosureIndicator
    backgroundColor = .white
  }

  private func addSubviews() {
    addSubview(circularImageView)
    addSubview(titleSubtitleView)
  }

  private func addConstraints() {
    NSLayoutConstraint.activate([
      circularImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      circularImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      circularImageView.widthAnchor.constraint(equalToConstant: 48),

      titleSubtitleView.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 16),
      titleSubtitleView.centerYAnchor.constraint(equalTo: centerYAnchor)

    ])
  }
}
