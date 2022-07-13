//
//  BinauralConfigurationKit.swift
//  
//
//  Created by Mina on 15/07/2022.
//

public protocol BinauralConfigurationKit {
    mutating func setEnvironment(environment: BinauralEnvironment)
    func getEnvironment() -> BinauralEnvironment

    mutating func setRemoteConfigs(remoteConfigs: [RemoteConfig])
    mutating func updateRemoteConfigs(remoteConfigs: [RemoteConfig])
    func getRemoteConfigs() -> [RemoteConfig]
}
