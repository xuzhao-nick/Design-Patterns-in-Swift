//
//  SimpleMVVMVC.swift
//  MVVMPOC
//
//  Created by Nick Xu on 16/10/20.
//  Copyright © 2020 Nick Xu. All rights reserved.
//

import UIKit

class SimpleMVVMVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = SimpleListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simple MVVM"
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SimpleMVVMVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SimpleMVVMCell
        cell.data = viewModel.getModelAt(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
   
}
