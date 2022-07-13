//
//  Defaults.swift
//  
//
//  Created by Mina on 28/06/2022.
//

import Foundation

class DefaultsImpl: Defaults {
    private let standardDefaults = UserDefaults.init(suiteName: "group.com.giorgiocalderolla.binaural")!

    var environment: String? {
        get {
            return standardDefaults.string(forKey: DefaultsKeys.environment)
        }
        set {
            standardDefaults.set(newValue, forKey: DefaultsKeys.environment)
        }
    }


    var remoteConfig: [RemoteConfig]? {
        get {
            return standardDefaults.getObject(forKey: DefaultsKeys.remoteConfig, castTo: [RemoteConfig].self)
        }
        set {
            standardDefaults.setObject(newValue, forKey: DefaultsKeys.remoteConfig)
        }
    }

}
