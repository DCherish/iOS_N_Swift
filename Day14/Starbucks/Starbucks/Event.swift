//
//  Event.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/06.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    
    let image: Image
    let title: String
    let description: String
}

