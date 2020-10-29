//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Nick Xu on 29/10/20.
//

import Foundation


struct ArticleViewModel {
    private let article: Article
}

class ArticleListViewModel {
    var bindViewModelToController : (() -> ()) = {}
    private(set) var articles: [Article]! {
        didSet {
            self.bindViewModelToController()
        }
    }
    init() {
        fetchArticles()
    }
    func fetchArticles() {
        Webservice().getArticles { (articles) in
            if let articles = articles {
                self.articles = articles
            }
        }
    }
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        if let articles = self.articles {
            return articles.count
        }
        return 0
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}


extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
}
