//
//  MockExchangeCodeButtonView.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

final class MockExchangeCodeButtonView: ExchangeCodeButtonProtocol {
    var isCalledSetupLayout = false
    
    func setupLayout() {
        isCalledSetupLayout = true
    }
}
