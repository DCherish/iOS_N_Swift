//
//  Feature.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
