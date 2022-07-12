//
//  ProfilePresenterTests.swift
//  TweetTests
//
//  Created by kid cherish on 2022/07/12.
//

import XCTest

@testable import Tweet

class ProfilePresenterTests: XCTestCase {
    var sut: ProfilePresenter!
    
    var viewController: MockProfileViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockProfileViewController()
        
        sut = ProfilePresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_viewWillAppear가_호출되면() {
        sut.viewWillAppear()
        
        XCTAssertTrue(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton이_호출될_때_name이_존재하지_않으면() {
        sut.didTapSaveButton(name: nil, account: "account")
        
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton이_호출될_때_account가_존재하지_않으면() {
        sut.didTapSaveButton(name: "name", account: nil)
        
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton이_호출될_때_둘_다_존재하지_않으면() {
        sut.didTapSaveButton(name: "", account: "")
        
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton이_호출될_때_둘_다_존재하면() {
        sut.didTapSaveButton(name: "name", account: "account")
        
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledShowToast)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
}


