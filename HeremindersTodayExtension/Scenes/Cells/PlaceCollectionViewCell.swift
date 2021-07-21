//
//  PlaceCollectionViewCell.swift
//  HeremindersTodayExtension
//
//  Created by Rodrigo Borges on 8/26/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import MapKit

class PlaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.nameLabel.textAlignment = .center
        self.nameLabel.font = UIFont.systemFont(ofSize: Constants.fontSize)
        self.nameLabel.lineBreakMode = .byTruncatingMiddle
    }

    func configure(with place: Place) {

        self.nameLabel.text = place.name
    }

    private enum Constants {

        static let fontSize: CGFloat = 14
    }
}
