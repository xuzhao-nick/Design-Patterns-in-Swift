//
//  HomePresenter.swift
//  HelloVIPER
//
//  Created by nickxu on 26/10/20.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
}

class HomePresenter {
    var interactor: HomeUseCase
    var router: HomeRouting
    weak var view: HomeView?
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    func viewDidLoad() {
        let homeModel = self.interactor.getTitle()
        print("Home model value is: \(homeModel)")
        DispatchQueue.main.async {
            self.view?.updateTitle(title: homeModel.title)
        }

    
        
    }
}
