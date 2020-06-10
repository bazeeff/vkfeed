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
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_Ru")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
     switch response {
      case .presentNewsfeed(let feed):
        let cells = feed.response.items.map { (feedItem) in
            
            cellViewModel(from: feedItem, profiles: feed.response.profiles, groups: feed.response.groups)
          }
        
          let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel:feedViewModel))
      }
  }
  
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups:[Group]) -> FeedViewModel.Cell {
        let profile = self.profile(for: feedItem.sourceId!, profiles: profiles, groups: groups)
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                          name: profile.name,
                                          date: dateTitle,
                                          text: String(feedItem.text ?? ""),
                                          likes: String(feedItem.likes?.count ?? 0),
                                          comments: String(feedItem.comments?.count ?? 0),
                                          shares: String(feedItem.reposts?.count ?? 0),
                                          views: String(feedItem.views?.count ?? 0))
       }
    
    private func profile(for sourceId: Int, profiles:[Profile],groups:[Group])-> ProfileRepresenatable{
        
        let profilesOrGroups: [ProfileRepresenatable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId: -sourceId
        let profileRepresentable = profilesOrGroups.first {(myProfileRepresentable)->Bool in
            myProfileRepresentable.id == normalSourceId
        }
    return profileRepresentable!
    }
}
