//
//  MockFeedViewController.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

final class MockFeedViewController: FeedProtocol {
    var isCalledSetupView = false
    var isCalledReloadTableView = false
    var isCalledMoveToTweetViewController = false
    var isCalledMoveToWriteViewController = false
    
    func setupView() {
        isCalledSetupView = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func moveToTweetViewController(with tweet: Tweet) {
        isCalledMoveToTweetViewController = true
    }
    
    func moveToWriteViewController() {
        isCalledMoveToWriteViewController = true
    }
}

