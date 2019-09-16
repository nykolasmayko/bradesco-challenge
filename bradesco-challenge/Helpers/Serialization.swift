//
//  Serialization.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import Foundation

typealias Serialization = Dictionary<String, Any>

protocol SerializationKey {
    var stringValue: String { get }
}

protocol SerializationValue {}


