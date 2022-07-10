//
//  MockMovieDetailViewController.swift
//  MovieReviewTests
//
//  Created by kid cherish on 2022/07/11.
//

import XCTest

@testable import MovieReview

final class MockMovieDetailViewController: MovieDetailProtocol {
    var isCalledSetViews = false
    var isCalledSetRightBarButton = false
    
    var settedIsLiked = false
    
    func setViews(with movie: Movie) {
        isCalledSetViews = true
    }
    
    func setRightBarButton(with isLiked: Bool) {
        settedIsLiked = isLiked
        
        isCalledSetRightBarButton = true
    }
}
