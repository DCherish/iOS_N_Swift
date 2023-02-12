//
//  TodayViewController.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit
import SnapKit

final class TodayViewController: UIViewController {
    private lazy var presenter = TodayPresenter(viewController: self)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(
            TodayCollectionViewCell.self,
            forCellWithReuseIdentifier: TodayCollectionViewCell.identifier
        )
        collectionView.register(
            TodayCollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TodayCollectionHeaderView.identifier
        )
        
        return collectionView
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

extension TodayViewController: TodayProtocol {
    func setupView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func moveToDetailViewController(today: Today) {
        let viewController = TodayDetailViewController(today: today)
        
        present(viewController, animated: true)
    }
}
