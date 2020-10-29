//
//  Webservice.swift
//  GoodNews
//
//  Created by Nick Xu on 29/10/20.
//

import Foundation


class Webservice {
    private let APIKey = "xxxxxxx" //please regist your API key from newsapi.org
    func getArticles(completion: @escaping ([Article]?) -> ()) {
        let sourcesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKey)")!
        let session = URLSession.shared
        let task = session.dataTask(with: sourcesURL, completionHandler: { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                    return
                }
                completion(nil)
            }
        })
        task.resume()
    }
    
}
