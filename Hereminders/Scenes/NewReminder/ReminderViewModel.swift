//
//  ReminderViewModel.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 6/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications
import CoreData
import RxSwift

struct ReminderViewState {

    var placeName: String? = nil
    var placeCoordinate: CLLocationCoordinate2D? = nil
    var description: String? = nil
    var radius: Int = 100
    var event: Int = 0
}

final class ReminderViewModel {

    var viewState: ReminderViewState {

        didSet {

            self.viewStateSubject.onNext(viewState)
        }
    }

    lazy var viewStateSubject = BehaviorSubject<ReminderViewState>(value: self.viewState)
    private let reminderController: ReminderDataControllerType

    init(viewState: ReminderViewState, reminderController: ReminderDataControllerType) {

        self.viewState = viewState
        self.reminderController = reminderController
    }

    func saveNewReminder() {

        let notificationIdentifier = self.createLocalNotification()
        self.saveReminder(with: notificationIdentifier)
    }

    private func createLocalNotification() -> String {

        guard let placeName = self.viewState.placeName,
            let placeCoordinate = self.viewState.placeCoordinate,
            let reminderDescription = self.viewState.description else {

            fatalError()
        }

        let notificationCenter = UNUserNotificationCenter.current()

        let notificationCategory = "com.hereminders.local-notification"
        let placeIdentifier = placeName.removingSpaces().lowercased()
        let descriptionIdentifier = reminderDescription.removingSpaces().lowercased()

        let content = UNMutableNotificationContent()
        content.title = placeName
        content.body = self.viewState.description ?? ""
        content.sound = .default
        content.categoryIdentifier = notificationCategory
        content.threadIdentifier = [notificationCategory, placeIdentifier].joined(separator: ".")

        let region = CLCircularRegion(center: placeCoordinate,
                                      radius: CLLocationDistance(self.viewState.radius),
                                      identifier: placeName)
        region.notifyOnEntry = self.viewState.event == 0
        region.notifyOnExit = self.viewState.event == 1

        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)

        let identifier = [notificationCategory, placeIdentifier, descriptionIdentifier].joined(separator: ".")
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content,
                                            trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error when trying to schedule notification: \(error.localizedDescription)")
            }
        }

        return identifier
    }

    private func saveReminder(with notificationIdentifier: String) {

        guard let placeName = self.viewState.placeName, let placeCoordinate = self.viewState.placeCoordinate else {

            return
        }

        self.reminderController.addReminder(withPlaceName: placeName,
                                            latitude: placeCoordinate.latitude,
                                            longitude: placeCoordinate.longitude,
                                            description: self.viewState.description ?? L10n.Reminder.noDescription,
                                            event: self.viewState.event,
                                            radius: self.viewState.radius,
                                            notificationIdentifier: notificationIdentifier)
    }
    
}
