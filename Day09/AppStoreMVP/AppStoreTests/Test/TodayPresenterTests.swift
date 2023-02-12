//
//  TodayPresenterTests.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/08.
//

import XCTest
@testable import AppStore

class TodayPresenterTests: XCTestCase {
    var sut: TodayPresenter!
    
    var viewController: MockTodayViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockTodayViewController()
        
        sut = TodayPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil

        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetUpView)
    }
    
    func test_viewWillAppear() {
        sut.viewWillAppear()
        
        XCTAssertTrue(viewController.isCalledReloadData)
    }
    
    func test_collectionViewDidSelectItemAt() {
        sut.todayList = [Today(
            title: "",
            subTitle: "",
            description: "",
            imageURL: "")
        ]
        
        sut.collectionView(
            UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()),
            didSelectItemAt: IndexPath(item: 0, section: 0)
        )
        
        XCTAssertTrue(viewController.isCalledMoveToDetailViewController)
    }
}
