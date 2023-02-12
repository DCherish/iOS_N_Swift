//
//  TodayPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/08.
//

import UIKit

protocol TodayProtocol: AnyObject {
    func setupView()
    func reloadData()
    func moveToDetailViewController(today: Today)
}

final class TodayPresenter: NSObject {
    private weak var viewController: TodayProtocol?
//    private var todayList: [Today] = []
    var todayList: [Today] = []
    
    init (viewController: TodayProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupView()
    }
    
    func viewWillAppear() {
        fetchData()
        viewController.reloadData()
    }
}

extension TodayPresenter: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return todayList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TodayCollectionViewCell.identifier,
            for: indexPath
        ) as? TodayCollectionViewCell
        
        let today = todayList[indexPath.item]
        cell?.setup(today: today)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: TodayCollectionHeaderView.identifier,
                for: indexPath
              ) as? TodayCollectionHeaderView else { return UICollectionReusableView() }
        
        header.setupSubViews()
        
        return header
    }
}

extension TodayPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width: CGFloat = collectionView.frame.width - 32.0
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: 100.0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let today = todayList[indexPath.item]
        
        viewController.moveToDetailViewController(today: today)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        16.0
    }
}

private extension TodayPresenter {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Today", withExtension: "plist") else { return }

        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Today].self, from: data)
            todayList = result
        } catch {
            
        }
    }
}
