//
//  MockTodayDetailViewController.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

final class MockTodayDetailViewController: TodayDetailProtocol {
    var isCalledSetupViews = false
    var isCalledPresentActivityController = false
    
    func setupViews(today: Today) {
        isCalledSetupViews = true
    }
    
    func presentActivityController(today: Today) {
        isCalledPresentActivityController = true
    }
}
