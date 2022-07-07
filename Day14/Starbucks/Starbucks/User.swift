//
//  User.swift
//  Starbucks
//
//  Created by kid cherish on 2022/07/07.
//

import Foundation

struct User {
    let userName: String
    let account: String
    
    static let shared = User(userName: "키드", account: "kidcherish")
}
