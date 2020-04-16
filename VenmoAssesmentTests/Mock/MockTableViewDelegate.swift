//
//  MockTableViewDelegate.swift
//  VenmoAssesmentTests
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit
@testable import VenmoAssesment

class MockTableViewDelegate: NSObject, UITableViewDelegate {
    var isCalled = false
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isCalled = true
    }
}
