//
//  MockTweetViewController.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

final class MockTweetViewController: TweetProtocol {
    var isCalledSetViews = false
    var isCalledSetupViews = false
    
    func setViews(tweet: Tweet) {
        isCalledSetViews = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
}
