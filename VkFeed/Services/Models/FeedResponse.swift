//
//  FeedResponse.swift
//  VkFeed
//
//  Created by Ivan0v42 on 03.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation


struct FeedResponseWrapped: Decodable{
    let response: FeedResponse
}


struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem:Decodable {
    let source_id: Int?
    let post_id : Int?
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes:CountableItem?
    let reposts:CountableItem?
    let views:CountableItem?
}

struct CountableItem: Decodable {
    let count: Int
}
