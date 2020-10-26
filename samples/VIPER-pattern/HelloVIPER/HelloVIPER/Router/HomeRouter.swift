//
//  HomeRouter.swift
//  HelloVIPER
//
//  Created by nickxu on 26/10/20.
//

import UIKit
protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension HomeRouter: HomeRouting {
    
}
