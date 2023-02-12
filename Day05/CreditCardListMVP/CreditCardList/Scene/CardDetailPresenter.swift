//
//  CardDetailPresenter.swift
//  CreditCardList
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol CardDetailProtocol: AnyObject {
    func setupNavigationBar()
    func setupLayout()
    func playLottieView()
    func setupText(promotionDetail: PromotionDetail)
}

final class CardDetailPresenter: NSObject {
    private weak var viewController: CardDetailProtocol?
    private let promotionDetail: PromotionDetail
    
    init (
        viewController: CardDetailProtocol,
        promotionDetail: PromotionDetail
    ) {
        self.viewController = viewController
        self.promotionDetail = promotionDetail
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupLayout()
        viewController.playLottieView()
    }
    
    func viewWillAppear() {
        viewController.setupText(promotionDetail: promotionDetail)
    }
}
