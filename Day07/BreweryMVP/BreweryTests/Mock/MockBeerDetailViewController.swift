//
//  MockBeerDetailViewController.swift
//  BreweryTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import Brewery

final class MockBeerDetailViewController: BeerDetailProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupTableView = false
    var isCalledSetupLayout = false
    
    
    func setupNavigationBar(name: String?) {
        isCalledSetupNavigationBar = true
    }
    
    func setupTableView() {
        isCalledSetupTableView = true
    }
    
    func setupLayout(url: String?) {
        isCalledSetupLayout = true
    }
}
