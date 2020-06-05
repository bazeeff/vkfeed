//
//  FeedViewController.swift
//  VkFeed
//
//  Created by Ivan0v42 on 25.05.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Alamofire

class FeedViewController: UIViewController {

    private let networkService : Networking = NetworkService()
    private var response: FeedResponseWrapped?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        let params = ["filters": "post, photo"]
        
        let request = networkService.request(path: API.newsFeed, params: params)
       
        request.responseDecodable { (result: DataResponse<FeedResponseWrapped, AFError>) in
            if result.value != nil {
                do {
                    let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let model:FeedResponseWrapped = try decoder.decode(FeedResponseWrapped.self, from: result.data!)
                    self.response=model
                    } catch {print("error\(error)")}
                print(self.response as Any)
                } else {
                    print(result.error?.localizedDescription ?? "")
                }
            
        }
        
    }

}
    
  


