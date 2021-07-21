//
//  ReminderViewController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import CoreLocation
import RxSwift

protocol ReminderViewControllerDelegate: AnyObject {
    
    func reminderViewControllerDidSaveNewReminder()
    func reminderViewControllerDidCancel()
    func reminderViewControllerWantsToAddPlace()
}

final class ReminderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewReminderButton: UIButton!
    @IBOutlet weak var mapHeaderView: MapHeaderView!

    private weak var delegate: ReminderViewControllerDelegate?

    var viewModel: ReminderViewModel

    private var disposeBag = DisposeBag()

    init(viewModel: ReminderViewModel, delegate: ReminderViewControllerDelegate) {
        
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: "ReminderViewController", bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let firstIndexPath = IndexPath(row: 0, section: 0)
        let textInputCell = self.tableView?.cellForRow(at: firstIndexPath) as? TextInputTableViewCell
        textInputCell?.textField.becomeFirstResponder()
    }

    func configureView() {

        self.configureNavigationBar()
        self.configureHeaderView()
        self.configureTableView()
        self.configureAddNewReminderButton()
    }

    func bindViewModel() {

        self.viewModel.viewStateSubject
            .subscribe(onNext: { [weak self] state in

                DispatchQueue.main.async {
                    
                    self?.renderViewState(state)
                }
            })
            .disposed(by: self.disposeBag)
    }

    func renderViewState(_ viewState: ReminderViewState) {

        let placeName = viewState.placeName
        let placeCoordinate = viewState.placeCoordinate

        var viewModel = MapHeaderViewModel()
        viewModel.placeName = placeName
        viewModel.placeCoordinate = placeCoordinate

        self.mapHeaderView.render(with: viewModel)

        let isEnabled = !(viewState.description?.isEmpty ?? true)
        self.addNewReminderButton.isEnabled = isEnabled
        self.addNewReminderButton.backgroundColor = isEnabled ? UIColor.heremindersBlue : UIColor.lightGray
        self.tableView.reloadData()
    }

    func configureNavigationBar() {

        self.navigationItem.title = L10n.Reminder.title

        let barButtonItem = UIBarButtonItem.customBarButtonItem(with: Asset.iconCross.image,
                                                                for: self,
                                                                and: #selector(didTapOnCloseButton))
        self.navigationItem.leftBarButtonItem = barButtonItem
    }

    func configureHeaderView() {

        self.mapHeaderView.delegate = self
    }

    func configureTableView() {

        TextInputTableViewCell.registerXib(in: tableView)
        SliderTableViewCell.registerXib(in: tableView)
        SegmentedControlTableViewCell.registerXib(in: tableView)

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func configureAddNewReminderButton() {

        self.addNewReminderButton.isEnabled = false
        self.addNewReminderButton.backgroundColor = .lightGray
        self.addNewReminderButton.setTitle(L10n.Reminder.addNewReminder, for: .normal)
    }

    @objc func didTapOnCloseButton() {

        self.delegate?.reminderViewControllerDidCancel()
    }

    @IBAction func didTapOnAddNewReminderButton(_ sender: UIButton) {

        self.viewModel.saveNewReminder()
        self.delegate?.reminderViewControllerDidSaveNewReminder()
    }
}

extension ReminderViewController: MapHeaderViewDelegate {

    func didTapOnAddPlaceButton() {

        self.delegate?.reminderViewControllerWantsToAddPlace()
    }
}
