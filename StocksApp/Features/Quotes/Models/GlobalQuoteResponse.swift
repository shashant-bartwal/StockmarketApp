//
//  GlobalQuoteResponse.swift
//  StocksApp
//
//  Created by shashant on 23/05/21.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}

