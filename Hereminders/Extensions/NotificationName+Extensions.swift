//
//  NotificationName+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 9/3/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation

extension Notification.Name {

    static let addNewPlace = Notification.Name("com.going.hereminders.notifications.addNewPlace")
    static let removePlace = Notification.Name("com.going.hereminders.notifications.removePlace")
    static let editPlace = Notification.Name("com.going.hereminders.notifications.editPlace")
}
