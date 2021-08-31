//
//  TextInputCell.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class TextInputCell: UIView {

   private var textInputCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.backgroundColor = .white

        return cell
    }()

    private var texField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.tintColor = .lightGray

        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: TextInputCellViewModel ) {
        self.texField.text = viewModel.textInput
        self.texField.placeholder = viewModel.placeholder
    }
}


extension TextInputCell: ViewProtocol {
    func configureSubviews() {
        self.textInputCell.addSubview(self.texField)
        self.addSubview(self.textInputCell)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.textInputCell.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.textInputCell.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.textInputCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.textInputCell.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.texField.topAnchor.constraint(equalTo: self.textInputCell.topAnchor),
            self.texField.bottomAnchor.constraint(equalTo: self.textInputCell.bottomAnchor),
            self.texField.leadingAnchor.constraint(equalTo: self.textInputCell.leadingAnchor, constant: 16),
            self.texField.trailingAnchor.constraint(equalTo: self.textInputCell.trailingAnchor, constant: -16)
        ])
    }
}
