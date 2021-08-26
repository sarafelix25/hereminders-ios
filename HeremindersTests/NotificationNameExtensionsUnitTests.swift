//
//  NotificationNameExtensionsUnitTests.swift
//  HeremindersTests
//
//  Created by Dairan on 11/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

@testable import Hereminders
import XCTest

class NotificationNameExtensionsUnitTests: XCTestCase {
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
