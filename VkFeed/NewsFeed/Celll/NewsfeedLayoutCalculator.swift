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
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
}


protocol FeedCeelLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachments: [FeedCeelPhotoAttachmentViewModel] ) -> FeedCeelSizes
}

final class FeedCeelLayoutCalculator: FeedCeelLayoutCalculatorProtocol{

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)){
        self.screenWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
    }
    
    
    
    func sizes(postText: String?, photoAttachments: [FeedCeelPhotoAttachmentViewModel]) -> FeedCeelSizes {
        
        let cardViewWidth = screenWidth
    
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top), size: CGSize.zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attachmentTop), size: CGSize.zero)
        
        if let attachment = photoAttachments.first {
                        let photoHeight : Float = Float(attachment.height)
                        let photoWidth : Float = Float(attachment.width)
                        let ratio = Float(photoHeight / photoWidth)
            if photoAttachments.count == 1 {
                attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * CGFloat(ratio))
            } else if photoAttachments.count > 1 {
                //print("More")
                attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * CGFloat(ratio))
            }
            }
        
        
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomViewFrame = CGRect(origin: CGPoint(x:0, y: bottomViewTop), size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight))
        
        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        return Sizes(bottomViewFrame: bottomViewFrame,
                     totalHeight: totalHeight,
                     postLabelFrame: postLabelFrame,
                     attachmentFrame: attachmentFrame)
    }
    
}
