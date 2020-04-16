//
//  UIStackViewTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class UIStackViewTest: XCTestCase {
    func testStackViewSetup_default() {
        let stackView = UIStackView.configureStackView()
        
        XCTAssertEqual(stackView.distribution, UIStackView.Distribution.fill)
        XCTAssertEqual(stackView.alignment, UIStackView.Alignment.fill)
        XCTAssertEqual(stackView.spacing, CGFloat(5))
        XCTAssertEqual(stackView.axis, NSLayoutConstraint.Axis.vertical)
    }
    
    func testStackViewSetup_custom() {
        let stackView = UIStackView.configureStackView(spacing: 10, axis: .horizontal)
        
        XCTAssertEqual(stackView.distribution, UIStackView.Distribution.fill)
        XCTAssertEqual(stackView.alignment, UIStackView.Alignment.fill)
        XCTAssertEqual(stackView.spacing, CGFloat(10))
        XCTAssertEqual(stackView.axis, NSLayoutConstraint.Axis.horizontal)
    }

    func testAddedViews() {
        let stackView = UIStackView()
        let firstView = UIView()
        let secondView = UIView()
        let arrayViews = [firstView, secondView]
        
        stackView.addArrangedSubViews(arrayViews)
        
        XCTAssertEqual(stackView.arrangedSubviews.count, arrayViews.count)
    }
}

