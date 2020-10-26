//
//  ViewController.swift
//  HelloVIPER
//
//  Created by nickxu on 26/10/20.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String) -> (Void)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }


}

extension HomeViewController: HomeView {
    func updateTitle(title: String) {
        helloLabel.text = title
    }
    
}
