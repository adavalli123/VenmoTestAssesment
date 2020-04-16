//
//  ViewModalTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class ViewModalTest: XCTestCase {
    func testTitle() {
        let vm = ViewModal()
        let title = vm.setTitle()
        
        XCTAssertEqual(title, "Top Songs")
    }
}
