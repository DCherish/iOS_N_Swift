//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
