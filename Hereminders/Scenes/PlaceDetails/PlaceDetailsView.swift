//
//  PlaceDetailsView.swift
//  Hereminders
//
//  Created by sara.batista.d.felix on 03/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit
import MapKit

final class PlaceDetailsView: UIView {
    private let stackView: UIStackView = {
        let stackView: UIStackView = .init(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var placeView: MapLocationView = {
        let placeView: MapLocationView = .init()
        placeView.translatesAutoresizingMaskIntoConstraints = false
        return placeView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView: UITableView = .init(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        TextInputTableViewCell.registerXib(in: self.tableView)
        
        self.configureSubviews()
        self.configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        self.configureSubviews()
        self.configureConstraints()
    }
}

extension PlaceDetailsView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            return self.nameCell(inTableView: tableView, forIndexPath: indexPath)
        case 1:
            return self.addressCell(inTableView: tableView, forIndexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }

    func nameCell(inTableView tableView: UITableView, forIndexPath indexPath: IndexPath) -> TextInputTableViewCell {
        let cell: TextInputTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
//        cell.configure(withPlaceholder: L10n.Placedetails.namePlaceholder, andDelegate: self)
//        cell.textField.text = self.place.name
        cell.textField.text = "Ceará"
        return cell
    }

    func addressCell(inTableView tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell")

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "AddressCell")
            cell?.selectionStyle = .none
        }

//        cell?.textLabel?.text = self.place.address
        cell?.textLabel?.text = "Ceará Endereço"
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch section {
        case 0:
            return L10n.Placedetails.name
        case 1:
            return L10n.Placedetails.address
        default:
            return nil
        }
    }
}

extension PlaceDetailsView: UITableViewDelegate {
    
}

extension PlaceDetailsView: ViewProtocol {
    func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(placeView)
        stackView.addArrangedSubview(tableView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
//            placeView.heightAnchor.constraint(equalToConstant: 150),
//            placeView.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.stackView.topAnchor)
            
            ])
    }
}
