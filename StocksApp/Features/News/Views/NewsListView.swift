//
//  NewsListView.swift
//  StocksApp
//
//  Created by shashant on 30/05/21.
//

import SwiftUI
import BetterSafariView

struct NewsListView: View {
    
    @ObservedObject var newsManager: NewsDownloadManager
    @State private var showSafari = false
    @State private var selectedArticle: News?
    var body: some View {
        VStack {
            ScrollView(.vertical,showsIndicators: false) {
                ForEach(newsManager.newsArticles) { article in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(article.title)
                                .bold()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            AsyncImage.init(url: URL(string: article.imageUrl)!) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.2))
                            } image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
//                                Image(uiImage: <#T##UIImage#>)
                            }
                            .scaledToFill()
                            .frame(width: 100, height: 160)
                            .cornerRadius(10)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                            showSafari.toggle()
                        }
                        .sheet(isPresented: $showSafari, content: {
                            loadNews(for: selectedArticle ?? article)
                        })
                        
                        RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2))
                            .padding(.horizontal, 50)
                            .frame(height: 1)
                    }
                }
            }
        }
    }
    
    private func loadNews(for article: News) -> some View {
       return SafariView(url: URL(string: article.url.replacingOccurrences(of: "http://", with: "https://"))!)
    }
}

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}
