//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
