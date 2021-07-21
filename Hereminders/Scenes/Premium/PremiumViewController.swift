//
//  PremiumViewController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/16/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol PremiumViewControllerDelegate: AnyObject {

    func premiumViewControllerWantsToDismiss(_ viewController: PremiumViewController)
}

final class PremiumViewController: UIViewController {

    weak var delegate: PremiumViewControllerDelegate?

    init() {
        super.init(nibName: "PremiumViewController", bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }

    private func configureView() {

        self.configureNavigationBar()
    }

    private func configureNavigationBar() {

        let barButtonItem = UIBarButtonItem.customBarButtonItem(with: Asset.iconCross.image,
                                                                for: self,
                                                                and: #selector(didTapOnCloseButton))
        self.navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func didTapOnCloseButton() {

        self.delegate?.premiumViewControllerWantsToDismiss(self)
    }
}
