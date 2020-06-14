//
//  String + Height.swift
//  VkFeed
//
//  Created by Ivan0v42 on 14.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(width:CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: font],
                                     context: nil)
        return ceil(size.height)
    }
}
