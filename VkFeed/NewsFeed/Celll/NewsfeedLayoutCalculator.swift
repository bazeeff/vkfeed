//
//  NewsfeedCellLayoutCalculator.swift
//  VkFeed
//
//  Created by Ivan0v42 on 13.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

struct Sizes: FeedCeelSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
}

protocol FeedCeelLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModel? ) -> FeedCeelSizes
}

final class FeedCeelLayoutCalculator: FeedCeelLayoutCalculatorProtocol{

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)){
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModel?) -> FeedCeelSizes {
        return Sizes(postLabelFrame: CGRect.zero, attachmentFrame: CGRect.zero)
    }
    
}
