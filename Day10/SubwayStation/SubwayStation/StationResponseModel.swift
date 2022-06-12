//
//  StationResponseModel.swift
//  SubwayStation
//
//  Created by kid cherish on 2022/06/12.
//

import Foundation

struct StationResponseModel: Decodable {
    var stations: [Station] { searchInfo.row }
    
    private let searchInfo: SearchInfoBySubwayNameServiceModel
    
    struct SearchInfoBySubwayNameServiceModel: Decodable {
        var row: [Station] = []
    }
    
    enum CodingKeys: String, CodingKey {
        case searchInfo = "SearchInfoBySubwayNameService"
    }
}

struct Station: Decodable {
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey {
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
