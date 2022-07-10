//
//  MovieReviewUITests.swift
//  MovieReviewUITests
//
//  Created by kid cherish on 2022/07/09.
//

import XCTest

class MovieReviewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        
        app = nil
    }
    
    func test_navigationBar_title이_영화평점으로_설정되어_있는지() {
        let existNavigationBar = app.navigationBars["영화 평점"].exists
        XCTAssertTrue(existNavigationBar)
    }
    
    func test_searchBar가_존재하는지() {
        let existSearchBar = app.navigationBars["영화 평점"]
            .searchFields["Search"].exists
        XCTAssertTrue(existSearchBar)
    }
    
    func test_searchBar에_CancelButton이_존재하는지() {
        let navigationBar = app.navigationBars["영화 평점"]
        navigationBar.searchFields["Search"].tap()
        
        let existSearchBarCancelButton = navigationBar
            .buttons["Cancel"].exists
        XCTAssertTrue(existSearchBarCancelButton)
    }
    
    enum CellData: String {
        case existsMovie = "큐 볼"
        case nonExistsMovie = "라푼젤"
    }
    
    //BDD
    func test_특정_영화가_즐겨찾기_되어_있는지() {
        let existCell = app.collectionViews
            .cells.containing(.staticText, identifier: CellData.existsMovie.rawValue)
            .element
            .exists
        
        XCTAssertTrue(existCell, "\(CellData.existsMovie.rawValue)이라는 영화가 Cell에 존재합니다.")
    }
    
    func test_특정_영화가_즐겨찾기_되어_있지_않는지() {
        let existCell = app.collectionViews
            .cells.containing(.staticText, identifier: CellData.nonExistsMovie.rawValue)
            .element
            .exists
        
        XCTAssertFalse(existCell, "\(CellData.nonExistsMovie.rawValue)이라는 영화가 Cell에 존재하지 않습니다.")
    }
}
