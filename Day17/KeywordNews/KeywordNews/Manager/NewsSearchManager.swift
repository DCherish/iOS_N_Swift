//
//  NewsSearchManager.swift
//  KeywordNews
//
//  Created by kid cherish on 2022/07/11.
//

import Foundation
import Alamofire

protocol NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        display: Int,
        start: Int,
        completionHandler: @escaping ([News]) -> Void
    )
}

struct NewsSearchManager: NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        display: Int,
        start: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
        
        let parameters = NewsRequestModel(query: keyword, display: display, start: start)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "BQGMFz3Bu4BNHXGaotcA",
            "X-Naver-Client-Secret": "STvdeviHOT"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NewsResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
