//
//  CardListViewController.swift
//  CreditCardList
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

final class CardListViewController: UITableViewController {
    private lazy var presenter = CardListPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension CardListViewController: CardListProtocol {
    func setupNavigationBar() {
        title = "카드 혜택 추천"
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupTableView() {
        tableView.register(
            CreditCardCell.self,
            forCellReuseIdentifier: CreditCardCell.identifier
        )
        
        tableView.dataSource = presenter
        tableView.delegate = presenter
    }
    
    func moveToDetailViewController(detail: PromotionDetail) {
        let viewController = CardDetailViewController(promotionDetail: detail)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
