//
//  TextInputTableViewCell.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol TextInputCellDelegate: AnyObject {
    func textFieldDidReturn(_ textField: UITextField)
}

class TextInputTableViewCell: UITableViewCell {

    // - MARK: IBOutlets

    @IBOutlet weak var textField: UITextField!

    // - MARK: Delegate

    weak var delegate: TextInputCellDelegate?

//    override var intrinsicContentSize: CGSize {
//        
//        return CGSize(width: UIViewNoIntrinsicMetric, height: 60)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        self.textField.delegate = self
        self.textField.autocapitalizationType = .sentences
        self.textField.returnKeyType = .done
    }

    func configure(withPlaceholder placeholder: String? = nil, andDelegate delegate: TextInputCellDelegate) {
        self.textField.placeholder = placeholder
        self.delegate = delegate
    }
}

extension TextInputTableViewCell: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.delegate?.textFieldDidReturn(textField)
        self.textField.resignFirstResponder()
        return true
    }
}
