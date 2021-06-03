//
//  ImageCache.swift
//  StocksApp
//
//  Created by shashant on 30/05/21.
//

import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {

    
    private let cache: NSCache<NSURL, UIImage> = {
       let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 10240*1024*100
        return cache
    }()
    
    
    subscript(url: URL) -> UIImage? {
        get { cache.object(forKey: url as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: url as NSURL) : cache.setObject(newValue!, forKey: url as NSURL)}
    }
    
}
