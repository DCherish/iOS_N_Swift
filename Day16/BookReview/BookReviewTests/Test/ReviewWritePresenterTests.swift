//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by kid cherish on 2022/07/09.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출될_때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButtonItem이_호출될_때() {
        sut.didTapLeftBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledShowCloseAlertController)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_book이_존재하지_않으면() {
        sut.book = nil
        sut.didTapRightBarButtonItem(contentsText: "도움이 많이 되었습니다.")

        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_book이_존재하고_contentsText가_존재하지_않으면() {
        sut.book = Book(title: "Swift", image: "")
        sut.didTapRightBarButtonItem(contentsText: nil)

        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_book이_존재하고_contentsText가_placeHolder와_같으면() {
        sut.book = Book(title: "Swift", image: "")
        sut.didTapRightBarButtonItem(contentsText: sut.contentsTextViewPlaceHolderText)
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때_book이_존재하고_contentsText가_placeHolder와_같지_않게_존재하면() {
        sut.book = Book(title: "Swift", image: "")
        sut.didTapRightBarButtonItem(contentsText: "도움이 많이 되었습니다.")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetReview)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_didTapBookTitleButton이_호출될_때() {
        sut.didTapBookTitleButton()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledShowCloseAlertController = false
    var isCalledClose = false
    var isCalledSetupViews = false
    var isCalledPresentToSearchBookViewController = false
    var isCalledUpdateViews = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func showCloseAlertController() {
        isCalledShowCloseAlertController = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToSearchBookViewController() {
        isCalledPresentToSearchBookViewController = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }
}

