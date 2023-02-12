//
//  MockBeerListViewController.swift
//  BreweryTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import Brewery

final class MockBeerListViewController: BeerListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupTableView = false
    var isCalledMoveToBeerDetailView = false
    var isCalledReloadData = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupTableView() {
        isCalledSetupTableView = true
    }
    
    func moveToBeerDetailView(beer: Brewery.Beer) {
        isCalledMoveToBeerDetailView = true
    }
    
    func reloadData() {
        isCalledReloadData = true
    }
}
