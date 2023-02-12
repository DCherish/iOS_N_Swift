//
//  FeatureSectionPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

class FeatureSectionPresenterTests: XCTestCase {
    var sut: FeatureSectionPresenter!
    
    var view: MockFeatureSectionView!
    
    override func setUp() {
        super.setUp()
        
        view = MockFeatureSectionView()
        
        sut = FeatureSectionPresenter(view: view)
    }
    
    override func tearDown() {
        sut = nil

        view = nil
        
        super.tearDown()
    }
    
    func test_setup() {
        sut.setup()
        
        XCTAssertTrue(view.isCalledSetupViews)
        XCTAssertTrue(view.isCalledReloadData)
    }
}
