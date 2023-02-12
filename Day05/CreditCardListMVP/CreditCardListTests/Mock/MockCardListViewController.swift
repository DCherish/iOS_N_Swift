//
//  MockCardListViewController.swift
//  CreditCardListTests
//
//  Created by kid cherish on 2023/02/10.
//

import XCTest
@testable import CreditCardList

final class MockCardListViewController: CardListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupTableView = false
    var isCalledMoveToDetailViewController = false
    var isCalledReloadData = false

    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupTableView() {
        isCalledSetupTableView = true
    }
    
    func moveToDetailViewController(detail: PromotionDetail) {
        isCalledMoveToDetailViewController = true
    }
    
    func reloadData() {
        isCalledReloadData = true
    }
}
