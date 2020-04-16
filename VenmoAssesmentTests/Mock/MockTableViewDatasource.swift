//
//  MockTableViewDatasource.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit
@testable import VenmoAssesment

class MockTableViewDatasource: NSObject, UITableViewDataSource {
    var results: [AlbumResults] = []
    var cellForRowIsCalled = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRowIsCalled = true
        return UITableViewCell()
    }
}

