//
//  ErrorTypeTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class ErrorTypeTest: XCTestCase {
    func testErrorDescription_apiFailure() {
        let errorType = ErrorType.api(failure: "error")
        
        XCTAssertEqual(errorType.errorDescription, "error")
    }
    
    func testErrorDescription_responseFailure_emptyError() {
        let errorType = ErrorType.response(failure: nil)
        XCTAssertEqual(errorType.errorDescription, "")
    }
}
