//
//  UserDefaultsMANGER.swift
//  StocksApp
//
//  Created by shashant on 02/06/21.
//

import Foundation

final class UserDefaultsManager {
    private static let symbolKey = "SYMBOL_KEY"
    
    var savedSymbols = [String]()
    
    static let shared = UserDefaultsManager()
    
    private init() {
        get()
    }
    
    func get() {
        if let saved = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String] {
            savedSymbols = saved
        }
    }
    
    func set(symbol: String) {
        savedSymbols.append(symbol)
        UserDefaults.standard.setValue(self.savedSymbols, forKey: Self.symbolKey)
    }
}
