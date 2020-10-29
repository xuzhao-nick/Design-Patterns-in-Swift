//
//  Article.swift
//  GoodNews
//
//  Created by Nick Xu on 29/10/20.
//
import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

//Some articles don't have description
struct Article: Decodable {
    let title:String
    let description: String?
}
