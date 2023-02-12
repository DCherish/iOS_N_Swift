//
//  CardListPresenterTests.swift
//  CreditCardListTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import CreditCardList

final class CardListPresenterTests: XCTestCase {
    var sut: CardListPresenter!
    
    var viewController: MockCardListViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockCardListViewController()
        
        sut = CardListPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupTableView)
    }
}
