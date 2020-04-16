//
//  HTTPResponseCodes.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

enum HTTPResponseCodes: String, RawRepresentable {
    case informational = "Terminated by an empty line"
    case success = ""
    case redirection = "Client must take additional action to complete the request."
    case clientError = "Client seems to have erred."
    case serverError = "Server failed to fulfill an apparently valid request"
    case undefined = "Status code cannot be resolved."
    
    static func response(code: Int) -> HTTPResponseCodes {
        switch code {
        case 100 ..< 200:
            return .informational
            
        case 200 ..< 300:
            return .success
            
        case 300 ..< 400:
            return .redirection
            
        case 400 ..< 500:
            return .clientError
            
        case 500 ..< 600:
            return .serverError
            
        default:
            return .undefined
        }
    }
}
