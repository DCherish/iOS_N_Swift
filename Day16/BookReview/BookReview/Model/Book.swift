//
//  Book.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, image: String?) {
        self.title = title
        self.image = image
    }
}
