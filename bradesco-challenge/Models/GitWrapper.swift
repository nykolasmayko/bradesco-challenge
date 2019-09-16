//
//  GitWrapper.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

class GitWrapper{
    
    private enum Keys: String, SerializationKey {
        case items
    }
    
    let items: Array<Serialization>
    
    init(serialization: Serialization){
        items = serialization.value(forKey: Keys.items) ?? []
    }
}
