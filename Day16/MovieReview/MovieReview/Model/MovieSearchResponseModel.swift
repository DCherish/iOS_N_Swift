//
//  MovieSearchResponseModel.swift
//  MovieReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var items: [Movie] = []
}
