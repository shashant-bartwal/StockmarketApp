//
//  QuoteManagerProtocol.swift
//  StocksApp
//
//  Created by shashant on 25/05/21.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote],NetworkError>) -> Void)
}
