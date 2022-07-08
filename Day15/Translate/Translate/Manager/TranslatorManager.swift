//
//  TranslatorManager.swift
//  Translate
//
//  Created by kid cherish on 2022/07/08.
//

import Alamofire
import Foundation

struct TranslatorManager {
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en
    
    func translate(
        from text: String,
        completionHandler: @escaping (String) -> Void) {
            guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else { return }
            
            let requestmodel = TranslateRequestModel(
                source: sourceLanguage.languageCode,
                target: targetLanguage.languageCode,
                text: text
            )
            
            let headers: HTTPHeaders = [
                "X-Naver-Client-Id": "iR9hNSYWov0EgiVPLNru",
                "X-Naver-Client-Secret": "YDzgcHSEMM"
            ]
            
            AF.request(url, method: .post, parameters: requestmodel, headers: headers)
                .responseDecodable(of: TranslateResponseModel.self) { response in
                    switch response.result {
                    case .success(let result):
                        completionHandler(result.translatedText)
                    case .failure(let error): return
                        print(error.localizedDescription)
                    }
                }
                .resume()
        }
}
