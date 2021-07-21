//
//  SegmentedControlTableViewCell.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol SegmentedControlCellDelegate: AnyObject {

    func segmentedControlValueChanged(_ value: Int)
}

class SegmentedControlTableViewCell: UITableViewCell {

    weak var delegate: SegmentedControlCellDelegate?

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.segmentedControl.removeAllSegments()
        self.segmentedControl.insertSegment(withTitle: L10n.Reminder.onEntry, at: 0, animated: false)
        self.segmentedControl.insertSegment(withTitle: L10n.Reminder.onExit, at: 1, animated: false)
        self.segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {

        self.delegate?.segmentedControlValueChanged(sender.selectedSegmentIndex)
    }
}
