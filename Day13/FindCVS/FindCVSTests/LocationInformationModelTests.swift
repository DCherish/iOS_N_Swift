//
//  LocationInformationModelTests.swift
//  FindCVSTests
//
//  Created by kid cherish on 2022/07/06.
//

import XCTest
import Nimble

@testable import FindCVS

class LocationInformationModelTests: XCTestCase {
    let stubNetwork = LocalNetworkStub()
    
    var doc: [KLDocument]!
    var model: LocationInformationModel!

    override func setUp() {
        self.model = LocationInformationModel(localNetwork: stubNetwork)
        self.doc = cvsList
    }
    
    func testDocumentsToCellData() {
        // 실제 모델의 값
        let cellData = model.documentsToCellData(doc)
        // dummy 값
        let placeName = doc.map { $0.placeName }
        
        // 실제 모델의 값
        let address0 = cellData[1].address
        // dummy 값
        let roadAddressName = doc[1].roadAddressName
        
        expect(cellData.map { $0.placeName }).to(
            equal(placeName),
            description: "DetailListCellData의 placeName은 document의 placeName이다."
        )
        
        expect(address0).to(
            equal(roadAddressName),
            description: "KLDocument의 roadAddressName이 빈 값이 아닐 경우 roadAddress가 cellData에 전달된다."
        )
    }
}
