//
//  MockCardDetailViewController.swift
//  CreditCardListTests
//
//  Created by kid cherish on 2023/02/10.
//

import XCTest
@testable import CreditCardList

final class MockCardDetailViewController: CardDetailProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupLayout = false
    var isCalledPlayLottieView = false
    var isCalledSetupText = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupLayout() {
        isCalledSetupLayout = true
    }
    
    func playLottieView() {
        isCalledPlayLottieView = true
    }
    
    func setupText(promotionDetail: PromotionDetail) {
        isCalledSetupText = true
    }
}
