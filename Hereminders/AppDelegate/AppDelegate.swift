//
//  AppDelegate.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 3/24/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    let notificationCenter = UNUserNotificationCenter.current()

    let dataController: DataControllerType = DataController()
    lazy var placeController: PlaceDataControllerType
        = PlaceDataController(dataController: self.dataController)
    lazy var reminderController: ReminderDataControllerType
        = ReminderDataController(dataController: self.dataController, placeController: self.placeController)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.configureTheme()

        self.configureWindow()

        self.configureNotifications()

        return true
    }

    func configureWindow() {

        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController

        self.appCoordinator = AppCoordinator(navigationController: navigationController,
                                             dataController: self.dataController,
                                             placeController: self.placeController,
                                             reminderController: self.reminderController)
        self.appCoordinator?.start()

        window?.makeKeyAndVisible()
    }

    func applicationWillTerminate(_ application: UIApplication) {

        self.dataController.saveContext()
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {


        guard let url = URL(string: shortcutItem.type), let queryString = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = queryString.host else {

            completionHandler(false)
            return
        }

        if host == "places" {

            self.appCoordinator?.showPlaceSearch()
            completionHandler(true)
            return
        }
        completionHandler(false)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        guard let queryString = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = queryString.host else {
            return false
        }

        switch host {
        case "places":

            self.appCoordinator?.showPlaceSearch()

        case "reminders":

            guard let items = queryString.queryItems else {
                return false
            }

            var latitude: Double?
            var longitude: Double?

            for item in items {
                if let value = item.value, item.name == "latitude" {
                    latitude = Double(value)
                } else if let value = item.value, item.name == "longitude" {
                    longitude = Double(value)
                }
            }

            if let lat = latitude, let long = longitude {
                self.appCoordinator?.showNewReminder(forLatitude: lat, andLongitude: long)
            }
        default:
            break
        }

        return true
    }
}


