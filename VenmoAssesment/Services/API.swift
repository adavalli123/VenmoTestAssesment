//
//  API.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

protocol API {
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()
    static func baseUrl() -> String
    static func handleRequest(with endPoint: String, params: [String: AnyObject]?, completion: @escaping NetworkCompletion)
}

extension API {
    static func baseUrl() -> String {
        return "https://rss.itunes.apple.com/"
    }
    
    static func handleRequest(with endPoint: String, params: [String: AnyObject]?, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: Self.baseUrl() + endPoint) else { return }
        
        let session = URLSession(configuration: .default)
        session.configuration.timeoutIntervalForRequest = 300
        let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            completion(data, response, error)
        })
        
        dataTask.resume()
    }
}
