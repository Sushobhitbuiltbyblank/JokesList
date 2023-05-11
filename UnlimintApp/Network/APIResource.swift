//
//  APIResource.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

protocol APIResource {
    var methodPath: String { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://geek-jokes.sameerkumar.website")!
        components.path = methodPath
        components.queryItems = []
        return components.url!
    }
}

struct JokesResource: APIResource {
    let methodPath = "/api"
}
