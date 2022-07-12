//
//  FeedViewController.swift
//  Tweet
//
//  Created by kid cherish on 2022/07/12.
//

import Floaty
import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private lazy var floatyButton: Floaty = {
        let button = Floaty(size: 50.0)
        button.sticky = true
        button.handleFirstItemDirectly = true
        button.addItem(title: "") { [weak self] _ in
            self?.presenter.didTapWriteButton()
        }
        button.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        
        tableView.register(
            FeedTableViewCell.self,
            forCellReuseIdentifier: FeedTableViewCell.identifier
        )
        
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

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"
        
        [tableView, floatyButton]
            .forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        floatyButton.paddingY = 100.0
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func moveToTweetViewController(with tweet: Tweet) {
        let tweetViewController = TweetViewController(tweet: tweet)
        
        navigationController?.pushViewController(tweetViewController, animated: true)
    }
    
    func moveToWriteViewController() {
        let writeViewController = UINavigationController(rootViewController: WriteViewController())
        
        writeViewController.modalPresentationStyle = .fullScreen
        
        present(writeViewController, animated: true)
    }
}
