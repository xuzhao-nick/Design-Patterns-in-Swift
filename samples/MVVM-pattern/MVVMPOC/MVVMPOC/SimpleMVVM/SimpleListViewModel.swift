//
//  SimpleListViewModel.swift
//  MVVMPOC
//
//  Created by Nick Xu on 16/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import Foundation
import UIKit
class SimpleListViewModel {
    var simpleModels: [SimpleModel]
    
    var count: Int {
        return simpleModels.count
    }
    
    init() {
        simpleModels = [
            SimpleModel(text: "Orange", color: UIColor.orange),
            SimpleModel(text: "Blue", color: UIColor.blue),
            SimpleModel(text: "Green", color: UIColor.green),
            SimpleModel(text: "Purple", color: UIColor.purple),
            SimpleModel(text: "Cran", color: UIColor.cyan)
        ]
    }
    
    func getModelAt(_ index: Int) -> SimpleModel {
        return simpleModels[index]
    }
}
