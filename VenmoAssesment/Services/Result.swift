//
//  Result.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

protocol Result: API {
    typealias ResultCompletion = (_ data: Data?, _ error: ErrorType?) -> ()
    static func handle(url: String, completion: @escaping ResultCompletion)
}

extension Result {
    static func handle(url: String, completion: @escaping ResultCompletion) {
        handleRequest(with: url, params: nil) { (data, response, error) in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                    completion(nil, ErrorType.response(failure: error))
                    return
            }
            
            let statusResponse = HTTPResponseCodes.response(code: response.statusCode)
            switch statusResponse {
            case .success:
                completion(data, nil)
            default:
                completion(nil, ErrorType.api(failure: statusResponse.rawValue))
            }
        }
    }
}
