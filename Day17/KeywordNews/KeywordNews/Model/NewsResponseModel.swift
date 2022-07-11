//
//  NewsResponseModel.swift
//  KeywordNews
//
//  Created by kid cherish on 2022/07/11.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
