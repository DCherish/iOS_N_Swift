//
//  Tab.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/06.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    // enum associate value
    var textItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
