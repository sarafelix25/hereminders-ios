//
//  TextInputCell.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class TextInputCell: UITableViewCell {

    private var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.tintColor = .lightGray

        return text
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: TextInputCellViewModel ) {
        self.textField.text = viewModel.textInput
        self.textField.placeholder = viewModel.placeholder
    }
}


extension TextInputCell: ViewProtocol {
    func configureSubviews() {
        self.contentView.addSubview(self.textField)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.topAnchor),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
