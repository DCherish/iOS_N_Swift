//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import UIKit
import SnapKit

final class SearchBookViewController: UIViewController {
    private lazy var presenter = SearchBookPresenter(
        viewController: self,
        delagete: searchBookDelegate
    )
    
    private let searchBookDelegate: SearchBookDelegete
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        
        return tableView
    }()
    
    init(searchBookDelegate: SearchBookDelegete) {
        self.searchBookDelegate = searchBookDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension SearchBookViewController: SearchBookProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dismiss() {
        navigationItem.searchController?.dismiss(animated: true)
        dismiss(animated: true)
    }
    
    func reloadView() {
        tableView.reloadData()
    }
}
