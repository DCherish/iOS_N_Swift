//
//  Feature.swift
//  AppStore
//
//  Created by kid cherish on 2022/06/10.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
