//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import UIKit
import SnapKit

final class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension ReviewListViewController: ReviewListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
        
        print("Reload Success")
    }
    
    func presentToReviewWriteViewController() {
        let viewController = UINavigationController(rootViewController: ReviewWriteViewController())
        
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

private extension ReviewListViewController {
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem()
    }
}
