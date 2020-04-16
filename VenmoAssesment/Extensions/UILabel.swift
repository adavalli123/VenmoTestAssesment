//
//  UILabel.swift
//  VenmoAssesment
//
//  Created by Varshini Thatiparthi on 4/15/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

extension UILabel {
    static func createLabel(from text: String, enableBoldFont: Bool = false, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = numberOfLines
        label.sizeToFit()
        label.font = enableBoldFont ? UIFont.boldSystemFont(ofSize: 12) : UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }
}

