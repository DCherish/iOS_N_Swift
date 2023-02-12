//
//  AppPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

class AppPresenterTests: XCTestCase {
    var sut: AppPresenter!
    
    var viewController: MockAppViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockAppViewController()
        
        sut = AppPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil

        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationController)
        XCTAssertTrue(viewController.isCalledSetupLayout)
    }
}
