//
//  NotificationNameExtensionsUnitTests.swift
//  HeremindersTests
//
//  Created by Dairan on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
@testable import Hereminders

class NotificationNameExtensionsUnitTests: XCTestCase {

//  extension Notification.Name {
//
//    static let addNewPlace = Notification.Name("com.going.hereminders.notifications.addNewPlace")
//    static let removePlace = Notification.Name("com.going.hereminders.notifications.removePlace")
//    static let editPlace = Notification.Name("com.going.hereminders.notifications.editPlace")
//  }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParaNotificationNameExtensions() throws {
      let expectedAddNewPlace = "com.going.hereminders.notifications.addNewPlace"
      let expectedRemovePlace = "com.going.hereminders.notifications.removePlace"
      let expectedEditPlace = "com.going.hereminders.notifications.editPlace"

      let sutAddNewPlace = Notification.Name.addNewPlace
      let sutRemovePlace = Notification.Name.removePlace
      let sutEditPlace = Notification.Name.editPlace

      XCTAssert(expectedAddNewPlace == sutAddNewPlace.rawValue)
      XCTAssert(expectedEditPlace == sutEditPlace.rawValue)
      XCTAssert(expectedRemovePlace == sutRemovePlace.rawValue)


    }


}
