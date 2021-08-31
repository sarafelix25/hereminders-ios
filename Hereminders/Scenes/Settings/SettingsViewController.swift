//
//  SettingsViewController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

enum SectionName: Int, CaseIterable {
	case places
   case about
	case credits
	
	func getSectionName() -> String {
		switch self {
			case .places:
				return L10n.Settings.places
			case .about:
				return L10n.Settings.about
			case .credits:
				return L10n.Settings.credits
		}
	}
			  
}

protocol SettingsViewControllerDelegate: AnyObject {

    func settingsViewControllerWantsToBecomePremium()
    func settingsViewControllerWantsToManagePlaces()
    func settingsViewControllerWantsToClose()
	 func settingsViewControllerWantsToContributors()
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    weak var delegate: SettingsViewControllerDelegate?

    init(delegate: SettingsViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: "SettingsViewController", bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }

    func configureView() {

        self.configureNavigationBar()
        self.configureTableView()
    }

    func configureNavigationBar() {
        let barButtonItem = UIBarButtonItem.customBarButtonItem(with: Asset.iconCross.image,
                                                                for: self,
                                                                and: #selector(didTapOnCloseButton))
        self.navigationItem.leftBarButtonItem = barButtonItem
        self.navigationItem.title = L10n.Settings.title
    }

    func configureTableView() {

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    @objc private func didTapOnCloseButton() {

        self.delegate?.settingsViewControllerWantsToClose()
    }
}

extension SettingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

		return SectionName.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if section == SectionName.credits.rawValue {
			return 2
		}
		return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "SettingsCell")
        }
		
		guard let sectionIndex: SectionName = SectionName(rawValue: indexPath.section)
		else { return UITableViewCell() }

        switch sectionIndex {
			case .places:
            cell?.textLabel?.text = L10n.Settings.managePlaces

			case .about:
            cell?.textLabel?.text = L10n.Settings.version(Bundle.versionNumber, Bundle.buildNumber)
				cell?.isUserInteractionEnabled = false
			
			case .credits:
				if indexPath.row == 0 {
					cell?.textLabel?.text = L10n.Settings.logoCredit
					cell?.isUserInteractionEnabled = false
				} else {
					cell?.textLabel?.text = L10n.Settings.contributors
					cell?.accessoryType = .disclosureIndicator
				}

        }

        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		guard let sectionIndex: SectionName = SectionName(rawValue: section)
		else { return nil }
		
		return sectionIndex.getSectionName()
    }
}

extension SettingsViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		if indexPath.section == SectionName.places.rawValue {
			
			self.delegate?.settingsViewControllerWantsToManagePlaces()
			
		} else if indexPath.section == SectionName.credits.rawValue {
			
			if indexPath.row == 1 {
				self.delegate?.settingsViewControllerWantsToContributors()
			}
		}
	}
}
