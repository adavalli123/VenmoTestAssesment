//
//  UILabelTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class UILabelTest: XCTestCase {
    func testLabelCreation() {
        let label = UILabel.createLabel(from: "ABC")
        
        XCTAssertEqual(label.text, "ABC")
        XCTAssertEqual(label.numberOfLines, 1)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 12))
        XCTAssertEqual(label.textAlignment, NSTextAlignment.left)
    }
    
    func testLabelCreation_custom() {
        let label = UILabel.createLabel(from: "ABC", enableBoldFont: true, numberOfLines: 0)
        
        XCTAssertEqual(label.text, "ABC")
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.font, UIFont.boldSystemFont(ofSize: 12))
        XCTAssertEqual(label.textAlignment, NSTextAlignment.left)
    }
}
