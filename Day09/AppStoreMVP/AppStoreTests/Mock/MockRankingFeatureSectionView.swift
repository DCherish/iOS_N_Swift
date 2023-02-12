//
//  MockRankingFeatureSectionView.swift
//  AppStoreTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import AppStore

final class MockRankingFeatureSectionView: RankingFeatureSectionProtocol {
    var isCalledSetupViews = false
    var isCalledReloadData = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func reloadData() {
        isCalledReloadData = true
    }
}
