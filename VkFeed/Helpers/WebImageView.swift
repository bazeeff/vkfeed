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
    func set(imageURL:String?){
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return
            
        }
        self.kf.setImage(with: url)
    }
}
