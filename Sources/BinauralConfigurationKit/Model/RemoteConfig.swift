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

    let name: String
    let override: Type?
    let value: Type

    var finalValue: Type { override ?? value }

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
