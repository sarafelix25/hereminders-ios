//
//  PlaceSearchViewController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/21/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import MapKit

struct PlaceResult {

    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}

protocol PlaceSearchViewControllerDelegate: AnyObject {

    func didSelectPlace(_ place: PlaceResult)
    func didCancel()
}

class PlaceSearchViewController: UIViewController {

    weak var delegate: PlaceSearchViewControllerDelegate?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = L10n.Placesearch.namePlaceholder
        return searchController
    }()

    private var lastSearch: MKLocalSearch?
    private var places: [PlaceResult] = []

    init(delegate: PlaceSearchViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: "PlaceSearchViewController", bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            
            self.searchController.searchBar.becomeFirstResponder()
        }
    }

    func configureView() {

        configureNavigationBar()
        configureTableView()
    }

    func configureNavigationBar() {

        let barButtonItem = UIBarButtonItem.customBarButtonItem(with: Asset.iconCross.image,
                                                                for: self,
                                                                and: #selector(didTapOnCloseButton))
        self.navigationItem.leftBarButtonItem = barButtonItem

        self.definesPresentationContext = true
        self.navigationItem.searchController = self.searchController
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = L10n.Placesearch.title
    }

    func configureTableView() {

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    @objc func didTapOnCloseButton() {

        self.delegate?.didCancel()
    }
}

extension PlaceSearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(performSearch(_:)), object: searchController)
        self.perform(#selector(performSearch(_:)), with: searchController, afterDelay: 1)
    }

    @objc func performSearch(_ searchController: UISearchController) {
		
		if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
			return
		}

        self.tableView.isHidden = true
        self.activityIndicatorView.isHidden = false
        self.activityIndicatorView.startAnimating()

        self.lastSearch?.cancel()
        self.lastSearch = nil

        let text = searchController.searchBar.text

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = text

        self.lastSearch = MKLocalSearch(request: request)
        self.lastSearch?.start(completionHandler: self.handleSearch)
    }

    func handleSearch(response: MKLocalSearch.Response?, error: Error?) {

        let places: [PlaceResult] = response?.mapItems.map({ mapItem in

            let name = mapItem.name ?? ""
            let address = mapItem.placemark.formattedAddress()
            let coordinate = mapItem.placemark.coordinate
            return PlaceResult(name: name,
                               address: address,
                               coordinate: coordinate)
        }) ?? []

        self.places = places

        self.tableView.isHidden = false
        self.activityIndicatorView.stopAnimating()

        self.tableView.reloadData()
    }
}

extension PlaceSearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "PlaceSearchCell")

        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "PlaceSearchCell")
        }

        let place = self.places[indexPath.row]

        cell?.textLabel?.text = place.name
        cell?.detailTextLabel?.text = place.address

        return cell!
    }
}

extension PlaceSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let place = self.places[indexPath.row]
        self.delegate?.didSelectPlace(place)
    }
}
