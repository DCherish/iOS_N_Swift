//
//  TranslateRequestModel.swift
//  Translate
//
//  Created by kid cherish on 2022/07/08.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
