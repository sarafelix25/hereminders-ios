//
//  UIViewControllerUnitTests.swift
//  HeremindersTests
//
//  Created by Rodrigo Borges on 10/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//
import  XCTest
@testable import Hereminders

class UIViewControllerUnitTests: XCTestCase {

    func testInsideNavigationController() throws {

        let viewController = UIViewController()

        let navigationController = viewController.insideNavigationController()

        XCTAssert(navigationController.viewControllers.first == viewController)
        XCTAssert(navigationController.modalPresentationStyle == .formSheet)
    }
}
