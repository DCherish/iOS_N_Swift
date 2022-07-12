//
//  TweetPresenterTests.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

class TweetPresenterTests: XCTestCase {
    var sut: TweetPresenter!
    
    var viewController: MockTweetViewController!
    var tweet: Tweet!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockTweetViewController()
        tweet = Tweet(
            user: User(
                name: "name",
                account: "account"
            ),
            contents: "contents"
        )
        
        sut = TweetPresenter(viewController: viewController, tweet: tweet)
    }
    
    override func tearDown() {
        sut = nil
        
        tweet = nil
        viewController = nil
    }
    
    func test_viewDidLoad가_호출되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetViews)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
}

