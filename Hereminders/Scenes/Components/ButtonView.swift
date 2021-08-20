//
//  ButtonView.swift
//  Hereminders
//
//  Created by sara.batista.d.felix on 19/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

final class ButtonView: UIView {
    // MARK: - Propriedades
    private var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.heremindersBlue
        button.layer.cornerRadius = 4
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    // MARK: - Init
    init() {
        
        super.init(frame: .zero)
        
        self.configureSubviews()
        self.configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureSubviews()
        self.configureConstraints()
    
    }
    
    //MARK: - ViewCode
    private func configureSubviews() {
        self.backgroundColor = .white
        
        self.addSubview(self.button)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
                    self.button.topAnchor.constraint(equalTo: topAnchor),
                    self.button.bottomAnchor.constraint(equalTo: bottomAnchor),
                    self.button.leadingAnchor.constraint(equalTo: leadingAnchor),
                    self.button.trailingAnchor.constraint(equalTo: trailingAnchor)
                ])
    }
    
    func configure(with viewModel: ButtonViewModel) {
        self.button.setTitle(viewModel.titleButton, for: UIControl.State.normal)
    }
}
