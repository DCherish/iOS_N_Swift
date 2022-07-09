//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by kid cherish on 2022/07/09.
//

import XCTest
@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledReloadTableView = false
    var isCalledPresentToReviewWriteViewController = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
}
