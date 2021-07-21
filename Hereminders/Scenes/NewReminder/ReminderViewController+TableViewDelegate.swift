//
//  ReminderViewController+TableViewDelegate.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

extension ReminderViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch section {
        case 0: return L10n.Reminder.description
        case 1: return L10n.Reminder.when
        default: return nil
        }
    }
}
