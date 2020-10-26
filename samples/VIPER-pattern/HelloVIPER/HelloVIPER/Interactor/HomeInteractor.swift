//
//  HomeInteractor.swift
//  HelloVIPER
//
//  Created by nickxu on 26/10/20.
//

protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeInteractor {
    
}

extension HomeInteractor: HomeUseCase {
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello, VIPER!")
    }
}
