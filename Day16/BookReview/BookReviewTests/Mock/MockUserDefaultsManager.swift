//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by kid cherish on 2022/07/09.
//

import XCTest
@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReview = false
    
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        
        return []
    }
    
    func setReview(_ newValue: BookReview) {
        isCalledSetReview = true
    }
}

