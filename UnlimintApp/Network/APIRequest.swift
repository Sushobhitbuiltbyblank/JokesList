//
//  APIRequest.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func load(withCompletion completion: @escaping (String) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}

