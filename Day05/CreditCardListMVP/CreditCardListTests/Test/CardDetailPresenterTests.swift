//
//  CardDetailPresenterTests.swift
//  CreditCardListTests
//
//  Created by kid cherish on 2023/02/10.
//

import XCTest
@testable import CreditCardList

final class CardDetailPresenterTests: XCTestCase {
    var sut: CardDetailPresenter!
    
    var viewController: MockCardDetailViewController!
    var detail: PromotionDetail!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockCardDetailViewController()
        detail = PromotionDetail(companyName: "", period: "", amount: 0, condition: "", benefitCondition: "", benefitDetail: "", benefitDate: "")
        
        sut = CardDetailPresenter(
            viewController: viewController,
            promotionDetail: detail
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        detail = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupLayout)
        XCTAssertTrue(viewController.isCalledPlayLottieView)
    }
    
    func test_viewWillAppear() {
        sut.viewWillAppear()
        
        XCTAssertTrue(viewController.isCalledSetupText)
    }
}
