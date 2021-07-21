//
//  Bundle+Extensions.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 9/5/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import Foundation

extension Bundle {

    static var versionNumber: String {

        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        return versionNumber
    }

    static var buildNumber: String {

        let buildNumber = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? ""
        return buildNumber
    }
}
