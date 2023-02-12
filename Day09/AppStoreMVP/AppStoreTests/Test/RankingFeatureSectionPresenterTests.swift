//
//  RankingFeatureSectionPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

class RankingFeatureSectionPresenterTests: XCTestCase {
    var sut: RankingFeatureSectionPresenter!
    
    var view: MockRankingFeatureSectionView!
    
    override func setUp() {
        super.setUp()
        
        view = MockRankingFeatureSectionView()
        
        sut = RankingFeatureSectionPresenter(view: view)
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
