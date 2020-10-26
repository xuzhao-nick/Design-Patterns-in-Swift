//
//  HomeModuleBuilder.swift
//  HelloVIPER
//
//  Created by nickxu on 26/10/20.
//

import UIKit
class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view:view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
