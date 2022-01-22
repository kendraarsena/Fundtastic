//
//  NetworkHelper.swift
//  Fundtastic
//
//  Created by Kendra Arsena W on 21/01/22.
//

import Foundation

struct NetworkHelper {
    static var shared = NetworkHelper()
    init() {}
    
    let apiKey = "c4f1d52e3a0c412dbcacf82d40207977"
    let urlSources = "https://newsapi.org/v2/top-headlines?"
    let urlSearch = "https://newsapi.org/v2/everything?"
    
    func fetchNewsSources(category: String) -> NewsModel {
        var newsModel: NewsModel?
        do {
            let data = try Data(contentsOf: URL(string: "\(urlSources)language=id&category=\(category.lowercased())&apiKey=\(apiKey)")!)
            newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
        } catch {
            print("Error \(error)")
        }
        
        return newsModel ?? NewsModel()
    }
    
    func fetchNewsSearch(searchText: String) -> NewsModel {
        var newsModel: NewsModel?
        do {
            let data = try Data(contentsOf: URL(string: "\(urlSources)q=\(searchText)&language=id&apiKey=\(apiKey)")!)
            newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
        } catch {
            print("Error \(error)")
        }
        
        return newsModel ?? NewsModel()
    }
}
