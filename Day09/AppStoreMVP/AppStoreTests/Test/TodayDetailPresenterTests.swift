//
//  TodayDetailPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

class TodayDetailPresenterTests: XCTestCase {
    var sut: TodayDetailPresenter!
    
    var viewController: MockTodayDetailViewController!
    var today: Today!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockTodayDetailViewController()
        today = Today(
            title: "title",
            subTitle: "subTitle",
            description: "description",
            imageURL: "imageURL"
        )
        
        sut = TodayDetailPresenter(viewController: viewController, today: today)
    }
    
    override func tearDown() {
        sut = nil

        viewController = nil
        today = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_actionTapShareButton() {
        sut.actionTapShareButton()
        
        XCTAssertTrue(viewController.isCalledPresentActivityController)
    }
}
