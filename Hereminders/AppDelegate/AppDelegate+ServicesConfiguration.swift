//
//  AppDelegate+ServicesConfiguration.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 9/8/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Fabric
import Crashlytics

extension AppDelegate {

    func configureServices() {

        Fabric.with([Crashlytics.self])
    }
}
