//
//  SearchView.swift
//  StocksApp
//
//  Created by shashant on 03/06/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var serachTerm = ""
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack {
                HStack {
                    SearchTextView(searchTerm: $serachTerm)
                    Button(action: {
                        searchManager.searchStocks(keyword: serachTerm)
                    }) {
                        Image(systemName: "arrowtriangle.right.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                ScrollView {
                    ForEach(searchManager.searches) { item in
                        HStack {
                            VStack(alignment: .leading ) {
                                Text(item.symbol)
                                    .font(.title)
                                    .bold()
                                
                                Text(item.type)
                                    .font(.body)
                            }
                            Spacer()
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                UserDefaultsManager.shared.set(symbol: item.symbol)
                            }) {
                                Image(systemName: "plus.circle.fill")
                            }
                        }.foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 1)
                    }
                }
            }
            .padding(.top, 50)
            .padding(.horizontal,16)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
