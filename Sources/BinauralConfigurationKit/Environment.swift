//
//  Environment.swift
//  
//
//  Created by Mina on 28/06/2022.
//

import Foundation

public enum BinauralEnvironment: String, CaseIterable, Identifiable {
    public var id: Self { self }

    case staging
    case prod
}
