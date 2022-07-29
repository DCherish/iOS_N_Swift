//
//  MovieDetailPresenterTests.swift
//  MovieReviewTests
//
//  Created by kid cherish on 2022/07/11.
//

import XCTest

@testable import MovieReview

class MovieDetailPresenterTests: XCTestCase {
    var sut: MovieDetailPresenter!
    
    var viewController: MockMovieDetailViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movie: Movie!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieDetailViewController()
        userDefaultsManager = MockUserDefaultsManager()
        movie = Movie(title: "", imageURL: "", userRating: "", actor: "", director: "", pubDate: "", isLiked: false)
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager,
            movie: movie
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        movie = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetViews)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_isLiked가_true가_되면() {
        movie.isLiked = false
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager,
            movie: movie
        )
        
        sut.didTapRightBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
        
        XCTAssertTrue(userDefaultsManager.isCalledAddMovie)
        XCTAssertFalse(userDefaultsManager.isCalledRemoveMovie)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_isLiked가_false가_되면() {
        movie.isLiked = true
        
        sut = MovieDetailPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager,
            movie: movie
        )
        
        sut.didTapRightBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
        
        XCTAssertFalse(userDefaultsManager.isCalledAddMovie)
        XCTAssertTrue(userDefaultsManager.isCalledRemoveMovie)
    }
}
