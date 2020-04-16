//
//  AlbumFlowTest.swift
//  VenmoAssesmentUITests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest

class AlbumFlowTest: XCTestCase {
    func testHappyPathForSongBrowser() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.cells.firstMatch
        _ = cell.waitForExistence(timeout: 30)
        cell.tap()
        
        let goToAlbumsPageElement = app.buttons.matching(identifier: "Go to Albums page").firstMatch
        _ = goToAlbumsPageElement.waitForExistence(timeout: 30)
        goToAlbumsPageElement.tap()
        
        let listenOnAppleMusicElement = app.webViews.buttons["Listen on Apple Music"].firstMatch
        _ = listenOnAppleMusicElement.waitForExistence(timeout: 30)
        XCTAssert(listenOnAppleMusicElement.isHittable == true)
        listenOnAppleMusicElement.tap()
    }

    func testsearchTextFlow() {
        let app = XCUIApplication()
        app.launch()
        
        let searchElement = app.searchFields.firstMatch
        _ = searchElement.waitForExistence(timeout: 30)
        searchElement.tap()
        
        searchElement.typeText("Drake")
        
        let cell = app.cells.firstMatch
        _ = cell.waitForExistence(timeout: 30)
        cell.tap()
    }
}
