//
//  TableViewTests.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import VenmoAssesment

class TableViewTests: XCTestCase {
    func testTableViewRows() {
        let tableView = TableView()
        let mockDataSource = MockTableViewDatasource()
        let results = AlbumResultBuilder.build()
        mockDataSource.results = results
        tableView.dataSource = mockDataSource
        
        let rowsCount = mockDataSource.tableView(tableView, numberOfRowsInSection: 100)
        XCTAssertEqual(rowsCount, 2)
    }
    
    func testCellForRowIsCalled() {
        let tableView = TableView()
        let mockDataSource = MockTableViewDatasource()
        tableView.dataSource = mockDataSource
        
        let _ = mockDataSource.tableView(tableView, cellForRowAt: IndexPath())
        XCTAssertEqual(mockDataSource.cellForRowIsCalled, true)
    }
}

