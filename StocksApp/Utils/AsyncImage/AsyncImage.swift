//
//  AsyncImage.swift
//  StocksApp
//
//  Created by shashant on 30/05/21.
//

import SwiftUI

struct AsyncImage<PlaceholderView: View>: View {
    @StateObject private var loader: ImageLoader
    
    private let placeHolder: PlaceholderView
    private let image: (UIImage) -> Image
    
    init(url: URL, @ViewBuilder placeholder: () -> PlaceholderView, @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)) {
        self.placeHolder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeHolder
            }
        }
    }
    
    var body: some View {
        content
            .onAppear(perform: {
                loader.load()
            })
    }
}
