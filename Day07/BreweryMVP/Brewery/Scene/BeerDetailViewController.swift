//
//  BeerDetailViewController.swift
//  Brewery
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit
import Kingfisher

class BeerDetailViewController: UITableViewController {
    private var presenter: BeerDetailPresenter!
    
    init(beer: Beer) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = BeerDetailPresenter(viewController: self, beer: beer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension BeerDetailViewController: BeerDetailProtocol {
    func setupNavigationBar(name: String?) {
        title = name ?? "이름 없는 맥주"
    }
    
    func setupTableView() {
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "BeerDetailListCell"
        )
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = presenter
    }
    
    func setupLayout(url: String?) {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        let headerView = UIImageView(frame: frame)
        let imageURL = URL(string: url ?? "")
        
        headerView.contentMode = .scaleAspectFit
        headerView.kf.setImage(
            with: imageURL,
            placeholder: UIImage(named: "beer_icon")
        )
        
        tableView.tableHeaderView = headerView
    }
}
