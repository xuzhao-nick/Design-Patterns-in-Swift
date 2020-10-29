//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Nick Xu on 29/10/20.
//

import Foundation
import UIKit

protocol NewsListProtocol {
    func fetchData()
}

class NewsListTableViewController:UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupUIStyle()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.articleListViewModel =  ArticleListViewModel()
        self.articleListViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupUIStyle() {
        setupNavitationBarStyle()
        setupStatusBarStyle()
    }
    
    private func setupNavitationBarStyle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupStatusBarStyle() {
        if #available(iOS 13.0, *) {
                let backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
                 let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                 let statusBar = UIView(frame: window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
                 statusBar.backgroundColor = backgroundColor
                 window?.addSubview(statusBar)
          }
    }
}

extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        return cell
    }
}
