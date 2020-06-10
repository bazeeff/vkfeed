//
//  NewsfeedPresenter.swift
//  VkFeed
//
//  Created by Ivan0v42 on 08.06.2020.
//  Copyright (c) 2020 Mac. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
     switch response {
      case .presentNewsfeed(let feed):
        let cells = feed.response.items.map { (feedItem) in
            
            cellViewModel(from: feedItem)
          }
        //print(cells)
          let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel:feedViewModel))
      }
  }
  
    
    private func cellViewModel(from feedItem: FeedItem) -> FeedViewModel.Cell {

           return FeedViewModel.Cell.init(iconUrlString: "",
                                          name: "FutureName",
                                          date: "FutureDate",
                                          text: String(feedItem.text ?? ""),
                                          likes: String(feedItem.likes?.count ?? 0),
                                          comments: String(feedItem.comments?.count ?? 0),
                                          shares: String(feedItem.reposts?.count ?? 0),
                                          views: String(feedItem.views?.count ?? 0))
       }
    
}
