//
//  ErrorType.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

enum ErrorType: Error {
    case response(failure: Error?)
    case api(failure: String)
    
    var errorDescription: String {
        switch self {
        case .response(failure: let error):
            return error?.localizedDescription ?? ""
        case .api(failure: let error):
            return error
        }
    }
}
