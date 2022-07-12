//
//  Icon.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import UIKit

enum Icon {
    case message
    case share
    case like
    case write
    
    var image: UIImage? {
        let systemName: String
        
        switch self {
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .like: systemName = "heart"
        case .write: systemName = "square.and.pencil"
        }
        
        return UIImage(systemName: systemName)
    }
}
