//
//  NewsListPresenterTests.swift
//  KeywordNewsTests
//
//  Created by kid cherish on 2022/07/11.
//

import XCTest

@testable import KeywordNews

class NewsListPresenterTests: XCTestCase {
    var sut: NewsListPresenter!
    
    var viewController: MockNewsListViewController!
    var newsSearchManager: MockNewsSearchManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockNewsListViewController()
        newsSearchManager = MockNewsSearchManager()
        
        sut = NewsListPresenter(
            viewController: viewController,
            newsSearchManager: newsSearchManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        newsSearchManager = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_요청될_때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupLayout)
    }
    
    func test_viewWillAppear가_요청될_때() {
        sut.viewWillAppear()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
    }
    
    func test_didCalledRefresh가_요청될_때_request에_실패하면() {
        newsSearchManager.error = NSError() as Error
        
        sut.didCalledRefresh()
        
        XCTAssertFalse(viewController.isCalledReloadTableView)
        XCTAssertFalse(viewController.isCalledEndRefreshing)
    }
    
    func test_didCalledRefresh가_요청될_때_request에_성공하면() {
        newsSearchManager.error = nil
        
        sut.didCalledRefresh()
        
        XCTAssertTrue(viewController.isCalledReloadTableView)
        XCTAssertTrue(viewController.isCalledEndRefreshing)
    }
}

