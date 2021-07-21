//
//  Reminder+CoreDataClass.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/25/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Reminder)
public class Reminder: NSManagedObject {

    @nonobjc public class var entityName: String {

        return "Reminder"
    }

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var event: Int32
    @NSManaged public var desc: String?
    @NSManaged public var radius: Int32
    @NSManaged public var createdAt: NSDate
    @NSManaged public var place: Place
    @NSManaged public var notificationIdentifier: String?
}
