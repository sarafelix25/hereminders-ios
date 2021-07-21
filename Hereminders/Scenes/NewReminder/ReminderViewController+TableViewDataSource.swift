//
//  ReminderViewController+TableViewDataSource.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension ReminderViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return nameCell(inTableView: tableView, forIndexPath: indexPath)
        case 1: return eventCell(inTableView: tableView, forIndexPath: indexPath)
        default: return UITableViewCell()
        }
    }

    func nameCell(inTableView tableView: UITableView, forIndexPath indexPath: IndexPath) -> TextInputTableViewCell {
        let cell: TextInputTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(withPlaceholder: L10n.Reminder.descriptionPlaceholder, andDelegate: self)
        cell.textField.text = self.viewModel.viewState.description
        return cell
    }

    func eventCell(inTableView tableView: UITableView, forIndexPath indexPath: IndexPath) -> SegmentedControlTableViewCell {
        let cell: SegmentedControlTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ReminderViewController: TextInputCellDelegate {

    func textFieldDidReturn(_ textField: UITextField) {

        let text = textField.text
        self.viewModel.viewState.description = text
    }
}

extension ReminderViewController: SegmentedControlCellDelegate {

    func segmentedControlValueChanged(_ value: Int) {

        self.viewModel.viewState.event = value
    }
}
