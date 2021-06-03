//
//  MockQuoteManager.swift
//  StocksApp
//
//  Created by shashant on 25/05/21.
//

import Foundation

final class MockQuoteManager : QuoteManagerProtocol, ObservableObject {
    
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote(symbol: "AAPL", open: "135.90", high: "136.39", low: "133.13", price: "135.13", change: "-0.2", changePercent: "-0.19%")
        let goog = Quote(symbol: "GOOG", open: "2099.51", high: "2102.03", low: "2077.32", price: "2095.89", change: "0.51", changePercent: "0.024%")
        
        for _ in 0..<8 {
            quotes.append(contentsOf: [aapl,goog])
        }
    }
    
}
