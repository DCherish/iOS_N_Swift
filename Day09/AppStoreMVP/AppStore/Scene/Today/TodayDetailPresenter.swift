//
//  TodayDetailPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit

protocol TodayDetailProtocol: AnyObject {
    func setupViews(today: Today)
    func presentActivityController(today: Today)
}

final class TodayDetailPresenter: NSObject {
    private weak var viewController: TodayDetailProtocol?
    private let today: Today
    
    init (
        viewController: TodayDetailProtocol,
        today: Today
    ) {
        self.viewController = viewController
        self.today = today
    }
    
    func viewDidLoad() {
        viewController.setupViews(today: today)
    }
    
    func actionTapShareButton() {
        viewController.presentActivityController(today: today)
    }
}
