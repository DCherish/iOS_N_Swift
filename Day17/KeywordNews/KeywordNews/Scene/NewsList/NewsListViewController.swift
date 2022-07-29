//
//  NewsListViewController.swift
//  KeywordNews
//
//  Created by kid cherish on 2022/07/11.
//

import SnapKit
import UIKit

class NewsListViewController: UIViewController {
    private lazy var presenter = NewsListPresenter(viewController: self)
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(
            self,
            action: #selector(didCalledRefresh),
            for: .valueChanged
        )
        
        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        
        tableView.register(
            NewsListTableViewCell.self,
            forCellReuseIdentifier: NewsListTableViewCell.identifier
        )
        
        tableView.register(
            NewsListTableViewHeaderView.self,
            forHeaderFooterViewReuseIdentifier: NewsListTableViewHeaderView.identifier
        )
        
        tableView.refreshControl = refreshControl
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        NewsSearchManager()
            .request(from: "아이폰", start: 1, display: 20) { news in
                print(news)
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension NewsListViewController: NewsListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "뉴스"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func moveToNewsWebviewController(with news: News) {
        let newsWebViewController = NewsWebViewController(news: news)
        navigationController?.pushViewController(newsWebViewController, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

private extension NewsListViewController {
    @objc func didCalledRefresh() {
        presenter.didCalledRefresh()
    }
}
