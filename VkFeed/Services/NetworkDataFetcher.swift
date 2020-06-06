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
    func getFeed(completion: @escaping (FeedResponseWrapped?)->())
    }
    
struct NetworkDataFetcher: DataFetcher {
     let networking : Networking
     
      init(networking: Networking){
        self.networking = networking
      }

    func getFeed(completion: @escaping (FeedResponseWrapped?) -> ()) {
        var response: FeedResponseWrapped?
        let params = ["filters": "post, photo"]
        let request = networking.request(path: API.newsFeed, params: params)
             request.responseDecodable { (result: DataResponse<FeedResponseWrapped, AFError>) in
               if result.value != nil {
                   do {
                       let decoder = JSONDecoder()
                           decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let model:FeedResponseWrapped = try decoder.decode(FeedResponseWrapped.self, from: result.data!)
                           response=model
                       } catch {print("error\(error)")}
                   print(response as Any)
                    completion(response)
                   } else {
                       print(result.error?.localizedDescription ?? "")
                   }
                
        }
    }
    
}

