//
//  SliderTableViewCell.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol SliderCellDelegate: AnyObject {

    func sliderCellDidChangeValue(_ value: Int)
}

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!

    weak var delegate: SliderCellDelegate?

    private let values = [100, 200, 300, 400, 500]

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        self.slider.minimumValue = 0
        self.slider.maximumValue = 4
        self.slider.value = 0
        self.slider.isContinuous = false
        self.slider.addTarget(self,
                              action: #selector(SliderTableViewCell.sliderDidChangeValue),
                              for: .valueChanged)
    }

    @objc func sliderDidChangeValue() {

        let roundedSliderValue = Int(slider.value)
        let currentValue = self.values[roundedSliderValue]

        self.sliderValueLabel.text = "\(currentValue)m"
        
        UIView.animate(withDuration: 0.2) {
            self.slider.setValue(Float(roundedSliderValue), animated: true)
        }

        self.delegate?.sliderCellDidChangeValue(currentValue)
    }
    
}
