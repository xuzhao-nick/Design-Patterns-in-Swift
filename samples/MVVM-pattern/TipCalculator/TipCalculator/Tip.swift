//
//  Tip.swift
//  TipCalculator
//
//  Created by Nick Xu on 17/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import Foundation
struct Tip {
    
    var totalAmount: Double
    var tipPercentage: Double
    var numberOfPeople: Double
    
    func calculateTip() -> (Double, Double) {
        let tipAmt = self.totalAmount * self.tipPercentage / 100
        let newTotal = self.totalAmount + tipAmt
        return (tipAmt/self.numberOfPeople, newTotal / self.numberOfPeople)
    }
}
