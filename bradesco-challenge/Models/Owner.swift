//
//  Owner.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import UIKit

class Owner{
    
    private enum Keys: String, SerializationKey{
        case login
        case id
        case avatarURL = "avatar_url"
        case repositoryURL = "url"
    }
    
    let login: String?
    let id: String?
    let avatarURL: URL?
    let repositoryURL: URL?
    var avatarImage: UIImage?
    
    init(serialization: Serialization){
        login = serialization.value(forKey: Keys.login)
        id = serialization.value(forKey: Keys.id)
        avatarURL = URL(string: serialization.value(forKey: Keys.avatarURL) ?? "")
        repositoryURL = URL(string: serialization.value(forKey: Keys.repositoryURL) ?? "")
    }
    
    
}
