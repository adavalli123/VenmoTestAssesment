//
//  AlbumDetailsViewControllerTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class AlbumDetailsViewControllerTest: XCTestCase {
    func testConstructor() {
        guard let testResult = AlbumResultBuilder.build().first else {
            XCTFail("unable to get mock result data in Detail VC")
            return
        }
        
        let detailVc = DetailViewController(result: testResult)
        guard let result = detailVc.result else {
            XCTFail("unable to get result data in Detail VC")
            return
        }
        
        XCTAssertEqual(result.artistName, testResult.artistName)
        XCTAssertEqual(result.artworkUrl100, testResult.artworkUrl100)
        XCTAssertEqual(result.name, testResult.name)
        XCTAssertEqual(result.url, testResult.url)
        XCTAssertEqual(result.copyright, testResult.copyright)
        XCTAssertEqual(result.genres.first?.name, testResult.genres.first?.name)
    }
    
    func testNavigationTitle() {
        let testResult = AlbumResultBuilder.build().first
        let detailVc = DetailViewController(result: testResult)
        detailVc.title = detailVc.getAlbumDetailsTitle()
        XCTAssertEqual(detailVc.title, "Album Details")
    }
    
    func testScrollViewIsBeingAdded() {
        let testResult = AlbumResultBuilder.build().first
        let detailVC = DetailViewController(result: testResult)
        let viewsCountBeforeAddingScrollView = detailVC.view.subviews.count
        
        let _ = detailVC.configureScrollView()
        let viewsCountAfterAddingScrollView = detailVC.view.subviews.count
        
        XCTAssertNotEqual(viewsCountBeforeAddingScrollView, viewsCountAfterAddingScrollView)
    }
    
    func testStackViewIsBeingAdded() {
        let testResult = AlbumResultBuilder.build().first
        let detailVC = DetailViewController(result: testResult)
        let viewsCountBeforeAddingStackView = detailVC.view.subviews.count
        
        let scrollView = detailVC.configureScrollView()
        let _ = detailVC.configureMainStackView(scrollView: scrollView)
        let viewsCountAfterAddingStackView = detailVC.view.subviews.count
        
        XCTAssertNotEqual(viewsCountBeforeAddingStackView, viewsCountAfterAddingStackView)
    }
    
    func testStackViewIsConfiguredWithUI() {
        let testResult = AlbumResultBuilder.build().first
        let detailVC = DetailViewController(result: testResult)
        let stackViewCount = detailVC.createLabelStackView(from: "Artist:", subTitle: "Ar Rahman").arrangedSubviews.count
        
        XCTAssertGreaterThan(stackViewCount, 0)
    }
    
    func testGoToAlbumUI() {
        let testResult = AlbumResultBuilder.build().first
        let detailVC = DetailViewController(result: testResult)
        let stackViewCount = detailVC.createGoToAlbumButtonStackView().arrangedSubviews.count
        
        XCTAssertGreaterThan(stackViewCount, 0)
    }
    
    func testGoToAlbumButton() {
        let testResult = AlbumResultBuilder.build().first
        let detailVC = DetailViewController(result: testResult)
        let button = detailVC.createGoToAlbumButton()
        
        XCTAssertEqual(button.titleLabel?.text,  "Go to Albums page")
        XCTAssertEqual(button.titleLabel?.font, UIFont.boldSystemFont(ofSize: 14))
        XCTAssertEqual(button.titleLabel?.textColor, UIColor.white)
    }
}

