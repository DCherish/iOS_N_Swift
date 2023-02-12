//
//  ExchangeCodeButtonPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol ExchangeCodeButtonProtocol: AnyObject {
    func setupLayout()
}

final class ExchangeCodeButtonPresenter: NSObject {
    private let view: ExchangeCodeButtonProtocol
    
    init (view: ExchangeCodeButtonProtocol) {
        self.view = view
    }
    
    func setup() {
        view.setupLayout()
    }
}
