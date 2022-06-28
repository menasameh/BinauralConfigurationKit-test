//
//  BinauralConfigurationKit.swift
//
//
//  Created by Mina on 28/06/2022.
//

public struct BinauralConfigurationKit {
    public static var environment: BinauralEnvironment {
        get { BinauralEnvironment.init(rawValue: Defaults.shared.environment ?? "") ?? .prod }
        set { Defaults.shared.environment = newValue.rawValue }
    }
}
