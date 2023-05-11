//
//  NetworkRequest.swift
//  UnlimintApp
//
//  Created by SUSHOBHIT JAIN on 07/05/23.
//

import Foundation

protocol NetworkRequest: AnyObject {
    func load(withCompletion completion: @escaping (String) -> Void)
}

extension NetworkRequest {
    func load(_ url: URL, withCompletion completion: @escaping (String) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                return
            }
            if let joke = String(data: data, encoding: .utf8) {
                completion(joke)
            }
        })
        task.resume()
    }
}
