//
//  LocalNetworkStub.swift
//  FindCVSTests
//
//  Created by kid cherish on 2022/07/06.
//

import Foundation
import RxSwift
import Stubber

@testable import FindCVS

class LocalNetworkStub: LocalNetwork {
    override func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return Stubber.invoke(getLocation, args: mapPoint)
    }
}
