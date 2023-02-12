//
//  BeerListPersenterTests.swift
//  BreweryTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import Brewery

class BeerListPersenterTests: XCTestCase {
    var sut: BeerListPresenter!
    
    var viewController: MockBeerListViewController!
    var beerAPIManager: MockBeerAPIManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockBeerListViewController()
        beerAPIManager = MockBeerAPIManager()
        
        sut = BeerListPresenter(
            viewController: viewController,
            beerAPIManager: beerAPIManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        beerAPIManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_fecthBeer_Success() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupTableView)
        
        beerAPIManager.needToSuccessRequest = true
        sut.fetchBeer(of: 0)
        
        XCTAssertTrue(viewController.isCalledReloadData)
    }
    
    func test_viewDidLoad_fecthBeer_Fail() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupTableView)
        
        beerAPIManager.needToSuccessRequest = false
        sut.fetchBeer(of: 0)
        
        XCTAssertFalse(viewController.isCalledReloadData)
    }
    
    func test_tableViewDidSelectRowAt() {
        sut.beerList = [
            Beer(
                id: 0,
                name: "",
                taglineString: "",
                description: "",
                brewersTips: "",
                imageURL: "",
                foodPairing: []
            )
        ]
        
        sut.tableView(
            UITableView(),
            didSelectRowAt: IndexPath(item: 0, section: 0)
        )
        
        XCTAssertTrue(viewController.isCalledMoveToBeerDetailView)
    }
}
