//
//  DefaultsMock.swift
//  
//
//  Created by Mina on 13/07/2022.
//

import BinauralConfigurationKit

struct DefaultsMock: Defaults {
    var environment: String?
    var remoteConfig: [RemoteConfig]?

    init() {
        environment = nil
        remoteConfig = nil
    }
}
