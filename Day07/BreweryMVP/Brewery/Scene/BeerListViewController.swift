//
//  BeerListViewController.swift
//  Brewery
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

final class BeerListViewController: UITableViewController {
    private lazy var presenter = BeerListPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension BeerListViewController: BeerListProtocol {
    func setupNavigationBar() {
        title = "Kid Brewery"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupTableView() {
        tableView.register(
            BeerListCell.self,
            forCellReuseIdentifier: BeerListCell.identifier
        )
        tableView.rowHeight = 150
                
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.prefetchDataSource = presenter
    }
    
    func moveToBeerDetailView(beer: Beer) {
        navigationController?.pushViewController(
            BeerDetailViewController(beer: beer),
            animated: true
        )
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
