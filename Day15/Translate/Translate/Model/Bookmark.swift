//
//  Bookmark.swift
//  Translate
//
//  Created by kid cherish on 2022/07/08.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}
