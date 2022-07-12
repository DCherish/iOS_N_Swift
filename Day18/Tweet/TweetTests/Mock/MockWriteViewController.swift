//
//  MockWriteViewController.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

final class MockWriteViewController: WriteProtocol {
    var isCalledSetupView = false
    var isCalledDismiss = false
    
    func setupViews() {
        isCalledSetupView = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
}
