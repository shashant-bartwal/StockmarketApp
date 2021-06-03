//
//  QuoteCell.swift
//  StocksApp
//
//  Created by shashant on 28/05/21.
//

import SwiftUI

struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        HStack {
            Text(quote.symbol)
                .font(.body)
                .bold()
            
            Spacer()
            
            Spacer()
            
            VStack {
                Text(quote.price)
                    .bold()
                Text(quote.change)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .background(RoundedRectangle(cornerRadius: 5)
                                    .fill(Double(quote.change)! > 0.0 ? Color.green: Color.red),alignment: .trailing)
            }
        }
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(symbol: "AAPL", open: "135.12", high: "140.12", low: "130.12", price: "135.1", change: "-0.12", changePercent: "-0.098%"))
    }
}
