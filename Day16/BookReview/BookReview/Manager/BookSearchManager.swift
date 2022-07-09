//
//  BookSearchManager.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import Foundation
import Alamofire

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping ([Book]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "dKcM9iaE57J_F921Wd2J",
            "X-Naver-Client-Secret": "pGPaxDBMIB"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
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
