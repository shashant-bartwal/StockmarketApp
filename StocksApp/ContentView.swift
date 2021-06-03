//
//  ContentView.swift
//  StocksApp
//
//  Created by shashant on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var stockQuoteManager = MockQuoteManager() //StockQuoteManager
    
    @ObservedObject var stockQuoteManager = StockQuoteManager()
    @ObservedObject var newsManager = NewsDownloadManager()
    @State private var stocks = UserDefaultsManager.shared.savedSymbols
    @State private var searchItems = ""
    @State private var newOpen = false
    @State private var oldStocks = [String]()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack {
            Color.black
            
            VStack(alignment: .leading){
                if newOpen {
                    withAnimation {
                        MiniQuoteView(stockQuotes: stockQuoteManager)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .frame(height: newOpen ? 100:0)
                            .transition(.move(edge: .top))
                    }
                }else {
                    withAnimation {
                        HeaderView(stocks: $stocks)
                            .padding(.top,50)
                            .frame(height: newOpen ? 0 : 100)
                    }
                }
                
                List {
                    Group {
                        SearchTextView(searchTerm: $searchItems)
                        
                        ForEach(getQuotes()) { quote in
                            QuoteCell(quote: quote)
                            
                        }
                    }.listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }.onAppear {
                    fetchData(for: stocks)
                    oldStocks = stocks
                }.onChange(of: stocks, perform: { value in
                    fetchData(for: stocks.difference(from: oldStocks))
                    oldStocks = stocks
                })
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            }.padding(.horizontal, 32)
            .padding(.bottom, UIScreen.main.bounds.height * 0.21)
            
            NewsSheetView(newsOpen: $newOpen, newsManager: newsManager)
            
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func getQuotes() -> [Quote] {
        return searchItems.isEmpty ? stockQuoteManager.quotes : stockQuoteManager.quotes.filter {
            $0.symbol.lowercased().contains(searchItems.lowercased())
        }
    }
    
    private func fetchData(for symbols: [String]) {
        stockQuoteManager.download(stocks: symbols) { _ in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
