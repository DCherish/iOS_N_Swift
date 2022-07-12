//
//  TweetPresenter.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setViews(tweet: Tweet)
    func setupViews()
}

final class TweetPresenter {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet
    
    init(
        viewController: TweetProtocol,
        tweet: Tweet
    ) {
        self.viewController = viewController
        self.tweet = tweet
    }
    
    func viewDidLoad() {
        viewController?.setViews(tweet: tweet)
        viewController?.setupViews()
    }
}
