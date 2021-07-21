//
//  TodayViewController.swift
//  HeremindersTodayExtension
//
//  Created by Rodrigo Borges on 8/6/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import NotificationCenter

final class TodayViewController: UIViewController, NCWidgetProviding {

    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!
    private let dataController: DataControllerType = DataController()
    private lazy var placeController: PlaceDataControllerType = PlaceDataController(dataController: self.dataController)
    private lazy var places = self.placeController.allPlaces()

    var limitedPlacesCount: Int {

        if self.places.count > Constants.maxNumberOfPlaces {

            return Constants.maxNumberOfPlaces
        }

        return self.places.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureCollectionView()
        self.configureInterface()
    }

    private func configureCollectionView() {

        let cellNib = UINib(nibName: "PlaceCollectionViewCell", bundle: .main)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "PlaceCollectionViewCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func configureInterface() {

        self.collectionView.isHidden = self.places.isEmpty
        self.emptyView.isHidden = !self.places.isEmpty
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {

        self.updatePlaces()

        self.configureInterface()

        completionHandler(NCUpdateResult.newData)
    }

    private func updatePlaces() {

        self.places = self.placeController.allPlaces()
        self.collectionView.reloadData()
    }

    @IBAction func addNewPlaceButtonTapped(_ sender: UIButton) {

        let url = URL(string: "hereminders://places/new")!
        self.extensionContext?.open(url)
    }
    
    private enum Constants {

        static let maxNumberOfPlaces = 4
        static let cellSpacing: CGFloat = 8
    }
}

extension TodayViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.limitedPlacesCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as? PlaceCollectionViewCell else {

            fatalError()
        }

        let place = self.places[indexPath.row]
        cell.configure(with: place)

        return cell
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let place = self.places[indexPath.row]
        let url = URL(string: "hereminders://reminders/new/?latitude=\(place.latitude)&longitude=\(place.longitude)")!
        self.extensionContext?.open(url)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = self.collectionView.frame.width/CGFloat(self.limitedPlacesCount)
        let height: CGFloat = self.collectionView.frame.height

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
}
