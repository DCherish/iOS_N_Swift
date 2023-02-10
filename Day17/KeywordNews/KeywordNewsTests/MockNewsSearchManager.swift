//
//  MockNewsSearchManager.swift
//  KeywordNewsTests
//
//  Created by kid cherish on 2022/07/11.
//

import XCTest

@testable import KeywordNews

final class MockNewsSearchManager: NewsSearchManagerProtocol {
    var error: Error?
    var isCalledRequest = false
    
    func request(
        from keyword: String,
        display: Int,
        start: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        isCalledRequest = true
        
        if error == nil {
            completionHandler([])
        }
    }
}
