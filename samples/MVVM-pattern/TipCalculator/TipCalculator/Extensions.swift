//
//  Extensions.swift
//  TipCalculator
//
//  Created by Nick Xu on 17/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import Foundation
extension Double {
    var toString: String {
        return String.init(format: "%0.2f", self)
    }
}

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}
