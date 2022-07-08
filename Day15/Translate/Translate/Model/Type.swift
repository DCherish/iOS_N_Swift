//
//  Type.swift
//  Translate
//
//  Created by kid cherish on 2022/07/08.
//

import UIKit

enum `Type` {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
