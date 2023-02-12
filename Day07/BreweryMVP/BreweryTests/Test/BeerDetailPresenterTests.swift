//
//  BeerDetailPresenterTests.swift
//  BreweryTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import Brewery

class BeerDetailPresenterTests: XCTestCase {
    var sut: BeerDetailPresenter!
    
    var viewController: MockBeerDetailViewController!
    var beer: Beer!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockBeerDetailViewController()
        beer = Beer(
            id: 0,
            name: "",
            taglineString: "",
            description: "",
            brewersTips: "",
            imageURL: "",
            foodPairing: []
        )
        
        sut = BeerDetailPresenter(
            viewController: viewController,
            beer: beer
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        beer = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupTableView)
        XCTAssertTrue(viewController.isCalledSetupLayout)
    }
}
