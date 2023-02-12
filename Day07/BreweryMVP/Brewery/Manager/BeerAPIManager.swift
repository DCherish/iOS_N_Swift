//
//  BeerAPIManager.swift
//  Brewery
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit
import Alamofire

protocol BeerAPIManagerProtocol {
    func request(
        of page: Int,
        completionHandler: @escaping ([Beer]) -> Void
    )
}

struct BeerAPIManager: BeerAPIManagerProtocol {
    func request(
        of page: Int,
        completionHandler: @escaping ([Beer]) -> Void
    ) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)") else { return }
        
        AF
            .request(url, method: .get, parameters: nil, headers: nil)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result)
                case .failure(let error):
                    print(String(describing: error))
                }
            }
            .resume()
    }
}
