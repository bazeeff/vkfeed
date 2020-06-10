//
//  NewsfeedInteractor.swift
//  VkFeed
//
//  Created by Ivan0v42 on 08.06.2020.
//  Copyright (c) 2020 Mac. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
  
    switch request {
    case .getNewsfeed:
           fetcher.getFeed { [weak self] (feedResponse) in
               guard let feedResponse = feedResponse else { return }
           // print(feedResponse)
            feedResponse.response.profiles.map({(profile) in
                         print( profile)
                         
                     })
            
            feedResponse.response.groups.map({(group) in
                print(group)
                
            })
            
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse))
           }
    }
    }
   
}
