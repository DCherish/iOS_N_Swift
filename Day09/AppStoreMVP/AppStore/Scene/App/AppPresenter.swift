//
//  AppPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol AppProtocol: AnyObject {
    func setupNavigationController()
    func setupLayout()
}

final class AppPresenter: NSObject {
    private weak var viewController: AppProtocol?
    
    init (viewController: AppProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationController()
        viewController.setupLayout()
    }
}
