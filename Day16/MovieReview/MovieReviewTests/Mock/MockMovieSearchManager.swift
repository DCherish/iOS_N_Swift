//
//  MockMovieSearchManager.swift
//  MovieReviewTests
//
//  Created by kid cherish on 2022/07/10.
//

import XCTest

@testable import MovieReview

final class MockMovieSearchManager: MovieSearchManagerProtocol {
    var isCalledRequest = false
    
    var needToSuccessRequest = false
    
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        isCalledRequest = true
        
        if needToSuccessRequest {
            completionHandler([])
        }
    }
}
