//
//  NetworkRequest.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import UIKit

protocol NetworkRequest: class {
    associatedtype Model
    func load(withCompletion completion: @escaping (Model?) -> Void)
    func decode(_ data: Data) -> Model?
}


extension NetworkRequest{
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (Model?) -> Void){
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url) {(data, urlResponse, error) in
            guard let data = data else{
                completion(nil)
                return
            }
            completion(self.decode(data))
        }
        task.resume()
    }
}

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ApiRequest: NetworkRequest{
    func load(withCompletion completion: @escaping (Array<Resource.Model>?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
    
    func decode(_ data: Data) -> Array<Resource.Model>?{
        return resource.makeModel(data: data)
    }

}

class ImageRequest: NetworkRequest{
    typealias Model = UIImage
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func load(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(url, withCompletion: completion)
    }
    
}
