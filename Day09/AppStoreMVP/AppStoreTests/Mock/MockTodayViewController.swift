//
//  MockTodayViewController.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

final class MockTodayViewController: TodayProtocol {
    var isCalledSetUpView = false
    var isCalledReloadData = false
    var isCalledMoveToDetailViewController = false
    
    func setupView() {
        isCalledSetUpView = true
    }
    
    func reloadData() {
        isCalledReloadData = true
    }
    
    func moveToDetailViewController(today: Today) {
        isCalledMoveToDetailViewController = true
    }
}
