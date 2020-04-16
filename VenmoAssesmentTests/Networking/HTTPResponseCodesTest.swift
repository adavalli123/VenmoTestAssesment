//
//  HTTPResponseCodesTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class HTTPResponseCodesTest: XCTestCase {
    func testHttpResponses() {
        let informationStatusCode = HTTPResponseCodes.response(code: 101)
        XCTAssertEqual(informationStatusCode, HTTPResponseCodes.informational)
        XCTAssertEqual(informationStatusCode.rawValue, "Terminated by an empty line")
        
        let successStatusCode = HTTPResponseCodes.response(code: 200)
        XCTAssertEqual(successStatusCode, HTTPResponseCodes.success)
        XCTAssertEqual(successStatusCode.rawValue.isEmpty, true)
        
        let redirectionStatusCode = HTTPResponseCodes.response(code: 399)
        XCTAssertEqual(redirectionStatusCode, HTTPResponseCodes.redirection)
        XCTAssertEqual(redirectionStatusCode.rawValue, "Client must take additional action to complete the request.")
        
        let clientErrorStatusCode = HTTPResponseCodes.response(code: 404)
        XCTAssertEqual(clientErrorStatusCode, HTTPResponseCodes.clientError)
        XCTAssertEqual(clientErrorStatusCode.rawValue, "Client seems to have erred.")
        
        let serverErrorStatusCode = HTTPResponseCodes.response(code: 503)
        XCTAssertEqual(serverErrorStatusCode, HTTPResponseCodes.serverError)
        XCTAssertEqual(serverErrorStatusCode.rawValue, "Server failed to fulfill an apparently valid request")
        
        let undefinedStatusCode = HTTPResponseCodes.response(code: -1)
        XCTAssertEqual(undefinedStatusCode, HTTPResponseCodes.undefined)
        XCTAssertEqual(undefinedStatusCode.rawValue, "Status code cannot be resolved.")
    }
}
