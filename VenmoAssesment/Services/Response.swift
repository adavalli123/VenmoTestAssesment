//
//  Response.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

protocol Response: Result {
    static func handle<T: Decodable>(url: String, decodingType: T.Type, completion: @escaping (T?, ErrorType?) -> ())
}

extension Response {
    static func handle<T: Decodable>(url: String, decodingType: T.Type, completion: @escaping (T?, ErrorType?) -> ()) {
        handle(url: url) { (data, error) in
            guard let data = data, error == nil else {
                completion(nil, ErrorType.response(failure: error))
                return
            }
            
            do {
                let element = try JSONDecoder().decode(decodingType, from: data)
                completion(element, nil)
            } catch let errorObject {
                completion(nil, ErrorType.response(failure: errorObject))
            }
        }
    }
}
