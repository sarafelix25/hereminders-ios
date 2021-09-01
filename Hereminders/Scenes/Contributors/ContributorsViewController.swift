//
//  ContributorsViewController.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ContributorsViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureView()
	}
	
	private func configureView() {
		view.backgroundColor = .white
		title = L10n.Settings.contributors
	}
	
}
