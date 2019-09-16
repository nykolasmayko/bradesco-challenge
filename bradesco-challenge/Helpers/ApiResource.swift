//
//  ApiResource.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import Foundation

protocol ApiResource{
    associatedtype Model
    
    var baseURL: String {set get}
    var methodPath: String { get }
    var modelPath: String { set get }
    var language: String { set get }
    var sort: String {set get}
    func makeModel(serialization: Serialization) -> Model
}

extension ApiResource{
    var url: URL{
        let url = baseURL + methodPath + modelPath + "?q=" + language + "&" + sort
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> Array<Model>? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else{
            return nil
            
        }
        
        guard let jsonSerialization = json as? Serialization else{
            return nil
        }
        
        let wrapper = GitWrapper(serialization: jsonSerialization)
        
        return wrapper.items.map(makeModel(serialization:))
    }
}
