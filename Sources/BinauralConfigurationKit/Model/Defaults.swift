//
//  Defaults.swift
//  
//
//  Created by Mina on 13/07/2022.
//

import Foundation

struct DefaultsKeys {
    static let environment = "environment"
    static let remoteConfig = "remoteConfig"
}

public protocol Defaults {
    var environment: String? { get set }
    var remoteConfig: [RemoteConfig]? { get set }
}
