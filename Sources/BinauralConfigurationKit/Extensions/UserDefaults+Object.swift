//
//  File.swift
//  
//
//  Created by Mina on 13/07/2022.
//

import Foundation

extension UserDefaults {

func setObject<Object>(_ object: Object, forKey: String) where Object: Encodable
{
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(object)
        set(data, forKey: forKey)
        synchronize()
    } catch let encodeErr {
        print("Failed to encode object:", encodeErr)
    }
}

func getObject<Object>(forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable
{
    guard let data = data(forKey: forKey) else { return nil }
    let decoder = JSONDecoder()
    do {
        let object = try decoder.decode(type, from: data)
        return object
    } catch let decodeError{
        print("Failed to decode object:" , decodeError)
        return nil
    }
}

}
