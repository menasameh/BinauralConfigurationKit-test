//
//  BinauralConfigurationKitImpl.swift
//
//
//  Created by Mina on 28/06/2022.
//

public struct BinauralConfigurationKitImpl: BinauralConfigurationKit {

    private var defaults: Defaults

    init(defaults: Defaults = DefaultsImpl()) {
        self.defaults = defaults
    }

    public static var shared: BinauralConfigurationKit = BinauralConfigurationKitImpl()

    public mutating func setEnvironment(environment: BinauralEnvironment) {
        defaults.environment = environment.rawValue
    }

    public func getEnvironment() -> BinauralEnvironment {
        BinauralEnvironment.init(rawValue: defaults.environment ?? "") ?? .prod
    }

    public mutating func setRemoteConfigs(remoteConfigs: [RemoteConfig]) {
        guard let savedRemoteConfigs: [RemoteConfig] = defaults.remoteConfig else {

            // No remote configs found in the user defaults, save the new ones directly.
            defaults.remoteConfig = remoteConfigs
            return
        }

        let newRemoteConfigs: [RemoteConfig] = remoteConfigs.map { newRemoteConfig in
            // keep the old overrided value
            guard let oldRemoteConfig = savedRemoteConfigs.first(where: { $0.name == newRemoteConfig.name }) else {
                return newRemoteConfig
            }

            return RemoteConfig(name: newRemoteConfig.name, override: oldRemoteConfig.override, value: newRemoteConfig.value)
        }

        defaults.remoteConfig = newRemoteConfigs
    }

    public mutating func updateRemoteConfigs(remoteConfigs: [RemoteConfig]) {
        // keep all the new values
        defaults.remoteConfig = remoteConfigs
    }

    public func getRemoteConfigs() -> [RemoteConfig] {
        return defaults.remoteConfig ?? []
    }

}
