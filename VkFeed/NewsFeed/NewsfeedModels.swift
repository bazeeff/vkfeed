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
        case getNextBatch
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsfeed (feed:FeedResponse)
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
        var photoAttachments: [FeedCeelPhotoAttachmentViewModel]
        var sizes: FeedCeelSizes
    }
    
    struct FeedCeelPhotoAttachment: FeedCeelPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    struct FeedCellVideoAttachment: FeedCeelVideoAttachmentViewModel {
        
        //var duration: Int?
        var first_frame_800: String?
    }
    
     let cells: [Cell]
}
