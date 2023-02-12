//
//  MockBeerAPIManager.swift
//  BreweryTests
//
//  Created by kid cherish on 2023/02/09.
//

import XCTest
@testable import Brewery

final class MockBeerAPIManager: BeerAPIManagerProtocol {
    var isCalledRequest = false
    
    var needToSuccessRequest = false
    
    func request(
        of page: Int,
        completionHandler: @escaping ([Beer]) -> Void
    ) {
        isCalledRequest = true
        
        if needToSuccessRequest {
            completionHandler([])
        }
    }
}
