//
//  MockNewsListViewController.swift
//  KeywordNewsTests
//
//  Created by kid cherish on 2022/07/11.
//

import XCTest

@testable import KeywordNews

final class MockNewsListViewController: NewsListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupLayout = false
    var isCalledEndRefreshing = false
    var isCalledMoveToNewsWebviewController = false
    var isCalledReloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupLayout() {
        isCalledSetupLayout = true
    }
    
    func endRefreshing() {
        isCalledEndRefreshing = true
    }
    
    func moveToNewsWebviewController(with news: News) {
        isCalledMoveToNewsWebviewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}

