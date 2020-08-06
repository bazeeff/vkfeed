//
//  NewsfeedWorker.swift
//  VkFeed
//
//  Created by Ivan0v42 on 08.06.2020.
//  Copyright (c) 2020 Mac. All rights reserved.
//

import UIKit

class NewsfeedService {
    
    var authService: AuthService
      var networking: Networking
      var fetcher: DataFetcher
      
      private var feedResponse: FeedResponse?
      private var newFromInProcess: String?
      
      init() {
          self.authService = AppDelegate.shared().authService
          self.networking = NetworkService(authService: authService)
          self.fetcher = NetworkDataFetcher(networking: networking)
      }
    
    func getFeed(completion: @escaping (FeedResponse)->Void){
        fetcher.getFeed(nextBatchFrom: nil) {[weak self](feed) in
            self?.feedResponse = feed
            guard let feedResponse = self?.feedResponse else {
                return
            }
            completion(feedResponse)
        }
    }
    
    func getNextBatch(completion: @escaping (FeedResponse)->Void){
        newFromInProcess = feedResponse?.response.nextFrom
        

        
       // print(newFromInProcess)
        fetcher.getFeed(nextBatchFrom: newFromInProcess){ [weak self] (feed) in
            guard let feed = feed else {return}
            guard self?.feedResponse?.response.nextFrom != feed.response.nextFrom else {return}
            if self?.feedResponse?.response == nil{
                self?.feedResponse? = feed
            } else {
                self?.feedResponse?.response.items.append(contentsOf: feed.response.items)
         //       print(42)
                self?.feedResponse?.response.nextFrom = feed.response.nextFrom
                
                var profiles = feed.response.profiles
                
                if let oldProfiles = self?.feedResponse?.response.profiles {
                    let oldProfilesFiltered = oldProfiles.filter({ (oldProfile) -> Bool in
                        !feed.response.profiles.contains(where: { $0.id == oldProfile.id })
                    }
                    )
                    profiles.append(contentsOf: oldProfilesFiltered)
                }
                self?.feedResponse?.response.profiles = profiles
                
               var groups = feed.response.groups
                          if let oldGroups = self?.feedResponse?.response.groups {
                              let oldGroupsFiltered = oldGroups.filter({ (oldGroup) -> Bool in
                                  !feed.response.groups.contains(where: { $0.id == oldGroup.id })
                              }
                              )
                              groups.append(contentsOf: oldGroupsFiltered)
                          }
                          self?.feedResponse?.response.groups = groups
                self?.feedResponse?.response.groups.append(contentsOf: feed.response.groups)
                
            }
            guard let feedResponse = self?.feedResponse else {return}
            
            completion(feedResponse)
        }
    }
    
}
