//
//  WebImageView.swift
//  VkFeed
//
//  Created by Ivan0v42 on 11.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Kingfisher

class WebImageView: UIImageView{
    func set(imageURL:String){
        guard let url = URL(string: imageURL) else { return }
        self.kf.setImage(with: url)
    }
//
//
//    func downloadImage(urlString : String){
//        guard let url = URL.init(string: urlString) else {
//            return
//        }
//        let resource = ImageResource(downloadURL: url)
//
//        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
//            switch result {
//            case .success(let value):
//                print("Image: \(value.image). Got from: \(value.cacheType)")
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
//    }


}
