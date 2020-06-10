//
//  NewsfeedModels.swift
//  VkFeed
//
//  Created by Ivan0v42 on 08.06.2020.
//  Copyright (c) 2020 Mac. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsfeed
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsfeed (feed:FeedResponseWrapped)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsfeed(feedViewModel: FeedViewModel)
      }
    }
  }
  
}


struct FeedViewModel {
    struct Cell:FeedCeelViewModel {
        var iconUrlString: String?
        var name: String?
        var date: String?
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
    }
     let cells: [Cell]
}
