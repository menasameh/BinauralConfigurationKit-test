//
//  RemoteConfig.swift
//  
//
//  Created by Mina on 13/07/2022.
//

import Foundation

public struct RemoteConfig: Codable, Equatable {
    public enum `Type`: Codable, Equatable {
        case string(String)
        case bool(Bool)
    }

    public let name: String
    public let override: Type?
    public let value: Type

    public var finalValue: Type { override ?? value }

    public init(name: String, override: RemoteConfig.`Type`?, value: RemoteConfig.`Type`) {
        self.name = name
        self.override = override
        self.value = value
    }

    public static func boolRemoteConfig(name: String, override: Bool? = nil, value: Bool) -> RemoteConfig {
        let overrideValue: Type?
        if let overrideAvailable = override {
            overrideValue = .bool(overrideAvailable)
        } else {
            overrideValue = nil
        }

        return self.init(name: name, override: overrideValue, value: .bool(value))
    }

    public static func stringRemoteConfig(name: String, override: String? = nil, value: String) -> RemoteConfig {
        let overrideValue: Type?
        if let overrideAvailable = override {
            overrideValue = .string(overrideAvailable)
        } else {
            overrideValue = nil
        }
        return self.init(name: name, override: overrideValue, value: .string(value))
    }
}
