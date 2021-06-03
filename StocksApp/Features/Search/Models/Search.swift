//
//  Search.swift
//  StocksApp
//
//  Created by shashant on 02/06/21.
//

import Foundation

struct Search: Codable, Identifiable {
    var id: UUID { return UUID() }
    var symbol: String
    var name: String
    var type: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
    }
}
