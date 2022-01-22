//
//  NewsModel.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import Foundation

struct NewsModel: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    var code: String?
    var message: String?
}

struct Article: Decodable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Decodable {
    var id: String?
    var name: String?
}
