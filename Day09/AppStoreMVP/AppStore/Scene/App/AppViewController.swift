//
//  AppViewController.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit
import SnapKit

final class AppViewController: UIViewController {
    private lazy var presenter = AppPresenter(viewController: self)
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0.0
        
        let featureSectonView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        
        [
            featureSectonView,
            rankingFeatureSectionView,
            exchangeCodeButtonView
        ]
            .forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension AppViewController: AppProtocol {
    func setupNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
