//
//  NewsHeaderView.swift
//  StocksApp
//
//  Created by shashant on 30/05/21.
//

import SwiftUI

struct NewsHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top News")
                .font(.title)
                .foregroundColor(.white)
            
            HStack(spacing: 2) {
                Text("From")
                Image(systemName: "applelogo")
                Text("NewsAPI")
            }
            .font(.title2)
            .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.gray)
                .frame(height: 1)
        }
    }
}

struct NewsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeaderView()
    }
}
