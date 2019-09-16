//
//  Library.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

class Library{
    
    
    private enum Keys: String, SerializationKey{
        case id
        case name
        case fullName = "full_name"
        case openIssues = "open_issues"
        case forks
        case watchers
        case score
        case owner
    }
    
    let id: String?
    let name: String?
    let fullName: String?
    let forks: Int?
    let openIssues: Int?
    let watchers: Int?
    let score: Int?
    var owner: Owner?
    
    
    init(serialization: Serialization){
        id = serialization.value(forKey: Keys.id)
        name = serialization.value(forKey: Keys.name)
        fullName = serialization.value(forKey: Keys.fullName)
        forks = serialization.value(forKey: Keys.forks)
        openIssues = serialization.value(forKey: Keys.openIssues)
        watchers = serialization.value(forKey: Keys.watchers)
        score = serialization.value(forKey: Keys.score)
        if let ownerSerialization : Serialization = serialization.value(forKey: Keys.owner){
            owner = Owner(serialization: ownerSerialization)
        }else{
            owner = nil
        }
    }
}

struct LiraryResource: ApiResource{
    typealias Model = Library
    
    var baseURL: String = "https://api.github.com/"
    
    var methodPath: String = "search/"
    
    var modelPath: String = "repositories"
    
    var language: String
    
    var sort: String
    
    init(language: String, sort: String){
        self.language = "language:" + language
        self.sort = "sort:" + sort
    }
    
    func makeModel(serialization: Serialization) -> Library {
        return Library(serialization: serialization)
    }
}
