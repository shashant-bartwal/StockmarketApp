//
//  NewsDownloadManager.swift
//  StocksApp
//
//  Created by shashant on 29/05/21.
//

import Foundation

final class NewsDownloadManager: ObservableObject {
    @Published var newsArticles = [News]()

    private let newUrlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(NewsAPI.key)"
    
    init() {
        download()
    }
    
    func download() {
        NetworkManager<NewsResponse>().fetch(from: URL(string: newUrlString)!) { (result) in
            switch result {
            case .failure(let err):
                print(err)
                
            case .success(let resp):
                DispatchQueue.main.async {
                    self.newsArticles = resp.articles
                }
            }
        }
    }
}


