//
//  PlaceDetailsView.swift
//  Hereminders
//
//  Created by sara.batista.d.felix on 03/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

final class PlaceDetailsView: UIView {
    lazy var tableView: UITableView = {
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
        
        
        // setar puxando a stack
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
//git pull devpass dev
/*
 PlacelLocationView antes da TableView
 -> pode usar stackview
 
 PlView height 150, widht: seguindo a view
 
 
*/
