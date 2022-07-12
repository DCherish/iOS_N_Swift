//
//  MockUserDefaultsManager.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var tweets: [Tweet] = []
    var newTweet: Tweet!
    
    var isCalledGetTweet = false
    var isCalledSetTweet = false
    
    func getTweet() -> [Tweet] {
        isCalledGetTweet = true
        return tweets
    }
    
    func setTweet(_ newValue: Tweet) {
        isCalledSetTweet = true
        self.newTweet = newValue
    }
}
