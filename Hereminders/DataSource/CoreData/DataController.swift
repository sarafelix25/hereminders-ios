//
//  DataController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import CoreData

protocol DataControllerType: AnyObject {

    var managedObjectContext: NSManagedObjectContext { get }
    func saveContext()
}

final class DataController: DataControllerType {
    
    var managedObjectContext: NSManagedObjectContext
    var persistentContainer: NSPersistentContainer

    init() {

        self.persistentContainer = NSPersistentContainer(name: "Hereminders")

        let url = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.com.going.hereminders")!
            .appendingPathComponent("Hereminders.sqlite")

        self.persistentContainer.persistentStoreDescriptions = [NSPersistentStoreDescription(url: url)]
        self.persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        self.managedObjectContext = persistentContainer.viewContext
    }

    func saveContext() {

        let context = self.persistentContainer.viewContext
        if context.hasChanges {

            do {

                try context.save()
            } catch {

                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
