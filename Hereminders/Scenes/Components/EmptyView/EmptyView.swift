//
//  EmptyView.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 16/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

final class EmptyView: UIView {

    private var emptyMessageLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    public init() {

        super.init(frame: .zero)

        self.configureSubviews()
        self.configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {

        self.backgroundColor = .white

        self.addSubview(self.emptyMessageLabel)
    }

    private func configureConstraints() {

        NSLayoutConstraint.activate([

            self.emptyMessageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.emptyMessageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.emptyMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.emptyMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

    public func configure(with viewModel: EmptyViewModel) {

        self.emptyMessageLabel.text = viewModel.emptyMessage
    }
}
