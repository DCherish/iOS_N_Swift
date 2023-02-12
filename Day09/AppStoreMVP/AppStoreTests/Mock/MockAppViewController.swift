//
//  MockAppViewController.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

final class MockAppViewController: AppProtocol {
    var isCalledSetupNavigationController = false
    var isCalledSetupLayout = false
    
    func setupNavigationController() {
        isCalledSetupNavigationController = true
    }
    
    func setupLayout() {
        isCalledSetupLayout = true
    }
}
