//
//  API.swift
//  StocksApp
//
//  Created by shashant on 23/05/21.
//

import Foundation

struct API {
    
    static var baseUrl: String {
        return "https://www.alphavantage.co/query"
    }
    
    static func symbolSearchUrl(for searchKey: String) -> String{
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteUrl(for searchKey: String) -> String{
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
        switch symbol {
        case .search:
            return "\(baseUrl)function=\(symbol.rawValue)&apiKey=\(key)&keywords=\(searchKey)"
        case .quote:
            return "\(baseUrl)function=\(symbol.rawValue)&apiKey=\(key)&symbol=\(searchKey)"
            
        }
    }
    
    enum SymbolFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
}

extension API {
    static var key: String {
        return "A6KGM5OGLLGI0W44"
    }
}
