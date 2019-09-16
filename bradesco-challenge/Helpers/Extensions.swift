//
//  Extensions.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import Foundation


extension RawRepresentable where RawValue == String{
    var stringValue: String{
        return rawValue
    }
}

extension Bool: SerializationValue{}
extension String: SerializationValue{}
extension Int: SerializationValue{}
extension Dictionary: SerializationValue{}
extension Array: SerializationValue{}

extension Dictionary where Key == String, Value: Any {
    func value<V: SerializationValue>(forKey key: SerializationKey) -> V?{
        return self[key.stringValue] as? V
    }
}
