//
//  DataFetcher.swift
//  VkFeed
//
//  Created by Ivan0v42 on 05.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Alamofire

protocol DataFetcher {
    func getFeed(nextBatchFrom: String?, completion: @escaping (FeedResponse?)->())
    }
    
struct NetworkDataFetcher: DataFetcher {
     let networking : Networking
     
      init(networking: Networking){
        self.networking = networking
      }

     func getFeed(nextBatchFrom: String?, completion: @escaping (FeedResponse?) -> ()) {
        var response: FeedResponse?
        var params = ["filters": "post, photo"]
        params["start_from"] = nextBatchFrom
        let request = networking.request(path: API.newsFeed, params: params)
             request.responseDecodable { (result: DataResponse<FeedResponse, AFError>) in
                if result.value != nil {
                   do {
                       let decoder = JSONDecoder()
                           decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let model:FeedResponse = try decoder.decode(FeedResponse.self, from: result.data!)
                           response=model
                       } catch {print("error\(error)")}
                    completion(response)
                   } else {
                       print(result.error?.localizedDescription ?? "")
                   }
                
        }
    }
    
}

