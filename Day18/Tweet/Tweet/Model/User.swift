//
//  User.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String
    
    static var shared = User(name: "kidcherish", account: "ios_developer")
}
