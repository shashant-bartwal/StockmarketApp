//
//  News.swift
//  StocksApp
//
//  Created by shashant on 29/05/21.
//

import Foundation

struct News: Codable, Identifiable {
    var id: UUID { return UUID() }
    var title: String
    var url: String
    var urlToImage: String?
    var imageUrl: String {
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://scontent-bom1-1.xx.fbcdn.net/v/t1.6435-9/54730347_10155742932017303_6045279555608903680_n.png?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=QrdUo0SGI08AX87SCDY&_nc_ht=scontent-bom1-1.xx&oh=c214c0f3f15d0c9335695596904b3704&oe=60D80876"
    }
}


