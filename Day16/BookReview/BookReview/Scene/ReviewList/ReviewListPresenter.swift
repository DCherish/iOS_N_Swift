//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by kid cherish on 2022/07/09.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func reloadTableView()
    func presentToReviewWriteViewController()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var review: [BookReview] = []
    
    init(
        viewController: ReviewListProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(
            with: review.imageURL,
            placeholder: .none
        ) { _ in
            cell.setNeedsLayout()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
