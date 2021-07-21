//
//  ReminderDataController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 9/8/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import CoreData

protocol ReminderDataControllerType: AnyObject {

    func reminders(in place: Place) -> [Reminder]
    func reminderWithNotificationIdentifier(_ identifier: String) -> Reminder?
    func removeReminder(_ reminder: Reminder)
    func addReminder(withPlaceName placeName: String, latitude: Double, longitude: Double, description: String, event: Int, radius: Int, notificationIdentifier: String)
}

final class ReminderDataController: ReminderDataControllerType {

    private let dataController: DataControllerType
    private let placeController: PlaceDataControllerType

    init(dataController: DataControllerType, placeController: PlaceDataControllerType) {

        self.dataController = dataController
        self.placeController = placeController
    }

    func reminders(in place: Place) -> [Reminder] {

        let context = self.dataController.managedObjectContext
        var reminders: [Reminder] = []

        let request = NSFetchRequest<Reminder>(entityName: Reminder.entityName)
        request.predicate = NSPredicate(format: "place == %@", place)

        do {

            reminders = try context.fetch(request)
        } catch {

            print("Error while fetching reminders")
        }

        return reminders
    }

    func reminderWithNotificationIdentifier(_ identifier: String) -> Reminder? {

        let context = self.dataController.managedObjectContext

        do {
            
            let request = NSFetchRequest<Reminder>(entityName: Reminder.entityName)
            request.predicate = NSPredicate(format: "notificationIdentifier == %@", identifier)

            if let reminder = try context.fetch(request).first {
                return reminder
            }
        } catch {

            print("Error while fetching reminders")
        }

        return nil
    }

    func removeReminder(_ reminder: Reminder) {

        let context = self.dataController.managedObjectContext
        context.delete(reminder)
        self.dataController.saveContext()
    }

    func addReminder(withPlaceName placeName: String, latitude: Double, longitude: Double, description: String, event: Int, radius: Int, notificationIdentifier: String) {

        let context = self.dataController.managedObjectContext
        let reminder = NSEntityDescription.insertNewObject(forEntityName: Reminder.entityName, into: context) as! Reminder
        reminder.desc = description
        reminder.event = Int32(event)
        reminder.radius = Int32(radius)
        reminder.createdAt = NSDate()
        reminder.notificationIdentifier = notificationIdentifier

        var place: Place

        if let savedPlace = self.placeController.place(withLatitude: latitude, andLongitude: longitude) {

            place = savedPlace
        } else {

            fatalError("Place not found")
        }

        reminder.place = place

        self.dataController.saveContext()
    }
}


