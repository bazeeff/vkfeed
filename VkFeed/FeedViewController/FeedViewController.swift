//
//  FeedViewController.swift
//  VkFeed
//
//  Created by Ivan0v42 on 25.05.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class FeedViewController: UIViewController {

    private let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params).responseJSON{(data) in
            print(data)}
        
         
    }
  
}

