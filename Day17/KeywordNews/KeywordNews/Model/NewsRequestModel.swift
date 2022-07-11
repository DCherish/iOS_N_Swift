//
//  NewsRequestModel.swift
//  KeywordNews
//
//  Created by kid cherish on 2022/07/11.
//

import Foundation

struct NewsRequestModel: Codable {
    /// 시작 인덱스,  1~1000
    let start: Int
    /// 검색 결과 출력 건수,  10 ~100
    let display: Int
    /// 검색어
    let query: String
}
