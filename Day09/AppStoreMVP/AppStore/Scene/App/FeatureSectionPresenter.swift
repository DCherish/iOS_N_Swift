//
//  FeatureSectionPresenter.swift
//  AppStore
//
//  Created by kid cherish on 2023/02/09.
//

import UIKit

protocol FeatureSectionProtocol: AnyObject {
    func setupViews()
    func reloadData()
}

final class FeatureSectionPresenter: NSObject {
    private let view: FeatureSectionProtocol
    
    private var featureList: [Feature] = []
    
    init (view: FeatureSectionProtocol) {
        self.view = view
    }
    
    func setup() {
        view.setupViews()
        
        fetchData()
        view.reloadData()
    }
}

extension FeatureSectionPresenter: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return featureList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FeatureSectionCollectionViewCell.identifier,
            for: indexPath
        ) as? FeatureSectionCollectionViewCell
        
        let feature = featureList[indexPath.item]
        cell?.setup(feature: feature)
        
        return cell ?? UICollectionViewCell()
    }
}

extension FeatureSectionPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: collectionView.frame.width - 32.0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        32.0
    }
}

private extension FeatureSectionPresenter {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Feature", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Feature].self, from: data)
            featureList = result
        } catch {
            
        }
    }
}
