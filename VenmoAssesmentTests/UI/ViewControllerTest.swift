//
//  ViewControllerTest.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class ViewControllerTest: XCTestCase {
    func testLoadViewSetup() {
        let vc = ViewController()
        vc.loadViewSetup()
        
        XCTAssertNotNil(vc.tableView.delegate)
    }
    
    func testSetup() {
        let vc = ViewController()
        vc.setup()
        
        XCTAssertEqual(vc.title, "Top Songs")
    }
    
    func testGetDetailVC_resultsEmpty() {
        let vc = ViewController()
        let detailVC = vc.getDetailVC(from: 1)
        XCTAssertNil(detailVC)
    }
    
    func testGetDetailVC() {
        let vc = ViewController()
        let viewModal = ViewModal()
        viewModal.results = AlbumResultBuilder.build()
        vc.viewModal = viewModal
        let detailVC = vc.getDetailVC(from: 1)
        let detailVCResult = detailVC?.result
        guard let expectedResult = vc.viewModal.results?[1] else {
            XCTFail("failed to get result")
            return
        }
        
        XCTAssertEqual(detailVCResult?.artistName, expectedResult.artistName)
        XCTAssertEqual(detailVCResult?.artworkUrl100, expectedResult.artworkUrl100)
        XCTAssertEqual(detailVCResult?.name, expectedResult.name)
        XCTAssertEqual(detailVCResult?.url, expectedResult.url)
        XCTAssertEqual(detailVCResult?.copyright, expectedResult.copyright)
        XCTAssertEqual(detailVCResult?.genres.first?.name, expectedResult.genres.first?.name)
    }
    
    func testTableViewDidSelect() {
        let vc = ViewController()
        let indexPath = IndexPath()
        let mockDelegateClass = MockTableViewDelegate()
        
        XCTAssertFalse(mockDelegateClass.isCalled)
        
        vc.tableView.delegate = mockDelegateClass
        vc.tableView.delegate?.tableView!(vc.tableView, didSelectRowAt: indexPath)
        XCTAssertTrue(mockDelegateClass.isCalled)
    }
}

