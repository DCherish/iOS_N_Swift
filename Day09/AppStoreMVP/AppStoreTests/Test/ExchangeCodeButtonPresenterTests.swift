//
//  ExchangeCodeButtonPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

class ExchangeCodeButtonPresenterTests: XCTestCase {
    var sut: ExchangeCodeButtonPresenter!
    
    var view: MockExchangeCodeButtonView!
    
    override func setUp() {
        super.setUp()
        
        view = MockExchangeCodeButtonView()
        
        sut = ExchangeCodeButtonPresenter(view: view)
    }
    
    override func tearDown() {
        sut = nil

        view = nil
        
        super.tearDown()
    }
    
    func test_setup() {
        sut.setup()
        
        XCTAssertTrue(view.isCalledSetupLayout)
    }
}
