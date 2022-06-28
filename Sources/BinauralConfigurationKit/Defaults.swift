//
//  Defaults.swift
//  
//
//  Created by Mina on 28/06/2022.
//

import Foundation

class Defaults {
    private let standardDefaults = UserDefaults.init(suiteName: "group.com.giorgiocalderolla.binaural")!
    static let shared = Defaults()

    private struct Keys {
        static let environment = "environment"
    }

    var environment: String? {
        get {
            return standardDefaults.string(forKey: Keys.environment)
        }
        set {
            standardDefaults.set(newValue, forKey: Keys.environment)
        }
    }
}
