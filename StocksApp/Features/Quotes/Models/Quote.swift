//
//  Quote.swift
//  StocksApp
//
//  Created by shashant on 23/05/21.
//

import Foundation

struct Quote: Codable {
    var symbol: String
    var open: String
    var high: String
    var low: String
    var price: String
    var change: String
    var changePercent: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
}

extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}
