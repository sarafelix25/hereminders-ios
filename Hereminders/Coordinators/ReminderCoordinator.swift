//
//  ReminderCoordinator.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/28/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import CoreLocation

protocol ReminderCoordinatorDelegate: AnyObject {
    func reminderCoordinatorDidSaveReminder(_ coordinator: ReminderCoordinator)
    func reminderCoordinatorDidCancel(_ coordinator: ReminderCoordinator)
}

class ReminderCoordinator: CoordinatorType {

    private var reminder: Reminder?
    private var place: Place?
    private var viewModel: ReminderViewModel?
    private let reminderController: ReminderDataControllerType

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorType] = []

    weak var delegate: ReminderCoordinatorDelegate?

    init(navigationController: UINavigationController, reminderController: ReminderDataControllerType, reminder: Reminder?, place: Place?) {

        self.navigationController = navigationController
        self.reminderController = reminderController
        self.reminder = reminder
        self.place = place
    }

    public func start() {
        
        var viewState = ReminderViewState()

        if let place = self.place {
            viewState.placeName = place.name
            viewState.placeCoordinate = place.coordinate
        }

        if let reminder = self.reminder {
            viewState.description = reminder.desc
            viewState.placeCoordinate = CLLocationCoordinate2D(latitude: reminder.place.latitude, longitude: reminder.place.longitude)
            viewState.placeName = reminder.place.name
            viewState.radius = Int(reminder.radius)
            viewState.event = Int(reminder.event)
        }

        let viewModel = ReminderViewModel(viewState: viewState, reminderController: self.reminderController)
        self.viewModel = viewModel

        let viewController = ReminderViewController(viewModel: viewModel, delegate: self)
        let navigationController = viewController.insideNavigationController()

        self.navigationController.present(navigationController, animated: true)
    }

    func showAddPlace() {
        let placeSearchCoordinator = PlaceSearchCoordinator(navigationController: self.navigationController.presentedViewController as! UINavigationController)
        placeSearchCoordinator.delegate = self
        placeSearchCoordinator.start()

        self.childCoordinators.append(placeSearchCoordinator)
    }
}

extension ReminderCoordinator: ReminderViewControllerDelegate {

    func reminderViewControllerDidSaveNewReminder() {

        self.delegate?.reminderCoordinatorDidSaveReminder(self)
    }

    func reminderViewControllerDidCancel() {
        
        self.delegate?.reminderCoordinatorDidCancel(self)
    }

    func reminderViewControllerWantsToAddPlace() {

        self.showAddPlace()
    }
}

extension ReminderCoordinator: PlaceSearchCoordinatorDelegate {

    func placeSearchCoordinatorDidSelectPlace(_ place: PlaceResult) {

        var viewState = self.viewModel!.viewState
        viewState.placeName = place.name
        viewState.placeCoordinate = place.coordinate
        self.viewModel?.viewState = viewState

        self.navigationController.presentedViewController?.dismiss(animated: true)
        self.childCoordinators.removeLast()
    }

    func placeSearchCoordinatorDidCancel() {

        self.navigationController.presentedViewController?.dismiss(animated: true)
        self.childCoordinators.removeLast()
    }

}
