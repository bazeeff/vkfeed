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

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    static let topViewHeight : CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 14)
    static let bottomViewHeight: CGFloat = 50
}

protocol FeedCeelLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModel? ) -> FeedCeelSizes
}

final class FeedCeelLayoutCalculator: FeedCeelLayoutCalculatorProtocol{

    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)){
        self.screenWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
    }
    
    
    
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModel?) -> FeedCeelSizes {
        
        let cardViewWidth = screenWidth
    
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top), size: CGSize.zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attachmentTop), size: CGSize.zero)
        
        if let attachment = photoAttachment {
            let photoHeight : Float = Float(attachment.height)
            let photoWidth : Float = Float(attachment.width)
            
            let ration = Float(photoHeight / photoWidth)
            print(ration) 
            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * CGFloat(ration))
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
