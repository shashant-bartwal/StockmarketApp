//
//  StockQuoteManager.swift
//  StocksApp
//
//  Created by shashant on 26/05/21.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var internalQuote = [Quote]()
        let downloadQueue = DispatchQueue(label: "com.shashant.downloadQueue")
        let downloadGroup = DispatchGroup()
        
        stocks.forEach { (stock) in
            downloadGroup.enter()
            let url = URL(string: API.quoteUrl(for: stock))!
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { (result) in
                switch result {
                case .failure(let err):
                    print(err)
                    downloadQueue.async {
                        downloadGroup.leave()
                    }
                
                case .success(let resp):
                    downloadQueue.async {
                        internalQuote.append(resp.quote)
                        downloadGroup.leave()
                    }
                }
            }
        }
        
        downloadGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(internalQuote))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: internalQuote)
            }
        }
    }
    
    
}
